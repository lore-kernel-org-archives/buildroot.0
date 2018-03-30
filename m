From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 30 Mar 2018 23:01:16 +0200
Subject: [Buildroot] [PATCH] package/xterm: Avoid freetype2 path
 poisoning using imake
In-Reply-To: <20180327074434.15306-1-valentin.korenblit@smile.fr>
References: <20180327074434.15306-1-valentin.korenblit@smile.fr>
Message-ID: <c8ccba59-28d3-b495-b111-3c684f084a7b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin, All,

Le 27/03/2018 ? 09:44, Valentin Korenblit a ?crit?:
> When imake is installed on the host, it tries to include
> freetype headers from host, so we must override ac_cv_path_IMAKE
> to avoid this.
> 
> Extract from config.log:
> 
> configure:14803: checking if we should use imake to help
> configure:14820: result: yes
> configure:14829: checking for xmkmf
> configure:14846: found /usr/bin/xmkmf
> configure:14857: result: /usr/bin/xmkmf
> configure:14920: testing Using /usr/bin/xmkmf  ...
> configure:15015: testing IMAKE_CFLAGS  -I. -I/usr/include/freetype2
> 
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
> ---
>  package/xterm/xterm.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index 645de92e22..ff2b77459e 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -14,6 +14,9 @@ XTERM_CONF_OPTS = --enable-256-color \
>  	--x-includes=$(STAGING_DIR)/usr/include \
>  	--x-libraries=$(STAGING_DIR)/usr/lib
>  
> +# Avoid freetype2 path poisoning using imake
> +XTERM_CONF_ENV = ac_cv_path_IMAKE=
> +

If you look at other ac_cv_path_* override on other packages, the syntax should be:
XTERM_CONF_ENV = ac_cv_path_IMAKE=""

This can be fixed while commiting.

With that fixed:

    Reviewed-by: Romain Naour <romain.naour@smile.fr>


Best regards,
Romain


>  ifeq ($(BR2_PACKAGE_XLIB_LIBXFT),y)
>  XTERM_DEPENDENCIES += xlib_libXft
>  XTERM_CONF_OPTS += --enable-freetype \
> 
