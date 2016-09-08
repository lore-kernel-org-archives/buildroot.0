From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 08 Sep 2016 13:30:35 +0200
Subject: [Buildroot] [PATCH 1/2] package/libssh: fix dependency on
	libgcrypt
References: <cover.1473326919.git.yann.morin.1998@free.fr>
 <201c0948734eafacde0c6d0aa47f0399745f1259.1473326919.git.yann.morin.1998@free.fr>
Message-ID: <rnu7adx19n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 08 Sep 2016 11:35:06 +0200 schrieb Yann E. MORIN:

> This in itself is already incorrect, but that can cause further issues,
> as some packages (e.g. Kodi) will select (indirectly) openssl, and has
> an option to select libssh; enabling that option causes unmet direct
> dependencies of libssh:
> 
>     warning: (BR2_PACKAGE_KODI_LIBSSH) selects BR2_PACKAGE_LIBSSH which
>     has unmet direct dependencies (BR2_USE_MMU && !BR2_STATIC_LIBS &&
>     BR2_TOOLCHAIN_HAS_THREADS && BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>     && !BR2_PACKAGE_OPENSSL)
> 
> Fix this dependency.

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(tested make menuconfig)

This defconfig

BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_LIBSSH=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y

showed the error message quoted without this patch.
With the patch the bug I reported[1] is fixed and I can remove
the bunch of gpg-revert patches from my kodi17 branch[2], thanks!

Regards, Bernd

[1] http://lists.busybox.net/pipermail/buildroot/2016-July/167041.html
[2] https://github.com/bkuhls/buildroot/tree/kodi17
