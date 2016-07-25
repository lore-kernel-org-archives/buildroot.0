From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 09:31:15 +0200
Subject: [Buildroot] [PATCH 1/4] swupdate: allowed luajit to enable
 HAVE_LUA
In-Reply-To: <20160724232739.14132-2-jordan@yelloz.me>
References: <20160724232739.14132-1-jordan@yelloz.me>
 <20160724232739.14132-2-jordan@yelloz.me>
Message-ID: <20160725093115.0d47ba9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 16:27:36 -0700, Jordan Yelloz wrote:

> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index 313a54febd87..7a0fcaea5741 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -42,6 +42,9 @@ endif
>  ifeq ($(BR2_PACKAGE_LUA),y)
>  SWUPDATE_DEPENDENCIES += lua host-pkgconf
>  SWUPDATE_MAKE_ENV += HAVE_LUA=y
> +else ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +SWUPDATE_DEPENDENCIES += luajit host-pkgconf
> +SWUPDATE_MAKE_ENV += HAVE_LUA=y

If both luajit and classic lua are supported, then could you instead
use:

ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
SWUPDATE_MAKE_ENV += HAVE_LUA=y

luainterpreter is a virtual package that automatically depends either
on lua or luajit, depending on which of the two is enabled in the
configuration.

Could you test this solution, and send an updated version of your patch?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
