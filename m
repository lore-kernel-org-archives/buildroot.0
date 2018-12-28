From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 14:25:50 +0100
Subject: [Buildroot] [PATCH] package/cargo: pass appropriate library path to
 the linker
Message-ID: <20181228132551.29819-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When linking the host cargo binary, the linker should be told to find
libraries in $(HOST_DIR)/lib, otherwise it will not work libraries
such as libhttp_parser. This was found with per-package directory
support, where the build failed with:

  = note: /usr/bin/ld: cannot find -lhttp_parser
          collect2: error: ld returned 1 exit status

In order to fix this, instead of passing -L$(HOST_DIR)/lib during the
build of Cargo, we make sure all flags in $(HOST_LDFLAGS) are passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cargo/cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cargo/cargo.mk b/package/cargo/cargo.mk
index 1b1053ba41..a387281b4c 100644
--- a/package/cargo/cargo.mk
+++ b/package/cargo/cargo.mk
@@ -70,7 +70,7 @@ HOST_CARGO_SNAP_OPTS = \
 	$(if $(VERBOSE),--verbose)
 
 HOST_CARGO_ENV = \
-	RUSTFLAGS="-Clink-arg=-Wl,-rpath,$(HOST_DIR)/lib" \
+	RUSTFLAGS="$(addprefix -Clink-arg=,$(HOST_LDFLAGS))" \
 	CARGO_HOME=$(HOST_CARGO_HOME)
 
 define HOST_CARGO_BUILD_CMDS
-- 
2.20.1
