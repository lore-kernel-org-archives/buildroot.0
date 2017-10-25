From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:53 +0200
Subject: [Buildroot] [PATCH v2 03/13] download: put most of the infra in
	dl-wrapper
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

The goal here is to simplify the infrastructure by putting most of the
code in the dl-wrapper as it's easier to implement and to read.

Most of the function where common already, this patch finalizes it by
making the pkg-download.mk pass all the parameters needed to the
dl-wrapper which in turns will pass everything to every backend.

The backend will then cherry-pick what it needs from these arguments
and act accordingly.

It eases the transition to the addition of a sub directory per package
in the DL_DIR, and later on, a git cache.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/5ade24239ae84259711170c0ec9fe7384baaddd4.patch
  - change getschemeplusuri from git+http://example.com to git|paremetr+http://example.com
  - use urlencode
  - rename support/download/cp to support/download/file
  - fixes some typos
---
 package/pkg-download.mk       | 166 ++++++++----------------------------------
 support/download/cvs          |   2 +-
 support/download/dl-wrapper   | 108 ++++++++++++++++++---------
 support/download/{cp => file} |   4 +-
 support/download/wget         |  10 ++-
 5 files changed, 113 insertions(+), 177 deletions(-)
 rename support/download/{cp => file} (90%)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 4d724e7494..233a9fafc7 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -42,6 +42,8 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
 #
 # geturischeme: http
 geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
+# getschemeplusuri: git|paremetr+http://example.com
+getschemeplusuri = $(call geturischeme,$(1))$(if $(2),\|$(2))+$(1)
 # stripurischeme: www.example.com/dir/file
 stripurischeme = $(lastword $(subst ://, ,$(call qstrip,$(1))))
 # domain: www.example.com
@@ -61,152 +63,42 @@ github = https://github.com/$(1)/$(2)/archive/$(or $(3),$($(call UPPERCASE,$(pkg
 export BR_NO_CHECK_HASH_FOR =
 
 ################################################################################
-# The DOWNLOAD_* helpers are in charge of getting a working copy
-# of the source repository for their corresponding SCM,
-# checking out the requested version / commit / tag, and create an
-# archive out of it. DOWNLOAD_SCP uses scp to obtain a remote file with
-# ssh authentication. DOWNLOAD_WGET is the normal wget-based download
-# mechanism.
+# DOWNLOAD -- Download helper. Will call DL_WRAPPER which will try to download
+# source from:
+# 1) BR2_PRIMARY_SITE if enabled
+# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
+# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
+#
+# Argument 1 is the source location
 #
 ################################################################################
 
-define DOWNLOAD_GIT
-	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(if $($(PKG)_GIT_SUBMODULES),-r) \
-		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
-		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_RAW_BASE_NAME) \
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
-		-n $($(PKG)_RAW_BASE_NAME) \
-		$($(PKG)_DL_OPTS)
-endef
+ifneq ($(call qstrip,$(BR2_PRIMARY_SITE)),)
+DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE),urlencode)
+endif
 
-define DOWNLOAD_CVS
-	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
-		-c $($(PKG)_DL_VERSION) \
-		-N $($(PKG)_RAWNAME) \
-		-n $($(PKG)_RAW_BASE_NAME) \
-		$($(PKG)_DL_OPTS)
-endef
+ifeq ($(BR2_PRIMARY_SITE_ONLY),)
+DOWNLOAD_URIS += \
+	-u $($(PKG)_SITE_METHOD)+$(dir $(1))
+ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
+DOWNLOAD_URIS += \
+	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE),urlencode)
+endif
+endif
 
-define DOWNLOAD_SVN
-	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
+define DOWNLOAD
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
+	$(EXTRA_ENV) $(DL_WRAPPER) \
 		-c $($(PKG)_DL_VERSION) \
-		-n $($(PKG)_RAW_BASE_NAME) \
-		$($(PKG)_DL_OPTS)
-endef
-
-# SCP URIs should be of the form scp://[user@]host:filepath
-# Note that filepath is relative to the user's home directory, so you may want
-# to prepend the path with a slash: scp://[user@]host:/absolutepath
-define DOWNLOAD_SCP
-	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
-		-o $(DL_DIR)/$(2) \
+		-f $(notdir $(1)) \
 		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
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
 		-n $($(PKG)_RAW_BASE_NAME) \
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
+		-N $($(PKG)_RAWNAME) \
+		-o $(DL_DIR)/$(notdir $(1)) \
+		$(if $($(PKG)_GIT_SUBMODULES),-r) \
+		$(DOWNLOAD_URIS) \
 		$(QUIET) \
 		-- \
