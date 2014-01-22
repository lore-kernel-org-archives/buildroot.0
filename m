From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 21:47:41 +0100
Subject: [Buildroot] [git commit] dependencies.sh: stop mixing echo and
	printf (use echo)
Message-ID: <20140122204854.A96F29C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8160146e621b8312038696d0f167cff12238043
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

'printf' was introduced because it is more portable than 'echo -e'. But
when the escape sequences are just newlines we can just as well use
plain 'echo' (and remove the newline escape sequences).

This looks cleaner than having some lines with echo and some with
printf.

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh |   67 ++++++++++++++++++++++------------
 1 files changed, 44 insertions(+), 23 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 8cfbcf6..47d4d10 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -7,7 +7,8 @@ export LC_ALL=C
 # Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
 if test $? != 0 ; then
-	printf "\ngrep doesn't work\n"
+	echo
+	echo "grep doesn't work"
 	exit 1
 fi
 
@@ -19,8 +20,9 @@ if test -n "$LD_LIBRARY_PATH" ; then
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
-		printf "\nYou seem to have the current working directory in your"
-		printf "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
+		echo
+		echo "You seem to have the current working directory in your"
+		echo "LD_LIBRARY_PATH environment variable. This doesn't work."
 		exit 1;
 	fi
 fi;
@@ -34,14 +36,16 @@ if test -n "$PATH" ; then
 	echo TRiGGER_start"$PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
-		printf "\nYou seem to have the current working directory in your"
-		printf "PATH environment variable. This doesn't work.\n"
+		echo
+		echo "You seem to have the current working directory in your"
+		echo "PATH environment variable. This doesn't work."
 		exit 1;
 	fi
 fi;
 
 if test -n "$PERL_MM_OPT" ; then
-    printf "\nYou have PERL_MM_OPT defined because Perl local::lib"
+    echo
+    echo "You have PERL_MM_OPT defined because Perl local::lib"
     echo "is installed on your system. Please unset this variable"
     echo "before starting Buildroot, otherwise the compilation of"
     echo "Perl related packages will fail"
@@ -50,30 +54,35 @@ fi
 
 # Verify that which is installed
 if ! which which > /dev/null ; then
-	printf "\nYou must install 'which' on your build machine\n";
+	echo
+	echo "You must install 'which' on your build machine";
 	exit 1;
 fi;
 
 if ! which sed > /dev/null ; then
-	printf "\nYou must install 'sed' on your build machine\n"
+	echo
+	echo "You must install 'sed' on your build machine"
 	exit 1
 fi
 
 # Check make
 MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
-	printf "\nYou must install 'make' on your build machine\n";
+	echo
+	echo "You must install 'make' on your build machine";
 	exit 1;
 fi;
 MAKE_VERSION=$($MAKE --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$MAKE_VERSION" ] ; then
-	printf "\nYou must install 'make' on your build machine\n";
+	echo
+	echo "You must install 'make' on your build machine";
 	exit 1;
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
 MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
-	printf "\nYou have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required\n"
+	echo
+	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required"
 	exit 1;
 fi;
 
@@ -83,20 +92,23 @@ if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
-	printf "\nYou must install 'gcc' on your build machine\n";
+	echo
+	echo "You must install 'gcc' on your build machine";
 	exit 1;
 fi;
 
 COMPILER_VERSION=$($COMPILER -v 2>&1 | sed -n '/^gcc version/p' |
 	sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
-	printf "\nYou must install 'gcc' on your build machine\n";
+	echo
+	echo "You must install 'gcc' on your build machine";
 	exit 1;
 fi;
 COMPILER_MAJOR=$(echo $COMPILER_VERSION | sed -e "s/\..*//g")
 COMPILER_MINOR=$(echo $COMPILER_VERSION | sed -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
 if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
-	printf "\nYou have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required\n"
+	echo
+	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required"
 	exit 1;
 fi;
 
@@ -106,27 +118,31 @@ if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
 if [ -z "$CXXCOMPILER" ] ; then
-	printf "\nYou may have to install 'g++' on your build machine\n"
+	echo
+	echo "You may have to install 'g++' on your build machine"
 	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | sed -n '/^gcc version/p' |
 		sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
-		printf "\nYou may have to install 'g++' on your build machine\n"
+		echo
+		echo "You may have to install 'g++' on your build machine"
 	fi
 
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
-		printf "\nYou have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required\n"
+		echo
+		echo "You have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required"
 		exit 1
 	fi
 fi
 
 # Check bash
 if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
-	printf "\nYou must install 'bash' on your build machine\n";
+	echo
+	echo "You must install 'bash' on your build machine";
 	exit 1;
 fi;
 
@@ -155,11 +171,13 @@ fi
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
    grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
    if ! which locale > /dev/null ; then
-       printf "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
+       echo
+       echo "You need locale support on your build machine to build a toolchain supporting locales"
        exit 1 ;
    fi
    if ! locale -a | grep -q -i utf8$ ; then
-       printf "\nYou need at least one UTF8 locale to build a toolchain supporting locales\n"
+       echo
+       echo "You need at least one UTF8 locale to build a toolchain supporting locales"
        exit 1 ;
    fi
 fi
@@ -167,7 +185,8 @@ fi
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
     for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
-	    printf "\nYou must install '$prog' on your build machine\n" >&2
+	    echo >&2
+	    echo "You must install '$prog' on your build machine" >&2
 	    exit 1
 	fi
     done
@@ -175,7 +194,8 @@ fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
     if test ! -f /lib/ld-linux.so.2 ; then
-	printf "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
+	echo
+	echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
 	echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
 	echo "library."
 	echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
@@ -188,7 +208,8 @@ fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BUILDROOT_CONFIG ; then
     if ! echo "int main(void) {}" | gcc -m32 -x c - ; then
-	printf "\nYour Buildroot configuration needs a compiler capable of building 32 bits binaries."
+	echo
+	echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
 	echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
 	echo "For other distributions, refer to their documentation."
 	exit 1
