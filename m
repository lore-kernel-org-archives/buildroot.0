From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Aug 2013 22:26:24 +0200
Subject: [Buildroot] [PATCH v2] libsecret: New package
In-Reply-To: <1376567256-13213-1-git-send-email-markos.chandras@imgtec.com>
References: <1376567256-13213-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <521673F0.8090209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/08/13 13:47, Markos Chandras wrote:
> libsecret is a library for storing and retrieving passwords
> and other secrets. It communicates with the "Secret Service"
> using DBus. gnome-keyring and ksecretservice are both
> implementations of a Secret Service.

  I'm surprised it doesn't require dbus if it uses dbus for communicating 
with the secret service...

>
> libsecret replaces libgnome-keyring.
>
> https://wiki.gnome.org/Libsecret
>
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> Changes since v1:
> - depend on USE_WCHAR and TOOLCHAIN_HAS_THREADS which are required by libglib2
> http://lists.busybox.net/pipermail/buildroot/2013-August/076565.html
> ---
>   package/Config.in              |  1 +
>   package/libsecret/Config.in    | 25 +++++++++++++++++++++++++
>   package/libsecret/libsecret.mk | 24 ++++++++++++++++++++++++
>   3 files changed, 50 insertions(+)
>   create mode 100644 package/libsecret/Config.in
>   create mode 100644 package/libsecret/libsecret.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 7069d77..93e280d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -423,6 +423,7 @@ source "package/libassuan/Config.in"
>   source "package/libmcrypt/Config.in"
>   source "package/libmhash/Config.in"
>   source "package/libnss/Config.in"
> +source "package/libsecret/Config.in"
>   source "package/libsha1/Config.in"
>   source "package/nettle/Config.in"
>   source "package/openssl/Config.in"
> diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
> new file mode 100644
> index 0000000..aecd0f3
> --- /dev/null
> +++ b/package/libsecret/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_LIBSECRET
> +	bool "libsecret"
> +	select BR2_PACKAGE_LIBGLIB2
> +	depends on BR2_USE_WCHAR # gettext dep in libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	help
> +	  libsecret is a library for storing and retrieving passwords and other
> +	  secrets. It communicates with the "Secret Service" using DBus.
> +	  gnome-keyring and ksecretservice are both implementations of a Secret
> +	  Service.
> +
> +	  https://wiki.gnome.org/Libsecret
> +
> +comment "libsecret requires a toolchain with WCHAR and threading support."
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +if BR2_PACKAGE_LIBSECRET
> +
> +config BR2_PACKAGE_LIBSECRET_CRYPTO
> +	bool "Enable gcrypt and transport encryption"
> +	select BR2_PACKAGE_LIBGCRYPT

  Does the gcrypt support make a major difference for library size or 
compilation time? Otherwise, we usually include it automatically if 
libgcrypt is selected. I personally like to mention this in the help text 
in that case, i.e. something like

Select BR2_PACKAGE_LIBGCRYPT to enable transport encryption.


  But basically looks good to me. Untested though.

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> +	help
> +	  Enable gcrypt and transport encryption
> +
> +endif
> diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
> new file mode 100644
> index 0000000..32bcc17
> --- /dev/null
> +++ b/package/libsecret/libsecret.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# libsecret
> +#
> +################################################################################
> +
> +LIBSECRET_VERSION = 0.15
> +LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
> +LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
> +LIBSECRET_LICENSE = LGPLv2.1+
> +LIBSECRET_LICENSE_FILES = COPYING
> +LIBSECRET_INSTALL_STAGING = YES
> +
> +LIBSECRET_DEPENDENCIES = libglib2
> +LIBSECRET_CONF_OPT = --disable-manpages --disable-strict --disable-coverage --enable-vala=no
> +
> +ifeq ($(BR2_PACKAGE_LIBSECRET_CRYPTO),y)
> +	LIBSECRET_DEPENDENCIES += libgcrypt
> +	LIBSECRET_CONF_OPT += --enable-gcrypt
> +else
> +	LIBSECRET_CONF_OPT += --disable-gcrypt
> +endif
> +
> +$(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
