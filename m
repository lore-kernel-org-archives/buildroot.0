From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Oct 2017 23:00:11 +0200
Subject: [Buildroot] [PATCH] wireguard: add new package
In-Reply-To: <20170906202208.23404-2-aurelien@chabot.fr> (=?utf-8?Q?=22Aur?=
 =?utf-8?Q?=C3=A9lien?= Chabot"'s
 message of "Wed, 6 Sep 2017 21:22:08 +0100")
References: <20170906202208.23404-1-aurelien@chabot.fr>
 <20170906202208.23404-2-aurelien@chabot.fr>
Message-ID: <87fub1clk4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Aur?lien" == Aur?lien Chabot <aurelien@chabot.fr> writes:

 > Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>

Sorry for the slow response. Committed after doing quite some changes
(see below), thanks.


 > diff --git a/package/wireguard/0001-build-Add-a-tools-install-target.patch b/package/wireguard/0001-build-Add-a-tools-install-target.patch
 > new file mode 100644
 > index 000000000..b265322bc
 > --- /dev/null
 > +++ b/package/wireguard/0001-build-Add-a-tools-install-target.patch
 > @@ -0,0 +1,34 @@
 > +From 5b940d6c65b0c1f58b4637f5b2300b65f46bbca3 Mon Sep 17 00:00:00 2001
 > +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
 > +Date: Fri, 1 Sep 2017 11:46:51 +0100
 > +Subject: [PATCH 1/2] build: Add a tools-install target

This patch doesn't seem to have been accepted upstream, and it isn't
really needed as we can just directly call the Makefile in src/tools, so
I've dropped it.


> diff --git a/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch b/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch
 > new file mode 100644
 > index 000000000..36764c590
 > --- /dev/null
 > +++ b/package/wireguard/0002-build-Allow-to-configure-the-used-depmod.patch
 > @@ -0,0 +1,39 @@
 > +From ceb789b729d62433a8ab6e07dbfabc1eebeaf430 Mon Sep 17 00:00:00 2001
 > +From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
 > +Date: Thu, 31 Aug 2017 22:26:37 +0100
 > +Subject: [PATCH 2/2] build: Allow to configure the used depmod

We already have kernel-module infrastructure in Buildroot, and if we use
that then this patch also isn't needed, so I've dropped this as well.

 > +config BR2_PACKAGE_WIREGUARD
 > +    bool "wireguard"
 > +    help

bool/help/.. should be indented with a <tab>.

> +      WireGuard is an extremely simple yet fast and modern VPN that utilizes state-of-the-art cryptography. It aims to be faster, simpler, leaner, and more useful than IPSec, while avoiding the massive headache. It intends to be considerably more performant than OpenVPN. WireGuard is designed as a general purpose VPN for running on embedded interfaces and super computers alike, fit for many different circumstances. Initially released for the Linux kernel, it plans to be cross-platform and widely deployable. It is currently under heavy development, but already it might be regarded as the most secure, easiest to use, and simplest VPN solution in the industry.

The lines are way too long, please keep to ~70 chars. Even better,
consider running tools/check-package on your patches before submitting.


 > +      https://www.wireguard.com
 > +
 > +if BR2_PACKAGE_WIREGUARD
 > +
 > +config BR2_PACKAGE_WIREGUARD_MODULE
 > +    bool "Kernel Module"
 > +    default y
 > +    depends on BR2_LINUX_KERNEL
 > +    help
 > +      Wireguard kernel module
 > +
 > +comment "wireguard module needs a Linux kernel to be built"
 > +    depends on !BR2_LINUX_KERNEL
 > +
 > +config BR2_PACKAGE_WIREGUARD_TOOLS
 > +    bool "User Tools"
 > +    default y
 > +    select BR2_PACKAGE_LIBMNL
 > +    help
 > +      Command-line tools to interact with the WireGuard kernel module. Currently, it provides only a single tool:
 > +        wg: set and retrieve configuration of WireGuard interfaces
 > +
 > +endif

