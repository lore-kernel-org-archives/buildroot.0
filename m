From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Feb 2014 23:56:46 +0100
Subject: [Buildroot] [PATCH] zlog: new package
In-Reply-To: <1390461447-17521-1-git-send-email-yegorslists@googlemail.com>
References: <1390461447-17521-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20140227235646.45e3ea5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

Sorry for the long delay before reviewing this. I believe it's almost
ready, just a couple of comments below.

On Thu, 23 Jan 2014 08:17:27 +0100, yegorslists at googlemail.com wrote:

> diff --git a/package/zlog/Config.in b/package/zlog/Config.in
> new file mode 100644
> index 0000000..478b2f8
> --- /dev/null
> +++ b/package/zlog/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_ZLOG
> +	bool "zlog"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

From my testing you also need:

	depends on !BR2_PREFER_STATIC_LIB

because zlog only produces a shared library.

> +	help
> +	  zlog is a reliable, high-performance, thread safe, flexible,
> +	  clear-model, pure C logging library.
> +
> +	  https://github.com/HardySimpson/zlog
> +
> +comment "zlog needs a toolchain w/ threads, largefile"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE

This needs to be updated to take into account the !static lib
dependency.


> +ZLOG_VERSION = ca6162be1608839e99c6388c28488c51ccf98e4a
> +ZLOG_SITE = $(call github,HardySimpson,zlog,$(ZLOG_VERSION))
> +ZLOG_LICENSE = GPLv2.1

The license is LGPLv2.1.

> +ZLOG_LICENSE_FILES = COPYING
> +ZLOG_INSTALL_STAGING = YES
> +
> +define ZLOG_BUILD_CMDS
> +	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> +		-C $(@D) all
> +endef
> +
> +define ZLOG_INSTALL_STAGING_CMDS
> +	$(MAKE) PREFIX=$(STAGING_DIR)/usr INCLUDE_PATH=include LIBRARY_PATH=lib  -C $(@D) install
> +endef
> +
> +define ZLOG_INSTALL_TARGET_CMDS
> +	$(MAKE) PREFIX=$(TARGET_DIR)/usr INCLUDE_PATH=include LIBRARY_PATH=lib -C $(@D) install
> +endef

Why do you pass INCLUDE_PATH=include and LIBRARY_PATH=lib ? Looking at
the makefile of zlog, these seem to be the default values.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
