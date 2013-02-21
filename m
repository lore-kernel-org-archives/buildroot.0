From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 23:05:27 +0100
Subject: [Buildroot] [PATCH] new package: gnome-keyring
In-Reply-To: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361473406-5765-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212305.27963.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> GNOME Keyring
  ^^^
Useless line.

> GNOME Keyring is a collection of components in GNOME that store secrets,
> passwords, keys, certificates and makes them available to applications.
> 
> GNOME Keyring is integrated with the user's login, so that their secret
> storage can be unlocked when the user's logins into their session.
> 
> GNOME Keyring is based around a standard called PKCS#11 which is a standard
> way for applications to manage certificates and keys on smart cards or secure
> storage.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[--SNIP--]
> diff --git a/package/gnome-keyring/Config.in b/package/gnome-keyring/Config.in
> new file mode 100644
> index 0000000..a29fa9f
> --- /dev/null
> +++ b/package/gnome-keyring/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_GNOME_KEYRING
> +	bool "gnome-keyring"
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_LIBGTK2
> +	select BR2_PACKAGE_GCONF
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_LINUX_PAM
> +	select BR2_PACKAGE_LIBTASN1
> +	select BR2_PACKAGE_LIBGCRYPT

Be careful to properly inherit all required dependencies of the packages
you 'select'.

> +	help
> +	  GNOME Keyring is a collection of components in GNOME that store 
> +	  secrets, passwords, kets, certificates  and make them available
                              ^^^^              ^^
keys, I presume?
Please, squash multiple spaces.

> +	  to applications.
> +
> +	  GNOME Keyring is integrated with the user's login, so that their
                                               ^^^^^^[1]
> +	  secret storage can be unlocked when the user logins into their
                                                       ^^^^^^[2]
I know you copied the text on the frontpage, but:
  [1] the users' login  (its a plural form because of the subsequent "their")
  [2] the user logs in  (the verb is: to log in)

> +	  session.
> +
> +	  GNOME Keyring is based around a standard called PKCS#11,
> +	  which is a standard way for applications to manage
> +	  certificates and keys on smart cards or secure storage

Missing trailing dot (yes, nit-picking here ;-) )

[--SNIP--]
> diff --git a/package/gnome-keyring/gnome-keyring.mk b/package/gnome-keyring/gnome-keyring.mk
> new file mode 100644
> index 0000000..4daa204
> --- /dev/null
> +++ b/package/gnome-keyring/gnome-keyring.mk
> @@ -0,0 +1,22 @@
> +#############################################################
> +#
> +# gnome-keyring
> +#
> +#############################################################
> +
> +GNOME_KEYRING_MAJOR_VERSION = 2.28
> +GNOME_KEYRING_MINOR_VERSION = 2
> +GNOME_KEYRING_VERSION = $(GNOME_KEYRING_MAJOR_VERSION).$(GNOME_KEYRING_MINOR_VERSION)
> +GNOME_KEYRING_SOURCE = gnome-keyring-$(GNOME_KEYRING_VERSION).tar.bz2
> +GNOME_KEYRING_SITE = http://ftp.gnome.org/pub/gnome/sources/gnome-keyring/$(GNOME_KEYRING_MAJOR_VERSION)
> +GNOME_KEYRING_DEPENDENCIES += dbus linux-pam libtasn1 libgcrypt gconf \
> +			      libglib2 libgtk2
> +GNOME_KEYRING_CONF_OPT += --with-pam-dir=/lib/security \
> +			  --with-root-certs=/etc/ssl/certs
> +GNOME_KEYRING_AUTORECONF = YES

Add a comment explaining why you need autoreconf.

> +GNOME_KEYRING_INSTALL_STAGING = YES
> +GNOME_KEYRING_CONF_ENV = LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \

This should point to the host-variant of libgcrypt-config.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
