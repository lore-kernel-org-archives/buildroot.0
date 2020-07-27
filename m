From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 22:12:24 +0200
Subject: [Buildroot] [PATCH 5/6] wireless-regdb: add explicit signing
 key config
In-Reply-To: <20200702103618.5147-6-dev.kurt@vandijck-laurijssen.be>
References: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
 <20200702103618.5147-6-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200727221224.1326c3db@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kurt,

On Thu,  2 Jul 2020 12:36:17 +0200
Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> wrote:

> +if BR2_WIRELESS_REGDB_REBUILD
> +
> +config BR2_WIRELESS_REGDB_COMMONNAME
> +	string "CommonName for x509 cert"
> +	default "buildroot"
> +
> +config BR2_WIRELESS_REGDB_PRIVKEY
> +	string "private key for signing wireless-regdb"
> +	default "~/.buildroot"
> +	help
> +	  Path to file containing private key to sign wireless-regdb.
> +	  The key should be in .pem format.
> +
> +	  If the file does not exist, a new key will be generated

Ah, OK, so that's where you handle the thing. If the user wants to keep
the same private/public key pair across Buildroot rebuilds, he should
place into the folder pointed to by BR2_WIRELESS_REGDB_PRIVKEY ?

Can I suggest that instead we make this option empty by default, and in
this case, a key is generated in $(HOST_DIR) ?

Anyway, the default value of ~/.buildroot is a bit weird. ~/.buildroot
looks like a directory more than a file that contains a key.

> diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
> index 7c6b140a4a..d60428a8f0 100644
> --- a/package/wireless-regdb/wireless-regdb.mk
> +++ b/package/wireless-regdb/wireless-regdb.mk
> @@ -13,16 +13,34 @@ WIRELESS_REGDB_LICENSE_FILES = LICENSE
>  
>  ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
>  
> +WIRELESS_REGDB_PRIVKEY = $(call qstrip,$(BR2_WIRELESS_REGDB_PRIVKEY))
> +WIRELESS_REGDB_PRIVKEYNAME = $(patsubst .%,%,$(notdir $(WIRELESS_REGDB_PRIVKEY)))

I'm not sure what this PRIVKEYNAME is.

> +# make sure PRIVKEYNAME is set

This is not making sure WIRELESS_REGDB_PRIVKEYNAME is set: it is
setting WIRELESS_REGDB_PRIVKEY.

> +ifeq ($(WIRELESS_REGDB_PRIVKEYNAME),)
> +WIRELESS_REGDB_PRIVKEY=~/.buildroot
> +endif
> +
> +ifeq ($(call qstrip,$(BR2_WIRELESS_REGDB_COMMONNAME)),)
> +BR2_WIRELESS_REGDB_COMMONNAME = "buildroot"
> +endif

We normally handle this like that:

WIRELESS_REGDB_COMMONNAME = $(call qstrip,$(BR2_WIRELESS_REGDB_COMMONNAME))

ifeq ($(WIRELESS_REGDB_COMMONNAME),)
$(error "ERROR: BR2_WIRELESS_REGDB_COMMONNAME is empty")
endif

>  define WIRELESS_REGDB_PATCH_PYTHON3
>  	sed -i -e '1 s/python$$/python3/' $(@D)/*.py
> +	sed -i -e 's/= sforshee$$/= $(call qstrip,$(BR2_WIRELESS_REGDB_COMMONNAME))/' $(@D)/gen-pubcert.sh
>  endef
>  
>  WIRELESS_REGDB_POST_PATCH_HOOKS += WIRELESS_REGDB_PATCH_PYTHON3
>  
>  WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
> +

This is kind of a spurious change, not really related to this commit.

>  define WIRELESS_REGDB_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> -		REGDB_AUTHOR=buildroot
> +		REGDB_PRIVKEY=$(WIRELESS_REGDB_PRIVKEY) \
> +		REGDB_PUBKEY=$(WIRELESS_REGDB_PRIVKEYNAME).pub \
> +		REGDB_PUBCERT=$(WIRELESS_REGDB_PRIVKEYNAME).x509.pem

I don't quite understand how the private key file name relates to the
public key and public key certificates file names. Could you clarify ?

> +	openssl x509 -in $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).x509.pem \

Use $(HOST_DIR)/bin/openssl here.

> +		-outform DER \
> +		-out $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).x509
>  endef
>  endif
>  
> @@ -32,8 +50,8 @@ define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
>  		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
>  	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
>  		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
> -	$(INSTALL) -m 644 -D -T ~/.wireless-regdb-buildroot.key.pub.pem \
> -		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/buildroot.key.pub.pem
> +	$(INSTALL) -m 644 -D -T $(@D)/$(WIRELESS_REGDB_PRIVKEYNAME).pub \
> +		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/$(WIRELESS_REGDB_PRIVKEYNAME).pub
>  endef
>  endif
>  

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
