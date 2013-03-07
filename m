From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 18:15:25 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362670216.30287.9.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
 <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
 <1362620699.20183.193.camel@genx>
 <CAKcgs2yMcJMbJ+aM3XSpV7TdFdrAgTzZx0v6DL6qHv0gWv2SKg@mail.gmail.com>
 <1362641501.11556.12.camel@genx>
 <CAKcgs2zvC-vxm78cqQYN4=kahsWkoNQ+yTToUGsz3SmbSA1rTQ@mail.gmail.com>
 <1362667990.30287.6.camel@genx> <20130307160350.1fdeb066@skate>
 <1362670216.30287.9.camel@genx>
Message-ID: <20130307181525.340f8050@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Thu, 07 Mar 2013 07:30:16 -0800, John Stile wrote:

> How does this look?

Do you want this patch to be integrated? If so, please send just your
patch in an e-mail, with nothing else. The best thing is to use git
send-email.

> -----------------
> dhcpcd patch
> -----------------
> Adding pacakge dhcpcd to buildroot, ordered alphbetically in Networking pacakges, warning about uClibc config.
> 
> signed-off-by: John Stile <john@stilen.com>

Formatting of the commit log is not correct:

 * One first line, less than ~80-100 characters, giving the title of
   the patch. So something like 'dhcpcd: new package'

 * One empty line.

 * One or more paragraphs giving details about what the patch does. It
   should be line-wrapped at ~80 columns. Please fix the typos in the
   message.

 * One empty line.

 * Signed-off-by line. Note the capital S.

> 
> --- a/buildroot-2011.11/package/Config.in	2013-03-07 07:17:35.000000000 -0800
> +++ b/buildroot-2011.11/package/Config.in	2013-03-07 07:17:05.000000000 -0800

Please use Git to generate your patches. Those patches are generated to
be applied for patch -p2 while they should be generated to apply with
patch -p1. Just use Git, it will do the Right Thing (TM).

> @@ -408,6 +408,7 @@ source "package/cups/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  source "package/dhcp/Config.in"
>  endif
> +source "package/dhcpcd/Config.in"
>  source "package/dhcpdump/Config.in"
>  source "package/dnsmasq/Config.in"
>  source "package/dropbear/Config.in"
> 
> --- a/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-07 07:23:25.000000000 -0800
> +++ b/buildroot-2011.11/package/dhcpcd/Config.in	2013-03-07 07:21:47.000000000 -0800
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_DHCPCD
> +	        bool "dhcpcd"
> +	        help
> +	          an RFC2131 compliant DHCP client
> +	          NOTE: If uClibc, depends on  UCLIBC_SUPPORT_AI_ADDRCONFIG=y

Indentation for bool/help: one tab.

Indentation for the help text: one tab + two spaces.

> --- a/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-07 07:13:09.000000000 -0800
> +++ b/buildroot-2011.11/package/dhcpcd/dhcpcd.mk	2013-03-07 07:00:54.000000000 -0800
> @@ -0,0 +1,46 @@
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
> +DHCPCD_INSTALL_STAGING = NO

Line not needed.

> +
> +CONFIG_ARGS += --target=$(BR2_GCC_TARGET_ARCH)
> +CONFIG_ARGS += --os=linux

All variables should be prefixed with the package name. However, in
this case it makes more sense to put those options directly in the
DHCPCD_CONFIGURE_CMDS.

> +ifeq ($(BR2_USE_MMU),n)
> +	CONFIG_ARGS += --disable-fork
> +endif 

BR2_USE_MMU will never be 'n'. It can be either 'y' or the empty
value. So:

ifeq ($(BR2_USE_MMU),)
	DHCPCD_CONF_OPT += --disable-fork
endif

> +
> +ifeq ($(BR2_INET_IPV6),)
> +	DHCPCD_CFLAGS += -UHASIPv6
> +endif

So when IPv6 is not available, you enable IPv6 in your package?

> +define DHCPCD_CONFIGURE_CMDS
> +	(cd $(@D); \
> +	./configure $(CONFIG_ARGS) )
> +endef

Make this:

define DHCPCD_CONFIGURE_CMDS
	(cd $(@D); \
		./configure \
		--target=$(GNU_TARGET_NAME) \
		--os=linux \
		$(DHCPCD_CONF_OPT))
endef

> +
> +define DHCPCD_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS)  CC="$(TARGET_CC)" LD="$(TARGET_LD)"  PATH=$(TARGET_PATH) $(DHCPCD_CFLAGS) -C $(@D) all
> +endef

No need to pass CC, LD and PATH, they are already part of
TARGET_CONFIGURE_OPTS.

> +define DHCPCD_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/dhcpcd $(TARGET_DIR)/usr/bin/dhcpcd
> +	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf $(TARGET_DIR)/etc/dhcpcd.conf
> +endef
> +
> +define DHCPCD_DEVICES
> +	#/dev/foo  c  666  0  0  42  0  -  -  -
> +endef

DHCPCD_DEVICES not needed.

> +define DHCPCD_PERMISSIONS
> +	/usr/bin/dhcpcd  f  4755  0  0  -  -  -  -  -
> +endef

Are you sure this is needed?

> +$(eval $(call GENTARGETS))

This should be $(eval $(generic-package)) if you want your patch to be
merged in Buildroot.

Also, please add a comment just above $(eval $(generic-package)) that
says something like: "Even though the package has a configure script,
it is not a configure script generated using the autotools, so we have
to use the generic package infrastructure".

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
