From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Oct 2015 21:59:44 +0200
Subject: [Buildroot] [git commit] uboot: arm64 arch build support
Message-ID: <20151012200026.B18FD81EA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4730df02cf236eefeaf00bec197e398ad12cfeaa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a 64bit arm architecture, Buildroot uses arm64 terminology and
from the top-level Makefile KERNEL_ARCH is set to arm64 which is then
passed to the uboot build.  This causes a compilation issue as uboot
uses the top-level system architecture as it's $(ARCH).  So
arch/$(ARCH)/Makefile doesn't work with arm64 unless we adjust the
arch.

[Thomas:
 - rewrap commit message text.
 - simplify comment in the code.]

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index eee0dba..66e728f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -71,7 +71,13 @@ UBOOT_BIN = u-boot.bin
 UBOOT_BIN_IFT = $(UBOOT_BIN).ift
 endif
 
+# The kernel calls AArch64 'arm64', but U-Boot calls it just 'arm', so
+# we have to special case it.
+ifeq ($(KERNEL_ARCH),arm64)
+UBOOT_ARCH = arm
+else
 UBOOT_ARCH = $(KERNEL_ARCH)
+endif
 
 UBOOT_MAKE_OPTS += \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
