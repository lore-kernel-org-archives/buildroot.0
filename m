From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jun 2013 09:25:43 +0200
Subject: [Buildroot] Build kernel with devicetree support
In-Reply-To: <20130604101820.Horde.Y0PAK1HM6z3pTjPtdLCJCA1@www.mit.bme.hu>
References: <20130604101820.Horde.Y0PAK1HM6z3pTjPtdLCJCA1@www.mit.bme.hu>
Message-ID: <20130605092543.62a08c4e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 04 Jun 2013 10:18:20 +0200, wacha at mit.bme.hu wrote:

> I am trying to build a root file system and the Linux kernel with buildroot.
> 
> Because it is a custom hardware, I've set the device tree source  
> option to use a custom device tree file.
> My device tree source file path is set to the device tree file name,  
> which resides in the buildroot top level directory.
> 
> With that configuration the kernel fails to build from source:

Can you try the untested patch below?

diff --git a/linux/linux.mk b/linux/linux.mk
index 11b32c3..177446d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -55,7 +55,7 @@ LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-
 ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
 KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
 else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
-KERNEL_DTS_NAME = $(basename $(notdir $(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))
+KERNEL_DTS_NAME = $(basename $(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))
 endif
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
