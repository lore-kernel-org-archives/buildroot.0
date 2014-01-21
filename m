From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2014 21:53:12 +0100
Subject: [Buildroot] [git commit] Prefer 'printf' over 'echo -e' (for
	portability)
Message-ID: <20140121205435.A9A6A9C175@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=221ef3a3ee7bad3955040b6a91eed012277307fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/dependencies/dependencies.sh uses #!/bin/sh shebang. It is not
guaranteed that /bin/sh provides an 'echo' implementation that
understands the '-e' flag (interpret backslash escape chars). For
example, dash doesn't.

'printf' is more portable (it must interpret backslash escape chars,
according to POSIX), so use that.

NOTE: Before the previous commit, the dependencies.sh script used
/bin/echo instead of the shell built-in. That's probably why this hasn't
come up before.

Signed-off-by: Bj??rn Forsman <bjorn.forsman@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh |   82 +++++++++++++++++-----------------
 1 files changed, 41 insertions(+), 41 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index d1ce918..8cfbcf6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -7,7 +7,7 @@ export LC_ALL=C
 # Verify that grep works
 echo "WORKS" | grep "WORKS" >/dev/null 2>&1
 if test $? != 0 ; then
-	echo -e "\ngrep doesn't work\n"
+	printf "\ngrep doesn't work\n"
 	exit 1
 fi
 
@@ -19,8 +19,8 @@ if test -n "$LD_LIBRARY_PATH" ; then
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
-		echo -e "\nYou seem to have the current working directory in your"
-		echo -e "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
+		printf "\nYou seem to have the current working directory in your"
+		printf "LD_LIBRARY_PATH environment variable. This doesn't work.\n"
 		exit 1;
 	fi
 fi;
@@ -34,46 +34,46 @@ if test -n "$PATH" ; then
 	echo TRiGGER_start"$PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
 	echo TRiGGER_start"$PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
 	if test $? = 0; then
-		echo -e "\nYou seem to have the current working directory in your"
-		echo -e "PATH environment variable. This doesn't work.\n"
+		printf "\nYou seem to have the current working directory in your"
+		printf "PATH environment variable. This doesn't work.\n"
 		exit 1;
 	fi
 fi;
 
 if test -n "$PERL_MM_OPT" ; then
-    echo -e "\nYou have PERL_MM_OPT defined because Perl local::lib"
-    echo -e "is installed on your system. Please unset this variable"
-    echo -e "before starting Buildroot, otherwise the compilation of"
-    echo -e "Perl related packages will fail"
+    printf "\nYou have PERL_MM_OPT defined because Perl local::lib"
+    echo "is installed on your system. Please unset this variable"
+    echo "before starting Buildroot, otherwise the compilation of"
+    echo "Perl related packages will fail"
     exit 1
 fi
 
 # Verify that which is installed
 if ! which which > /dev/null ; then
-	echo -e "\nYou must install 'which' on your build machine\n";
+	printf "\nYou must install 'which' on your build machine\n";
 	exit 1;
 fi;
 
 if ! which sed > /dev/null ; then
-	echo -e "\nYou must install 'sed' on your build machine\n"
+	printf "\nYou must install 'sed' on your build machine\n"
 	exit 1
 fi
 
 # Check make
 MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
-	echo -e "\nYou must install 'make' on your build machine\n";
+	printf "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_VERSION=$($MAKE --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$MAKE_VERSION" ] ; then
-	echo -e "\nYou must install 'make' on your build machine\n";
+	printf "\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
 MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
 if [ $MAKE_MAJOR -lt 3 ] || [ $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 81 ] ; then
-	echo -e "\nYou have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required\n"
+	printf "\nYou have make '$MAKE_VERSION' installed.  GNU make >=3.81 is required\n"
 	exit 1;
 fi;
 
@@ -83,20 +83,20 @@ if [ -z "$COMPILER" ] ; then
 	COMPILER=$(which cc 2> /dev/null)
 fi;
 if [ -z "$COMPILER" ] ; then
-	echo -e "\nYou must install 'gcc' on your build machine\n";
+	printf "\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 
 COMPILER_VERSION=$($COMPILER -v 2>&1 | sed -n '/^gcc version/p' |
 	sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ] ; then
