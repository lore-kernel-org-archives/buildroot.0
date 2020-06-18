From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 22:27:59 +0200
Subject: [Buildroot] [PATCH 2/3] wireless-regdb: add option to rebuild
In-Reply-To: <20200612053110.15316-3-dev.kurt@vandijck-laurijssen.be>
References: <20200612053110.15316-1-dev.kurt@vandijck-laurijssen.be>
 <20200612053110.15316-3-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200618222759.622bda7d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kurt,

On Fri, 12 Jun 2020 07:31:09 +0200
Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> wrote:

> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Could you expand the commit log to explain why rebuilding the wireless
regdb might be necessary ?

> diff --git a/package/wireless-regdb/0003-python3.patch b/package/wireless-regdb/0003-python3.patch
> new file mode 100644
> index 0000000000..87226b763f

We need all patches to have a description + Signed-off-by line, and be
generated using "git format-patch -N" if the upstream project uses Git.

> diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
> index 17350a41d8..cb8ec20977 100644
> --- a/package/wireless-regdb/Config.in
> +++ b/package/wireless-regdb/Config.in
> @@ -12,3 +12,13 @@ config BR2_PACKAGE_WIRELESS_REGDB
>  	  application is needed.
>  
>  	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
> +
> +if BR2_PACKAGE_WIRELESS_REGDB
> +
> +config BR2_WIRELESS_REGDB_REBUILD
> +	bool "rebuild wireless-regdb"
> +	help
> +	  Say no to use the pre-built wireless regdb.
> +
> +	  Say yes to rebuild, and make sure to deploy your wireless-regdb public key.

Lines are too long.

Could you give a bit of background about this wireless-regdb public
key? I see that the Makefile is using some private/public key pair from
the user home directory, this looks absolutely horrible in the context
of Buildroot. Should we instead have Config.in options to provide the
path to the private/public key pair ?

> +endif
> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 31b62e36e1..d3b30c7fce 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -10,12 +10,21 @@ WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
>  WIRELESS_REGDB_LICENSE = ISC
>  WIRELESS_REGDB_LICENSE_FILES = LICENSE
>  
> +ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
> +WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
> +define WIRELESS_REGDB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)

Why do you need the "clean" step here ? To force removing the
pre-generated wireless regdb, and therefore have the next make
invocation re-generate it ?

> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_CRDA),y)
>  define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
>  	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
>  		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
> -	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
> -		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
> +	$(INSTALL) -d $(TARGET_DIR)/etc/wireless-regdb/pubkeys
> +	$(INSTALL) -m 644 $(wildcard $(@D)/*.key.pub.pem) \
> +		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/

So here you install all public keys. But how are they going to end up
in the wireless-regdb build directory ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
