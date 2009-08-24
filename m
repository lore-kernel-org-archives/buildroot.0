From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] alsa-utils: fix build for x86 on
	x86-64
Message-ID: <20090824202958.805147774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=350b6c6e4b039ae0256e52cd06c6f6d769a1c2b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa-utils included two ugly patches for ARM and AVR32 to fix build
issues encountered with ncurses. In fact these build issues were
caused by the fact that alsa-utils was using ncurses5-config of the
host instead of the one installed in $(STAGING_DIR).

Therefore, these two patches are removed, and we instead pass
ac_cv_prog_ncurses5_config to the ./configure script.

This commit solves bug #569, reported by Simon Pasch, who also
contributed this fix.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 CHANGES                                            |    1 +
 .../alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm |   29 --------------------
 .../alsa-utils-1.0.18-acs_map.patch.avr32          |   29 --------------------
 package/multimedia/alsa-utils/alsa-utils.mk        |    2 +-
 4 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm
 delete mode 100644 package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32

diff --git a/CHANGES b/CHANGES
index ec8bfde..fdecd53 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,6 +13,7 @@
 
 	#525: sed broken with external toolchain
 	#537: Fix gzip build with recent glibc
+	#569: Fix alsa-utils build for x86 on x86-64
 
 2009.08-rc1, Released August 2nd, 2009:
 
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm b/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm
deleted file mode 100644
index e2103f8..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.arm
+++ /dev/null
@@ -1,29 +0,0 @@
-When configuring alsa-utils, it will use the hosts <ncurses.h>
-See: alsa-utils <VERSION> / alsamixer/.deps/alsamicer.Po
-This will, on OpenSuSE 11.0, and possibly other distributions
-result in that the preprocessor directive:
-#define acs_map _nc_acs_map
-which is present in the Buildroot build of ncurses,
-is not executed, and the
-extern <chartype> acs_map[]; 
-declaration in the host ncurses will
-result in an undefined symbol: acs_map.
-
-This patches give up trying to force alsa-utils to use the correct
-ncurses, and just defines a byte with the needed symbol.
-
-
-diff -urN alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c alsa-utils-1.0.18/alsamixer/alsamixer.c
---- alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c	2008-10-29 13:42:11.000000000 +0100
-+++ alsa-utils-1.0.18/alsamixer/alsamixer.c	2009-01-22 23:35:29.000000000 +0100
-@@ -115,6 +115,10 @@
- #include <sys/time.h>
- 
- #include <locale.h>
-+/* Ugly hack to get rid of undefined "acs_map" */
-+/* This is caused by configure using host ncurses.h */
-+/* instead of buildroot's ncurses.h */
-+unsigned long acs_map[1];
- 
- #ifndef CURSESINC
- #include <ncurses.h>
diff --git a/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32 b/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32
deleted file mode 100644
index e2103f8..0000000
--- a/package/multimedia/alsa-utils/alsa-utils-1.0.18-acs_map.patch.avr32
+++ /dev/null
@@ -1,29 +0,0 @@
-When configuring alsa-utils, it will use the hosts <ncurses.h>
-See: alsa-utils <VERSION> / alsamixer/.deps/alsamicer.Po
-This will, on OpenSuSE 11.0, and possibly other distributions
-result in that the preprocessor directive:
-#define acs_map _nc_acs_map
-which is present in the Buildroot build of ncurses,
-is not executed, and the
-extern <chartype> acs_map[]; 
-declaration in the host ncurses will
-result in an undefined symbol: acs_map.
-
-This patches give up trying to force alsa-utils to use the correct
-ncurses, and just defines a byte with the needed symbol.
-
-
-diff -urN alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c alsa-utils-1.0.18/alsamixer/alsamixer.c
---- alsa-utils-1.0.18-0rig//alsamixer/alsamixer.c	2008-10-29 13:42:11.000000000 +0100
-+++ alsa-utils-1.0.18/alsamixer/alsamixer.c	2009-01-22 23:35:29.000000000 +0100
-@@ -115,6 +115,10 @@
- #include <sys/time.h>
- 
- #include <locale.h>
-+/* Ugly hack to get rid of undefined "acs_map" */
-+/* This is caused by configure using host ncurses.h */
-+/* instead of buildroot's ncurses.h */
-+unsigned long acs_map[1];
- 
- #ifndef CURSESINC
- #include <ncurses.h>
diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index 06c6f13..9f0b5d1 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -17,7 +17,6 @@ $(DL_DIR)/$(ALSA_UTILS_SOURCE):
 $(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
 	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch
-	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/multimedia/alsa-utils/ alsa-utils-$(ALSA_UTILS_VERSION)\*.patch.$(ARCH)
 	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
 	touch $@
 
@@ -27,6 +26,7 @@ $(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
 		$(TARGET_CONFIGURE_ARGS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		ac_cv_prog_ncurses5_config=$(STAGING_DIR)/bin/ncurses5-config \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.6.3.3
