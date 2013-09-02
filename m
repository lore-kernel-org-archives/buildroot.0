From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 22:42:47 +0200
Subject: [Buildroot] [PATCH v3] libsecret: New package
In-Reply-To: <1377685417-5813-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Wed, 28 Aug 2013 11:23:37 +0100")
References: <1377685417-5813-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <8761uj9cqg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> libsecret is a library for storing and retrieving passwords
 Markos> and other secrets. It communicates with the "Secret Service"
 Markos> using DBus. gnome-keyring and ksecretservice are both
 Markos> implementations of a Secret Service.

 Markos> libsecret replaces libgnome-keyring.

 Markos> https://wiki.gnome.org/Libsecret

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 Markos> ---
 Markos> Changes since v2:
 Markos> - Drop BR2_PACKAGE_LIBSECRET_CRYPTO and enable encryption if
 Markos> libgcrypt is selected

 Markos> Changes since v1:
 Markos> - depend on USE_WCHAR and TOOLCHAIN_HAS_THREADS which are required by libglib2
 Markos> http://lists.busybox.net/pipermail/buildroot/2013-August/076565.html
 Markos> ---
 Markos>  package/Config.in              |  1 +
 Markos>  package/libsecret/Config.in    | 15 +++++++++++++++
 Markos>  package/libsecret/libsecret.mk | 24 ++++++++++++++++++++++++
 Markos>  3 files changed, 40 insertions(+)
 Markos>  create mode 100644 package/libsecret/Config.in
 Markos>  create mode 100644 package/libsecret/libsecret.mk

 Markos> diff --git a/package/Config.in b/package/Config.in
 Markos> index 7069d77..93e280d 100644
 Markos> --- a/package/Config.in
 Markos> +++ b/package/Config.in
 Markos> @@ -423,6 +423,7 @@ source "package/libassuan/Config.in"
 Markos>  source "package/libmcrypt/Config.in"
 Markos>  source "package/libmhash/Config.in"
 Markos>  source "package/libnss/Config.in"
 Markos> +source "package/libsecret/Config.in"
 Markos>  source "package/libsha1/Config.in"
 Markos>  source "package/nettle/Config.in"
 Markos>  source "package/openssl/Config.in"
 Markos> diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
 Markos> new file mode 100644
 Markos> index 0000000..a15f995
 Markos> --- /dev/null
 Markos> +++ b/package/libsecret/Config.in
 Markos> @@ -0,0 +1,15 @@
 Markos> +config BR2_PACKAGE_LIBSECRET
 Markos> +	bool "libsecret"
 Markos> +	select BR2_PACKAGE_LIBGLIB2
 Markos> +	depends on BR2_USE_WCHAR # gettext dep in libglib2
 Markos> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 Markos> +	help
 Markos> +	  libsecret is a library for storing and retrieving passwords and other
 Markos> +	  secrets. It communicates with the "Secret Service" using DBus.
 Markos> +	  gnome-keyring and ksecretservice are both implementations of a Secret
 Markos> +	  Service.

Just like Arnout I wonder if this does anything useful without dbus? If
not, I think we should select dbus even if it is only a runtime
dependency.


 Markos> +
 Markos> +	  https://wiki.gnome.org/Libsecret
 Markos> +
 Markos> +comment "libsecret requires a toolchain with WCHAR and threading support."
 Markos> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 Markos> diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
 Markos> new file mode 100644
 Markos> index 0000000..ebdfe11
 Markos> --- /dev/null
 Markos> +++ b/package/libsecret/libsecret.mk
 Markos> @@ -0,0 +1,24 @@
 Markos> +################################################################################
 Markos> +#
 Markos> +# libsecret
 Markos> +#
 Markos> +################################################################################
 Markos> +
 Markos> +LIBSECRET_VERSION = 0.15
 Markos> +LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION)
 Markos> +LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 Markos> +LIBSECRET_LICENSE = LGPLv2.1+
 Markos> +LIBSECRET_LICENSE_FILES = COPYING
 Markos> +LIBSECRET_INSTALL_STAGING = YES
 Markos> +
 Markos> +LIBSECRET_DEPENDENCIES = libglib2

It also needs host-intltool.

Committed with this fixed, thanks.

-- 
Bye, Peter Korsgaard
