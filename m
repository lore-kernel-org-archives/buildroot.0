From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 May 2012 09:58:37 +0200
Subject: [Buildroot] [PATCH v3 3/3] Add ofono package.
In-Reply-To: <1333288729-22138-4-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Sun, 1 Apr 2012 15:58:49 +0200")
References: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
 <1333288729-22138-4-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <871um3zadu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

Committed to next with minor changes (see below) - Thanks.

 Marek> ---
 Marek>  package/Config.in       |    1 +
 Marek>  package/ofono/Config.in |   23 +++++++++++++++++++++++
 Marek>  package/ofono/ofono.mk  |   30 ++++++++++++++++++++++++++++++
 Marek>  3 files changed, 54 insertions(+), 0 deletions(-)
 Marek>  create mode 100644 package/ofono/Config.in
 Marek>  create mode 100644 package/ofono/ofono.mk

 Marek> diff --git a/package/Config.in b/package/Config.in
 Marek> index cd41eb9..4dfbce4 100644
 Marek> --- a/package/Config.in
 Marek> +++ b/package/Config.in
 Marek> @@ -201,6 +201,7 @@ source "package/memtester/Config.in"
 Marek>  source "package/minicom/Config.in"
 Marek>  source "package/mtd/Config.in"
 Marek>  source "package/ntfs-3g/Config.in"
 Marek> +source "package/ofono/Config.in"
 Marek>  source "package/open2300/Config.in"
 Marek>  source "package/openocd/Config.in"
 Marek>  source "package/parted/Config.in"
 Marek> diff --git a/package/ofono/Config.in b/package/ofono/Config.in
 Marek> new file mode 100644
 Marek> index 0000000..437e860
 Marek> --- /dev/null
 Marek> +++ b/package/ofono/Config.in
 Marek> @@ -0,0 +1,23 @@
 Marek> +config BR2_PACKAGE_OFONO
 Marek> +	bool "ofono"
 Marek> +	depends on BR2_USE_WCHAR # gettext/libglib2
 Marek> +	select BR2_PACKAGE_LIBCAP_NG
 Marek> +	select BR2_PACKAGE_DBUS
 Marek> +	select BR2_PACKAGE_LIBGLIB2
 Marek> +	select BR2_PACKAGE_MOBILE_BROADBAND_PROVIDER_INFO
 Marek> +	help
 Marek> +	  oFono is a free, open source project for mobile telephony
 Marek> +	  (GSM/UMTS) applications. It uses high-level D-Bus API for
 Marek> +	  use by telephony applications. It uses 3GPP standard.

You forgot to add upstream URL here.

 Marek> +
 Marek> +if BR2_PACKAGE_OFONO
 Marek> +
 Marek> +config BR2_PACKAGE_OFONO_BLUETOOTH
 Marek> +	bool "ofono with bluetooth support"
 Marek> +	select BR2_PACKAGE_BLUEZ_UTILS
 Marek> +	help
 Marek> +	  Enable bluetooth support.

I dropped this explicit option and just made it add bluetooth support if
bluez is enabled, similar to how it is done for udev (and how we
normally handle E.G. openssl).

 Marek> +endif
 Marek> +
 Marek> +comment "ofono requires a toolchain with WCHAR and C++ support"
 Marek> +	depends on !BR2_USE_WCHAR

It doesn't need C++ support.


 Marek> diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
 Marek> new file mode 100644
 Marek> index 0000000..7e35866
 Marek> --- /dev/null
 Marek> +++ b/package/ofono/ofono.mk
 Marek> @@ -0,0 +1,30 @@
 Marek> +#############################################################
 Marek> +#
 Marek> +# ofono
 Marek> +#
 Marek> +#############################################################
 Marek> +OFONO_VERSION = 1.5
 Marek> +OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 Marek> +
 Marek> +OFONO_DEPENDENCIES = host-pkg-config libglib2 dbus libcap-ng mobile-broadband-provider-info

I reformatted this line to be more readable.

 Marek> +
 Marek> +OFONO_CONF_OPT = --disable-test
 Marek> +
 Marek> +OFONO_AUTORECONF = YES

AUTORECONF is not needed when release tarballs are used.

 Marek> +
 Marek> +ifeq ($(BR2_PACKAGE_UDEV),y)
 Marek> +	OFONO_CONF_OPT += --enable-udev
 Marek> +	OFONO_DEPENDENCIES += udev
 Marek> +else
 Marek> +	OFONO_CONF_OPT += --disable-udev
 Marek> +endif
 Marek> +
 Marek> +ifeq ($(BR2_PACKAGE_OFONO_BLUETOOTH),y)
 Marek> +	OFONO_CONF_OPT += --enable-bluetooth
 Marek> +	OFONO_DEPENDENCIES += bluez_utils
 Marek> +else
 Marek> +	OFONO_CONF_OPT += --disable-bluetooth
 Marek> +endif
 Marek> +
 Marek> +$(eval $(call AUTOTARGETS))
 Marek> +

Please no empty lines after AUTOTARGETS.

-- 
Bye, Peter Korsgaard
