From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 25 Jun 2016 23:13:18 +0300
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: Disable static build of
 DRI drivers if BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <1466854943-18855-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466854943-18855-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160625201318.GA2319@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sat, Jun 25, 2016 at 01:42:23PM +0200, Bernd Kuhls wrote:
> Using this defconfig
> 
> BR2_SHARED_STATIC_LIBS=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> 
> building DRI drivers in mesa3d fails with this message:
> 
> configure: error: Cannot use static libraries for DRI drivers
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index ebd674f..5ba9d6e 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -123,6 +123,11 @@ MESA3D_CONF_OPTS += \
>  	--enable-shared-glapi \
>  	--enable-driglx-direct \
>  	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
> +# fixes the following configure error:
> +# configure: error: Cannot use static libraries for DRI drivers
> +ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +MESA3D_CONF_OPTS += --disable-static
> +endif

Since mesa3d depends on !BR2_STATIC_LIBS already, why not add --disable-static 
unconditionally?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
