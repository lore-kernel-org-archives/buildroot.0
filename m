From: Philipp Claves <claves@budelmann-elektronik.com>
Date: Mon, 08 Apr 2013 12:26:07 +0200
Subject: [Buildroot] [PATCH 3/3] opkg: Add gnupg signature checking
	support.
In-Reply-To: <1362145109-32509-3-git-send-email-claves@budelmann-elektronik.com>
References: <20130301111856.4753d13b@skate>
 <1362145109-32509-1-git-send-email-claves@budelmann-elektronik.com>
 <1362145109-32509-3-git-send-email-claves@budelmann-elektronik.com>
Message-ID: <52530026.WMUqvmoQpY@arawn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Any status update on merging this patchset?

Regards,
Philipp Claves

On Freitag, March 1st 2013, 14:38:29 Philipp Claves wrote:
> Signed-off-by: Philipp Claves <claves@budelmann-elektronik.com>
> ---
>  package/opkg/Config.in | 9 +++++++++
>  package/opkg/opkg.mk   | 9 ++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opkg/Config.in b/package/opkg/Config.in
> index eb997a7..b8b4a13 100644
> --- a/package/opkg/Config.in
> +++ b/package/opkg/Config.in
> @@ -11,3 +11,12 @@ config BR2_PACKAGE_OPKG
> 
>  	  http://code.google.com/p/opkg/
> 
> +if BR2_PACKAGE_OPKG
> +
> +config BR2_PACKAGE_OPKG_GPG_SIGN
> +	bool "opkg-gnupg-support"
> +	select BR2_PACKAGE_LIBGPGME
> +	help
> +	  Enable opkg package signature checking support using gnupg/libgpgme.
> +
> +endif
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 9932d3f..3c53299 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -9,7 +9,7 @@ OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
>  OPKG_SITE = http://opkg.googlecode.com/svn/trunk/
>  OPKG_SITE_METHOD = svn
>  OPKG_INSTALL_STAGING = YES
> -OPKG_CONF_OPT = --disable-curl --disable-gpg
> +OPKG_CONF_OPT = --disable-curl
>  OPKG_AUTORECONF = YES
>  # Uses PKG_CHECK_MODULES() in configure.ac
>  OPKG_DEPENDENCIES = host-pkgconf
> @@ -19,6 +19,13 @@ define OPKG_CREATE_LOCKDIR
>  	mkdir -p $(TARGET_DIR)/usr/lib/opkg
>  endef
> 
> +ifeq ($(BR2_PACKAGE_OPKG_GPG_SIGN),y)
> +	OPKG_CONF_OPT += --enable-gpg
> +	OPKG_DEPENDENCIES += libgpgme
> +else
> +	OPKG_CONF_OPT += --disable-gpg
> +endif
> +
>  OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
> 
>  $(eval $(autotools-package))
-- 
Budelmann Elektronik GmbH
Von-Renesse-Weg 60
48163 M?nster
Germany

Tel.  +49 (0)2501 9208440
Fax   +49 (0)2501 5887024
claves at budelmann-elektronik.com
www.budelmann-elektronik.com

General Managers: Dipl.-Kffr. Jeannine Budelmann,
Dipl.-Ing. Christoph Budelmann, Ing?nieur diplom? de
l'Ecole nationale d'Electronique et de ses Applications
Registered Office: M?nster, Germany
Registered Court: M?nster HRB 12729     
VAT Identification Number: DE 272 067 273
