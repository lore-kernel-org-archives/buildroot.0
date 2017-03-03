From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri,  3 Mar 2017 15:18:51 +0100
Subject: [Buildroot] [RFC PATCH 7/9] external-toolchain: check if a
	buildroot toolchain has already been relocated
In-Reply-To: <1488550733-3956-1-git-send-email-wg@grandegger.com>
References: <1488550733-3956-1-git-send-email-wg@grandegger.com>
Message-ID: <1488550733-3956-8-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The location of the buildroot toolchain is stored in the file
"share/buildroot/toolchain-location". If it's contents does not match
the current toolchain location, ask the user to run the script
"relocate-toolchain.sh" in the top directory once.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 toolchain/helpers.mk                                   | 14 ++++++++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk |  1 +
 2 files changed, 15 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 72e7292..d037391 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -403,3 +403,17 @@ check_toolchain_ssp = \
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
+check_buildroot_toolchain_relocated = \
+	if [ -r $(1)/share/buildroot/toolchain-location ]; then \
+		if [ "`cat $(1)/share/buildroot/toolchain-location`" != "$(1)" ]; then \
+			echo "Please relocate the buildroot toolchain at \"$(1)\" by executing \"$(1)/reloacte-toolchain.sh\" once!" ; \
+			exit 1 ; \
+		fi \
+	fi
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 11a1bf5..1cc7922 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -543,6 +543,7 @@ endif
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # kernel headers version, type of C library and all C library features.
 define $(2)_CONFIGURE_CMDS
+	$$(Q)$$(call check_buildroot_toolchain_relocated,$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
-- 
1.9.1
