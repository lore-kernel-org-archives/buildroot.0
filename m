From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 23:51:09 +0100
Subject: [Buildroot] [PATCH 2/2] Add HW decoding support for Hantro x170
In-Reply-To: <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
References: <1360016773-8691-1-git-send-email-alexandre.belloni@piout.net>
 <1360016773-8691-2-git-send-email-alexandre.belloni@piout.net>
Message-ID: <20130204235109.5d1b85f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Mon,  4 Feb 2013 23:26:13 +0100, Alexandre Belloni wrote:
> --- /dev/null
> +++ b/package/multimedia/gst-plugin-x170/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_GST_PLUGIN_X170
> +	bool "gst-plugin-x170"
> +	depends on BR2_PACKAGE_GSTREAMER

A "depends on BR2_arm" should be added here. We generally try to hide
such architecture-specific packages when they really don't make sense.
Of course, technically speaking, it should only appear if the SoC is an
AT91 SoC that has this specific video unit, but we are not able to do
that with the existing Buildroot options. But we still try to make such
options depend on BR2_arm.

> diff --git a/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
> new file mode 100644
> index 0000000..0e14185
> --- /dev/null
> +++ b/package/multimedia/gst-plugin-x170/gst-plugin-x170.mk
> @@ -0,0 +1,11 @@

Missing comment header.

> +GST_PLUGIN_X170_VERSION=1.0
> +GST_PLUGIN_X170_SOURCE=gst-plugin-x170-$(GST_PLUGIN_X170_VERSION).tar.gz
> +GST_PLUGIN_X170_SITE=ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/

Spaces before and after the equal sign.

<foo>_SOURCE line not beeded since it's the default value.

> +
> +GST_PLUGIN_X170_AUTORECONF = YES
> +GST_PLUGIN_X170_AUTORECONF_OPT = -Im4/

Please add a justification here in a short comment before the
_AUTORECONF option to explain why it's needed. Normally, it's not
needed for tarballs when no patches are applied, so we try to give a
short justification through a comment.

> +GST_PLUGIN_X170_DEPENDENCIES = gstreamer libglib2 on2-8170-libs
> +
> +GST_PLUGIN_X170_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include -I$(STAGING_DIR)/usr/include/gstreamer-0.10 -I$(STAGING_DIR)/usr/include/libxml2/"

Isn't the configure script capable it detecting those libraries? What
fails if you don't add all those -I values?

> +
> +$(eval $(autotools-package))
> diff --git a/package/multimedia/on2-8170-libs/Config.in b/package/multimedia/on2-8170-libs/Config.in
> new file mode 100644
> index 0000000..35eb628
> --- /dev/null
> +++ b/package/multimedia/on2-8170-libs/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_ON2_8170_LIBS
> +	bool "on2-8170-libs"

depends on BR2_arm.

> +	help
> +	  Libraries for Hantro X170 video decoder
> +

Link to an upstream URL. Could probably be the same as the other
package.

> diff --git a/package/multimedia/on2-8170-libs/on2-8170-libs.mk b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
> new file mode 100644
> index 0000000..edb1c5d
> --- /dev/null
> +++ b/package/multimedia/on2-8170-libs/on2-8170-libs.mk
> @@ -0,0 +1,20 @@

Comment header.

> +ON2_8170_LIBS_VERSION=1.0
> +ON2_8170_LIBS_SOURCE=on2-8170-libs-$(ON2_8170_LIBS_VERSION).tar.gz
> +ON2_8170_LIBS_SITE=ftp://ftp.linux4sam.org/pub/demo/linux4sam_1.9/codec/

Spaces before and after =. The _SOURCE value is the default, so you can
get rid of it.

> +
> +ON2_8170_LIBS_INSTALL_STAGING = YES
> +
> +define ON2_8170_LIBS_BUILD_CMDS
> +endef

If it's empty, then it's not needed. The default _BUILD_CMDS for a
generic-package is empty anyway.

> +define ON2_8170_LIBS_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/*.a $(STAGING_DIR)/usr/lib
> +	$(INSTALL) -D -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include
> +	$(INSTALL) -D -m 0755 $(@D)/*.so $(STAGING_DIR)/usr/lib
> +endef
> +
> +define ON2_8170_LIBS_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/*.so $(TARGET_DIR)/usr/lib
> +endef

If you use -D, then you must path a complete path as a second argument.
Otherwise, if the destination directory doesn't exist, then your file
will be copied as the directory name. I.e, you "libblabla.so" would be
a file named "lib" under the usr/ directory.

If we want to do a wildcard-based copy of files, I don't think install
plays really well. We generally do a 'cp' instead in this case, but
maybe others could comment on this specific point.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
