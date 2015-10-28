From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Oct 2015 01:57:58 +0100
Subject: [Buildroot] [PATCH 1/1] v4l2grab: new package
In-Reply-To: <1445947618-8569-1-git-send-email-sv99@inbox.ru>
References: <1445947618-8569-1-git-send-email-sv99@inbox.ru>
Message-ID: <20151028015758.4bd2ff3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Viacheslav Volkov,

Thanks for your contribution! See a few comments below.

> diff --git a/package/v4l2grab/Config.in b/package/v4l2grab/Config.in
> new file mode 100644
> index 0000000..1e1fbfc
> --- /dev/null
> +++ b/package/v4l2grab/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_V4L2GRAB
> +	bool "v4l2grab"
> +	select BR2_PACKAGE_JPEG
> +    select BR2_PACKAGE_LIBV4L

Indentation is wrong here, it should be one tab.

Also, when you "select" a package, you need to duplicate the "depends
on" of that package to your package. If you look at
package/libv4l/Config.in, you will see:

        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on BR2_USE_MMU # fork()
        depends on !BR2_STATIC_LIBS # dlopen()
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # media headers
        # wait for libv4l 1.7+ for musl compatibility
        depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC

You need to replicate all of these, and add a Config.in comment about
such dependencies.

Speaking of libv4l, there is already a built-in libv4l2grab tool. Isn't
it the same as the tool you're proposing to package separately ?

> +	help
> +	    Utility for grabbing JPEGs form V4L2 devices.
> +		
> +		http://www.twam.info/software/v4l2grab-grabbing-jpegs-from-v4l2-devices

Indentation for help text should be one tab + two spaces.

> diff --git a/package/v4l2grab/v4l2grab.mk b/package/v4l2grab/v4l2grab.mk
> new file mode 100644
> index 0000000..935bc8e
> --- /dev/null
> +++ b/package/v4l2grab/v4l2grab.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# v4l2grab
> +#
> +#############################################################

80 hash signs are needed.

> +V4L2GRAB_VERSION = c5fec16df732185de5ba6d73c13790570551d7a6
> +V4L2GRAB_SITE = $(call github,twam,v4l2grab,$(V4L2GRAB_VERSION))
> +V4L2GRAB_INSTALL_TARGET = YES

Not needed, that's the default.

> +V4L2GRAB_AUTORECONF = YES

Please add a comment above this to explain why. It can simply:

# Fetched from github, no pre-generated configure script provided

> +V4L2GRAB_DEPENDENCIES = libjpeg libv4l
> +
> +define V4L2GRAB_INSTALL_TARGET_CMDS
> +
> +	mkdir -p $(TARGET_DIR)/usr/bin
> +	$(INSTALL) -m 0755 $(@D)/v4l2grab $(TARGET_DIR)/usr/bin
> +endef

Not needed, just use the standard "make install", which will
automatically be invoked by the autotools-package infra if you don't
override the <pkg>_INSTALL_TARGET_CMDS variable.

> +define V4L2GRAB_UNINSTALL_TARGET_CMDS
> +	rm -f $(TARGET_DIR)/usr/bin/v4l2grab
> +endef

Not needed. There is in fact no such thing as
<pkg>_UNINSTALL_TARGET_CMDS in Buildroot.

Could you rework the patch to take into account those comments, and
repost an updated version, of course after checking that the v4l2grab
utility from libv4l is not in fact the same tool?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
