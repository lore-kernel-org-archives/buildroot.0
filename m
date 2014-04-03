From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Apr 2014 17:03:15 +0300
Subject: [Buildroot] [PATCH 2/2] wget: fix autoreconf brokeness
In-Reply-To: <1396532611-30218-2-git-send-email-gustavo@zacarias.com.ar>
References: <1396532611-30218-1-git-send-email-gustavo@zacarias.com.ar>
 <1396532611-30218-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140403140315.GK4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Apr 03, 2014 at 10:43:31AM -0300, Gustavo Zacarias wrote:
> Fix failed AUTORECONF under certain circumstances where gettext infra is
> much newer (>= 0.18) than what wget source expects (~ 0.17).
> Do this by gettextizing the source before AUTORECONFing.
> If this becomes common we may need a FOO_GETTEXTIZE generic option, but
> for now this seems to be the only package that needs so. Fixes:
> http://autobuild.buildroot.net/results/c0f/c0f7c801f61fdc310cde64342060b00a70155431/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/wget/wget.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 80f8314..f3a5274 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -13,6 +13,14 @@ WGET_LICENSE_FILES = COPYING
>  # patching gnulib .m4 file
>  WGET_AUTORECONF = YES
>  
> +# Ugly kludge to fix autoreconf with old gettext infra
> +# We need to gettextize before autoreconf to upgrade
> +WGET_DEPENDENCIES += host-gettext
> +define WGET_GETTEXTIZE
> +	cd $(@D) ; $(HOST_DIR)/usr/bin/gettextize -f
> +endef
> +WGET_POST_PATCH_HOOKS += WGET_GETTEXTIZE
> +
>  # Prefer full-blown wget over busybox
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  	WGET_DEPENDENCIES += busybox

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
