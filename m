From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 23:05:01 +0200
Subject: [Buildroot] [PATCH 2/3] linux: only install the DTBs when not in
	appended DTB mode
In-Reply-To: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445202302-2720-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1445202302-2720-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When you're using the "appended DTB" mode, the Device Tree blob gets
appended to your kernel image, so there is no point in installing both
the DTB and the kernel image to the images or target directories,
installing the kernel image itself is sufficient.

Therefore, this commit disables the definition of LINUX_INSTALL_DTB
when appended DTB is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 149bd69..59e1bb4 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -231,6 +231,7 @@ ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
 	cp $(addprefix \
@@ -238,8 +239,9 @@ define LINUX_INSTALL_DTB
 		$(addprefix $(KERNEL_ARCH_PATH)/boot/dts/,$(KERNEL_DTBS))),dts/),$(KERNEL_DTBS)) \
 		$(1)
 endef
-endif
-endif
+endif # BR2_LINUX_KERNEL_APPENDED_DTB
+endif # BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
+endif # BR2_LINUX_KERNEL_DTS_SUPPORT
 
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
 # dtbs moved from arch/$ARCH/boot to arch/$ARCH/boot/dts since 3.8-rc1
-- 
2.6.2
