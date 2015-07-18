From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 14:46:37 +0200
Subject: [Buildroot] [PATCH v9 04/15] busybox: applets as individual
 binaries
In-Reply-To: <1436905227-26937-5-git-send-email-clayton.shotwell@rockwellcollins.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-5-git-send-email-clayton.shotwell@rockwellcollins.com>
Message-ID: <20150718144637.22cee806@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Clayton Shotwell,

On Tue, 14 Jul 2015 15:20:16 -0500, Clayton Shotwell wrote:

> diff --git a/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch b/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch
> new file mode 100644
> index 0000000..ae0e654
> --- /dev/null
> +++ b/package/busybox/0002-applets-Add-installation-of-individual-binaries.patch
> @@ -0,0 +1,103 @@
> +From 3451b55054a6fe2073a21301938802a27dec835d Mon Sep 17 00:00:00 2001
> +From: Clayton Shotwell <clshotwe@rockwellcollins.com>
> +Date: Mon, 16 Dec 2013 14:45:33 -0600
> +Subject: [PATCH 5/5] applets: Add installation of individual binaries

This PATCH 5/5 is not desirable, use git format-patch -N when
generating patches. Also, now that the patch is upstream, maybe you
could backport the upstream patch, with has Denys Signed-off-by, and
add an indication that the patch is upstream.

(Note: I would have done all that myself, but I have some other
comments below)

> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 6b2abca..4942e75 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -50,9 +50,37 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
>  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
>  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
>  
> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_PERMISSIONS
> +	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
> +endef
> +
> +# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE. The
> +# permissions are pulled from the applets.h file that is generated during
> +# the build and used to determine all of the possible applets. The permissions
> +# file is generated and added to the list of device tables used by makedevs to
> +# set file permissions.
> +define BUSYBOX_MAKEDEV_PERMISSIONS
> +	if [ -f $(@D)/.buildroot_permissions ]; then \
> +		rm $(@D)/.buildroot_permissions; \
> +	fi; \
> +	touch $(@D)/.buildroot_permissions; \
> +	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
> +			| sed -e 's/,.*//' -e 's/.*(//'`; \
> +	do \
> +		temp=`grep -w $${app} $(@D)/busybox.links`; \
> +		if [ -n "$${temp}" ]; then \
> +			echo "$${temp} f 4755 0  0 - - - - -" >> $(@D)/.buildroot_permissions; \
> +		fi; \
> +	done
> +endef
> +BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_MAKEDEV_PERMISSIONS
> +BR2_ROOTFS_DEVICE_TABLE += $(BUSYBOX_DIR)/.buildroot_permissions
> +else

I'm sorry but I don't like this. I don't think any Buildroot package
*modifies* a BR2_<something> option, that's really a hack. I think the
only reasonable solution is to have a real permission table, containing
the list of all applets that may need SUID root. However, I don't
remember if we error out when a file mentioned in a permission table
does not exist. I've added Yann in Cc to discuss that further. Maybe we
need a special syntax in the permission table to say "change the
permission of this file if it exists, otherwise ignore".

> +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> +define BUSYBOX_CONFIGURE_INDIVIDUAL_BINARIES
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_BUILD_LIBBUSYBOX,$(BUSYBOX_BUILD_CONFIG))
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_INDIVIDUAL,$(BUSYBOX_BUILD_CONFIG))
> +endef
> +
> +define BUSYBOX_INSTALL_INDIVIDUAL_BINARIES
> +	rm -f $(TARGET_DIR)/bin/busybox
> +endef

This is not really installing individual binaries, but removing the
main Busybox binary. Could you rename the macro accordingly?

Long term, it'd be nicer if the Busybox build system itself would not
install bin/busybox when individual binaries are selected.

Could you work on the above issues? Really, only the permission table
one is annoying, the rest is trivial.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
