From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 28 Jun 2017 21:59:12 +0200
Subject: [Buildroot] [PATCH] rauc: new package
In-Reply-To: <20170628060724.12026-1-yurovsky@gmail.com>
References: <20170628060724.12026-1-yurovsky@gmail.com>
Message-ID: <1227a3fa-c73c-8f13-58aa-1d0658a13b6f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andrey,

On 28-06-17 08:07, Andrey Yurovsky wrote:
> RAUC is the Robust Auto-Update Controller developed by the folks at
> Penguintronix. It supports updating embedded systems from the network
  ^^^^^^^^^^^^^Pengutronix

> (ex: HawkBit) or from a disk and provides a d-bus interface.

 So this is Pengutronix' competitor to swupdate?

> 
> Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
> ---
>  package/rauc/Config.in | 18 ++++++++++++++++++
>  package/rauc/rauc.hash |  2 ++
>  package/rauc/rauc.mk   | 19 +++++++++++++++++++

 You don't add it to package/Config.in, so it is not possible to select this
package.

 Have you checked the package with support/scripts/check-package ?
 Have you validated it with support/scripts/test-pkg ?

>  3 files changed, 39 insertions(+)
>  create mode 100644 package/rauc/Config.in
>  create mode 100644 package/rauc/rauc.hash
>  create mode 100644 package/rauc/rauc.mk
> 
> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
> new file mode 100644
> index 0000000..8a210a4
> --- /dev/null
> +++ b/package/rauc/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_RAUC
> +	bool "rauc"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_USE_MMU # glib2
> +	select BR2_PACKAGE_LIBGLIB2
> +	select BR2_PACKAGE_DBUS
> +	select BR2_PACKAGE_DBUS_GLIB
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_JSON_GLIB
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> +	help
> +	  RAUC controls the update process on embedded Linux systems.
> +	  See the documentation at
> +	  https://rauc.readthedocs.io/en/latest/ for more
> +	  information.

 You can include the full text that you have in the commit log. Also, we need an
upstream URL. And with that added, the reference to the documentation is not
really needed (it's one click away from the upstream URL). So:

	  RAUC is the Robust Auto-Update Controller developed by Pengutronix.
	  It controls the update process on embedded Linux systems. It supports
	  updating from the network or from a disk. It provides a D-Bus
	  interface.

	  http://rauc.io/

> diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
> new file mode 100644
> index 0000000..7ee9798
> --- /dev/null
> +++ b/package/rauc/rauc.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated

 Please verify the tarball against the upstream signature, and write:

# Locally calculated, after verifying against
# https://github.com/rauc/rauc/releases/download/v0.1.1/rauc-0.1.1.tar.xz.asc

> +sha256  d867a81b9e414c8db9268851011fb2d404a3ee60ae297c007a2f140abfa607d1 rauc-v0.1.1.tar.gz
> diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
> new file mode 100644
> index 0000000..e036387
> --- /dev/null
> +++ b/package/rauc/rauc.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# rauc
> +#
> +################################################################################
> +
> +RAUC_VERSION = v0.1.1
> +RAUC_SITE = $(call github,rauc,rauc,$(RAUC_VERSION))

 There is an upstream tarball, so you should use that:

RAUC_VERSION = 0.1.1
RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz

> +RAUC_LICENSE = GPL-2.1

 GPL-2.1 doesn't exist, it's LGPL-2.1.

> +RAUC_LICENSE_FILES = COPYING
> +RAUC_AUTORECONF = YES

 With the uploaded tarball this shouldn't be needed anymore.

> +RAUC_DEPENDENCIES = libcurl openssl libglib2 json-glib dbus-glib host-pkgconf \
> +					dbus util-linux

 It seems that most of these are optional:

libcurl is only needed if --enable-network
json-glib is only needed if --enable-json

 And configure.ac has no dependency at all on dbus-glib, dbus or libmount.

 On the other hand, configure uses pkg-config to determine the systemd install
directories, so you should have a conditional dependency on this package:

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
# configure uses pkg-config --variable=systemdsystemunitdir systemd
RAUC_DEPENDENCIES += systemd
endif


 Regards,
 Arnout

> +
> +HOST_RAUC_DEPENDENCIES = host-pkgconf
> +HOST_RAUC_CONF_OPTS = --disable-network --disable-json
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
