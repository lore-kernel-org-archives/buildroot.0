From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 16:10:43 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] boot/barebox: kconfig
 needs the toolchain
Message-ID: <20210105145258.0000D8642F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cfdc2515fb3eecff95b47b7913e86697765197b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

In barebox v2020.09.0, kconfig has been updated to a newer version
based on Linux 5.9-rc2.  As in linux, kconfig can call the compiler
to test its capabilities.

We have no way to know if a custom version would require it or not,
so we just unconditionally depend on the toolchain

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 1c1a629d814fcf4b8c4c65ce6687635c534a22e9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 9d62037e7a..77550aaed6 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -138,6 +138,11 @@ define $(1)_INSTALL_IMAGES_CMDS
 	$$($(1)_INSTALL_CUSTOM_ENV)
 endef
 
+# Starting with barebox v2020.09.0, the kconfig used calls the
+# cross-compiler to check its capabilities. So we need the
+# toolchain before we can call the configurators.
+$(1)_KCONFIG_DEPENDENCIES += toolchain
+
 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_INSTALL_TARGET_CMDS
 	cp $$(@D)/scripts/bareboxenv-target $$(TARGET_DIR)/usr/bin/bareboxenv
