From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 21:50:13 +0200
Subject: [Buildroot] [PATCH v3 1/3] libssl: new virtual package
In-Reply-To: <20170626162538.27101-1-aduskett@codeblue.com>
References: <20170626162538.27101-1-aduskett@codeblue.com>
Message-ID: <36fa6794-7eae-2eb7-b9e2-7a0f58a39c0b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 26-06-17 18:25, Adam Duskett wrote:
> libressl is API compatible with OpenSSL 1.0.1 and is almost API
> compatible with OpenSSL 1.0.2.  As such, a new virtual package is needed
> to handle having both libressl and openssl.
> 
> To start, add OpenSSL as the only provider. In the following patches
> libressl will also be added as a provider.

 We finally got around to discussing this at the BR Summer Camp (too many things
to do...). In the end, we came to the following conclusion:

* Although libressl is supposed to be a drop-in replacement of openssl, it isn't
really. E.g. quite a few packages are using features from openssl 1.0.2 which
aren't available in libressl (yet).

* Therefore, we need to verify for each and every package if they support
libressl. A build-time check may not be sufficient, it really needs to be a
runtime test to be sure, due to the highly dynamic nature of openssl/libressl.

* That means we need to convert packages one by one, probably on demand by a
user who wants to replace openssl with libressl in his particular setup.

* We have no idea at the moment how many packages actually do support either
libressl or openssl. Therefore, it is difficult to estimate at this point
whether it is worth to create a virtual package.

* For boringssl even more so.

* Transitioning to the virtual package will anyway be painful from a legacy
handling point of view. Indeed, we want to make sure that a configuration that
currently has openssl selected still has openssl selected in the future; we want
packages to be able to select openssl; and we ideally want a choice between the two.


Therefore, the proposal is to use the "old" way of having the two options:

config BR2_PACKAGE_LIBRESSL
	bool "libressl"
	depends on !BR2_PACKAGE_OPENSSL

and in packages that depend on either libressl or openssl:

	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL

and in packages that optionally depend on libressl or openssl:

ifeq ($(BR2_PACKAGE_OPENSSL),y)
FOO_DEPENDENCIES += openssl
endif
ifeq ($(BR2_PACKAGE_LIBRESSL),y)
FOO_DEPENDENCIES += libressl
endif


 If a significant number of packages (don't know how much, but at least 5) are
able to support both, then we can consider introducing the virtual package after
all. But see below for the problems.

> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

[snip]
> diff --git a/package/libssl/Config.in b/package/libssl/Config.in
> new file mode 100644
> index 0000000..5b912e6
> --- /dev/null
> +++ b/package/libssl/Config.in
> @@ -0,0 +1,53 @@
> +config BR2_PACKAGE_LIBSSL
> +	bool "libssl support"
> +	help
> +	  Select the desired ssl library provider.
> +
> +if BR2_PACKAGE_LIBSSL
> +
> +choice
> +	prompt "libssl variant"
> +	default BR2_PACKAGE_OPENSSL
> +	help
> +	  Select OpenSSL
> +
> +config BR2_PACKAGE_OPENSSL

 So here is the problem: if an existing config has BR2_PACKAGE_OPENSSL selected,
then it will silently disappear when they update Buildroot. There is no simple
way to resolve this, except by renaming the openssl package to something else,
and making sure that the virtual package is called openssl. This is how we did
it for libjpeg/jpegturbo: libjpeg was originally called jpeg and jpeg became the
virtual package.

 But that is a rather big change, and we want to delay it until there are clear
users of the virtual package.

 Some more notes below, just in case we do convert to the virtual package a few
months from now.

> +	bool "openssl"
> +	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_HAS_LIBSSL
> +	help
> +	  A collaborative effort to develop a robust, commercial-grade,
> +	  fully featured, and Open Source toolkit implementing the
> +	  Secure Sockets Layer (SSL v2/v3) and Transport Security
> +	  (TLS v1) as well as a full-strength general-purpose
> +	  cryptography library.
> +
> +	  http://www.openssl.org/
> +	  Note: Some helper scripts need perl.
> +
> +endchoice
> +
> +if BR2_PACKAGE_OPENSSL

 I would personally prefer to keep this in package/openssl/Config.in and to add here

source "package/openssl/Config.in"

> +
> +config BR2_PACKAGE_OPENSSL_BIN
> +	bool "openssl binary"
> +	help
> +	  Install the openssl binary and the associated helper scripts
> +	  to the target file system. This is a command line tool for
> +	  doing various cryptographic stuff.
> +
> +config BR2_PACKAGE_OPENSSL_ENGINES
> +	bool "openssl additional engines"
> +	help
> +	  Install additional encryption engine libraries.
> +
> +endif
> +
> +config BR2_PACKAGE_HAS_LIBSSL
> +	bool

 This should be at the top of the file.

> +
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +	string

 This should also be at the top of the file, and repeated in
package/openssl/Config.in (but without the string) together with the line below.


 Regards,
 Arnout


> +	default "openssl"    if BR2_PACKAGE_OPENSSL
> +
> +endif
> diff --git a/package/libssl/libssl.mk b/package/libssl/libssl.mk
> new file mode 100644
> index 0000000..3bd775d
> --- /dev/null
> +++ b/package/libssl/libssl.mk
> @@ -0,0 +1,7 @@
> +################################################################################
> +#
> +# libssl
> +#
> +################################################################################
> +
> +$(eval $(virtual-package))
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> deleted file mode 100644
> index e08b648..0000000
> --- a/package/openssl/Config.in
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -config BR2_PACKAGE_OPENSSL
> -	bool "openssl"
> -	select BR2_PACKAGE_ZLIB
> -	help
> -	  A collaborative effort to develop a robust, commercial-grade, fully
> -	  featured, and Open Source toolkit implementing the Secure Sockets
> -	  Layer (SSL v2/v3) and Transport Security (TLS v1) as well as a
> -	  full-strength general-purpose cryptography library.
> -
> -	  http://www.openssl.org/
> -
> -	  Note: Some helper scripts need perl.
> -
> -if BR2_PACKAGE_OPENSSL
> -
> -config BR2_PACKAGE_OPENSSL_BIN
> -	bool "openssl binary"
> -	help
> -	  Install the openssl binary and the associated helper scripts to the
> -	  target file system. This is a command line tool for doing various
> -	  cryptographic stuff.
> -
> -config BR2_PACKAGE_OPENSSL_ENGINES
> -	bool "openssl additional engines"
> -	help
> -	  Install additional encryption engine libraries.
> -
> -endif
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index 5f56b44..c028290 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
>  OPENSSL_LICENSE_FILES = LICENSE
>  OPENSSL_INSTALL_STAGING = YES
>  OPENSSL_DEPENDENCIES = zlib
> +OPENSSL_PROVIDES = libssl
>  HOST_OPENSSL_DEPENDENCIES = host-zlib
>  OPENSSL_TARGET_ARCH = generic32
>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
