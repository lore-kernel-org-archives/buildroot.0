From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:38:08 +0100
Subject: [Buildroot] [git commit] linux: fix recursively defined variable
Message-ID: <20141215215003.B12F17FC6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d4b2b032a00c9922c9efa144b014dc086a7e48f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When running 'make printvars', the output stops at the time we dump the
Linux related variables, with:

    linux/linux.mk:109: *** Recursive variable `LINUX_TARGET_NAME'
    references itself (eventually).  Stop.

And that's expected, since we have:

    109 LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
    [...]
    112 ifeq ($(LINUX_IMAGE_NAME),)
    113 LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
    114 endif

Even though they are defined in a way that ensures they are in fact not
recursively defined (the if-block ensures that), 'printvars' does dump
all our variables by evaluating all of them, which in that specific case
implies they are recursively defined.

Fix that by explicitly setting LINUX_IMAGE_NAME in each if-block.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 6740d01..36f0230 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -82,6 +82,7 @@ KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
 ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_NAME))
 LINUX_TARGET_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
+LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
 LINUX_IMAGE_NAME = uImage
@@ -106,13 +107,12 @@ LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 endif
+# The if-else blocks above are all the image types we know of, and all
+# come from a Kconfig choice, so we know we have LINUX_IMAGE_NAME set
+# to something
 LINUX_TARGET_NAME = $(LINUX_IMAGE_NAME)
 endif
 
-ifeq ($(LINUX_IMAGE_NAME),)
-LINUX_IMAGE_NAME = $(LINUX_TARGET_NAME)
-endif
-
 LINUX_KERNEL_UIMAGE_LOADADDR = $(call qstrip,$(BR2_LINUX_KERNEL_UIMAGE_LOADADDR))
 ifneq ($(LINUX_KERNEL_UIMAGE_LOADADDR),)
 LINUX_MAKE_FLAGS += LOADADDR="$(LINUX_KERNEL_UIMAGE_LOADADDR)"
