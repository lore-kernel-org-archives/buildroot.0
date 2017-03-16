From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 16 Mar 2017 15:23:26 +0100
Subject: [Buildroot] [RFC PATCH v2 8/9] external-toolchain: check if a
	buildroot SDK has already been relocated
In-Reply-To: <1489674207-6876-1-git-send-email-wg@grandegger.com>
References: <1489674207-6876-1-git-send-email-wg@grandegger.com>
Message-ID: <1489674207-6876-9-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The location of the buildroot SDK is stored in the file "sdk-location"
in "usr/share/buildroot". If it's content does not match the current
SDK location, ask the user to run the script "relocate-sdk.sh" in the
top directory once.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 toolchain/helpers.mk                                   | 15 +++++++++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk |  1 +
 2 files changed, 16 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 2f73ebb..5f6e3e0 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -394,3 +394,18 @@ check_toolchain_ssp = \
 gen_gdbinit_file = \
 	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
 	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit
+
+#
+# Check if it's a buildroot toolchain and if it's already relocatable by
+# reading and testing the toolchain location file
+#
+# $1: toolchain installation directory
+#
+check_buildroot_sdk_relocated = \
+	if [ -r $(1)/share/buildroot/sdk-location ]; then \
+		sdkroot=`dirname "$(1)"`; \
+		if [ "`cat $(1)/share/buildroot/sdk-location`" != "$${sdkroot}" ]; then \
+			echo "Please relocate the buildroot SDK by executing \"$${sdkroot}/relocate-sdk.sh\" once!" ; \
+			exit 1 ; \
+		fi \
+	fi
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 11a1bf5..b9ffa80 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -543,6 +543,7 @@ endif
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # kernel headers version, type of C library and all C library features.
 define $(2)_CONFIGURE_CMDS
+	$$(Q)$$(call check_buildroot_sdk_relocated,$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
-- 
1.9.1
