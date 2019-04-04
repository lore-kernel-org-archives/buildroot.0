From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 21:42:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkgconf: add host link to
 pkg-config
In-Reply-To: <20190404192413.10205-2-stuart.summers@intel.com>
References: <20190404192413.10205-1-stuart.summers@intel.com>
 <20190404192413.10205-2-stuart.summers@intel.com>
Message-ID: <20190404214227.014dc818@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stuart,

Thanks for the patch.

On Thu,  4 Apr 2019 12:24:13 -0700
Stuart Summers <stuart.summers@intel.com> wrote:

> A patch was added to the Linux kernel in 5.1.0-rc3 which
> adds a requirement that the host build environment include
> pkg-config. Since pkg-config was deprecated in buildroot,
> add a link in the host directory to /usr/bin/pkg-config.

pkg-config is definitely not deprecated at all, and Buildroot's pkgconf
package is already installing it as $(HOST_DIR)/usr/bin/pkg-config:

define HOST_PKGCONF_INSTALL_WRAPPER
        $(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
                $(HOST_DIR)/bin/pkg-config

However, the wrapper assumes by default we are building for the target,
and therefore returns results valid for cross-compilation. To return
results valid for native build, the following environment variables
need to be passed:

        PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
        PKG_CONFIG_SYSROOT_DIR="/" \
        PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
        PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 \
        PKG_CONFIG_LIBDIR="$(HOST_DIR)/lib/pkgconfig:$(HOST_DIR)/share/pkgconfig"

> Also add a new config option to enforce building host-pkgconf
> before building the Linux kernel.

Do we need a new option ? If pkg-config is only used by Linux to detect
libelf, what about just adding host-pkgconf to LINUX_DEPENDENCIES when
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF is enabled ?

> +define HOST_PKGCONF_LINK_PKGCONFIG
> +	ln -sf pkgconf $(HOST_DIR)/usr/bin/pkg-config
> +endef

This is definitely wrong and will break the wrapper we install.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
