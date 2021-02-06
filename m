From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Feb 2021 18:25:02 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/tpm2-pkcs11: new package
In-Reply-To: <5AOOypxO_qfnsjT6yEw7BgRzQ9LaOl_z9vrKxX4b8o_7eahgeS5h9iY-Hqz2rjoPXcPR5Px-w8QvDiVMsgE663vpxYM5PszRTM7OI_47m6Y=@protonmail.com>
 (Yair Ben-Avraham via buildroot's message of "Sun, 24 Jan 2021
 19:29:26 +0000")
References: <5AOOypxO_qfnsjT6yEw7BgRzQ9LaOl_z9vrKxX4b8o_7eahgeS5h9iY-Hqz2rjoPXcPR5Px-w8QvDiVMsgE663vpxYM5PszRTM7OI_47m6Y=@protonmail.com>
Message-ID: <87im755csx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yair" == Yair Ben-Avraham via buildroot <buildroot@busybox.net> writes:

 > A PKCS#11 interface for TPM2 hardware
 > Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
 > ---
 >  DEVELOPERS                           |  1 +
 >  package/Config.in                    |  1 +
 >  package/tpm2-pkcs11/Config.in        | 14 +++++++++
 >  package/tpm2-pkcs11/tpm2-pkcs11.hash |  3 ++
 >  package/tpm2-pkcs11/tpm2-pkcs11.mk   | 43 ++++++++++++++++++++++++++++
 >  5 files changed, 62 insertions(+)
 >  create mode 100644 package/tpm2-pkcs11/Config.in
 >  create mode 100644 package/tpm2-pkcs11/tpm2-pkcs11.hash
 >  create mode 100644 package/tpm2-pkcs11/tpm2-pkcs11.mk

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 687a9400e0..66452dbfc7 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -2718,6 +2718,7 @@ F:	package/fwup/
 >  N:	Yair Ben Avraham <yairba@protonmail.com>
 >  F:	package/casync/
 >  F:	package/gloox/
 > +F:	package/tpm2-pkcs11/

 >  N:	Yann CARDAILLAC <ycardaillac@sepro-group.com>
 >  F:	package/open62541/
 > diff --git a/package/Config.in b/package/Config.in
 > index f42cc01032..646630dde9 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1378,6 +1378,7 @@ menu "Crypto"
 >  	source "package/pkcs11-helper/Config.in"
 >  	source "package/rhash/Config.in"
 >  	source "package/tinydtls/Config.in"
 > +	source "package/tpm2-pkcs11/Config.in"
 >  	source "package/tpm2-tss/Config.in"
 >  	source "package/trousers/Config.in"
 >  	source "package/ustream-ssl/Config.in"
 > diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
 > new file mode 100644
 > index 0000000000..3e207a50e5
 > --- /dev/null
 > +++ b/package/tpm2-pkcs11/Config.in
 > @@ -0,0 +1,14 @@
 > +config BR2_PACKAGE_TPM2_PKCS11
 > +	bool "tpm2-pkcs11"
 > +	depends on !BR2_STATIC_LIBS # tpm2-tss
 > +	select BR2_PACKAGE_LIBYAML
 > +	select BR2_PACKAGE_SQLITE
 > +	select BR2_PACKAGE_TPM2_TOOLS
 > +	select BR2_PACKAGE_TPM2_TSS
 > +	help
 > +	  A PKCS#11 interface for TPM2 hardware
 > +
 > +	  https://github.com/tpm2-software/tpm2-pkcs11
 > +
 > +comment "tpm2-pkcs11 needs a toolchain w/ dynamic library"
 > +	depends on BR2_STATIC_LIBS
 > diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.hash b/package/tpm2-pkcs11/tpm2-pkcs11.hash
 > new file mode 100644
 > index 0000000000..16dd9166ba
 > --- /dev/null
 > +++ b/package/tpm2-pkcs11/tpm2-pkcs11.hash
 > @@ -0,0 +1,3 @@
 > +# Locally computed:
 > +sha256  13425c34358ec798d333743099b9aec5e42f6a4653c4c0e40eb075681f369687  tpm2-pkcs11-1.5.0.tar.gz
 > +sha256  793aa007f793458434d7cc60b1c827053a399308658b32fcaa6023802adc22e1  LICENSE
 > diff --git a/package/tpm2-pkcs11/tpm2-pkcs11.mk b/package/tpm2-pkcs11/tpm2-pkcs11.mk
 > new file mode 100644
 > index 0000000000..9cadd74cdf
 > --- /dev/null
 > +++ b/package/tpm2-pkcs11/tpm2-pkcs11.mk
 > @@ -0,0 +1,43 @@
 > +################################################################################
 > +#
 > +# tpm2-pkcs11
 > +#
 > +################################################################################
 > +
 > +TPM2_PKCS11_VERSION = 1.5.0
 > +TPM2_PKCS11_SITE = https://github.com/tpm2-software/tpm2-pkcs11/releases/download/$(TPM2_PKCS11_VERSION)
 > +TPM2_PKCS11_LICENSE = BSD-2-Clause
 > +TPM2_PKCS11_LICENSE_FILES = LICENSE
 > +TPM2_PKCS11_DEPENDENCIES = libyaml sqlite tpm2-tools tpm2-tss

The configure script uses pkg-config to find these dependencies, so we
should also add host-pkgconf.

Likewise for openssl. I know that it implicitly gets pulled in by
tpm2-tss, but giving that it is directly used here, it makes sense to
select it and add to _DEPENDENCIES.

 > +
 > +TPM2_PKCS11_CONF_OPTS += \
 > +		--disable-hardening
 > +
 > +# Fix tpm.c:746:5: error: 'for' loop initial declarations are only allowed in C99 mode
 > +# Fix implicit declaration of function 'strnlen'
 > +# CodeSourcery (2014.05-29) doen not use ISO C99 or GNU extension?
 > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM),y)
 > +TPM2_PKCS11_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 > +endif

It shouldn't hurt to do it for everyone, so I've made it unconditional.

 > +
 > +# do not build man pages
 > +TPM2_PKCS11_CONF_ENV += ac_cv_prog_PANDOC=''
 > +
 > +# tpm2-pkcs11 checks for tpm2-tools programs
 > +ifeq ($(BR2_PACKAGE_TPM2_TOOLS),y)

This is a bit odd given that you select tpm2-tools. Looking closer at
the code, this is only used for the (not installed) python module and
tools, but the configure script will error out if these are not found
unless set to yes - So I've added a comment explaining this and dropped
the dependency on tpm2-tools.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
