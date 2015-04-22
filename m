From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 22 Apr 2015 09:56:18 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/swupdate: new package
In-Reply-To: <5536C0ED.1080301@mind.be>
References: <1429576251-28975-1-git-send-email-joerg.krause@embedded.rocks>
 <5536C0ED.1080301@mind.be>
Message-ID: <1429689378.3833.19.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2015-04-21 at 23:28 +0200, Arnout Vandecappelle wrote:
> On 21/04/15 02:30, J?rg Krause wrote:
> > This patch is based on an WIP version submitted by Romain Naour, 
> > commented by
> > Arnout Vandecappelle:
> > https://patchwork.ozlabs.org/patch/401270/
> > 
> > This package provides a default configuration with all external 
> > dependencies
> > enabled. This is necessary because upstream does not detect which 
> > dependencies
> > are available. Furthermore, upstream does not implement a 
> > savedefconfig target.
> > 
> > Note that swupdate provides its own customized version of mongoose 
> > and
> > lsqlite3.
> > 
> > swupdate provides a default website which can be installed to the 
> > target to
> > enable firmware update with a browser. This patch adds the user 
> > option to
> > install this website.
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > Cc: Romain Naour <romain.naour@openwide.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Tested-by: Mike Williams <mike@mikebwilliams.com>
> > ---
> > Changes v2 -> v3:
> >   - bump to latest commit d7753be4fd8bdf2ba4ba56ee869550663b2cca80
> >   - enable all dependencies (Arnout)
> >   - rewrite help text for configuration file
> >   - add option to install default website
> > 
> > Changes v1 -> v2:
> >   - bump to latest commit d9f58b5a3263b1b00c6d011cd8cdd65e69890b46
> >   - update Sob email address
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> > ---

[snip]

> > --- /dev/null
> > +++ b/package/swupdate/Config.in
> > @@ -0,0 +1,42 @@
> > +config BR2_PACKAGE_SWUPDATE
> > +   bool "swupdate"
> > +   depends on BR2_TOOLCHAIN_HAS_THREADS # OpenSSL
> > +   depends on BR2_PACKAGE_LUA_5_2
> 
>  Yikes, now I see this dependency so explicitly, it does look kind 
> of scary...
> 
>  Maybe it's a better idea to not support lua at all instead.
> 
>  How big a difference does it make in rootfs size?

Enabling lua adds 30KB for Lua 5.2 and 20KB for swupdate to rootfs.tar.

>  What do you think, Joerg? Romain? Others?

The additional 50KB are neglectable for me. What I don't like is that 
I I have to select Lua 5.2 first to be able to select swupdate.

How about removing lua support from the default config and adding a
check "ifeq($(BR2_PACKAGE_LUA_5_2),y)" which enables all lua features
in swupdate.

> 
> > +   select BR2_PACKAGE_LIBCONFIG
> > +   select BR2_PACKAGE_LIBCURL
> > +   select BR2_PACKAGE_MTD
> > +   select BR2_PACKAGE_OPENSSL
> > +   select BR2_PACKAGE_ZLIB
> > +   help
> > +     swupdate provides a reliable way to update the software 
> > on an
> > +     embedded system.
> > +
> > +     https://github.com/sbabic/swupdate.git
> > +
> > +if BR2_PACKAGE_SWUPDATE
> > +
> > +config BR2_PACKAGE_SWUPDATE_CONFIG
> > +   string "swupdate configuration file"
> > +   default "package/swupdate/swupdate.config"
> > +   help
> > +     The default swupdate configuration file will enable 
> > swupdate with
> > +     an image downloader, a webserver, and lua support, as 
> > well as
> > +     handlers for UBI volumes, raw NAND or NOR flash, SD 
> > cards, shell
> > +     scripts, and the U-Boot bootloader environment.
> > +
> > +     Most people will just use the default swupdate 
> > configuration file.
> > +     However, some people may wish to use their own modified 
> > swupdate
> > +     configuration file, and will specify their config file 
> > location
> > +     with this option.
> > +
> > +config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
> > +   bool "install default website"
> > +   help
> > +     Install the provided website to /var/www/swupdate.
> > +endif
> > +
> > +comment "swupate support needs toolchain w/ threads"
> > +   depends on !BR2_TOOLCHAIN_HAS_THREADS
> > +
> > +comment "swupate needs a Lua 5.2 interpreter"
> > +   depends on !BR2_PACKAGE_LUA_5_2
> > diff --git a/package/swupdate/swupdate-0001-Add-missing-header-for
> > -off_t.patch b/package/swupdate/swupdate-0001-Add-missing-header
> > -for-off_t.patch
> > new file mode 100644
> > index 0000000..4be0f7b
> > --- /dev/null
> > +++ b/package/swupdate/swupdate-0001-Add-missing-header-for
> > -off_t.patch
> > @@ -0,0 +1,25 @@
> > +From 4e382373cad64ca7e183336e33b72c53cfeed340 Mon Sep 17 00:00:00 
> > 2001
> > +From: Romain Naour <romain.naour@openwide.fr>
> > +Date: Sun, 7 Sep 2014 17:31:09 +0200
> > +Subject: [PATCH 1/1] Add missing header for off_t
> > +
> > +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
>  What's the upstream status of this? Stefan is normally pretty 
> reactive...

