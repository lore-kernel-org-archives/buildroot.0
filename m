From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:28:25 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/skeleton-init-openrc: fix root filesystem ro/rw remount
Message-ID: <20200314161556.02DCE83661@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7faac6dabe300930e8e03fd9b9a40cda0aadca71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The regular expressions used in the sed commands assumes that there is a
space after '/dev/root' but the skeleton file contains a tab. Use a more
flexible '[[:blank:]]', instead.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c51c981a060d11f2cbc7c389ab649f84029c4646)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/skeleton-init-openrc/skeleton-init-openrc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skeleton-init-openrc/skeleton-init-openrc.mk b/package/skeleton-init-openrc/skeleton-init-openrc.mk
index 656fc531d7..b0538ad03f 100644
--- a/package/skeleton-init-openrc/skeleton-init-openrc.mk
+++ b/package/skeleton-init-openrc/skeleton-init-openrc.mk
@@ -19,13 +19,13 @@ ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
 # Comment /dev/root entry in fstab. When openrc does not find fstab entry for
 # "/", it will try to remount "/" as "rw".
 define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
-	$(SED) '\:^/dev/root :s/^/# /' $(TARGET_DIR)/etc/fstab
+	$(SED) '\:^/dev/root[[:blank:]]:s/^/# /' $(TARGET_DIR)/etc/fstab
 endef
 else
 # Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
 # it and doesn't remount root to rw.
 define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
-	$(SED) '\:^# /dev/root:s/^# //' $(TARGET_DIR)/etc/fstab
+	$(SED) '\:^#[[:blank:]]*/dev/root[[:blank:]]:s/^# //' $(TARGET_DIR)/etc/fstab
 endef
 endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
 
