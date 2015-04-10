From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 22:16:18 +0200
Subject: [Buildroot] [PATCH 1/1] libfreeimage: new package
In-Reply-To: <1428652195-7775-1-git-send-email-remi.rerolle@gmail.com>
References: <1428652195-7775-1-git-send-email-remi.rerolle@gmail.com>
Message-ID: <20150410221618.3ae365e4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear R?mi R?rolle,

On Fri, 10 Apr 2015 09:49:55 +0200, R?mi R?rolle wrote:
> FreeImage is an Open Source library project for developers who would like to
> support popular graphics image formats like PNG, BMP, JPEG, TIFF and others as
> needed by today's multimedia applications.
> 
> See: http://freeimage.sourceforge.net
> 
> Signed-off-by: R?mi R?rolle <remi.rerolle@gmail.com>

Thanks for this patch! It's almost good, there are only a few minor
things to fix. See below.

> diff --git a/package/libfreeimage/0001-no-root-install.patch b/package/libfreeimage/0001-no-root-install.patch
> new file mode 100644
> index 0000000..5c3ee71
> --- /dev/null
> +++ b/package/libfreeimage/0001-no-root-install.patch

All patches need a description and Signed-off-by line. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

Also, can you submit this patch upstream?

> diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
> new file mode 100644
> index 0000000..82ad4e2
> --- /dev/null
> +++ b/package/libfreeimage/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_LIBFREEIMAGE
> +	bool "libfreeimage"
> +	help
> +          FreeImage is an Open Source library project for developers who would
> +          like to support popular graphics image formats like PNG, BMP, JPEG,
> +          TIFF and others as needed by today's multimedia applications.

Indentation for the help text is one tab + two spaces. And also, after
an empty new line, add the upstream URL of the project. In addition,
the lines are too long, make sure to wrap at 72 columns.

See
http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file
for details.

> diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
> new file mode 100644
> index 0000000..dfaa1a5
> --- /dev/null
> +++ b/package/libfreeimage/libfreeimage.mk
> @@ -0,0 +1,37 @@
> +################################################################################
> +#
> +# libfreeimage
> +#
> +################################################################################
> +
> +LIBFREEIMAGE_VERSION = 3.17.0
> +LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
> +LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
> +LIBFREEIMAGE_LICENSE = GPLv2+
> +LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt

This is not quite correct. The license, as said on the web site is:

"FreeImage is licensed under the GNU General Public License, version
2.0 (GPLv2) or version 3.0 (GPLv3), and the FreeImage Public License
(FIPL)"

So:

LIBFREEIMAGE_LICENSE = GPLv2 or GPLv3 or FreeImage Public License
LIBFREEIMAGE_LICENSE_FILES = license-gplv2.txt license-gplv3.txt license-fi.txt

> +LIBFREEIMAGE_INSTALL_STAGING = YES
> +
> +define LIBFREEIMAGE_EXTRACT_CMDS
> +	$(UNZIP) -d $(BUILD_DIR)/libfreeimage-$(LIBFREEIMAGE_VERSION) \
> +		$(DL_DIR)/$(LIBFREEIMAGE_SOURCE)

then maybe a:

	mv $(@D)/FreeImage/* $(@D)

which will allow to use -C $(@D) instead of -C $(@D)/FreeImage below.

> +endef
> +
> +
> +define LIBFREEIMAGE_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/FreeImage \
> +		-j$(PARALLEL_JOBS) \

-j$(PARALLEL_JOBS) not needed, already taken care of by $(MAKE).

> +		CC="$(TARGET_CC)" \
> +		CXX="$(TARGET_CXX)"

Could you try to use $(TARGET_CONFIGURE_OPTS) instead? I.e:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		$(TARGET_CONFIGURE_OPTS)

> +define LIBFREEIMAGE_INSTALL_STAGING_CMDS
> +	$(MAKE) -C $(@D)/FreeImage DESTDIR=$(STAGING_DIR) install
> +endef
> +
> +define LIBFREEIMAGE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 755 -t $(TARGET_DIR)/usr/lib/ \
> +		$(STAGING_DIR)/usr/lib/libfreeimage*.so*

Why don't you use DESTDIR=$(TARGET_DIR) install here?

If you're worried about headers, static library or documentation being
installed, don't worry: Buildroot cleans up such things from the rootfs
at the very end of the build.

Could you resubmit an updated version that takes into account those
comments?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
