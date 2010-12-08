From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Dec 2010 20:30:36 +0100
Subject: [Buildroot] [PATCH] New package: fbgrab
In-Reply-To: <1291764170-11947-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1291764170-11947-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20101208203036.1ca0d3bb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for proposing this package!

On Wed,  8 Dec 2010 00:22:50 +0100
Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:

> FBGrab is a framebuffer screenshot program, capturing the linux frambuffer and converting it to a png-picture.

The git commit log should be wrapped at a reasonable limit (~ 80
columns).

> diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
> new file mode 100644
> index 0000000..0ede91e
> --- /dev/null
> +++ b/package/fbgrab/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_FBGRAB
> +	bool "fbgrab"
> +	select BR2_PACKAGE_LIBPNG
> +        select BR2_PACKAGE_ZLIB

Indentation issue. It should be one tab before bool/select/help, and
the help message itself should be indented with one tab + 2 spaces.

> +	help
> +	  FBGrab is a framebuffer screenshot program, capturing the linux frambuffer and converting it to a png-picture.

Should be wrapped at a reasonable limit as well.

> diff --git a/package/fbgrab/fbgrab-proper_makefile.patch b/package/fbgrab/fbgrab-proper_makefile.patch
> new file mode 100644
> index 0000000..8f7919e
> --- /dev/null
> +++ b/package/fbgrab/fbgrab-proper_makefile.patch

Peter wants each patch to have a description and an author here.

> @@ -0,0 +1,16 @@
> +--- fbgrab-1.0.orig/Makefile	2010-12-07 22:57:24.000000000 +0100
> ++++ fbgrab-1.0/Makefile	2010-12-07 22:58:36.000000000 +0100
> +@@ -3,9 +3,10 @@
> + ### modular. So this is a simple gnu Makefile...
> + ###
> + 
> +-fbgrab: fbgrab.c
> +-	splint +posixlib fbgrab.c
> +-	gcc -g -Wall fbgrab.c -lpng -lz -o fbgrab
> ++LDFLAGS += -lpng -lz
> ++
> ++fbgrab: fbgrab.o
> ++	$(CC) $(LDFLAGS) fbgrab.o -o $@
> + 
> + install:
> + 	strip fbgrab
> diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
> new file mode 100644
> index 0000000..459fd37
> --- /dev/null
> +++ b/package/fbgrab/fbgrab.mk
> @@ -0,0 +1,16 @@
> +FBGRAB_VERSION = 1.0
> +FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
> +FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
> +FBGRAB_DEPENDENCIES = libpng zlib
> +
> +define FBGRAB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> +endef

Can you try to see if using $(TARGET_CONFIGURE_OPTS) is possible to
pass CFLAGS/LDFLAGS/CC/LD ?

> +define FBGRAB_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin
> +endef

This will install "fbgrab" as a file named "bin" in $(TARGET_DIR)/usr.
So the line should be :

$(INSTALL) -m 0755 -D $(@D)/fbgrab $(TARGET_DIR)/usr/bin/fbgrab

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
