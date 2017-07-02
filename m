From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 2 Jul 2017 23:55:31 +0200
Subject: [Buildroot] [PATCH v3 1/1] easy-rsa: new package
In-Reply-To: <1496091819-27396-1-git-send-email-julien@vdg.name>
References: <1496091819-27396-1-git-send-email-julien@vdg.name>
Message-ID: <22970151-885b-9718-6d72-cc49e78f7b4e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

Le 29/05/2017 ? 23:03, Julien Viard de Galbert a ?crit :
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
> Changes v1 -> v2
>   - Install missing file 'openssl-1.0.cnf'
>   - Add select BR2_PACKAGE_OPENSSL and update description (Thanks Romain Naour)
>   - Updated INSTALL call (Thanks Romain Naour)
> 
> Changes v2 -> v3 after Thomas Petazzoni's review (Thanks!):
>   - Moving package from Libraries->Crypto to Shell and utilities:Utilities
>   - Indenting EASY_RSA_INSTALL_TARGET_CMDS with tabs (really don't know
>     how I messed this up)
>   - Update DEVELOPERS to track the easy-rsa package
> 
> Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
> ---
>  DEVELOPERS                     |  1 +
>  package/Config.in              |  1 +
>  package/easy-rsa/Config.in     | 14 ++++++++++++++
>  package/easy-rsa/easy-rsa.hash |  2 ++
>  package/easy-rsa/easy-rsa.mk   | 19 +++++++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/easy-rsa/Config.in
>  create mode 100644 package/easy-rsa/easy-rsa.hash
>  create mode 100644 package/easy-rsa/easy-rsa.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index f80b89f..00f4a2f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -930,6 +930,7 @@ F:	package/lldpd/
>  
>  N:	Julien Viard de Galbert <julien@vdg.name>
>  F:	package/dieharder/
> +F:	package/easy-rsa/
>  
>  N:	Justin Maggard <jmaggard@netgear.com>
>  F:	package/dtach/
> diff --git a/package/Config.in b/package/Config.in
> index d57813c..1c1b95e 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1771,6 +1771,7 @@ comment "Utilities"
>  	source "package/dialog/Config.in"
>  	source "package/dtach/Config.in"
>  	source "package/file/Config.in"
> +	source "package/easy-rsa/Config.in"
>  	source "package/gnupg/Config.in"
>  	source "package/gnupg2/Config.in"
>  	source "package/inotify-tools/Config.in"
> diff --git a/package/easy-rsa/Config.in b/package/easy-rsa/Config.in
> new file mode 100644
> index 0000000..62a8ca3
> --- /dev/null
> +++ b/package/easy-rsa/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_EASY_RSA
> +	bool "easy-rsa"
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSL_BIN
> +	help
> +	  Simple shell based CA utility
> +	  This package eases the creation of certificates, for example
> +	  for openvpn clients.
> +
> +	  This was formerly part of the openvpn package.
> +
> +	  easy-rsa is a wrapper script around OpenSSL binaries.
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
> index 0000000..16aff30
> --- /dev/null
> +++ b/package/easy-rsa/easy-rsa.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# easy-rsa
> +#
> +################################################################################
> +
> +EASY_RSA_VERSION = 3.0.1
> +EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
> +EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)

Missing package license infos:
EASY_RSA_LICENSE = GPL-2.0
EASY_RSA_LICENSE_FILES = COPYING.md

With that fixed:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> +
> +define EASY_RSA_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
> +	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
> +	$(INSTALL) -D -m 0644 $(@D)/x509-types/* $(TARGET_DIR)/etc/easy-rsa/x509-types
> +	$(INSTALL) -D -m 0644 $(@D)/openssl-1.0.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-1.0.cnf
> +	$(INSTALL) -D -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars
> +endef
> +
> +$(eval $(generic-package))
> 
