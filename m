From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 21:59:52 +0200
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.22.1
In-Reply-To: <1533825067-28079-1-git-send-email-angelo@amarulasolutions.com>
References: <1533825067-28079-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180809215952.60f89a78@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Aug 2018 16:31:07 +0200, Angelo Compagnucci wrote:

> +	select BR2_PACKAGE_ELFUTILS

When you select an option, you need to replicate its dependencies:

config BR2_PACKAGE_ELFUTILS
        bool "elfutils"
        depends on BR2_USE_WCHAR
        depends on !BR2_STATIC_LIBS
        # Only glibc and uClibc implement the myriad of required GNUisms
        depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC

Currently, BR2_PACKAGE_SYSDIG only has:

config BR2_PACKAGE_SYSDIG
        bool "sysdig"
        depends on BR2_LINUX_KERNEL
        depends on BR2_INSTALL_LIBSTDCPP # libjson
        depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
        depends on !BR2_STATIC_LIBS # luajit

Therefore, it should be changed to:

config BR2_PACKAGE_SYSDIG
        bool "sysdig"
        depends on BR2_LINUX_KERNEL
        depends on BR2_INSTALL_LIBSTDCPP # libjson
        depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
	depends on BR2_USE_WCHAR # elfutils
        depends on !BR2_STATIC_LIBS # luajit, elfutils
	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils

Is elfutils really a mandatory dependency of this new version of sysdig ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
