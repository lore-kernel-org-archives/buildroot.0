From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:29:03 +0200
Subject: [Buildroot] [PATCH 13/23] toolchain: switch to using gcc through
	package infrastructure
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |   2 +-
 package/Config.in                                  |   1 -
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   0
 ...-fix-removal-of-redundant-cast-operations.patch |   0
 ...conditional-insn-which-clobbers-cc_status.patch |   0
 ...use-movh-to-move-immediates-into-register.patch |   0
 .../gcc/4.3.6/100-uclibc-conf.patch                |   0
 .../gcc/4.3.6/104-gnuhurd-uclibc-conf.patch        |   0
 .../gcc/4.3.6/301-missing-execinfo_h.patch         |   0
 .../gcc/4.3.6/302-c99-snprintf.patch               |   0
 .../gcc/4.3.6/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.3.6/810-arm-softfloat-libgcc.patch       |   0
 .../4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch |   0
 .../gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch    |   0
 .../gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch  |   0
 .../4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch    |   0
 ...gcc-4.3.0-cris-pragma-pack-warning-remove.patch |   0
 .../gcc/4.3.6/gcc-43-pr39429.patch                 |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   0
 .../gcc/4.4.7/100-uclibc-conf.patch                |   0
 .../gcc/4.4.7/301-missing-execinfo_h.patch         |   0
 .../gcc/4.4.7/302-c99-snprintf.patch               |   0
 .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.4.7/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.4.7/950-sparc-leon.patch                 |   0
 .../gcc/4.4.7/gcc-44-pr39429.patch                 |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.5.4/100-uclibc-conf.patch                |   0
 .../gcc/4.5.4/301-missing-execinfo_h.patch         |   0
 .../gcc/4.5.4/302-c99-snprintf.patch               |   0
 .../gcc/4.5.4/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.5.4/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.5.4/820-arm-unbreak-armv4t.patch         |   0
 .../gcc/4.5.4/830-arm-pr43440.patch                |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.6.4/100-uclibc-conf.patch                |   0
 .../gcc/4.6.4/301-missing-execinfo_h.patch         |   0
 .../gcc/4.6.4/302-c99-snprintf.patch               |   0
 .../gcc/4.6.4/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.6.4/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.6.4/820-arm-unbreak-armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.7.3/100-uclibc-conf.patch                |   0
 .../gcc/4.7.3/301-missing-execinfo_h.patch         |   0
 .../gcc/4.7.3/302-c99-snprintf.patch               |   0
 .../gcc/4.7.3/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.7.3/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.7.3/830-arm_unbreak_armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 .../gcc/4.8.1/100-uclibc-conf.patch                |   0
 .../gcc/4.8.1/301-missing-execinfo_h.patch         |   0
 .../gcc/4.8.1/302-c99-snprintf.patch               |   0
 .../gcc/4.8.1/305-libmudflap-susv3-legacy.patch    |   0
 .../gcc/4.8.1/810-arm-softfloat-libgcc.patch       |   0
 .../gcc/4.8.1/830-arm_unbreak_armv4t.patch         |   0
 .../powerpc-link-with-math-lib.patch.conditional   |   0
 toolchain/gcc/Config.in                            | 130 -----
 toolchain/gcc/Config.in.2                          |  34 --
 toolchain/gcc/gcc-uclibc-4.x.mk                    | 640 ---------------------
 toolchain/toolchain-buildroot.mk                   |   7 +-
 toolchain/toolchain-buildroot/Config.in            |   2 +-
 toolchain/toolchain-crosstool-ng.mk                |   1 -
 toolchain/toolchain-external.mk                    |   1 -
 toolchain/uClibc/uclibc.mk                         |  36 +-
 65 files changed, 23 insertions(+), 831 deletions(-)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch (100%)
 rename {toolchain => package}/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/gcc-43-pr39429.patch (100%)
 rename {toolchain => package}/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.4.7-arc/fix_branch_out_of_range.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/950-sparc-leon.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/gcc-44-pr39429.patch (100%)
 rename {toolchain => package}/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.5.4/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/820-arm-unbreak-armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/830-arm-pr43440.patch (100%)
 rename {toolchain => package}/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.6.4/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/820-arm-unbreak-armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.7.3/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/830-arm_unbreak_armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional (100%)
 rename {toolchain => package}/gcc/4.8.1/100-uclibc-conf.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/301-missing-execinfo_h.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/302-c99-snprintf.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/305-libmudflap-susv3-legacy.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/810-arm-softfloat-libgcc.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/830-arm_unbreak_armv4t.patch (100%)
 rename {toolchain => package}/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional (100%)
 delete mode 100644 toolchain/gcc/Config.in
 delete mode 100644 toolchain/gcc/Config.in.2
 delete mode 100644 toolchain/gcc/gcc-uclibc-4.x.mk

diff --git a/Makefile b/Makefile
index 509eab6..189a1db 100644
--- a/Makefile
+++ b/Makefile
@@ -224,7 +224,7 @@ BASE_TARGETS += host-ccache
 endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-BASE_TARGETS += uclibc-configured host-binutils cross_compiler uclibc-target-utils kernel-headers
+BASE_TARGETS += toolchain-buildroot
 else
 BASE_TARGETS += uclibc
 endif
diff --git a/package/Config.in b/package/Config.in
index ebeabeb..a30f0f3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -74,7 +74,6 @@ source "package/flex/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gawk/Config.in"
 endif
