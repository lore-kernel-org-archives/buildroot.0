From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri, 26 Sep 2014 20:22:54 -0300
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
Message-ID: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, if we run "make linux-rebuild", the device tree blob gets
appended twice to the kernel image, rendering the latter append useless.

Fix this by removing the zImage before building, so the DTB append runs
on a fresh kernel image. This is not optimal as the final Linux linking
step is run again, but at least we get sensible results.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
Hi guys,

Has anyone ran into the above problem? It was a small headache for me,
so I wrote this small patch.

It's not great, the right thing to do would be copying the zImage out
of the kernel tree and appending the DTB there, but my attempt at doing
that broke some other builds. This should work every time.


 linux/linux.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2fb7437..14c2b8e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -263,6 +263,10 @@ endif
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
+	# Remove the previous image, if it exists, to prevent appending
+	# multiple DTBs
+	rm -f $(KERNEL_ARCH_PATH)/boot/zImage
+
 	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
 		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
 	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-- 
2.1.0
