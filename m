From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:05:00 +0200
Subject: [Buildroot] [PATCH 1/3] linux: de-duplicate DTB and Linux image
	installation
In-Reply-To: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1445202302-2720-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the LINUX_INSTALL_DTB and LINUX_INSTALL_DTB_TARGET macros
are exactly the same, except for the target directory.

Similarly, LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET and
LINUX_INSTALL_IMAGES_CMDS are copying the kernel image, just to a
different place (and with a different strategy).

As a preparation for future additions, this commit de-duplicate this
code:

 - LINUX_INSTALL_DTB becomes a make macro that takes one argument: the
   destination directory.

 - LINUX_INSTALL_IMAGE is a new make macro that also takes on
   argument: the destination directory.

Both macros are used by LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET and
LINUX_INSTALL_IMAGES_CMDS to respectively install to the target
directory and the images directory.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6c7ecfc..149bd69 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -236,14 +236,7 @@ define LINUX_INSTALL_DTB
 	cp $(addprefix \
 		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
 		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
-		$(BINARIES_DIR)/
-endef
-define LINUX_INSTALL_DTB_TARGET
-	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
-	cp $(addprefix \
-		$(KERNEL_ARCH_PATH)/boot/$(if $(wildcard \
-		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
-		$(TARGET_DIR)/boot/
+		$(1)
 endef
 endif
 endif
@@ -284,11 +277,14 @@ define LINUX_BUILD_CMDS
 	$(LINUX_APPEND_DTB)
 endef
 
+define LINUX_INSTALL_IMAGE
+	$(INSTALL) -m 0644 -D $(LINUX_IMAGE_PATH) $(1)/$(LINUX_IMAGE_NAME)
+endef
 
 ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
 define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
-	install -m 0644 -D $(LINUX_IMAGE_PATH) $(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
-	$(LINUX_INSTALL_DTB_TARGET)
+	$(call LINUX_INSTALL_IMAGE,$(TARGET_DIR)/boot)
+	$(call LINUX_INSTALL_DTB,$(TARGET_DIR)/boot)
 endef
 endif
 
@@ -302,8 +298,8 @@ endef
 
 
 define LINUX_INSTALL_IMAGES_CMDS
-	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
-	$(LINUX_INSTALL_DTB)
+	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
+	$(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
 endef
 
 define LINUX_INSTALL_TARGET_CMDS
-- 
2.6.2
