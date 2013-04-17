From: Magnus Edenhill <magnus@edenhill.se>
Date: Wed, 17 Apr 2013 12:51:09 +0200
Subject: [Buildroot] [PATCH] [RFC] BR2_KERNEL_HEADERS_TARGET: Add support
 for using target kernel for toolchain kernel headers.
Message-ID: <CAHCQUcAoruaNKt98BFU=fHpF2V6x4VbNg0J+kiuZ2n8zzKP9Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows the toolchain to use the target kernel's headers instead
of having to download an  additional linux tree just for the toolchain.

Tested with the internal toolchain.

Only problem observed is that the kernel-headers..../.unpacked target is
recreated on sub-sequent 'make' invocations, which recreates uclibc. But
someone with more make-wizardry may be able to solve that.

It also copies the linux source, which may not be strictly required, but it
seemed to be the safest option for now.

---
 toolchain/kernel-headers/Config.in         |    8 ++++++++
 toolchain/kernel-headers/kernel-headers.mk |    8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/toolchain/kernel-headers/Config.in
b/toolchain/kernel-headers/Config.in
index 6155ef1..dc04fd2 100644
--- a/toolchain/kernel-headers/Config.in
+++ b/toolchain/kernel-headers/Config.in
@@ -52,6 +52,13 @@ choice

  config BR2_KERNEL_HEADERS_SNAP
  bool "Local Linux snapshot (linux-2.6.tar.bz2)"
+
+ config BR2_KERNEL_HEADERS_TARGET
+ bool "Target Linux kernel"
+ depends on BR2_LINUX_KERNEL
+ help
+  Use the Linux kernel specified for the target in
+  the Kernel menu.
 endchoice

 config BR2_DEFAULT_KERNEL_VERSION
@@ -73,4 +80,5 @@ config BR2_DEFAULT_KERNEL_HEADERS
  default "3.7.10" if BR2_KERNEL_HEADERS_3_7
  default "3.8.7" if BR2_KERNEL_HEADERS_3_8
  default "2.6" if BR2_KERNEL_HEADERS_SNAP
+ default "target.0" if BR2_KERNEL_HEADERS_TARGET
  default $BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
diff --git a/toolchain/kernel-headers/kernel-headers.mkb/toolchain/kernel-headers/
kernel-headers.mk
index adf7bc4..731f508 100644
--- a/toolchain/kernel-headers/kernel-headers.mk
+++ b/toolchain/kernel-headers/kernel-headers.mk
@@ -42,8 +42,12 @@ $(LINUX_HEADERS_UNPACK_DIR)/.unpacked:
$(DL_DIR)/$(LINUX_HEADERS_SOURCE)
  $(Q)$(call MESSAGE,"Extracting kernel headers")
  rm -rf $(LINUX_HEADERS_DIR)
  $(INSTALL) -d $(@D)
+ifeq ($(BR2_KERNEL_HEADERS_TARGET),y)
+ rsync -au $(LINUX_DIR)/ $(@D)
+else
  $(LINUX_HEADERS_CAT) $(DL_DIR)/$(LINUX_HEADERS_SOURCE) | \
  tar $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
+endif
  touch $@

 $(LINUX_HEADERS_UNPACK_DIR)/.patched:
$(LINUX_HEADERS_UNPACK_DIR)/.unpacked $(LINUX_HEADERS_DEPENDS)
@@ -66,12 +70,16 @@ $(LINUX_HEADERS_DIR)/.configured:
$(LINUX_HEADERS_UNPACK_DIR)/.patched
  )
  touch $@

+ifeq ($(BR2_KERNEL_HEADERS_TARGET),y)
+$(DL_DIR)/$(LINUX_HEADERS_SOURCE): linux-source linux-extract
+else
 $(DL_DIR)/$(LINUX_HEADERS_SOURCE):
 ifeq ($(BR2_KERNEL_HEADERS_SNAP),y)
  $(error No local $@ found, cannot continue. Are you sure you wanted to
enable BR2_KERNEL_HEADERS_SNAP?)
 endif
  $(Q)$(call MESSAGE,"Downloading kernel headers")
  $(call DOWNLOAD,$(LINUX_HEADERS_SITE:/=)/$(LINUX_HEADERS_SOURCE))
+endif

 kernel-headers: $(LINUX_HEADERS_DIR)/.configured

-- 
1.7.9.5
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130417/c9bb3b11/attachment.html>
