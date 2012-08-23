From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Aug 2012 10:50:29 +0200
Subject: [Buildroot] "Incorrect selection of the C library" with
 Emdebian toolchain
In-Reply-To: <5035736C.1020205@gmail.com>
References: <5035736C.1020205@gmail.com>
Message-ID: <20120823105029.666a7056@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 22 Aug 2012 20:03:56 -0400,
Evade Flow <evadeflow@gmail.com> a ?crit :

> Hi. I'm having a problem similar to one reported earlier this year (see
> http://goo.gl/lBYtC), namely: SYSROOT_DIR is being computed incorrectly
> for my external toolchain. I'm trying to use Emdebian's ARM cross
> toolchain, which I installed in my Ubuntu 12.04 VM using:
> 
>    sudo apt-get install gcc-4.6-arm-linux-gnueabi
> 
> This puts arm-linux-gnueabi-gcc-4.6 in /usr/bin, and the dependent
> package binutils-arm-linux-gnueabi adds things like
> arm-linux-gnueabi-ar, arm-linux-gnueabi-as, etc in the same location.
> However, the latter package also drops a bunch of files in
> /usr/arm-linux-gnueabi:
> 
> /usr/arm-linux-gnueabi
> |-- bin
> |   |-- ar
> |   |-- as
> |   |-- ld
> |   |-- ld.bfd
> |   |-- ld.gold
> |   |-- nm
> |   |-- objcopy
> |   |-- objdump
> |   |-- ranlib
> |   `-- strip
> |-- include
> |   |-- aio.h
> |   |-- aliases.h
> |   <--SNIP!-->
> |   |-- wait.h
> |   |-- wchar.h
> |   |-- wctype.h
> |   |-- wordexp.h
> |   |-- xen
> |   `-- xlocale.h
> `-- lib
>      |-- crt1.o
>      |-- crti.o
>      |-- crtn.o
>      |-- gcrt1.o
>      |-- ld-2.15.so
>      |-- ld-linux.so.3 -> ld-2.15.so
>      |-- libanl-2.15.so
>      <--SNIP--!>
>      |-- libstdc++.so.6 -> libstdc++.so.6.0.16
>      |-- libstdc++.so.6.0.16
>      |-- libthread_db-1.0.so
>      |-- libthread_db.so -> libthread_db.so.1
>      |-- libthread_db.so.1 -> libthread_db-1.0.so
>      |-- libutil-2.15.so
>      |-- libutil.a
>      |-- libutil.so -> libutil.so.1
>      |-- libutil.so.1 -> libutil-2.15.so
>      |-- Mcrt1.o
>      `-- Scrt1.o
> 
> So, as near as I can tell, SYSROOT_DIR should be /usr/arm-linux-gnueabi
> for this toolchain. The following sed command in ext-tool.mk (~ line
> 311) is the problem:
> 
> SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 
> 's:usr/lib(64)?/(.*/)?libc\.a::'` ; \
> 
> When the above is executed, LIBC_A_LOCATION has the value
> "/usr/arm-linux-gnueabi/lib/libc.a" so the regex doesn't match anything,
> and I get the error "Incorrect selection of the C library".
> 
> For now, I've temporarily hacked ext-tool.mk to hard-code SYSROOT_DIR to
> '/usr/arm/arm-linux-gnueabi', which seems to work. Just figured I should
> tell some folks who may be able to implement a 'real' fix... :-}

Normally, toolchains installed system-wide in /usr are not usable
because their sysroot is mixed with tons of stuff. However, in this
case, it sounds like the Emdebian toolchain sysroot
in /usr/arm-linux-gnueabi is clean and may be used by Buildroot. If you
can't cook a patch to fix this, I'll try to find some time to do it,
but I don't know when.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
