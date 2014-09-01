From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Sep 2014 12:09:37 +0200
Subject: [Buildroot] [PATCH] Add support for Flattened Image Trees
Message-ID: <CAGm1_kutYAhSCBP+bfqUa4azxmq==H9-mkwgBBaY6GK35MTQCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here is my first attempt to add basic FIT image support. I'm sending
this as attachment because of ISP issue. I'll resend the patch inline
from home later.

The main idea is to let the user specify a path to the *.its file and
the name of the resulting *.itb files name. I have multiple its file
for various devices, but always use kernel-fit.itb as binary. As
mkimage invokes dtc compiler, it has some issues with a working dir,
so I copy *.its file to output/images and then invoke the mkimage.

As for installation, how can I properly embed an if-statement  in
define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET, so that, if FIT support
is selected, then only itb file, but not kernel image/DTB will be
copied to /boot?

ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
        install -m 0644 -D $(LINUX_IMAGE_PATH)
$(TARGET_DIR)/boot/$(LINUX_IMAGE_NAME)
        $(LINUX_INSTALL_DTB_TARGET)
        $(LINUX_INSTALL_ITB_TARGET)
endef
endif

So far only kernel image + DTB embedding is supported. If one would
like to embed initramfs, special handling in CPIO archive creating
script must be done.

What do you think about my approach?

Regards,
Yegor
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Add-support-for-Flattened-Image-Trees.patch
Type: application/octet-stream
Size: 2551 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140901/766d8929/attachment.obj>
