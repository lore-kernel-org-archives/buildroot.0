From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 10:14:23 +0200
Subject: [Buildroot] [v4 02/13] download: put most of the infra in dl-wrapper
In-Reply-To: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402081434.4411-2-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The goal here is to simplify the infrastructure by putting most of the
code in the dl-wrapper as it's easier to implement and to read.

Most of the functions were common already, this patch finalizes it by
making the pkg-download.mk pass all the parameters needed to the
dl-wrapper which in turns will pass everything to every backend.

The backend will then cherry-pick what it needs from these arguments
and act accordingly.

It eases the transition to the addition of a sub directory per package
in the DL_DIR, and later on, a git cache.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
v1 -> v2:
    - Rename cp backend to file (Arnout)
    - Don't use BR_BACKEND_DL_GETOPTS for dl-wrapper (Arnout)
    - Add "urlencode" to scheme passed to the dl-wrapper to support the
    fact that we need to urlencode the filename when using PRIMARY and
    BACKUP mirror (some files are named toto.c?v=1.0) (Arnout)
    - Fix uristripscheme replaced by bash'ism (Arnout)
    - Add the check hash into the loop, exit with error only if all the
    download+check failed. (Arnout)
---
 package/pkg-download.mk     | 170 ++++++++------------------------------------
 support/download/cvs        |   2 +-
 support/download/dl-wrapper | 139 +++++++++++++++++++++++-------------
 support/download/wget       |  10 ++-
 4 files changed, 129 insertions(+), 192 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a410dce1ee..2ee745fddd 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -42,6 +42,8 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
 #
 # geturischeme: http
 geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
+# getschemeplusuri: git|parameter+http://example.com
+getschemeplusuri = $(call geturischeme,$(1))$(if $(2),\|$(2))+$(1)
 # stripurischeme: www.example.com/dir/file
 stripurischeme = $(lastword $(subst ://, ,$(call qstrip,$(1))))
 # domain: www.example.com
@@ -61,152 +63,42 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 export BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
-# The DOWNLOAD_* helpers are in charge of getting a working copy
-# of the source repository for their corresponding SCM,
-# checking out the requested version / commit / tag, and create an
-# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
-# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
-# mechanism.
-#
-################################################################################
-
-define DOWNLOAD_GIT
-	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
-		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_BASENAME_RAW) \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_BZR
-	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
-		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_BASENAME_RAW) \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_CVS
-	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-		-c $($(PKG)_DL_VERSION) \
-		-N $($(PKG)_RAWNAME) \
-		-n $($(PKG)_BASENAME_RAW) \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_SVN
-	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
-		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_BASENAME_RAW) \
-		$($(PKG)_DL_OPTS)
-endef
-
-# SCP URIs should be of the form scp://[user@]host:filepath
-# Note that filepath is relative to the user's home directory, so you may want
-# to prepend the path with a slash: scp://[user@]host:/absolutepath
-define DOWNLOAD_SCP
-	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
-		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		$(QUIET) \
-		-- \
-		-u '$(call stripurischeme,$(call qstrip,$(1)))' \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_HG
-	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
-		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_BASENAME_RAW) \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_WGET
-	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
-		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		$(QUIET) \
-		-- \
-		-u '$(call qstrip,$(1))' \
-		$($(PKG)_DL_OPTS)
-endef
-
-define DOWNLOAD_LOCALFILES
-	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
-		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		$(QUIET) \
-		-- \
-		-u $(call stripurischeme,$(call qstrip,$(1))) \
-		$($(PKG)_DL_OPTS)
-endef
-
-################################################################################
-# DOWNLOAD -- Download helper. Will try to download source from:
+# DOWNLOAD -- Download helper. Will call DL_WRAPPER which will try to download
+# source from:
 # 1) BR2_PRIMARY_SITE if enabled
 # 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
 # 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
 #
 # Argument 1 is the source location
 #
-# E.G. use like this:
-# $(call DOWNLOAD,$(FOO_SITE))
-#
-# For PRIMARY and BACKUP site, any ? in the URL is replaced by %3F. A ? in
-# the URL is used to separate query arguments, but the PRIMARY and BACKUP
-# sites serve just plain files.
 ################################################################################
 
+ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
+DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
+endif
+
+ifeq ($(BR2_PRIMARY_SITE_ONLY),)
+DOWNLOAD_URIS += \
+	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
+ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
+DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
+endif
+endif
+
 define DOWNLOAD
