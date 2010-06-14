From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jun 2010 10:45:58 +0200
Subject: [Buildroot] [PATCH 1/4] ffmpeg: add new package
Message-ID: <L3ZXOM$31AF2E38C264FF208B9F31D5E6ED0E95@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> >>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
>  Luca> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> Looks good - A few comments though:

Ok with almost all. See below.

> 
>  Luca> ---
>  Luca>  CHANGES                             |    2 +-
>  Luca>  package/multimedia/Config.in        |    1 +
>  Luca>  package/multimedia/ffmpeg/Config.in |   25 +++++++++++
>  Luca>  package/multimedia/ffmpeg/ffmpeg.mk |   79 +++++++++++++++++++++++++++++++++++
>  Luca>  4 files changed, 106 insertions(+), 1 deletions(-)
>  Luca>  create mode 100644 package/multimedia/ffmpeg/Config.in
>  Luca>  create mode 100644 package/multimedia/ffmpeg/ffmpeg.mk
> 
>  Luca> diff --git a/CHANGES b/CHANGES
>  Luca> index 3ba7195..6ca4fc9 100644
>  Luca> --- a/CHANGES
>  Luca> +++ b/CHANGES
>  Luca> @@ -4,7 +4,7 @@
>  
>  Luca>  	New GTK-based configurator, usable using 'make gconfig'.
>  
>  Luca> -	New packages: cgilua, copas, coxpcall, luafilesystem,
>  Luca> +	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
>  Luca>  	luasocket, rings, wsapi, xavante
> 
> I would prefer if patches don't edit CHANGES - There's too high risk for
> merge conflicts.
> 
>  Luca> +config BR2_PACKAGE_FFMPEG_GPL
>  Luca> +	bool "Enable GPL code"
>  Luca> +	default n
>  Luca> +config BR2_PACKAGE_FFMPEG_NONFREE
>  Luca> +	bool "Enable nonfree code"
>  Luca> +	default n
> 
> 'n' is default, so there's no need for those lines.
> 
>  Luca> +ifeq ($(BR2_INET_IPV6),y)
>  Luca> +FFMPEG_CONF_OPT += --enable-ipv6
>  Luca> +else
>  Luca> +FFMPEG_CONF_OPT += --disable-ipv6
>  Luca> +endif
> 
> We do have a generic DISABLE_IPV6 if ffmpeg detects ipv6 support
> automatically even if --enable-ipv6 isn' passed.
> 
>  Luca> +# Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
>  Luca> +define FFMPEG_CONFIGURE_CMDS
>  Luca> +	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
>  Luca> +	$(TARGET_CONFIGURE_OPTS) \
>  Luca> +	$(TARGET_CONFIGURE_ARGS) \
>  Luca> +	$(TARGET_CONFIGURE_ENV) \
>  Luca> +	$(FFMPEG_CONF_ENV) \
>  Luca> +	./configure \
>  Luca> +		--enable-cross-compile	\
>  Luca> +		--cross-prefix=$(TARGET_CROSS) \
>  Luca> +		--sysroot=$(STAGING_DIR) \
>  Luca> +		--host-cc=$(HOSTCC) \
>  Luca> +		--cc=$(TARGET_CC) \
>  Luca> +		--arch=$(BR2_ARCH) \
>  Luca> +		--extra-cflags=-fPIC \
>  Luca> +		$(DISABLE_NLS) \
>  Luca> +		$(DISABLE_LARGEFILE) \
>  Luca> +		$(DISABLE_IPV6) \
>  Luca> +		$(FFMPEG_CONF_OPT) \
> 
> Does ffmpeg configure handle the -q (quiet) flag? If so, please add
> $(QUIET) as well.

It doesn't.

> 
> Is --cc needed? Doesn't it just use the CC environment variable? If not,
> what about TARGET_CFLAGS / TARGET_LDFLAGS?
> 
>  Luca> +	)
>  Luca> +endef
>  Luca> +
>  Luca> +# Override FFMPEG_INSTALL_TARGET_OPT: FFmpeg does not support install-strip
>  Luca> +FFMPEG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
> 
> FYI, in the future I would like to get rid of the 'make install vs make
> install-strip', but for now this is fine.
> 
> -- 
> Bye, Peter Korsgaard
> 

Luca
