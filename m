From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 17 Aug 2016 07:51:39 +0200
Subject: [Buildroot] [PATCH v3] bfin: fix issues with internal toolchain
Message-ID: <20160817055139.GA21004@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The three patches allow to compile applications using TLS emulation from
libgcc or C++ applications.

The 892-fix-dwarf-fdpic.patch patch allows to build DWARF in FDPIC
mode. It seems to be a bit rotting problem in latest gcc.
See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468

The 893-libgcc_linker-script.patch installs a libgcc.so linker script,
as some of the functions in libgcc.a are not available in libgcc_s.so.1.
See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=40134

The last one 894-bfin-libgcc-workaround.patch is a ugly workaround, but required
to get all required symbols in libgcc_s.so.1 to be exported (binding GLOBAL)
and so can be used by linking applications using any functionality from it. The
libgcc.map version script for the linker is constructed from some fragments
while compiling libgcc and preprocessed in the patch to remove the user prefix.
Upstream binutils was fixed with this here:
https://sourceware.org/ml/binutils/2010-12/msg00356.html
But unfortunately the required change in GCC was never made!
The bug was reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=74748

Symbol versioning need to be disabled for a working C++ compiler.
The commit 33d8cce322096836166efb905503524bda1e3d2f can be reverted.

Fixes:
  (alsa-lib emutls)
  http://autobuild.buildroot.net/results/8544ce58d75820666579db93a25ca5656a8efa8e/
  (cairo emutls)
  http://autobuild.buildroot.net/results/88b02a5dd5408318941ccbfcea0a9cbaa331500a/
  (audiofile c++)
  http://autobuild.buildroot.net/results/394e530c5dcd9ccb590eb151aeaadb37d11e0e39/
  (assimp c++)
  http://autobuild.buildroot.net/results/01f4be126c2d786a5ad7f220c2cf60539888a480/
  (bellagio c++)
  http://autobuild.buildroot.net/results/ada/ada44228bf13ec05382275bd6571396f5ba2b1f7/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/6.1.0/892-disable-dwarf-bfin.patch     | 24 --------------
 package/gcc/6.1.0/892-fix-dwarf-fdpic.patch        | 37 ++++++++++++++++++++++
 package/gcc/6.1.0/893-libgcc_linker-script.patch   | 16 ++++++++++
 package/gcc/6.1.0/894-bfin-libgcc-workaround.patch | 22 +++++++++++++
 package/gcc/gcc-final/gcc-final.mk                 |  4 +++
 5 files changed, 79 insertions(+), 24 deletions(-)
 delete mode 100644 package/gcc/6.1.0/892-disable-dwarf-bfin.patch
 create mode 100644 package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
 create mode 100644 package/gcc/6.1.0/893-libgcc_linker-script.patch
 create mode 100644 package/gcc/6.1.0/894-bfin-libgcc-workaround.patch