-	$(call DOWNLOAD_INNER,$(1),$(notdir $(1)),DOWNLOAD)
-endef
-
-define DOWNLOAD_INNER
-	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(2);) \
-	if test -n "$(call qstrip,$(BR2_PRIMARY_SITE))" ; then \
-		case "$(call geturischeme,$(BR2_PRIMARY_SITE))" in \
-			file) $(call $(3)_LOCALFILES,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
-			scp) $(call $(3)_SCP,$(BR2_PRIMARY_SITE)/$(2),$(2)) && exit ;; \
-			*) $(call $(3)_WGET,$(BR2_PRIMARY_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ;; \
-		esac ; \
-	fi ; \
-	if test "$(BR2_PRIMARY_SITE_ONLY)" = "y" ; then \
-		exit 1 ; \
-	fi ; \
-	if test -n "$(1)" ; then \
-		case "$($(PKG)_SITE_METHOD)" in \
-			git) $($(3)_GIT) && exit ;; \
-			svn) $($(3)_SVN) && exit ;; \
-			cvs) $($(3)_CVS) && exit ;; \
-			bzr) $($(3)_BZR) && exit ;; \
-			file) $($(3)_LOCALFILES) && exit ;; \
-			scp) $($(3)_SCP) && exit ;; \
-			hg) $($(3)_HG) && exit ;; \
-			*) $(call $(3)_WGET,$(1),$(2)) && exit ;; \
-		esac ; \
-	fi ; \
-	if test -n "$(call qstrip,$(BR2_BACKUP_SITE))" ; then \
-		$(call $(3)_WGET,$(BR2_BACKUP_SITE)/$(subst ?,%3F,$(2)),$(2)) && exit ; \
-	fi ; \
-	exit 1
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
+	$(EXTRA_ENV) $(DL_WRAPPER) \
+		-c $($(PKG)_DL_VERSION) \
+		-f $(notdir $(1)) \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
+		-n $($(PKG)_BASENAME_RAW) \
+		-N $($(PKG)_RAWNAME) \
+		-o $(DL_DIR)/$(notdir $(1)) \
+		$(if $($(PKG)_GIT_SUBMODULES),-r) \
+		$(DOWNLOAD_URIS) \
+		$(QUIET) \
+		-- \
+		$($(PKG)_DL_OPTS)
 endef
diff --git a/support/download/cvs b/support/download/cvs
index 69d5c71f28..3f77b849e4 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -21,7 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-Q;;
     o)  output="${OPTARG}";;
-    u)  uri="${OPTARG}";;
+    u)  uri="${OPTARG#*://}";;
     c)  rev="${OPTARG}";;
     N)  rawname="${OPTARG}";;
     n)  basename="${OPTARG}";;
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index abc51f637a..58cc04b4c4 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,31 +19,34 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:q"
+export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
     local backend output hfile recurse quiet rc
+    local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts :hb:o:H:rq OPT; do
+    while getopts ":hc:o:n:N:H:rf:u:q" OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
-        b)  backend="${OPTARG}";;
+        c)  cset="${OPTARG}";;
         o)  output="${OPTARG}";;
+        n)  raw_base_name="${OPTARG}";;
+        N)  base_name="${OPTARG}";;
         H)  hfile="${OPTARG}";;
         r)  recurse="-r";;
+        f)  filename="${OPTARG}";;
+        u)  uris+=( "${OPTARG}" );;
         q)  quiet="-q";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
     done
+
     # Forget our options, and keep only those for the backend
     shift $((OPTIND-1))
 
-    if [ -z "${backend}" ]; then
-        error "no backend specified, use -b\n"
-    fi
     if [ -z "${output}" ]; then
         error "no output specified, use -o\n"
     fi
