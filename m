From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:06 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 binutils
Message-ID: <20180708110811.64C64863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3e4901d60f9f1f017aeb1ec209aab44f67ce8ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/binutils/binutils.mk | 5 -----
 package/busybox/busybox.mk   | 1 +
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index cb6022f7fa..090065a3e4 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -72,11 +72,6 @@ ifeq ($(BR2_ARM_CPU_ARMV7M)$(BR2_OPTIMIZE_S),yy)
 BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O2"
 endif
 
-# Install binutils after busybox to prefer full-blown utilities
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-BINUTILS_DEPENDENCIES += busybox
-endif
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BINUTILS_DEPENDENCIES += zlib
 endif
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 748f05aca3..d920987d11 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BINUTILS),binutils) \
 	$(if $(BR2_PACKAGE_COREUTILS),coreutils) \
 	$(if $(BR2_PACKAGE_CPIO),cpio) \
 	$(if $(BR2_PACKAGE_DCRON),dcron) \
