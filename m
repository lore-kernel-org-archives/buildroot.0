From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 28 Oct 2011 12:16:10 +0800
Subject: [Buildroot] [PATCH 3/3] mplayer: Enable live and tv options
In-Reply-To: <1316509288-31106-3-git-send-email-keguang.zhang@gmail.com>
References: <1316509288-31106-1-git-send-email-keguang.zhang@gmail.com>
 <1316509288-31106-3-git-send-email-keguang.zhang@gmail.com>
Message-ID: <CAJhJPsXQzprnSW5eggHMxEofNOZsZX+C7SVMz3UTR2dExAR4Tg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump

2011/9/20, keguang.zhang at gmail.com <keguang.zhang@gmail.com>:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> 1.Enable TV interface.
> 2.Enable LIVE555 Streaming Media if live555 is available.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  package/multimedia/mplayer/mplayer.mk |   22 ++++++++++++++++++----
>  1 files changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/package/multimedia/mplayer/mplayer.mk
> b/package/multimedia/mplayer/mplayer.mk
> index f735464..416572c 100644
> --- a/package/multimedia/mplayer/mplayer.mk
> +++ b/package/multimedia/mplayer/mplayer.mk
> @@ -75,6 +75,22 @@ else
>  MPLAYER_CONF_OPTS += --disable-mad
>  endif
>
> +ifeq ($(BR2_PACKAGE_LIVE555),y)
> +MPLAYER_DEPENDENCIES += live555
> +MPLAYER_CONF_OPTS += --enable-live
> +MPLAYER_LIVE555_CFLAGS += -I$(STAGING_DIR)/usr/include/live/liveMedia
> +MPLAYER_LIVE555_CFLAGS += -I$(STAGING_DIR)/usr/include/live/groupsock
> +MPLAYER_LIVE555_CFLAGS +=
> -I$(STAGING_DIR)/usr/include/live/UsageEnvironment
> +MPLAYER_LIVE555_CFLAGS +=
> -I$(STAGING_DIR)/usr/include/live/BasicUsageEnvironment
> +MPLAYER_LIVE555_LDFLAGS += -lliveMedia
> +MPLAYER_LIVE555_LDFLAGS += -lgroupsock
> +MPLAYER_LIVE555_LDFLAGS += -lUsageEnvironment
> +MPLAYER_LIVE555_LDFLAGS += -lBasicUsageEnvironment
> +MPLAYER_LIVE555_LDFLAGS += -lstdc++
> +else
> +MPLAYER_CONF_OPTS += --disable-live
> +endif
> +
>  MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
>  MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
>  MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
> @@ -106,15 +122,13 @@ define MPLAYER_CONFIGURE_CMDS
>  		--cc="$(TARGET_CC)" \
>  		--as="$(TARGET_AS)" \
>  		--charset=UTF-8 \
> -		--extra-cflags="$(TARGET_CFLAGS)" \
> -		--extra-ldflags="$(TARGET_LDFLAGS)" \
> +		--extra-cflags="$(TARGET_CFLAGS) $(MPLAYER_LIVE555_CFLAGS)" \
> +		--extra-ldflags="$(TARGET_LDFLAGS) $(MPLAYER_LIVE555_LDFLAGS)" \
>  		--enable-mad \
>  		--enable-fbdev \
>  		$(MPLAYER_CONF_OPTS) \
>  		--enable-cross-compile \
>  		--disable-ivtv \
> -		--disable-tv \
> -		--disable-live \
>  		--enable-dynamic-plugins \
>  	)
>  endef
> --
> 1.7.1
>
>


-- 
Best Regards!
Kelvin
