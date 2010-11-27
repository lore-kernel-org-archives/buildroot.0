From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 21:50:44 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/crosstool-NG: move munging
	functions
In-Reply-To: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1290891050-18122-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1290891050-18122-5-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   62 ++++++++++++----------
 1 files changed, 34 insertions(+), 28 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index b92aed0..48116af 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -96,15 +96,46 @@ $(STAMP_DIR)/ct-ng-toolchain-built: $(CTNG_DIR)/.config
 CTNG_FIX_DOT_CONFIG_SED       :=
 CTNG_FIX_DOT_CONFIG_PATHS_SED :=
 
+#--------------
+# A few generic functions
+
+# Munge a config file, given a sed expression
+# $1: the .config file to munge
+# $2: the sed expression to apply
+define ctng-fix-dot-config
+	$(Q)sed -r -e '$(2)' $(1) >$(1).sed
+	$(Q)cmp $(1) $(1).sed >/dev/null 2>&1 && rm -f $(1).sed || mv -f $(1).sed $(1)
+endef
+
+# This function checks the .config did actually change
+# If not changed, then current .config will be touched with reference to the
+# stamp file. If the configuration did change, nothing is done.
+# $1: the current .config to check
+# $2: the time-stamped .config file
+define ctng-check-config-changed
+	$(Q)old_md5="$$( grep -v -E '^(#|$$)' $(2) 2>/dev/null  \
+	                 |md5sum                                \
+	                 |cut -d ' ' -f 1                       \
+	               )";                                      \
+	    new_md5="$$( grep -v -E '^(#|$$)' $(1) 2>/dev/null  \
+	                 |md5sum                                \
+	                 |cut -d ' ' -f 1                       \
+	               )";                                      \
+	    if [ $${old_md5} = $${new_md5} -a -f $(2) ]; then   \
+	        touch -r $(2) $(1);                             \
+	    fi
+endef
+
+#--------------
+# Massage BR2_ARCH so that it matches CT-NG's ARCH
+#
 # Note: a lot of the following tricks would become unneeded if one day
 # buildroot and crosstool-NG had matching options, especially for the
 # target description: arch name, bitness, endianness...
-
+#
 # Note-2: missing conformity check between BR's .config and libc features.
 # Use check_uclibc or check_glibc.
 
-#--------------
-# Massage BR2_ARCH so that it matches CT-NG's ARCH
 # Defaults:
 CTNG_ARCH   := $(CTNG_BR2_ARCH)
 CTNG_ENDIAN :=
@@ -204,12 +235,6 @@ endif # LIBC is uClibc
 
 #--------------
 # Small functions to shoe-horn the above into crosstool-NG's .config
-# $1: the .config file to munge
-# $2: the sed expression to apply
-define ctng-fix-dot-config
-	$(Q)sed -r -e '$(2)' $(1) >$(1).sed
-	$(Q)cmp $(1) $(1).sed >/dev/null 2>&1 && rm -f $(1).sed || mv -f $(1).sed $(1)
-endef
 
 # Function to update the .config
 # We first munge the .config to shoe-horn defaults, then we push that unto
@@ -228,25 +253,6 @@ define ctng-oldconfig
 	$(call ctng-fix-dot-config,$(1),$(CTNG_FIX_DOT_CONFIG_PATHS_SED))
 endef
 
-# This function checks the confguration of the toolchain did actually change
-# If not changed, then current .config will be touched with reference to the
-# stamp file. If the configuration did change, nothing is done.
-# $1: the current .config to check
-# $2: the time-stamped .config file
-define ctng-check-config-changed
-	$(Q)old_md5="$$( grep -v -E '^(#|$$)' $(2) 2>/dev/null  \
-	                 |md5sum                                \
-	                 |cut -d ' ' -f 1                       \
-	               )";                                      \
-	    new_md5="$$( grep -v -E '^(#|$$)' $(1) 2>/dev/null  \
-	                 |md5sum                                \
-	                 |cut -d ' ' -f 1                       \
-	               )";                                      \
-	    if [ $${old_md5} = $${new_md5} -a -f $(2) ]; then   \
-	        touch -r $(2) $(1);                             \
-	    fi
-endef
-
 # Default configuration
 # Depends on top-level .config because it has options we have to shoe-horn
 # into crosstool-NG's .config
-- 
1.7.1
