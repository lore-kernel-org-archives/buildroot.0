From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 21:06:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Improve logic for
 GnuTLS/OpenSSL
In-Reply-To: <1445184950-9386-2-git-send-email-bernd.kuhls@t-online.de>
References: <1445184950-9386-1-git-send-email-bernd.kuhls@t-online.de>
 <1445184950-9386-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151018210609.6f73002d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 18 Oct 2015 18:15:50 +0200, Bernd Kuhls wrote:

> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index d4815ca..dd31847 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -203,19 +203,12 @@ endif
>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>  FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
>  FFMPEG_DEPENDENCIES += gnutls
> -else
> -FFMPEG_CONF_OPTS += --disable-gnutls
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -# openssl isn't license compatible with GPL
> -ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
> -FFMPEG_CONF_OPTS += --disable-openssl
> -else
> +# OpenSSL license is not compatible with the LGPL license of ffmpeg.
> +else ifneq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)

Where do you check that OpenSSL is enabled?

>  FFMPEG_CONF_OPTS += --enable-openssl
>  FFMPEG_DEPENDENCIES += openssl
> -endif
>  else
> -FFMPEG_CONF_OPTS += --disable-openssl
> -endif
> +FFMPEG_CONF_OPTS += --disable-gnutls --disable-openssl
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDCADEC),y)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
