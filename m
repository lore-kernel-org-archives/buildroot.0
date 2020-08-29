From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Aug 2020 00:12:38 +0200
Subject: [Buildroot] [PATCH 1/4] meson-tools: new Package
In-Reply-To: <20200717164643.4702-1-daggs@gmx.com>
References: <20200717164643.4702-1-daggs@gmx.com>
Message-ID: <20200830001238.1ca793de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Jul 2020 19:46:40 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> add meson-tools for handling of amlogic boards boot firmware signatures
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

Thanks, I have applied your patch to our next branch, with a few
changes.

First, the commit title was changed to:

	package/meson-tools: new package

> diff --git a/package/meson-tools/meson-tools.hash b/package/meson-tools/meson-tools.hash
> new file mode 100644
> index 0000000000..f10f5d8590
> --- /dev/null
> +++ b/package/meson-tools/meson-tools.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	10d707b2f741df03ff5000f2a82c6f577036ce1cd34d9278b22b92cb616b6fce	meson-tools-0a02e2d34413f4bf9b15946352bc8c8ee13a5843.tar.gz

I've added the hash of the license file here, and use 2 spaces as a
separator, which is our convention.

> diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
> new file mode 100644
> index 0000000000..7fe115c6dd
> --- /dev/null
> +++ b/package/meson-tools/meson-tools.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# meson-tools
> +#
> +################################################################################
> +
> +HOST_MESON_TOOLS_VERSION = 0a02e2d34413f4bf9b15946352bc8c8ee13a5843
> +HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
> +HOST_MESON_TOOLS_LICENSE = GPL-2.0+
> +HOST_MESON_TOOLS_LICENSE_FILES = COPYING README.md

I've dropped README.md here, it doesn't contain any license details.

> +HOST_MESON_TOOLS_DEPENDENCIES = host-openssl
> +
> +HOST_MESON_TOOLS_PROGS = amlbootsig unamlbootsig amlinfo
> +
> +define HOST_MESON_TOOLS_BUILD_CMDS
> +	$(MAKE) -C $(@D) CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS) -lssl -lcrypto"

I've used $(HOST_CONFIGURE_OPTS) here instead of passing CC/CFLAGS
manually.

As said: applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
