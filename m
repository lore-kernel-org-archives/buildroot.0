From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  9 Apr 2015 18:22:05 -0300
Subject: [Buildroot] [PATCH] pciutils: cleanup
Message-ID: <1428614525-10984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It makes no sense to have variables that are only used in one place
(PCIUTILS_MAKE_OPTS) for different build conditions.
Just make them add-up to MAKE_OPTS and move the fixed definition up.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 1410738..12c13b2 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -10,6 +10,14 @@ PCIUTILS_SOURCE = pciutils-$(PCIUTILS_VERSION).tar.xz
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
 PCIUTILS_LICENSE_FILES = COPYING
+PCIUTILS_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	HOST="$(KERNEL_ARCH)-linux" \
+	OPT="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	RANLIB=$(TARGET_RANLIB) \
+	AR=$(TARGET_AR) \
+	PCIUTILS_DNS=no
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PCIUTILS_DEPENDENCIES += udev
@@ -19,39 +27,25 @@ PCIUTILS_MAKE_OPTS += HWDB=no
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-PCIUTILS_ZLIB=yes
+PCIUTILS_MAKE_OPTS += ZLIB=yes
 PCIUTILS_DEPENDENCIES += zlib
 else
-PCIUTILS_ZLIB=no
+PCIUTILS_MAKE_OPTS += ZLIB=no
 endif
 
-PCIUTILS_DNS = no
-
 ifeq ($(BR2_PACKAGE_KMOD),y)
 PCIUTILS_DEPENDENCIES += kmod
-PCIUTILS_KMOD = yes
+PCIUTILS_MAKE_OPTS += LIBKMOD=yes
 else
-PCIUTILS_KMOD = no
+PCIUTILS_MAKE_OPTS += LIBKMOD=no
 endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-PCIUTILS_SHARED=no
+PCIUTILS_MAKE_OPTS += SHARED=no
 else
-PCIUTILS_SHARED=yes
+PCIUTILS_MAKE_OPTS += SHARED=yes
 endif
 
-PCIUTILS_MAKE_OPTS += \
-	CC="$(TARGET_CC)" \
-	HOST="$(KERNEL_ARCH)-linux" \
-	OPT="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
-	RANLIB=$(TARGET_RANLIB) \
-	AR=$(TARGET_AR) \
-	ZLIB=$(PCIUTILS_ZLIB) \
-	DNS=$(PCIUTILS_DNS) \
-	LIBKMOD=$(PCIUTILS_KMOD) \
-	SHARED=$(PCIUTILS_SHARED)
-
 # Build after busybox since it's got a lightweight lspci
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PCIUTILS_DEPENDENCIES += busybox
-- 
2.0.5
