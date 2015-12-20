From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 15:23:07 +0100
Subject: [Buildroot] [git commit] linux: only install the DTBs when not in
	appended DTB mode
Message-ID: <20151220142434.CC1287F975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=24745cb4be748df7fea28195236fe60bb14bef0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
index 5d6791a..536e931 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -257,6 +257,7 @@ ifeq ($(BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT),)
 define LINUX_BUILD_DTB
 	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(KERNEL_DTBS)
 endef
+ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),)
 define LINUX_INSTALL_DTB
 	# dtbs moved from arch/<ARCH>/boot to arch/<ARCH>/boot/dts since 3.8-rc1
 	cp $(addprefix \
@@ -264,8 +265,9 @@ define LINUX_INSTALL_DTB
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
