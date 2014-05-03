From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 May 2014 00:45:43 +0200
Subject: [Buildroot] [PATCH v3 1/2] infra: Add generic check_prog_host
	function
Message-ID: <1399157144-4112-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid copy/pasting the same block of code to check if a program is
available on the host machine.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v2 -> v3:
    - None
Changes v1 -> v2:
    - Remove the introduction of BR2_NEEDS_HOST_JAVAC &
      BR2_NEEDS_HOST_JAR to add them in the classpath patch. (Thomas De
      Schampheleire)
---
 support/dependencies/dependencies.sh | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0566814..655b4c6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -51,18 +51,20 @@ if test -n "$PERL_MM_OPT" ; then
 	exit 1
 fi
 
-# Verify that which is installed
-if ! which which > /dev/null ; then
-	echo
-	echo "You must install 'which' on your build machine";
-	exit 1;
-fi;
+check_prog_host()
+{
+	prog="$1"
+	if ! which $prog > /dev/null ; then
+		echo >&2
+		echo "You must install '$prog' on your build machine" >&2
+		exit 1
+	fi
+}
 
-if ! which sed > /dev/null ; then
-	echo
-	echo "You must install 'sed' on your build machine"
-	exit 1
-fi
+# Verify that which is installed
+check_prog_host "which"
+# Verify that sed is installed
+check_prog_host "sed"
 
 # Check make
 MAKE=$(which make 2> /dev/null)
@@ -196,11 +198,7 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 fi
 
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
-	if ! which java > /dev/null ; then
-		echo >&2
-		echo "You must install 'java' on your build machine" >&2
-		exit 1
-	fi
+	check_prog_host "java"
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
-- 
1.9.2
