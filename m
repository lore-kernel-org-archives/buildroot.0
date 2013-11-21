From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Nov 2013 23:18:09 +0100
Subject: [Buildroot] [PATCH 1/2] pcre: add options to enable UTF and UCP
 support
In-Reply-To: <1385069096.10963.2.camel@bender>
References: <1385069096.10963.2.camel@bender>
Message-ID: <528E86A1.60101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Sven,

  Thanks for your patch.

On 21/11/13 22:24, Sven Neumann wrote:
>

  Spurious empty line.

> Allow to compile PCRE with UTF-8/16/32 support and with
> support for Unicode properties.
>
> Signed-off-by: Sven Neumann <neumann@teufel.de>
> ---
>   package/pcre/Config.in | 11 +++++++++++
>   package/pcre/pcre.mk   |  2 ++
>   2 files changed, 13 insertions(+)
>
> diff --git a/package/pcre/Config.in b/package/pcre/Config.in
> index dc92274..3b93092 100644
> --- a/package/pcre/Config.in
> +++ b/package/pcre/Config.in
> @@ -19,4 +19,15 @@ config BR2_PACKAGE_PCRE_32
>   	help
>   	  This option builds the 32-bits pcre library, i.e 'libpcre32'
>
> +config BR2_PACKAGE_PCRE_UTF
> +	bool "UTF-8/16/32 support in pcre"
> +	help
> +	  This option builds the pcre library with UTF-8/16/32 support'
> +
> +config BR2_PACKAGE_PCRE_UCP
> +	bool "Unicode properties support in pcre"
> +        select BR2_PACKAGE_PCRE_UTF

  Indent with tab, not spaces.

> +	help
> +	  This option builds the pcre library with Unicode properties support (implies UTF-8/16/32 support)'

  Should be wrapped at 80 columns. [We should really document the 
wrapping guidelines...]


  With these changes, you can add my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  (build-tested on x86_64)

> +
>   endif
> diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
> index bf86a3d..2637354 100644
> --- a/package/pcre/pcre.mk
> +++ b/package/pcre/pcre.mk
> @@ -19,5 +19,7 @@ endif
>   PCRE_CONF_OPT += --enable-pcre8
>   PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
>   PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
> +PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
> +PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
>
>   $(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
