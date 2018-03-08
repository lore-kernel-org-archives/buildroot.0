From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 8 Mar 2018 22:48:01 +0100
Subject: [Buildroot] [PATCH] package: dropbear: make PATH configurable
In-Reply-To: <20180308214403.94906-1-mmayer@broadcom.com>
References: <20180308214403.94906-1-mmayer@broadcom.com>
Message-ID: <20180308214801.GA8180@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-03-08 13:44 -0800, Markus Mayer spake thusly:
> Make the default PATH dropbear is using configurable.
> 
> If not specified, it will continue to default to dropbear's
> DEFAULT_PATH.

Isn't it better to jut let the user provide a ~/.profile file which
actually sets the PATH?

Regards,
Yann E. MORIN.

> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> Please let me know what you think. Thanks.
> 
>  package/dropbear/Config.in   | 6 ++++++
>  package/dropbear/dropbear.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 6700778161ba..d38ecf50834a 100644
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
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index 01a1a07b7696..ddbedf3bce93 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -51,6 +51,14 @@ define DROPBEAR_DISABLE_STANDALONE
>  	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
>  endef
>  
> +ifneq ($(BR2_PACKAGE_DROPBEAR_PATH),"")
> +define DROPBEAR_CUSTOM_PATH
> +	$(SED) 's|^\(#define DEFAULT_PATH\).*|\1 $(BR2_PACKAGE_DROPBEAR_PATH)|' $(@D)/options.h
> +endef
> +
> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_CUSTOM_PATH
> +endif
> +
>  define DROPBEAR_INSTALL_INIT_SYSTEMD
>  	$(INSTALL) -D -m 644 package/dropbear/dropbear.service \
>  		$(TARGET_DIR)/usr/lib/systemd/system/dropbear.service
> -- 
> 2.7.4
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
