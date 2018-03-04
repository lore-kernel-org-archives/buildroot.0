From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Mar 2018 11:29:06 +0100
Subject: [Buildroot] [PATCH 4/4] core: drop no-longer used C.UTF-8 locale
 option
In-Reply-To: <cover.1520159327.git.yann.morin.1998@free.fr>
References: <cover.1520159327.git.yann.morin.1998@free.fr>
Message-ID: <27e66e08ce8a1493c52a43e2a34aa1ed75a043f9.1520159327.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Its use has been globbed into the more generic
BR2_NEEDS_HOST_UTF8_LOCALE option now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Julius Kriukas <julius@kriukas.lt>
Cc: Christian Stewart <kidovate@gmail.com>
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
-- 
2.14.1
