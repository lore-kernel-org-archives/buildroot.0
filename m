From: Jules Maselbas <jmaselbas@kalray.eu>
Date: Tue,  8 Dec 2020 11:11:07 +0100
Subject: [Buildroot] [PATCH] boot/barebox: kconfig needs the toolchain
Message-ID: <20201208101107.32758-1-jmaselbas@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In barebox v2020.09.0, kconfig has been updated to a newer version
based on Linux 5.9-rc2.  As in linux, kconfig can call the compiler
to test its capabilities.

Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 boot/barebox/barebox.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 422f27312d..2e80954741 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -88,6 +88,11 @@ $(1)_KCONFIG_DEPENDENCIES = \
 	$(BR2_BISON_HOST_DEPENDENCY) \
 	$(BR2_FLEX_HOST_DEPENDENCY)
 
+# Starting with barebox v2020.09.0, the kconfig used calls the
+# cross-compiler to check its capabilities. So we need the
+# toolchain before we can call the configurators.
+$(1)_KCONFIG_DEPENDENCIES += toolchain
+
 ifeq ($$(BR2_TARGET_$(1)_BAREBOXENV),y)
 define $(1)_BUILD_BAREBOXENV_CMDS
 	$$(TARGET_CC) $$(TARGET_CFLAGS) $$(TARGET_LDFLAGS) -o $$(@D)/bareboxenv \
-- 
2.17.1
