From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  3 Apr 2018 23:20:15 +0300
Subject: [Buildroot] [PATCH] libbsd: needs wide character support
Message-ID: <735ad91388ab3b29dbb08f565c4fe66033d12e6c.1522786815.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
enabled build of libbsd with uClibc. libbsd requires wchar support.
Disable libbsd when uClibc does not provide wchar support.

Fixes:
http://autobuild.buildroot.net/results/4fb/4fb576c644a7322730658ed585bcc4a353a42e85/
http://autobuild.buildroot.net/results/459/45946f11524c57ffa59bf88d4a2ea0d4933fa851/
http://autobuild.buildroot.net/results/ee3/ee3ad5172d6a218dfde4cf3e9fecf1906b0fc642/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libbsd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e80e9ea824c0..47fce04fef21 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  This library provides useful functions commonly found on BSD
 	  systems, and lacking on others like GNU systems, thus making
@@ -20,6 +21,6 @@ config BR2_PACKAGE_LIBBSD
 
 	  http://libbsd.freedesktop.org/
 
-comment "libbsd needs a toolchain w/ threads"
+comment "libbsd needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.16.3
