From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Apr 2019 23:28:25 +0200
Subject: [Buildroot] [PATCH] package/civetweb: fix link failure due to
 missing OpenSSL dependency
In-Reply-To: <20190409211032.66320-1-giulio.benetti@micronovasrl.com>
References: <20190409211032.66320-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190409232825.2cdb0766@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Apr 2019 23:10:32 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> During linking one OpenSSL dependecy is missing(-latomic) on linking
> library list.
> 
> - Substitute explicit library list with `pkg-config libssl` when
> BR2_PACKAGE_OPENSSL is enabled. In such way all needed libraries will be
> included in linking list.
> - Add also `host-pkgconf` to CIVETWEB_DEPENDENCIES if
> BR2_PACKAGE_OPENSSL is enabled to make it available for previous point.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b2e/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Applied to master, with one small change, see below.

> +CIVETWEB_LIBS += `$(HOST_DIR)/usr/bin/pkg-config --libs libssl`

$(HOST_DIR)/usr no longer really exists, it's a symlink to $(HOST_DIR),
so this path should have been just $(HOST_DIR)/bin/pkg-config.

However, pkgconf.mk precisely provides the PKG_CONFIG_HOST_BINARY
variable, which contains exactly the path to pkg-config. So I've used
that instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
