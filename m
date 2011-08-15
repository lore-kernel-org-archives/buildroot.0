From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Aug 2011 14:09:57 +0200
Subject: [Buildroot] [git commit] udev: ensure /dev mgmt option is in sync
Message-ID: <20110815121044.3E9CC8C8E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1add7c592bff56c5115997ab9b42e0fd9a5947ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These options should be in sync, both for consistency and because udev
needs devtmpfs enabled in the kernel.

We unfortunately cannot just select BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
here, as that one selects udev - leading to recursion erors, so instead
we use depends on.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 67fd413..391c718 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_UDEV
 	bool "udev"
+	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
 	help
 	  Userspace device daemon.
 
@@ -25,3 +26,6 @@ comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 endif
+
+comment "udev requires /dev mgmnt set to udev under System configuration"
+	depends on !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
-- 
1.7.3.4
