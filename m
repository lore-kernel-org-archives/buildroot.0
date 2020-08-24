From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 10:47:40 +0200
Subject: [Buildroot] [git commit] docs/manual/adding-packages-cargo.txt:
 drop debug profile
Message-ID: <20200824084049.2E53A821C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ec5b47071054a7f5e6ec6481fce35e7183bf3d3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no debug profile on cargo. The available profiles are: dev
(enabled by default), release, test and bench.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-cargo.txt | 41 +++++++++++++++++------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index bb078b6981..8fcc80bcc6 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -47,32 +47,31 @@ package. Let's start with an example:
 13: FOO_DEPENDENCIES = host-rustc
 14:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
-17:
-18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
-19:
-20: FOO_CARGO_OPTS = \
-21:   --$(FOO_CARGO_MODE) \
-22: 	--target=$(RUSTC_TARGET_NAME) \
-23: 	--manifest-path=$(@D)/Cargo.toml
-24:
-25: define FOO_BUILD_CMDS
-26: 	$(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
-27: 		cargo build $(FOO_CARGO_OPTS)
-28: endef
-29:
-30: define FOO_INSTALL_TARGET_CMDS
-31: 	$(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
-32: 		$(TARGET_DIR)/usr/bin/foo
-33: endef
-34:
-35: $(eval $(generic-package))
+16:
+17: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
+18:
+19: FOO_CARGO_OPTS = \
+20: 	$(if $(BR2_ENABLE_DEBUG),,--release) \
+21: 	--target=$(RUSTC_TARGET_NAME) \
+22: 	--manifest-path=$(@D)/Cargo.toml
+23:
+24: define FOO_BUILD_CMDS
+25: 	$(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
+26: 		cargo build $(FOO_CARGO_OPTS)
+27: endef
+28:
+29: define FOO_INSTALL_TARGET_CMDS
+30: 	$(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
+31: 		$(TARGET_DIR)/usr/bin/foo
+32: endef
+33:
+34: $(eval $(generic-package))
 --------------------------------
 
 The Makefile starts with the definition of the standard variables for package
 declaration (lines 7 to 11).
 
-As seen in line 35, it is based on the
+As seen in line 34, it is based on the
 xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
 the variables required by this particular infrastructure, where Cargo is
 invoked:
