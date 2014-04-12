From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 23:00:24 +0200
Subject: [Buildroot] [git commit] pciutils: allow installation of static
	library when BR2_PREFER_STATIC_LIB
Message-ID: <20140412210107.4B2F09C749@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=811ea79e3b6a3fd2d85bef6014aa7860915ed36c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rework according to Arnout comments.]

Signed-off-by: Andy Kennedy <andy.kennedy@adtran.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pciutils/pciutils.mk |   52 +++++++++++++++++++++++------------------
 1 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index bc88ab3..f9e8695 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -16,13 +16,8 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 else
 	PCIUTILS_ZLIB=no
 endif
-PCIUTILS_DNS=no
-PCIUTILS_SHARED=yes
 
-# Build after busybox since it's got a lightweight lspci
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-	PCIUTILS_DEPENDENCIES += busybox
-endif
+PCIUTILS_DNS=no
 
 ifeq ($(BR2_PACKAGE_KMOD),y)
 	PCIUTILS_DEPENDENCIES += kmod
@@ -31,6 +26,29 @@ else
 	PCIUTILS_KMOD = no
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	PCIUTILS_SHARED=no
+else
+	PCIUTILS_SHARED=yes
+endif
+
+PCIUTILS_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	HOST="$(KERNEL_ARCH)-linux" \
+	OPT="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	RANLIB=$(TARGET_RANLIB) \
+	AR=$(TARGET_AR) \
+	ZLIB=$(PCIUTILS_ZLIB) \
+	DNS=$(PCIUTILS_DNS) \
+	LIBKMOD=$(PCIUTILS_KMOD) \
+	SHARED=$(PCIUTILS_SHARED)
+
+# Build after busybox since it's got a lightweight lspci
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	PCIUTILS_DEPENDENCIES += busybox
+endif
+
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
@@ -40,30 +58,18 @@ define PCIUTILS_CONFIGURE_CMDS
 endef
 
 define PCIUTILS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" \
-		HOST="$(KERNEL_ARCH)-linux" \
-		OPT="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
-		RANLIB=$(TARGET_RANLIB) \
-		AR=$(TARGET_AR) \
-		-C $(PCIUTILS_DIR) \
-		SHARED=$(PCIUTILS_SHARED) \
-		ZLIB=$(PCIUTILS_ZLIB) \
-		DNS=$(PCIUTILS_DNS) \
-		LIBKMOD=$(PCIUTILS_KMOD) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
 		PREFIX=/usr
 endef
 
-# Ditch install-lib if SHARED is an option in the future
 define PCIUTILS_INSTALL_TARGET_CMDS
-	$(MAKE1) BUILDDIR=$(@D) -C $(@D) PREFIX=$(TARGET_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install install-lib
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
+		PREFIX=$(TARGET_DIR)/usr install install-lib install-pcilib
 endef
 
 define PCIUTILS_INSTALL_STAGING_CMDS
-	$(MAKE1) BUILDDIR=$(@D) -C $(@D) PREFIX=$(STAGING_DIR)/usr \
-		SHARED=$(PCIUTILS_SHARED) install install-lib
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) $(PCIUTILS_MAKE_OPTS) \
+		PREFIX=$(STAGING_DIR)/usr install install-lib install-pcilib
 endef
 
-
 $(eval $(generic-package))
