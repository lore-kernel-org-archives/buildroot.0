From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Apr 2014 21:58:08 +0200
Subject: [Buildroot] [PATCH 6/6] system: allow setting the local timezone
	for uClibc
In-Reply-To: <cover.1396900553.git.yann.morin.1998@free.fr>
References: <cover.1396900553.git.yann.morin.1998@free.fr>
Message-ID: <d6e21684e5985a2d9c710447082cf576d956e328.1396900553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

---
Changes v3 -> v4
  - do not double-depend on glibc||uClibc
---
 system/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index c700729..d15c3aa 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -269,8 +269,10 @@ endif
 
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
 
@@ -283,7 +285,7 @@ config BR2_TARGET_TZ_ZONELIST
 	  Space-separated list of time zones to compile.
 
 	  The value "default" includes all commonly used time zones. Note
-	  that this set consumes around 5.5M.
+	  that this set consumes around 5.5M for (e)glibc and 2.1M for uClibc.
 
 	  The full list is the list of files in the time zone database source,
 	  not including the build and .tab files.
-- 
1.8.3.2
