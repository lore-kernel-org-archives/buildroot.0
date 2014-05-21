From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 21 May 2014 16:55:09 +0200
Subject: [Buildroot] [PATCH v3 2/2] google-breakpad: integration into
	makefile and Config.in
In-Reply-To: <1400684109-20308-1-git-send-email-pascal.huerst@gmail.com>
References: <1400684109-20308-1-git-send-email-pascal.huerst@gmail.com>
Message-ID: <1400684109-20308-2-git-send-email-pascal.huerst@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds the symbol generation for google-breakpad to
the Makefile and adds a list were users can insert libraries
and binaries that should be symbol-dumped.

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
---
 Config.in | 10 ++++++++++
 Makefile  |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/Config.in b/Config.in
index d402c93..2439026 100644
--- a/Config.in
+++ b/Config.in
@@ -457,6 +457,16 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
+	string "executables and libraries to be used by google-breakpad"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD
+	default ""
+	help
+	  You may specify a space-seperated list of binaries and libraries
+	  here of which debug symbols should be dumped for google breakpad.
+	  Debug symbols will be stored as google_breakpad_symbols in: 
+	  staging/usr/shared/google-breakpad-symbols
+
 config BR2_ENABLE_SSP
 	bool "build code with Stack Smashing Protection"
 	depends on BR2_TOOLCHAIN_HAS_SSP
diff --git a/Makefile b/Makefile
index 4b93805..dbdef4a 100644
--- a/Makefile
+++ b/Makefile
@@ -553,6 +553,13 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
+ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
+	package/google-breakpad/google-breakpad-gen-syms.sh \
+		$(STAGING_DIR) \
+		$(HOST_DIR) \
+		"$(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))" 
+endif
+
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
 	if test -d $(TARGET_DIR)/lib/modules; then \
-- 
1.9.0
