From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 22:41:15 +0100
Subject: [Buildroot] [PATCH] package/frotz: Update to version 2.53
In-Reply-To: <20210307152147.514774-1-huth@tuxfamily.org>
References: <20210307152147.514774-1-huth@tuxfamily.org>
Message-ID: <20210307214115.GG2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-03-07 16:21 +0100, Thomas Huth spake thusly:
> This version should now also compile fine on systems without pthreads,
> so we can remove the dependency on BR2_TOOLCHAIN_HAS_THREADS again.
> 
> While we're at it, also fix a typo in the description (replace "can not"
> with "cannot").
> 
> Signed-off-by: Thomas Huth <huth@tuxfamily.org>

Applied to next, thanks.

But see below...

> ---
>  package/frotz/Config.in  | 6 +-----
>  package/frotz/frotz.hash | 2 +-
>  package/frotz/frotz.mk   | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/frotz/Config.in b/package/frotz/Config.in
> index b73beea330..9473f5944d 100644
> --- a/package/frotz/Config.in
> +++ b/package/frotz/Config.in
> @@ -1,14 +1,10 @@
>  config BR2_PACKAGE_FROTZ
>  	bool "frotz"
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_NCURSES
>  	help
>  	  Frotz is an interpreter for old Infocom adventure games and
> -	  other Z-code games. Note that frotz can not be run as root.
> +	  other Z-code games. Note that frotz cannot be run as root.

Out of curiosity: what is the technical reason this is not possible?

There is an explicit check in src/curses/ux_init.c, but except for that,
I could not easily spot a reason for not being able to run as root...

>  	  You must add a normal user to your buildroot configuration to
>  	  be able to use it.

Why don't we then define one, like:

    define FROTS_USERS
        frotz -1 frotz -1 - - - -
    endef

See: https://buildroot.org/downloads/manual/manual.html#makeuser-syntax

Care to send a patch?

Regards,
Yann E. MORIN.

>  	  https://661.org/proj/if/frotz/
> -
> -comment "frotz needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/frotz/frotz.hash b/package/frotz/frotz.hash
> index 14f1a7fbe2..e5024aa2cd 100644
> --- a/package/frotz/frotz.hash
> +++ b/package/frotz/frotz.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7e488140791259a1a8c9e16a0c467ca69b694b918c28ffe3d83c654bcb253cca  frotz-2.51.tar.bz2
> +sha256  8da558828dd74d6d6ee30483bb32276ef918b8b72b7f6e89b4f7cb27e7abf58b  frotz-2.53.tar.bz2
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/frotz/frotz.mk b/package/frotz/frotz.mk
> index ce27bdf0bf..cc0421358c 100644
> --- a/package/frotz/frotz.mk
> +++ b/package/frotz/frotz.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FROTZ_VERSION = 2.51
> +FROTZ_VERSION = 2.53
>  FROTZ_SOURCE = frotz-$(FROTZ_VERSION).tar.bz2
>  FROTZ_SITE = https://gitlab.com/DavidGriffith/frotz/-/archive/$(FROTZ_VERSION)
>  FROTZ_DEPENDENCIES = host-pkgconf ncurses
> -- 
> 2.29.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
