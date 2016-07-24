From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:35:43 +0200
Subject: [Buildroot] [PATCH 3/3 v5] odroid-mali: New Package
In-Reply-To: <20160724163506.20024-3-daggs@gmx.com>
References: <20160724163506.20024-1-daggs@gmx.com>
 <20160724163506.20024-3-daggs@gmx.com>
Message-ID: <20160724223543.1c9dcfc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 19:35:06 +0300, Dagg Stompler wrote:
> diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
> new file mode 100644
> index 0000000..a648f03
> --- /dev/null
> +++ b/package/odroid-mali/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_ODROID_MALI
> +	bool "odroid-mali"
> +	select BR2_PACKAGE_HAS_LIBEGL
> +	select BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	select BR2_PACKAGE_FBSET

fbset is not used by odroid-mali, it's used by odroid-scripts, so this
dependency should be in odroid-scripts. So I've dropped those two lines
from here. Could you send a patch that adds the dependency to
odroid-scripts?

> +	select BR2_PACKAGE_ODROID_SCRIPTS

I've added a comment that indicates it's a runtime dependency.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC

I've added a Config.in comment that helps the user to know that
odroid-mali needs glibc.

> +	depends on BR2_aarch64 || BR2_arm

On ARM, the prebuilt libraries use the EABIhf ABI, so I've changed
BR2_arm to BR2_ARM_EABIHF.

It's worth mentioning that for AArch64, this repo contains the OpenGL
libraries for X11. If you have the opportunity to test them, it would
be nice to add support for them.

> +ifeq ($(BR2_aarch64),y)
> +ODROID_MALI_LIBS_INSTALL_ARCH=mali_libs

I've changed this to:

ODROID_MALI_INSTALL_ARCH = mali_libs

I.e, simplified the name of the variable, and added spaces around the
equal sign.

Applied with those changes. Thanks! 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
