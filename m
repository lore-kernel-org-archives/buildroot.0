From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Mar 2018 11:59:16 +0100
Subject: [Buildroot] [git commit] core: drop no-longer used C.UTF-8 locale
 option
Message-ID: <20180304110028.6AC1E8138C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1aa2148b0365776a17af3d8e22edd3622d475e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Its use has been globbed into the more generic
BR2_NEEDS_HOST_UTF8_LOCALE option now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Julius Kriukas <julius@kriukas.lt>
Cc: Christian Stewart <kidovate@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in                            |  5 -----
 support/dependencies/dependencies.sh | 13 -------------
 2 files changed, 18 deletions(-)

diff --git a/Config.in b/Config.in
index 704840653e..0002df5176 100644
--- a/Config.in
+++ b/Config.in
@@ -94,11 +94,6 @@ config BR2_HOSTARCH_NEEDS_IA32_COMPILER
 config BR2_NEEDS_HOST_UTF8_LOCALE
 	bool
 
-# Hidden boolean selected by packages that explicitly need C.UTF-8 locale
-# to be available on host system.
-config BR2_NEEDS_HOST_C_UTF8_LOCALE
-	bool
-
 source "arch/Config.in"
 
 menu "Build options"
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 656cb09d42..985b1d863b 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -207,19 +207,6 @@ if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
 	fi
 fi
 
-if grep -q ^BR2_NEEDS_HOST_C_UTF8_LOCALE=y $BR2_CONFIG; then
-	if ! which locale > /dev/null ; then
-		echo
-		echo "You need locale support on your build machine"
-		exit 1 ;
-	fi
-	if ! LC_ALL=C.UTF-8 locale -c charmap | grep -q '^UTF-8$'; then
-		echo
-		echo "You need C.UTF-8 locale suppport on the host system"
-		exit 1 ;
-	fi
-fi
-
 if grep -q ^BR2_NEEDS_HOST_JAVA=y $BR2_CONFIG ; then
 	check_prog_host "java"
 	JAVA_GCJ=$(java -version 2>&1 | grep gcj)
