From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Aug 2018 09:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: fix
 PKG_CONFIG_LIBDIR
In-Reply-To: <20180801201646.512-1-bernd.kuhls@t-online.de>
References: <20180801201646.512-1-bernd.kuhls@t-online.de>
Message-ID: <20180802091359.2387b7c1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Aug 2018 22:16:46 +0200, Bernd Kuhls wrote:

> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 9eafd593f1..62199d8cb2 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -277,7 +277,7 @@ define QT5BASE_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) \
>  		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
> -		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
> +		PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig" \
>  		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \

Why are we passing PKG_CONFIG_LIBDIR and PKG_CONFIG_SYSROOT_DIR ? Our
pkg-config wrapper already passes those, so they should not be
necessary.

I believe the reason is that back when qt5base was packaged by me in
2013 (commit 54e95512e5125a650a59c6c7dc0cef70ea832157), we did not had
a pkg-config wrapper, and we were instead relying on passing
PKG_CONFIG_LIBDIR and PKG_CONFIG_SYSROOT_DIR in the environment.

But now that we have the pkg-config wrapper, I'd say that the best fix
is to just delete those two lines.

Could you try if that also fixes the problem ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
