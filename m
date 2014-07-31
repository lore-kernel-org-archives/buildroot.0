From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 22:08:55 +0200
Subject: [Buildroot] [PATCH v9] google-breakpad: integration into Makefile
	and Config.in
Message-ID: <1406837335-9696-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pascal Huerst <pascal.huerst@gmail.com>

Add a new config option that allows to specify a list of files
to dump symbols from, and generate a database of symbols, in
stagins/usr/share/google-breakpad/.

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
[yann.morin.1998 at free.fr: add dependency on the host variant; fix
 script; add commit log]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Changes v8 -> v9:
    Add dependency on the host variant, needed to dump the symbols from
      the processed files  (Yann)
    Cleanup and fix the script (do not pick system files!)  (Yann)

Changes v7 -> v8
    Removed use of eval in $(eval ls "${TARGET_DIR}/${@}"); do
      as expected by Yann E. MORIN

Changes v6 -> v7
    Removed comments I forgot to remove in v6 in gen-symy.sh for:
      ifeq ($(BR2_PACKAGE_GOOGLE_BREAKPAD),y)
      as suggested by Yann E. MORIN
    Still using eval, however for:
      for FILE in $(eval ls "${TARGET_DIR}/${@}"); do
      could not make it work without eval

Changes v5 -> v6
    google-breakpad: new package has been accepted.
    Moved parts from makefile into google-breakpad.mk and defined
      the call to gen-symy.sh as a new variable in google-breakpas.mk.
      This seems to be more compatible with fabios series, as
      suggested by Arnout and Thomas.
    Changed integration in Config.in, by adding an enable google breakpad
      option which expands to a list to insert filenames as suggested by
      Arnout and Thomas.
    Removed creation of tmp directory in gen-symy.sh as sugested
      by Arnout, since this is not necessary.

Changes v4 -> v5 (All suggested by Yann E. MORIN)
    Fixed some typo
    Reorganized patch structure
      which parts belong to 'new package' and which parts belong to
      'intergration into Makefile and Config.in'
    Changed and Rewrote gen-symy.sh - script
      Passing $(EXTRA_ENV)
      Adapted a proposed solution from Yann E. MORIN, which
      uses ls instead of find commands
    Made better descriptions for users in:
      Config.in
      package/google-breakpad/Config.in

Changes v3 -> v4
    Fixed minor issue in google-breakpad_gen-syms.sh
      Had to remove -print from find command

Changes v2 -> v3 (All suggested by thomas.petazzoni at free-electrons.com)
    Removed dependency of BR2_ENABLE_DEBUG, but added comment,
      that this flag might have to be set in order to use breakpad
      properly.
    Removed "find -name ..." for libs and binaries by generic patterns,
      such as "*.so" and so forth. This will never work properly. Instead
      I added a list to insert libs and binaries, that will be symbol-
      dumped and prepared for breakpad (see Config.in patch v3 2/2)
    Changed storage path for dumps from: $(TARGET_DIR).. to
      $(STAGING_DIR)/usr/share/google-breakpad-symbols/
    Removed most logic from Makefile. Added script instead, which is
      called by Makefile
    Added dependency for compatible targets: ARM, i386, MIPS...
    Set fixed version for checkout (instead of head)
    Fixed typos, and some minor mistakes

Changes v1 -> v2 (All suggested by maxime.hadjinlian at gmail.com)
    Added dependency from BR2_ENABLE_DEBUG
    Removed symbolstore.py -> Its all done in Makefile now
    Removed new Target -> It in target-finalize before stripping now
    Added LICENSE and LICENSE_FILE to *.mk

---
 Config.in                                  | 28 ++++++++++++++++++++++++
 package/google-breakpad/Config.in          |  3 +++
 package/google-breakpad/gen-syms.sh        | 34 ++++++++++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk |  9 ++++++++
 4 files changed, 74 insertions(+)
 create mode 100755 package/google-breakpad/gen-syms.sh

diff --git a/Config.in b/Config.in
index dd8073d..0d18ffd 100644
--- a/Config.in
+++ b/Config.in
@@ -484,6 +484,34 @@ config BR2_OPTIMIZE_S
 
 endchoice
 
+config BR2_GOOGLE_BREAKPAD_ENABLE
+	bool "Enable google-breakpad support"
+	select BR2_PACKAGE_GOOGLE_BREAKPAD
+	help
+	  This option will enable the use of google breakpad, a library and tool
+	  suite that allows you to distribute an application to users with
+	  compiler-provided debugging information removed, record crashes in
+	  compact "minidump" files, send them back to your server and produce
+	  C and C++ stack traces from these minidumps.  Breakpad can also write
+	  minidumps on request for programs that have not crashed.
+
+if BR2_GOOGLE_BREAKPAD_ENABLE
+
+config BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
+	string "List of executables and libraries to extract symbols from"
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
+endif
+
 config BR2_ENABLE_SSP
 	bool "build code with Stack Smashing Protection"
 	depends on BR2_TOOLCHAIN_HAS_SSP
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
index 146db36..5663a03 100644
--- a/package/google-breakpad/Config.in
+++ b/package/google-breakpad/Config.in
@@ -32,3 +32,6 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD
 comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
 	depends on BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_HOST_GOOGLE_BREAKPAD
+	bool
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
-- 
1.9.1
