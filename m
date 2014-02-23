From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Feb 2014 13:57:20 +0100
Subject: [Buildroot] [PATCH 1/2] infra: Add generic check_prog_host function
Message-ID: <1393160241-10015-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avoid copy/pasting the same block of code to check if a program is
available on the host machine.

Also, introduce, BR2_NEEDS_HOST_JAVAC and BR2_NEEDS_HOST_JAR.
In a following patch, we will remove the specific check done for
classpath, and the classpath package will use these generic variant.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 Config.in                            | 10 ++++++++++
 support/dependencies/dependencies.sh | 24 +++++++++++++++++++-----
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index 55f5fd8..a24421f 100644
--- a/Config.in
+++ b/Config.in
@@ -23,6 +23,16 @@ config BR2_EXTERNAL
 config BR2_NEEDS_HOST_JAVA
 	bool
 
+# Hidden boolean selected by packages in need of javac in order to build
+# (example: classpath)
+config BR2_NEEDS_HOST_JAVAC
+	bool
+
+# Hidden boolean selected by packages in need of jar in order to build
+# (example: classpath)
+config BR2_NEEDS_HOST_JAR
+	bool
+
 # Hidden boolean selected by pre-built packages for x86, when they
 # need to run on x86-64 machines (example: pre-built external
 # toolchains, binary tools like SAM-BA, etc.).
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index a8261b3..e5a6e36 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -64,6 +64,16 @@ if ! which sed > /dev/null ; then
 	exit 1
 fi
 
+check_prog_host()
+{
+	prog="$1"
+	if ! which $prog > /dev/null ; then
+		echo >&2
+		echo "You must install '$prog' on your build machine" >&2
+		exit 1
+	fi
+}
+
 # Check make
 MAKE=$(which make 2> /dev/null)
 if [ -z "$MAKE" ] ; then
@@ -192,11 +202,15 @@ if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
 fi
 
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
-	if ! which java > /dev/null ; then
-		echo >&2
-		echo "You must install 'java' on your build machine" >&2
-		exit 1
-	fi
+	check_prog_host "java"
+fi
+
+if grep -q ^BR2_NEEDS_HOST_JAVAC=y $BR2_CONFIG ; then
+	check_prog_host "javac"
+fi
+
+if grep -q ^BR2_NEEDS_HOST_JAR=y $BR2_CONFIG ; then
+	check_prog_host "jar"
 fi
 
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
-- 
1.8.5.3
