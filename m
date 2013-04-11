From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 21:18:54 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: bump 4.7.x series to 4.7.3
Message-ID: <20130411211021.A53189B5A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15ada1c1846a243893f5e734fbb5039aa8e4b1a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.7.2 => 4.7.3}/100-uclibc-conf.patch     |    0
 .../{4.7.2 => 4.7.3}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.7.2 => 4.7.3}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.7.2 => 4.7.3}/830-arm_unbreak_armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |   80 ++++++++++----------
 toolchain/gcc/Config.in                            |    2 +-
 8 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/toolchain/gcc/4.7.2/100-uclibc-conf.patch b/toolchain/gcc/4.7.3/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/100-uclibc-conf.patch
rename to toolchain/gcc/4.7.3/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.7.2/301-missing-execinfo_h.patch b/toolchain/gcc/4.7.3/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.7.3/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.7.2/302-c99-snprintf.patch b/toolchain/gcc/4.7.3/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/302-c99-snprintf.patch
rename to toolchain/gcc/4.7.3/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.7.2/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.7.3/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.7.2/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.7.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.7.3/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.7.2/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.7.3/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.7.2/830-arm_unbreak_armv4t.patch
rename to toolchain/gcc/4.7.3/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.7.2/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
similarity index 73%
rename from toolchain/gcc/4.7.2/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
index 7e75e87..2554263 100644
--- a/toolchain/gcc/4.7.2/powerpc-link-with-math-lib.patch.conditional
+++ b/toolchain/gcc/4.7.3/powerpc-link-with-math-lib.patch.conditional
@@ -6,11 +6,13 @@ contains unresolved symbols, any attempt to link against libgcc_s
 without explicitely specifying -lm fails, resulting in a broken
 bootstrap of the compiler.
 
-Forward port to gcc 4.5.1 by Gustavo Zacarias <gustavo@zacarias.com.ar>
+Forward ported to gcc 4.7.3
 
-diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-slibgcc-elf-ver
---- gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:08.644904042 -0300
-+++ gcc-4.5.1/gcc/config/t-slibgcc-elf-ver	2010-11-03 14:35:56.332904024 -0300
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura gcc-4.7.3.orig/libgcc/config/t-slibgcc gcc-4.7.3/libgcc/config/t-slibgcc
+--- gcc-4.7.3.orig/libgcc/config/t-slibgcc	2013-04-11 15:23:46.491571116 -0300
++++ gcc-4.7.3/libgcc/config/t-slibgcc	2013-04-11 15:25:06.241141824 -0300
 @@ -27,7 +27,7 @@
  SHLIB_OBJS = @shlib_objs@
  SHLIB_DIR = @multilib_dir@
@@ -19,43 +21,20 @@ diff -Nura gcc-4.5.1.orig/gcc/config/t-slibgcc-elf-ver gcc-4.5.1/gcc/config/t-sl
 +SHLIB_LC = @libgcc_libm@ -lc
  SHLIB_MAKE_SOLINK = $(LN_S) $(SHLIB_SONAME) $(SHLIB_DIR)/$(SHLIB_SOLINK)
  SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_SONAME) \
