From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 21:12:24 +0100
Subject: [Buildroot] [git commit] Revert "package/pseudo: wrap the real
	pseudo with a wrapper"
Message-ID: <20161127202537.7E5487FE2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca41a78c2dcbb9874c0d4c285eb10e3ba1633ee1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit a1d602a74d53f5610852c1763014632de145bf8b.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pseudo/pseudo-wrapper | 12 ------------
 package/pseudo/pseudo.mk      |  6 ------
 2 files changed, 18 deletions(-)

diff --git a/package/pseudo/pseudo-wrapper b/package/pseudo/pseudo-wrapper
deleted file mode 100644
index feaa7fc..0000000
--- a/package/pseudo/pseudo-wrapper
+++ /dev/null
@@ -1,12 +0,0 @@
-#!/bin/sh
-
-export PSEUDO_PREFIX="$(dirname "${0%/*}")"
-export PSEUDO_OPTS="-t0"
-if [ -n "${TARGET_DIR}" ]; then
-    export PSEUDO_PASSWD="${TARGET_DIR}"
-fi
-if [ -n "${BASE_DIR}" ]; then
-    export PSEUDO_LOCALSTATEDIR="${BASE_DIR}/build/.pseudodb"
-fi
-
-exec "${0%-wrapper}" "${@}"
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index 7701825..a924e10 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -26,12 +26,6 @@ HOST_PSEUDO_CONF_OPTS = \
 	--libdir=$(HOST_DIR)/usr/lib \
 	--with-sqlite=$(HOST_DIR)/usr
 
-define HOST_PSEUDO_INSTALL_WRAPPER
-	$(INSTALL) -D -m 0755 $(HOST_PSEUDO_PKGDIR)/pseudo-wrapper \
-		$(HOST_DIR)/usr/bin/pseudo-wrapper
-endef
-HOST_PSEUDO_POST_INSTALL_HOOKS += HOST_PSEUDO_INSTALL_WRAPPER
-
 define HOST_PSEUDO_FAKEROOT_SYMLINK
 	ln -sf pseudo $(HOST_DIR)/usr/bin/fakeroot
 endef
