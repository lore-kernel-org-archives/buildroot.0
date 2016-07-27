From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jul 2016 22:01:07 +0200
Subject: [Buildroot] [PATCH 1/1] tinydtls: new package
In-Reply-To: <1469535999-23385-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469535999-23385-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160727220107.60bd5df7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Jul 2016 14:26:39 +0200, Fabrice Fontaine wrote:
> tinydtls is a library for Datagram Transport Layer Security
> (DTLS) covering both the client and the server state machine.
> It is implemented in C and provides support for the mandatory
> cipher suites specified in CoAP.
> 
> https://sourceforge.net/projects/tinydtls
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Unfortunately, this doesn't build for me, with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2016.05-1162-g94c7298.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_TINYDTLS=y
# BR2_TARGET_ROOTFS_TAR is not set

I get:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -I.. -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DDTLSv12 -DWITH_SHA256 -L..    prf-test.c  -ltinydtls  -o prf-test
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ltinydtls
collect2: error: ld returned 1 exit status
<builtin>: recipe for target 'ccm-test' failed
make[3]: *** [ccm-test] Error 1
make[3]: *** Waiting for unfinished jobs....
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ltinydtls
collect2: error: ld returned 1 exit status
<builtin>: recipe for target 'prf-test' failed
make[3]: *** [prf-test] Error 1
/home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -ltinydtls
collect2: error: ld returned 1 exit status
<builtin>: recipe for target 'dtls-server' failed
make[3]: *** [dtls-server] Error 1
: Doxyfile >./doxygen.out 2>&1 

More precisely, the build doesn't abort, and it continues to install
tinydtls, but this really seems ugly.

>  ...te-Makefile.in-to-allow-cross-compilation.patch | 170 +++++++++++++++++++++

Could you submit this patch upstream? The project seems alive at:
http://git.eclipse.org/c/tinydtls/org.eclipse.tinydtls.git.

> diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
> new file mode 100644
> index 0000000..c4dc35d
> --- /dev/null
> +++ b/package/tinydtls/tinydtls.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# tinydtls
> +#
> +################################################################################
> +
> +TINYDTLS_RELEASE = r5
> +TINYDTLS_VERSION = 0.8.2
> +TINYDTLS_SOURCE = tinydtls-$(TINYDTLS_VERSION).tar.gz

Not needed this is the default.

> +TINYDTLS_SITE = \
> +	http://downloads.sourceforge.net/project/tinydtls/$(TINYDTLS_RELEASE)

Please put on a single line, even if it slightly overflows the normal length.

> +TINYDTLS_LICENSE = MIT

Please use one source file as LICENSE_FILES, for example tinydtls.h.

> +TINYDTLS_INSTALL_STAGING = YES
> +
> +TINYDTLS_STRIP_COMPONENTS = 2
> +
> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
