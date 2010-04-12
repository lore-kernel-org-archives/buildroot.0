From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2010 22:58:17 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100412225817.45E6820DF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #10 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-12 22:58:16 UTC ---

The "fix" doesn't work for me.

The fix in ext-tool.mk uses the following line to figure out what
the sysroot directory is:

SYSROOT_DIR=$(shell readlink -f $$(LANG=C $(TARGET_CC) -print-file-name=libc.a
|sed -r -e 's:usr/lib/libc\.a::;'))

All that does for me is print "libc.a":

  $ LANG=C /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc
-print-file-name=libc.a
  libc.a

The only way I get the desired path for libc.a is to pass gcc the
correct sysroot value:

  $ LANG=C /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc
--sysroot=/home/nextgen/buildroot/toolchain -print-file-name=libc.so
  /home/nextgen/buildroot/toolchain/usr/lib/libc.so


But the correct sysroot value is what that line in ext-tool.mk is
supposed to be figuring out.

Can somebody explain to me how that line is supposed to work for a
relocated external toolchain?

BTW, this is with a toolchain built by buildroot:

  $ /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -v
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


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
