From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Sat, 25 Jan 2014 15:11:56 +0100
Subject: [Buildroot] [PATCH 1/1] Prefer 'command -v' over 'which' (for
	portability)
Message-ID: <1390659116-18865-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'command -v' is defined by POSIX (and is available "everywhere"),
'which' is not.

This is improves user experience when 'which' isn't installed so that
there won't be error messages about missing 'which' *before* the
Buildroot dependency check is run.

Current behaviour:

  $ make
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  /bin/sh: which: command not found
  support/dependencies/check-host-tar.sh: line 5: which: command not found
  support/dependencies/check-host-tar.sh: line 7: which: command not found
  /home/bfo/buildroot/support/dependencies/dependencies.sh: line 56:
  which: command not found

  You must install 'which' on your build machine
  make: *** [core-dependencies] Error 1

New behaviour:

  $ make

  You must install 'which' on your build machine
  make: *** [core-dependencies] Error 1

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile                               | 22 +++++++++++-----------
 package/Makefile.in                    | 10 +++++-----
 support/dependencies/check-host-tar.sh |  4 ++--
 support/dependencies/dependencies.sh   | 20 ++++++++++----------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/Makefile b/Makefile
index 9dfb1e0..e06bfe1 100644
--- a/Makefile
+++ b/Makefile
@@ -192,12 +192,12 @@ HOSTAS:=as
 endif
 ifndef HOSTCC
 HOSTCC:=gcc
-HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
+HOSTCC:=$(shell command -v $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
 endif
 HOSTCC_NOCCACHE:=$(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX:=g++
-HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
+HOSTCXX:=$(shell command -v $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
 endif
 HOSTCXX_NOCCACHE:=$(HOSTCXX)
 ifndef HOSTFC
@@ -221,15 +221,15 @@ endif
 ifndef HOSTRANLIB
 HOSTRANLIB:=ranlib
 endif
-HOSTAR:=$(shell which $(HOSTAR) || type -p $(HOSTAR) || echo ar)
-HOSTAS:=$(shell which $(HOSTAS) || type -p $(HOSTAS) || echo as)
-HOSTFC:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo || which g77 || type -p g77 || echo gfortran)
-HOSTCPP:=$(shell which $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
-HOSTLD:=$(shell which $(HOSTLD) || type -p $(HOSTLD) || echo ld)
-HOSTLN:=$(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
-HOSTNM:=$(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
-HOSTOBJCOPY:=$(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
-HOSTRANLIB:=$(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
+HOSTAR:=$(shell command -v $(HOSTAR) || type -p $(HOSTAR) || echo ar)
+HOSTAS:=$(shell command -v $(HOSTAS) || type -p $(HOSTAS) || echo as)
+HOSTFC:=$(shell command -v $(HOSTLD) || type -p $(HOSTLD) || echo || command -v g77 || type -p g77 || echo gfortran)
+HOSTCPP:=$(shell command -v $(HOSTCPP) || type -p $(HOSTCPP) || echo cpp)
+HOSTLD:=$(shell command -v $(HOSTLD) || type -p $(HOSTLD) || echo ld)
+HOSTLN:=$(shell command -v $(HOSTLN) || type -p $(HOSTLN) || echo ln)
+HOSTNM:=$(shell command -v $(HOSTNM) || type -p $(HOSTNM) || echo nm)
+HOSTOBJCOPY:=$(shell command -v $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
+HOSTRANLIB:=$(shell command -v $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTFC HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
diff --git a/package/Makefile.in b/package/Makefile.in
index 2e433fd..115049a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -4,7 +4,7 @@ endif
 ifndef HOSTMAKE
 HOSTMAKE=$(MAKE)
 endif
-HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE :=$(shell command -v $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 # If BR2_LEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
@@ -190,10 +190,10 @@ TARGET_STRIP=true
 STRIPCMD=$(TARGET_STRIP)
 KSTRIPCMD=$(TARGET_STRIP)
 endif
-INSTALL:=$(shell which install || type -p install)
-FLEX:=$(shell which flex || type -p flex)
-BISON:=$(shell which bison || type -p bison)
-SED:=$(shell which sed || type -p sed) -i -e
+INSTALL:=$(shell command -v install || type -p install)
+FLEX:=$(shell command -v flex || type -p flex)
+BISON:=$(shell command -v bison || type -p bison)
+SED:=$(shell command -v sed || type -p sed) -i -e
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
index 2cfc2b3..a406bd5 100755
--- a/support/dependencies/check-host-tar.sh
+++ b/support/dependencies/check-host-tar.sh
@@ -2,9 +2,9 @@
 
 candidate="$1"
 
-tar=`which $candidate`
+tar=`command -v $candidate`
 if [ ! -x "$tar" ]; then
-	tar=`which tar`
+	tar=`command -v tar`
 	if [ ! -x "$tar" ]; then
 		# echo nothing: no suitable tar found
 		exit 1
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 47d4d10..335c976 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -53,20 +53,20 @@ if test -n "$PERL_MM_OPT" ; then
 fi
 
 # Verify that which is installed
-if ! which which > /dev/null ; then
+if ! command -v which > /dev/null ; then
 	echo
 	echo "You must install 'which' on your build machine";
 	exit 1;
 fi;
 
-if ! which sed > /dev/null ; then
+if ! command -v sed > /dev/null ; then
 	echo
 	echo "You must install 'sed' on your build machine"
 	exit 1
 fi
 
 # Check make
-MAKE=$(which make 2> /dev/null)
+MAKE=$(command -v make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
 	echo
 	echo "You must install 'make' on your build machine";
@@ -87,9 +87,9 @@ if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
 fi;
 
 # Check host gcc
-COMPILER=$(which $HOSTCC_NOCCACHE 2> /dev/null)
+COMPILER=$(command -v $HOSTCC_NOCCACHE 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
-	COMPILER=$(which cc 2> /dev/null)
+	COMPILER=$(command -v cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
 	echo
@@ -113,9 +113,9 @@ if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ]
 fi;
 
 # check for host CXX
-CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
+CXXCOMPILER=$(command -v $HOSTCXX_NOCCACHE 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
-	CXXCOMPILER=$(which c++ 2> /dev/null)
+	CXXCOMPILER=$(command -v c++ 2> /dev/null)
 fi
 if [ -z "$CXXCOMPILER" ] ; then
 	echo
@@ -149,7 +149,7 @@ fi;
 # Check that a few mandatory programs are installed
 missing_progs="no"
 for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
-    if ! which $prog > /dev/null ; then
+    if ! command -v $prog > /dev/null ; then
 	echo "You must install '$prog' on your build machine";
 	missing_progs="yes"
 	if test $prog = "svn" ; then
@@ -170,7 +170,7 @@ fi
 
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
    grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
-   if ! which locale > /dev/null ; then
+   if ! command -v locale > /dev/null ; then
        echo
        echo "You need locale support on your build machine to build a toolchain supporting locales"
        exit 1 ;
@@ -184,7 +184,7 @@ fi
 
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
     for prog in javac jar; do
-	if ! which $prog > /dev/null ; then
+	if ! command -v $prog > /dev/null ; then
 	    echo >&2
 	    echo "You must install '$prog' on your build machine" >&2
 	    exit 1
-- 
1.8.5.2
