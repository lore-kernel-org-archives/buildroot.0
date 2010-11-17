From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 17 Nov 2010 01:47:12 -0500
Subject: [Buildroot] [PATCH 2/2] busybox: respect strip settings
In-Reply-To: <1289976432-22684-1-git-send-email-vapier@gentoo.org>
References: <1289976432-22684-1-git-send-email-vapier@gentoo.org>
Message-ID: <1289976432-22684-2-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some ABI's (like FLAT), we cannot strip busybox as the file format
does not support it and strip will abort with errors like 'File format
not recognized'.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/busybox/busybox.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 5ef1622..323dad8 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -16,6 +16,12 @@ BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = $(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include"
 
+ifeq ($(TARGET_STRIP),true)
+BUSYBOX_STRIP = cp $$< $$@; :
+else
+BUSYBOX_STRIP = $(TARGET_STRIP)
+endif
+
 ifndef BUSYBOX_CONFIG_FILE
 	BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
@@ -124,7 +130,7 @@ define BUSYBOX_BUILD_CMDS
 	$(BUSYBOX_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" ARCH=$(KERNEL_ARCH) \
 		PREFIX="$(TARGET_DIR)" EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" CONFIG_PREFIX="$(TARGET_DIR)" \
-		-C $(BUSYBOX_DIR)
+		STRIP='$(BUSYBOX_STRIP)' -C $(BUSYBOX_DIR)
 endef
 
 ifeq ($(BR2_PACKAGE_BUSYBOX_FULLINSTALL),y)
-- 
1.7.3.2
