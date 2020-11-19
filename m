From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Nov 2020 22:36:55 +0100
Subject: [Buildroot] [PATCH next 10/12] package/sentry-cli: convert to
 host-cargo-package infrastructure
In-Reply-To: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
References: <20201119213658.1232531-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201119213658.1232531-11-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sentry-cli/sentry-cli.mk | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 7e53f16026..40ca22fdf9 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -9,24 +9,6 @@ SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
-HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
+HOST_SENTRY_CLI_DEPENDENCIES = host-zlib
 
-HOST_SENTRY_CLI_CARGO_ENV = \
-	CARGO_HOME=$(HOST_DIR)/share/cargo \
-	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
-
-HOST_SENTRY_CLI_CARGO_OPTS = \
-	--release \
-	--manifest-path=$(@D)/Cargo.toml
-
-define HOST_SENTRY_CLI_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_SENTRY_CLI_CARGO_ENV) \
-		cargo build $(HOST_SENTRY_CLI_CARGO_OPTS)
-endef
-
-define HOST_SENTRY_CLI_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/target/release/sentry-cli \
-		$(HOST_DIR)/bin/sentry-cli
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-cargo-package))
-- 
2.28.0
