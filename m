From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 25 Jun 2014 15:16:14 +0200
Subject: [Buildroot] [PATCH V5 2/2] google-breakpad: integration into
	Makefile and Config.in
In-Reply-To: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>
References: <1403702174-23850-1-git-send-email-pascal.huerst@gmail.com>
Message-ID: <1403702174-23850-3-git-send-email-pascal.huerst@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
---
 Config.in                           | 14 ++++++++++++++
 Makefile                            |  5 +++++
 package/google-breakpad/Config.in   |  5 ++++-
 package/google-breakpad/gen-syms.sh | 25 +++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100755 package/google-breakpad/gen-syms.sh

diff --git a/Config.in b/Config.in
index bf1ca86..4f2bd32 100644
--- a/Config.in
+++ b/Config.in
@@ -480,6 +480,20 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
+	string "executables and libraries to be used by google-breakpad"
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD
+	default ""
+	help
+	  You may specify a space-separated list of binaries and libraries
+	  with full paths relative to $(TARGET_DIR) of which debug symbols 
+	  will be dumped for further use with google breakpad.
+
+	  A directory structure that can be used by minidump-stackwalk will
+	  be created at:
+
+	  $(STAGING_DIR)/usr/share/google-breakpad-symbols
+
 config BR2_ENABLE_SSP
 	bool "build code with Stack Smashing Protection"
 	depends on BR2_TOOLCHAIN_HAS_SSP
diff --git a/Makefile b/Makefile
index 4fe370a..300e86e 100644
--- a/Makefile
+++ b/Makefile
@@ -553,6 +553,11 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON3_PYC_ONLY),y)
 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
 endif
+ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
+	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
+		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
+endif
+
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index fa1e8d9..99dc7a1 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -11,7 +11,10 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 	  Breakpad can also write minidumps on request for programs that have not 
 	  crashed. 	 
 
-	  You may want to set BR2_ENABLE_DEBUG, in order to get useful results.
+	  Add all binaries and libraries you want to debug by google-breakpad to 
+	  BR2_GOOGLE_BREAKPAD_INCLUDE_FILES.
+
+	  You may also want to set BR2_ENABLE_DEBUG, in order to get useful results.
 
 	  http://code.google.com/p/google-breakpad/
 
diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
new file mode 100755
index 0000000..d890752
--- /dev/null
+++ b/package/google-breakpad/gen-syms.sh
@@ -0,0 +1,25 @@
+#!/bin/sh
+STAGING_DIR="${1}"
+TARGET_DIR="${2}"
+shift 2
+
+SYMBOLS_DIR="${STAGING_DIR}/usr/share/google-breakpad-symbols"
+rm -rf "${SYMBOLS_DIR}"
+mkdir -p "${SYMBOLS_DIR}/tmp"
+
+for FILE in $(eval ls "${TARGET_DIR}/${@}"); do
+	if [ -d "${FILE}" ]; then
+		printf "Error: '%s' is a directory\n" "${FILE}" >&2
+		exit 1
+	fi
+	if dump_syms "${FILE}" > "${SYMBOLS_DIR}/tmp/tmp.sym" 2>/dev/null; then
+		HASH=$(head -n1 "${SYMBOLS_DIR}/tmp/tmp.sym" | cut -d ' ' -f 4);
+		FILENAME=$(basename "$FILE");
+		mkdir -p "${SYMBOLS_DIR}/${FILENAME}/${HASH}"
+		mv "${SYMBOLS_DIR}/tmp/tmp.sym" "${SYMBOLS_DIR}/${FILENAME}/${HASH}/${FILENAME}.sym";
+	else
+		printf "Error dumping symbols for: '%s'\n" "${FILE}" >&2
+		exit 1
+	fi
+done
+rm -rf "${SYMBOLS_DIR}/tmp"
-- 
1.9.3
