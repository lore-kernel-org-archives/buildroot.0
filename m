From: Pascal Huerst <pascal.huerst@gmail.com>
Date: Wed, 21 May 2014 16:55:08 +0200
Subject: [Buildroot] [PATCH v3 1/2] google-breakpad: new package
Message-ID: <1400684109-20308-1-git-send-email-pascal.huerst@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Breakpad is a library and tool suite that allows you to distribute an application
to users with compiler-provided debugging information removed, record crashes in
compact "minidump" files, send them back to your server, and produce C and C++
stack traces from these minidumps. Breakpad can also write minidumps on request
for programs that have not crashed.

Signed-off-by: Pascal Huerst <pascal.huerst@gmail.com>
---

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

 package/Config.in                                  |  1 +
 package/google-breakpad/Config.in                  | 21 ++++++++++++
 .../google-breakpad/google-breakpad-gen-syms.sh    | 40 ++++++++++++++++++++++
 package/google-breakpad/google-breakpad.mk         | 17 +++++++++
 4 files changed, 79 insertions(+)
 create mode 100644 package/google-breakpad/Config.in
 create mode 100755 package/google-breakpad/google-breakpad-gen-syms.sh
 create mode 100644 package/google-breakpad/google-breakpad.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..0e59c06 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -53,6 +53,7 @@ source "package/dstat/Config.in"
 source "package/duma/Config.in"
 source "package/fio/Config.in"
 source "package/gdb/Config.in"
+source "package/google-breakpad/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
 source "package/ktap/Config.in"
diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
new file mode 100644
index 0000000..5c9e18b
--- /dev/null
+++ b/package/google-breakpad/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_GOOGLE_BREAKPAD
+	bool "google-breakpad"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+
+	help
+	  Google-Breakpad is a library and tool suite that allows you to distribute 
+	  an application to users with compiler-provided debugging information 
+	  removed, record crashes in compact "minidump" files, send them back to 
+	  your server, and produce C and C++ stack traces from these minidumps. 
+	  Breakpad can also write minidumps on request for programs that have not 
+	  crashed. 	 
+
+	  Add all binaries and libraries you want to debug by google-breakpad to
+	  BR2_GOOGLE_BREAKPAD_INCLUDE_FILES
+
+	  http://code.google.com/p/google-breakpad/
+
+comment "google-breakpad requires an (e)glibc toolchain w/ C++ enabled"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_USES_GLIBC)
diff --git a/package/google-breakpad/google-breakpad-gen-syms.sh b/package/google-breakpad/google-breakpad-gen-syms.sh
new file mode 100755
index 0000000..884e523
--- /dev/null
+++ b/package/google-breakpad/google-breakpad-gen-syms.sh
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+STAGING_DIR=$1
+HOST_DIR=$2
+INCLUDE_FILES=$3
+
+# Search for files we want to dump symbols of
+FIND_CMD="find $STAGING_DIR -name \"\""
+
+for INCLUDE_FILE in $INCLUDE_FILES; do
+	FIND_CMD="$FIND_CMD -o -name \"$INCLUDE_FILE\""
+done
+
+FIND_CMD="$FIND_CMD -print"
+
+
+# Create directory structure
+SYMBOLS_DIR=$STAGING_DIR/usr/share/google-breakpad-symbols
+
+mkdir -p $SYMBOLS_DIR/tmp
+
+for BIN_PATH in $(eval $FIND_CMD); do
+	BIN=$(basename $BIN_PATH);
+	SYM=$BIN.sym;
+
+	$HOST_DIR/usr/bin/dump_syms $BIN_PATH > $SYMBOLS_DIR/tmp/$SYM 2>/dev/null;
+
+	if [ $? -eq 0 ]; then
+		HASH=$(head -n1 $SYMBOLS_DIR/tmp/$SYM | cut -d ' ' -f 4);
+		mkdir -p $SYMBOLS_DIR/$BIN/$HASH
+		mv $SYMBOLS_DIR/tmp/$SYM $SYMBOLS_DIR/$BIN/$HASH;
+	else
+		rm -f $SYMBOLS_DIR/tmp/$SYM
+		echo "Can not dump symbols of $BIN for google-breakpad!"
+	fi
+done
+
+rm -Rf $SYMBOLS_DIR/tmp
+
+exit 0
diff --git a/package/google-breakpad/google-breakpad.mk b/package/google-breakpad/google-breakpad.mk
new file mode 100644
index 0000000..e5b69c0
--- /dev/null
+++ b/package/google-breakpad/google-breakpad.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# google-breakpad
+#
+################################################################################
+
+GOOGLE_BREAKPAD_VERSION = 1320
+GOOGLE_BREAKPAD_SITE = http://google-breakpad.googlecode.com/svn/trunk
+GOOGLE_BREAKPAD_SITE_METHOD = svn
+GOOGLE_BREAKPAD_CONF_OPT = --disable-processor --disable-tools
+GOOGLE_BREAKPAD_DEPENDENCIES = host-google-breakpad
+GOOGLE_BREAKPAD_INSTALL_STAGING = YES
+GOOGLE_BREAKPAD_LICENSE = BSD-3c
+GOOGLE_BREAKPAD_LICENSE_FILES = LICENSE
+
+$(eval $(host-autotools-package))
+$(eval $(autotools-package))
-- 
1.9.0
