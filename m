From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 22:22:19 +0100
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160223222219.24b95205@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 23 Feb 2016 13:48:09 -0300, Gustavo Zacarias wrote:

>  menuconfig BR2_PACKAGE_QT
> @@ -7,6 +8,7 @@ menuconfig BR2_PACKAGE_QT
>  	depends on BR2_USE_MMU # fork
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

Isn't this broader than it needs to be? Only the Javascript code seems
to use this atomic operation, so maybe we could just make
BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT depends on
BR2_TOOLCHAIN_HAS_SYNC_4. Or maybe it's
BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT.

By doing this, it also simplifies the patch quite a bit, since you
don't need to propagate the dependency to too many packages (if any).

I've indeed tested, and the following defconfig builds fine:

BR2_sparc=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-glibc-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QT=y
BR2_PACKAGE_QT_LICENSE_APPROVED=y
# BR2_PACKAGE_QT_GUI_MODULE is not set
# BR2_PACKAGE_QT_XML is not set
# BR2_PACKAGE_QT_NETWORK is not set
# BR2_PACKAGE_QT_SCRIPT is not set
# BR2_TARGET_ROOTFS_TAR is not set

Which proves that Qt by itself doesn't use those atomic operations.
Could you research which specific sub-option(s) are causing problems?
I'm pretty sure it's either script or webkit, or possibly both.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
