From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Mar 2021 21:00:44 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: fix build failure
 when no firmware item selected
Message-ID: <20210309194401.4BA3A8679B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f28ed0f623e25913856d84c5a0185ff8bd6f5e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest change in Linux firmware handling breaks the build if no
specific firmware item is selected below BR2_PACKAGE_LINUX_FIRMWARE.

The firmware archive is only created if at least one firmware
sub-category is selected; the installation step wants to unpack the
archive unconditionally.

Use the same condition to control install command definition as in the
build step.

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[yann.morin.1998 at free.fr: use a single conditional block]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5e92b0446e..6652758c87 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -640,13 +640,11 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.moxa
 endif
 
 ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
+
 define LINUX_FIRMWARE_BUILD_CMDS
 	cd $(@D) && \
 	$(TAR) cf br-firmware.tar $(sort $(LINUX_FIRMWARE_FILES) $(LINUX_FIRMWARE_DIRS))
 endef
-endif
-
-ifneq ($(LINUX_FIRMWARE_FILES)$(LINUX_FIRMWARE_DIRS),)
 
 # Most firmware files are under a proprietary license, so no need to
 # repeat it for every selections above. Those firmwares that have more
@@ -662,8 +660,6 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += WHENCE
 # duplicates
 LINUX_FIRMWARE_LICENSE_FILES = $(sort $(LINUX_FIRMWARE_ALL_LICENSE_FILES))
 
-endif
-
 # Some firmware are distributed as a symlink, for drivers to load them using a
 # defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
 # symlinks") those symlink aren't distributed in linux-firmware but are created
@@ -688,6 +684,8 @@ define LINUX_FIRMWARE_INSTALL_FW
 	done
 endef
 
+endif  # LINUX_FIRMWARE_FILES || LINUX_FIRMWARE_DIRS
+
 define LINUX_FIRMWARE_INSTALL_TARGET_CMDS
 	$(call LINUX_FIRMWARE_INSTALL_FW, $(TARGET_DIR)/lib/firmware)
 endef