diff --git a/package/gcc/6.1.0/892-disable-dwarf-bfin.patch b/package/gcc/6.1.0/892-disable-dwarf-bfin.patch
deleted file mode 100644
index ebd31a1..0000000
--- a/package/gcc/6.1.0/892-disable-dwarf-bfin.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Dwarf support does not compile on Blackfin
-
-Reported upstream:
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68468
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-
-diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
---- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
-+++ gcc-6.1.0/libgcc/config.host	2016-05-12 19:26:30.973350274 +0200
-@@ -230,6 +230,13 @@
-       ;;
-   esac
-   ;;
-+bfin-*-*linux*)
-+  tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
-+  extra_parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o"
-+  if test x$enable_vtable_verify = xyes; then
-+    extra_parts="$extra_parts vtv_start.o vtv_end.o vtv_start_preinit.o vtv_end_preinit.o"
-+  fi
-+  ;;
- *-*-linux* | frv-*-*linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu | *-*-gnu* | *-*-kopensolaris*-gnu)
-   tmake_file="$tmake_file t-crtstuff-pic t-libgcc-pic t-eh-dw2-dip t-slibgcc t-slibgcc-gld t-slibgcc-elf-ver t-linux"
-   extra_parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o"
diff --git a/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch b/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
new file mode 100644
index 0000000..315b406
--- /dev/null
+++ b/package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
@@ -0,0 +1,37 @@
+Fix DWARF compilation for FDPIC targets
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/libgcc/unwind-dw2-fde-dip.c gcc-6.1.0/libgcc/unwind-dw2-fde-dip.c
+--- gcc-6.1.0.orig/libgcc/unwind-dw2-fde-dip.c	2016-01-04 15:30:50.000000000 +0100
++++ gcc-6.1.0/libgcc/unwind-dw2-fde-dip.c	2016-08-05 02:17:40.424195128 +0200
+@@ -124,7 +124,11 @@
+ {
+   _Unwind_Ptr pc_low;
+   _Unwind_Ptr pc_high;
++#if defined __FRV_FDPIC__ || defined __BFIN_FDPIC__
++  struct elf32_fdpic_loadaddr load_base;
++#else
+   _Unwind_Ptr load_base;
++#endif
+   const ElfW(Phdr) *p_eh_frame_hdr;
+   const ElfW(Phdr) *p_dynamic;
+   struct frame_hdr_cache_element *link;
+@@ -163,7 +167,7 @@
+   struct unw_eh_callback_data *data = (struct unw_eh_callback_data *) ptr;
+   const ElfW(Phdr) *phdr, *p_eh_frame_hdr, *p_dynamic;
+   long n, match;
+-#ifdef __FRV_FDPIC__
++#if defined __FRV_FDPIC__ || defined __BFIN_FDPIC__
+   struct elf32_fdpic_loadaddr load_base;
+ #else
+   _Unwind_Ptr load_base;
+@@ -347,7 +351,7 @@
+ 	    break;
+ 	  }
+     }
+-# elif defined __FRV_FDPIC__ && defined __linux__
++# elif (defined __FRV_FDPIC__ || defined __BFIN_FDPIC__) && defined __linux__
+   data->dbase = load_base.got_value;
+ # else
+ #  error What is DW_EH_PE_datarel base on this platform?
diff --git a/package/gcc/6.1.0/893-libgcc_linker-script.patch b/package/gcc/6.1.0/893-libgcc_linker-script.patch
new file mode 100644
index 0000000..783d15d
--- /dev/null
+++ b/package/gcc/6.1.0/893-libgcc_linker-script.patch
@@ -0,0 +1,16 @@
+Solves following linking error:
+# bfin-openadk-linux-uclibc-g++ -o foo t.c
+bfin-openadk-linux-uclibc/bin/ld: foo: hidden symbol `___udivsi3' in libgcc.a(_udivsi3.o) is referenced by DSO
+
+diff -Nur gcc-6.1.0.orig/libgcc/config.host gcc-6.1.0/libgcc/config.host
+--- gcc-6.1.0.orig/libgcc/config.host	2016-02-26 21:02:28.000000000 +0100
++++ gcc-6.1.0/libgcc/config.host	2016-07-25 02:47:05.818797217 +0200
+@@ -444,7 +444,7 @@
+ 	md_unwind_header=bfin/linux-unwind.h
+         ;;
+ bfin*-linux-uclibc*)
+-	tmake_file="$tmake_file bfin/t-bfin bfin/t-crtstuff t-libgcc-pic t-fdpbit bfin/t-linux"
++	tmake_file="$tmake_file bfin/t-bfin bfin/t-crtstuff t-libgcc-pic t-slibgcc-libgcc t-fdpbit bfin/t-linux"
+ 	# No need to build crtbeginT.o on uClibc systems.  Should probably
+ 	# be moved to the OS specific section above.
+ 	extra_parts="crtbegin.o crtbeginS.o crtend.o crtendS.o"
diff --git a/package/gcc/6.1.0/894-bfin-libgcc-workaround.patch b/package/gcc/6.1.0/894-bfin-libgcc-workaround.patch
new file mode 100644
index 0000000..cbc3fdc
--- /dev/null
+++ b/package/gcc/6.1.0/894-bfin-libgcc-workaround.patch
@@ -0,0 +1,22 @@
+Fixes C++ compile errors, sync with ld changes.
+
+This is a really ugly workaround, but all other tries to
+fix it the right way, failed until now.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-6.1.0.orig/libgcc/Makefile.in gcc-6.1.0/libgcc/Makefile.in
+--- gcc-6.1.0.orig/libgcc/Makefile.in	2016-02-25 13:23:52.000000000 +0100
++++ gcc-6.1.0/libgcc/Makefile.in	2016-08-11 21:15:13.841764686 +0200
+@@ -932,7 +932,11 @@
+ 	{ $(NM) $(SHLIB_NM_FLAGS) $(libgcc-s-objects); echo %%; \
+ 	  cat libgcc.map.in; \
+ 	} | $(AWK) -f $(SHLIB_MKMAP) $(SHLIB_MKMAP_OPTS) > tmp-$@
++ifeq ($(cpu_type),bfin)
++	sed -e 's/__/_/' tmp-$@ > $@
++else
+ 	mv tmp-$@ $@
++endif
+ libgcc_s$(SHLIB_EXT): libgcc.map
+ mapfile = libgcc.map
+ endif
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 284d34c..eea2f74 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -74,6 +74,10 @@ HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
+ifeq ($(BR2_bfin),y)
+HOST_GCC_FINAL_CONF_OPTS += --disable-symvers
+endif
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 ifeq ($(BR2_STATIC_LIBS),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-shared
-- 
2.1.4
