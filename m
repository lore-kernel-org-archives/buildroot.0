From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 4 Nov 2012 01:11:02 +0100
Subject: [Buildroot] [git commit] busybox: don't force FEATURE_NFS_MOUNT
Message-ID: <20121104090717.5C8F299929@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f579792f1bb79e3a525029c9f58d360d2931cef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of making the Busybox configuration more complicated by trying
to adjust it depending on whether RPC is available or not (which gets
complicated when RPC support can be provided by libtirpc), simplify
things by letting the user enable FEATURE_NFS_MOUNT or not depending
on whether RPC support is available or not.

Our default configuration do not enable FEATURE_NFS_MOUNT, so users
will not face any build problems by default. Only if they explicitly
enable FEATURE_NFS_MOUNT will they have to make sure that the
toolchain has RPC support, or that libtirpc is enabled (support for
this added in a followup patch).

[Peter: remove from CONFIGURE_CMDS as well]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox.mk |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 33f8633..2fa1aa5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -81,17 +81,6 @@ define BUSYBOX_SET_IPV6
 endef
 endif
 
-# If RPC is enabled then enable nfs mounts
-ifeq ($(BR2_INET_RPC),y)
-define BUSYBOX_SET_RPC
-	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
-endef
-else
-define BUSYBOX_SET_RPC
-	$(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_MOUNT_NFS,$(BUSYBOX_BUILD_CONFIG))
-endef
-endif
-
 # If we're using static libs do the same for busybox
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define BUSYBOX_PREFER_STATIC
@@ -170,7 +159,6 @@ BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
 define BUSYBOX_CONFIGURE_CMDS
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)
-	$(BUSYBOX_SET_RPC)
 	$(BUSYBOX_PREFER_STATIC)
 	$(BUSYBOX_SET_MDEV)
 	$(BUSYBOX_NETKITBASE)
