From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Oct 2017 21:59:35 +0200
Subject: [Buildroot] [PATCH] pdbg: bump version to latest
In-Reply-To: <20170927021547.19421-1-joel@jms.id.au>
References: <20170927021547.19421-1-joel@jms.id.au>
Message-ID: <20171002215935.125438c2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Sep 2017 11:45:47 +0930, Joel Stanley wrote:
> I got this error when attempting to build:
> 
>  aclocal: error: couldn't open directory 'm4': No such file or directory
> 
> So we now have the post patch hook to ensure the m4 directory is
> present.
> 
> In addition, the package now sets a variable with the Git SHA1 so that
> the binary contians the expected output for --version.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

It doesn't build here:

>>> pdbg 77158819158d1d7053a737ac090d04fdfbfe9265 Building
PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/bin:/home/thomas/.rvm/bin:/usr/local/sbin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/home/thomas/.rvm/bin"  /usr/bin/make -j5 "GIT_SHA1=\"77158819158d1d7053a737ac090d04fdfbfe9265\"" -C /home/thomas/projets/buildroot/output/build/pdbg-77158819158d1d7053a737ac090d04fdfbfe9265/
/usr/bin/make  all-am
dtc -i./ -I dts fake.dts -O dtb > fake.dtb.o.tmp
m4 -I./ p8-fsi.dts.m4 > p8-fsi.dts
m4 -I./ p8-i2c.dts.m4 > p8-i2c.dts
dd if=fake.dtb.o.tmp of=fake.dtb.o ibs=16 conv=sync
m4 -I./ p9-fsi.dtsi.m4 > p9-fsi.dtsi
23+1 records in
0+1 records out
384 bytes copied, 5.8961e-05 s, 6.5 MB/s
rm fake.dtb.o.tmp
m4 -I./ p8-host.dts.m4 > p8-host.dts
/home/thomas/projets/buildroot/output/host/bin/arm-linux-objcopy -I binary -O elf32-littlearm -B arm  fake.dtb.o fake.dtb.o
m4 -I./ p9-kernel.dts.m4 > p9-kernel.dts
m4 -I./ p9-host.dts.m4 > p9-host.dts
  CC       libpdbg/libpdbg_la-host.lo
  CC       libpdbg/libpdbg_la-kernel.lo
  CC       libpdbg/libpdbg_la-fake.lo
  CC       libpdbg/libpdbg_la-chip.lo
  CC       libpdbg/libpdbg_la-p8chip.lo
In file included from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/stdio.h:71:0,
                 from libpdbg/fake.c:17:
/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/bits/uClibc_stdio.h:149:16: error: expected identifier or ?(? before ?;? token
  void *__unused;    /* Placeholder for codeset binding. */
                ^
make[3]: *** [Makefile:784: libpdbg/libpdbg_la-fake.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
rm p8-host.dts p9-kernel.dts p8-i2c.dts p8-fsi.dts p9-host.dts
make[2]: *** [Makefile:431: all] Error 2
make[1]: *** [package/pkg-generic.mk:237: /home/thomas/projets/buildroot/output/build/pdbg-77158819158d1d7053a737ac090d04fdfbfe9265/.stamp_built] Error 2
make: *** [Makefile:79: _all] Error 2

Problematic defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_PDBG=y
# BR2_TARGET_ROOTFS_TAR is not set

The current version of pdbg in Buildroot builds fine.

> +PDBG_MAKE_OPTS = "GIT_SHA1=\"${PDBG_VERSION}\""

Please use $() and not ${} when referencing make variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
