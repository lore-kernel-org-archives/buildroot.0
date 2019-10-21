From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 23:36:02 +0200
Subject: [Buildroot] [PATCH] package/sunwait: new package
In-Reply-To: <20191011213219.27955-1-angelo@amarulasolutions.com>
References: <20191011213219.27955-1-angelo@amarulasolutions.com>
Message-ID: <20191021233602.67d63aaf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Oct 2019 23:32:19 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> diff --git a/package/sunwait/Config.in b/package/sunwait/Config.in
> new file mode 100644
> index 0000000000..ea0ec171cb
> --- /dev/null
> +++ b/package/sunwait/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_SUNWAIT
> +	bool "sunwait"

This packages uses C++, so I've added a BR2_INSTALL_LIBSTDCPP dependency.

> +	help
> +	  Sunwait calculates sunrise or sunset times with civil,
> +	  nautical, astronomical and custom twilights.
> +
> +	  https://github.com/risacher/sunwait
> diff --git a/package/sunwait/sunwait.hash b/package/sunwait/sunwait.hash
> new file mode 100644
> index 0000000000..8396fa27dd
> --- /dev/null
> +++ b/package/sunwait/sunwait.hash
> @@ -0,0 +1,3 @@
> +# sha256 locally computed
> +sha256  ef26ed05882d5286a64a37c4044f99b877cc54f58a46f0e37ca60c93398df910  sunwait-7326b53e5406c7ebd552ae6dc0fc659252a18e7f.tar.gz
> +sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
> diff --git a/package/sunwait/sunwait.mk b/package/sunwait/sunwait.mk
> new file mode 100644
> index 0000000000..4ed9338ea6
> --- /dev/null
> +++ b/package/sunwait/sunwait.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# sunwait
> +#
> +################################################################################
> +
> +SUNWAIT_VERSION = 7326b53e5406c7ebd552ae6dc0fc659252a18e7f
> +SUNWAIT_SITE = $(call github,risacher,sunwait,$(SUNWAIT_VERSION))
> +SUNWAIT_LICENSE = GPL-3.0
> +SUNWAIT_LICENSE_FILES = LICENSE
> +
> +define SUNWAIT_BUILD_CMDS
> +	$(MAKE) C=$(TARGET_CC) -C $(@D) all

I've improved this a bit to pass proper CFLAGS and LDFLAGS, and to use
CXX to build, since it's using C++ headers and was linking with -lstdc++.

> +endef
> +
> +define SUNWAIT_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/sunwait $(TARGET_DIR)/usr/bin/

Changed to use a full destination path.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
