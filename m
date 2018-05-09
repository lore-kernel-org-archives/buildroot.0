From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 May 2018 09:47:43 +0200
Subject: [Buildroot] [PATCH 1/1] libcap: only install shared version
In-Reply-To: <20180508161136.13531-1-fontaine.fabrice@gmail.com>
References: <20180508161136.13531-1-fontaine.fabrice@gmail.com>
Message-ID: <20180509094743.6eb34b9b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 May 2018 18:11:36 +0200, Fabrice Fontaine wrote:

> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
> index 48c2cb3456..247fd8a58f 100644
> --- a/package/libcap/libcap.mk
> +++ b/package/libcap/libcap.mk
> @@ -20,8 +20,12 @@ LIBCAP_MAKE_TARGET = libcap.a libcap.pc
>  LIBCAP_MAKE_INSTALL_TARGET = install-static
>  else
>  LIBCAP_MAKE_TARGET = all
> +ifeq ($(BR2_SHARED_LIBS),y)
> +LIBCAP_MAKE_INSTALL_TARGET = install-shared
> +else
>  LIBCAP_MAKE_INSTALL_TARGET = install
>  endif
> +endif

I think we could use a clearer approach:

ifeq ($(BR2_STATIC_LIBS),y)
LIBCAP_MAKE_TARGET = libcap.a libcap.pc
LIBCAP_MAKE_INSTALL_TARGET = install-static
else if ($(BR2_SHARED_LIBS),y)
LIBCAP_MAKE_TARGET = all
LIBCAP_MAKE_INSTALL_TARGET = install-shared
else
LIBCAP_MAKE_TARGET = all
LIBCAP_MAKE_INSTALL_TARGET = install
endif

is a lot clearer to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
