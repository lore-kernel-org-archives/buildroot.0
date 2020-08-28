From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:28:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/ripgrep: fix
 build directories
Message-ID: <20200828174508.5C7788653F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80c9d50e5e0776b83e0d7084a68c54abc88e6d53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

RIPGREP_CARGO_MODE was no longer defined after 832c076f26 and caused
issues during the install step as the build directory was malformed.

This patch maintains the release/dev profile distinction, while also
assigning appropriate build folders.

Fixes:
 - http://autobuild.buildroot.net/results/a4cd7ecc6d983aa6f15d3be1e21529f17e04b825/
 - http://autobuild.buildroot.net/results/2bab8ffa590d4c4eabffe94ed27311c7f6607c98/

Signed-off-by: Sam Voss <sam.voss@gmail.com>
CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 32d27c2f4c47f4da97a484a37df8b0ba1743b0d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ripgrep/ripgrep.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 2cfdeba9aa..1500733d09 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -12,13 +12,19 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
 RIPGREP_DEPENDENCIES = host-cargo
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
