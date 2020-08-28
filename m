From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:09:02 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/ripgrep: fix
 debug build
Message-ID: <20200828170226.A0B308377C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=782337d049aee9a3c80b00f92ac0019b4eabfb41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

There is no --debug mode for cargo resulting in the following build
failure since the addition of this package with commit
4b0d1ef6ac00c5170a3fb9d15d06b3d3172e0c97:

error: Unknown flag: '--debug'

Fixes:
 - http://autobuild.buildroot.org/results/58e74bb056ec65680ecebaa559aa14bdebbf5c85
 - http://autobuild.buildroot.org/results/28c6364a89a6044d5a036614f7a6e59815efb770

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: keep the default 'dev' mode when in debug]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d67ff44850fdb7f5159d2b6c3310e7501231a24f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ripgrep/ripgrep.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 0bb7017a96..2cfdeba9aa 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -11,12 +11,11 @@ RIPGREP_LICENSE_FILES = LICENSE-MIT
 
 RIPGREP_DEPENDENCIES = host-cargo
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-RIPGREP_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
 
 RIPGREP_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(RIPGREP_CARGO_MODE)
 
 RIPGREP_CARGO_OPTS = \
-	--$(RIPGREP_CARGO_MODE) \
+	$(if $(BR2_ENABLE_DEBUG),,--release) \
 	--target=$(RUSTC_TARGET_NAME) \
 	--manifest-path=$(@D)/Cargo.toml
 
