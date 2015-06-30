From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2015 19:52:08 +0200
Subject: [Buildroot] [v3 4/4] package/nodejs: Define NPM command for
 other packages to use
In-Reply-To: <1435660966-11347-4-git-send-email-martin@barkynet.com>
References: <1435660966-11347-1-git-send-email-martin@barkynet.com>
 <1435660966-11347-4-git-send-email-martin@barkynet.com>
Message-ID: <20150630175208.GC3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2015-06-30 11:42 +0100, Martin Bark spake thusly:
> Other nodejs-related packages will need to call npm with the same set of
> arguments as is currently used by the nodejs package itself.
> 
> To avoid duplicating this code, set the NPM variable so those packages can
> re-use it.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Note: currently, this is only used in the nodejs package itself. I
> plan on sending new nodejs-related packages that will use this, like
> a pm2 (https://github.com/Unitech/pm2) package which I have tested
> successfully using this $(NPM).
> 
> Changes v2 -> v3
>  - Improved commit message (Suggested by Yann E. MORIN)
> 
> Changes v1 -> v2
>  - No changes
> ---
>  package/nodejs/nodejs.mk | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 78db49d..ea8ec0f5 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -95,6 +95,14 @@ NODEJS_MODULES_LIST= $(call qstrip,\
>  	$(if $(BR2_PACKAGE_NODEJS_MODULES_COFFEESCRIPT),coffee-script) \
>  	$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL))
>  
> +# Define NPM for other packages to use
> +NPM = $(TARGET_CONFIGURE_OPTS) \
> +	LD="$(TARGET_CXX)" \
> +	npm_config_arch=$(NODEJS_CPU) \
> +	npm_config_target_arch=$(NODEJS_CPU) \
> +	npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> +	$(HOST_DIR)/usr/bin/npm
> +
>  #
>  # We can only call NPM if there's something to install.
>  #
> @@ -104,13 +112,7 @@ define NODEJS_INSTALL_MODULES
>  	# npm install call below and setting npm_config_rollback=false can both
>  	# help in diagnosing the problem.
>  	(cd $(TARGET_DIR)/usr/lib && mkdir -p node_modules && \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		LD="$(TARGET_CXX)" \
> -		npm_config_arch=$(NODEJS_CPU) \
> -		npm_config_target_arch=$(NODEJS_CPU) \
> -		npm_config_nodedir=$(BUILD_DIR)/nodejs-$(NODEJS_VERSION) \
> -		$(HOST_DIR)/usr/bin/npm install \
> -		$(NODEJS_MODULES_LIST) \
> +		$(NPM) install $(NODEJS_MODULES_LIST) \
>  	)
>  
>  	# Symlink all executables in $(TARGET_DIR)/usr/lib/node_modules/.bin to
> -- 
> 2.1.4
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
