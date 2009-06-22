From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jun 2009 15:25:33 +0200
Subject: [Buildroot] [git commit] busybox: autodetect nfs mount support
	based on BR2_INET_RPC setting
Message-ID: <20090622132901.908E1777DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab5208886e80ddaeb67af18797b6116e1ec4436f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Override nfs mount support based on BR2_INET_RPC setting, so BR will DTRT.
This way you will automatically get NFS support in busybox if available in
the toolchain, and the build won't break if the defconfig enables it but
the user has it disabled in the toolchain.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index fcec41a..a5978da 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -72,6 +72,11 @@ ifeq ($(BR2_INET_IPV6),y)
 else
 	$(SED) "s/^.*CONFIG_FEATURE_IPV6.*/CONFIG_FEATURE_IPV6=n/;" $(BUSYBOX_DIR)/.config
 endif
+ifeq ($(BR2_INET_RPC),y)
+	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=y/;" $(BUSYBOX_DIR)/.config
+else
+	$(SED) "s/^.*CONFIG_FEATURE_MOUNT_NFS.*/CONFIG_FEATURE_MOUNT_NFS=n/;" $(BUSYBOX_DIR)/.config
+endif
 ifeq ($(BR2_PACKAGE_BUSYBOX_SKELETON),y)
 	# force mdev on
 	$(SED) "s/^.*CONFIG_MDEV.*/CONFIG_MDEV=y/" $(BUSYBOX_DIR)/.config
-- 
1.6.0.6
