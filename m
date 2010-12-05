From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 21:53:19 +0100
Subject: [Buildroot] [PATCH 48/55] linux: always enable support for tmpfs in
	the kernel
In-Reply-To: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e2b832a7ac35e77fa907f23e126f223fbdf7d93a.1291582352.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our default /etc/fstab uses tmpfs to mount the /tmp directory, so it
sounds like a good idea to enable this filesystem by default.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 96dd2ba..ede9983 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -90,6 +90,8 @@ else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
 	$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX26_MAKE_FLAGS) -C $(@D) buildroot_defconfig
 	rm $(@D)/arch/$(KERNEL_ARCH)/configs/buildroot_defconfig
 endif
+	# Our fstab uses tmpfs
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS,$(@D)/.config)
 ifeq ($(BR2_ARM_EABI),y)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config)
 else
-- 
1.7.0.4
