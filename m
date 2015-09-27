From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sun, 27 Sep 2015 12:48:52 +0100
Subject: [Buildroot] [PATCH v2 1/1]
 package/x11r7/xdriver_xf86-video-ati: Fix DRI-related build
In-Reply-To: <1443351264-9312-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443351264-9312-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <5607D7A4.8020903@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On 27/09/15 11:54, Bernd Kuhls wrote:
> Restrict this package to x86 / x86-64 to fix most compile errors.
>
> This package also depends on the radeon driver from libdrm.
>
> This package also depends on DRI support in xserver_xorg-server, to
> achieve this we select the Radeon mesa3d DRI driver.


Are you sure about this? BR2_PACKAGE_LIBDRM_RADEON doesn't depend on x86:

http://git.buildroot.net/buildroot/commit/?id=661139f9180f256389fb8b5bab7b6dc94ae50a0f

And I managed to build xdriver_xf86-video-ati for MIPS architecture 
successfully, after enabling BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON for 
all architectures.

Regards,

Vincent.

> Fixes
> http://autobuild.buildroot.net/results/4e2/4e212942a50bae8460bd66c2e508e1d827244482/
> http://autobuild.buildroot.net/results/de2/de2e2fe4489be30d62fdcb554e537ec2f52efc1e/
> http://autobuild.buildroot.net/results/441/441b30b6899cca67b2c70fd3195f4be2c8a037b4/
> http://autobuild.buildroot.net/results/d88/d88d2f99bc538ce5a518d83e4807faa908889188/
> http://autobuild.buildroot.net/results/6c4/6c4fda4cafa587d5fffb44cd9bd38a32cb2616f3/
> http://autobuild.buildroot.net/results/0d2/0d2b131ec425a62f18015cf38914eabd08aa4158/
> http://autobuild.buildroot.net/results/a6e/a6e7e7e8abec135885dc482eb49cdae7bb45ebf6/
> http://autobuild.buildroot.net/results/42f/42ffff241f58913aa32c1561e04f681bbc9c44fc/
> http://autobuild.buildroot.net/results/b0c/b0cdabd7d840698837f1f6816499ff0102624e9b/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: enable only on x86 / x86-64 (Peter)
>      select mesa3d radeon driver instead of swrast
>
>   package/x11r7/xdriver_xf86-video-ati/Config.in | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
> index 191c20f..5ce1712 100644
> --- a/package/x11r7/xdriver_xf86-video-ati/Config.in
> +++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
> @@ -1,8 +1,10 @@
>   config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
>   	bool "xf86-video-ati"
> +	depends on (BR2_i386 || BR2_x86_64)
>   	depends on BR2_PACKAGE_MESA3D
> -	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> -	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
> +	select BR2_PACKAGE_LIBDRM
> +	select BR2_PACKAGE_LIBDRM_RADEON
> +	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
>   	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
>   	select BR2_PACKAGE_XPROTO_FONTSPROTO
>   	select BR2_PACKAGE_XPROTO_GLPROTO
> @@ -16,4 +18,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
>   	  ATI video driver
>
>   comment "xf86-video-ati needs mesa3d"
> +	depends on (BR2_i386 || BR2_x86_64)
>   	depends on !BR2_PACKAGE_MESA3D
>
