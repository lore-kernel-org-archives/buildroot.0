From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Jul 2021 17:54:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/qemu: virtfs needs system
Message-ID: <20210710155409.1333292-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

build of qemu with virtfs but without system fails since bump to version
6.0.0 in commit	6b86c9335fc3ff381878156c6243454d4b688df9:

../meson.build:1077:6: ERROR: Problem encountered: virtio-9p (virtfs) needs system emulation support

Indeed virtfs needs system support since switch to meson in
https://gitlab.com/qemu-project/qemu/-/commit/69202b406e3a42621a063c3afe80f580d343f59e

Fixes:
 - http://autobuild.buildroot.org/results/ee4b2bbc08c58dc972d285eafa43b7ad6586f270

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 3163797067..c176001396 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -82,6 +82,8 @@ config BR2_PACKAGE_HOST_QEMU_VDE2
 
 config BR2_PACKAGE_HOST_QEMU_VIRTFS
 	bool "Virtual filesystem support"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
 	  Enables support for virtual filesystem in Qemu allowing
 	  shared filesystem between Qemu and its emulated target.
-- 
2.30.2
