From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Feb 2015 18:19:00 +0100
Subject: [Buildroot] Batctl Package try 2
In-Reply-To: <CAFNoKatfchjqJaQ11rgBWbh02jdiDnSUGU6=B-AMP6AaGbroww@mail.gmail.com>
References: <CAFNoKatfchjqJaQ11rgBWbh02jdiDnSUGU6=B-AMP6AaGbroww@mail.gmail.com>
Message-ID: <20150208181900.712db4af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jens Zettelmeyer,

Thanks for your contribution!

I won't repeat the comments made by Yann E. Morin in his review, since
they are all valid. I will only make additional comments.

First, the title of the patch should be:

	batctl: new package

On Sun, 8 Feb 2015 11:58:01 +0000, Jens Zettelmeyer wrote:
> Hi,
> 
> after a review from Yann E. MORIN i made some adjustments to the package. I
> this version is ok i'll use git send mail to send in an propper patch.

The commit log should not contain such informations, as the commit log
is preserved forever.

> diff --git a/package/batctl/Config.in b/package/batctl/Config.in
> new file mode 100644
> index 0000000..56badd3
> --- /dev/null
> +++ b/package/batctl/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_BATCTL
> + bool "batctl"
> + depends on BR2_INET_IPV6
> + depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
> + select BR2_PACKAGE_LIBNL
> + help
> +  Batctl is the configuration and debugging tool for batman-adv.
> +
> +  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl

A Kconfig comment is missing here to tell the user about the IPv6 and
thread dependencies:

comment "batctl needs a toolchain w/ IPv6, threads"
	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS


> diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
> new file mode 100644
> index 0000000..a65a5cd
> --- /dev/null
> +++ b/package/batctl/batctl.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# batman-adv control

This should just be the name of the package, i.e: "batctl".

Yes, I know it's silly, but that's the rule :)

> +#
> +################################################################################
> +
> +BATCTL_VERSION = 2014.4.0
> +BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz

This assignment is not needed, as it is the default value.

> +BATCTL_SITE =
> http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
> +BATCTL_LICENSE = GPLv2
> +BATCTL_DEPENDENCIES += libnl

+= not really needed here, it could be just =

> +
> +define BATCTL_BUILD_CMDS
> + $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" \
> + CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3" \
> + LDFLAGS="$(TARGET_LDFLAGS)"

If possible, please use $(TARGET_CONFIGURE_OPTS) :

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3"

TARGET_CONFIGURE_OPTS is passing CC, CFLAGS, LDFLAGS, LD, and many
other useful variables. We are just passing CFLAGS afterwards to
override the default (which is just $(TARGET_CFLAGS)).

> +define BATCTL_INSTALL_TARGET_CMDS
> + $(INSTALL) -m 755 -D $(@D)/batctl $(TARGET_DIR)/usr/sbin/batctl
> +endef

No 'make install' target in the project Makefile? If it exists and it's
working, please use it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
