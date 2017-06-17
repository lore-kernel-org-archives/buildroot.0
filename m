From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jun 2017 15:23:53 +0200
Subject: [Buildroot] [PATCH 1/1] linuxconsoletools: new package
In-Reply-To: <201706170839.v5H8dn7C021102@mx1.sonologic.net>
References: <201706170839.v5H8dn7C021102@mx1.sonologic.net>
Message-ID: <20170617152353.1d52df66@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Jun 2017 09:04:52 +0200, Koen Martens wrote:
> Linuxconsoletools (http://sf.net/projects/linuxconsole/)
> contains the inputattach utility to attach legacy serial
> devices to the Linux kernel input layer and joystick
> utilities to calibrate and test joysticks and joypads.
> 
> The buildroot package adds options to build only certain
> tools and makes installation of man pages optional.
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>

Thanks for this first contribution! See below some comments about your
patch.

> diff --git a/package/linuxconsoletools/0001-conditional-build.patch b/package/linuxconsoletools/0001-conditional-build.patch
> new file mode 100644
> index 0000000..7e98963
> --- /dev/null
> +++ b/package/linuxconsoletools/0001-conditional-build.patch
> @@ -0,0 +1,107 @@
> +Selectively build groups of tools (inputattach,
> +joystick tools and/or force-feedback tools).
> +
> +Make installation of documentation (man pages)
> +optional.
> +
> +Signed-off-by: Koen Martens <gmc@sonologic.nl>

Do we really need to make all of this configurable? What is the
installed size of the different tools?

In any case, making the documentation installation optional is useless:
Buildroot unconditionally removes the documentation at the end of the
build. So just let the package Makefile install the documentation, it
will be removed anyway.

> diff --git a/package/linuxconsoletools/Config.in b/package/linuxconsoletools/Config.in
> new file mode 100644
> index 0000000..557edae
> --- /dev/null
> +++ b/package/linuxconsoletools/Config.in
> @@ -0,0 +1,43 @@
> +config BR2_PACKAGE_LINUXCONSOLETOOLS
> +	bool "linuxconsoletools"
> +	default n

Not needed, this is the default.

> +	help
> +	  Linuxconsoletools (http://sf.net/projects/linuxconsole/)
> +	  contains the inputattach utility to attach legacy serial
> +	  devices to the Linux kernel input layer and joystick
> +	  utilities to calibrate and test joysticks and joypads.

Please add a blank line here, and then the upstream URL of the project
(rather than between parenthesis as you did).

> +if BR2_PACKAGE_LINUXCONSOLETOOLS
> +
> +config BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH
> +	bool "build inputattach"

Again I'm not sure we need sub-options. But if you keep them remove the
"build", i.e just use "inputattach" as the prompt.

> +	default y
> +	help
> +	  The inputattach utility attaches legacy serial devices
> +	  to the Linux kernel input layer.
> +
> +config BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK
> +	bool "build joystick utilities"

Ditto.

> +	default n

Not needed, please remove.

> +	help
> +	  Build joystick utilities (jstest, jscal, jscal-store,
> +	  jscal-restore, evdev-joystick).
> +
> +config BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK
> +	bool "build force-feedback utilities"

Remove "build".

> +	default n

Ditto.

> +	depends on BR2_PACKAGE_SDL

If you keep this option, please use a "select" instead.

> +	help
> +	  Build force-feedback driver utilities (fftest,
> +	  ffmvforce, ffset, ffcfstress).
> +
> +comment "build force-feedback utilities depends on SDL"
> +	depends on !BR2_PACKAGE_SDL

... and drop this comment.

> +
> +config BR2_PACKAGE_LINUXCONSOLETOOLS_DOCS
> +	bool "install man pages"

Remove this option, we never install documentation in the target
filesystem in Buildroot.

> +LINUXCONSOLETOOLS_VERSION = 1.6.0
> +LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-${LINUXCONSOLETOOLS_VERSION}.tar.bz2

Please use $(...) to reference variables, not ${...}.

> +LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
> +LINUXCONSOLETOOLS_LICENSE = GPLv2+

We use SPDX license codes now, so please use GPL-2.0+.

> +LINUXCONSOLETOOLS_LICENSE_FILES = COPYING
> +LINUXCONSOLETOOLS_DEPENDENCIES =
> +LINUXCONSOLETOOLS_ENV = 

Remove those two lines, they are not needed.

> +SDL_CONFIG =

Remove this line, it's not needed, and potentially harmful.

> +
> +ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_INPUTATTACH),y)
> +	LINUXCONSOLETOOLS_ENV +=  ENABLE_INPUTATTACH=1 

Please avoid trailing whitespaces. And also, don't indent such lines.
Only one space after += sign.

> +endif

One blank line here please.

Please fix globally.


> +ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_JOYSTICK),y)
> +	LINUXCONSOLETOOLS_ENV +=  ENABLE_JOYSTICK=1 
> +endif
> +ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_FORCEFEEDBACK),y)
> +	LINUXCONSOLETOOLS_ENV +=  ENABLE_FORCEFEEDBACK=1 
> +	LINUXCONSOLETOOLS_DEPENDENCIES += sdl
> +	SDL_CONFIG = $(STAGING_DIR)/usr/bin/sdl-config

Very wrong. The namespace of variables in Buildroot is global, so when
you set a variable named SDL_<something> you are messing with the SDL
package. What you want here is create a LINUXCONSOLETOOLS_MAKE_OPTS
variable, that will be passed to the build commands, and here you do:

LINUXCONSOLETOOLS_MAKE_OPTS += SDL_CONFIG=$(STAGING_DIR)/usr/bin/sdl-config

> +endif
> +ifeq ($(BR2_PACKAGE_LINUXCONSOLETOOLS_DOCS),y)
> +	LINUXCONSOLETOOLS_ENV +=  ENABLE_DOCS=1 
> +endif

Not needed, we don't want documentation.

> +
> +define LINUXCONSOLETOOLS_BUILD_CMDS
> +	$(LINUXCONSOLETOOLS_ENV) \
> +	$(TARGET_MAKE_ENV) \
> +    CC="$(TARGET_CC)" \
> +    CFLAGS="$(TARGET_CFLAGS)" \
> +	SDL_CONFIG="$(SDL_CONFIG)" \
> +	$(MAKE) -C $(@D)

This should be:

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		$(LINUXCONSOLETOOLS_MAKE_OPTS)

> +endef
> +
> +define LINUXCONSOLETOOLS_INSTALL_TARGET_CMDS
> +	$(LINUXCONSOLETOOLS_ENV) \
> +	$(TARGET_MAKE_ENV) \
> +    CC="$(TARGET_CC)" \
> +    CFLAGS="$(TARGET_CFLAGS)" \
> +	SDL_CONFIG="$(SDL_CONFIG)" \
> +	DESTDIR="$(TARGET_DIR)" \
> +    PREFIX=/usr \
> +	make -C $(@D) install

and this should be:

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
		$(LINUXCONSOLETOOLS_MAKE_OPTS) \
		DESTDIR="$(TARGET_DIR)" \
		PREFIX=/usr \
		install

Could you fix the above issues, and send an updated version?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
