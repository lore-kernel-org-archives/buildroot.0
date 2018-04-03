From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 22:52:19 +0200
Subject: [Buildroot] [git commit] libbsd: needs wide character support
Message-ID: <20180403205247.B24F483DBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61ae04b87a700762995d39f3347817cadfc8716b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d879be30495 (package/libbsd: enable for non-glibc toolchains)
enabled build of libbsd with uClibc. libbsd requires wchar support.
Disable libbsd when uClibc does not provide wchar support.

Fixes:
http://autobuild.buildroot.net/results/4fb/4fb576c644a7322730658ed585bcc4a353a42e85/
http://autobuild.buildroot.net/results/459/45946f11524c57ffa59bf88d4a2ea0d4933fa851/
http://autobuild.buildroot.net/results/ee3/ee3ad5172d6a218dfde4cf3e9fecf1906b0fc642/

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index e80e9ea824..47fce04fef 100644
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
