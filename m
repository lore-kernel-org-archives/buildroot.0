From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 26 May 2017 23:25:14 +0200
Subject: [Buildroot] [PATCH 1/1] easy-rsa: new package
In-Reply-To: <1495663577-4622-1-git-send-email-julien@vdg.name>
References: <1495663577-4622-1-git-send-email-julien@vdg.name>
Message-ID: <290b5779-ab49-ff64-fc04-b187315f3f3e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le 25/05/2017 ? 00:06, Julien Viard de Galbert a ?crit :
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  package/Config.in              |  1 +
>  package/easy-rsa/Config.in     | 11 +++++++++++
>  package/easy-rsa/easy-rsa.hash |  2 ++
>  package/easy-rsa/easy-rsa.mk   | 18 ++++++++++++++++++
>  4 files changed, 32 insertions(+)
>  create mode 100644 package/easy-rsa/Config.in
>  create mode 100644 package/easy-rsa/easy-rsa.hash
>  create mode 100644 package/easy-rsa/easy-rsa.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 71bd44a..6f71a08 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -934,6 +934,7 @@ menu "Crypto"
>  	source "package/botan/Config.in"
>  	source "package/ca-certificates/Config.in"
>  	source "package/cryptodev/Config.in"
> +	source "package/easy-rsa/Config.in"
>  	source "package/gcr/Config.in"
>  	source "package/gnutls/Config.in"
>  	source "package/libassuan/Config.in"
> diff --git a/package/easy-rsa/Config.in b/package/easy-rsa/Config.in
> new file mode 100644
> index 0000000..7a063cd
> --- /dev/null
> +++ b/package/easy-rsa/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_EASY_RSA
> +	bool "easy-rsa"

BR2_PACKAGE_OPENSSL must be selected here since BR2_PACKAGE_OPENSSL_BIN depend
on it.

Also, add a comment to say that's a runtime dependency.
easy-rsa script use openssl binaries.

> +	select BR2_PACKAGE_OPENSSL_BIN
> +	help
> +	  Simple shell based CA utility

There is no dependency of the type of the default shell ?
It can be bash, dash, mksh, zsh, ash.

> +	  This package eases the creation of certificates, for example
> +	  for openvpn clients.
> +
> +	  This was formerly part of the openvpn package.
> +
> +	  https://github.com/OpenVPN/easy-rsa
> diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
> new file mode 100644
> index 0000000..e2d658a
> --- /dev/null
> +++ b/package/easy-rsa/easy-rsa.hash
> @@ -0,0 +1,2 @@
> +# Locally computed: (after verifying gpg sig)
> +sha512 d20f646e33ec803444dfcd446553f1d6001227fedec93280c212b34cccee11b184599f1b2ae6a3ce9cf6c9ac52f2b840ebb645536df6ddf55382fa25c22df81f EasyRSA-3.0.1.tgz
> diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
> new file mode 100644
> index 0000000..384e4b1
> --- /dev/null
> +++ b/package/easy-rsa/easy-rsa.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# easy-rsa
> +#
> +################################################################################
> +
> +EASY_RSA_VERSION = 3.0.1
> +EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
> +EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)
> +
> +define EASY_RSA_INSTALL_TARGET_CMDS
> +    $(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin
> +    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types

This can be done with a simple mkdir -p $(TARGET_DIR)/etc/easy-rsa/x509-types

> +    $(INSTALL) -D -m 0644 $(@D)/x509-types/* $(TARGET_DIR)/etc/easy-rsa/x509-types
> +    $(INSTALL) -T -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars

Usually -T option is not used to copy a simple file.

Best regards,
Romain

> +endef
> +
> +$(eval $(generic-package))
> 
