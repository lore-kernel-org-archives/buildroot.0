From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 2 Oct 2008 10:31:59 +0200
Subject: [Buildroot] No rule to make target
 /buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.libs_installed
In-Reply-To: <49ED01FC03EE524BB7BB258E8F93BFF32B27CE@bfl-exchange-1.BFL.local>
References: <49ED01FC03EE524BB7BB258E8F93BFF32B27CE@bfl-exchange-1.BFL.local>
Message-ID: <20081002103159.26e11d5a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Oct 2008 10:02:53 +0200
"Matuschka, Sebastian" <Sebastian.Matuschka@gcd-solutions.de> wrote:

> Hi,
> 
> i'm using the buildroot-avr32-v2.2.0 from atmel.no now.
> Compiling with atstk1002_defconfig works, but i had to change a few
> things which i need or not need for our board, which is based on the
> atstk1002.
> Now i get this error every time i make it:
> mkdir -p
> /buildroot-avr32-v2.2.0/project_build_avr32/RavenBT/root/usr/lib
> /buildroot-avr32-v2.2.0/project_build_avr32/RavenBT/root/usr/sbin
> touch
> /buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.installed
> make: *** No rule to make target
> >/buildroot-avr32-v2.2.0/toolchain_build_avr32/gcc-4.2.2-final/.libs_ins
> talled<,
>   needed by `cross_compiler'. Stop.
> 

Aha, you have enabled sysroot in GCC, I have not tested that. Could you
try the attached patch?

If it does not work, there is something wrong ongoing in
toolchain/gcc/gcc-uclibc-4.x.mk

> I've used make clean, make distclean, deleted toolchain_build_avr32
> completely, played with make menuconfig, but I get this error every
> time I run make.
> 
> I guess that the point where this error occurs is in
> toolchain/gcc/gcc-uclibc-4.x.mk (Line 390):
> cross_compiler:=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-gcc
> cross_compiler gcc: uclibc-configured binutils gcc_initial \
> 	$(LIBFLOAT_TARGET) uclibc \
> 	$(GCC_BUILD_DIR2)/.installed
> $(GCC_BUILD_DIR2)/.libs_installed \ $(GCC_TARGETS)
> 
> But I don't know what to correct now.
> 

Let me know if the patch works for you.

-- 
Best regards,
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-with-sysroot-fix-libs-installed-rule.patch
Type: text/x-patch
Size: 584 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081002/0fd483af/attachment.bin 
