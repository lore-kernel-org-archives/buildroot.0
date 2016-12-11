From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:33:17 +0100
Subject: [Buildroot] [PATCH v5,1/1] php: add apache support
In-Reply-To: <1481476862-7791-1-git-send-email-fabrice.fontaine@orange.com>
References: <1481476862-7791-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161211183317.77924492@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 18:21:02 +0100, Fabrice Fontaine wrote:

>  if BR2_PACKAGE_PHP
>  
> +config BR2_PACKAGE_PHP_SAPI_APACHE
> +	bool "Apache interface"
> +	depends on BR2_PACKAGE_APACHE
> +	select BR2_PACKAGE_PHP_HAS_SAPI

This option no longer exists, so this select should be removed.

> +ifeq ($(BR2_PACKAGE_PHP_SAPI_APACHE),y)
> +PHP_DEPENDENCIES += apache
> +PHP_CONF_OPTS += --with-apxs2=$(STAGING_DIR)/usr/bin/apxs

This looks strange:

 - If this file path is used during the build, then it's broken because
   /usr/bin/apxs in $(STAGING_DIR) is built for the target
   architecture (unless it's some kind of script, of course).

 - If this file path is used at runtime, then it's broken because
   $(STAGING_DIR)/usr/bin/apxs doesn't exist once on the target.

In any case, a comment above this would be good to have to explain why
it's correct (if it is).

> +# apxs configuration must be patched to update the httpd.conf in the
> +# target directory with the correct relative path. Without these hooks,
> +# apxs will only update correctly the httpd.conf in the staging directory.
> +define PHP_SET_TARGET_PREFIX_APXS
> +	$(SED) 's%^prefix =.*%prefix = $(TARGET_DIR)/usr%' \
> +		$(STAGING_DIR)/usr/build/config_vars.mk
> +endef
> +
> +PHP_PRE_INSTALL_TARGET_HOOKS += PHP_SET_TARGET_PREFIX_APXS
> +
> +define PHP_SET_STAGING_PREFIX_APXS
> +	$(SED) 's%^prefix =.*%prefix = $(STAGING_DIR)/usr%' \
> +		$(STAGING_DIR)/usr/build/config_vars.mk
> +endef
> +
> +PHP_POST_INSTALL_TARGET_HOOKS += PHP_SET_STAGING_PREFIX_APXS

This looks rather odd/ugly. Do we have a better solution for this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
