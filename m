From: robert.mccabe at rockwellcollins.com <robert.mccabe@rockwellcollins.com>
Date: Mon,  8 Jul 2019 19:58:20 -0500
Subject: [Buildroot] [RFC] BR2_EXTERNAL linux-kernel-extensions support
Message-ID: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>

Allows external projects to inject custom code inside the Linux source
tree.

Although a simple change that *shouldn't* be controversial I'm troubled
by the comment a few lines above:

   #However, since the files we include here are in the same directory as
   #the current Makefile, we are OK. But this is a hard requirement: files
   #included here *must* be in the same directory!

I'm not seeing why this is a "hard requirement" ...

Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
---
 linux/linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 2b5d096e14..af3de401d1 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -514,6 +514,12 @@ endef
 # included here *must* be in the same directory!
 include $(sort $(wildcard linux/linux-ext-*.mk))

+define INCLUDE_EXTERNAL_LINUX_EXTENSIONS
+-include $(sort $(wildcard $(1)/linux/linux-ext-*.mk))
+endef
+$(foreach ext,$(BR2_EXTERNAL_DIRS), \
+       $(eval $(call INCLUDE_EXTERNAL_LINUX_EXTENSIONS,$(ext))))
+
 LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
        $(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))

--
2.17.1
