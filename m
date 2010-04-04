From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 22:03:06 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404220306.E45B57F898@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #8 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-04 22:03:06 UTC ---

> [wrt sysroot]
> > Isn't it always going to be "$(BR2_TOOLCHAIN_EXTERNAL_PATH)/.."?
> 
> IIRC, $(BR2_TOOLCHAIN_EXTERNAL_PATH) is the place where to find the
> executables, eg. target-gcc et al.

Almost.  $(BR2_TOOLCHAIN_EXTERNAL_PATH) is where to find the bin
directory that contains the executables.  If the gcc executable is
/foo/bar/usr/bin/arm-linux-gcc, then BR2_TOOLCHAIN_EXTERNAL_PATH is
/foo/bar/usr.

> So, no, the sysroot should not be in $(BR2_TOOLCHAIN_EXTERNAL_PATH)/.. That
> would have been the place to find target includes/libraries for the old,
> non-sysroot case.

For toolchains built by buildroot, the proper sysroot value is always 
$(BR2_TOOLCHAIN_EXTERNAL_PATH)/..

I don't know what you mean by "the old non-sysroot" case.  I've always
built toolchains with sysroot support, and the sysroot value has always
been $(BR2_TOOLCHAIN_EXTERNAL_PATH)/..

> There is no way to know where the sysroot is, except by asking gcc
> where it was previously installed into, subtract that from the
> configured sysroot prefix, and re-add the current toolchain prefix.

OK, we'll use the commited patch's algorithm with my toolchain (which
was built by buildroot).  It is currently located in

/home/nextgen/buildroot/foobar.

BR2_TOOLCHAIN_EXTERNAL_PATH is /home/nextgen/buildroot/foobar/usr

The gcc executble is in /home/nextgen/buildroot/foobar/usr/bin

The proper sysroot value is /home/nextgen/buildroot/foobar

$ /home/nextgen/buildroot/foobar/usr/bin/arm-linux-gcc -v
Using built-in specs.
Target: arm-linux-uclibc
Configured with:
/home/nextgen/buildroot-test/buildroot/output/toolchain/gcc-4.4.3/configure
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu
--target=arm-linux-uclibc --enable-languages=c,c++
--with-sysroot=/home/nextgen/buildroot-test/buildroot/output/staging
--with-build-time-tools=/home/nextgen/buildroot-test/buildroot/output/staging/usr/arm-linux-uclibc/bin
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-libssp
--disable-tls --enable-shared
--with-gmp=/home/nextgen/buildroot-test/buildroot/output/toolchain/gmp
--with-mpfr=/home/nextgen/buildroot-test/buildroot/output/toolchain/mpfr
--enable-threads --disable-multilib --disable-decimal-float --with-float=soft
--with-abi=apcs-gnu --with-arch=armv5te --with-tune=arm9tdmi
--with-pkgversion='Buildroot 2010.02-git'
--with-bugurl=http://bugs.buildroot.net/
Thread model: posix
gcc version 4.4.3 (Buildroot 2010.02-git) 

CFG_PREFIX_DIR is "/usr"

CFG_SYSROOT_DIR is "/home/nextgen/buildroot-test/buildroot/output/staging"

REL_SYSROOT_DIR is "/home/nextgen/buildroot-test/buildroot/output/staging"

SYSROOT_DIR is
"/home/nextgen/buildroot/foobar/usr/home/nextgen/buildroot-test/buildroot/output/staging"

That's not a valid path, either before or after the toolchain is
copied into staging.

> Of course, that rules out a toolchain in which the sysroot was configured
> out-side the gcc prefix,

That appears to be how buildroot builds toolchains.

> in which case I have absolutely no clue what could happen if the
> toolchain gets relocated...

Has the decision has been made to not support external toolchains
built by buildroot?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
