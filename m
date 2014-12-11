From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 23:58:37 +0100
Subject: [Buildroot] [git commit] support/download: add option parsing to
	the download wrapper
Message-ID: <20141211225952.3AD14800B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78b92e5055442e225b10ca6baf98f23a0fa8a102
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of relying on argument ordering, use actual options in the
download wrapper.

Download backends (bzr, cp, hg...) are left as-is, because it does not
make sense to complexify them, since they are almost very trivial shell
scripts, and adding option parsing would be really overkill.

This commit also renames the script to dl-wrapper so it looks better in
the traces, and it is not confused with another wrapper.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk     |   42 +++++++----
 support/download/dl-wrapper |  165 +++++++++++++++++++++++++++++++++++++++++++
 support/download/wrapper    |   99 --------------------------
 3 files changed, 191 insertions(+), 115 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 190b5b7..8424eca 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -18,6 +18,8 @@ export SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
+DL_WRAPPER = support/download/dl-wrapper
+
 # Default spider mode is 'DOWNLOAD'. Other possible values are 'SOURCE_CHECK'
 # used by the _source-check target and 'SHOW_EXTERNAL_DEPS', used by the
 # external-deps target.
@@ -95,8 +97,9 @@ endef
 # problems
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/wrapper git \
-		$(DL_DIR)/$($(PKG)_SOURCE) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
+		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -115,8 +118,9 @@ endef
 
 define DOWNLOAD_BZR
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/wrapper bzr \
-		$(DL_DIR)/$($(PKG)_SOURCE) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
+		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -132,8 +136,9 @@ endef
 
 define DOWNLOAD_CVS
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/wrapper cvs \
-		$(DL_DIR)/$($(PKG)_SOURCE) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
+		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_RAWNAME) \
@@ -151,8 +156,9 @@ endef
 
 define DOWNLOAD_SVN
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/wrapper svn \
-		$(DL_DIR)/$($(PKG)_SOURCE) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
+		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -171,8 +177,9 @@ endef
 # to prepend the path with a slash: scp://[user@]host:/absolutepath
 define DOWNLOAD_SCP
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wrapper scp \
-		$(DL_DIR)/$(2) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
+		-o $(DL_DIR)/$(2) \
+		-- \
 		'$(call stripurischeme,$(call qstrip,$(1)))' && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
 endef
@@ -188,8 +195,9 @@ endef
 
 define DOWNLOAD_HG
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-	$(EXTRA_ENV) support/download/wrapper hg \
-		$(DL_DIR)/$($(PKG)_SOURCE) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
+		-o $(DL_DIR)/$($(PKG)_SOURCE) \
+		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
 		$($(PKG)_BASE_NAME)
@@ -208,8 +216,9 @@ endef
 
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wrapper wget \
-		$(DL_DIR)/$(2) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
+		-o $(DL_DIR)/$(2) \
+		-- \
 		'$(call qstrip,$(1))' && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
 endef
@@ -224,8 +233,9 @@ endef
 
 define DOWNLOAD_LOCALFILES
 	test -e $(DL_DIR)/$(2) || \
