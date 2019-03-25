From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Mar 2019 23:08:06 +0200
Subject: [Buildroot] [PATCH] package/putty: disable for uClibc
Message-ID: <27bfbaf6559b347026d81f24451b3a43a8c99a9f.1553548086.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

putty now uses the futimes() BSD extension that uClibc does not
implement.

Fixes:
http://autobuild.buildroot.net/results/801/801e2b2909363b5dcd9735362bb921e017569edc/
http://autobuild.buildroot.net/results/398/3984c6cdd3398645c8ad98bbe23af9090cf4bfcf/
http://autobuild.buildroot.net/results/632/632f93046f9cceffd9b604911542426c10967e0f/

Cc: Alexander Dahl <post@lespocky.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/putty/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/putty/Config.in b/package/putty/Config.in
index f901c71da297..065a7152f705 100644
--- a/package/putty/Config.in
+++ b/package/putty/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PUTTY
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # futimes
 	help
 	  PuTTY is a free SSH and Telnet client. Without GTK2
 	  activated, only the commandline tools plink, pscp, psftp,
@@ -11,6 +12,7 @@ config BR2_PACKAGE_PUTTY
 
 	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
 
-comment "putty needs a toolchain w/ wchar, dynamic library"
+comment "putty needs a glibc or musl toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.20.1
