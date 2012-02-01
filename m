From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 1 Feb 2012 16:05:42 +0100
Subject: [Buildroot] External Toolchain: Calculation of SYSROOT_DIR in
 toolchain/toolchain-external/ext-tool.mk wrong?
In-Reply-To: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
References: <4666169C600DD24C84F509DC90790D5007629FD2B5@DEMCHP99E75MSX.ww902.siemens.net>
Message-ID: <CAAXf6LV7xoqmU5rtYy=6AnhDObq5y9d_Lv626RN8E7Eg+Ri9Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Feb 1, 2012 at 9:35 AM, Warlich, Christof
<christof.warlich@siemens.com> wrote:
> Hi,
>
> I have an issue with the integration of an external toolchain into
> buildroot. When I do this,
> buildroot complains "Incorrect selection of the C library".
>
> Digging for the root case of the problem, I found that SYSROOT_DIR is not
> calculated correctly
> in toolchain/toolchain-external/ext-tool.mk. To fix the problem, I had to
> replace line 272 of that file:
>
> SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC)
> -print-file-name=libc.a) |sed -r -e 's:usr/lib/libc\.a::;'` ; \
>
> with
>
> SYSROOT_DIR=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC)
> -print-file-name=libc.a) |sed -r -e 's:lib/libc\.a::;'` ; \
>
> As I'm just new to buildroot, I'm not sure if this is a bug or if this fix
> is just needed due to an uncommon
> packaging of my external toolchain. I'm using the latest buildroot release,
> i.e. buildroot-2011.11. The
> (downstripped) directory structure of my toolchain looks like this:
>
> linux_tools
> linux_tools/man
> linux_tools/man/man7
> linux_tools/man/man1
> linux_tools/lib
> linux_tools/lib/gcc
> linux_tools/lib/gcc/i686-v42-linux
> linux_tools/lib/gcc/i686-v42-linux/4.2.3
> linux_tools/lib/gcc/i686-v42-linux/4.2.3/install-tools
> linux_tools/lib/gcc/i686-v42-linux/4.2.3/install-tools/include
> linux_tools/lib/gcc/i686-v42-linux/4.2.3/include
> linux_tools/lib/gcc/i686-v42-linux/4.2.3/include/ssp
> linux_tools/libexec
> linux_tools/libexec/gcc
> linux_tools/libexec/gcc/i686-v42-linux
> linux_tools/libexec/gcc/i686-v42-linux/4.2.3
> linux_tools/libexec/gcc/i686-v42-linux/4.2.3/install-tools
> linux_tools/info
> linux_tools/bin
> linux_tools/i686-v42-linux
> linux_tools/i686-v42-linux/lib
> linux_tools/i686-v42-linux/lib/ldscripts
> linux_tools/i686-v42-linux/lib/gconv
> linux_tools/i686-v42-linux/libexec
> linux_tools/i686-v42-linux/libexec/getconf
> linux_tools/i686-v42-linux/bin
> linux_tools/i686-v42-linux/sbin
> linux_tools/i686-v42-linux/include
> linux_tools/i686-v42-linux/etc
> linux_tools/i686-v42-linux/share
> linux_tools/share
>
> and my PATH / PREFIX setting in menuconfig is: /someDirectory/linux_tools /
> $(ARCH)-v42 with $(ARCH) == i686.
>
> Can anyone help in telling me if I found (and fixed? :-)) a bug in buildroot
> or if something is wrong with my toolchain,
> and if so, what's wrong?

How is this toolchain built? Or more importantly, how is it packaged?

Isn't this problem simply caused by the fact that the root of your
packaged toolchain is already inside 'usr/', instead of just above it?

In my case, I build a crosstool-ng toolchain with buildroot. I then
package it by going to output/host and tarring the entire usr/
directory. This way, the toolchain has a structure like (stripped):

usr/lib/gcc/
usr/lib/gcc/powerpc-unknown-linux-gnu/
usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/
usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/include/
usr/lib/gcc/powerpc-unknown-linux-gnu/4.4.3/include/stdfix.h
...
usr/sbin/
usr/libexec/
usr/libexec/awk/
usr/libexec/awk/pwcat
usr/libexec/awk/grcat
usr/libexec/gcc/
usr/libexec/gcc/powerpc-unknown-linux-gnu/
usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/
usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/
usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/fixinc.sh
usr/libexec/gcc/powerpc-unknown-linux-gnu/4.4.3/install-tools/mkheaders
...

I think your problem would be fixed if you change the way you package
the toolchain.

Of course, if this toolchain came to you pre-packaged, it may be
better to fix buildroot to find everything automatically.

Best regards,
Thomas
