From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Apr 2014 06:34:23 +0300
Subject: [Buildroot] [PATCH 3/3] package/wget: use the new gettextize
 infra
In-Reply-To: <f318a05b46d762c07c435c133b0a6e836600c6d6.1397081821.git.yann.morin.1998@free.fr>
References: <cover.1397081821.git.yann.morin.1998@free.fr>
 <f318a05b46d762c07c435c133b0a6e836600c6d6.1397081821.git.yann.morin.1998@free.fr>
Message-ID: <20140410033422.GR4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Thanks for noticing.

On Thu, Apr 10, 2014 at 12:20:05AM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, the gettextization of wget works by chance:
>   - host-gettext is added as a dependency to wget;
>   - gettextize is run as a post-patch hook.
> 
> But the dependencies are only guaranteed to be built and installed
> for the configure step, not the patch step. Becasue post-patch hooks
> are part of the patch step, we have no guarantee that the dependency
> to host-gettext is done by the time we gettextize wget.
> 
> This happens to work by chance, since wget sorts alphabetically after
> gettext, so we indeed have host-gettext built and installed by the
> time we need to gettextize wget.
> 
> This is prone to fail in the parallel build case, sicne we can no
> longer rely on alphabetical order in that case.

Fixing this only requires using PRE_CONFIGURE_HOOK instead of POST_PATCH_HOOK, 
isn't it? Is there anything else this series attempts to fix?

baruch

> Instead, use the new gettextize infra we just added.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/wget/wget.mk | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index f3a5274..031a8ea 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -15,11 +15,7 @@ WGET_AUTORECONF = YES
>  
>  # Ugly kludge to fix autoreconf with old gettext infra
>  # We need to gettextize before autoreconf to upgrade
> -WGET_DEPENDENCIES += host-gettext
> -define WGET_GETTEXTIZE
> -	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
> -endef
> -WGET_POST_PATCH_HOOKS += WGET_GETTEXTIZE
> +WGET_GETTEXTIZE = YES
>  
>  # Prefer full-blown wget over busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -- 
> 1.8.3.2

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
