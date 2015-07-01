From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jul 2015 09:48:25 +0200
Subject: [Buildroot] [PATCH v2] monkey: new package
In-Reply-To: <e5183b9f-515b-4477-a183-b32c8eb232a1@MAIL-SINTERS-01.sinters-int.fr>
References: <570c4a99-dc8a-4605-9c7e-0f08da3ae412@MAIL-SINTERS-01.sinters-int.fr>
 <20150630121932.5e3bfbb2@free-electrons.com>
 <e5183b9f-515b-4477-a183-b32c8eb232a1@MAIL-SINTERS-01.sinters-int.fr>
Message-ID: <20150701094825.11137cb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jul 2015 07:27:40 +0000, Julien CORJON wrote:

> You're right, with the autotool -> generic-packages rework I just 
> checked the compilation and didn't notice that x86 GCC was used. It 
> won't happen again, next time I will fully test patches after each rework.

Ah, ok, I understand. Indeed when using the autotools-package infra,
TARGET_CONFIGURE_OPTS is automatically passed in the environment of
configure. But as discussed previously, this package is not using
autoconf/automake, so it doesn't make a lot of sense to use the
autotools-package infrastructure for it.

> >      [Thomas:
> >        - Add missing dependency on !BR2_STATIC_LIBS (the source code uses
> >          dlopen) and BR2_USE_MMU (the source code uses fork)
> 
> Do you have a documentation on "BR dependencies versus functions" to 
> learn about that?

No, not really. And it's not necessarily a 1:1 mapping. For example,
usage of dlopen() is an indication that you should depend
on !BR2_STATIC_LIBS. But there are also other situations where you need
to depend on !BR2_STATIC_LIBS: when the package tries to build a shared
library unconditionally.

Seeing fork() being called is a good indication that you need a depends
on BR2_USE_MMU.

For the other dependencies like BR2_TOOLCHAIN_HAS_THREADS, you can grep
for pthread functions.

For wide-char/locales, it's a bit more complicated.

But it's not too dramatic if you don't get these correct, as the
autobuilders will catch such problems.

> >        - Slightly adjust/reword the description of the
> >          BR2_PACKAGE_MONKEY_SHARED option.
> >        - Remove all the complicated installation logic for the target, and
> >          just use "make install" instead.
> 
> I didn't know that BR remove all headers from the target image at the 
> end of the compilation. Is it the same for the man files?

Yes. Look at what the target-finalize target is doing at
http://git.buildroot.net/buildroot/tree/Makefile#n547. This is executed
at the end of the build: after all packages have been built/installed,
but before the root filesystem images are generated.

> >        - Pass --no-backtrace when uClibc is used, otherwise the build fails
> >          because <execinfo.h> is not available in uClibc.
> 
> As I daily use a linaro toolchain, I did not test the uClib and Musl 
> configure options. In this case (for future patches), should I include a 
> case I cannot test or disable it with depend?

No, we really prefer when the uClibc situation has been at least built
tested: uClibc is still our default C library, so it's a bit weird to
make a package depends on !BR2_TOOLCHAIN_USES_UCLIBC, if it really can
be used with uClibc.

Especially since your package had some specific conditionals for uClibc
and Musl handling.

But to be honest, I did not built the musl case. The autobuilders will
take care of that.

Remember that you have pre-built uClibc toolchains available at
http://autobuild.buildroot.org/toolchains/tarballs/, which allows you
do quickly build test a package with uClibc.

Here I have a script called br-init-conf, which does:

#!/bin/sh
wget -O .config http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config
cat /home/thomas/projets/br/minimal.defconfig >> .config

With minimal.defconfig being:

BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

This allows to initialize a minimal Buildroot configuration that uses a
pre-built uClibc toolchain. Excellent to do a quick test build.

> > Also, if you could post a follow-up patch adding an init script that
> > starts Monkey at boot time, it would be great.
> 
> I notice there is an systemd start script debian/monkey.init but my 
> knowledge of init daemons is so limited that I didn't try to 
> include/modify this file in BR package declaration.

Ok, no problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
