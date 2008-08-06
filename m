From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 06 Aug 2008 08:18:02 +0200
Subject: [Buildroot] [PATCH] Robusitfy compiler version checks
Message-ID: <1218003482.29697.6.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output of "gcc --version" (and equivalently for g++) is somewhat
volatile.  Specifically, the output from GCC 4.3.1 prerelease which
ships with OpenSUSE 11.0 doesn't come close to matching the required
pattern in the dependency check script.

The output of gcc -v however is standard between releases and across
platforms.  It contains a line of the form

gcc version <version> <spoodge>

We can match this reliably and safely, so let's do that instead.

This has been tested across all the systems I have to hand - openSUSE
10.3, 11.0, Xandros, Debian and Cygwin.

Someone with a black belt in sed-fu might be able to simplify this a
bit :-)

Signed-off-by: Ben Nizette <bn@niasdigital.com>
---

diff --git a/toolchain/dependencies/dependencies.sh b/toolchain/dependencies/dependencies.sh
index 6b026fd..0d67e3a 100755
--- a/toolchain/dependencies/dependencies.sh
+++ b/toolchain/dependencies/dependencies.sh
@@ -194,7 +194,8 @@ if [ -z "$COMPILER" ]; then
 	exit 1
 fi
 
-COMPILER_VERSION=$($COMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
+COMPILER_VERSION=$($COMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
+	$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 if [ -z "$COMPILER_VERSION" ]; then
 	echo "gcc installed:					FALSE"
 	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n"
@@ -224,7 +225,8 @@ if [ -z "$CXXCOMPILER" ]; then
 	/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
 	#exit 1
 else
-	CXXCOMPILER_VERSION=$($CXXCOMPILER --version 2>&1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g" -e '1q')
+	CXXCOMPILER_VERSION=$($CXXCOMPILER -v 2>&1 | $XSED -n '/^gcc version/p' |
+		$XSED -e 's/^gcc version \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g' -e '1q')
 	if [ -z "$CXXCOMPILER_VERSION" ]; then
 		echo "c++ installed:					FALSE"
 		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
