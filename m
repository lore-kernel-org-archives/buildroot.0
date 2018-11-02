From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 22:30:56 +0100
Subject: [Buildroot] [PATCH 1/1] xerces: fix static linking with mbedtls
In-Reply-To: <20181025205402.10649-1-fontaine.fabrice@gmail.com>
References: <20181025205402.10649-1-fontaine.fabrice@gmail.com>
Message-ID: <20181102223056.668a3c81@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 25 Oct 2018 22:54:02 +0200, Fabrice Fontaine wrote:
> curl can be statically linked with mbedtls, in this case build will
> fail on:
> kex.c:(.text+0x1be0): undefined reference to `mbedtls_mpi_read_binary'
> 
> This is due to the fact that CURL_LIBRARIES does not contain mbedtls
> library:
> CURL_LIBRARIES:INTERNAL=curl;cares;ssh2;ssh2;z;ssl;crypto;z;z;crypto;z;z;ssl;z;z;crypto;z
> 
> even if libcurl.pc is correct:
> Libs.private: -lcares -lssh2 -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lssh2 /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmbedcrypto.a -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -L/home/fabrice/buildroot/output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lz -lssl -lcrypto -lssl -lz -lz -lcrypto -lz -lz

A quick guess is that CURL_LIBRARIES doesn't mention mbedtls because
it's listed in Libs.private using a full path to the .a files rather
than using the gcc -l<something> flag.

Perhaps this is what should be fixed instead ?

BTW, do you have a minimal defconfig that exhibits this problem?

I tried with:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_LIBSSH2=y
BR2_PACKAGE_MBEDTLS=y
BR2_PACKAGE_XERCES=y
BR2_PACKAGE_LIBCURL=y
# BR2_TARGET_ROOTFS_TAR is not set

but it build just fine.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
