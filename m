From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jul 2016 00:54:46 +0200
Subject: [Buildroot] [PATCH 3/4] package/pulseaudio: add WebRTC optional
 dependency
In-Reply-To: <1467585172-10299-3-git-send-email-romain.naour@gmail.com>
References: <1467585172-10299-1-git-send-email-romain.naour@gmail.com>
 <1467585172-10299-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20160703225446.GG3482@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-04 00:32 +0200, Romain Naour spake thusly:
> WebRTC is an optional pulseaudio dependency which require C++11
> support in the toolchain.

This change has nothing to do with the c++11 support, has it?

> Also the autotool script provide
> --enable/--disable option for this support, so use them in
> pulseaudio.mk.

I would rephrase that commit log such as;

    package/pulseaudio: explicitly enable/disable WebRTC support

    Currently, pulseaudio optionally depends on webrtc if it is enabled.

    However, it is never explcitly enabled or disabled, although
    pulseaudio's ./configure has --enable/disable-webrtc-aec.

    Forcibly enable/disable webrtc support usign those options.

    Signed-off-by: You
    Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

(You can keep my reviewd-by tag when you respin)

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/pulseaudio/pulseaudio.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
> index bc95d91..9ef11bc 100644
> --- a/package/pulseaudio/pulseaudio.mk
> +++ b/package/pulseaudio/pulseaudio.mk
> @@ -34,7 +34,6 @@ PULSEAUDIO_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
>  	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
>  	$(if $(BR2_PACKAGE_FFTW),fftw) \
> -	$(if $(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),webrtc-audio-processing) \
>  	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
>  
>  ifeq ($(BR2_PACKAGE_GDBM),y)
> @@ -88,6 +87,13 @@ else
>  PULSEAUDIO_CONF_OPTS += --disable-udev
>  endif
>  
> +ifeq ($(BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING),y)
> +PULSEAUDIO_CONF_OPTS += --enable-webrtc-aec
> +PULSEAUDIO_DEPENDENCIES += webrtc-audio-processing
> +else
> +PULSEAUDIO_CONF_OPTS += --disable-webrtc-aec
> +endif
> +
>  ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
>  # The optional webrtc echo canceller is written in C++, causing auto* to want
>  # to link module-echo-cancel.so with CXX even if webrtc ISN'T used.
> -- 
> 2.5.5
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
