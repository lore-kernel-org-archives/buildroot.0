From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 21:50:43 +0100
Subject: [Buildroot] [PATCH 03/10] toolchain/crosstool-NG: use a copy of the
	uClibc .config
In-Reply-To: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1290891050-18122-4-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Before we can munge the uClibc .config file, we have to use a copy.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   16 ++++++++++++++--
 1 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 4040dcd..b92aed0 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -76,6 +76,8 @@ $(STAMP_DIR)/ct-ng-toolchain-installed: $(STAMP_DIR)/ct-ng-toolchain-built
 
 #-----------------------------------------------------------------------------
 # Building the toolchain
+# Note: $(STAMP_DIR)/ct-ng-toolchain-built can have more dependencies,
+#       depending on the selected C library. Those deps are added later
 
 $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 	$(Q)$(call ctng,build.$(BR2_JLEVEL))
@@ -187,8 +189,18 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 #--------------
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
-CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_UCLIBC_CONFIG_FILE)":;
-endif
+
+# Instruct CT-NG's .config where to find the uClibc's .config
+CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_LIBC_UCLIBC_CONFIG_FILE)=.*:\1="$(CTNG_DIR)/libc.config":;
+
+# And add this to the toolchain build dependency
+$(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/libc.config
+
+# And here is how we get this uClibc's .config
+$(CTNG_DIR)/libc.config: $(CTNG_UCLIBC_CONFIG_FILE)
+	$(Q)cp -f $< $@
+
+endif # LIBC is uClibc
 
 #--------------
 # Small functions to shoe-horn the above into crosstool-NG's .config
-- 
1.7.1
