From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Dec 2018 16:26:03 +0100
Subject: [Buildroot] [PATCH v2] package: dropbear: make PATH configurable
In-Reply-To: <20180309224149.20225-1-mmayer@broadcom.com>
References: <20180309224149.20225-1-mmayer@broadcom.com>
Message-ID: <20181216152603.GD2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, All,

On 2018-03-09 14:41 -0800, Markus Mayer spake thusly:
> Make the default PATH dropbear is using configurable.

We've discussed this with Thomas, and as Carlos noticed, we woudl need a
similar solution for openssh.

But pushing the thing even further, we think a generic solution is even
better:

  - in the "System configuration" sub-menu, add a new option that
    basically is "Default PATH" and defaults to /bin:/sbin:/usr/bin:/usr/sbin

  - use that to set PATH in /etc/profile (from the skeleton-init-common
    package)

  - use that for dropbear

  - use that for openssh

Care to have a look?

Regards,
Yann E. MORIN.

> If not specified, it will continue to default to dropbear's
> DEFAULT_PATH.
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
> 
> Changes since v1:
> - Made regex safer
>   + allow multiple spaces after #define
>   + make sure there are spaces or tabs after DEFAULT_PATH
> 
>  package/dropbear/Config.in   | 6 ++++++
>  package/dropbear/dropbear.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/dropbear/Config.in b/package/dropbear/Config.in
> index 6700778161ba..0cc68d737d2c 100644
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
> index 01a1a07b7696..9da340670a70 100644
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
