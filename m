From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:47 +0100
Subject: [Buildroot] [PATCH 02/18] busybox: don't force FEATURE_NFS_MOUNT
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ce9a6aa9dfc0c6dc3496b272670a8370b638aa21.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |   11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 33f8633..306b46f 100644
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
-- 
1.7.9.5
