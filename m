From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 17 Jul 2015 11:49:04 -0700
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <20150717194128.7c22974b@free-electrons.com>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>	<55A926DC.9010803@mentor.com>	<20150717163442.GA6466@fox>
 <20150717194128.7c22974b@free-electrons.com>
Message-ID: <55A94E20.2000506@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/2015 10:41 AM, Thomas Petazzoni wrote:
> One thing that we should do is to generalize this appended DTB
> mechanism to make it possible to generate several appended images.
> Currently, since we append to the zImage directly, we cannot generate
> several images, each using a different DTB. By generating to
> zImage.<dtb-name>, we can generate multiple images (and also avoid the
> overwriting problem).

A bit of a tangent now, but I am trying to write a recipe for another 
bootwrapper, which prepends a little code to a zImage/DTB combo. Right 
now, it basically boils down to this:

    define BOOT_WRAPPER_ARM_BUILD_CMDS

         $(MAKE) CROSS_COMPILE=$(TARGET_CROSS) DTBIMAGE=$(BINARIES_DIR)/zImage -C $(@D)

    endef


Practically speaking, I think the bootwrapper is only really useful in 
the BR2_LINUX_KERNEL_APPENDED_ZIMAGE case, and I can enforce that via 
Kconfig dependencies, so I can assume the kernel name is "zImage".

If your idea above is implemented, would I need to duplicate the 
linux.mk logic around  BR2_LINUX_KERNEL_USE_INTREE_DTS, 
BR2_LINUX_KERNEL_INTREE_DTS_NAME, BR2_LINUX_KERNEL_USE_CUSTOM_DTS, and 
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH? Or is there a better way to do this?

Thanks.

Hollis Blanchard
Mentor Graphics Emulation Division
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150717/ae8ff273/attachment.html>
