From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 23 Feb 2014 13:57:21 +0100
Subject: [Buildroot] [PATCH 2/2] classpath: Use generic check for host
	program
In-Reply-To: <1393160241-10015-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393160241-10015-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1393160241-10015-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove the specific check that was done in dependencies.sh to use the
generic one that were introduced by the previous patch.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/classpath/Config.in          |  2 ++
 support/dependencies/dependencies.sh | 10 ----------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/classpath/Config.in b/package/classpath/Config.in
index 0153bca..6eabacd 100644
--- a/package/classpath/Config.in
+++ b/package/classpath/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_CLASSPATH
 	bool "classpath"
+	select BR2_HOST_NEEDS_JAVAC
+	select BR2_HOST_NEEDS_JAR
 	depends on BR2_PACKAGE_JAMVM
 	depends on BR2_INET_IPV6
 	help
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index e5a6e36..e9d2613 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -191,16 +191,6 @@ if grep ^BR2_TOOLCHAIN_BUILDROOT=y $BR2_CONFIG > /dev/null && \
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
-- 
1.8.5.3
