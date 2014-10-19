From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 00:09:00 +0200
Subject: [Buildroot] [PATCH 24/31] ffmpeg: use arch and cpu instead of
 tune
In-Reply-To: <1413749285-1108-25-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-25-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141019220900.GE12247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-19 22:07 +0200, Thomas Petazzoni spake thusly:
> ffmpeg currently uses BR2_GCC_TARGET_TUNE as the --cpu option
> value. However, there are multiple architectures for which
> BR2_GCC_TARGET_TUNE is not used. After inspecting the ffmpeg configure
> script, we concluded that using the BR2_GCC_TARGET_CPU value if
> available, or the BR2_GCC_TARGET_ARCH value as a fallback was the
> appropriate behavior.
> 
> This allows to remove the reference to BR2_GCC_TARGET_TUNE, which is
> one step towards the removal of this option.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ffmpeg/ffmpeg.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index a3865f3..6c8b899 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -334,6 +334,12 @@ endif
>  
>  FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
>  
> +ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
> +FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_CPU)
> +else ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH),)
> +FFMPEG_CONF_OPTS += --cpu=$(BR2_GCC_TARGET_ARCH)
> +endif
> +
>  # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
>  define FFMPEG_CONFIGURE_CMDS
>  	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
> @@ -349,7 +355,6 @@ define FFMPEG_CONFIGURE_CMDS
>  		--target-os="linux" \
>  		--disable-stripping \
>  		--pkg-config="$(PKG_CONFIG_HOST_BINARY)" \
> -		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
>  		$(SHARED_STATIC_LIBS_OPTS) \
>  		$(FFMPEG_CONF_OPTS) \
>  	)
> -- 
> 2.0.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
