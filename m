From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 22:55:28 +0200
Subject: [Buildroot] [PATCH 3/3] ffmpeg: add --pkg-config to configure
 options
In-Reply-To: <1410228406-2140-3-git-send-email-danomimanchego123@gmail.com>
References: <1410228406-2140-1-git-send-email-danomimanchego123@gmail.com>
 <1410228406-2140-3-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20140921225528.47f45e50@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Mon,  8 Sep 2014 22:06:46 -0400, Danomi Manchego wrote:
> The ffmpeg does not understand the PKG_CONFIG env variable,
> so it throws a line like this at the end of its configuration:
> 
> WARNING: .../output/host/usr/bin/arm-none-linux-gnueabi-pkg-config not found, library detection may fail.
> 
> Apparently, some of the indevs and outdevs need a pkg-config.
> This patch adds the --pkg-config to let ffmpeg know where it
> is.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/ffmpeg/ffmpeg.mk |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index d50720b..b1d524e 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -65,7 +65,7 @@ FFMPEG_CONF_OPT = \
>  	--disable-symver \
>  	--disable-doc
>  
> -FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +FFMPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
>  
>  ifeq ($(BR2_ENABLE_DEBUG),y)
>  FFMPEG_CONF_OPT += --enable-debug
> @@ -327,13 +327,14 @@ define FFMPEG_CONFIGURE_CMDS
>  	$(TARGET_CONFIGURE_ARGS) \
>  	$(FFMPEG_CONF_ENV) \
>  	./configure \
> -		--enable-cross-compile	\
> +		--enable-cross-compile \

Unrelated change.

>  		--cross-prefix=$(TARGET_CROSS) \
>  		--sysroot=$(STAGING_DIR) \
>  		--host-cc="$(HOSTCC)" \
>  		--arch=$(BR2_ARCH) \
>  		--target-os="linux" \
>  		--disable-stripping \
> +		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
>  		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
>  		$(SHARED_STATIC_LIBS_OPTS) \
>  		$(FFMPEG_CONF_OPT) \

So I've removed  the unrelated change, and committed your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
