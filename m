From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Dec 2012 11:59:42 +0100
Subject: [Buildroot] [PATCH 2/2] barebox: needs host-lzop
In-Reply-To: <1355396382-14652-1-git-send-email-fabio.porcedda@gmail.com>
References: <1355396382-14652-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1355396382-14652-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host-lzop dependency.
Use $(TARGET_MAKE_ENV) when calling $(MAKE)
to able to use binaries built for host.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 boot/barebox/barebox.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 6cc4976..2aff7e6 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -20,6 +20,7 @@ BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download/
 endif
 
+BAREBOX_DEPENDENCIES = host-lzop
 BAREBOX_LICENSE = GPLv2 with exceptions
 BAREBOX_LICENSE_FILES = COPYING
 
@@ -56,7 +57,7 @@ endif
 
 define BAREBOX_CONFIGURE_CMDS
 	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 endef
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
@@ -68,7 +69,7 @@ endif
 
 define BAREBOX_BUILD_CMDS
 	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
@@ -96,12 +97,12 @@ endif
 endif
 
 barebox-menuconfig barebox-xconfig barebox-gconfig barebox-nconfig: barebox-configure
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
 		$(subst barebox-,,$@)
 	rm -f $(BAREBOX_DIR)/.stamp_{built,target_installed,images_installed}
 
 barebox-savedefconfig: barebox-configure
-	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(BAREBOX_DIR) \
 		$(subst barebox-,,$@)
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-- 
1.8.0
