From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 13:02:12 +0200
Subject: [Buildroot] [PATCH v2 1/7] package/libdvbcsa: New package
In-Reply-To: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413222357-8299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141014110212.GA22208@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

Ah, there's a new series for this... Dam, I reviewed the previous. I'll
review this one a bit loater.

Regards,
Yann E. MORIN.

On 2014-10-13 19:45 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                |    1 +
>  package/libdvbcsa/Config.in      |    9 +++++++++
>  package/libdvbcsa/libdvbcsa.hash |    6 ++++++
>  package/libdvbcsa/libdvbcsa.mk   |   31 +++++++++++++++++++++++++++++++
>  4 files changed, 47 insertions(+)
>  create mode 100644 package/libdvbcsa/Config.in
>  create mode 100644 package/libdvbcsa/libdvbcsa.hash
>  create mode 100644 package/libdvbcsa/libdvbcsa.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 186ffea..da059d8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -745,6 +745,7 @@ endmenu
>  menu "Multimedia"
>  	source "package/libass/Config.in"
>  	source "package/libbluray/Config.in"
> +	source "package/libdvbcsa/Config.in"
>  	source "package/libdvbsi/Config.in"
>  	source "package/libdvdnav/Config.in"
>  	source "package/libdvdread/Config.in"
> diff --git a/package/libdvbcsa/Config.in b/package/libdvbcsa/Config.in
> new file mode 100644
> index 0000000..dd7dc15
> --- /dev/null
> +++ b/package/libdvbcsa/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBDVBCSA
> +	bool "libdvbcsa"
> +	help
> +	  libdvbcsa is a free implementation of the DVB Common Scrambling
> +	  Algorithm - DVB/CSA - with encryption and decryption capabilities
> +
> +	  As libdvbcsa implements a standard, it is completely legal to use it.
> +
> +	  http://www.videolan.org/developers/libdvbcsa.html
> diff --git a/package/libdvbcsa/libdvbcsa.hash b/package/libdvbcsa/libdvbcsa.hash
> new file mode 100644
> index 0000000..5b3fa4c
> --- /dev/null
> +++ b/package/libdvbcsa/libdvbcsa.hash
> @@ -0,0 +1,6 @@
> +# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha256
> +sha256	4db78af5cdb2641dfb1136fe3531960a477c9e3e3b6ba19a2754d046af3f456d	libdvbcsa-1.1.0.tar.gz
> +# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.sha1
> +sha1	5f4640a7e93ae6494f24a881414e5c343f803365				libdvbcsa-1.1.0.tar.gz
> +# From http://download.videolan.org/pub/videolan/libdvbcsa/1.1.0/libdvbcsa-1.1.0.tar.gz.md5
> +md5	478ab1ca56ca58d2667da6ce22f74e39					libdvbcsa-1.1.0.tar.gz
> diff --git a/package/libdvbcsa/libdvbcsa.mk b/package/libdvbcsa/libdvbcsa.mk
> new file mode 100644
> index 0000000..ef1d957
> --- /dev/null
> +++ b/package/libdvbcsa/libdvbcsa.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# libdvbcsa
> +#
> +################################################################################
> +
> +LIBDVBCSA_VERSION = 1.1.0
> +LIBDVBCSA_SITE = http://download.videolan.org/pub/videolan/libdvbcsa/$(LIBDVBCSA_VERSION)
> +LIBDVBCSA_LICENSE = GPLv2+
> +LIBDVBCSA_LICENSE_FILES = COPYING
> +LIBDVBCSA_INSTALL_STAGING = YES
> +
> +ifeq ($(BR2_X86_CPU_HAS_MMX),y)
> +LIBDVBCSA_CONF_OPTS += --enable-mmx
> +else
> +LIBDVBCSA_CONF_OPTS += --disable-mmx
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> +LIBDVBCSA_CONF_OPTS += --enable-sse2
> +else
> +LIBDVBCSA_CONF_OPTS += --disable-sse2
> +endif
> +
> +ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
> +LIBDVBCSA_CONF_OPTS += --enable-altivec
> +else
> +LIBDVBCSA_CONF_OPTS += --disable-altivec
> +endif
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.10.4
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