-		-u $(call stripurischeme,$(call qstrip,$(1))) \
 		$($(PKG)_DL_OPTS)
 endef
-
-################################################################################
-# DOWNLOAD -- Download helper. Will try to download source from:
-# 1) BR2_PRIMARY_SITE if enabled
-# 2) Download site, unless BR2_PRIMARY_SITE_ONLY is set
-# 3) BR2_BACKUP_SITE if enabled, unless BR2_PRIMARY_SITE_ONLY is set
-#
-# Argument 1 is the source location
-#
-# E.G. use like this:
-# $(call DOWNLOAD,$(FOO_SITE))
-#
-# For PRIMARY and BACKUP site, any ? in the URL is replaced by %3F. A ? in
-# the URL is used to separate query arguments, but the PRIMARY and BACKUP
-# sites serve just plain files.
-################################################################################
-
-define DOWNLOAD
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
-endef
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
index 510e7ef852..67e9742767 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,31 +19,34 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:q"
+export BR_BACKEND_DL_GETOPTS=":hc:o:n:N:H:ru:qf:e"
 
 main() {
     local OPT OPTARG
     local backend output hfile recurse quiet
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
@@ -77,28 +80,64 @@ main() {
     tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
     tmpf="${tmpd}/output"
 
-    # Helpers expect to run in a directory that is *really* trashable, so
-    # they are free to create whatever files and/or sub-dirs they might need.
-    # Doing the 'cd' here rather than in all backends is easier.
-    cd "${tmpd}"
-
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
+    # Look through all the uris that we were given to downoad the package
+    # source
+    download_and_check=0
+    for uri in "${uris[@]}"; do
+        backend=${uri%+*}
+        case "${backend}" in
+            git|svn|cvs|bzr|file|scp|hg) ;;
+            *) backend="wget" ;;
+        esac
+        uri=${uri#*+}
+
+        urlencode=${backend#*|}
+        # urlencode must be "urlencode"
+        [ "${urlencode}" != "urlencode" ] && urlencode=""
+
+        # Helpers expect to run in a directory that is *really* trashable, so
+        # they are free to create whatever files and/or sub-dirs they might need.
+        # Doing the 'cd' here rather than in all backends is easier.
+        cd "${tmpd}"
+
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
+            rm -rf "${tmpd:?}/*"
+            # cd back to keep path coherence
+            cd "${OLDPWD}"
+            continue
+        fi
 
-    # cd back to free the temp-dir, so we can remove it later
-    cd "${OLDPWD}"
+        # cd back to free the temp-dir, so we can remove it later
+        cd "${OLDPWD}"
 
-    # Check if the downloaded file is sane, and matches the stored hashes
-    # for that file
-    if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+        # Check if the downloaded file is sane, and matches the stored hashes
+        # for that file
+        if ! support/download/check-hash ${quiet} "${hfile}" "${tmpf}" "${output##*/}"; then
+            rm -rf "${tmpd:?}/*"
+            # cd back to keep path coherence
+            cd "${OLDPWD}"
+            continue
+        fi
+        download_and_check=1
+        break
+    done
+
+    # We tried every URI possible, none seems to work or to check against the
+    # available hash. *ABORT MISSION*
+    if [ "${download_and_check}" -eq 0 ]; then
         rm -rf "${tmpd}"
         exit 1
     fi
@@ -164,16 +203,13 @@ DESCRIPTION
 
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
diff --git a/support/download/cp b/support/download/file
similarity index 90%
rename from support/download/cp
rename to support/download/file
index 52fe2de83d..a3e616a181 100755
--- a/support/download/cp
+++ b/support/download/file
@@ -3,7 +3,7 @@
 # We want to catch any unexpected failure, and exit immediately
 set -e
 
-# Download helper for cp, to be called from the download wrapper script
+# Download helper for file, to be called from the download wrapper script
 #
 # Options:
 #   -q          Be quiet.
@@ -23,7 +23,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
     o)  output="${OPTARG}";;
-    u)  source="${OPTARG}";;
+    u)  source="${OPTARG#*://}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
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
2.14.2
