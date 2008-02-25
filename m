From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun, 24 Feb 2008 16:25:03 -0800 (PST)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/binutils/2.17.50.0.17
Message-ID: <20080225002503.6253D12C6E8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2008-02-24 16:25:02 -0800 (Sun, 24 Feb 2008)
New Revision: 21110

Log:
Copy patch needed for dynamic loader strings and config targets.


Added:
   trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch


Changeset:
Copied: trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch (from rev 21109, trunk/buildroot/toolchain/binutils/2.17.50.0.16/100-uclibc-conf.patch)
===================================================================
--- trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/binutils/2.17.50.0.17/100-uclibc-conf.patch	2008-02-25 00:25:02 UTC (rev 21110)
@@ -0,0 +1,139 @@
+--- binutils-2.16.91.0.7/bfd/configure
++++ binutils-2.16.91.0.7/bfd/configure
+@@ -3576,7 +3576,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/binutils/configure
++++ binutils-2.16.91.0.7/binutils/configure
+@@ -3411,7 +3411,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/configure
++++ binutils-2.16.91.0.7/configure
+@@ -1270,7 +1270,7 @@
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -1578,7 +1578,7 @@
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[3456789]86-*-vsta) ;; # don't add gprof back in
+       i[3456789]86-*-go32*) ;; # don't add gprof back in
+--- binutils-2.16.91.0.7/configure.ac
++++ binutils-2.16.91.0.7/configure.ac
+@@ -468,7 +468,7 @@
+   am33_2.0-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;
+-  sh-*-linux*)
++  sh*-*-linux*)
+     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+     ;;    
+   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
+@@ -776,7 +776,7 @@
+   romp-*-*)
+     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+     ;;
+-  sh-*-* | sh64-*-*)
++  sh*-*-* | sh64-*-*)
+     case "${host}" in
+       i[[3456789]]86-*-vsta) ;; # don't add gprof back in
+       i[[3456789]]86-*-go32*) ;; # don't add gprof back in
+--- binutils-2.16.91.0.7/gas/configure
++++ binutils-2.16.91.0.7/gas/configure
+@@ -3411,7 +3411,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/gprof/configure
++++ binutils-2.16.91.0.7/gprof/configure
+@@ -3419,6 +3419,11 @@
+   lt_cv_file_magic_test_file=`echo /lib/libc.so* /lib/libc-*.so`
+   ;;
+ 
++linux-uclibc*)
++  lt_cv_deplibs_check_method=pass_all
++  lt_cv_file_magic_test_file=`echo /lib/libuClibc-*.so`
++  ;;
++
+ netbsd* | knetbsd*-gnu)
+   if echo __ELF__ | $CC -E - | grep __ELF__ > /dev/null; then
+     lt_cv_deplibs_check_method='match_pattern /lib[^/\.]+\.so\.[0-9]+\.[0-9]+$'
+--- binutils-2.16.91.0.7/ld/configure
++++ binutils-2.16.91.0.7/ld/configure
+@@ -3413,7 +3413,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/libtool.m4
++++ binutils-2.16.91.0.7/libtool.m4
+@@ -739,7 +739,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
+--- binutils-2.16.91.0.7/ltconfig
++++ binutils-2.16.91.0.7/ltconfig
+@@ -602,6 +602,7 @@
+ 
+ # Transform linux* to *-*-linux-gnu*, to support old configure scripts.
+ case $host_os in
++linux-uclibc*) ;;
+ linux-gnu*) ;;
+ linux*) host=`echo $host | sed 's/^\(.*-.*-linux\)\(.*\)$/\1-gnu\2/'`
+ esac
+@@ -1247,7 +1248,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   version_type=linux
+   need_lib_prefix=no
+   need_version=no
+--- binutils-2.16.91.0.7/opcodes/configure
++++ binutils-2.16.91.0.7/opcodes/configure
+@@ -3579,7 +3579,7 @@
+   ;;
+ 
+ # This must be Linux ELF.
+-linux-gnu*)
++linux-gnu*|linux-uclibc*)
+   lt_cv_deplibs_check_method=pass_all
+   ;;
+ 
