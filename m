From: hartleys <hartleys@visionengravers.com>
Date: Mon, 5 Jan 2009 16:47:53 -0500
Subject: [Buildroot] External toolchain problem with svn revision 24694
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909FA4C34@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909FA4C34@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909FA4C84@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

I updated my svn checkout today and ran into a problem running the
toplevel make.

I haven't completely figured out where the problem is but I think one of
the changes you made in revision 24408 is causing part of it.

> * In toolchain/external-toolchain/ext-tool.mk, copy the contents of
>   the sysroot directory to the staging dir.

My bash scripting is not quite up to par but I think the
$(copy_toolchain_sysroot) macro is doing the following:

1) calls '$(TARGET_CC) -v'
2) greps the output for the "Configured ...." information
3) greps that information for the "--with-sysroot ..." string
4) cuts the string following --with-sysroot and assigns it to
SYSROOT_DIR
5) copies the entire $${SYSROOT_DIR} to ${STAGING_DIR}
6) chmod's all the directories to 755

The problem I have is my external toolchain does not have a
--with-sysroot configuration option.  For some reason this seems to
cause the cp to try copying my entire root directory to the staging dir.
Here's the output of my $(TARGET_CC) -v:

bigguiness at etch:~/buildroot$ /usr/local/arm/4.1.1-920t/bin/arm-linux-gcc
-v
Using built-in specs.
Target: arm-linux-uclibc
Configured with:
/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/gcc-4.1.1/configure
--prefix=/usr/local/arm/4.1.1-920t --build=i386-pc-linux-gnu
--host=i386-pc-linux-gnu --target=arm-linux-uclibc
--enable-languages=c,c++ --disable-__cxa_atexit --enable-target-optspace
--with-gnu-ld
--with-gmp=/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/gmp
--with-mpfr=/opt/buildroot.920t-cc/toolchain_build_arm_nofpu/mpfr
--enable-shared --disable-nls --enable-threads --disable-multilib
--with-float=soft
Thread model: posix
gcc version 4.1.1

Any ideas?

Thanks,
Hartley
