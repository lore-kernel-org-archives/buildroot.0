From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 18 Nov 2013 20:02:42 +0000
Subject: [Buildroot] [PATCH] pciutils: install static lib with shared
Message-ID: <F9C551623D2CBB4C9488801D14F864C663264BB0@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building pciutils as shared, also include the static libraries for
a more rounded staging directory (useful when PREFER_STATIC_LIB is not
set, but should provide a static library for when static linking with
libpci is preferred).

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
---
diff -Naur a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
--- a/package/pciutils/pciutils.mk	2013-09-17 06:42:07.000000000 -0500
+++ b/package/pciutils/pciutils.mk	2013-11-18 13:49:31.000000000 -0600
@@ -17,7 +17,26 @@
 	PCIUTILS_ZLIB=no
 endif
 PCIUTILS_DNS=no
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+PCIUTILS_SHARED=no
+PCIUTILS_DO_SHARED_BUILD =
+else
 PCIUTILS_SHARED=yes
+define PCIUTILS_DO_SHARED_BUILD
+	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
+		HOST="$(KERNEL_ARCH)-linux" \
+		OPT="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		RANLIB=$(TARGET_RANLIB) \
+		AR=$(TARGET_AR) \
+		-C $(PCIUTILS_DIR) \
+		SHARED=yes \
+		ZLIB=$(PCIUTILS_ZLIB) \
+		DNS=$(PCIUTILS_DNS) \
+		LIBKMOD=$(PCIUTILS_KMOD) \
+		PREFIX=/usr
+endef
+endif
 
 # Build after busybox since it's got a lightweight lspci
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
@@ -47,11 +66,12 @@
 		RANLIB=$(TARGET_RANLIB) \
 		AR=$(TARGET_AR) \
 		-C $(PCIUTILS_DIR) \
-		SHARED=$(PCIUTILS_SHARED) \
+		SHARED=no \
 		ZLIB=$(PCIUTILS_ZLIB) \
 		DNS=$(PCIUTILS_DNS) \
 		LIBKMOD=$(PCIUTILS_KMOD) \
 		PREFIX=/usr
+	$(PCIUTILS_DO_SHARED_BUILD)
 endef
 
 # Ditch install-lib if SHARED is an option in the future
