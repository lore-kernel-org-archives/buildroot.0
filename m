From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:33:27 +0200
Subject: [Buildroot] [git commit] pciutils: cleanup
Message-ID: <20150409213424.7F661818D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c879f95a03c38949f4a8ee38f2c6c91f56411fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It makes no sense to have variables that are only used in one place
(PCIUTILS_MAKE_OPTS) for different build conditions.
Just make them add-up to MAKE_OPTS and move the fixed definition up.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pciutils/pciutils.mk |   34 ++++++++++++++--------------------
 1 files changed, 14 insertions(+), 20 deletions(-)

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
