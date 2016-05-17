From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 17 May 2016 14:04:41 -0500
Subject: [Buildroot] [PATCH 2/4] fmlib: add powerpc e6500 support
In-Reply-To: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1463511883-27657-2-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/fmlib/Config.in | 25 +++++++++++++++++++++++--
 package/fmlib/fmlib.mk  | 15 +++++++++++++++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 3cc6a2b..6dc0534 100644
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
@@ -13,3 +13,24 @@ config BR2_PACKAGE_FMLIB
 	  parameters and PCD (parse - classify - distribute) rules.
 
 	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
+
+if BR2_PACKAGE_FMLIB
+choice
+	prompt "QORIQ Target Family"
+	default BR2_FMLIB_QORIQ_FAMILY_P4080
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
+endchoice
+endif
diff --git a/package/fmlib/fmlib.mk b/package/fmlib/fmlib.mk
index 978810b..a4d28d0 100644
--- a/package/fmlib/fmlib.mk
+++ b/package/fmlib/fmlib.mk
@@ -25,6 +25,21 @@ ifeq ($(BR2_powerpc_e500mc),y)
 FMLIB_ARCHTYPE = ppce500mc
 endif
 
+ifeq ($(BR2_powerpc_e6500),y)
+ifeq ($(BR2_powerpc64), y)
+	FMLIB_ARCHTYPE = ppc64e6500
+else ifeq ($(BR2_powerpc), y)
+	FMLIB_ARCHTYPE = ppc32e6500
+endif
+endif
+
+FMLIB_PLATFORM=P4080
+ifeq ($(BR2_FMLIB_QORIQ_FAMILY_T4240),y)
+	FMLIB_PLATFORM=T4240
+else ifeq ($(BR2_FMLIB_QORIQ_FAMILY_T2080),y)
+	FMLIB_PLATFORM=FMAN_V3H
+endif
+
 define FMLIB_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(FMLIB_MAKE_OPTS) -C $(@D) libfm-$(FMLIB_ARCHTYPE).a
 endef
-- 
1.9.1
