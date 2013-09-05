From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Sep 2013 09:57:49 +0200
Subject: [Buildroot] [PATCH 03/17] ustr: new package
In-Reply-To: <1378336196-27403-4-git-send-email-clshotwe@rockwellcollins.com>
References: <1378336196-27403-1-git-send-email-clshotwe@rockwellcollins.com>
 <1378336196-27403-4-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <20130905095749.25465b8e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Wed, 4 Sep 2013 18:09:42 -0500, Clayton Shotwell wrote:

> diff --git a/package/ustr/ustr-1.0.4-crossCompileModifications.patch b/package/ustr/ustr-1.0.4-crossCompileModifications.patch

Patch names should not contain the version number, but instead a number
that allows patches to be applied in the right order. See
http://buildroot.org/downloads/manual/manual.html#patch-policy.

Also, while it is not written anywhere explicitly, the patch filename
should be all in lower case.

> new file mode 100644
> index 0000000..aad9b81

The patch should contain a description + Signed-off-by line. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> new file mode 100644
> index 0000000..46b8bb4
> --- /dev/null
> +++ b/package/ustr/ustr.mk
> @@ -0,0 +1,68 @@
> +#############################################################
> +#
> +# ustr
> +#
> +#############################################################

80 dashes, one empty line between header and variables.

> +USTR_VERSION = 1.0.4
> +USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
> +USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
> +USTR_LICENSE = BSD-2c MIT LGPLv2+
> +USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
> +
> +##############################
> +# Target Section
> +##############################

Comment not needed.

> +USTR_INSTALL_STAGING = YES
> +USTR_INSTALL_TARGET = YES

Last line not needed.

> +
> +USTR_MAKE_CMDS = $(TARGET_CONFIGURE_OPTS)

Use $(TARGET_CONFIGURE_OPTS) directly.

> +
> +define USTR_BUILD_CMDS
> +	$(MAKE) -C $(@D) all $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +	$(MAKE) -C $(@D) all-shared $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)

DESTDIR typically not needed when building. Also, you can probably
combine this in one line:

	$(MAKE) -C $(@D) \
		$(USTR_MAKE_CMDS) all all-shared

However, there's one thing we've forgotten: we try to support static
library builds in Buildroot, when BR2_PREFER_STATIC_LIB is enabled. So
when it's possible, it'd be great if the packages could behave nicely
when BR2_PREFER_STATIC_LIB=y (by disabling the build of shared
libraries). If it's not possible or too complicated, we can add a
depends on !BR2_PREFER_STATIC_LIB.

> +endef
> +
> +define USTR_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D) install $(USTR_MAKE_CMDS) DESTDIR=$(STAGING_DIR)
> +endef
> +
> +define USTR_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) install $(USTR_MAKE_CMDS) DESTDIR=$(TARGET_DIR)
> +endef
> +
> +define USTR_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +define USTR_UNINSTALL_STAGING_CMDS
> +	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/libustr* /usr/lib/pkgconfig/ustr* \
> +		/usr/bin/ustr* /usr/include/ustr* /usr/include/ \
> +		/usr/share/doc/ustr-$(USTR_VERSION) /usr/share/ustr-$(USTR_VERSION) \
> +		/usr/share/man/man1/ustr* /usr/share/man/man3/ustr*)
> +endef
> +
> +define USTR_UNINSTALL_TARGET_CMDS
> +	rm -rf $(addprefix $(TARGET_DIR),/usr/lib/libustr* /usr/lib/pkgconfig/ustr* \
> +		/usr/bin/ustr* /usr/include/ustr*)
> +endef

Drop the uninstall comands.

> +##############################
> +# Host Section
> +##############################
> +HOST_USTR_MAKE_CMDS = $(HOST_CONFIGURE_OPTS)
> +
> +define HOST_USTR_BUILD_CMDS
> +	$(MAKE) -C $(@D) all $(HOST_USTR_MAKE_CMDS) DESTDIR=$(HOST_DIR)
> +	$(MAKE) -C $(@D) all-shared $(HOST_USTR_MAKE_CMDS) DESTDIR=$(HOST_DIR)
> +endef

Same comments as above, for everything :)

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
