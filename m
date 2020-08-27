From: sam.voss at gmail.com <sam.voss@gmail.com>
Date: Wed, 26 Aug 2020 19:44:24 -0500
Subject: [Buildroot] [PATCH] package/ripgrep: fix build directories
Message-ID: <20200827004424.325134-1-sam.voss@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <sam.voss@gmail.com>

RIPGREP_CARGO_MODE was no longer defined after 832c076f26 and caused
issues during the install step as the build directory was malformed.

This patch maintains the release/dev profile distinction, while also
assigning appropriate build folders.

Fixes:
 - http://autobuild.buildroot.net/results/a4cd7ecc6d983aa6f15d3be1e21529f17e04b825/
 - http://autobuild.buildroot.net/results/2bab8ffa590d4c4eabffe94ed27311c7f6607c98/

Signed-off-by: Sam Voss <sam.voss@gmail.com>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ripgrep/ripgrep.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 5f58630ffe..9dd8d58de1 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -12,13 +12,19 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
 
-RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
+RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_BIN_SUBDIR)
 
 RIPGREP_CARGO_OPTS = \
-	$(if $(BR2_ENABLE_DEBUG),,--release) \
 	--target=$(RUSTC_TARGET_NAME) \
 	--manifest-path=$(@D)/Cargo.toml
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+RIPGREP_CARGO_BIN_SUBDIR = debug
+else
+RIPGREP_CARGO_OPTS += --release
+RIPGREP_CARGO_BIN_SUBDIR = release
+endif
+
 define RIPGREP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(RIPGREP_CARGO_ENV) \
 		cargo build $(RIPGREP_CARGO_OPTS)
-- 
2.27.0
