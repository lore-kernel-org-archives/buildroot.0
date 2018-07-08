From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:05 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 e2fsprogs
Message-ID: <20180708110811.2BBA3863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1561592231a086b3384ddc1ce2ad05eb3c29376c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk     |  1 +
 package/e2fsprogs/e2fsprogs.mk | 10 ++--------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index a567f25231..166d187081 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_E2FSPROGS),e2fsprogs) \
 	$(if $(BR2_PACKAGE_FBSET),fbset) \
 	$(if $(BR2_PACKAGE_GAWK),gawk) \
 	$(if $(BR2_PACKAGE_GREP),grep) \
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 316546a8d7..efc10d0e99 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -17,12 +17,6 @@ E2FSPROGS_INSTALL_STAGING = YES
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
 
-# If both e2fsprogs and busybox are selected, make certain e2fsprogs
-# wins the fight over who gets to have their utils actually installed
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-E2FSPROGS_DEPENDENCIES += busybox
-endif
-
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
@@ -35,8 +29,8 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--enable-symlink-install \
 	--disable-testio-debug
 
-# Set the binary directories to "/bin" and "/sbin" to override programs
-# installed by busybox.
+# Set the binary directories to "/bin" and "/sbin", as busybox does,
+# so that we do not end up with two versions of e2fs tools.
 E2FSPROGS_CONF_OPTS = \
 	--bindir=/bin \
 	--sbindir=/sbin \
