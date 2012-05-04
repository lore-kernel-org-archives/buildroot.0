From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  4 May 2012 17:40:53 +0200
Subject: [Buildroot] [PATCH 1/1] linux: improve the 'make linux-*' special
	commands
In-Reply-To: <cover.1336146047.git.thomas.petazzoni@free-electrons.com>
References: <cover.1336146047.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a96a992b96d72989cddf72ce8420d6acf28302c3.1336146047.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch improves two things:

 * It makes sure that the linux-menuconfig and al. commands can be
   executed even if the user hasn't executed 'make' before. Until now,
   the commands were depending on the .configured stamp, which is not
   sufficient since the linux package has been converted to the
   GENTARGETS infrastructure. Instead, depend on the linux-configure
   phony target.

 * It makes sure that those commands are not available when the Linux
   package is not selected, just like we do for Barebox.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 16f9916..34f8623 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -203,17 +203,18 @@ include linux/linux-ext-*.mk
 
 $(eval $(call GENTARGETS))
 
-linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs $(LINUX_DIR)/.stamp_configured
+ifeq ($(BR2_LINUX_KERNEL),y)
+linux-menuconfig linux-xconfig linux-gconfig linux-nconfig linux26-menuconfig linux26-xconfig linux26-gconfig linux26-nconfig: dirs linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 	rm -f $(LINUX_DIR)/.stamp_{built,target_installed,images_installed}
 
-linux-savedefconfig linux26-savedefconfig: dirs $(LINUX_DIR)/.stamp_configured
+linux-savedefconfig linux26-savedefconfig: dirs linux-configure
 	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) \
 		$(subst linux-,,$(subst linux26-,,$@))
 
 ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
-linux-update-config linux26-update-config: $(LINUX_DIR)/.config
+linux-update-config linux26-update-config: linux-configure $(LINUX_DIR)/.config
 	cp -f $(LINUX_DIR)/.config $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 
 linux-update-defconfig linux26-update-defconfig: linux-savedefconfig
@@ -222,6 +223,7 @@ else
 linux-update-config linux26-update-config: ;
 linux-update-defconfig linux26-update-defconfig: ;
 endif
+endif
 
 # Support for rebuilding the kernel after the cpio archive has
 # been generated in $(BINARIES_DIR)/rootfs.cpio.
-- 
1.7.9.5