These explicit options IMHO doesn't make any sense. We always build a
rootfs, so the user space part should be unconditionally built if
wireguard is enabled.

For the kernel module we could either make the package depend on
BR2_LINUX_KERNEL or only build the module if we are also building a
kernel. I went with the last option for flexibility.

The kernel module needs a number of kernel options to be enabled, so
I've added the needed logic in linux.mk to do that.


 > diff --git a/package/wireguard/wireguard.hash b/package/wireguard/wireguard.hash
 > new file mode 100644
 > index 000000000..5bd1163d3
 > --- /dev/null
 > +++ b/package/wireguard/wireguard.hash
 > @@ -0,0 +1,2 @@
 > +# Locally calculated
 > +sha256 ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7 WireGuard-0.0.20170810.tar.xz
 > diff --git a/package/wireguard/wireguard.mk b/package/wireguard/wireguard.mk
 > new file mode 100644
 > index 000000000..bbabd4143
 > --- /dev/null
 > +++ b/package/wireguard/wireguard.mk
 > @@ -0,0 +1,49 @@
 > +################################################################################
 > +#
 > +## wireguard
 > +#
 > +#################################################################################

The file header is wrong (80x # and a single # before the package name).

> +
 > +WIREGUARD_VERSION = 0.0.20170810
 > +WIREGUARD_SOURCE = WireGuard-$(WIREGUARD_VERSION).tar.xz
 > +WIREGUARD_SITE = https://git.zx2c4.com/WireGuard/snapshot
 > +WIREGUARD_DEPENDENCIES =

The src/tools Makefile uses pkg-config so we need to pull in
host-pkgconf.

> +WIREGUARD_LICENSE = GPL-2.0
 > +WIREGUARD_LICENSE_FILES = COPYING
 > +WIREGUARD_MAKE_OPTS = \
 > +    $(LINUX_MAKE_FLAGS) \
 > +    KERNELDIR=$(LINUX_DIR) \
 > +    KERNELVERSION=$(LINUX_VERSION) \

These are not needed when using the kernel-module infrastructure.

 > +    DESTDIR=$(TARGET_DIR) \
 > +    WITH_WGQUICK=yes

wgquick is a bash script, so this should only be enabled if
BR2_PACKAGE_BASH is enabled. Same for the bash completion logic.

> +
 > +ifeq ($(BR2_INIT_SYSTEMD),y)
 > +    WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=yes
 > +else
 > +    WIREGUARD_MAKE_OPTS += WITH_SYSTEMDUNITS=no
 > +endif
 > +
 > +WIREGUARD_TARGET_BUILD=
 > +WIREGUARD_TARGET_INSTALL=
 > +
 > +ifeq ($(BR2_PACKAGE_WIREGUARD_MODULE),y)
 > +    TARGET_BUILD += module
 > +    TARGET_INSTALL += module-install
 > +    WIREGUARD_DEPENDENCIES += linux
 > +endif
 > +
 > +ifeq ($(BR2_PACKAGE_WIREGUARD_TOOLS),y)
 > +    TARGET_BUILD += tools
 > +    TARGET_INSTALL += tools-install
 > +    WIREGUARD_DEPENDENCIES += libmnl
 > +endif

Buildroot uses a global variable name space, so the variables should be
prefixed with the package name (E.G. WIREGUARD_TARGET_BUILD). With the
simplifications mentioned above none of this is needed though.

> +
 > +define WIREGUARD_BUILD_CMDS
 > +    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(WIREGUARD_MAKE_OPTS) $(MAKE) -C $(@D)/src $(TARGET_BUILD)

It would make more sense to pass WIREGUARD_MAKE_OPTS as arguments to
make instead of in the environment, so I've changed this.

You didn't add an entry for wireguard in the DEVELOPERS file. Could you
please send a patch doing so?

-- 
Bye, Peter Korsgaard