- 	$$(DESTDIR)$$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
-diff -Nura gcc-4.5.1.orig/libgcc/Makefile.in gcc-4.5.1/libgcc/Makefile.in
---- gcc-4.5.1.orig/libgcc/Makefile.in	2010-11-03 14:32:44.272904042 -0300
-+++ gcc-4.5.1/libgcc/Makefile.in	2010-11-03 14:37:03.893904042 -0300
-@@ -39,6 +39,7 @@
- decimal_float = @decimal_float@
- enable_decimal_float = @enable_decimal_float@
- fixed_point = @fixed_point@
-+LIBGCC_LIBM = @LIBGCC_LIBM@
- 
- host_noncanonical = @host_noncanonical@
- 
-@@ -798,9 +799,10 @@
- 		@multilib_dir@,$(MULTIDIR),$(subst \
- 		@shlib_objs@,$(objects),$(subst \
- 		@shlib_base_name@,libgcc_s,$(subst \
-+		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
- 		@shlib_map_file@,$(mapfile),$(subst \
- 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
--		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
-+		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
- 
- libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
- 	# @multilib_flags@ is still needed because this may use
-diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
---- gcc-4.5.1.orig/libgcc/configure	2010-11-03 14:32:44.283904042 -0300
-+++ gcc-4.5.1/libgcc/configure	2010-11-03 14:39:48.685904042 -0300
-@@ -557,6 +557,7 @@
- extra_parts
+ 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+diff -Nura gcc-4.7.3.orig/libgcc/configure gcc-4.7.3/libgcc/configure
+--- gcc-4.7.3.orig/libgcc/configure	2013-04-11 15:23:46.551573051 -0300
++++ gcc-4.7.3/libgcc/configure	2013-04-11 15:25:06.243141875 -0300
+@@ -563,6 +563,7 @@
  tmake_file
+ sfp_machine_header
  set_use_emutls
 +LIBGCC_LIBM
  set_have_cc_tls
  vis_hide
  fixed_point
-@@ -3847,6 +3848,37 @@
-   set_use_emutls="-DUSE_EMUTLS"
+@@ -4445,6 +4446,37 @@
+ 	fi
  fi
  
 +# On powerpc libgcc_s references copysignl which is a libm function but
@@ -92,10 +71,10 @@ diff -Nura gcc-4.5.1.orig/libgcc/configure gcc-4.5.1/libgcc/configure
  
  # Conditionalize the makefile for this target machine.
  tmake_file_=
-diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
---- gcc-4.5.1.orig/libgcc/configure.ac	2010-11-03 14:32:44.735904042 -0300
-+++ gcc-4.5.1/libgcc/configure.ac	2010-11-03 14:42:11.278904045 -0300
-@@ -238,6 +238,27 @@
+diff -Nura gcc-4.7.3.orig/libgcc/configure.ac gcc-4.7.3/libgcc/configure.ac
+--- gcc-4.7.3.orig/libgcc/configure.ac	2013-04-11 15:23:46.551573051 -0300
++++ gcc-4.7.3/libgcc/configure.ac	2013-04-11 15:25:06.244141901 -0300
+@@ -324,6 +324,27 @@
  fi
  AC_SUBST(set_have_cc_tls)
  
@@ -123,3 +102,26 @@ diff -Nura gcc-4.5.1.orig/libgcc/configure.ac gcc-4.5.1/libgcc/configure.ac
  # See if we have emulated thread-local storage.
  GCC_CHECK_EMUTLS
  set_use_emutls=
+diff -Nura gcc-4.7.3.orig/libgcc/Makefile.in gcc-4.7.3/libgcc/Makefile.in
+--- gcc-4.7.3.orig/libgcc/Makefile.in	2013-04-11 15:23:46.537572599 -0300
++++ gcc-4.7.3/libgcc/Makefile.in	2013-04-11 15:25:06.241141824 -0300
+@@ -41,6 +41,7 @@
+ decimal_float = @decimal_float@
+ enable_decimal_float = @enable_decimal_float@
+ fixed_point = @fixed_point@
++LIBGCC_LIBM = @LIBGCC_LIBM@
+ 
+ host_noncanonical = @host_noncanonical@
+ target_noncanonical = @target_noncanonical@
+@@ -928,9 +929,10 @@
+ 		@multilib_dir@,$(MULTIDIR),$(subst \
+ 		@shlib_objs@,$(objects) libgcc.a,$(subst \
+ 		@shlib_base_name@,libgcc_s,$(subst \
++		@libgcc_libm@,$(LIBGCC_LIBM),$(subst \
+ 		@shlib_map_file@,$(mapfile),$(subst \
+ 		@shlib_slibdir_qual@,$(MULTIOSSUBDIR),$(subst \
+-		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK))))))))
++		@shlib_slibdir@,$(shlib_slibdir),$(SHLIB_LINK)))))))))
+ 
+ libunwind$(SHLIB_EXT): $(libunwind-s-objects) $(extra-parts)
+ 	# @multilib_flags@ is still needed because this may use
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 527288f..5dd37ce 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -76,7 +76,7 @@ config BR2_GCC_VERSION
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
-	default "4.7.2"     if BR2_GCC_VERSION_4_7_X
+	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.0"     if BR2_GCC_VERSION_4_8_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
