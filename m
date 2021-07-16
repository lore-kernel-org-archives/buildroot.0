From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:18:35 +0200
Subject: [Buildroot] [git commit] package/qemu: virtfs needs system
Message-ID: <20210716204455.10E4691153@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=9905fea69ee6682fdbb3c683efc9d9cdcd672ad9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

build of qemu with virtfs but without system fails since bump to version
6.0.0 in commit	6b86c9335fc3ff381878156c6243454d4b688df9:

../meson.build:1077:6: ERROR: Problem encountered: virtio-9p (virtfs) needs system emulation support

Indeed virtfs needs system support since switch to meson in
https://gitlab.com/qemu-project/qemu/-/commit/69202b406e3a42621a063c3afe80f580d343f59e

Fixes:
 - http://autobuild.buildroot.org/results/ee4b2bbc08c58dc972d285eafa43b7ad6586f270

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 3163797067..2dcf5631e5 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -82,6 +82,7 @@ config BR2_PACKAGE_HOST_QEMU_VDE2
 
 config BR2_PACKAGE_HOST_QEMU_VIRTFS
 	bool "Virtual filesystem support"
+	depends on BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE
 	help
 	  Enables support for virtual filesystem in Qemu allowing
 	  shared filesystem between Qemu and its emulated target.
