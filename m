From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Apr 2020 12:18:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/libmad: switch to debian to fix CVEs
In-Reply-To: <20200412101845.1013976-1-fontaine.fabrice@gmail.com>
References: <20200412101845.1013976-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412101845.1013976-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream libmad is dead since 2004 so switch to debian package to get
two patches that fix the following CVEs:
 - CVE-2017-8372: The mad_layer_III function in layer3.c in Underbit MAD
   libmad 0.15.1b, if NDEBUG is omitted, allows remote attackers to
   cause a denial of service (assertion failure and application exit)
   via a crafted audio file.
 - CVE-2017-8373: The mad_layer_III function in layer3.c in Underbit MAD
   libmad 0.15.1b allows remote attackers to cause a denial of service
   (heap-based buffer overflow and application crash) or possibly have
   unspecified other impact via a crafted audio file.
 - CVE-2017-8374: The mad_bit_skip function in bit.c in Underbit MAD
   libmad 0.15.1b allows remote attackers to cause a denial of service
   (heap-based buffer over-read and application crash) via a crafted
   audio file.

Moreover:
 - Remove third patch (replaced by optimize.diff debian patch)
 - Remove fourth patch (same patch than
   Provide-Thumb-2-alternative-code-for-MAD_F_MLN.diff)
 - Remove fifth patch (same patch than libmad.thumb.diff)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ... 0002-configure-ac-automake-foreign.patch} |  0
 .../0003-remove-deprecated-cflags.patch       | 33 ---------------
 package/libmad/0004-thumb2-fixed-arm.patch    | 40 -------------------
 package/libmad/0005-thumb2-imdct-arm.patch    | 20 ----------
 package/libmad/libmad.hash                    |  8 ++--
 package/libmad/libmad.mk                      | 21 ++++++++--
 6 files changed, 23 insertions(+), 99 deletions(-)
 rename package/libmad/{0006-configure-ac-automake-foreign.patch => 0002-configure-ac-automake-foreign.patch} (100%)
 delete mode 100644 package/libmad/0003-remove-deprecated-cflags.patch
 delete mode 100644 package/libmad/0004-thumb2-fixed-arm.patch
 delete mode 100644 package/libmad/0005-thumb2-imdct-arm.patch

