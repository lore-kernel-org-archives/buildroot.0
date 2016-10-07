From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 22:35:48 +0200
Subject: [Buildroot] [git commit] boot/uboot: Call 'make all' unconditionally
Message-ID: <20161007203805.BA18B81E1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a481bec1a592845c3777705865adb382ece1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit fad58cefa4a392b ("boot/uboot: allow to build multiple U-Boot
images") the installation of SPL binary fails.

For example, when building the mx6cubox_defconfig target we see:

  LD      u-boot
  OBJCOPY u-boot-nodtb.bin
  COPY    u-boot.bin
  MKIMAGE u-boot.img
>>> uboot 2016.09.01 Installing to target
>>> uboot 2016.09.01 Installing to images directory
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.bin /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/u-boot.img /home/fabio/buildroot/output/images/
cp -dpf /home/fabio/buildroot/output/build/uboot-2016.09.01/SPL /home/fabio/buildroot/output/images/
cp: cannot stat '/home/fabio/buildroot/output/build/uboot-2016.09.01/SPL': No such file or directory

Instead of calling 'make all' only for the BR2_TARGET_UBOOT_FORMAT_DTB_IMG
case, call 'make all' unconditionally so that the SPL target can also
be installed.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 7379a4d..86e5b84 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -48,6 +48,9 @@ UBOOT_MAKE_TARGET += mdbtrick
 endif
 endif
 
+# Call 'make all' unconditionally
+UBOOT_MAKE_TARGET += all
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BINS += u-boot.kwb
 UBOOT_MAKE_TARGET += u-boot.kwb
@@ -68,7 +71,7 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
 UBOOT_BINS += u-boot-dtb.img
-UBOOT_MAKE_TARGET += all u-boot-dtb.img
+UBOOT_MAKE_TARGET += u-boot-dtb.img
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
