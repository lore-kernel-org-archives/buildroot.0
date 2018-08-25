From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Aug 2018 02:22:50 +0200
Subject: [Buildroot] [PATCH] sunxi-mali-mainline: add EULA license file
In-Reply-To: <20180824234752.39453-1-giulio.benetti@micronovasrl.com>
References: <20180824234752.39453-1-giulio.benetti@micronovasrl.com>
Message-ID: <f4eab7a8-6eff-889e-ff8f-636c83cfbe8a@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 25/08/2018 01:47, Giulio Benetti ha scritto:
> sunxi-mali-mainline package has not license file at the moment.
> 
> License file is a pdf EULA, but its name contains whitespaces. This
> gives problems when passing filename to SUNXI_MALI_MAINLINE_LICENSE_FILES
> since it expects a list of files.
> Other attempts with \ or \\ to keep spaces were tried with no luck.
> Add a define to POST_PATCH_HOOKS to change pdf filename from
> 'EULA for Mali 400MP _AW.pdf' to 'EULA_for_Mali_400MP_AW.pdf'.
> Add also related hash file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>   package/sunxi-mali-mainline/sunxi-mali-mainline.hash |  2 ++
>   package/sunxi-mali-mainline/sunxi-mali-mainline.mk   | 10 ++++++++++
>   2 files changed, 12 insertions(+)
>   create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> 
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> new file mode 100644
> index 0000000000..e3185efd26
> --- /dev/null
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256 8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
> diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> index 05b90f0bee..b5d28385a3 100644
> --- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> +++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
> @@ -8,6 +8,10 @@ SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
>   SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
>   SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
>   SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
> +SUNXI_MALI_MAINLINE_LICENSE = Allwinner End User Licence Agreement
> +SUNXI_MALI_MAINLINE_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
> +SUNXI_MALI_MAINLINE_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
> +SUNXI_MALI_MAINLINE_LICENSE_FILES = $(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
>   
>   SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
>   
> @@ -36,4 +40,10 @@ define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
>   		$(TARGET_DIR)/usr/lib/
>   endef
>   
> +define SUNXI_MALI_MAINLINE_EULA_DELETE_WHITESPACES
> +	mv $(@D)/$(SUNXI_MALI_MAINLINE_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
> +endef
> +
> +SUNXI_MALI_MAINLINE_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_EULA_DELETE_WHITESPACES
> +
>   $(eval $(generic-package))
> 

Even if it could be acceptable(maybe?), I would like to make the best.
Did I have also in this case split into 2 different commits?
One for package and one for hash file?
Because thinking about bisection,
even if I apply them one by one, it builds ok,
except for warning if there is not hash file.
So maybe I should do 2 patches in these order:
- sunxi-mali-mainline: add EULA license file
- sunxi-mali-mainline: add hash file

Then:
- apply first
- make legal-info
- get warnings on hash file not present
- apply second
- get no warnings

Right?
If yes I modify and resend v2 as patchset.

Thanks
Giulio
