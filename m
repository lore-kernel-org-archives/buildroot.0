From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Oct 2020 20:41:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: pass HOST_LDFLAGS
Message-ID: <20201004184157.1488521-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass HOST_LDFLAGS to avoid the following build failure due to missing
RPATH:

*** ERROR: package host-sentry-cli installs executables without proper RPATH:
***   /srv/storage/autobuild/run/instance-3/output-1/host/bin/sentry-cli

Fixes:
 - http://autobuild.buildroot.org/results/d52638baefec961ff693aecf833af7adfc482fe4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sentry-cli/sentry-cli.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index c4dbc5ebfd..7e53f16026 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -11,7 +11,9 @@ SENTRY_CLI_LICENSE_FILES = LICENSE
 
 HOST_SENTRY_CLI_DEPENDENCIES = host-rustc host-zlib
 
-HOST_SENTRY_CLI_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
+HOST_SENTRY_CLI_CARGO_ENV = \
+	CARGO_HOME=$(HOST_DIR)/share/cargo \
+	RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"
 
 HOST_SENTRY_CLI_CARGO_OPTS = \
 	--release \
-- 
2.28.0
