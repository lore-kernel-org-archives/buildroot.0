From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Thu, 11 Aug 2016 13:20:31 +0300
Subject: [Buildroot] [PATCH] stella: fix compiler search in configure script
Message-ID: <1470910831-18439-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In configure script there are some tests that are looking for
a suitable compiler. For this purpose script tries to compile
and link some C++ code that is hardcoded in the body of script.

The problem is that only linker flags ($LDFLAGS) are passed to the
compiler when the script is compiling test code. Therefore some
necessary command line options can be lost and this would lead to
errors.

This exactly happens to ARC:
  1. -matomic option is lost as it compiler option,
  2. test code compilation fails,
  3. the script decides not to use arc-buildroot-linux-uclibc-g++,
  4. scipt checks host compiler (x86_64-linux-gnu-g++ in your case),
  5. package is being built for x86_64, not for ARC.

About last 2 steps - I don't know why configure script should try
to build stella for host machine. As for me an error should be
raised and a build should be stopped. But this is up to stella
developers.

Current patch adds compiler options ($CPPLFAGS) when compiling
test code in configure script.

Fixes stella build for ARC, e. g.:
http://autobuild.buildroot.net/results/c23/c23d655137b1c1825b1da69b18307c6a1d4b23b8//

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
---
 ...figure-Add-CXXFLAGS-for-test-compilations.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch

diff --git a/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch b/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch
new file mode 100644
index 0000000..f4e89e6
--- /dev/null
+++ b/package/stella/0003-configure-Add-CXXFLAGS-for-test-compilations.patch
@@ -0,0 +1,44 @@
+From 28f0c20302e5c64712899848cae3d0a48a9dc952 Mon Sep 17 00:00:00 2001
+From: Vlad Zakharov <vzakhar@synopsys.com>
+Date: Wed, 10 Aug 2016 18:02:59 +0300
+Subject: [PATCH] configure: Add $CXXFLAGS for test compilations
+
+Why we are passing only linker flags when compiling test code?
+Loosing compiler flags leads to errors.
+
+Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
+---
+ configure | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/configure b/configure
+index 0d90a4f..618fe78 100755
+--- a/configure
++++ b/configure
+@@ -63,9 +63,9 @@ cc_check() {
+ 	echo >> "$TMPLOG"
+ 	cat "$TMPC" >> "$TMPLOG"
+ 	echo >> "$TMPLOG"
+-	echo "$CXX $TMPC $LDFLAGS -o $TMPO$EXEEXT $@" >> "$TMPLOG"
++	echo "$CXX $TMPC $CXXFLAGS $LDFLAGS -o $TMPO$EXEEXT $@" >> "$TMPLOG"
+ 	rm -f "$TMPO$EXEEXT"
+-	( $CXX "$TMPC" $LDFLAGS -o "$TMPO$EXEEXT" "$@" ) >> "$TMPLOG" 2>&1
++	( $CXX "$TMPC" $CXXFLAGS $LDFLAGS -o "$TMPO$EXEEXT" "$@" ) >> "$TMPLOG" 2>&1
+ 	TMP="$?"
+ 	echo >> "$TMPLOG"
+ 	return "$TMP"
+@@ -107,9 +107,9 @@ EOF
+ 
+ if test -n "$_host"; then
+ 	# In cross-compiling mode, we cannot run the result
+-	eval "$1 $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
++	eval "$1 $CXXFLAGS $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
+ else
+-	eval "$1 $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && eval "./tmp_cxx_compiler 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
++	eval "$1 $CXXFLAGS $LDFLAGS -o tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp 2> /dev/null" && eval "./tmp_cxx_compiler 2> /dev/null" && rm -f tmp_cxx_compiler$EXEEXT tmp_cxx_compiler.cpp
+ fi
+ }
+ 
+-- 
+2.5.5
+
-- 
2.5.5
