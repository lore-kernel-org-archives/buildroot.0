From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 18:22:01 +0200
Subject: [Buildroot] [PATCH 03/13] download: put most of the infra in
	dl-wrapper
In-Reply-To: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
References: <20170704162211.13238-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704162211.13238-4-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The goal here is to simplify the infrastructure by putting most of the
code in the dl-wrapper as it's easier to implement and to read.

Most of the function where common already, this patch finalize it by
making the pkg-download.mk pass all the parameters needed to the
dl-wrapper which in turns will pass everything to every backend.

The backend will then cherry-pick what it needs from theses arguments
and act accordingly.

It eases the transition to the addition of a sub directory per package
in the DL_DIR, and later on, a git cache.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk     | 166 ++++++++------------------------------------
 support/download/bzr        |   2 +-
 support/download/cp         |   2 +-
 support/download/cvs        |   2 +-
 support/download/dl-wrapper |  65 ++++++++++-------
 support/download/wget       |   7 +-
 6 files changed, 77 insertions(+), 167 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ce069b9926..be61fb130a 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -42,6 +42,8 @@ DL_DIR := $(shell mkdir -p $(DL_DIR) && cd $(DL_DIR) >/dev/null && pwd)
 #
 # geturischeme: http
 geturischeme = $(firstword $(subst ://, ,$(call qstrip,$(1))))
+# getschemeplusuri: git+http://example.com
+getschemeplusuri = $(call geturischeme,$(1))+$(1)
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
+	-u $(call getschemeplusuri,$(BR2_PRIMARY_SITE))
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
+	-u $(call getschemeplusuri,$(BR2_BACKUP_SITE))
+endif
+endif
 
-define DOWNLOAD_SVN
-	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
-		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		$(QUIET) \
-		-- \
-		-u $($(PKG)_SITE) \
+define DOWNLOAD
+	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),export BR_NO_CHECK_HASH_FOR=$(notdir $(1));) \
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
diff --git a/support/download/bzr b/support/download/bzr
index a70cb19cf1..5289a421cd 100755
--- a/support/download/bzr
+++ b/support/download/bzr
@@ -8,7 +8,7 @@ set -e
 # Options:
 #   -q          Be quiet
 #   -o FILE     Generate archive in FILE.
-#   -u URI      Clone from repository URI.
+#   -u URI      Clone from repository at URI.
 #   -c CSET     Use changeset (or revision) CSET.
 #   -n NAME     Use basename NAME.
 #
diff --git a/support/download/cp b/support/download/cp
index 52fe2de83d..9c64b7b70b 100755
--- a/support/download/cp
+++ b/support/download/cp
@@ -23,7 +23,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=;;
     o)  output="${OPTARG}";;
-    u)  source="${OPTARG}";;
+    u)  source="${OPTARG#*//}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
diff --git a/support/download/cvs b/support/download/cvs
index 69d5c71f28..9caffb4b82 100755
--- a/support/download/cvs
+++ b/support/download/cvs
@@ -21,7 +21,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-Q;;
     o)  output="${OPTARG}";;
-    u)  uri="${OPTARG}";;
+    u)  uri="${OPTARG#*//}";;
     c)  rev="${OPTARG}";;
     N)  rawname="${OPTARG}";;
     n)  basename="${OPTARG}";;
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index a29411e0ae..50c14a2e16 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -19,31 +19,34 @@
 # We want to catch any unexpected failure, and exit immediately.
 set -e
 
-export BR_BACKEND_DL_GETOPTS=":hb:o:H:rRq"
+export BR_BACKEND_DL_GETOPTS=":hc:o:H:n:N:ru:qf:"
 
 main() {
     local OPT OPTARG
     local backend output hfile recurse quiet
+    local -a uris
 
     # Parse our options; anything after '--' is for the backend
-    while getopts :hb:o:H:rq OPT; do
+    while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
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
@@ -82,16 +85,29 @@ main() {
     # Doing the 'cd' here rather than in all backends is easier.
     cd "${tmpd}"
 
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
+    for uri in "${uris[@]}"; do
+        backend=${uri%+*}
+        case "${backend}" in
+            git|svn|cvs|bzr|file|scp|hg) ;;
+            *) backend="wget" ;;
+        esac
+        uri=${uri#*+}
+
+        # If the backend fails, we can just remove the temporary directory to
+        # remove all the cruft it may have left behind. Then we just exit in
+        # error too.
+        if "${OLDPWD}/support/download/${backend}" \
+                -c "${cset}" -n "${raw_base_name}" \
+                -N "${raw_name}" -f "${filename}" -u "${uri}" -o "${tmpf}" \
+                ${quiet} ${recurse} "${@}"
+        then
+            break
+        else
+            rm -rf "${tmpd:?}/*"
+        fi
+    done
 
     # cd back to free the temp-dir, so we can remove it later
     cd "${OLDPWD}"
@@ -164,16 +180,13 @@ DESCRIPTION
 
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
index fece6663ca..3e6a6b446c 100755
--- a/support/download/wget
+++ b/support/download/wget
@@ -8,6 +8,7 @@ set -e
 # Options:
 #   -q          Be quiet.
 #   -o FILE     Save into file FILE.
+#   -f FILENAME The filename of the tarball to get at URL
 #   -u URL      Download file at URL.
 #
 # Environment:
@@ -18,6 +19,7 @@ while getopts "${BR_BACKEND_DL_GETOPTS}" OPT; do
     case "${OPT}" in
     q)  verbose=-q;;
     o)  output="${OPTARG}";;
+    f)  filename="${OPTARG}";;
     u)  url="${OPTARG}";;
     :)  printf "option '%s' expects a mandatory argument\n" "${OPTARG}"; exit 1;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
@@ -32,4 +34,7 @@ _wget() {
     eval ${WGET} "${@}"
 }
 
-_wget ${verbose} "${@}" -O "'${output}'" "'${url}'"
+# Replace every '?' with '%3F' in the URI
+url=${url//\?/%3F}
+
+_wget ${verbose} "${@}" -O "'${output}'" "'${url}/${filename}'"
-- 
2.13.2
