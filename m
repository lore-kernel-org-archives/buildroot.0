From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 14:22:37 +0200
Subject: [Buildroot] [PATCH v2 2/2] gettext: get rid of LIBINTL stuff
In-Reply-To: <1338674861-1716-2-git-send-email-s.martin49@gmail.com>
References: <1338674861-1716-1-git-send-email-s.martin49@gmail.com>
 <1338674861-1716-2-git-send-email-s.martin49@gmail.com>
Message-ID: <5002B60D.4040200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 00:07, Samuel Martin wrote:
> The AUTOTARGET conversion of gettext introduces some changes:
> - the target 'gettext' now builds and installs libintl if locale
>    support is enabled. The target 'libintl' no longer exists, so the
>    libintl dependency is no longer needed;
> - the gettext binaries (usr/bin/gettext{,.sh,ize}), formerly installed
>    together with 'libintl', are now installed together with 'gettext'.
>    Because the gettext binaries have a rather small footprints, they
>    are now alway installed together with 'gettext'.

  I don't agree.  I'll comment on this below.

>
> This patch does:
> - update the gettext package;
> - warn about libintl availability depending on the locale support
>    enabled in the toolchain;

  Why is this needed?

> - cleanup all remaining  gettext/libintl dependencies;
> - fix/cleanup some BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE
>    dependencies.

  These should be in a separate patch.


  Note: I do think this is a very valuable patch, so I hope you still
have the energy to work on it, even though it hasn't been met with a lot
of enthusiasm on the list...

[snip]
> diff --git a/package/gettext/Config.in b/package/gettext/Config.in
> index 0ee4065..cc48b98 100644
> --- a/package/gettext/Config.in
> +++ b/package/gettext/Config.in
> @@ -12,12 +12,5 @@ config BR2_PACKAGE_GETTEXT
>   comment "gettext requires a toolchain with WCHAR support"
>   	depends on BR2_NEEDS_GETTEXT&&  !BR2_USE_WCHAR
>
> -config BR2_PACKAGE_LIBINTL
> -	bool "libintl"
> -	depends on BR2_NEEDS_GETTEXT
> -	depends on BR2_USE_WCHAR
> -	help
> -	  Selecting this package installs all of gettext in the staging
> -	  directory and the shared library for it's use in the target.
> -
> -	  http://www.gnu.org/software/gettext/

  This could become something like:

if BR2_PACKAGE_GETTEXT
config BR2_PACKAGE_GETTEXT_BINARIES
	bool "Install gettext binaries"
	help
	  Keep the gettext binaries (gettext, gettextize, gettext.sh)
	  on the target filesystem.  This is typically only necessary
	  if the target is itself a development system.
endif


> +comment "libintl requires a toolchain with locale/i18n support"
> +	depends on BR2_PACKAGE_GETTEXT && !BR2_ENABLE_LOCALE

  I don't understand this comment...  The gettext package builds libintl, right?


> diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
> index 7c7b26c..a9dac28 100644
> --- a/package/gettext/gettext.mk
> +++ b/package/gettext/gettext.mk
> @@ -9,16 +9,6 @@ GETTEXT_INSTALL_STAGING = YES
>
>   GETTEXT_CONF_OPT += \
>   	--disable-libasprintf \
> -	--disable-openmp \
> -
> -define GETTEXT_REMOVE_BINARIES
> -	rm -f $(TARGET_DIR)/usr/bin/gettext
> -	rm -f $(TARGET_DIR)/usr/bin/gettext.sh
> -	rm -f $(TARGET_DIR)/usr/bin/gettextize
> -endef
> -
> -ifeq ($(BR2_PACKAGE_LIBINTL),y)

  So this would become
ifeq ($(BR2_PACKAGE_GETTEXT_BINARIES),)

> -	GETTEXT_POST_INSTALL_TARGET_HOOKS += GETTEXT_REMOVE_BINARIES
> -endif
> +	--disable-openmp
>
>   $(eval $(call AUTOTARGETS))
[snip]


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
