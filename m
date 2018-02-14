From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Feb 2018 22:16:08 +0100
Subject: [Buildroot] [PATCH v6 1/2] libkrb5: New package
In-Reply-To: <1517937729-12832-1-git-send-email-nerv@dawncrow.de>
References: <1517937729-12832-1-git-send-email-nerv@dawncrow.de>
Message-ID: <20180214221608.2cb324f3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Feb 2018 18:22:08 +0100, Andr? Hentschel wrote:

> diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
> new file mode 100644
> index 0000000..bdddd2e
> --- /dev/null
> +++ b/package/libkrb5/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBKRB5
> +	bool "libkrb5"
> +	# needs fork()
> +	depends on BR2_USE_MMU
> +	# static libs are not supported on all platforms
> +	depends on !(BR2_STATIC_LIBS && (BR2_ARM_CPU_ARMV7M || BR2_m68k))

Could you give more details about this ? It feels like these exclusions
have been added just for the sake of making test-pkg happy. What are
the problems you have encountered ?

I'm particularly wondering about the BR2_ARM_CPU_ARMV7M case, which
always has BR2_USE_MMU disabled, so I'm not sure how you can have
reached a problem on ARMv7-M.

Also, the following defconfigs fails to build libkrb5:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.11-rc1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBKRB5=y
# BR2_TARGET_ROOTFS_TAR is not set

Failure is:

In file included from net-server.c:61:0:
../../include/net-server.h:32:19: fatal error: verto.h: No such file or directory
 #include <verto.h>
                   ^
compilation terminated.
make[4]: *** [Makefile:487: net-server.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [Makefile:984: all-recurse] Error 1
make[2]: *** [Makefile:1524: all-recurse] Error 1
make[1]: *** [package/pkg-generic.mk:250: /home/thomas/projets/buildroot/output/build/libkrb5-1.16/.stamp_built] Error 2

Could you have a look and submit an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
