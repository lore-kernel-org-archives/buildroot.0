From: Paassen, Hiram van <Hiram.van.Paassen@mastervolt.com>
Date: Wed, 12 Nov 2014 12:21:12 +0000
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <20141112110354.1a6bcc98@free-electrons.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
Message-ID: <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On wo, 2014-11-12 at 11:03 +0100, Thomas Petazzoni wrote:
> Dear Sid Bharij,
>
> On Tue, 11 Nov 2014 23:04:31 -0600, Sid Bharij wrote:
>
> > I have been successful in getting the Linux kernel running on
> > raspberry pi using build root. I wanted to create my own simple driver
> > (a kernel module) and make it a part of the kernel. How can I do that
> > using buildroot?
>
> When I do my kernel development, I do it outside Buildroot, i.e I just
> build the kernel separately. If needed, once the kernel development is
> done, I use the final kernel version with my developments in Buildroot.
>
> If you really want to do it with Buildroot, have a look at the
> OVERRIDE_SRCDIR feature in the Buildroot manual.
>
> Best regards,
>
> Thomas

As an alternative we use a buildroot package with something like this in
it:

KERNELMODULE_DEPENDENCIES = linux

define KERNELMODULE_BUILD_CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define KERNELMODULE_INSTALL_TARGET_CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))


which basically builds a normal out of tree module.
So your source folder would contain you foo.c file an a makefile
suitable for normal out of tree building:

ifneq ($(KERNELRELEASE),)
# kbuild part of makefile
obj-m  := foo.o

else
# normal makefile
KDIR ?= /lib/modules/`uname -r`/build

default:
        $(MAKE) -C $(KDIR) M=$$PWD
clean:
        $(MAKE) -C $(KDIR) M=$$PWD clean
endif

Hiram

________________________________

Power Products, LLC Email Notice

This message is intended only for the use of the Addressee and may contain information that is PRIVILEGED and/or CONFIDENTIAL.
This email is intended only for the personal and confidential use of the recipient(s) named above. If the reader of this email is not an intended recipient, you have received this email in error and any review, dissemination, distribution or copying is strictly prohibited.
If you have received this email in error, please notify the sender immediately by return mail and permanently delete the copy you received.

Thank you.