diff --git a/package/libmad/0006-configure-ac-automake-foreign.patch b/package/libmad/0002-configure-ac-automake-foreign.patch
similarity index 100%
rename from package/libmad/0006-configure-ac-automake-foreign.patch
rename to package/libmad/0002-configure-ac-automake-foreign.patch
diff --git a/package/libmad/0003-remove-deprecated-cflags.patch b/package/libmad/0003-remove-deprecated-cflags.patch
deleted file mode 100644
index e5040830f9..0000000000
--- a/package/libmad/0003-remove-deprecated-cflags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-libmad: remove deprecated cflags (-fforce-mem)
-
-fforce-mem has long been deprecated, and is completely removed from
-gcc 4.3.x on.
----
- configure    |    1 -
- configure.ac |    1 -
- 2 files changed, 2 deletions(-)
-
-Index: libmad-0.15.1b/configure.ac
-===================================================================
---- libmad-0.15.1b.orig/configure.ac
-+++ libmad-0.15.1b/configure.ac
-@@ -140,7 +140,6 @@
-     case "$optimize" in
- 	-O|"-O "*)
- 	    optimize="-O"
--	    optimize="$optimize -fforce-mem"
- 	    optimize="$optimize -fforce-addr"
- 	    : #x optimize="$optimize -finline-functions"
- 	    : #- optimize="$optimize -fstrength-reduce"
-Index: libmad-0.15.1b/configure
-===================================================================
---- libmad-0.15.1b.orig/configure
-+++ libmad-0.15.1b/configure
-@@ -19099,7 +19099,6 @@
-     case "$optimize" in
- 	-O|"-O "*)
- 	    optimize="-O"
--	    optimize="$optimize -fforce-mem"
- 	    optimize="$optimize -fforce-addr"
- 	    : #x optimize="$optimize -finline-functions"
- 	    : #- optimize="$optimize -fstrength-reduce"
diff --git a/package/libmad/0004-thumb2-fixed-arm.patch b/package/libmad/0004-thumb2-fixed-arm.patch
deleted file mode 100644
index befda48d7e..0000000000
--- a/package/libmad/0004-thumb2-fixed-arm.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Fixes Thumb2-related build failure
-
-Patch below comes from the Debian libmad package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-From: Dave Martin
-Subject: "rsc" doesnt exist anymore in thumb2
-
-diff --git a/fixed.h b/fixed.h
-index 4b58abf..ba4bc26 100644
---- a/fixed.h
-+++ b/fixed.h
-@@ -275,12 +275,25 @@ mad_fixed_t mad_f_mul_inline(mad_fixed_t x, mad_fixed_t y)
- 	 : "+r" (lo), "+r" (hi)  \
- 	 : "%r" (x), "r" (y))
- 
-+#ifdef __thumb__
-+/* In Thumb-2, the RSB-immediate instruction is only allowed with a zero
-+	operand.  If needed this code can also support Thumb-1 
-+	(simply append "s" to the end of the second two instructions). */
-+#  define MAD_F_MLN(hi, lo)  \
-+    asm ("rsbs        %0, %0, #0\n\t"  \
-+	 "sbc   %1, %1, %1\n\t"  \
-+	 "sub   %1, %1, %2"  \
-+	 : "+&r" (lo), "=&r" (hi)  \
-+	 : "r" (hi)  \
-+	 : "cc")
-+#else /* ! __thumb__ */
- #  define MAD_F_MLN(hi, lo)  \
-     asm ("rsbs	%0, %2, #0\n\t"  \
- 	 "rsc	%1, %3, #0"  \
--	 : "=r" (lo), "=r" (hi)  \
-+	 : "=&r" (lo), "=r" (hi)  \
- 	 : "0" (lo), "1" (hi)  \
- 	 : "cc")
-+#endif /* __thumb__ */
- 
- #  define mad_f_scale64(hi, lo)  \
-     ({ mad_fixed_t __result;  \
diff --git a/package/libmad/0005-thumb2-imdct-arm.patch b/package/libmad/0005-thumb2-imdct-arm.patch
deleted file mode 100644
index 414b9c8fcf..0000000000
--- a/package/libmad/0005-thumb2-imdct-arm.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Fixes Thumb2 related build failure
-
-Patch below comes from the Debian libmad package.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-From: Konstantinos Margaritis <markos@debian.org>
-Subject: use "adr" instead of "add" to make code ready for thumb2
-
---- ./imdct_l_arm.S.orig	2010-02-25 13:25:23.000000000 +0100
-+++ ./imdct_l_arm.S	2010-02-25 13:27:26.000000000 +0100
-@@ -468,7 +468,7 @@
- 
-     @----
- 
--    add     r2, pc, #(imdct36_long_karray-.-8)  @ r2 = base address of Knn array (PIC safe ?)
-+    adr     r2, imdct36_long_karray
- 
- 
- loop:
diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
index 8b7859395f..2be1a8a3a8 100644
--- a/package/libmad/libmad.hash
+++ b/package/libmad/libmad.hash
@@ -1,4 +1,6 @@
-# Locally computed:
-sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad-0.15.1b.tar.gz
-sha256  0e21f2c6b19337d0b237dacc04f7b90a56be7f359f4c9a2ee0b202d9af0cfa69  frame_length.diff
+# From http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.dsc
+sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad_0.15.1b.orig.tar.gz
+sha256  dfeabd5d2398bf902660edc31f87ad40600f0aa732b946f864d8ee6bbf56a99c  libmad_0.15.1b-10.diff.gz
+
+# Hash for license file:
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index b1c9cee5ac..33134e26d4 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -5,12 +5,27 @@
 ################################################################################
 
 LIBMAD_VERSION = 0.15.1b
-LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
+LIBMAD_PATCH = libmad_$(LIBMAD_VERSION)-10.diff.gz
+LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.gz
+LIBMAD_SITE = \
+	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad
 LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
-LIBMAD_PATCH = \
-	https://sources.debian.net/data/main/libm/libmad/0.15.1b-8/debian/patches/frame_length.diff
+
+define LIBMAD_APPLY_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.patch; \
+	fi
+endef
+
+LIBMAD_POST_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
+
+# debian/patches/md_size.diff
+LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
+
+# debian/patches/length-check.patch
+LIBMAD_IGNORE_CVES += CVE-2017-8374
 
 # Force autoreconf to be able to use a more recent libtool script, that
 # is able to properly behave in the face of a missing C++ compiler.
-- 
2.25.1
