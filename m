From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 May 2019 09:01:11 +0200
Subject: [Buildroot] [PATCH 01/13] new package: openrc-0.41.2
In-Reply-To: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
References: <20190508220937.23200-1-michal.lyszczek@bofc.pl>
Message-ID: <20190509090111.47aac2e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Micha?,

Looks good overall, there are just a few comments/questions below.

On Thu,  9 May 2019 00:09:25 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> This adds openrc init system package. This performs default openrc
> installation with openrc-init that acts as pid1.
> 
> Signed-off-by: Micha? ?yszczek <michal.lyszczek@bofc.pl>

First of all, the commit title should be:

	package/openrc: new package

and it should be fixed similarly in PATCH 07/13 in your series, for the
openrc-netifrc package.


> diff --git a/package/openrc/Config.in b/package/openrc/Config.in
> new file mode 100644
> index 0000000000..e98ed624c9
> --- /dev/null
> +++ b/package/openrc/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_OPENRC
> +	bool "OpenRC"
> +	select BR2_PACKAGE_NCURSES
> +	help
> +	  Init that works on top of pid 1 (for example openrc-init). By default
> +	  it does quite a lot on startup (like setting hwclock, mounting
> +	  directories, configuring interfaces and so on). So for this init to
> +	  properly work you need at least these tools on the root filesystem
> +	  (default busybox configuration provides them all):
> +
> +	  swapon, fsck, hwclock, getty, login, grep, mount, coreutils, procps,
> +	  modprobe (kmod), net-tools
> +
> +	  Number of tools may be decreased by removing services that use them.

We like to have the upstream URL of the project at the end of the
Config.in help text, see how other packages do that.

> diff --git a/package/openrc/openrc.hash b/package/openrc/openrc.hash
> new file mode 100644
> index 0000000000..0d813b6a14
> --- /dev/null
> +++ b/package/openrc/openrc.hash
> @@ -0,0 +1,2 @@
> +# Calculated manually
> +sha256	c99488ca54f2b795328d07bbd456ade49b571136bba7501f7eaaeb1ca9f9ecc4	openrc-0.41.2.tar.gz

Please add the hash of the license file.

> diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
> new file mode 100644
> index 0000000000..faffb5beb0
> --- /dev/null
> +++ b/package/openrc/openrc.mk
> @@ -0,0 +1,46 @@
> +################################################################################
> +#
> +# openrc
> +#
> +################################################################################
> +
> +OPENRC_VERSION = 0.41.2
> +OPENRC_SOURCE = openrc-$(OPENRC_VERSION).tar.gz

This is not needed, the default value is that one.

> +OPENRC_SITE = $(call github,OpenRC,openrc,$(OPENRC_VERSION))
> +OPENRC_LICENSE = BSD-2-Clause
> +OPENRC_LICENSE_FILES = LICENSE
> +
> +OPENRC_DEPENDENCIES += ncurses

Just = and not +=.

> +
> +ifeq ($(BR2_SHARED_LIBS),y)
> +OPENRC_MAKE_OPTS += MKSTATICLIBS=no
> +else
> +OPENRC_MAKE_OPTS += MKSTATICLIBS=yes
> +endif
> +
> +# set LIBNAME so openrc puts files in proper directories and sets proper
> +# paths in installed files. Since in buildroot /lib64 and /lib32 always
> +# points to /lib, it's safe to hardcode it to "lib"
> +OPENRC_MAKE_OPTS += LIBNAME=lib
> +OPENRC_MAKE_OPTS += LIBEXECDIR=/usr/libexec/rc
> +OPENRC_MAKE_OPTS += TARGETDIR=$(TARGET_DIR)
> +OPENRC_MAKE_OPTS += MKPKGCONFIG=no
> +OPENRC_MAKE_OPTS += MKSELINUX=no
> +OPENRC_MAKE_OPTS += MKSYSVINIT=yes
> +OPENRC_MAKE_OPTS += BRANDING="Buildroot $(BR2_VERSION_FULL)"
> +OPENRC_MAKE_OPTS += CC=$(TARGET_CC)

It would be nicer to see all those unconditional make opts before the
conditional one for static/shared libraries, and have them on a single
line.

OPENRC_MAKE_OPTS = \
	LIBNAME=lib \
	LIBEXECDIR=... \
	...

ifeq ($(BR2_SHARED_LIBS),y)
OPENRC_MAKE_OPTS += ...
else
OPENRC_MAKE_OPTS += ...
endif

Also, a few questions:

 - How is the TARGETDIR variable used by the build system ? Why does it
   need to know the installation location at build time ?

 - What is the effect of MKPKGCONFIG=no ? What is openrc using
   pkg-config for ?

> +define OPENRC_BUILD_CMDS
> +	$(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D)
> +endef
> +
> +define OPENRC_INSTALL_TARGET_CMDS
> +	DESTDIR=$(TARGET_DIR) $(MAKE) $(OPENRC_MAKE_OPTS) -C $(@D) install

DESTDIR should be placed after $(OPENRC_MAKE_OPTS).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