-	$(EXTRA_ENV) support/download/wrapper cp \
-		$(DL_DIR)/$(2) \
+	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
+		-o $(DL_DIR)/$(2) \
+		-- \
 		$(call stripurischeme,$(call qstrip,$(1))) && \
 	$(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_RAWNAME).hash,$(DL_DIR)/$(2))
 endef
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
new file mode 100755
index 0000000..f1bb73a
--- /dev/null
+++ b/support/download/dl-wrapper
@@ -0,0 +1,165 @@
+#!/usr/bin/env bash
+
+# This script is a wrapper to the other download backends.
+# Its role is to ensure atomicity when saving downloaded files
+# back to BR2_DL_DIR, and not clutter BR2_DL_DIR with partial,
+# failed downloads.
+#
+# Call it with -h to see some help.
+
+# To avoid cluttering BR2_DL_DIR, we download to a trashable
+# location, namely in $(BUILD_DIR).
+# Then, we move the downloaded file to a temporary file in the
+# same directory as the final output file.
+# This allows us to finally atomically rename it to its final
+# name.
+# If anything goes wrong, we just remove all the temporaries
+# created so far.
+
+# We want to catch any unexpected failure, and exit immediately.
+set -e
+
+main() {
+    local OPT OPTARG
+    local backend output
+
+    # Parse our options; anything after '--' is for the backend
+    while getopts :hb:o: OPT; do
+        case "${OPT}" in
+        h)  help; exit 0;;
+        b)  backend="${OPTARG}";;
+        o)  output="${OPTARG}";;
+        :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+        \?) error "unknown option '%s'\n" "${OPTARG}";;
+        esac
+    done
+    # Forget our options, and keep only those for the backend
+    shift $((OPTIND-1))
+
+    if [ -z "${backend}" ]; then
+        error "no backend specified, use -b\n"
+    fi
+    if [ -z "${output}" ]; then
+        error "no output specified, use -o\n"
+    fi
+
+    # tmpd is a temporary directory in which backends may store intermediate
+    # by-products of the download.
+    # tmpf is the file in which the backends should put the downloaded content.
+    # tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
+    # $(BR2_DL_DIR)
+    # We let the backends create tmpf, so they are able to set whatever
+    # permission bits they want (although we're only really interested in
+    # the executable bit.)
+    tmpd="$(mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX")"
+    tmpf="${tmpd}/output"
+
+    # Helpers expect to run in a directory that is *really* trashable, so
+    # they are free to create whatever files and/or sub-dirs they might need.
+    # Doing the 'cd' here rather than in all backends is easier.
+    cd "${tmpd}"
+
+    # If the backend fails, we can just remove the temporary directory to
+    # remove all the cruft it may have left behind. Then we just exit in
+    # error too.
+    if ! "${OLDPWD}/support/download/${backend}" "${tmpf}" "${@}"; then
+        rm -rf "${tmpd}"
+        exit 1
+    fi
+
+    # cd back to free the temp-dir, so we can remove it later
+    cd "${OLDPWD}"
+
+    # tmp_output is in the same directory as the final output, so we can
+    # later move it atomically.
+    tmp_output="$(mktemp "${output}.XXXXXX")"
+
+    # 'mktemp' creates files with 'go=-rwx', so the files are not accessible
+    # to users other than the one doing the download (and root, of course).
+    # This can be problematic when a shared BR2_DL_DIR is used by different
+    # users (e.g. on a build server), where all users may write to the shared
+    # location, since other users would not be allowed to read the files
+    # another user downloaded.
+    # So, we restore the 'go' access rights to a more sensible value, while
+    # still abiding by the current user's umask. We must do that before the
+    # final 'mv', so just do it now.
+    # Some backends (cp and scp) may create executable files, so we need to
+    # carry the executable bit if needed.
+    [ -x "${tmpf}" ] && new_mode=755 || new_mode=644
+    new_mode=$(printf "%04o" $((0${new_mode} & ~0$(umask))))
+    chmod ${new_mode} "${tmp_output}"
+
+    # We must *not* unlink tmp_output, otherwise there is a small window
+    # during which another download process may create the same tmp_output
+    # name (very, very unlikely; but not impossible.)
+    # Using 'cp' is not reliable, since 'cp' may unlink the destination file
+    # if it is unable to open it with O_WRONLY|O_TRUNC; see:
+    #   http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cp.html
+    # Since the destination filesystem can be anything, it might not support
+    # O_TRUNC, so 'cp' would unlink it first.
+    # Use 'cat' and append-redirection '>>' to save to the final location,
+    # since that is the only way we can be 100% sure of the behaviour.
+    if ! cat "${tmpf}" >>"${tmp_output}"; then
+        rm -rf "${tmpd}" "${tmp_output}"
+        exit 1
+    fi
+    rm -rf "${tmpd}"
+
+    # tmp_output and output are on the same filesystem, so POSIX guarantees
+    # that 'mv' is atomic, because it then uses rename() that POSIX mandates
+    # to be atomic, see:
+    #   http://pubs.opengroup.org/onlinepubs/9699919799/functions/rename.html
+    if ! mv -f "${tmp_output}" "${output}"; then
+        rm -f "${tmp_output}"
+        exit 1
+    fi
+}
+
+help() {
+    cat <<_EOF_
+NAME
+    ${my_name} - download wrapper for Buildroot
+
+SYNOPSIS
+    ${my_name} [OPTION]... -- [BACKEND OPTION]...
+
+DESCRIPTION
+    Wrapper script around different download mechanisms. Ensures that
+    concurrent downloads do not conflict, that partial downloads are
+    properly evicted without leaving temporary files, and that access
+    rights are maintained.
+
+    -h  This help text.
+
+    -b BACKEND
+        Wrap the specified BACKEND. Known backends are:
+            bzr     Bazaar
+            cp      Local files
+            cvs     Concurrent Versions System
+            git     Git
+            hg      Mercurial
+            scp     Secure copy
+            svn     Subversion
+            wget    HTTP download
+
+    -o FILE
+        Store the downloaded archive in FILE.
+
+  Exit status:
+    0   if OK
+    !0  in case of error
+
+ENVIRONMENT
+
+    BUILD_DIR
+        The path to Buildroot's build dir
+_EOF_
+}
+
+trace()  { local msg="${1}"; shift; printf "%s: ${msg}" "${my_name}" "${@}"; }
+warn()   { trace "${@}" >&2; }
+errorN() { local ret="${1}"; shift; warn "${@}"; exit ${ret}; }
+error()  { errorN 1 "${@}"; }
+
+my_name="${0##*/}"
+main "${@}"
diff --git a/support/download/wrapper b/support/download/wrapper
deleted file mode 100755
index 320a37e..0000000
--- a/support/download/wrapper
+++ /dev/null
@@ -1,99 +0,0 @@
-#!/usr/bin/env bash
-
-# This script is a wrapper to the other download helpers.
-# Its role is to ensure atomicity when saving downloaded files
-# back to BR2_DL_DIR, and not clutter BR2_DL_DIR with partial,
-# failed downloads.
-#
-# Call it with:
-#   $1: name of the helper (eg. cvs, git, cp...)
-#   $2: full path to the file in which to save the download
-#   $*: additional arguments to the helper in $1
-# Environment:
-#   BUILD_DIR: the path to Buildroot's build dir
-
-# To avoid cluttering BR2_DL_DIR, we download to a trashable
-# location, namely in $(BUILD_DIR).
-# Then, we move the downloaded file to a temporary file in the
-# same directory as the final output file.
-# This allows us to finally atomically rename it to its final
-# name.
-# If anything goes wrong, we just remove all the temporaries
-# created so far.
-
-# We want to catch any unexpected failure, and exit immediately.
-set -e
-
-helper="${1}"
-output="${2}"
-shift 2
-
-# tmpd is a temporary directory in which helpers may store intermediate
-# by-products of the download.
-# tmpf is the file in which the helpers should put the downloaded content.
-# tmpd is located in $(BUILD_DIR), so as not to clutter the (precious)
-# $(BR2_DL_DIR)
-# We let the helpers create tmpf, so they are able to set whatever
-# permission bits they want (although we're only really interested in
-# the executable bit.)
-tmpd="$( mktemp -d "${BUILD_DIR}/.${output##*/}.XXXXXX" )"
-tmpf="${tmpd}/output"
-
-# Helpers expect to run in a directory that is *really* trashable, so
-# they are free to create whatever files and/or sub-dirs they might need.
-# Doing the 'cd' here rather than in all helpers is easier.
-cd "${tmpd}"
-
-# If the helper fails, we can just remove the temporary directory to
-# remove all the cruft it may have left behind. Then we just exit in
-# error too.
-if ! "${OLDPWD}/support/download/${helper}" "${tmpf}" "${@}"; then
-    rm -rf "${tmpd}"
-    exit 1
-fi
-
-# cd back to free the temp-dir, so we can remove it later
-cd "${OLDPWD}"
-
-# tmp_output is in the same directory as the final output, so we can
-# later move it atomically.
-tmp_output="$( mktemp "${output}.XXXXXX" )"
-
-# 'mktemp' creates files with 'go=-rwx', so the files are not accessible
-# to users other than the one doing the download (and root, of course).
-# This can be problematic when a shared BR2_DL_DIR is used by different
-# users (e.g. on a build server), where all users may write to the shared
-# location, since other users would not be allowed to read the files
-# another user downloaded.
-# So, we restore the 'go' access rights to a more sensible value, while
-# still abiding by the current user's umask. We must do that before the
-# final 'mv', so just do it now.
-# Some helpers (cp and scp) may create executable files, so we need to
-# carry the executable bit if needed.
-[ -x "${tmpf}" ] && new_mode=755 || new_mode=644
-new_mode=$( printf "%04o" $((0${new_mode} & ~0$(umask))) )
-chmod ${new_mode} "${tmp_output}"
-
-# We must *not* unlink tmp_output, otherwise there is a small window
-# during which another download process may create the same tmp_output
-# name (very, very unlikely; but not impossible.)
-# Using 'cp' is not reliable, since 'cp' may unlink the destination file
-# if it is unable to open it with O_WRONLY|O_TRUNC; see:
-#   http://pubs.opengroup.org/onlinepubs/9699919799/utilities/cp.html
-# Since the destination filesystem can be anything, it might not support
-# O_TRUNC, so 'cp' would unlink it first.
-# Use 'cat' and append-redirection '>>' to save to the final location,
-# since that is the only way we can be 100% sure of the behaviour.
-if ! cat "${tmpf}" >>"${tmp_output}"; then
-    rm -rf "${tmpd}" "${tmp_output}"
-    exit 1
-fi
-rm -rf "${tmpd}"
-# tmp_output and output are on the same filesystem, so POSIX guarantees
-# that 'mv' is atomic, because it then uses rename() that POSIX mandates
-# to be atomic, see:
-#   http://pubs.opengroup.org/onlinepubs/9699919799/functions/rename.html
-if ! mv "${tmp_output}" "${output}"; then
-    rm -f "${tmp_output}"
-    exit 1
-fi
