From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2009 09:14:20 +0100
Subject: [Buildroot] [PATCH 3/3] dependencies: cleanup
In-Reply-To: <cover.1260951255.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260951255.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e07e1b45f7d334d21541245cf4533650561aa99a.1260951255.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Factorize some of the tests done by
toolchain/dependencies/dependencies.sh (check for unset environment
variables and check for required programs).

Make the output less verbose by only showing something when something
is not present. Some messages were really silly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/dependencies/dependencies.sh |  267 +++++---------------------------
 1 files changed, 38 insertions(+), 229 deletions(-)

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 5c40f0d..f5b2621 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -2,89 +2,21 @@
 # vi: set sw=4 ts=4:
 #set -x
 
-echo ""
-echo "Checking build system dependencies:"
 export LC_ALL=C
 
-#############################################################
-#
-# check build system 'environment'
-#
-#############################################################
-if test -n "$CC" ; then
-	echo "CC clean:						FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CC' so buildroot can run with";
+# Verify that critical environment variables aren't set
+for var in CC CXX CPP CFLAGS CXXFLAGS GREP_OPTIONS CROSS_COMPILE ARCH ; do
+    if test -n "$(eval echo '$'$var)" ; then
+	/bin/echo -e "\nYou must run 'unset $var' so buildroot can run with";
 	/bin/echo -e "a clean environment on your build machine\n";
 	exit 1;
-fi;
-echo "CC clean:					Ok"
-
-if test -n "$CXX" ; then
-	echo "CXX clean:					FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CXX' so buildroot can run with";
-	/bin/echo -e "a clean environment on your build machine\n";
-	exit 1;
-fi;
-echo "CXX clean:					Ok"
-
-
-if test -n "$CPP" ; then
-	echo "CPP clean:					FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CPP' so buildroot can run with";
-	/bin/echo -e "a clean environment on your build machine\n";
-	exit 1;
-fi;
-echo "CPP clean:					Ok"
-
-
-if test -n "$CFLAGS" ; then
-	echo "CFLAGS clean:					FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CFLAGS' so buildroot can run with";
-	/bin/echo -e "a clean environment on your build machine\n";
-	exit 1;
-fi;
-echo "CFLAGS clean:					Ok"
-
-if test -n "$INCLUDES" ; then
-	echo "INCLUDES clean:					FALSE"
-	/bin/echo -e "WARNING: INCLUDES contains:\n\t'$INCLUDES'"
-else
-	echo "INCLUDES clean:					Ok"
-fi
-
-if test -n "$CXXFLAGS" ; then
-	echo "CXXFLAGS clean:					FALSE"
-	/bin/echo -e "\n\nYou must run 'unset CXXFLAGS' so buildroot can run with";
-	/bin/echo -e "a clean environment on your build machine\n";
-	exit 1;
-fi;
-echo "CXXFLAGS clean:					Ok"
-
-if test -n "$GREP_OPTIONS" ; then
-        echo "GREP_OPTIONS clean:                               FALSE"
-        /bin/echo -e "\n\nYou must run 'unset GREP_OPTIONS' so buildroot can run with";
-        /bin/echo -e "a clean environment on your build machine\n";
-        exit 1;
-fi;
-
-if test -n "$CROSS_COMPILE" ; then
-        echo "CROSS_COMPILE clean:                               FALSE"
-        /bin/echo -e "\n\nYou must run 'unset CROSS_COMPILE' so buildroot can run with";
-        /bin/echo -e "a clean environment on your build machine\n";
-        exit 1;
-fi;
-
-if test -n "$ARCH" ; then
-        echo "ARCH clean:                               FALSE"
-        /bin/echo -e "\n\nYou must run 'unset ARCH' so buildroot can run with";
-        /bin/echo -e "a clean environment on your build machine\n";
-        exit 1;
-fi;
-
+    fi
+done
 
+# Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
 if test $? != 0 ; then
-	echo "grep works:				FALSE"
+	/bin/echo -e "\ngrep doesn't work\n"
 	exit 1
 fi
 
@@ -96,107 +28,68 @@ if test -n "$LD_LIBRARY_PATH" ; then
 	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':TRiGGER_end' >/dev/null 2>&1 ||
 	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep '::' >/dev/null 2>&1
 	if test $? = 0; then
-		echo "LD_LIBRARY_PATH sane:				FALSE"
-		echo "You seem to have the current working directory in your"
-		echo "LD_LIBRARY_PATH environment variable. This doesn't work."
+		/bin/echo -e "\nYou seem to have the current working directory in your"
+		/bin/echo -e "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
 		exit 1;
-	else
-		echo "LD_LIBRARY_PATH sane:				Ok"
 	fi
 fi;
 
-
-
-#############################################################
-#
-# check build system 'which'
-#
-#############################################################
+# Verify that which is installed
 if ! which which > /dev/null ; then
-	echo "which installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'which' on your build machine\n";
+	/bin/echo -e "\nYou must install 'which' on your build machine\n";
 	exit 1;
 fi;
-echo "which installed:				Ok"
 
-
-
-#############################################################
-#
-# check build system 'sed'
-#
-#############################################################
+# Check sed
 SED=$(toolchain/dependencies/check-host-sed.sh)
 
 if [ -z "$SED" ] ; then
 	XSED=$HOST_SED_DIR/bin/sed
