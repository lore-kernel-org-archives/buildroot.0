From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:20:09 +0200
Subject: [Buildroot] [PATCH 1/1] tstools: new package
In-Reply-To: <1374324739-15242-1-git-send-email-tjlee@ambarella.com>
References: <1374324739-15242-1-git-send-email-tjlee@ambarella.com>
Message-ID: <20130727162009.7651acd5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tzu-Jung Lee,

I've committed your patch, after making a fairly significant number of
changes to it. See below my comments, that should be useful for your
next submissions.

On Sat, 20 Jul 2013 20:52:19 +0800, Tzu-Jung Lee wrote:
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
> ---
>  package/multimedia/Config.in                       |  1 +
>  package/multimedia/tstools/Config.in               | 17 +++++++++
>  ...tools-1_11-build-get-along-with-buildroot.patch | 40 ++++++++++++++++++++++
>  package/multimedia/tstools/tstools.mk              | 27 +++++++++++++++

Peter now prefers to have all packages directly under package/, so I've
moved tstools there as well.

> diff --git a/package/multimedia/tstools/Config.in b/package/multimedia/tstools/Config.in
> new file mode 100644
> index 0000000..4f99aea
> --- /dev/null
> +++ b/package/multimedia/tstools/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_TSTOOLS
> +	bool "tstools"

tstools wasn't building properly without largefile support, so I had to
add a BR2_LARGEFILE dependency here.

> +	help
> +

This empty line shouldn't be there.

> +	This is a set of cross-platform command line tools for
> +	working with MPEG data
> +
> +	The emphasis is on relatively simple tools which concentrate
> +	on MPEG (H.264 and H.262) data packaged according to H.222
> +	(i.e., TS or PS), with a particular interest in checking
> +	for conformance.
> +
> +	Transport Stream (TS) is typically used for distribution of
> +	cable and satellite data. Program Stream (PS) is typically
> +	used to store data on DVDs.
> +
> +	http://tstools.berlios.de/

The help text should be intended by one tab + two spaces.

> diff --git a/package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch b/package/multimedia/tstools/tstools-1_11-build-get-along-with-buildroot.patch

Patches shouldn't contain the version of the package in their name.

> diff --git a/package/multimedia/tstools/tstools.mk b/package/multimedia/tstools/tstools.mk
> new file mode 100644
> index 0000000..0ff7d26
> --- /dev/null
> +++ b/package/multimedia/tstools/tstools.mk
> @@ -0,0 +1,27 @@
> +#############################################################
> +#
> +# tstools
> +#
> +#############################################################

80 # are needed nowadays.

> +
> +TSTOOLS_VERSION		= 1_11
> +TSTOOLS_SITE		= https://tstools.googlecode.com/files/
> +TSTOOLS_SOURCE		= tstools-$(TSTOOLS_VERSION).tgz

Spacing should be done with spaces and not tabs.

> +TSTOOLS_DEPENDENCIES	= libpcap

I've tested the build, and libpcap was apparently not needed. Didn't
you confuse that with some pcap.c/pcap.h source files?

> +TSTOOLS_INSTALL_STAGING	= NO
> +TSTOOLS_INSTALL_IMAGES	= NO
> +TSTOOLS_INSTALL_TARGET	= YES

Not needed, that's the default.

TSTOOLS_LICENSE was missing.

> +
> +define TSTOOLS_INSTALL_TARGET_CMDS
> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef

Indentation should be done with one tab, and the build command should
be before the install command.

> +
> +define TSTOOLS_BUILD_CMDS
> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define TSTOOLS_CLEAN_CMDS
> +  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
> +endef

I've removed the clean command, since we're considering getting rid of
it, and most of our packages do not implement it anyway.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