@@ -66,48 +69,85 @@ main() {
         warn "Re-downloading '%s'...\n" "${output##*/}"
     fi
 
-    # tmpd is a temporary directory in which backends may store intermediate
-    # by-products of the download.
-    # tmpf is the file in which the backends should put the downloaded content.
-    # tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
-    # $(BR2_DL_DIR)
-    # We let the backends create tmpf, so they are able to set whatever
-    # permission bits they want (although we're only really interested in
-    # the executable bit.)
-    tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
-    tmpf="${tmpd}/output"
+    # Look through all the uris that we were given to downoad the package
+    # source
+    download_and_check=0
+    rc=1
+    for uri in "${uris[@]}"; do
+        backend=${uri%+*}
+        case "${backend}" in
+            git|svn|cvs|bzr|file|scp|hg) ;;
+            *) backend="wget" ;;
+        esac
+        uri=${uri#*+}
 
-    # Helpers expect to run in a directory that is *really* trashable, so
-    # they are free to create whatever files and/or sub-dirs they might need.
-    # Doing the 'cd' here rather than in all backends is easier.
-    cd "${tmpd}"
+        urlencode=${backend#*|}
+        # urlencode must be "urlencode"
+        [ "${urlencode}" != "urlencode" ] && urlencode=""
 
-    # If the backend fails, we can just remove the temporary directory to
-    # remove all the cruft it may have left behind. Then we just exit in
-    # error too.
-    if ! "${OLDPWD}/support/download/${backend}" \
-            ${quiet} ${recurse} \
-            -o "${tmpf}" "${@}"
-    then
-        rm -rf "${tmpd}"
-        exit 1
-    fi
+        # tmpd is a temporary directory in which backends may store
+        # intermediate by-products of the download.
+        # tmpf is the file in which the backends should put the downloaded
+        # content.
+        # tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
+        # $(BR2_DL_DIR)
+        # We let the backends create tmpf, so they are able to set whatever
+        # permission bits they want (although we're only really interested in
+        # the executable bit.)
+        tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
+        tmpf="${tmpd}/output"
 
-    # cd back to free the temp-dir, so we can remove it later
-    cd "${OLDPWD}"
+        # Helpers expect to run in a directory that is *really* trashable, so
+        # they are free to create whatever files and/or sub-dirs they might need.
+        # Doing the 'cd' here rather than in all backends is easier.
+        cd "${tmpd}"
 
-    # Check if the downloaded file is sane, and matches the stored hashes
-    # for that file
-    if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
-        rc=0
-    else
-        if [ ${?} -ne 3 ]; then
+        # If the backend fails, we can just remove the content of the temporary
+        # directory to remove all the cruft it may have left behind, and tries
+        # the next URI until it succeeds. Once out of URI to tries, we need to
+        # cleanup and exit.
+        if ! "${OLDPWD}/support/download/${backend}" \
+                $([ -n "${urlencode}" ] && printf %s '-e') \
+                -c "${cset}" \
+                -n "${raw_base_name}" \
+                -N "${raw_name}" \
+                -f "${filename}" \
+                -u "${uri}" \
+                -o "${tmpf}" \
+                ${quiet} ${recurse} "${@}"
+        then
             rm -rf "${tmpd}"
-            exit 1
+            # cd back to keep path coherence
+            cd "${OLDPWD}"
+            continue
         fi
 
-        # the hash file exists and there was no hash to check the file against
-        rc=1
+        # cd back to free the temp-dir, so we can remove it later
+        cd "${OLDPWD}"
+
+        # Check if the downloaded file is sane, and matches the stored hashes
+        # for that file
+        if support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+            rc=0
+        else
+            if [ ${?} -ne 3 ]; then
+                rm -rf "${tmpd}"
+                continue
+            fi
+
+            # the hash file exists and there was no hash to check the file
+            # against
+            rc=1
+        fi
+        download_and_check=1
+        break
+    done
+
+    # We tried every URI possible, none seems to work or to check against the
+    # available hash. *ABORT MISSION*
+    if [ "${download_and_check}" -eq 0 ]; then
+        rm -rf "${tmpd}"
+        exit 1
     fi
 
     # tmp_output is in the same directory as the final output, so we can
@@ -173,16 +213,13 @@ DESCRIPTION
 
     -h  This help text.
 
-    -b BACKEND
-        Wrap the specified BACKEND. Known backends are:
-            bzr     Bazaar
-            cp      Local files
-            cvs     Concurrent Versions System
-            git     Git
-            hg      Mercurial
-            scp     Secure copy
-            svn     Subversion
-            wget    HTTP download
+    -u URIs
+        The URI to get the file from, the URI must respect the format given in
+        the example.
+        You may give as many '-u URI' as you want, the script will stop at the
+        frist successful download.
+
+        Example: backend+URI; git+http://example.com or http+http://example.com
 
     -o FILE
         Store the downloaded archive in FILE.
diff --git a/support/download/wget b/support/download/wget
index fece6663ca..c69e6071aa 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,7 +8,9 @@ set -e
 # Options:
 #   -q          Be quiet.
 #   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
+#   -e ENCODE   Tell wget to urlencode the filename passed to it
 #
 # Environment:
 #   WGET     : the wget command to call
@@ -18,7 +20,9 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
     o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
+    e)  encode="-e";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
@@ -32,4 +36,8 @@ _wget() {
     eval ${WGET} "${@}"
 }
 
-_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
+# Replace every '?' with '%3F' in the filename; only for the PRIMARY and BACKUP
+# mirror
+[ -n "${encode}" ] && filename=${filename//\?/%3F}
+
+_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
-- 
2.16.2