-	echo "sed works:					No, using buildroot version instead"
+	/bin/echo -e "\nSed doesn't work, using buildroot version instead\n"
 else
 	XSED=$SED
-	echo "sed works:					Ok ($SED)"
 fi
 
-
-
-
-#############################################################
-#
-# check build system 'make'
-#
-#############################################################
+# Check make
 MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
-	echo "make installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
+	/bin/echo -e "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_VERSION=$($MAKE --version 2>&1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$MAKE_VERSION" ] ; then
-	echo "make installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
+	/bin/echo -e "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
 MAKE_MINOR=$(echo $MAKE_VERSION | $XSED -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
-	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required"
+	/bin/echo -e "\nYou have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required\n"
 	exit 1;
 fi;
-echo "GNU make version '$MAKE_VERSION':			Ok"
-
 
-
-#############################################################
-#
-# check build system 'gcc'
-#
-#############################################################
+# Check host gcc
 COMPILER=$(which $HOSTCC 2> /dev/null)
 if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
-	echo "C Compiler installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
+	/bin/echo -e "\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 
 COMPILER_VERSION=$($COMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
 	$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
-	echo "gcc installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
+	/bin/echo -e "\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 COMPILER_MAJOR=$(echo $COMPILER_VERSION | $XSED -e "s/\..*//g")
 COMPILER_MINOR=$(echo $COMPILER_VERSION | $XSED -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
 if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
-	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required"
+	echo "\nYou have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required\n"
 	exit 1;
 fi;
-echo "C compiler '$COMPILER'"
-echo "C compiler version '$COMPILER_VERSION':			Ok"
-
 
 # check for host CXX
 CXXCOMPILER=$(which $HOSTCXX 2> /dev/null)
@@ -204,7 +97,6 @@ if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
 if [ -z "$CXXCOMPILER" ] ; then
-	echo "C++ Compiler installed:		    FALSE"
 	/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
 	#exit 1
 fi
@@ -212,117 +104,34 @@ if [ ! -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
 		$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
-		echo "c++ installed:		    FALSE"
 		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
-		#exit 1
 	fi
 
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
-		echo "You have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required"
+		/bin/echo -e "\nYou have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required\n"
 		exit 1
 	fi
-	echo "C++ compiler '$CXXCOMPILER'"
-	echo "C++ compiler version '$CXXCOMPILER_VERSION':			Ok"
 fi
 
-#############################################################
-#
-# check build system 'awk'
-#
-#############################################################
-if ! which awk > /dev/null ; then
-	echo "awk installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'awk' on your build machine\n";
-	exit 1;
-fi;
-echo "awk installed:					Ok"
-
-#############################################################
-#
-# check build system 'bash'
-#
-#############################################################
+# Check bash
 if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
-	echo "bash installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'bash' on your build machine\n";
-	exit 1;
-fi;
-echo "bash installed:					Ok"
-
-#############################################################
-#
-# check build system 'bison'
-#
-#############################################################
-if ! which bison > /dev/null ; then
-	echo "bison installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'bison' on your build machine\n";
+	/bin/echo -e "\nYou must install 'bash' on your build machine\n";
 	exit 1;
 fi;
-echo "bison installed:				Ok"
 
-
-#############################################################
-#
-# check build system 'flex'
-#
-#############################################################
-if ! which flex > /dev/null ; then
-	echo "flex installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'flex' on your build machine\n";
+# Check that a few mandatory programs are installed
+for prog in awk bison flex msgfmt makeinfo patch ; do
+    if ! which $prog > /dev/null ; then
+	/bin/echo -e "\nYou must install '$prog' on your build machine";
+	if test $prog = "makeinfo" ; then
+	    /bin/echo -e "makeinfo is usually part of the texinfo package in your distribution\n"
+	elif test $prog = "msgfmt" ; then
+	    /bin/echo -e "msgfmt is usually part of the gettext package in your distribution\n"
+	else
+	    /bin/echo -e "\n"
+	fi
 	exit 1;
-fi;
-echo "flex installed:					Ok"
-
-
-#############################################################
-#
-# check build system 'gettext'
-#
-#############################################################
-if ! which msgfmt > /dev/null ; then \
-	echo "gettext installed:		    FALSE"
-	/bin/echo -e "\n\nYou must install 'gettext' on your build machine\n"; \
-	exit 1; \
-fi;
-echo "gettext installed:				Ok"
-
-
-#############################################################
-#
-# check build system 'makeinfo'
-#
-#############################################################
-
-if ! which makeinfo > /dev/null ; then \
-	echo "makeinfo installed:		    FALSE"
-	/bin/echo -e "\n\nMost likely some packages will fail to build their documentation"
-	echo "Either install 'makeinfo' on your host or fix the respective packages."
-	echo "Makeinfo can usually be found in the texinfo package for your host."
-	exit 1
-else
-	echo "makeinfo installed:				Ok"
-fi
-
-#############################################################
-#
-# check build system 'patch'
-#
-#############################################################
-if ! which patch > /dev/null ; then \
-	echo "patch installed:				FALSE"
-	/bin/echo -e "\n\nYou must install 'patch' on your build machine\n"; \
-	exit 1; \
-fi;
-echo "patch installed:				Ok"
-
-#############################################################
-#
-# All done
-#
-#############################################################
-echo "Build system dependencies:			Ok"
-echo ""
-
+    fi
+done
-- 
1.6.3.3