-source "toolchain/gcc/Config.in.2"
 source "package/gettext/Config.in"
 source "package/git/Config.in"
 source "package/gperf/Config.in"
diff --git a/toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch b/package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
similarity index 100%
rename from toolchain/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
rename to package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
diff --git a/toolchain/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch b/package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
similarity index 100%
rename from toolchain/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
rename to package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
diff --git a/toolchain/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch b/package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
similarity index 100%
rename from toolchain/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
rename to package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
diff --git a/toolchain/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch b/package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
similarity index 100%
rename from toolchain/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
rename to package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
diff --git a/toolchain/gcc/4.3.6/100-uclibc-conf.patch b/package/gcc/4.3.6/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/100-uclibc-conf.patch
rename to package/gcc/4.3.6/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch b/package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
rename to package/gcc/4.3.6/104-gnuhurd-uclibc-conf.patch
diff --git a/toolchain/gcc/4.3.6/301-missing-execinfo_h.patch b/package/gcc/4.3.6/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/301-missing-execinfo_h.patch
rename to package/gcc/4.3.6/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.3.6/302-c99-snprintf.patch b/package/gcc/4.3.6/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/302-c99-snprintf.patch
rename to package/gcc/4.3.6/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.3.6/305-libmudflap-susv3-legacy.patch b/package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.3.6/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.3.6/810-arm-softfloat-libgcc.patch b/package/gcc/4.3.6/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.3.6/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch b/package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
rename to package/gcc/4.3.6/993-arm_insn-opinit-RTX_CODE-fixup.patch
diff --git a/toolchain/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch b/package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
rename to package/gcc/4.3.6/998-gcc-4.3.0-fix-header.00.patch
diff --git a/toolchain/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch b/package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
rename to package/gcc/4.3.6/999-4.3.2-armeabi-aapcs-linux.patch
diff --git a/toolchain/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch b/package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
rename to package/gcc/4.3.6/999-4.3.3-arm-fix-for-bug-37436.patch
diff --git a/toolchain/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch b/package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
rename to package/gcc/4.3.6/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
diff --git a/toolchain/gcc/4.3.6/gcc-43-pr39429.patch b/package/gcc/4.3.6/gcc-43-pr39429.patch
similarity index 100%
rename from toolchain/gcc/4.3.6/gcc-43-pr39429.patch
rename to package/gcc/4.3.6/gcc-43-pr39429.patch
diff --git a/toolchain/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.3.6/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch b/package/gcc/4.4.7-arc/fix_branch_out_of_range.patch
similarity index 100%
rename from toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
rename to package/gcc/4.4.7-arc/fix_branch_out_of_range.patch
diff --git a/toolchain/gcc/4.4.7/100-uclibc-conf.patch b/package/gcc/4.4.7/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/100-uclibc-conf.patch
rename to package/gcc/4.4.7/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.7/301-missing-execinfo_h.patch b/package/gcc/4.4.7/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/301-missing-execinfo_h.patch
rename to package/gcc/4.4.7/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.7/302-c99-snprintf.patch b/package/gcc/4.4.7/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/302-c99-snprintf.patch
rename to package/gcc/4.4.7/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.7/305-libmudflap-susv3-legacy.patch b/package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.7/810-arm-softfloat-libgcc.patch b/package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.4.7/950-sparc-leon.patch b/package/gcc/4.4.7/950-sparc-leon.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/950-sparc-leon.patch
rename to package/gcc/4.4.7/950-sparc-leon.patch
diff --git a/toolchain/gcc/4.4.7/gcc-44-pr39429.patch b/package/gcc/4.4.7/gcc-44-pr39429.patch
similarity index 100%
rename from toolchain/gcc/4.4.7/gcc-44-pr39429.patch
rename to package/gcc/4.4.7/gcc-44-pr39429.patch
diff --git a/toolchain/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/4.5.4/100-uclibc-conf.patch b/package/gcc/4.5.4/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/100-uclibc-conf.patch
rename to package/gcc/4.5.4/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.5.4/301-missing-execinfo_h.patch b/package/gcc/4.5.4/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/301-missing-execinfo_h.patch
rename to package/gcc/4.5.4/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.5.4/302-c99-snprintf.patch b/package/gcc/4.5.4/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/302-c99-snprintf.patch
rename to package/gcc/4.5.4/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.5.4/305-libmudflap-susv3-legacy.patch b/package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.5.4/810-arm-softfloat-libgcc.patch b/package/gcc/4.5.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.5.4/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.5.4/820-arm-unbreak-armv4t.patch b/package/gcc/4.5.4/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/820-arm-unbreak-armv4t.patch
rename to package/gcc/4.5.4/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.5.4/830-arm-pr43440.patch b/package/gcc/4.5.4/830-arm-pr43440.patch
similarity index 100%
rename from toolchain/gcc/4.5.4/830-arm-pr43440.patch
rename to package/gcc/4.5.4/830-arm-pr43440.patch
diff --git a/toolchain/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/4.6.4/100-uclibc-conf.patch b/package/gcc/4.6.4/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/100-uclibc-conf.patch
rename to package/gcc/4.6.4/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.6.4/301-missing-execinfo_h.patch b/package/gcc/4.6.4/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/301-missing-execinfo_h.patch
rename to package/gcc/4.6.4/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.6.4/302-c99-snprintf.patch b/package/gcc/4.6.4/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/302-c99-snprintf.patch
rename to package/gcc/4.6.4/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.6.4/305-libmudflap-susv3-legacy.patch b/package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.6.4/810-arm-softfloat-libgcc.patch b/package/gcc/4.6.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.6.4/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.6.4/820-arm-unbreak-armv4t.patch b/package/gcc/4.6.4/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.6.4/820-arm-unbreak-armv4t.patch
rename to package/gcc/4.6.4/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/4.7.3/100-uclibc-conf.patch b/package/gcc/4.7.3/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/100-uclibc-conf.patch
rename to package/gcc/4.7.3/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.7.3/301-missing-execinfo_h.patch b/package/gcc/4.7.3/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/301-missing-execinfo_h.patch
rename to package/gcc/4.7.3/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.7.3/302-c99-snprintf.patch b/package/gcc/4.7.3/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/302-c99-snprintf.patch
rename to package/gcc/4.7.3/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.7.3/305-libmudflap-susv3-legacy.patch b/package/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.7.3/810-arm-softfloat-libgcc.patch b/package/gcc/4.7.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.7.3/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.7.3/830-arm_unbreak_armv4t.patch b/package/gcc/4.7.3/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.7.3/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.7.3/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/4.8.1/100-uclibc-conf.patch b/package/gcc/4.8.1/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/100-uclibc-conf.patch
rename to package/gcc/4.8.1/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.8.1/301-missing-execinfo_h.patch b/package/gcc/4.8.1/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/301-missing-execinfo_h.patch
rename to package/gcc/4.8.1/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.8.1/302-c99-snprintf.patch b/package/gcc/4.8.1/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/302-c99-snprintf.patch
rename to package/gcc/4.8.1/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.8.1/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.8.1/810-arm-softfloat-libgcc.patch b/package/gcc/4.8.1/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.8.1/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.8.1/830-arm_unbreak_armv4t.patch b/package/gcc/4.8.1/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.8.1/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.8.1/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
deleted file mode 100644
index 7830241..0000000
--- a/toolchain/gcc/Config.in
+++ /dev/null
@@ -1,130 +0,0 @@
-# Choose gcc version.
-
-comment "GCC Options"
-
-config BR2_GCC_NEEDS_MPC
-	bool
-
-choice
-	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
-	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
-	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_7_X
-	help
-	  Select the version of gcc you wish to use.
-
-	config BR2_GCC_VERSION_4_4_7_ARC
-		depends on BR2_arc
-		bool "gcc 4.4.7-arc"
-
-	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	       depends on BR2_avr32
-	       bool "gcc 4.2.2-avr32-2.1.5"
-
-	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
-		bool "gcc 4.3.x"
-
-	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
-		bool "gcc 4.4.x"
-
-	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.5.x"
-
-	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.6.x"
-
-	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.7.x"
-
-	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc 4.8.x"
-
-	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
-		select BR2_GCC_NEEDS_MPC
-		bool "gcc snapshot"
-endchoice
-
-config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
-	bool
-	default y if !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-
-config BR2_GCC_SNAP_DATE
-	string "GCC snapshot date"
-	default "4.8-20120429"
-	depends on BR2_GCC_VERSION_SNAP
-	help
-	  Enter snapshot date to use for gcc.
-	  Format is: A.B-YYYYMMDD
-
-	  A is GCC major version, for example 4.
-	  B is GCC minor version, for example 7.
-	  YYYYMMDD is snapshot date, for example 20110430.
-
-	  This way we'd get version 4.7-20110430
-
-config BR2_GCC_VERSION
-	string
-	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
-	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
-	default "4.4.7-arc" if BR2_GCC_VERSION_4_4_7_ARC
-	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
-	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
-	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
-	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
-
-config BR2_EXTRA_GCC_CONFIG_OPTIONS
-	string "Additional gcc options"
-	default ""
-	help
-	  Any additional gcc configure options you may want to include....
-
-config BR2_INSTALL_OBJC
-	bool "Build/install Objective-C compiler and runtime?"
-	depends on !BR2_avr32
-	help
-	  Build/install Objective-C compiler and runtime?
-
-config BR2_INSTALL_FORTRAN
-	bool "Build/install Fortran compiler and runtime?"
-	depends on !BR2_avr32
-	select BR2_PACKAGE_LIBMPFR
-	help
-	  Build/install Fortran compiler and runtime?
-	  Note that it is highly recommended NOT to use gfortran
-	  from gcc older than 4.2.0
-
-config BR2_GCC_SHARED_LIBGCC
-	bool "Build/install a shared libgcc?"
-	depends on !BR2_PREFER_STATIC_LIB
-	default y
-	depends on !BR2_sparc
-	help
-	  Build/install a shared libgcc library
-
-config BR2_GCC_ENABLE_TLS
-	bool "Enable compiler tls support"
-	default y
-	depends on BR2_PTHREADS_NATIVE
-	help
-	  Enable the compiler to generate code for accessing
-	  thread local storage variables
-
-config BR2_GCC_ENABLE_OPENMP
-	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc
-	help
-	  Enable OpenMP support for the compiler
diff --git a/toolchain/gcc/Config.in.2 b/toolchain/gcc/Config.in.2
deleted file mode 100644
index c8a8cf6..0000000
--- a/toolchain/gcc/Config.in.2
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_GCC_TARGET
-	bool "gcc"
-	# We no longer want to support a toolchain on the target
-	depends on BR2_DEPRECATED
-	depends on BR2_HAVE_DEVFILES && BR2_TOOLCHAIN_BUILDROOT
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_BINUTILS_TARGET
-	select BR2_PACKAGE_MPC if (BR2_GCC_VERSION_4_5_X || BR2_GCC_VERSION_4_6_X || BR2_GCC_VERSION_4_7_X || BR2_GCC_VERSION_SNAP)
-	select BR2_PACKAGE_MPFR
-	select BR2_PACKAGE_GMP
-	help
-	  If you want the target system to be able to run
-	  binutils/gcc and compile native code, say Y here.
-
-config BR2_GCC_CROSS_FORTRAN
-	bool "fortran support"
-	depends on !BR2_avr32 && BR2_PACKAGE_GCC_TARGET
-	help
-	  Build a Fortran compiler
-
-config BR2_GCC_CROSS_OBJC
-	bool "objective-c support"
-	depends on !BR2_avr32 && BR2_PACKAGE_GCC_TARGET
-	help
-	  Build an Objective-C compiler
-
-config BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS
-	string "Additional target gcc options"
-	default ""
-	depends on BR2_PACKAGE_GCC_TARGET
-	help
-	  Any additional target gcc options you may want to include....
-	  Including, but not limited to --disable-checking etc.
-	  Refer to */configure in your gcc sources.
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
deleted file mode 100644
index b1484eb..0000000
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ /dev/null
@@ -1,640 +0,0 @@
-################################################################################
-#
-# Makefile for to build a gcc/uClibc toolchain
-#
-# Copyright (C) 2002-2003 Erik Andersen <andersen@uclibc.org>
-# Copyright (C) 2004 Manuel Novoa III <mjn3@uclibc.org>
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-# General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write to the Free Software
-# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
-#
-################################################################################
-
-GCC_VERSION:=$(call qstrip,$(BR2_GCC_VERSION))
-
-ifeq ($(BR2_GCC_VERSION_SNAP),y)
-GCC_SNAP_DATE:=$(call qstrip,$(BR2_GCC_SNAP_DATE))
-else
-GCC_SNAP_DATE:=
-endif
-
-ifneq ($(GCC_SNAP_DATE),)
- GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
-else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
- GCC_SITE:=ftp://www.at91.com/pub/buildroot/
-else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
- GCC_SITE:=$(BR2_ARC_SITE)
-else
- GCC_SITE:=$(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
-endif
-
-GCC_SOURCE:=gcc-$(GCC_VERSION).tar.bz2
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
-GCC_DIR:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)
-GCC_CAT:=$(BZCAT)
-GCC_SRC_DIR:=$(GCC_DIR)
-
-# Branding works on >= 4.3
-ifneq ($(findstring x4.2.,x$(GCC_VERSION)),x4.2.)
-EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
-	--with-bugurl="http://bugs.buildroot.net/"
-endif
-
-# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
-# Workaround until it's fixed in 4.5.4 or later
-ifeq ($(ARCH),powerpc)
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_OPTSPACE=--disable-target-optspace
-endif
-else
-GCC_OPTSPACE=--enable-target-optspace
-endif
-
-# gcc 4.6.x quadmath requires wchar
-ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
-GCC_QUADMATH=--disable-libquadmath
-endif
-
-# Determine soft-float options
-ifeq ($(BR2_SOFT_FLOAT),y)
-# only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
-# powerpc seems to be needing it as well
-ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_powerpc)$(BR2_sparc),y)
-SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
-endif
-ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
-TARGET_SOFT_FLOAT:=-mfloat-abi=soft
-else
-TARGET_SOFT_FLOAT:=-msoft-float
-endif
-else # no softfloat support
-SOFT_FLOAT_CONFIG_OPTION:=
-TARGET_SOFT_FLOAT:=
-endif
-
-# Determine arch/tune/abi/cpu options
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
-endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
-else
-GCC_WITH_CPU:=--with-cpu=$(call qstrip,$(BR2_GCC_TARGET_CPU))
-endif
-endif
-
-# AVR32 GCC special configuration
-ifeq ($(BR2_avr32),y)
-# For the cross-compiler
-EXTRA_GCC_CONFIG_OPTIONS += \
-	--disable-libmudflap
-SOFT_FLOAT_CONFIG_OPTION:=
-
-# For the target compiler
-EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
-	--disable-libmudflap
-EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
-	--with-build-time-tools=$(STAGING_DIR)/$(GNU_TARGET_NAME)/bin
-EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
-	--with-as=$(TARGET_CROSS)as
-endif
-
-# Disable mudflap and enable proper double/long double for SPE ABI
-ifeq ($(BR2_powerpc_SPE),y)
-EXTRA_GCC_CONFIG_OPTIONS +=  \
-	--disable-libmudflap \
-	--enable-e500_double \
-	--with-long-double-128
-endif
-
-# End with user-provided options, so that they can override previously
-# defined options.
-EXTRA_GCC_CONFIG_OPTIONS += \
-	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
-EXTRA_TARGET_GCC_CONFIG_OPTIONS += \
-	$(call qstrip,$(BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS))
-
-################################################################################
-#
-# Setup some initial stuff
-#
-################################################################################
-
-GCC_STAGING_PREREQ+=$(STAGING_DIR)/usr/lib/libc.a
-
-GCC_TARGET_LANGUAGES:=c
-
-GCC_CROSS_LANGUAGES:=c
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),c++
-endif
-ifeq ($(BR2_GCC_CROSS_FORTRAN),y)
-GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),fortran
-endif
-ifeq ($(BR2_GCC_CROSS_OBJC),y)
-GCC_CROSS_LANGUAGES:=$(GCC_CROSS_LANGUAGES),objc
-endif
-
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),c++
-endif
-
-ifeq ($(BR2_INSTALL_OBJC),y)
-GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),objc
-endif
-
-ifeq ($(BR2_INSTALL_FORTRAN),y)
-GCC_TARGET_LANGUAGES:=$(GCC_TARGET_LANGUAGES),fortran
-endif
-
-# GCC 4.x prerequisites
-GCC_WITH_HOST_GMP = --with-gmp=$(HOST_DIR)/usr
-GCC_WITH_HOST_MPFR = --with-mpfr=$(HOST_DIR)/usr
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-gmp-source host-mpfr-source
-endif
-GCC_HOST_PREREQ = host-gmp host-mpfr
-GCC_TARGET_PREREQ += mpfr gmp
-
-ifeq ($(BR2_GCC_NEEDS_MPC),y)
-GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
-GCC_TARGET_PREREQ += mpc
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-mpc-source
-endif
-GCC_HOST_PREREQ += host-mpc
-endif
-
-ifeq ($(BR2_GCC_VERSION_4_4_7_ARC),y)
-GCC_HOST_PREREQ += host-flex host-bison
-endif
-
-ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-GCC_SHARED_LIBGCC:=--enable-shared
-else
-GCC_SHARED_LIBGCC:=--disable-shared
-endif
-
-ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-GCC_ENABLE_OPENMP:=--enable-libgomp
-else
-GCC_ENABLE_OPENMP:=--disable-libgomp
-endif
-
-ifeq ($(BR2_GCC_ENABLE_TLS),y)
-GCC_TLS:=--enable-tls
-else
-GCC_TLS:=--disable-tls
-endif
-
-ifeq ($(BR2_PTHREADS_NONE),y)
-THREADS:=--disable-threads --disable-libitm --disable-libatomic
-else
-THREADS:=--enable-threads
-endif
-
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-GCC_DECIMAL_FLOAT:=--disable-decimal-float
-endif
-
-# gcc version < 4.2.0 don't have -Wno-overlength-strings and the configure
-# script has problems detecting it, so help it
-ifeq ($(shell test $(HOSTCC_VERSION) -lt 420 && echo OLD),OLD)
-GCC_CONF_ENV:=acx_cv_prog_cc_pedantic__Wno_long_long__Wno_variadic_macros_____________Wno_overlength_strings=no \
-	acx_cv_prog_cc_warning__Wno_overlength_strings=no
-endif
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE+=gcc-source
-endif
-
-$(DL_DIR)/$(GCC_SOURCE):
-	mkdir -p $(DL_DIR)
-	$(Q)$(call MESSAGE,"Downloading gcc")
-	$(call DOWNLOAD,$(GCC_SITE:/=)/$(GCC_SOURCE))
-
-gcc-unpacked: $(GCC_DIR)/.patched
-$(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
-	$(Q)$(call MESSAGE,"Extracting gcc")
-	mkdir -p $(TOOLCHAIN_DIR)
-	rm -rf $(GCC_DIR)
-	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	$(call CONFIG_UPDATE,$(@D))
-ifneq ($(call qstrip, $(BR2_XTENSA_CORE_NAME)),)
-	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(call qstrip,\
-		$(BR2_XTENSA_CORE_NAME)).tar -C $(@D) --strip-components=1 gcc
-endif
-	touch $@
-
-gcc-patched: $(GCC_DIR)/.patched
-$(GCC_DIR)/.patched: $(GCC_DIR)/.unpacked
-	$(Q)$(call MESSAGE,"Patching gcc")
-	# Apply any files named gcc-*.patch from the source directory to gcc
-ifneq ($(wildcard $(GCC_PATCH_DIR)),)
-	support/scripts/apply-patches.sh $(GCC_DIR) $(GCC_PATCH_DIR) \*.patch
-endif
-
-ifeq ($(ARCH)-$(BR2_GCC_SHARED_LIBGCC),powerpc-y)
-ifneq ($(BR2_SOFT_FLOAT),)
-	support/scripts/apply-patches.sh $(GCC_DIR) toolchain/gcc/$(GCC_VERSION) powerpc-link-with-math-lib.patch.conditional
-endif
-endif
-	touch $@
-
-################################################################################
-#
-# build the first pass gcc compiler
-#
-################################################################################
-GCC_BUILD_DIR1:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-initial
-
-$(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
-	$(Q)$(call MESSAGE,"Configuring gcc pass-1")
-	mkdir -p $(GCC_BUILD_DIR1)
-	(cd $(GCC_BUILD_DIR1); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		MAKEINFO=missing \
-		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(HOST_DIR)/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-languages=c \
-		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-		--disable-__cxa_atexit \
-		$(GCC_OPTSPACE) \
-		$(GCC_QUADMATH) \
-		$(GCC_ENABLE_OPENMP) \
-		--with-gnu-ld \
-		--disable-shared \
-		--disable-libssp \
-		--without-headers \
-		--with-newlib \
-		--disable-multilib \
-		$(GCC_TLS) \
-		$(GCC_WITH_HOST_GMP) \
-		$(GCC_WITH_HOST_MPFR) \
-		$(GCC_WITH_HOST_MPC) \
-		$(DISABLE_NLS) \
-		$(THREADS) \
-		$(GCC_DECIMAL_FLOAT) \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
-		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS) \
-	)
-	touch $@
-
-$(GCC_BUILD_DIR1)/.compiled: $(GCC_BUILD_DIR1)/.configured
-	$(Q)$(call MESSAGE,"Building gcc pass-1")
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
-else
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
-endif
-	touch $@
-
-gcc_initial=$(GCC_BUILD_DIR1)/.installed
-$(gcc_initial) $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc: $(GCC_BUILD_DIR1)/.compiled
-	$(Q)$(call MESSAGE,"Installing gcc pass-1")
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
-	touch $(gcc_initial)
-
-gcc_initial: $(GCC_HOST_PREREQ) host-binutils $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
-
-gcc_initial-clean:
-	rm -rf $(GCC_BUILD_DIR1)
-
-gcc_initial-dirclean:
-	rm -rf $(GCC_BUILD_DIR1) $(GCC_DIR)
-
-################################################################################
-#
-# build the second pass gcc compiler
-#
-################################################################################
-GCC_BUILD_DIR2:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-intermediate
-
-# The --without-headers option stopped working with gcc 3.0 and has never been
-# fixed, so we need to actually have working C library header files prior to
-# the step or libgcc will not build...
-
-$(GCC_BUILD_DIR2)/.configured: $(GCC_DIR)/.patched
-	$(Q)$(call MESSAGE,"Configuring gcc pass-2")
-	mkdir -p $(GCC_BUILD_DIR2)
-	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		MAKEINFO=missing \
-		$(GCC_DIR)/configure $(QUIET) \
-		--prefix=$(HOST_DIR)/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-languages=c \
-		--with-sysroot=$(TOOLCHAIN_DIR)/uClibc_dev/ \
-		--disable-__cxa_atexit \
-		$(GCC_OPTSPACE) \
-		$(GCC_QUADMATH) \
-		$(GCC_ENABLE_OPENMP) \
-		--with-gnu-ld \
-		--enable-shared \
-		--disable-libssp \
-		--disable-multilib \
-		$(GCC_TLS) \
-		$(GCC_WITH_HOST_GMP) \
-		$(GCC_WITH_HOST_MPFR) \
-		$(GCC_WITH_HOST_MPC) \
-		$(DISABLE_NLS) \
-		$(THREADS) \
-		$(MULTILIB) \
-		$(GCC_DECIMAL_FLOAT) \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
-		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS) \
-	)
-	touch $@
-
-$(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
-	$(Q)$(call MESSAGE,"Building gcc pass-2")
-	# gcc >= 4.3.0 have to also build all-target-libgcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc all-target-libgcc
-else
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) all-gcc
-endif
-	touch $@
-
-gcc_intermediate=$(GCC_BUILD_DIR2)/.installed
-$(gcc_intermediate): $(GCC_BUILD_DIR2)/.compiled
-	$(Q)$(call MESSAGE,"Installing gcc pass-2")
-	# gcc >= 4.3.0 have to also install install-target-libgcc
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc install-target-libgcc
-else
-	$(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR2) install-gcc
-endif
-	touch $(gcc_intermediate)
-
-gcc_intermediate: uclibc-configured $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
-
-gcc_intermediate-clean:
-	rm -rf $(GCC_BUILD_DIR2)
-
-gcc_intermediate-dirclean:
-	rm -rf $(GCC_BUILD_DIR2) $(GCC_DIR)
-
-################################################################################
-#
-# third pass compiler build. Build the compiler targeting
-# the newly built shared uClibc library.
-#
-################################################################################
-#
-# Sigh... I had to rework things because using --with-gxx-include-dir
-# causes issues with include dir search order for g++. This seems to
-# have something to do with "path translations" and possibly doesn't
-# affect gcc-target. However, I haven't tested gcc-target yet so no
-# guarantees. mjn3
-
-GCC_BUILD_DIR3:=$(TOOLCHAIN_DIR)/gcc-$(GCC_VERSION)-final
-$(GCC_BUILD_DIR3)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
-	$(Q)$(call MESSAGE,"Configuring gcc final")
-	mkdir -p $(GCC_BUILD_DIR3)
-	# Important! Required for limits.h to be fixed.
-	ln -snf ../include/ $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/sys-include
-	(cd $(GCC_BUILD_DIR3); rm -rf config.cache; \
-		$(HOST_CONFIGURE_OPTS) \
-		MAKEINFO=missing \
-		$(GCC_SRC_DIR)/configure $(QUIET) \
-		--prefix=$(HOST_DIR)/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_HOST_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-languages=$(GCC_CROSS_LANGUAGES) \
-		--with-sysroot=$(STAGING_DIR) \
-		--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin \
-		--disable-__cxa_atexit \
-		$(GCC_OPTSPACE) \
-		$(GCC_QUADMATH) \
-		$(GCC_ENABLE_OPENMP) \
-		--with-gnu-ld \
-		--disable-libssp \
-		--disable-multilib \
-		$(GCC_TLS) \
-		$(GCC_SHARED_LIBGCC) \
-		$(GCC_WITH_HOST_GMP) \
-		$(GCC_WITH_HOST_MPFR) \
-		$(GCC_WITH_HOST_MPC) \
-		$(DISABLE_NLS) \
-		$(THREADS) \
-		$(GCC_DECIMAL_FLOAT) \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
-		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS) \
-	)
-	touch $@
-
-$(GCC_BUILD_DIR3)/.compiled: $(GCC_BUILD_DIR3)/.configured
-	$(Q)$(call MESSAGE,"Building gcc final")
-	$(GCC_CONF_ENV) $(HOST_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR3) all
-	touch $@
-
-$(GCC_BUILD_DIR3)/.installed: $(GCC_BUILD_DIR3)/.compiled
-	$(Q)$(call MESSAGE,"Installing gcc final")
-	$(HOST_MAKE_ENV) $(MAKE) \
-		-C $(GCC_BUILD_DIR3) install
-	if [ -d "$(STAGING_DIR)/lib64" ]; then \
-		if [ ! -e "$(STAGING_DIR)/lib" ]; then \
-			mkdir -p "$(STAGING_DIR)/lib"; \
-		fi; \
-		mv "$(STAGING_DIR)/lib64/"* "$(STAGING_DIR)/lib/"; \
-		rmdir "$(STAGING_DIR)/lib64"; \
-		rm "$(STAGING_DIR)/usr/$(GNU_TARGET_NAME)/lib64";\
-	fi
-	# Make sure we have 'cc'.
-	if [ ! -e $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc ]; then \
-		ln -snf $(GNU_TARGET_NAME)-gcc \
-			$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-cc; \
-	fi
-	if [ ! -e $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc ]; then \
-		ln -snf gcc $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin/cc; \
-	fi
-	# arch-linux-* symlinks
-	cd $(HOST_DIR)/usr/bin; for i in $(GNU_TARGET_NAME)-*; do \
-		ln -snf $$i $(ARCH)-linux$${i##$(GNU_TARGET_NAME)}; \
-	done
-
-	mkdir -p $(TARGET_DIR)/usr/lib $(TARGET_DIR)/usr/sbin
-	touch $@
-
-$(STAMP_DIR)/gcc_libs_target_installed: $(GCC_BUILD_DIR3)/.installed
-	$(Q)$(call MESSAGE,"Installing gcc final libraries to staging and target")
-ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-	# These go in /lib, so...
-	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
-		$(STAGING_DIR)/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
-		$(TARGET_DIR)/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/lib/libgcc_s*
-endif
-ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
-	mkdir -p $(TARGET_DIR)/usr/lib
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libstdc++.so* \
-		$(STAGING_DIR)/usr/lib/
-	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libstdc++.so* \
-		$(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libstdc++.so*
-endif
-endif
-ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
-	cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgomp.so* $(STAGING_DIR)/usr/lib/
-	cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgomp.so* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libgomp.so*
-endif
-	mkdir -p $(@D)
-	touch $@
-
-cross_compiler:=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc
-cross_compiler gcc: gcc_intermediate \
-	uclibc $(GCC_BUILD_DIR3)/.installed \
-	$(STAMP_DIR)/gcc_libs_target_installed
-
-gcc-source: $(DL_DIR)/$(GCC_SOURCE)
-
-gcc-clean:
-	rm -rf $(GCC_BUILD_DIR3)
-	for prog in cpp gcc gcc-[0-9]* protoize unprotoize gcov gccbug cc; do \
-		rm -f $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-$$prog; \
-	done
-
-gcc-dirclean: gcc_initial-dirclean
-	rm -rf $(GCC_BUILD_DIR3)
-
-################################################################################
-#
-# Next build target gcc compiler
-#
-################################################################################
-GCC_BUILD_DIR4:=$(BUILD_DIR)/gcc-$(GCC_VERSION)-target
-
-$(GCC_BUILD_DIR4)/.prepared: $(STAMP_DIR)/gcc_libs_target_installed
-	mkdir -p $(GCC_BUILD_DIR4)
-	touch $@
-
-$(GCC_BUILD_DIR4)/.configured: $(GCC_BUILD_DIR4)/.prepared
-	$(Q)$(call MESSAGE,"Configuring gcc on target")
-	(cd $(GCC_BUILD_DIR4); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-		CXXFLAGS_FOR_TARGET="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-		CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-		BOOT_CFLAGS="$(TARGET_CFLAGS) $(TARGET_SOFT_FLOAT)" \
-		GCC_FOR_TARGET="$(TARGET_CC)" \
-		CC_FOR_TARGET="$(TARGET_CC)" \
-		CXX_FOR_TARGET="$(TARGET_CXX)" \
-		$(GCC_SRC_DIR)/configure $(QUIET) \
-		--prefix=/usr \
-		--build=$(GNU_HOST_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--target=$(GNU_TARGET_NAME) \
-		--enable-languages=$(GCC_TARGET_LANGUAGES) \
-		--with-gxx-include-dir=/usr/include/c++ \
-		--disable-__cxa_atexit \
-		$(GCC_OPTSPACE) \
-		$(GCC_QUADMATH) \
-		$(GCC_ENABLE_OPENMP) \
-		--with-gnu-ld \
-		--disable-libssp \
-		--disable-multilib \
-		$(GCC_TLS) \
-		$(GCC_SHARED_LIBGCC) \
-		$(DISABLE_NLS) \
-		$(THREADS) \
-		$(GCC_DECIMAL_FLOAT) \
-		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) $(GCC_WITH_CPU) \
-		$(DISABLE_LARGEFILE) \
-		$(EXTRA_GCC_CONFIG_OPTIONS) \
-		$(EXTRA_TARGET_GCC_CONFIG_OPTIONS) \
-	)
-	touch $@
-
-$(GCC_BUILD_DIR4)/.compiled: $(GCC_BUILD_DIR4)/.configured
-	$(Q)$(call MESSAGE,"Building gcc on target")
-	$(TARGET_MAKE_ENV) \
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(GCC_BUILD_DIR4) all
-	touch $@
-
-GCC_LIB_SUBDIR=lib/gcc/$(GNU_TARGET_NAME)/$(GCC_VERSION)
-ifeq ($(findstring x4.2,x$(GCC_VERSION)),x4.2)
-GCC_INCLUDE_DIR:=include
-else
-GCC_INCLUDE_DIR:=include-fixed
-endif
-
-$(TARGET_DIR)/usr/bin/gcc: $(GCC_BUILD_DIR4)/.compiled
-	$(Q)$(call MESSAGE,"Installing gcc on target")
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
-		$(MAKE1) -C $(GCC_BUILD_DIR4) install
-	# Remove broken specs file (cross compile flag is set).
-	rm -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/specs
-
-	# Remove useless copies of gcc, c++, g++
-	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-gcc*
-	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-g++*
-	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)-c++*
-
-	# Work around problem of missing syslimits.h
-	if [ ! -f $(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h ]; then \
-		echo "warning: working around missing syslimits.h"; \
-		cp -f $(HOST_DIR)/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/syslimits.h \
-			$(TARGET_DIR)/usr/$(GCC_LIB_SUBDIR)/$(GCC_INCLUDE_DIR)/; \
-	fi
-
-	# Make sure we have 'cc'.
-	if [ ! -e $(TARGET_DIR)/usr/bin/cc ]; then \
-		ln -snf gcc $(TARGET_DIR)/usr/bin/cc; \
-	fi
-
-	# Copy C runtime initialization object files
-	cp -f $(STAGING_DIR)/usr/lib/*crt*.o $(TARGET_DIR)/usr/lib
-
-	# These are in /lib, so...
-	rm -rf $(TARGET_DIR)/usr/lib/libgcc_s*.so*
-	touch -c $@
-
-gcc_target: $(STAMP_DIR)/gcc_libs_target_installed $(GCC_TARGET_PREREQ) binutils $(TARGET_DIR)/usr/bin/gcc
-
-gcc_target-clean:
-	rm -rf $(GCC_BUILD_DIR4)
-	rm -f $(TARGET_DIR)/usr/bin/$(GNU_TARGET_NAME)*
-
-gcc_target-dirclean:
-	rm -rf $(GCC_BUILD_DIR4)
-
-ifeq ($(BR2_PACKAGE_GCC_TARGET),y)
-TARGETS+=gcc_target
-endif
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index a8dd58b..b2eb9de 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,4 +1,9 @@
 # Include files required for the internal toolchain backend
 
-include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/uClibc/uclibc.mk
+
+# Triggerring the build of the host-gcc-final will automaticaly do the
+# build of binutils, uClibc, kernel headers and all the intermediate
+# gcc steps.
+
+toolchain-buildroot: host-gcc-final
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 3d70fa1..4ad0603 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -4,5 +4,5 @@ if BR2_TOOLCHAIN_BUILDROOT
 source "package/linux-headers/Config.in.host"
 source "toolchain/uClibc/Config.in"
 source "package/binutils/Config.in.host"
-source "toolchain/gcc/Config.in"
+source "package/gcc/Config.in.host"
 endif
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index 4f9c29c..6ef73bb 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -2,6 +2,5 @@
 
 # Explicit ordering:
 include toolchain/helpers.mk
-include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 40fc633..1198a57 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -1,6 +1,5 @@
 # Required includes for the external toolchain backend
 
 include toolchain/helpers.mk
-include toolchain/gcc/gcc-uclibc-4.x.mk
 include toolchain/toolchain-external/ext-tool.mk
 include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index e06fafc..06f5b23 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -394,14 +394,14 @@ endif
 $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	$(Q)$(call MESSAGE,"Configuring uClibc")
 	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
-	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/include
-	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib
-	mkdir -p $(TOOLCHAIN_DIR)/uClibc_dev/lib
+	mkdir -p $(STAGING_DIR)/usr/include
+	mkdir -p $(STAGING_DIR)/usr/lib
+	mkdir -p $(STAGING_DIR)/lib
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
@@ -430,26 +430,20 @@ $(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
 	$(Q)$(call MESSAGE,"Installing uClibc headers")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" headers \
 		lib/crt1.o lib/crti.o lib/crtn.o \
 		install_headers
-	# Install the kernel headers to the first stage gcc include dir
-	# if necessary
-	if [ ! -f $(TOOLCHAIN_DIR)/uClibc_dev/usr/include/linux/version.h ]; then \
-		cp -pLR $(STAGING_DIR)/usr/include/* \
-			$(TOOLCHAIN_DIR)/uClibc_dev/usr/include/; \
-	fi
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libc.so
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/libm.so
-	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(TOOLCHAIN_DIR)/uClibc_dev/usr/lib/
+	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
+	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
+	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(STAGING_DIR)/usr/lib/
 	touch $@
 
-$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate)
+$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(HOST_GCC_INTERMEDIATE_TARGET_INSTALL_HOST)
 	$(Q)$(call MESSAGE,"Building uClibc")
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
@@ -465,9 +459,9 @@ $(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(gcc_intermediate)
 uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
 	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		PREFIX=$(STAGING_DIR) \
 		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
 		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
 		HOSTCC="$(HOSTCC)" \
@@ -530,7 +524,7 @@ UCLIBC_TARGETS+=uclibc-test
 endif
 endif
 
-uclibc: $(gcc_intermediate) $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
+uclibc: host-gcc-intermediate $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
 
 uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
 
@@ -543,7 +537,7 @@ uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
 uclibc-update-config: uclibc-config
 	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
 
-uclibc-configured: gcc_initial linux-headers $(UCLIBC_DIR)/.configured
+uclibc-configured: host-gcc-initial linux-headers $(UCLIBC_DIR)/.configured
 
 uclibc-configured-source: uclibc-source
 
-- 
1.8.1.2
