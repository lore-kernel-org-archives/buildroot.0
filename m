From: Carlos Santos <casantos@datacom.com.br>
Date: Sat, 30 Jun 2018 22:57:58 -0300
Subject: [Buildroot] [PATCH] package: dropbear: make PATH configurable
In-Reply-To: <20180309224149.20225-1-mmayer@broadcom.com>
References: <20180309224149.20225-1-mmayer@broadcom.com>
Message-ID: <20180701015758.20354-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus Mayer wrote:

> Make the default PATH dropbear is using configurable.
> 
> If not specified, it will continue to default to dropbear's
> DEFAULT_PATH.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/dropbear/Config.in   | 6 ++++++
>  package/dropbear/dropbear.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 6700778161..0cc68d737d 100644
> --- a/package/dropbear/Config.in
> +++ b/package/dropbear/Config.in
> @@ -55,4 +55,10 @@ config BR2_PACKAGE_DROPBEAR_LASTLOG
>  	  Enable logging of dropbear access to lastlog. Notice that
>  	  Buildroot does not generate lastlog by default.
>  
> +config BR2_PACKAGE_DROPBEAR_PATH
> +	string "dropbear default path"
> +	help
> +	  Use the path specified here as dropbear's default path.
> +	  If not specified, dropbear will use "/usr/bin:/bin".
> +
>  endif

Looks nice but it would be good to add a similar configuration for
openssl, whose default user PATH is "/usr/bin:/bin:/usr/sbin:/sbin".
In fact I believe we should make both ssh servers use the same user
PATH.

> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 01a1a07b76..9da340670a 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -51,6 +51,14 @@ define DROPBEAR_DISABLE_STANDALONE
>  	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
>  endef
>  
> +ifneq ($(BR2_PACKAGE_DROPBEAR_PATH),"")
> +define DROPBEAR_CUSTOM_PATH
> +	$(SED) 's|^\(#define \+DEFAULT_PATH\)[	 ]\+.*|\1 $(BR2_PACKAGE_DROPBEAR_PATH)|' $(@D)/options.h
> +endef
> +
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
> +endif
> +
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service

This must be updated to put customised options in localoptions.h (refer
to commit 2e035a9aecc37b87a277fd53f84743a18a6f03a7).

--
Carlos Santos
DATACOM P&D
