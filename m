From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:10:19 +0200
Subject: [Buildroot] [git commit] google-breakpad: integration into Makefile
	and Config.in
Message-ID: <20140731211104.97C1B9D321@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09a1a10f4828be8a76cf2b9c6aa6a401a6dbcfc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new config option that allows to specify a list of files
to dump symbols from, and generate a database of symbols, in
stagins/usr/share/google-breakpad/.

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
[yann.morin.1998 at free.fr: add dependency on the host variant; fix
 script; add commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: remove leftover debugging, rewrap Config.in help text,
propagate dependencies correctly.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                                  |   33 +++++++++++++++++++++++++++
 package/google-breakpad/gen-syms.sh        |   34 ++++++++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk |    9 +++++++
 3 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index dd8073d..14ff55b 100644
--- a/Config.in
+++ b/Config.in
@@ -484,6 +484,39 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_GOOGLE_BREAKPAD_ENABLE
+	bool "Enable google-breakpad support"
+	select BR2_PACKAGE_GOOGLE_BREAKPAD
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
+	help
+	  This option will enable the use of google breakpad, a
+	  library and tool suite that allows you to distribute an
+	  application to users with compiler-provided debugging
+	  information removed, record crashes in compact "minidump"
+	  files, send them back to your server and produce C and C++
+	  stack traces from these minidumps.  Breakpad can also write
+	  minidumps on request for programs that have not crashed.
+
+if BR2_GOOGLE_BREAKPAD_ENABLE
+
+config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
+	string "List of executables and libraries to extract symbols from"
+	default ""
+	help
+	  You may specify a space-separated list of binaries and
+	  libraries with full paths relative to $(TARGET_DIR) of which
+	  debug symbols will be dumped for further use with google
+	  breakpad.
+
+	  A directory structure that can be used by minidump-stackwalk
+	  will be created at:
+
+	  $(STAGING_DIR)/usr/share/google-breakpad-symbols
+
+endif
+
 config BR2_ENABLE_SSP
 	bool "build code with Stack Smashing Protection"
 	depends on BR2_TOOLCHAIN_HAS_SSP
diff --git a/package/google-breakpad/gen-syms.sh b/package/google-breakpad/gen-syms.sh
new file mode 100755
index 0000000..2bc0afa
--- /dev/null
+++ b/package/google-breakpad/gen-syms.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+NAME="${0##*/}"
+STAGING_DIR="${1}"
+TARGET_DIR="${2}"
+shift 2
+
+SYMBOLS_DIR="${STAGING_DIR}/usr/share/google-breakpad-symbols"
+rm -rf "${SYMBOLS_DIR}"
+mkdir -p "${SYMBOLS_DIR}"
+
+error() {
+    fmt="${1}"; shift
+    printf "%s: ${fmt}" "${NAME}" "${@}" >&2
+    exit 1
+}
+
+for FILE in ${@}; do
+    f="${TARGET_DIR}${FILE}"
+    if [ ! -e "${f}" ]; then
+        error "%s: No such file or directory\n" "${FILE}"
+    fi
+	if [ -d "${f}" ]; then
+		error "%s: Is a directory\n" "${FILE}"
+	fi
+	if dump_syms "${f}" > "${SYMBOLS_DIR}/tmp.sym" 2>/dev/null; then
+		hash=$(head -n1 "${SYMBOLS_DIR}/tmp.sym" | cut -d ' ' -f 4);
+		filename=$(basename "${FILE}");
+		mkdir -p "${SYMBOLS_DIR}/${filename}/${hash}"
+		mv "${SYMBOLS_DIR}/tmp.sym" "${SYMBOLS_DIR}/${filename}/${hash}/${filename}.sym";
+	else
+		error "Error dumping symbols for: '%s'\n" "${FILE}"
+	fi
+done
+rm -rf "${SYMBOLS_DIR}/tmp"
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
index bf857ba..add5d7a 100644
--- a/package/google-breakpad/google-breakpad.mk
+++ b/package/google-breakpad/google-breakpad.mk
@@ -14,5 +14,14 @@ GOOGLE_BREAKPAD_INSTALL_STAGING = YES
 GOOGLE_BREAKPAD_LICENSE = BSD-3c
 GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
 
+ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
+GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
+define GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
+	$(EXTRA_ENV) package/google-breakpad/gen-syms.sh $(STAGING_DIR) \
+		$(TARGET_DIR) $(call qstrip,$(BR2_GOOGLE_BREAKPAD_INCLUDE_FILES))
+endef
+TARGET_FINALIZE_HOOKS += GOOGLE_BREAKPAD_EXTRACT_SYMBOLS
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
