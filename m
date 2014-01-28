From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:56:17 +0100
Subject: [Buildroot] [git commit] linux: ensure buildroot_defconfig is
	writable
Message-ID: <20140128215820.B4D289C6AC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a541c8f244971a45396bfa4c371444204ed4a2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If $(KERNEL_SOURCE_CONFIG) is read-only (eg. because Buildroot's source
dir is), the rm of $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig will
either fail, or prompt the user, both of which we want to avoid.

Make it writable by using $(INSTALL).

Fixes: #4363
Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp, don't 'rm -f']
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index ab25fe9..62033d2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -164,7 +164,7 @@ KERNEL_SOURCE_CONFIG = $(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE)
 endif
 
 define LINUX_CONFIGURE_CMDS
-	cp $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
+	$(INSTALL) -m 0644 $(KERNEL_SOURCE_CONFIG) $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
 	$(if $(BR2_arm)$(BR2_armeb),
