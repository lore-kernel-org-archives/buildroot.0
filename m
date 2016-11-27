From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 20:34:49 +0100
Subject: [Buildroot] [git commit] Revert "package/pseudo: provide better
	legacy handling for fakeroot"
Message-ID: <20161127202537.6BEAC819CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f496d77db5f877edfb18746a706bb8061aa0500
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 499f28fc7ce6184c8017ccd229ffc973a520adde.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pseudo/pseudo-wrapper | 9 +--------
 package/pseudo/pseudo.mk      | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
index 9c8dbdb..feaa7fc 100644
--- a/package/pseudo/pseudo-wrapper
+++ b/package/pseudo/pseudo-wrapper
@@ -1,12 +1,5 @@
 #!/bin/sh
 
-if [ "${0##*/}" = "fakeroot" ]; then
-    cat >&2 <<-_EOF_
-	WARNING: fakeroot has been replaced with pseudo.
-	WARNING: Update your script(s) to use pseudo or pseudo-wrapper instead.
-	_EOF_
-fi
-
 export PSEUDO_PREFIX="$(dirname "${0%/*}")"
 export PSEUDO_OPTS="-t0"
 if [ -n "${TARGET_DIR}" ]; then
@@ -16,4 +9,4 @@ if [ -n "${BASE_DIR}" ]; then
     export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
 fi
 
-exec "${0%/*}/pseudo" "${@}"
+exec "${0%-wrapper}" "${@}"
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index aa2a9c7..7701825 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -33,7 +33,7 @@ endef
 HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_INSTALL_WRAPPER
 
 define HOST_PSEUDO_FAKEROOT_SYMLINK
-	ln -sf pseudo-wrapper $(HOST_DIR)/usr/bin/fakeroot
+	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
 endef
 HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_FAKEROOT_SYMLINK
 
