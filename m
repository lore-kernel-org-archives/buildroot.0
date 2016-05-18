From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 18 May 2016 08:41:26 -0500
Subject: [Buildroot] [PATCH v2 2/2] fmlib: add powerpc e6500 support
In-Reply-To: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463578886-43470-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1463578886-43470-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
--
v1 -> v2

package/fmlib/fmlib.mk
 - Added missing sed of Makefile to set the PLATFORM

(Suggested by Thomas)
package/fmlib/Config.in
 - Newlines
 - Have kconfig handle selection for ARCHTYPE and PLATFORM
 - Removed default choice for QORIQ family selection
package/fmlib/fmlib.mk
 - Use new ARCHTYPE and PLATFORM instead of conditional
   selection
---
 package/fmlib/Config.in | 38 ++++++++++++++++++++++++++++++++++++--
 package/fmlib/fmlib.mk  |  6 ++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 3cc6a2b..7525112 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -1,10 +1,10 @@
 comment "fmlib needs a Linux kernel to be built"
-	depends on BR2_powerpc_e500mc
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_FMLIB
 	bool "fmlib"
-	depends on BR2_powerpc_e500mc
+	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on BR2_LINUX_KERNEL
 	help
 	  The Frame Manager library provides Freescale PowerPC platforms an
@@ -13,3 +13,37 @@ config BR2_PACKAGE_FMLIB
 	  parameters and PCD (parse - classify - distribute) rules.
 
 	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
+
+if BR2_PACKAGE_FMLIB
+choice
+	prompt "QORIQ Target Family"
+	help
+	  Select the family of QORIQ processor.
+
+config BR2_FMLIB_QORIQ_FAMILY_P4080
+	bool "p40xx"
+	depends on BR2_powerpc_e500mc
+
+config BR2_FMLIB_QORIQ_FAMILY_T4240
+	bool "t42xx"
+	depends on BR2_powerpc_e500mc
+
+config BR2_FMLIB_QORIQ_FAMILY_T2080
+	bool "t208x"
+	depends on BR2_powerpc_e6500
+
+endchoice
+
+config BR2_PACKAGE_FMLIB_ARCHTYPE
+	string
+	default "e500mc" if BR2_powerpc_e500mc
+	default "ppc64e6500" if BR2_powerpc_e6500 && BR2_powerpc64
+	default "ppc32e6500" if BR2_powerpc_e6500 && BR2_powerpc
+
+config BR2_PACKAGE_FMLIB_PLATFORM
+	string
+	default "P4080" if BR2_FMLIB_QORIQ_FAMILY_P4080
+	default "T4240" if BR2_FMLIB_QORIQ_FAMILY_T4240
+	default "FMAN_V3H" if BR2_FMLIB_QORIQ_FAMILY_T2080
+
+endif
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 978810b..5655608 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -25,11 +25,17 @@ ifeq ($(BR2_powerpc_e500mc),y)
 FMLIB_ARCHTYPE = ppce500mc
 endif
 
+FMLIB_ARCHTYPE = $(call qstrip,$(BR2_PACKAGE_FMLIB_ARCHTYPE))
+
+FMLIB_PLATFORM=$(call qstrip,$(BR2_PACKAGE_FMLIB_PLATFORM))
+
 define FMLIB_BUILD_CMDS
+	$(SED) "s:P4080:$(FMLIB_PLATFORM):g" $(@D)/Makefile
 	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
 endef
 
 define FMLIB_INSTALL_STAGING_CMDS
+	rm $(STAGING_DIR)/usr/lib/libfm.a -f
 	$(FMLIB_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) install-libfm-$(FMLIB_ARCHTYPE)
 endef
 
-- 
1.9.1
