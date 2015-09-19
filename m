From: Brendan Heading <brendanheading@gmail.com>
Date: Sat, 19 Sep 2015 19:05:31 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
	smashing support with uclibc
Message-ID: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/123/123a5b3f72ba8c1a4aa1cea5b7b846a04fd4e923/
http://autobuild.buildroot.net/results/38c/38cfa4e7249a8770b06dbd392acba79303d3f9bc/

.. and others.

Improve GCC's checking of stack smashing support, adding a specific case
statement for uclibc, and removing the check done after checking the
glibc version.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
Patch V1 - this initial version only fixes 4.7.4 - wanted to check that
we are heading the right way before I fix all the other versions.

Note that I manually modified configure, rather than regenerating it from
configure.ac.

Original plan was to reverse the order of the existing __GLIBC_MINOR__ and
uclibc check. However, the uclibc check falls through if it does not
detect uclibc, so I figure it better to add the separate case statement.
---
 ...ing-of-stack-smashing-support-with-uclibc.patch | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch

diff --git a/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch b/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch
new file mode 100644
index 0000000..8f5d961
--- /dev/null
+++ b/package/gcc/4.7.4/920-gcc-improve-checking-of-stack-smashing-support-with-uclibc.patch
@@ -0,0 +1,81 @@
+From 39bbd72364c34da7ba78f26354512eb5229cebdc Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Fri, 18 Sep 2015 14:54:25 +0100
+Subject: [PATCH 1/1] gcc: improve checking of stack smashing support with
+ uclibc
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ gcc/configure    | 15 +++++++++------
+ gcc/configure.ac | 15 +++++++++------
+ 2 files changed, 18 insertions(+), 12 deletions(-)
+
+diff --git a/gcc/configure b/gcc/configure
+index 63cba0a..d1ac2ea 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -26797,6 +26797,15 @@ else
+        *-*-musl*)
+          # All versions of musl provide stack protector
+ 	 gcc_cv_libc_provides_ssp=yes;;
++       *-*-uclibc*)
++      if $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
++        $target_header_dir/features.h > /dev/null && \
++	     test -f $target_header_dir/bits/uClibc_config.h && \
++	     $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
++	     $target_header_dir/bits/uClibc_config.h > /dev/null; then
++	  gcc_cv_libc_provides_ssp=yes
++      fi
++      ;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       # glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -26811,12 +26820,6 @@ else
+ 	     && $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC_MINOR__[ 	]+([1-9][0-9]|[4-9])' \
+ 	     $target_header_dir/features.h > /dev/null; then
+ 	  gcc_cv_libc_provides_ssp=yes
+-	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
+-	     $target_header_dir/features.h > /dev/null && \
+-	     test -f $target_header_dir/bits/uClibc_config.h && \
+-	     $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
+-	     $target_header_dir/bits/uClibc_config.h > /dev/null; then
+-	  gcc_cv_libc_provides_ssp=yes
+ 	fi
+       # all versions of Bionic support stack protector
+       elif test -f $target_header_dir/sys/cdefs.h \
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index ea1c147..5954cc7 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -4672,6 +4672,15 @@ AC_CACHE_CHECK(__stack_chk_fail in target C library,
+        *-*-musl*)
+          # All versions of musl provide stack protector
+ 	 gcc_cv_libc_provides_ssp=yes;;
++       *-*-uclibc*)
++      if $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
++         $target_header_dir/features.h > /dev/null && \
++	 test -f $target_header_dir/bits/uClibc_config.h && \
++	 $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
++	 $target_header_dir/bits/uClibc_config.h > /dev/null; then
++        gcc_cv_libc_provides_ssp=yes
++      fi
++      ;;
+        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
+       [# glibc 2.4 and later provides __stack_chk_fail and
+       # either __stack_chk_guard, or TLS access to stack guard canary.
+@@ -4686,12 +4695,6 @@ AC_CACHE_CHECK(__stack_chk_fail in target C library,
+ 	     && $EGREP '^[ 	]*#[ 	]*define[ 	]+__GLIBC_MINOR__[ 	]+([1-9][0-9]|[4-9])' \
+ 	     $target_header_dir/features.h > /dev/null; then
+ 	  gcc_cv_libc_provides_ssp=yes
+-	elif $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC__[ 	]+1' \
+-	     $target_header_dir/features.h > /dev/null && \
+-	     test -f $target_header_dir/bits/uClibc_config.h && \
+-	     $EGREP '^[ 	]*#[ 	]*define[ 	]+__UCLIBC_HAS_SSP__[ 	]+1' \
+-	     $target_header_dir/bits/uClibc_config.h > /dev/null; then
+-	  gcc_cv_libc_provides_ssp=yes
+ 	fi
+       # all versions of Bionic support stack protector
+       elif test -f $target_header_dir/sys/cdefs.h \
+-- 
+2.4.3
+
-- 
2.4.3
