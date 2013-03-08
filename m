From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 8 Mar 2013 15:07:06 -0800
Subject: [Buildroot] add dhcpcd package
In-Reply-To: <1362733696.30287.145.camel@genx>
References: <1362733696.30287.145.camel@genx>
Message-ID: <CAKcgs2x1y3s369ziX3KzOXZYbHaGuOpoWwzhV5v-xMC7CejbbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John,

2013/3/8 John Stile <john@stilen.com>:
> dhcpcd: new package
>
> Dhcpcd is an RFC2131 compliant DHCP client.
>
> Signed-off-by: John Stile <john@stilen.com>
> ---
>  package/Config.in        |  1 +
>  package/dhcpcd/Config.in |  5 +++++
>  package/dhcpcd/dhcpcd.mk | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+)
>  create mode 100644 package/dhcpcd/Config.in
>  create mode 100644 package/dhcpcd/dhcpcd.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 22e64f8..924b464 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -633,6 +633,7 @@ source "package/cups/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/dhcp/Config.in"
>  endif
> +source "package/dhcpcd/Config.in"
>  source "package/dhcpdump/Config.in"
>  source "package/dnsmasq/Config.in"
>  source "package/dropbear/Config.in"
> diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
> new file mode 100644
> index 0000000..3855c6a
> --- /dev/null
> +++ b/package/dhcpcd/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_DHCPCD
> +       bool "dhcpcd"
> +       help
> +         An RFC2131 compliant DHCP client
> +         NOTE: If uClibc, depends on  UCLIBC_SUPPORT_AI_ADDRCONFIG=y
I am not sure this is needed, as this option is now enabled by default.

> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> new file mode 100644
> index 0000000..c7aa82e
> --- /dev/null
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -0,0 +1,48 @@
> +#############################################################
> +#
> +# dhcpcd
> +#
> +#############################################################
> +
> +DHCPCD_VERSION = 5.6.7
> +DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
> +DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd/
> +DHCPCD_LICENSE = BSD-2c
> +
> +ifeq ($(BR2_USE_MMU),n)
> +       DHCPCD_CONFIG_OPT += --disable-fork
> +endif
> +
> +ifeq ($(BR2_INET_IPV6),)
> +       DHCPCD_CFLAGS += -UHASIPv6
> +endif
What are you trying to achieve here? I am not sure IPv6 can be
disabled at compile time in this package.
Have you tried building it with a toolchain that does not support IPv6?

> +
> +define DHCPCD_CONFIGURE_CMDS
> +       (cd $(@D); \
> +       ./configure \
> +       --target=$(BR2_GCC_TARGET_ARCH) \
> +       --os=linux \
> +       $(DHCPCD_CONFIG_OPT) )
> +endef
> +
> +define DHCPCD_BUILD_CMDS
> +       $(MAKE) \
> +       $(TARGET_CONFIGURE_OPTS) \
> +       $(DHCPCD_CFLAGS) \
Shouldn'it it be something like CFLAGS = $(DHCPCD_FLAGS) or "whatever"
FLAGS = $(DHCPCD_FLAGS)

Gilles.
