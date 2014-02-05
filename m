From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed,  5 Feb 2014 19:25:49 +0100
Subject: [Buildroot] [PATCH v2] dependencies.sh: cleanup dependencies.sh
Message-ID: <1391624749-17039-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cleanup mixed indents and remove commented lines.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 -> v2:
  - The cleanup does not remove the indent in the if block anymore
---
 support/dependencies/dependencies.sh | 119 +++++++++++++++++------------------
 1 file changed, 59 insertions(+), 60 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 47d4d10..4b3e9a9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -1,6 +1,5 @@
 #!/bin/sh
 # vi: set sw=4 ts=4:
-#set -x
 
 export LC_ALL=C
 
@@ -44,12 +43,12 @@ if test -n "$PATH" ; then
 fi;
 
 if test -n "$PERL_MM_OPT" ; then
-    echo
-    echo "You have PERL_MM_OPT defined because Perl local::lib"
-    echo "is installed on your system. Please unset this variable"
-    echo "before starting Buildroot, otherwise the compilation of"
-    echo "Perl related packages will fail"
-    exit 1
+	echo
+	echo "You have PERL_MM_OPT defined because Perl local::lib"
+	echo "is installed on your system. Please unset this variable"
+	echo "before starting Buildroot, otherwise the compilation of"
+	echo "Perl related packages will fail"
+	exit 1
 fi
 
 # Verify that which is installed
@@ -117,10 +116,10 @@ CXXCOMPILER=$(which $HOSTCXX_NOCCACHE 2> /dev/null)
 if [ -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER=$(which c++ 2> /dev/null)
 fi
+
 if [ -z "$CXXCOMPILER" ] ; then
 	echo
 	echo "You may have to install 'g++' on your build machine"
-	#exit 1
 fi
 if [ ! -z "$CXXCOMPILER" ] ; then
 	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | sed -n '/^gcc version/p' |
@@ -149,77 +148,77 @@ fi;
 # Check that a few mandatory programs are installed
 missing_progs="no"
 for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
-    if ! which $prog > /dev/null ; then
-	echo "You must install '$prog' on your build machine";
-	missing_progs="yes"
-	if test $prog = "svn" ; then
-	    echo "  svn is usually part of the subversion package in your distribution"
-	elif test $prog = "hg" ; then
-            echo "  hg is usually part of the mercurial package in your distribution"
-	elif test $prog = "zcat" ; then
-            echo "  zcat is usually part of the gzip package in your distribution"
-	elif test $prog = "bzcat" ; then
-            echo "  bzcat is usually part of the bzip2 package in your distribution"
+	if ! which $prog > /dev/null ; then
+		echo "You must install '$prog' on your build machine";
+		missing_progs="yes"
+		if test $prog = "svn" ; then
+			echo "  svn is usually part of the subversion package in your distribution"
+		elif test $prog = "hg" ; then
+			echo "  hg is usually part of the mercurial package in your distribution"
+		elif test $prog = "zcat" ; then
+			echo "  zcat is usually part of the gzip package in your distribution"
+		elif test $prog = "bzcat" ; then
+			echo "  bzcat is usually part of the bzip2 package in your distribution"
+		fi
 	fi
-    fi
 done
 
 if test "${missing_progs}" = "yes" ; then
-    exit 1
+	exit 1
 fi
 
 if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BUILDROOT_CONFIG > /dev/null && \
-   grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
-   if ! which locale > /dev/null ; then
-       echo
-       echo "You need locale support on your build machine to build a toolchain supporting locales"
-       exit 1 ;
-   fi
-   if ! locale -a | grep -q -i utf8$ ; then
-       echo
-       echo "You need at least one UTF8 locale to build a toolchain supporting locales"
-       exit 1 ;
-   fi
+	grep ^BR2_ENABLE_LOCALE=y       $BUILDROOT_CONFIG > /dev/null ; then
+	if ! which locale > /dev/null ; then
+		echo
+		echo "You need locale support on your build machine to build a toolchain supporting locales"
+		exit 1 ;
+	fi
+	if ! locale -a | grep -q -i utf8$ ; then
+		echo
+		echo "You need at least one UTF8 locale to build a toolchain supporting locales"
+		exit 1 ;
+	fi
 fi
 
 if grep -q ^BR2_PACKAGE_CLASSPATH=y $BUILDROOT_CONFIG ; then
-    for prog in javac jar; do
-	if ! which $prog > /dev/null ; then
-	    echo >&2
-	    echo "You must install '$prog' on your build machine" >&2
-	    exit 1
-	fi
-    done
+	for prog in javac jar; do
+		if ! which $prog > /dev/null ; then
+			echo >&2
+			echo "You must install '$prog' on your build machine" >&2
+			exit 1
+		fi
+	done
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BUILDROOT_CONFIG ; then
-    if test ! -f /lib/ld-linux.so.2 ; then
-	echo
-	echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
-	echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
-	echo "library."
-	echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
-	echo "libstdc++6:i386, and zlib1g:i386 packages."
-	echo "For other distributions, refer to the documentation on how to install the 32 bits"
-	echo "compatibility libraries."
-	exit 1
-    fi
+	if test ! -f /lib/ld-linux.so.2 ; then
+		echo
+		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
+		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
+		echo "library."
+		echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
+		echo "libstdc++6:i386, and zlib1g:i386 packages."
+		echo "For other distributions, refer to the documentation on how to install the 32 bits"
+		echo "compatibility libraries."
+		exit 1
+	fi
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_COMPILER=y $BUILDROOT_CONFIG ; then
-    if ! echo "int main(void) {}" | gcc -m32 -x c - ; then
-	echo
-	echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
-	echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
-	echo "For other distributions, refer to their documentation."
-	exit 1
-    fi
+	if ! echo "int main(void) {}" | gcc -m32 -x c - ; then
+		echo
+		echo "Your Buildroot configuration needs a compiler capable of building 32 bits binaries."
+		echo "If you're running a Debian/Ubuntu distribution, install the gcc-multilib package."
+		echo "For other distributions, refer to their documentation."
+		exit 1
+	fi
 fi
 
 # Check that the Perl installation is complete enough to build
 # host-autoconf.
 if ! perl  -e "require Data::Dumper" > /dev/null 2>&1 ; then
-    echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
-    echo "On Debian/Ubuntu distributions, install the 'perl' package."
-    exit 1
+	echo "Your Perl installation is not complete enough, at least Data::Dumper is missing."
+	echo "On Debian/Ubuntu distributions, install the 'perl' package."
+	exit 1
 fi
-- 
1.8.5.3
