From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:12 +0200
Subject: [Buildroot] [PATCH v7 7/9] external-toolchain: check if a buildroot
	SDK has already been relocated
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-8-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The location of the buildroot SDK is stored in the file "sdk-location"
in "share/buildroot". If it's content does not match the current
SDK location, ask the user to run the script "relocate-sdk.sh" in the
top directory once. The external toolchain may be a pre-installed one
in a directory that is not writeable by us. Therefore, we can't run
the script directly.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 toolchain/helpers.mk                                   | 18 ++++++++++++++++++
 toolchain/toolchain-external/pkg-toolchain-external.mk |  1 +
 2 files changed, 19 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 6136aef..5c6539e 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -476,3 +476,21 @@ define simplify_symlink
 	ln -sf "$${DOTS}$${REL_DEST}" "$${FULL_SRC}" ; \
 )
 endef
+
+#
+# Check if it's a buildroot toolchain and if it's already relocatable by
+# reading and testing the toolchain location file
+#
+# $1: toolchain installation directory
+#
+define check_buildroot_sdk_relocated
+( \
+	if [ -r $(1)/share/buildroot/sdk-location ]; then \
+		sdkroot=`dirname "$(1)"`; \
+		if [ "`cat $(1)/share/buildroot/sdk-location`" != "$${sdkroot}" ]; then \
+			echo "Please relocate the buildroot SDK by executing \"$${sdkroot}/relocate-sdk.sh\" once!" ; \
+			exit 1 ; \
+		fi \
+	fi \
+)
+endef
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 33449d3..afccbb6 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -519,6 +519,7 @@ endif
 # matches the configuration provided in Buildroot: ABI, C++ support,
 # kernel headers version, type of C library and all C library features.
 define $(2)_CONFIGURE_CMDS
+	$$(Q)$$(call check_buildroot_sdk_relocated,$$(TOOLCHAIN_EXTERNAL_INSTALL_DIR))
 	$$(Q)$$(call check_cross_compiler_exists,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)$$(call check_unusable_toolchain,$$(TOOLCHAIN_EXTERNAL_CC))
 	$$(Q)SYSROOT_DIR="$$(call toolchain_find_sysroot,$$(TOOLCHAIN_EXTERNAL_CC))" ; \
-- 
2.7.4
