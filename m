From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jan 2014 14:08:33 +0800
Subject: [Buildroot] [PATCH 1/3] wiringpi: new package
In-Reply-To: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
References: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
Message-ID: <20140111140833.44613b15@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lucas De Marchi,

On Fri, 10 Jan 2014 17:50:20 -0200, Lucas De Marchi wrote:

> wiringpi has a really poor build system wrt cross-compiling and has no
> official release. These are the patches needed to cross-compile it in
> its latest revision.

We already had a patch that proposed to add this library in July 2013
(search for "Raspberry Pi - WiringPi Library Package" in the mailing
list archives). At the time, the approach of the patch was to
completely replace the package build system by a CMake based one. The
patches were actually smaller than the ones you're proposing here:

 package/Config.in                                 |   1 +
 package/wiringpi/Config.in                        |   8 ++
 package/wiringpi/wiringpi-CLOEXEC-undefined.patch |  15 ++++
 package/wiringpi/wiringpi-cmake-support.patch     | 101 ++++++++++++++++++++++
 package/wiringpi/wiringpi.mk                      |  41 +++++++++

That being said, the big drawback of having a completely different
build system is that everytime we will bump this library, we will need
to do some close analysis to verify that our CMake based build system
is aligned with what the official custom build system is doing. In that
sense, I may in the end prefer your approach that consists in fixing
the build system itself. This way, if it gets changed, then we'll
automatically have these changes, or we will notice through conflicts
that things have changed.

Also, looking at your patches below, only a few of them are in fact
directly related to cross-compilation. Most of them fix various other
issues, and maybe could be upstreamed.

> This patch set was made hoping it would be merged by upstream. Therefore
> it's conservative on the changes. However the feedback was that
> "cross-compiling is wrong and you should fork it if you want to do so".

These RasberryPi people are really crazy. That some of them want to
spend hours doing native builds on their RasberryPi is a thing, but
that they force everybody to use those poor practices is really
frustrating.

> diff --git a/package/wiringpi/0002-Fix-typo-in-makefiles.patch b/package/wiringpi/0002-Fix-typo-in-makefiles.patch
> new file mode 100644
> index 0000000..3145aa5
> --- /dev/null
> +++ b/package/wiringpi/0002-Fix-typo-in-makefiles.patch
> @@ -0,0 +1,187 @@
> +From d87fbc10e372139736029009f0574e228776f205 Mon Sep 17 00:00:00 2001
> +From: Lucas De Marchi <lucas.de.marchi@gmail.com>
> +Date: Sat, 28 Dec 2013 18:26:13 -0200
> +Subject: [PATCH 2/8] Fix typo in makefiles
> +
> +It's PHONY, not PHONEY.

This one can probably be upstreamed. Or maybe making typos is also part
of the RasberryPi way of doing things? :-)


> diff --git a/package/wiringpi/0004-Add-gitignore-file.patch b/package/wiringpi/0004-Add-gitignore-file.patch
> new file mode 100644
> index 0000000..081d5be
> --- /dev/null
> +++ b/package/wiringpi/0004-Add-gitignore-file.patch
> @@ -0,0 +1,23 @@
> +From 5f677acf115e1aa36d32a93164aa669d73c40fbf Mon Sep 17 00:00:00 2001
> +From: Lucas De Marchi <lucas.de.marchi@gmail.com>
> +Date: Sat, 28 Dec 2013 18:26:20 -0200
> +Subject: [PATCH 4/8] Add gitignore file

I don't think we really need this patch in Buildroot.

> diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
> new file mode 100644
> index 0000000..1e7433a
> --- /dev/null
> +++ b/package/wiringpi/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_WIRINGPI
> +	bool "wiringpi"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_PACKAGE_RPI_USERLAND

Is this dependency really needed? What does rpi-userland brings that is
needed for wiringPi?

> +	help
> +	  WiringPi is a GPIO access library written in C for the BCM2835
> +	  used in the Raspberry Pi.

I continue to be skeptical about the usefulness of such a library. Why
not just use the /sys/class/gpio interface? But well, wiringPi seems to
actually be used by some people, so we should have a package for it.

> diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
> new file mode 100644
> index 0000000..8e448ea
> --- /dev/null
> +++ b/package/wiringpi/wiringpi.mk
> @@ -0,0 +1,28 @@
> +################################################################################
> +#
> +# wiringpi
> +#
> +################################################################################
> +
> +WIRINGPI_VERSION = f18c8f7204d6354220fd6754578b3daa43734e1b
> +WIRINGPI_SITE = git://git.drogon.net/wiringPi
> +
> +WIRINGPI_LICENSE = LGPLv3

License is LGPLv3+ it seems

> +WIRINGPI_LICENSE_FILES = COPYING.LESSER
> +
> +PREFIX = /usr

No, this is not possible. Make variables in Buildroot are global, and
we clearly do not want a global PREFIX variable to be defined.

> +define WIRINGPI_BUILD_CMDS
> +	env
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) $(MAKE) -C $(@D)/wiringPi
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) $(MAKE) -C $(@D)/devLib
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/gpio
> +endef
> +
> +define WIRINGPI_INSTALL_TARGET_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/wiringPi install
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/devLib install
> +	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) PREFIX=$(PREFIX) DESTDIR=$(TARGET_DIR) $(MAKE) -C $(@D)/gpio install
> +endef

A better solution is probably:

WIRINGPI_MAKE_OPTS = \
	$(TARGET_CONFIGURE_OPTS) \
	PREFIX=/usr

WIRINGPI_DIRS = wiringPi devLib gpio

define WIRINGPI_BUILD_CMDS
	$(foreach d,$(WIRINGPI_DIRS),\
		$(TARGET_MAKE_ENV) $(MAKE) $(WIRINGPI_MAKE_OPTS) -C $(@D)/$(d))
endef

define WIRINGPI_INSTALL_TARGET_CMDS
	$(foreach d,$(WIRINGPI_DIRS),\
		$(TARGET_MAKE_ENV) $(MAKE) $(WIRINGPI_MAKE_OPTS) DESTDIR=$(TARGET_DIR) -C $(@D)/$(d) install)
endef

Also, I'm a bit surprised that it doesn't get installed in the staging
directory (i.e WIRINGPI_INSTALL_STAGING = YES). If it's a library, to
which other applications can get linked to, then it should be installed
to the staging directory as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
