From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 19:02:03 +0200
Subject: [Buildroot] [v3 02/13] download: put most of the infra in
 dl-wrapper
In-Reply-To: <20180331142407.9522-2-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
 <20180331142407.9522-2-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivyW0OXYn0Qqvub_uWQt73gSwd1LY8GeeWEhZCrUOK84kA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't look at the "missing-hash.py" stuff, that's a tool that was
sitting in my tree and should not have been sent. Sorry for that.

On Sat, Mar 31, 2018 at 4:23 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> The goal here is to simplify the infrastructure by putting most of the
> code in the dl-wrapper as it's easier to implement and to read.
>
> Most of the functions were common already, this patch finalizes it by
> making the pkg-download.mk pass all the parameters needed to the
> dl-wrapper which in turns will pass everything to every backend.
>
> The backend will then cherry-pick what it needs from these arguments
> and act accordingly.
>
> It eases the transition to the addition of a sub directory per package
> in the DL_DIR, and later on, a git cache.
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> v1 -> v2:
>     - Rename cp backend to file (Arnout)
>     - Don't use BR_BACKEND_DL_GETOPTS for dl-wrapper (Arnout)
>     - Add "urlencode" to scheme passed to the dl-wrapper to support the
>     fact that we need to urlencode the filename when using PRIMARY and
>     BACKUP mirror (some files are named toto.c?v=1.0) (Arnout)
>     - Fix uristripscheme replaced by bash'ism (Arnout)
>     - Add the check hash into the loop, exit with error only if all the
>     download+check failed. (Arnout)
> ---
>  missing-hash.py               | 145 ++++++++++++++++++++++++++++++++++++
>  package/pkg-download.mk       | 166 ++++++++----------------------------------
>  support/download/cvs          |   2 +-
>  support/download/dl-wrapper   | 108 ++++++++++++++++++---------
>  support/download/{cp => file} |   4 +-
>  support/download/wget         |  10 ++-
>  6 files changed, 258 insertions(+), 177 deletions(-)
>  create mode 100755 missing-hash.py
>  rename support/download/{cp => file} (90%)
>
> diff --git a/missing-hash.py b/missing-hash.py
> new file mode 100755
> index 0000000000..5c8b3435a5
> --- /dev/null
> +++ b/missing-hash.py
> @@ -0,0 +1,145 @@
> +#!/usr/bin/env python
> +# -*- coding: utf-8 -*-
> +
> +import fnmatch
> +import distutils
> +import time
> +import ftplib
> +import glob
> +import logging
> +import os
> +import re
> +import subprocess
> +import sys
> +import urllib2
> +import sysconfig
> +
> +ERR_PROVIDER = ['exception list', 'website not reachable', 'alioth.debian.org']
> +
> +EXCLUDED_PKGS = [
> +        "boot/common.mk",
> +        "linux/linux-ext-fbtft.mk",
> +        "linux/linux-ext-xenomai.mk",
> +        "linux/linux-ext-rtai.mk",
> +        "package/efl/efl.mk",
> +        "package/freescale-imx/freescale-imx.mk",
> +        "package/gcc/gcc.mk",
> +        "package/gstreamer/gstreamer.mk",
> +        "package/gstreamer1/gstreamer1.mk",
> +        "package/gtk2-themes/gtk2-themes.mk",
> +        "package/matchbox/matchbox.mk",
> +        "package/opengl/opengl.mk",
> +        "package/qt5/qt5.mk",
> +        "package/x11r7/x11r7.mk"
> +]
> +
> +class Package(object):
> +
> +    def __init__(self, package_mk_path):
> +        self.mk_path = package_mk_path
> +        self.name = os.path.basename(os.path.splitext(package_mk_path)[0])
> +        self.mk_name = self.name.upper().replace('-', '_')
> +        self.infra = 'unknown'
> +        self.infra_host = False
> +        self.last_version = None
> +        self.hash = False
> +        self.provider = None
> +        self.source = None
> +        self.site = None
> +        self.version = None
> +
> +        data = sysconfig._parse_makefile(package_mk_path)
> +        for k in ["SITE", "SOURCE", "VERSION", "LICENSE_FILES", "LICENSE"]:
> +            k_name = "%s_%s" % (self.mk_name, k)
> +            if k_name in data.keys():
> +                value = None if data[k_name] == "" else data[k_name]
> +                setattr(self, k.lower(), value)
> +
> +        if "package/qt5/" in self.mk_path:
> +                data = sysconfig._parse_makefile("package/qt5/qt5.mk")
> +                self.version = data["QT5_VERSION"]
> +
> +        if "package/efl/" in self.mk_path:
> +                data = sysconfig._parse_makefile("package/efl/efl.mk")
> +                self.version = data["EFL_VERSION"]
> +
> +        with open(package_mk_path) as f:
> +            # Everything we could not obtain through the parsing of the mk
> +            # files will get obtained here.
> +            for line in f.readlines():
> +                if "%s_VERSION" % self.mk_name in line and\
> +                   self.version is None:
> +                        if "$" in line:
> +                                continue
> +                        self.version = line[line.rindex('=')+1:].strip()
> +
> +                if "-package)" not in line:
> +                    continue
> +                self.infra = line[line.rindex('(')+1:-2]
> +                if "host" in self.infra:
> +                    self.infra_host = True
> +                self.infra = self.infra[:self.infra.rindex('-')]
> +
> +        if "$" in str(self.version):
> +                self.version = None
> +
> +        self.hash_file = "%s.hash" % os.path.splitext(package_mk_path)[0]
> +        if os.path.exists(self.hash_file):
> +            self.hash = True
> +
> +        self.provider = self.get_provider()
> +
> +    def get_provider(self):
> +        if self.site is None:
> +            return None
> +
> +        if "github" in self.site:
> +            return "github"
> +        elif "sourceforge" in self.site:
> +            return "sourceforge"
> +
> +if __name__ == '__main__':
> +    matches = []
> +    for dir in ["boot", "linux", "package"]:
> +        for root, _, filenames in os.walk(dir):
> +            for filename in fnmatch.filter(filenames, '*.mk'):
> +                path = os.path.join(root, filename)
> +                if os.path.dirname(path) in dir:
> +                    continue
> +                matches.append(path)
> +
> +    print "#!/bin/sh"
> +
> +    matches.sort()
> +    packages = []
> +    count = 0
> +    for mk_path in matches:
> +
> +        if mk_path in EXCLUDED_PKGS:
> +            continue
> +
> +        pkg = Package(mk_path)
> +
> +        if pkg is None:
> +            continue
> +
> +        if pkg.hash is False:
> +            if pkg.site is not None and "github" not in pkg.site:
> +                if len(str(pkg.version)) >= 40:
> +                    continue
> +                print "make %s-source" % pkg.name
> +                print "my_file=$(find dl/ -type f)"
> +                print "touch %s" % pkg.hash_file
> +                print "echo '# Locally computed' >> %s" % pkg.hash_file
> +                print "output=$(sha256sum \"$my_file\")"
> +                print "sha256=$(echo $output | awk '{print $1}')"
> +                print "filename=$(echo $output | awk '{print $2}' | cut -d'/' -f2)"
> +                print "echo \"sha256 $sha256 $filename\" >> %s" % pkg.hash_file
> +                print "git add %s" % pkg.hash_file
> +                print "git commit -s -m \"package/%s: add hash file\"" % pkg.name
> +                print "make %s-dirclean" % pkg.name
> +                print "rm -Rf dl"
> +                print ""
> +                count += 1
> +
> +    print count
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index ce069b9926..14ea4ff361 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -42,6 +42,8 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
>  #
>  # geturischeme: http
>  geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
> +# getschemeplusuri: git|parameter+http://example.com
> +getschemeplusuri = $(call geturischeme,$(1))$(if $(2),\|$(2))+$(1)
>  # stripurischeme: www.example.com/dir/file
>  stripurischeme = $(lastword $(subst ://, ,$(call qstrip,$(1))))
>  # domain: www.example.com
> @@ -61,152 +63,42 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
>  export BR_NO_CHECK_HASH_FOR =
>
>  ################################################################################
> -# The DOWNLOAD_* helpers are in charge of getting a working copy
> -# of the source repository for their corresponding SCM,
> -# checking out the requested version / commit / tag, and create an
> -# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
> -# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
> -# mechanism.
> +# DOWNLOAD -- Download helper. Will call DL_WRAPPER which will try to download
> +# source from:
> +# 1) BR2_PRIMARY_SITE if enabled
> +# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
> +# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> +#
> +# Argument 1 is the source location
>  #
>  ################################################################################
>
> -define DOWNLOAD_GIT
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b git \
> -               -o $(DL_DIR)/$($(PKG)_SOURCE) \
> -               $(if $($(PKG)_GIT_SUBMODULES),-r) \
> -               -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> -               $(QUIET) \
> -               -- \
> -               -u $($(PKG)_SITE) \
> -               -c $($(PKG)_DL_VERSION) \
> -               -n $($(PKG)_RAW_BASE_NAME) \
> -               $($(PKG)_DL_OPTS)
> -endef
> -
> -define DOWNLOAD_BZR
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
> -               -o $(DL_DIR)/$($(PKG)_SOURCE) \
> -               $(QUIET) \
> -               -- \
> -               -u $($(PKG)_SITE) \
> -               -c $($(PKG)_DL_VERSION) \
> -               -n $($(PKG)_RAW_BASE_NAME) \
> -               $($(PKG)_DL_OPTS)
> -endef
> +ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
> +DOWNLOAD_URIS += \
> +       -u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
> +endif
>
> -define DOWNLOAD_CVS
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
> -               -o $(DL_DIR)/$($(PKG)_SOURCE) \
> -               $(QUIET) \
> -               -- \
> -               -u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
> -               -c $($(PKG)_DL_VERSION) \
> -               -N $($(PKG)_RAWNAME) \
> -               -n $($(PKG)_RAW_BASE_NAME) \
> -               $($(PKG)_DL_OPTS)
> -endef
> +ifeq ($(BR2_PRIMARY_SITE_ONLY),)
> +DOWNLOAD_URIS += \
> +       -u $($(PKG)_SITE_METHOD)+$(dir $(1))
> +ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
> +DOWNLOAD_URIS += \
> +       -u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
> +endif
> +endif
>
> -define DOWNLOAD_SVN
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b svn \
> -               -o $(DL_DIR)/$($(PKG)_SOURCE) \
> -               $(QUIET) \
> -               -- \
> -               -u $($(PKG)_SITE) \
> +define DOWNLOAD
> +       $(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
> +       $(EXTRA_ENV) $(DL_WRAPPER) \
>                 -c $($(PKG)_DL_VERSION) \
> -               -n $($(PKG)_RAW_BASE_NAME) \
> -               $($(PKG)_DL_OPTS)
> -endef
> -
> -# SCP URIs should be of the form scp://[user@]host:filepath
> -# Note that filepath is relative to the user's home directory, so you may want
> -# to prepend the path with a slash: scp://[user@]host:/absolutepath
> -define DOWNLOAD_SCP
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b scp \
> -               -o $(DL_DIR)/$(2) \
> +               -f $(notdir $(1)) \
>                 -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> -               $(QUIET) \
> -               -- \
> -               -u '$(call stripurischeme,$(call qstrip,$(1)))' \
> -               $($(PKG)_DL_OPTS)
> -endef
> -
> -define DOWNLOAD_HG
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b hg \
> -               -o $(DL_DIR)/$($(PKG)_SOURCE) \
> -               $(QUIET) \
> -               -- \
> -               -u $($(PKG)_SITE) \
> -               -c $($(PKG)_DL_VERSION) \
>                 -n $($(PKG)_RAW_BASE_NAME) \
> -               $($(PKG)_DL_OPTS)
> -endef
> -
> -define DOWNLOAD_WGET
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b wget \
> -               -o $(DL_DIR)/$(2) \
> -               -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> -               $(QUIET) \
> -               -- \
> -               -u '$(call qstrip,$(1))' \
> -               $($(PKG)_DL_OPTS)
> -endef
> -
> -define DOWNLOAD_LOCALFILES
> -       $(EXTRA_ENV) $(DL_WRAPPER) -b cp \
> -               -o $(DL_DIR)/$(2) \
> -               -H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> +               -N $($(PKG)_RAWNAME) \
> +               -o $(DL_DIR)/$(notdir $(1)) \
> +               $(if $($(PKG)_GIT_SUBMODULES),-r) \
> +               $(DOWNLOAD_URIS) \
>                 $(QUIET) \
>                 -- \
> -               -u $(call stripurischeme,$(call qstrip,$(1))) \
>                 $($(PKG)_DL_OPTS)
>  endef
> -
> -################################################################################
> -# DOWNLOAD -- Download helper. Will try to download source from:
> -# 1) BR2_PRIMARY_SITE if enabled
> -# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
> -# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
> -#
> -# Argument 1 is the source location
> -#
> -# E.G. use like this:
> -# $(call DOWNLOAD,$(FOO_SITE))
> -#
> -# For PRIMARY and BACKUP site, any ? in the URL is replaced by %3F. A ? in
> -# the URL is used to separate query arguments, but the PRIMARY and BACKUP
> -# sites serve just plain files.
> -################################################################################
> -
> -define DOWNLOAD
> -       $(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
> -endef
> -
> -define DOWNLOAD_INNER
> -       $(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
> -       if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
> -               case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
> -                       file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
> -                       scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
> -                       *) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ;; \
> -               esac ; \
> -       fi ; \
> -       if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
> -               exit 1 ; \
> -       fi ; \
> -       if test -n "$(1)" ; then \
> -               case "$($(PKG)_SITE_METHOD)" in \
> -                       git) $($(3)_GIT) && exit ;; \
> -                       svn) $($(3)_SVN) && exit ;; \
> -                       cvs) $($(3)_CVS) && exit ;; \
> -                       bzr) $($(3)_BZR) && exit ;; \
> -                       file) $($(3)_LOCALFILES) && exit ;; \
> -                       scp) $($(3)_SCP) && exit ;; \
> -                       hg) $($(3)_HG) && exit ;; \
> -                       *) $(call $(3)_WGET,$(1),$(2)) && exit ;; \
> -               esac ; \
> -       fi ; \
> -       if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
> -               $(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ; \
> -       fi ; \
> -       exit 1
> -endef
> diff --git a/support/download/cvs b/support/download/cvs
> index 69d5c71f28..3f77b849e4 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -21,7 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-Q;;
>      o)  output="${OPTARG}";;
> -    u)  uri="${OPTARG}";;
> +    u)  uri="${OPTARG#*://}";;
>      c)  rev="${OPTARG}";;
>      N)  rawname="${OPTARG}";;
>      n)  basename="${OPTARG}";;
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 510e7ef852..67e9742767 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -19,31 +19,34 @@
>  # We want to catch any unexpected failure, and exit immediately.
>  set -e
>
> -export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:q"
> +export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:e"
>
>  main() {
>      local OPT OPTARG
>      local backend output hfile recurse quiet
> +    local -a uris
>
>      # Parse our options; anything after '--' is for the backend
> -    while getopts :hb:o:H:rq OPT; do
> +    while getopts ":hc:o:n:N:H:rf:u:q" OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
> -        b)  backend="${OPTARG}";;
> +        c)  cset="${OPTARG}";;
>          o)  output="${OPTARG}";;
> +        n)  raw_base_name="${OPTARG}";;
> +        N)  base_name="${OPTARG}";;
>          H)  hfile="${OPTARG}";;
>          r)  recurse="-r";;
> +        f)  filename="${OPTARG}";;
> +        u)  uris+=( "${OPTARG}" );;
>          q)  quiet="-q";;
>          :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>          \?) error "unknown option '%s'\n" "${OPTARG}";;
>          esac
>      done
> +
>      # Forget our options, and keep only those for the backend
>      shift $((OPTIND-1))
>
> -    if [ -z "${backend}" ]; then
> -        error "no backend specified, use -b\n"
> -    fi
>      if [ -z "${output}" ]; then
>          error "no output specified, use -o\n"
>      fi
> @@ -77,28 +80,64 @@ main() {
>      tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
>      tmpf="${tmpd}/output"
>
> -    # Helpers expect to run in a directory that is *really* trashable, so
> -    # they are free to create whatever files and/or sub-dirs they might need.
> -    # Doing the 'cd' here rather than in all backends is easier.
> -    cd "${tmpd}"
> -
> -    # If the backend fails, we can just remove the temporary directory to
> -    # remove all the cruft it may have left behind. Then we just exit in
> -    # error too.
> -    if ! "${OLDPWD}/support/download/${backend}" \
> -            ${quiet} ${recurse} \
> -            -o "${tmpf}" "${@}"
> -    then
> -        rm -rf "${tmpd}"
> -        exit 1
> -    fi
> +    # Look through all the uris that we were given to downoad the package
> +    # source
> +    download_and_check=0
> +    for uri in "${uris[@]}"; do
> +        backend=${uri%+*}
> +        case "${backend}" in
> +            git|svn|cvs|bzr|file|scp|hg) ;;
> +            *) backend="wget" ;;
> +        esac
> +        uri=${uri#*+}
> +
> +        urlencode=${backend#*|}
> +        # urlencode must be "urlencode"
> +        [ "${urlencode}" != "urlencode" ] && urlencode=""
> +
> +        # Helpers expect to run in a directory that is *really* trashable, so
> +        # they are free to create whatever files and/or sub-dirs they might need.
> +        # Doing the 'cd' here rather than in all backends is easier.
> +        cd "${tmpd}"
> +
> +        # If the backend fails, we can just remove the content of the temporary
> +        # directory to remove all the cruft it may have left behind, and tries
> +        # the next URI until it succeeds. Once out of URI to tries, we need to
> +        # cleanup and exit.
> +        if ! "${OLDPWD}/support/download/${backend}" \
> +                $([ -n "${urlencode}" ] && printf %s '-e') \
> +                -c "${cset}" \
> +                -n "${raw_base_name}" \
> +                -N "${raw_name}" \
> +                -f "${filename}" \
> +                -u "${uri}" \
> +                -o "${tmpf}" \
> +                ${quiet} ${recurse} "${@}"
> +        then
> +            rm -rf "${tmpd:?}/*"
> +            # cd back to keep path coherence
> +            cd "${OLDPWD}"
> +            continue
> +        fi
>
> -    # cd back to free the temp-dir, so we can remove it later
> -    cd "${OLDPWD}"
> +        # cd back to free the temp-dir, so we can remove it later
> +        cd "${OLDPWD}"
>
> -    # Check if the downloaded file is sane, and matches the stored hashes
> -    # for that file
> -    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> +        # Check if the downloaded file is sane, and matches the stored hashes
> +        # for that file
> +        if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
> +            rm -rf "${tmpd:?}/*"
> +            # cd back to keep path coherence
> +            cd "${OLDPWD}"
> +            continue
> +        fi
> +        download_and_check=1
> +        break
> +    done
> +
> +    # We tried every URI possible, none seems to work or to check against the
> +    # available hash. *ABORT MISSION*
> +    if [ "${download_and_check}" -eq 0 ]; then
>          rm -rf "${tmpd}"
>          exit 1
>      fi
> @@ -164,16 +203,13 @@ DESCRIPTION
>
>      -h  This help text.
>
> -    -b BACKEND
> -        Wrap the specified BACKEND. Known backends are:
> -            bzr     Bazaar
> -            cp      Local files
> -            cvs     Concurrent Versions System
> -            git     Git
> -            hg      Mercurial
> -            scp     Secure copy
> -            svn     Subversion
> -            wget    HTTP download
> +    -u URIs
> +        The URI to get the file from, the URI must respect the format given in
> +        the example.
> +        You may give as many '-u URI' as you want, the script will stop at the
> +        frist successful download.
> +
> +        Example: backend+URI; git+http://example.com or http+http://example.com
>
>      -o FILE
>          Store the downloaded archive in FILE.
> diff --git a/support/download/cp b/support/download/file
> similarity index 90%
> rename from support/download/cp
> rename to support/download/file
> index 52fe2de83d..a3e616a181 100755
> --- a/support/download/cp
> +++ b/support/download/file
> @@ -3,7 +3,7 @@
>  # We want to catch any unexpected failure, and exit immediately
>  set -e
>
> -# Download helper for cp, to be called from the download wrapper script
> +# Download helper for file, to be called from the download wrapper script
>  #
>  # Options:
>  #   -q          Be quiet.
> @@ -23,7 +23,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=;;
>      o)  output="${OPTARG}";;
> -    u)  source="${OPTARG}";;
> +    u)  source="${OPTARG#*://}";;
>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
> diff --git a/support/download/wget b/support/download/wget
> index fece6663ca..c69e6071aa 100755
> --- a/support/download/wget
> +++ b/support/download/wget
> @@ -8,7 +8,9 @@ set -e
>  # Options:
>  #   -q          Be quiet.
>  #   -o FILE     Save into file FILE.
> +#   -f FILENAME The filename of the tarball to get at URL
>  #   -u URL      Download file at URL.
> +#   -e ENCODE   Tell wget to urlencode the filename passed to it
>  #
>  # Environment:
>  #   WGET     : the wget command to call
> @@ -18,7 +20,9 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
>      case "${OPT}" in
>      q)  verbose=-q;;
>      o)  output="${OPTARG}";;
> +    f)  filename="${OPTARG}";;
>      u)  url="${OPTARG}";;
> +    e)  encode="-e";;
>      :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
>      \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
>      esac
> @@ -32,4 +36,8 @@ _wget() {
>      eval ${WGET} "${@}"
>  }
>
> -_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
> +# Replace every '?' with '%3F' in the filename; only for the PRIMARY and BACKUP
> +# mirror
> +[ -n "${encode}" ] && filename=${filename//\?/%3F}
> +
> +_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
> --
> 2.16.2
>
