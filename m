From: Stefan <buildroot-list_21@green-sparklet.de>
Date: Tue, 15 Jun 2021 15:55:54 +0200
Subject: [Buildroot] [PATCH] docs/manual/adding-packages-cargo.txt: re-add
 FOO_CARGO_MODE variable
Message-ID: <2e60c4dc-6a6f-7124-c512-2b4495482f4c@green-sparklet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FOO_CARGO_MODE is needed for FOO_BIN_DIR, example wouldn't work without.
Fabrice Fontaine is correct that carco has no 'debug' profile, but default 'dev' profile builds into 'debug' directory. That's where we have to pick up files for install.

Signed-off-by: Stefan G?nsler <buildroot-git_21@green-sparklet.de>
---
 docs/manual/adding-packages-cargo.txt | 41 ++++++++++++++-------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/docs/manual/adding-packages-cargo.txt b/docs/manual/adding-packages-cargo.txt
index 8fcc80bcc6..8cbd641d65 100644
--- a/docs/manual/adding-packages-cargo.txt
+++ b/docs/manual/adding-packages-cargo.txt
@@ -47,31 +47,32 @@ package. Let's start with an example:
 13: FOO_DEPENDENCIES = host-rustc
 14:
 15: FOO_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-16:
-17: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
-18:
-19: FOO_CARGO_OPTS = \
-20:    $(if $(BR2_ENABLE_DEBUG),,--release) \
-21:    --target=$(RUSTC_TARGET_NAME) \
-22:    --manifest-path=$(@D)/Cargo.toml
-23:
-24: define FOO_BUILD_CMDS
-25:    $(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
-26:            cargo build $(FOO_CARGO_OPTS)
-27: endef
-28:
-29: define FOO_INSTALL_TARGET_CMDS
-30:    $(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
-31:            $(TARGET_DIR)/usr/bin/foo
-32: endef
-33:
-34: $(eval $(generic-package))
+16: FOO_CARGO_MODE = $(if $(BR2_ENABLE_DEBUG),debug,release)
+17:
+18: FOO_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(FOO_CARGO_MODE)
+19:
+20: FOO_CARGO_OPTS = \
+21:    $(if $(BR2_ENABLE_DEBUG),,--release) \
+22:    --target=$(RUSTC_TARGET_NAME) \
+23:    --manifest-path=$(@D)/Cargo.toml
+24:
+25: define FOO_BUILD_CMDS
+26:    $(TARGET_MAKE_ENV) $(FOO_CARGO_ENV) \
+27:            cargo build $(FOO_CARGO_OPTS)
+28: endef
+29:
+30: define FOO_INSTALL_TARGET_CMDS
+31:    $(INSTALL) -D -m 0755 $(@D)/$(FOO_BIN_DIR)/foo \
+32:            $(TARGET_DIR)/usr/bin/foo
+33: endef
+34:
+35: $(eval $(generic-package))
 --------------------------------

 The Makefile starts with the definition of the standard variables for package
 declaration (lines 7 to 11).

-As seen in line 34, it is based on the
+As seen in line 35, it is based on the
 xref:generic-package-tutorial[+generic-package+ infrastructure]. So, it defines
 the variables required by this particular infrastructure, where Cargo is
 invoked:
--
2.32.0.windows.1
