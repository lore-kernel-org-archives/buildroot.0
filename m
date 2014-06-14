From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 19:55:28 +0200
Subject: [Buildroot] [git commit] classpath: Use generic check for host
	program
Message-ID: <20140614175610.04C0999EAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f9da282b299c667a20b636d7512144283fd92c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the specific check that was done in dependencies.sh to use the
generic one that were introduced by the previous patch.

Also, introduce, BR2_NEEDS_HOST_JAVAC and BR2_NEEDS_HOST_JAR as it is
needed by classpath.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                            |   10 ++++++++++
 package/classpath/Config.in          |    2 ++
 support/dependencies/dependencies.sh |   18 ++++++++----------
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/Config.in b/Config.in
index 8ff725a..f13ae36 100644
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
diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index 0153bca..a11845c 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
+	select BR2_NEEDS_HOST_JAR
+	select BR2_NEEDS_HOST_JAVAC
 	depends on BR2_PACKAGE_JAMVM
 	depends on BR2_INET_IPV6
 	help
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 655b4c6..255a07b 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -187,20 +187,18 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG > /dev/null && \
 	fi
 fi
 
-if grep -q ^BR2_PACKAGE_CLASSPATH=y $BR2_CONFIG ; then
-	for prog in javac jar; do
-		if ! which $prog > /dev/null ; then
-			echo >&2
-			echo "You must install '$prog' on your build machine" >&2
-			exit 1
-		fi
-	done
-fi
-
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
 fi
 
+if grep -q ^BR2_NEEDS_HOST_JAVAC=y $BR2_CONFIG ; then
+	check_prog_host "javac"
+fi
+
+if grep -q ^BR2_NEEDS_HOST_JAR=y $BR2_CONFIG ; then
+	check_prog_host "jar"
+fi
+
 if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
 	if test ! -f /lib/ld-linux.so.2 ; then
 		echo
