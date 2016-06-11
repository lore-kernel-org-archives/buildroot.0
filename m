From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 16:19:30 +0200
Subject: [Buildroot] [git commit] linux: align endianess based on the
	Buildroot configuration
Message-ID: <20160611141947.5C46A802AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11dd7406c8b18ba83b4e8773c76ee10c96c824fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The endianess of the Linux kernel should be based on BR2_ENDIAN, so that
it is automatically built for the right endianness.

Signed-off-by: Ofer Heifetz <oferh@marvell.com>
[Thomas: tweak commit message, add comment in .mk file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index fdd8421..a751da9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -216,6 +216,20 @@ LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
 # If no package has yet set it, set it from the Kconfig option
 LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
 
+# Make sure the Linux kernel is built with the right endianness. Not
+# all architectures support
+# CONFIG_CPU_BIG_ENDIAN/CONFIG_CPU_LITTLE_ENDIAN in Linux, but the
+# option will be thrown away and ignored if it doesn't exist.
+ifeq ($(BR2_ENDIAN),"BIG")
+define LINUX_FIXUP_CONFIG_ENDIANNESS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_BIG_ENDIAN,$(@D)/.config)
+endef
+else
+define LINUX_FIXUP_CONFIG_ENDIANNESS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CPU_LITTLE_ENDIAN,$(@D)/.config)
+endef
+endif
+
 define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(LINUX_NEEDS_MODULES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_MODULES,$(@D)/.config))
@@ -223,6 +237,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(foreach opt, $(LINUX_COMPRESSION_OPT_),
 		$(call KCONFIG_DISABLE_OPT,$(opt),$(@D)/.config)
 	)
+	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
 	$(if $(BR2_arm)$(BR2_armeb),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
 	$(if $(BR2_TARGET_ROOTFS_CPIO),
