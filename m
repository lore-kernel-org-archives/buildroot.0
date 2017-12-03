From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 14:23:48 +0100
Subject: [Buildroot] [PATCH 1/8] meson-tools: New Package
In-Reply-To: <20171203125619.30919-1-daggs@gmx.com>
References: <20171203125619.30919-1-daggs@gmx.com>
Message-ID: <20171203142348.1766c013@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this patch series!

On Sun,  3 Dec 2017 14:56:12 +0200, Dagg Stompler wrote:
> all amlogic's meson based soc require a signed firmware to boot, this
> package provides a binary to do so.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

I was confused originally when reading this patch, because I thought
you were talking about the Meson build system (http://mesonbuild.com/)
and not the Meson family of SoC (http://linux-meson.com/doku.php).

Minor nit on the commit title, I prefer lower-case "new" rather than
you. For your other commits in the same series, please drop the leading
"." in the commit titles.


> diff --git a/package/meson-tools/0001-support_crosscompile.patch b/package/meson-tools/0001-support_crosscompile.patch
> new file mode 100644
> index 0000000000..ef937f78ab
> --- /dev/null
> +++ b/package/meson-tools/0001-support_crosscompile.patch

We want this to be a Git formatted patch (i.e generated with git
format-patch), to have a description and Signed-off-by. Note that those
requirements for package patches are detailed in the Buildroot
documentation.

> diff --git a/package/meson-tools/Config.in.host b/package/meson-tools/Config.in.host
> new file mode 100644
> index 0000000000..d97a14ac41
> --- /dev/null
> +++ b/package/meson-tools/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_MESON_TOOLS
> +	bool "host meson tools"

bool "host meson-tools" instead.

> +	help
> +	  meson-tools is a collection of tools for use with
> +	  the Amlogic Meson family of ARM based SoCs.
> +	  it allows managment of signatures which are required

"It allows the management of..."

> +	  for booting amlogic based boards with u-boot.
> +
> +	  https://github.com/afaerber/meson-tools
> diff --git a/package/meson-tools/meson-tools.hash b/package/meson-tools/meson-tools.hash
> new file mode 100644
> index 0000000000..b5f844ab58
> --- /dev/null
> +++ b/package/meson-tools/meson-tools.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256	5a956f5a6ff8c45fc79d649982287c4548a1df4f0ef9e5aa6584493d552a54a3	meson-tools-5e01cbadc6f6f21ad88a63492a83182fc4b19d37.tar.gz
> diff --git a/package/meson-tools/meson-tools.mk b/package/meson-tools/meson-tools.mk
> new file mode 100644
> index 0000000000..19f5bf543b
> --- /dev/null
> +++ b/package/meson-tools/meson-tools.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# meson-tools
> +#
> +################################################################################
> +
> +HOST_MESON_TOOLS_VERSION = 5e01cbadc6f6f21ad88a63492a83182fc4b19d37
> +HOST_MESON_TOOLS_SITE = $(call github,afaerber,meson-tools,$(HOST_MESON_TOOLS_VERSION))
> +HOST_MESON_TOOLS_LICENSE = GPL-2.0+
> +HOST_MESON_TOOLS_LICENSE_FILES = COPYING README.md
> +HOST_MESON_TOOLS_DEPENDENCIES += host-openssl

= instead of +=.

> +
> +HOST_MESON_TOOLS_MAKE_OPTS = CC="$(HOSTCC)" \
> +        CFLAGS="$(HOST_CFLAGS)" \
> +        LDFLAGS="$(HOST_LDFLAGS)"

Can you try passing $(HOST_CONFIGURE_OPTS) instead ?

> +
> +define HOST_MESON_TOOLS_BUILD_CMDS
> +        $(MAKE) -C $(@D) $(HOST_MESON_TOOLS_MAKE_OPTS)
> +endef
> +
> +define HOST_MESON_TOOLS_INSTALL_BIN
> +	$(INSTALL) -m 0755 $(@D)/$(1) $(HOST_DIR)/bin
> +endef
> +
> +define HOST_MESON_TOOLS_INSTALL_CMDS
> +	$(call HOST_MESON_TOOLS_INSTALL_BIN,amlbootsig)
> +	$(call HOST_MESON_TOOLS_INSTALL_BIN,unamlbootsig)
> +	$(call HOST_MESON_TOOLS_INSTALL_BIN,amlinfo)

Better:

HOST_MESON_TOOLS_PROGS = amlbootsig unamlbootsig amlinfo

define HOST_MESON_TOOLS_INSTALL_CMDS
	$(foreach f,$(HOST_MESON_TOOLS_PROGS),
		$(INSTALL) -D -m 0755 $(@D)/$(f) $(HOST_DIR)/bin/$(f)
	)
endef

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
