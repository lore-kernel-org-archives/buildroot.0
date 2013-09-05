From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 09:44:46 +0200
Subject: [Buildroot] [PATCH 01/17] libsepol: new package
In-Reply-To: <1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-2-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130905094446.3f139253@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 4 Sep 2013 18:09:40 -0500, Clayton Shotwell wrote:

> +menu "Security"
> +source "package/libsepol/Config.in"
> +endmenu

You're introducing this new menu directly under "Target packages",
while this package (and a few of the others you're adding) are
libraries, so they should be under "Target packages -> Libraries".

I have nothing against adding both "Target packages -> Security" and
"Target packages -> Libraries -> Security", but that would require a
quick look at the existing packages that would also fit in those new
categories.

>  menu "System tools"
>  source "package/acl/Config.in"
>  source "package/attr/Config.in"
> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> new file mode 100644
> index 0000000..feb7f39
> --- /dev/null
> +++ b/package/libsepol/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBSEPOL
> +	bool "libsepol"
> +	help
> +	  Libsepol is the binary policy manipulation library. It doesn't 
> +	  depend upon or use any of the other SELinux components.
> +	  
> +	  http://selinuxproject.org/page/Main_Page
> diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
> new file mode 100644
> index 0000000..59ca4bb
> --- /dev/null
> +++ b/package/libsepol/libsepol.mk
> @@ -0,0 +1,69 @@
> +#############################################################
> +#
> +# libsepol
> +#
> +#############################################################

Nitpick: those ### lines should have 80 dashes, and there should be one
empty line between this header and the first variables.

> +LIBSEPOL_VERSION = 2.1.9
> +LIBSEPOL_SOURCE = libsepol-$(LIBSEPOL_VERSION).tar.gz

This last line is not needed, since it's the default.

> +LIBSEPOL_SITE = http://userspace.selinuxproject.org/releases/20130423/
> +LIBSEPOL_LICENSE = LGPLv2.1

Is it really LGPLv2.1 or LGPLv2.1+ ? It's never said in the COPYING
file, you'd have to look at the copyright headers without the source
code.

> +LIBSEPOL_LICENSE_FILES = COPYING
> +
> +##############################
> +# Target Section
> +##############################

We generally don't put such delimiters.

> +LIBSEPOL_INSTALL_STAGING = YES
> +LIBSEPOL_INSTALL_TARGET = YES

This last line is not needed since it's the default.

> +LIBSEPOL_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS)

I believe this definition is useless, just use directly
$(TARGET_CONFIGURE_OPTS) where appropriate.

> +
> +define LIBSEPOL_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)

DESTDIR is most likely not needed in the build step.

> +endef
> +
> +define LIBSEPOL_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define LIBSEPOL_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) install $(LIBSEPOL_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define LIBSEPOL_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +define LIBSEPOL_UNINSTALL_STAGING_CMDS
> +	rm -rf $(addprefix $(STAGING_DIR),/usr/include/sepol /usr/bin/chkcon \
> +		/usr/lib/pkgconfig/libsepol* /lib/libsepol* /usr/lib/libsepol*)
> +	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man3/*.3)))
> +	rm -f $(addprefix $(STAGING_DIR)/usr/man/man3/,$(notdir $(wildcard $(@D)/man/man8/*.8)))
> +endef
> +
> +define LIBSEPOL_UNINSTALL_TARGET_CMDS
> +	rm -rf $(addprefix $(TARGET_DIR),/usr/bin/chkcon /usr/lib/pkgconfig/libsepol* \
> +		/lib/libsepol* /usr/lib/libsepol*)
> +endef

Don't bother implementing the uninstall commands, we are phasing them
out.

> +
> +##############################
> +# Host Section
> +##############################

Header unneeded.

> +HOST_LIBSEPOL_MAKE_CMDS = $(HOST_CONFIGURE_OPTS)

Just use $(HOST_CONFIGURE_OPTS) where needed.

> +
> +define HOST_LIBSEPOL_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(HOST_LIBSEPOL_MAKE_CMDS) DESTDIR=$(HOST_DIR)

DESTDIR generally not needed in the build step.

> +endef
> +
> +define HOST_LIBSEPOL_INSTALL_CMDS
> +	$(MAKE) -C $(@D) install $(HOST_LIBSEPOL_MAKE_CMDS) DESTDIR=$(HOST_DIR)
> +	mv $(HOST_DIR)/lib/libsepol.so.1 $(HOST_DIR)/usr/lib
> +	(cd $(HOST_DIR)/usr/lib; rm -f libsepol.so; ln -s libsepol.so.1 libsepol.so)
> +	-rmdir $(HOST_DIR)/lib

So I guess the problem here is that the library gets installed in /lib
while you wanted it in /usr/lib. It's not very pretty but maybe you can
cheat by passing DESTDIR=$(HOST_DIR)/usr.

> +endef
> +
> +define HOST_LIBSEPOL_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +$(eval $(generic-package))
> +$(eval $(host-generic-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
