From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 14 Jul 2015 10:02:56 -0500
Subject: [Buildroot] [PATCH v3 1/1] linux: add config options for nfs-utils
Message-ID: <1436886176-118956-1-git-send-email-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When nfs-utils packages is selected, automatically enable the kernel
options for NFSD. This will allow for an NFS server to work by only
adding /etc/exports to the filesystem.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
Test with qemu_x86_defconfig

Changes v2 -> v3:
  - Add CONFIG_NFSD_V3 option as well to really support only v3 of NFS

Changes v1 -> v2:
  - Only enable CONFIG_NFSD (suggested by Arnout)
---
 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 8c535f3..31e1f01 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -217,6 +217,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
+	$(if $(BR2_PACKAGE_NFS_UTILS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NFSD_V3,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
 endef
-- 
1.9.1