It's not upstream yet. I will send the patch to Stefano.

> > +---
> > + include/swupdate.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/include/swupdate.h b/include/swupdate.h
> > +index 78b7f85..c193397 100644
> > +--- a/include/swupdate.h
> > ++++ b/include/swupdate.h
> > +@@ -23,6 +23,7 @@
> > + #ifndef _SWUPDATE_H
> > + #define _SWUPDATE_H
> > + 
> > ++#include <sys/types.h>
> > + #include <sys/queue.h>
> > + #include "flash.h"
> > + #include "globals.h"
> > +-- 
> > +1.9.3
> > +
> > diff --git a/package/swupdate/swupdate.config 
> > b/package/swupdate/swupdate.config
> > new file mode 100644
> > index 0000000..cb75998
> > --- /dev/null
> > +++ b/package/swupdate/swupdate.config
> > @@ -0,0 +1,82 @@
> [snip]
> > +CONFIG_UBOOT=y
> > +CONFIG_UBOOT_FWENV="/etc/fw_env.config"
> 
>  Does it still work correctly if fw_env.config is not installed on 
> the target?
> Probably not... So I think this should be mentioned in the help text.

I have not tested this.

> > diff --git a/package/swupdate/swupdate.mk 
> > b/package/swupdate/swupdate.mk
> > new file mode 100644
> > index 0000000..c78092a
> > --- /dev/null
> > +++ b/package/swupdate/swupdate.mk
> > @@ -0,0 +1,62 @@
> > +##################################################################
> > ##############
> > +#
> > +# swupdate
> > +#
> > +##################################################################
> > ##############
> > +
> > +# Choose latest commit instead of release 2014.07 for getting bug 
> > fixes and
> > +# image downloading feature
> 
>  This type of comment should be in the commit message, not in the 
> .mk file.

Ok

> > +SWUPDATE_VERSION = 8f59c21a07a99b94b53ab9ae3579cd2014b3cedc
> > +SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
> > +SWUPDATE_LICENSE = GPLv2+
> > +SWUPDATE_LICENSE_FILES = COPYING
> > +
> > +# swupdate bundles its own mongoose and lsqlite3 versions
> > +SWUPDATE_DEPENDENCIES = libconfig libcurl lua mtd openssl zlib
> > +
> > +SWUPDATE_BUILD_CONFIG = $(SWUPDATE_DIR)/.config
> 
>  In linux.mk we directly use $(@D)/.config, which is IMHO clearer 
> than adding an
> extra variable.

Ok

> > +SWUPDATE_KCONFIG_FILE = $(call 
> > qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
> > +SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig
> 
>  No nconfig?

No nconfig.

> > +SWUPDATE_CFLAGS = $(TARGET_CFLAGS)
> > +SWUPDATE_LDFLAGS = $(TARGET_LDFLAGS)
> > +SWUPDATE_LDLIBS =
> 
>  These are redundant, just use the appropriate variables directly 
> below.

Ok

> > +
> > +# If we're using static libs do the same for swupdate
> 
>  This comment is redundant.

Ok

> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +define SWUPDATE_PREFER_STATIC
> > +   $(call 
> > KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(SWUPDATE_BUILD_CONFIG))
> > +endef
> > +endif
> > +
> > +define SWUPDATE_BUILD_OPTIONS
> 
>  Better name would be _SET_BUILD_OPTIONS.

Ok

> > +   $(call 
> > KCONFIG_SET_OPT,CONFIG_CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)", \
> > +           $(SWUPDATE_BUILD_CONFIG))
> > +   $(call KCONFIG_SET_OPT,CONFIG_SYSROOT,"$(SYSROOT_DIR)", \
> 
>  SYSROOT_DIR doesn't exist, you probably meant STAGING_DIR.

Correct.

> > +           $(SWUPDATE_BUILD_CONFIG))
> > +   $(call 
> > KCONFIG_SET_OPT,CONFIG_EXTRA_CFLAGS,"$(SWUPDATE_CFLAGS)", \
> > +           $(SWUPDATE_BUILD_CONFIG))
> > +   $(call 
> > KCONFIG_SET_OPT,CONFIG_EXTRA_LDFLAGS,"$(SWUPDATE_LDFLAGS)", \
> > +           $(SWUPDATE_BUILD_CONFIG))
> > +   $(call 
> > KCONFIG_SET_OPT,CONFIG_EXTRA_LDLIBS,"$(SWUPDATE_LDLIBS)", \
> > +           $(SWUPDATE_BUILD_CONFIG))
> > +endef
> > +
> > +define SWUPDATE_KCONFIG_FIXUP_CMDS
> > +   $(SWUPDATE_PREFER_STATIC)
> > +   $(SWUPDATE_BUILD_OPTIONS)
> > +endef
> > +
> > +define SWUPDATE_BUILD_CMDS
> > +   $(MAKE) -C $(@D)
> 
>  You should at least pass $(TARGET_MAKE_ENV) as well.

Ok

Many thanks for reviewing!
