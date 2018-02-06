From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Tue, 6 Feb 2018 15:23:39 +0100
Subject: [Buildroot] [PATCH 3/3] hostapd: drop default dependency on
 netlink
In-Reply-To: <20171230155736.1668-4-alexander.i.mukhin@gmail.com>
References: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
 <20171230155736.1668-4-alexander.i.mukhin@gmail.com>
Message-ID: <CAH=K+6=Ae8XpGMqGLgZD-78b+pPyqxK4bVjRAMJhDt9jnpmjcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 30, 2017 at 4:57 PM, Alexander Mukhin
<alexander.i.mukhin@gmail.com> wrote:
> Get rid of netlink dependency if the options selected allow that.
>
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

Reviewed-by: Sam Voss <sam.voss@rockwellcollins.com>

> ---
>  package/hostapd/Config.in  | 17 +++++++++++------
>  package/hostapd/hostapd.mk | 28 ++++++++++++++++------------
>  2 files changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index d23e5e1dca..d60ed08cd6 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_HOSTAPD
>         bool "hostapd"
> -       depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
>         depends on BR2_USE_MMU # fork()
> -       select BR2_PACKAGE_LIBNL
>         help
>           User space daemon for wireless access points.
>
> @@ -24,10 +22,15 @@ config BR2_PACKAGE_HOSTAPD_DRIVER_HOSTAP
>  config BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
>         bool "Enable nl80211 driver"
>         default y
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +       select BR2_PACKAGE_LIBNL
>         select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
>         help
>           Enable support for drivers using the nl80211 kernel interface.
>
> +comment "nl80211 driver needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_HOSTAPD_DRIVER_RTW
>         bool "Enable rtl871xdrv driver"
>         select BR2_PACKAGE_HOSTAPD_HAS_WIFI_DRIVERS
> @@ -97,12 +100,14 @@ config BR2_PACKAGE_HOSTAPD_VLAN_NETLINK
>         bool "Use netlink-based API for VLAN operations"
>         default y
>         depends on BR2_PACKAGE_HOSTAPD_VLAN
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> +       select BR2_PACKAGE_LIBNL
>         help
>           Use netlink-based kernel API for VLAN operations
>           instead of ioctl().
>
> -endif
> -
> -comment "hostapd needs a toolchain w/ threads"
> +comment "netlink-based VLAN support needs a toolchain w/ threads"
> +       depends on BR2_PACKAGE_HOSTAPD_VLAN
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
> -       depends on BR2_USE_MMU
> +
> +endif
> diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> index f9072784eb..fa8226805d 100644
> --- a/package/hostapd/hostapd.mk
> +++ b/package/hostapd/hostapd.mk
> @@ -11,25 +11,16 @@ HOSTAPD_PATCH = \
>         http://w1.fi/security/2017-1/rebased-v2.6-0005-Fix-PTK-rekeying-to-generate-a-new-ANonce.patch
>  HOSTAPD_SUBDIR = hostapd
>  HOSTAPD_CONFIG = $(HOSTAPD_DIR)/$(HOSTAPD_SUBDIR)/.config
> -HOSTAPD_DEPENDENCIES = host-pkgconf libnl
> -HOSTAPD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
> +HOSTAPD_DEPENDENCIES = host-pkgconf
> +HOSTAPD_CFLAGS = $(TARGET_CFLAGS)
>  HOSTAPD_LICENSE = BSD-3-Clause
>  HOSTAPD_LICENSE_FILES = README
>  HOSTAPD_CONFIG_SET =
>
> -HOSTAPD_CONFIG_ENABLE = \
> -       CONFIG_INTERNAL_LIBTOMMATH \
> -       CONFIG_LIBNL32
> +HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
>
>  HOSTAPD_CONFIG_DISABLE =
>
> -# libnl-3 needs -lm (for rint) and -lpthread if linking statically
> -# And library order matters hence stick -lnl-3 first since it's appended
> -# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
> -ifeq ($(BR2_STATIC_LIBS),y)
> -HOSTAPD_LIBS += -lnl-3 -lm -lpthread
> -endif
> -
>  # Try to use openssl if it's already available
>  ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>  HOSTAPD_DEPENDENCIES += libopenssl
> @@ -105,6 +96,19 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_VLAN_NETLINK),y)
>  HOSTAPD_CONFIG_ENABLE += CONFIG_VLAN_NETLINK
>  endif
>
> +# Options for building with libnl
> +ifeq ($(BR2_PACKAGE_LIBNL),y)
> +HOSTAPD_DEPENDENCIES += libnl
> +HOSTAPD_CFLAGS += -I$(STAGING_DIR)/usr/include/libnl3/
> +HOSTAPD_CONFIG_ENABLE += CONFIG_LIBNL32
> +# libnl-3 needs -lm (for rint) and -lpthread if linking statically
> +# And library order matters hence stick -lnl-3 first since it's appended
> +# in the hostapd Makefiles as in LIBS+=-lnl-3 ... thus failing
> +ifeq ($(BR2_STATIC_LIBS),y)
> +HOSTAPD_LIBS += -lnl-3 -lm -lpthread
> +endif
> +endif
> +
>  define HOSTAPD_CONFIGURE_CMDS
>         cp $(@D)/hostapd/defconfig $(HOSTAPD_CONFIG)
>         sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(HOSTAPD_CONFIG_ENABLE)) \
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
