From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Mon, 28 Sep 2020 11:29:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: custom configuration file
Message-ID: <20200928092945.584196-1-pieter.degendt@basalte.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mbedlts is customizable with a single configuration header file.
Instead of altering the existing config.h file based on the selection
of packages, we can simply replace it.

Signed-off-by: Pieter De Gendt <pieter.degendt@basalte.be>
---
 package/mbedtls/Config.in  | 12 ++++++++++++
 package/mbedtls/mbedtls.mk |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index a39ba65d98..b5000f422d 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -29,4 +29,16 @@ config BR2_PACKAGE_MBEDTLS_COMPRESSION
 	  sure CRIME and similar attacks are not applicable to your
 	  particular situation.
 
+config BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG
+	string "mbedtls custom configuration"
+	help
+	  Mbed TLS should build out-of-the box on a large variety of
+	  platforms. However, you may need to adjust a few platform-
+	  specific settings or want to customize the set of features
+	  that will be built. You can do all of this in a single
+	  configuration file.
+
+	  Provide the location of the custom configuration file or
+	  leave this empty to keep the default.
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 5094434e6c..fa74197004 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -68,4 +68,12 @@ else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
 MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_DISABLE_ASM
 endif
 
+define MBEDTLS_OVERRIDE_CONFIG
+	cp $(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG) $(@D)/include/mbedtls/config.h
+endef
+
+ifneq ($(call qstrip,$(BR2_PACKAGE_MBEDTLS_CUSTOM_CONFIG)),)
+MBEDTLS_POST_CONFIGURE_HOOKS += MBEDTLS_OVERRIDE_CONFIG
+endif
+
 $(eval $(cmake-package))
-- 
2.25.1
