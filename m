From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  9 May 2018 19:59:24 +0200
Subject: [Buildroot] [PATCH] support/dependencies: check that PATH does not
 contain CWD
Message-ID: <20180509175924.10867-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

... and simplify the test code for PATH and LD_LIBRARY_PATH.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 59 ++++++++++++++----------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 985b1d863b..f98678973b 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -11,27 +11,30 @@ if test $? != 0 ; then
 	exit 1
 fi
 
-# sanity check for CWD in LD_LIBRARY_PATH
-# try not to rely on egrep..
-if test -n "$LD_LIBRARY_PATH" ; then
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep '::' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.:' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start:' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':TRiGGER_end' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
-	if test $? = 0; then
-		echo
-		echo "You seem to have the current working directory in your"
-		echo "LD_LIBRARY_PATH environment variable. This doesn't work."
-		exit 1;
-	fi
-fi;
+# Sanity check for CWD in LD_LIBRARY_PATH
+case ":${LD_LIBRARY_PATH:-unset}:" in
+(*::*|*:.:*)
+	echo
+	echo "You seem to have the current working directory in your"
+	echo "LD_LIBRARY_PATH environment variable. This doesn't work."
+	exit 1
+	;;
+esac
 
-# PATH should not contain a newline, otherwise it fails in spectacular ways
-# as soon as PATH is referenced in a package rule
-case "${PATH}" in
+# Sanity check for CWD in PATH. Having the current working directory
+# in the PATH makes various packages (e.g. toolchain, coreutils...)
+# build process break.
+# PATH should not contain a newline, otherwise it fails in spectacular
+# ways as soon as PATH is referenced in a package rule
+# An empty PATH is technically possible, but in practice we would not
+# even arrive here if that was the case.
+case ":${PATH:-unset}:" in
+(*::*|*:.:*)
+	echo
+	echo "You seem to have the current working directory in your"
+	echo "PATH environment variable. This doesn't work."
+	exit 1
+	;;
 (*"
 "*)	printf "\n"
 	# Break the '\n' sequence, or a \n is printed (which is not what we want).
@@ -41,22 +44,6 @@ case "${PATH}" in
 	;;
 esac
 
-# sanity check for CWD in PATH. Having the current working directory
-# in the PATH makes the toolchain build process break.
-# try not to rely on egrep..
-if test -n "$PATH" ; then
-	echo TRiGGER_start"$PATH"TRiGGER_end | grep ':\.:' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$PATH"TRiGGER_end | grep 'TRiGGER_start\.:' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$PATH"TRiGGER_end | grep ':\.TRiGGER_end' >/dev/null 2>&1 ||
-	echo TRiGGER_start"$PATH"TRiGGER_end | grep 'TRiGGER_start\.TRiGGER_end' >/dev/null 2>&1
-	if test $? = 0; then
-		echo
-		echo "You seem to have the current working directory in your"
-		echo "PATH environment variable. This doesn't work."
-		exit 1;
-	fi
-fi;
-
 if test -n "$PERL_MM_OPT" ; then
 	echo
 	echo "You have PERL_MM_OPT defined because Perl local::lib"
-- 
2.14.1
