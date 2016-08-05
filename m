From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 5 Aug 2016 21:52:47 +0200
Subject: [Buildroot] [RFC][PATCH] bfin: fix two issues with internal
	toolchain
Message-ID: <20160805195247.GA11252@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows to compile DWARF EH.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Hi,
this is my present work on the Blackfin C++ issues with the internal
toolchain. There is still following problem:
$ ./output/host/usr/bin/bfin-buildroot-linux-uclibc-g++ -o foo foo.cc                                                                                                              
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/lib/libstdc++.so:
undefined reference to `_Unwind_GetRegionStart'
..
$ cat foo.cc                                                                                                                                                                       
#include <iostream>
int main(void) { std::cout << "hello, world\n"; }

But libstdc++ should search for __Unwind_GetRegionStart:
nm
/home/wbx/buildroot/output/host/usr/lib/gcc/bfin-buildroot-linux-uclibc/6.1.0/../../../../bfin-buildroot-linux-uclibc/lib/libstdc++.so|grep
_Unwind_GetRegionStart<
         U __Unwind_GetRegionStart

And libgcc_s.so.1 provides it:
./output/host/usr/bin/bfin-buildroot-linux-uclibc-nm
./output/host/usr/bfin-buildroot-linux-uclibc/sysroot/lib/libgcc_s.so.1|grep
_Unwind_GetRegionStart                         
00005d0c t __Unwind_GetRegionStart

So why is ld trying to find _Unwind_GetRegionStart instead of
__Unwind_GetRegionStart when linking?
Does ld ignores __USER_LABEL_PREFIX__?

Any ideas and help is really appreciated.

Here are some g++ verbose output logs from internal and external
buildroot toolchain:
http://debug.openadk.org/buildroot/

---
 package/gcc/6.1.0/892-disable-dwarf-bfin.patch     |   24 -------------
 package/gcc/6.1.0/892-fix-dwarf-fdpic.patch        |   37 ++++++++++++++++++++
 .../6.1.0/893-bfin-add-libgcc-linker-script.patch  |   20 +++++++++++
 3 files changed, 57 insertions(+), 24 deletions(-)
 delete mode 100644 package/gcc/6.1.0/892-disable-dwarf-bfin.patch
 create mode 100644 package/gcc/6.1.0/892-fix-dwarf-fdpic.patch
 create mode 100644 package/gcc/6.1.0/893-bfin-add-libgcc-linker-script.patch

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
diff --git a/package/gcc/6.1.0/893-bfin-add-libgcc-linker-script.patch b/package/gcc/6.1.0/893-bfin-add-libgcc-linker-script.patch
new file mode 100644
index 0000000..88548fc
--- /dev/null
+++ b/package/gcc/6.1.0/893-bfin-add-libgcc-linker-script.patch
@@ -0,0 +1,20 @@
+Add libgcc linker script for Blackfin FDPIC.
+
+Solves following linking error:
+# bfin-openadk-linux-uclibc-g++ -o foo t.c
+bfin-openadk-linux-uclibc/bin/ld: foo: hidden symbol `___udivsi3' in libgcc.a(_udivsi3.o) is referenced by DSO
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
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
-- 
1.7.10.4
