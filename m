From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 15:00:48 +0100
Subject: [Buildroot] [git commit] linux: fix breakage from
	d4b2b032a00c9922c9efa144b014dc086a7e48f1
Message-ID: <20141224140053.B66438078A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49b147ccbb807238009fde815ad68e953077bc3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unbreak qemu_xtensa_lx60_defconfig where LINUX_IMAGE_NAME !=
LINUX_TARGET_NAME.
It incorrectly overwrites LINUX_IMAGE_NAME even if it was set before,
defeating the purpose of IMAGE being different than TARGET.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 36f0230..8256641 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -82,7 +82,9 @@ KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
 LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+ifeq ($(LINUX_IMAGE_NAME),)
 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
+endif
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
