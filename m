From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Oct 2011 23:16:39 +0200
Subject: [Buildroot] [PATCH] package: add polarssl library support
In-Reply-To: <1318435980-27451-1-git-send-email-plagnioj@jcrosoft.com>
References: <1318435980-27451-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <20111012231639.4182ac22@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 12 Oct 2011 18:13:00 +0200,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> diff --git a/package/polarssl/polarssl.mk b/package/polarssl/polarssl.mk
> new file mode 100644
> index 0000000..915c5c3
> --- /dev/null
> +++ b/package/polarssl/polarssl.mk
> @@ -0,0 +1,29 @@
> +#############################################################
> +#
> +# polarssl
> +#
> +#############################################################
> +POLARSSL_VERSION:=1.0.0

POLARSSL_VERSION = 1.0.0

> +POLARSSL_SOURCE = polarssl-$(POLARSSL_VERSION)-gpl.tgz
> +POLARSSL_SITE = http://polarssl.org/code/releases/
> +POLARSSL_INSTALL_STAGING = YES
> +
> +define POLARSSL_CONFIGURE_CMDS
> +	true
> +endef

Remove this POLARSSL_CONFIGURE_CMDS...

> +define POLARSSL_BUILD_CMDS
> +	AR="$(TARGET_AR)" CC="$(TARGET_CC)" $(MAKE) -C $(@D)/library all
> +endef

You probably want to pass the cflags as well ?

> +define POLARSSL_INSTALL_STAGING_CMDS
> +	install -d $(STAGING_DIR)/usr/include/polarssl
> +	install -D -m 755 $(@D)/include/polarssl/*.h $(STAGING_DIR)/usr/include/polarssl/
> +	install -D -m 644 $(@D)/library/libpolarssl.* $(STAGING_DIR)/usr/lib
> +endef
> +
> +define POLARSSL_INSTALL_TARGET_CMDS
> +	install -D -m 644 $(@D)/library/libpolarssl.* $(TARGET_DIR)/usr/lib
> +endef
> +
> +$(eval $(call AUTOTARGETS,package,polarssl))

and use GENTARGETS instead, since this package is not autotools-based.
Moreover, the "package,polarssl" arguments are no longer needed.
Therefore:

$(eval $(call GENTARGETS))

With GENTARGETS, the default <pkg>_CONFIGURE_CMDS is empty, which is
why you won't have to define it to the true command.

Just curious, how does this compare to OpenSSL or GnuTLS, are are there
any well-known users of this library?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
