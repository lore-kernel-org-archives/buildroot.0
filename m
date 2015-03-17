From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 16:01:19 +0100
Subject: [Buildroot] [PATCH v4] package/sysdig: New package
In-Reply-To: <1426603727-4895-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1426603727-4895-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20150317160119.465eb8eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 17 Mar 2015 15:48:47 +0100, Angelo Compagnucci wrote:
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> new file mode 100644
> index 0000000..52c3703
> --- /dev/null
> +++ b/package/sysdig/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_SYSDIG
> +	bool "sysdig"
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_LUAJIT

Unless I missed it, you did not reply to my question: is LuaJIT
mandatory, or can sysdig use the normal Lua interpreter as well?

> +	select BR2_PACKAGE_LIBJSON
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_INSTALL_LIBSTDCPP #Libjson

Nitpick: # libjson

(i.e space after #, and lowercase package name)

> +	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') \
> +		|| BR2_powerpc || BR2_arm || BR2_armeb \
> +		|| ((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT) #Luajit

Please introduce a BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS hidden option in
luajit/Config.in, and use it in both luajit/Config.in and here. See
what Samuel did with the BR2_PACKAGE_CMAKE_ARCH_SUPPORTS option today.

> +comment "sysdig needs a toolchain w/ C++ and a Linux kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
> +	depends on !BR2_INSTALL_LIBSTDCPP

	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS

> +SYSDIG_VERSION = 0.1.99
> +SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
> +SYSDIG_LICENSE = GPLv2
> +SYSDIG_LICENSE_FILES = COPYING
> +SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF
> +SYSDIG_DEPENDENCIES += zlib luajit libjson linux

Replace += by = here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