-	echo -e "\nYou must install 'gcc' on your build machine\n";
+	printf "\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 COMPILER_MAJOR=$(echo $COMPILER_VERSION | sed -e "s/\..*//g")
 COMPILER_MINOR=$(echo $COMPILER_VERSION | sed -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
 if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
-	echo "\nYou have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required\n"
+	printf "\nYou have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required\n"
 	exit 1;
 fi;
 
@@ -106,27 +106,27 @@ if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
 if [ -z "$CXXCOMPILER" ] ; then
-	echo -e "\nYou may have to install 'g++' on your build machine\n"
+	printf "\nYou may have to install 'g++' on your build machine\n"
 	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | sed -n '/^gcc version/p' |
 		sed -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ] ; then
-		echo -e "\nYou may have to install 'g++' on your build machine\n"
+		printf "\nYou may have to install 'g++' on your build machine\n"
 	fi
 
 	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/\..*//g")
 	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | sed -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
 	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
-		echo -e "\nYou have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required\n"
+		printf "\nYou have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required\n"
 		exit 1
 	fi
 fi
 
 # Check bash
 if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
-	echo -e "\nYou must install 'bash' on your build machine\n";
+	printf "\nYou must install 'bash' on your build machine\n";
 	exit 1;
 fi;
 
@@ -134,16 +134,16 @@ fi;
 missing_progs="no"
 for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
-	echo -e "You must install '$prog' on your build machine";
+	echo "You must install '$prog' on your build machine";
 	missing_progs="yes"
 	if test $prog = "svn" ; then
-	    echo -e "  svn is usually part of the subversion package in your distribution"
+	    echo "  svn is usually part of the subversion package in your distribution"
 	elif test $prog = "hg" ; then
-            echo -e "  hg is usually part of the mercurial package in your distribution"
+            echo "  hg is usually part of the mercurial package in your distribution"
 	elif test $prog = "zcat" ; then
-            echo -e "  zcat is usually part of the gzip package in your distribution"
+            echo "  zcat is usually part of the gzip package in your distribution"
 	elif test $prog = "bzcat" ; then
-            echo -e "  bzcat is usually part of the bzip2 package in your distribution"
+            echo "  bzcat is usually part of the bzip2 package in your distribution"
 	fi
     fi
 done
@@ -155,11 +155,11 @@ fi
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
    grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
    if ! which locale > /dev/null ; then
-       echo -e "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
+       printf "\nYou need locale support on your build machine to build a toolchain supporting locales\n"
        exit 1 ;
    fi
    if ! locale -a | grep -q -i utf8$ ; then
-       echo -e "\nYou need at least one UTF8 locale to build a toolchain supporting locales\n"
+       printf "\nYou need at least one UTF8 locale to build a toolchain supporting locales\n"
        exit 1 ;
    fi
 fi
@@ -167,7 +167,7 @@ fi
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
     for prog in javac jar; do
 	if ! which $prog > /dev/null ; then
-	    echo -e "\nYou must install '$prog' on your build machine\n" >&2
+	    printf "\nYou must install '$prog' on your build machine\n" >&2
 	    exit 1
 	fi
     done
@@ -175,22 +175,22 @@ fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
     if test ! -f /lib/ld-linux.so.2 ; then
-	echo -e "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
-	echo -e "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
-	echo -e "library."
-	echo -e "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
-	echo -e "libstdc++6:i386, and zlib1g:i386 packages."
-	echo -e "For other distributions, refer to the documentation on how to install the 32 bits"
-	echo -e "compatibility libraries."
+	printf "\nYour Buildroot configuration uses pre-built tools for the x86 architecture,"
+	echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
+	echo "library."
+	echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
+	echo "libstdc++6:i386, and zlib1g:i386 packages."
+	echo "For other distributions, refer to the documentation on how to install the 32 bits"
+	echo "compatibility libraries."
 	exit 1
     fi
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BUILDROOT_CONFIG ; then
     if ! echo "int main(void) {}" | gcc -m32 -x c - ; then
-	echo -e "\nYour Buildroot configuration needs a compiler capable of building 32 bits binaries."
-	echo -e "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
-	echo -e "For other distributions, refer to their documentation."
+	printf "\nYour Buildroot configuration needs a compiler capable of building 32 bits binaries."
+	echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
+	echo "For other distributions, refer to their documentation."
 	exit 1
     fi
 fi
@@ -198,7 +198,7 @@ fi
 # Check that the Perl installation is complete enough to build
 # host-autoconf.
 if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
-    echo -e "Your Perl installation is not complete enough, at least Data::Dumper is missing."
-    echo -e "On Debian/Ubuntu distributions, install the 'perl' package."
+    echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
+    echo "On Debian/Ubuntu distributions, install the 'perl' package."
     exit 1
 fi
