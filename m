From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 23 Apr 2014 20:48:56 +0300
Subject: [Buildroot] [PATCH v2] wget: fix host-gettext build dependency
	race
In-Reply-To: <a860fe22c7311c8139b725508a98813bb23541d9.1398275150.git.baruch@tkos.co.il>
References: <a860fe22c7311c8139b725508a98813bb23541d9.1398275150.git.baruch@tkos.co.il>
Message-ID: <20140423174856.GK4652@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

On Wed, Apr 23, 2014 at 08:45:50PM +0300, Baruch Siach wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Currently, the gettextization of wget works by chance:
>   - host-gettext is added as a dependency to wget;
>   - gettextize is run as a post-patch hook.
> 
> But the dependencies are only guaranteed to be built and installed
> for the configure step, not the patch step. Because post-patch hooks
> are part of the patch step, we have no guarantee that the dependency
> to host-gettext is done by the time we gettextize wget.
> 
> This happens to work by chance, since wget sorts alphabetically after
> gettext, so we indeed have host-gettext built and installed by the
> time we need to gettextize wget.
> 
> This is prone to fail in the parallel build case, since we can no
> longer rely on alphabetical order in that case.
> 
> Instead, run gettextize in PRE_CONFIGURE_HOOK to avoid the race.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [baruch: make the fix independent from the gettextize infra]
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
> 	Use PRE_CONFIGURE_HOOK to make the fix independent from the rejected
> 	gettextize infrastructure; update the commit log accordingly
> ---
>  package/wget/wget.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index f3a5274964dd..c014d173bca0 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -19,7 +19,7 @@ WGET_DEPENDENCIES += host-gettext
>  define WGET_GETTEXTIZE
>  	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
>  endef
> -WGET_POST_PATCH_HOOKS += WGET_GETTEXTIZE
> +WGET_PRE_CONFIGURE_HOOK += WGET_GETTEXTIZE

This should be _HOOKS. Will fix shortly.

baruch

>  
>  # Prefer full-blown wget over busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
