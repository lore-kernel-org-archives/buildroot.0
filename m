From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Mar 2014 23:10:26 +0100
Subject: [Buildroot] [PATCH 7/7] system: allow setting the local timezone
	for uClibc
In-Reply-To: <cover.1393884458.git.yann.morin.1998@free.fr>
References: <cover.1393884458.git.yann.morin.1998@free.fr>
Message-ID: <8d077cf232f771f415eb591b285ced22711fba9d.1393884458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 system/Config.in | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 008369f..cea9429 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -267,8 +267,10 @@ endif
 
 config BR2_TARGET_TZ_INFO
 	bool "Install timezone info"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_TZDATA
+	# No timezone for musl; only for uClibc or (e)glibc.
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
+	select BR2_PACKAGE_TZDATA if BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_TZ if BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Say 'y' here to install timezone info.
 
@@ -276,11 +278,13 @@ if BR2_TARGET_TZ_INFO
 
 config BR2_TARGET_TZ_ZONELIST
 	string "timezone list"
+	# Only valid for uClibc or (e)glibc
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  Space-separated list of time zones to compile.
 
 	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M.
+	  that this set consumes around 5.5M for (e)glibc and 2.1M for uClibc.
 
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
-- 
1.8.3.2
