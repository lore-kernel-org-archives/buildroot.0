From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 29 May 2017 23:28:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: needs sync_4
In-Reply-To: <20170525093119.15205-1-bernd.kuhls@t-online.de>
References: <20170525093119.15205-1-bernd.kuhls@t-online.de>
Message-ID: <bbef8bc4-a0d8-d836-aee0-3c490103cdd5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Le 25/05/2017 ? 11:31, Bernd Kuhls a ?crit :
> Fixes
> http://autobuild.buildroot.net/results/b3e/b3eaaf6d73cd49f5919143aeaa5cbb4d15a7ccc3/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
> index 383374ddb..1326c7b8d 100644
> --- a/package/ffmpeg/Config.in
> +++ b/package/ffmpeg/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	# No support for ARMv7-M in the ARM assembly logic
>  	# Microblaze build affected by gcc PR71124 (infinite loop)
>  	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4

The code libavutil/buffer.c use atomic_fetch_add_explicit() and ffmpeg should
build correctly if you disable BR2_PACKAGE_FFMPEG_FFMPEG with this defconfig.

But with all option enabled except BR2_PACKAGE_FFMPEG_FFMPEG, it fail elsewhere:
ffmpeg-3.3.1/libavdevice/v4l2.c:515: undefined reference to `__sync_fetch_and_add_4

So,

Acked-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  
>  menuconfig BR2_PACKAGE_FFMPEG
>  	bool "ffmpeg"
> 
