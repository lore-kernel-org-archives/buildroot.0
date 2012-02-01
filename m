From: Warlich, Christof <christof.warlich@siemens.com>
Date: Wed, 1 Feb 2012 09:35:06 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
Message-ID: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have an issue with the integration of an external toolchain into buildroot. When I do this,
buildroot complains "Incorrect selection of the C library".

Digging for the root case of the problem, I found that SYSROOT_DIR is not calculated correctly
in toolchain/toolchain-external/ext-tool.mk. To fix the problem, I had to replace line 272 of that file:

SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \

with

SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a) |sed -r -e 's:lib/libc\.a::;'` ; \

As I'm just new to buildroot, I'm not sure if this is a bug or if this fix is just needed due to an uncommon
packaging of my external toolchain. I'm using the latest buildroot release, i.e. buildroot-2011.11. The
(downstripped) directory structure of my toolchain looks like this:

linux_tools
linux_tools/man
linux_tools/man/man7
linux_tools/man/man1
linux_tools/lib
linux_tools/lib/gcc
linux_tools/lib/gcc/i686-v42-linux
linux_tools/lib/gcc/i686-v42-linux/4.2.3
linux_tools/lib/gcc/i686-v42-linux/4.2.3/install-tools
linux_tools/lib/gcc/i686-v42-linux/4.2.3/install-tools/include
linux_tools/lib/gcc/i686-v42-linux/4.2.3/include
linux_tools/lib/gcc/i686-v42-linux/4.2.3/include/ssp
linux_tools/libexec
linux_tools/libexec/gcc
linux_tools/libexec/gcc/i686-v42-linux
linux_tools/libexec/gcc/i686-v42-linux/4.2.3
linux_tools/libexec/gcc/i686-v42-linux/4.2.3/install-tools
linux_tools/info
linux_tools/bin
linux_tools/i686-v42-linux
linux_tools/i686-v42-linux/lib
linux_tools/i686-v42-linux/lib/ldscripts
linux_tools/i686-v42-linux/lib/gconv
linux_tools/i686-v42-linux/libexec
linux_tools/i686-v42-linux/libexec/getconf
linux_tools/i686-v42-linux/bin
linux_tools/i686-v42-linux/sbin
linux_tools/i686-v42-linux/include
linux_tools/i686-v42-linux/etc
linux_tools/i686-v42-linux/share
linux_tools/share

and my PATH / PREFIX setting in menuconfig is: /someDirectory/linux_tools / $(ARCH)-v42 with $(ARCH) == i686.

Can anyone help in telling me if I found (and fixed? :-)) a bug in buildroot or if something is wrong with my toolchain,
and if so, what's wrong?

Thanks for any help,

Chris


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120201/e882c713/attachment-0001.html>
