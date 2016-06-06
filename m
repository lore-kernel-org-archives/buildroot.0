From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Jun 2016 23:14:48 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add coldfire support
In-Reply-To: <20160429175123.GA27368@waldemar-brodkorb.de>
References: <20160429175123.GA27368@waldemar-brodkorb.de>
Message-ID: <20160606231448.3330032b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 19:51:23 +0200, Waldemar Brodkorb wrote:

> +config BR2_GCC_TARGET_ARCH
> +	default "m68k"		if BR2_m68k_m68k
> +	default "cf"		if BR2_m68k_cf

This change looks wrong. I've started testing m68k with external
toolchains, and m68k or cf are not valid -march= values. From the gcc
documentation:

'-march=ARCH'
     Generate code for a specific M680x0 or ColdFire instruction set
     architecture.  Permissible values of ARCH for M680x0 architectures
     are: '68000', '68010', '68020', '68030', '68040', '68060' and
     'cpu32'.  ColdFire architectures are selected according to
     Freescale's ISA classification and the permissible values are:
     'isaa', 'isaaplus', 'isab' and 'isac'.

     GCC defines a macro '__mcfARCH__' whenever it is generating code
     for a ColdFire target.  The ARCH in this macro is one of the
     '-march' arguments given above.

     When used together, '-march' and '-mtune' select code that runs on
     a family of similar processors but that is optimized for a
     particular microarchitecture.

So indeed, gcc complains with:

m68k-linux-gcc.br_real: error: unrecognized argument in option '-march=m68k'
m68k-linux-gcc.br_real: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac
m68k-linux-gcc.br_real: error: unrecognized argument in option '-march=m68k'
m68k-linux-gcc.br_real: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac
m68k-linux-gcc.br_real: error: unrecognized argument in option '-march=m68k'
m68k-linux-gcc.br_real: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac

You can reproduce with:

BR2_m68k=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-m68k-68040-full-2016.05-2-g5dabb45.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_5=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_NPTL is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

Where did this change came from? Do you really need those values passed
as --with-arch when configuring gcc?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
