From: Pavel Roskin <proski@gnu.org>
Date: Wed, 29 Nov 2006 20:07:49 -0500
Subject: [Buildroot] Impossible to build EABI ARM gcc toolchain
	using	Buildroot ?
In-Reply-To: <loom.20061129T130728-811@post.gmane.org>
References: <loom.20061129T130728-811@post.gmane.org>
Message-ID: <1164848869.23643.60.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

On Wed, 2006-11-29 at 13:25 +0000, MikeW wrote:

> If I set the target suffix to 'elf-linux' the toolchain build
> completes, but objects created with it have EABI version=0 (= no EABI).
> (These will not link with a 3rd-party-built library with EABI version=4.)

How do you check that?

> If I set to to 'armelf-linux-eabi' or one of the other likely-
> looking values, I get a build error from ld: 
>  in/ld: unrecognised emulation mode: armelf_linux
>  Supported emulations: armelf_linux_eabi

You don't need the CPU part in the target, only the OS and the kernel
part.  In other word, you need something like "linux", "linux-gnu",
"linux-uclibc" etc.

> I can't see any other likely setting to change ...
> 
> Any ideas ?
> Or do a need a newer version of Buildroot ... or a patch ?

Remove BR2_GNU_TARGET_SUFFIX from .config and run "make oldconfig".  The
suggested value will be "linux-uclibcgnueabi" and it should work.

To make sure the suffix would work, run recent config.sub with the
arm-unknown-SUFFIX argument and make sure it's accepted.  Sometimes
config.sub can become confused if it doesn't know how to insert "gnu"
after "linux" :)

I still see it failing with gcc 3.4.6 and binutils 2.17.50.0.7:

/usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6-initial/gcc/xgcc
-B/usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6-initial/gcc/
-B/usr/local/src/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/bin/ -B/usr/local/src/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/lib/ -isystem /usr/local/src/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/include -isystem /usr/local/src/buildroot/build_arm/staging_dir/arm-linux-uclibcgnueabi/sys-include -O2  -DIN_GCC -DCROSS_COMPILE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -fomit-frame-pointer -fPIC -g0  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED  -I. -I. -I/usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6/gcc -I/usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6/gcc/. -I/usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6/gcc/../include   -DL_floatdisf -c /usr/local/src/buildroot/toolchain_build_arm/gcc-3.4.6/gcc/libgcc2.c -o libgcc/./_floatdisf.o
/tmp/cciYVnPk.s: Assembler messages:
/tmp/cciYVnPk.s:23: Error: selected processor does not support `ldfd f0,.L8+16'
/tmp/cciYVnPk.s:43: Error: selected processor does not support `fltd f1,r7'
/tmp/cciYVnPk.s:45: Error: selected processor does not support `mufd f1,f1,f0'
/tmp/cciYVnPk.s:46: Error: selected processor does not support `mufd f1,f1,f0'
/tmp/cciYVnPk.s:47: Error: selected processor does not support `fltd f2,r5'
/tmp/cciYVnPk.s:48: Error: selected processor does not support `ldfltd f0,.L8+32'
/tmp/cciYVnPk.s:49: Error: selected processor does not support `adfltd f2,f2,f0'
/tmp/cciYVnPk.s:50: Error: selected processor does not support `adfd f1,f1,f2'
/tmp/cciYVnPk.s:52: Error: selected processor does not support `mvfs f0,f1'
make[3]: *** [libgcc/./_floatdisf.o] Error 1

Maybe you can fix it.  You can try another compiler.

If I understand it correctly, the binutils and gcc configuration is
affected solely by BR2_GNU_TARGET_SUFFIX, not by BR2_ARM_EABI and
BR2_ARM_OABI values.  That's why it's important to get
BR2_GNU_TARGET_SUFFIX right.

-- 
Regards,
Pavel Roskin
