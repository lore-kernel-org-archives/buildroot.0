From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Fri, 08 Mar 2013 22:08:48 +0100
Subject: [Buildroot] moving package divine from autotools-package to
	generic-package
Message-ID: <513A5360.8080707@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

we want to try ilixi [1] on a SetTopBox.
To be able to use it I have to solve the dependency on directfb 1.6.3,
that was not a big problem. So for now I'm not knowing if we can use the
input driver for raw input via a virtual input device that's provided by
DiVine [2]. So thought I bumping the package also to 1.6.3, that was
also easy.

But, the archive on directfb.org is broken, inside the archive in the
lib/ directory the Header idivine.h is missing. Inside the Git Repo
everything is fine. I wrote up the maintainer and describe the issue but
until now no response from there.
So I tried to change package divine from a autotools-package to a
generic package because the Git Repo just shipped a file autogen.sh for
package preparation.

The build works so far but I'm not very familiar with the voodoo of the
generic-package mechanism. So I want to ask if you can please take a
look at my work before go further and prepare a patch.

This is the file package/divine/divine.mk looks like now.

> #############################################################
> #
> # divine
> #
> #############################################################
> 
> # tagged version 1.6.3
> DIVINE_VERSION = 83cafc257a42b9465cd9d6185bf66b8c1b7ed704
> DIVINE_SITE = git://git.directfb.org/git/directfb/extras/DiVine.git
> DIVINE_LICENSE = LGPLv2.1+
> DIVINE_LICENSE_FILE = COPYING
> DIVINE_INSTALL_STAGING = YES
> DIVINE_DEPENDENCIES = directfb
> DIVINE_CONFIG_SCRIPTS = divine-config
> 
> DIVINE_CONF_OPTS = $(TARGET_CONFIGURE_OPTS) \
>                    $(TARGET_CONFIGURE_ARGS) \
>                    --target=$(GNU_TARGET_NAME) \
>                    --host=$(GNU_TARGET_NAME) \
>                    --prefix="$(HOST_DIR)/usr"
> 
> define DIVINE_CONFIGURE_CMDS
> 	(cd $(@D) && \
>           ACLOCAL_FLAGS="-I $(ACLOCAL_DIR)" \
>           PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
>           ./autogen.sh $(DIVINE_CONF_OPTS))
> endef
> 
> define DIVINE_BUILD_CMDS
> 	$(MAKE) -C $(@D)
> endef
> 
> define DIVINE_INSTALL_STAGING_CMDS
> 	DESTDIR=$(STAGING_DIR)/usr $(MAKE) -C $(@D) install
> endef
> 
> define DIVINE_INSTALL_TARGET_CMDS
> 	DESTDIR=$(TARGET_DIR)/usr $(MAKE) -C $(@D) install
> endef
> 
> $(eval $(generic-package))
> $(eval $(host-generic-package))

I think the --prefix option can be left, the destdir is given by the
install commands.
Are the directory all correct or is there something more improvable?
The call of the two macros at the end is needed as far as I understand.

I tested the build only for my ARM based SetTopBox, maybe other
platforms need enhancements.

Thanks for feedback!
Regards
Carsten

[1] http://www.ilixi.org/
[2] http://directfb.org/downloads/Extras/README.DiVine
