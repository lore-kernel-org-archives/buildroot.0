From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jan 2019 20:50:39 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile.in: set -fno-dwarf2-cfi-asm for
 m68k_cf
Message-ID: <20190112195039.24984-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another package (libsquish) is affected by the
"Internal error in emit_expr_encoded at dw2gencfi.c:215".

This error already affects 5 packages and is due to binutils, see:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509

No report has been made to binutils yet however as suggested by Yann
during review of woff2 workaround
(https://patchwork.ozlabs.org/patch/911344/), remove the workarounds
from all these packages and put it in package/Makefile.in

Fixes:
 - http://autobuild.buildroot.org/results/77e06c092f4e7804dc166e259b25e779e5f1e83a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/Makefile.in              | 6 ++++++
 package/berkeleydb/berkeleydb.mk | 7 -------
 package/kmsxx/kmsxx.mk           | 6 ------
 package/lcdapi/lcdapi.mk         | 6 ------
 package/libasplib/libasplib.mk   | 8 --------
 package/woff2/woff2.mk           | 6 ------
 6 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 44761b79c5..dc818a2c18 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -163,6 +163,12 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
+ifeq ($(BR2_m68k_cf),y)
+TARGET_CFLAGS += -fno-dwarf2-cfi-asm
+TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
+endif
+
 ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index a315943ee6..e5c11bddcf 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -20,18 +20,11 @@ BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
 	db_hotbackup db_load db_log_verify db_printlog db_recover db_replicate \
 	db_stat db_tuner db_upgrade db_verify
 
-# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
-ifeq ($(BR2_m68k_cf),y)
-BERKELEYDB_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
-endif
-
 # build directory can't be the directory where configure are there, so..
 define BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		$(BERKELEYDB_CONF_ENV) \
 		../dist/configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
diff --git a/package/kmsxx/kmsxx.mk b/package/kmsxx/kmsxx.mk
index dc0f8c17dc..c664d52361 100644
--- a/package/kmsxx/kmsxx.mk
+++ b/package/kmsxx/kmsxx.mk
@@ -12,12 +12,6 @@ KMSXX_INSTALL_STAGING = YES
 KMSXX_DEPENDENCIES = libdrm host-pkgconf
 KMSXX_CONF_OPTS = -DKMSXX_ENABLE_PYTHON=OFF
 
-# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
-ifeq ($(BR2_m68k_cf),y)
-KMSXX_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
-endif
-
 ifeq ($(BR2_PACKAGE_KMSXX_INSTALL_TESTS),y)
 KMSXX_TESTS = \
 	fbtest kmsblank kmscapture \
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
index f7c71dfd32..b27abcdbf2 100644
--- a/package/lcdapi/lcdapi.mk
+++ b/package/lcdapi/lcdapi.mk
@@ -11,12 +11,6 @@ LCDAPI_LICENSE_FILES = COPYING
 LCDAPI_AUTORECONF = YES
 LCDAPI_INSTALL_STAGING = YES
 
-# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
-ifeq ($(BR2_m68k_cf),y)
-LCDAPI_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
-endif
-
 define LCDAPI_CREATE_M4_DIR
 	mkdir -p $(@D)/m4
 endef
diff --git a/package/libasplib/libasplib.mk b/package/libasplib/libasplib.mk
index e13945c6f2..5da85abe0c 100644
--- a/package/libasplib/libasplib.mk
+++ b/package/libasplib/libasplib.mk
@@ -18,12 +18,4 @@ LIBASPLIB_CONF_OPTS = \
 	-DBUILD_SIGNALS=ON \
 	-DBUILD_TIMER=ON
 
-# Internal error, aborting at dw2gencfi.c:214 in emit_expr_encoded
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
-ifeq ($(BR2_m68k_cf),y)
-LIBASPLIB_CXXFLAGS += -fno-dwarf2-cfi-asm
-endif
-
-LIBASPLIB_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(LIBASPLIB_CXXFLAGS)"
-
 $(eval $(cmake-package))
diff --git a/package/woff2/woff2.mk b/package/woff2/woff2.mk
index 2f0206c82b..b2ff33fe98 100644
--- a/package/woff2/woff2.mk
+++ b/package/woff2/woff2.mk
@@ -21,10 +21,4 @@ ifneq ($(BR2_SHARED_LIBS),y)
 WOFF2_CONF_OPTS += -DCMAKE_SKIP_RPATH=ON
 endif
 
-# Internal error, aborting at dw2gencfi.c:215 in emit_expr_encoded
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79509
-ifeq ($(BR2_m68k_cf),y)
-WOFF2_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -fno-dwarf2-cfi-asm"
-endif
-
 $(eval $(cmake-package))
-- 
2.14.1
