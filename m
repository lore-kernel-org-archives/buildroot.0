From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 Jan 2019 08:44:55 +0200
Subject: [Buildroot] [PATCH] swupdate: requires shared library support
Message-ID: <4e138ec5f0641da3b17aa6e8ab35e326d040cf21.1547189095.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 2018.11 swupdate builds its lua binding as a shared
library unconditionally.

Fixes:
http://autobuild.buildroot.net/results/557/55767e58c211656558af7916a4e0975089a2785b/
http://autobuild.buildroot.net/results/073/07391b074a2fb16d2925320e16535e177a923089/
http://autobuild.buildroot.net/results/9e2/9e2b90b557576fd0b633a19b335ff1a7ee64ce69/

Cc: J?rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/swupdate/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index ca2eaf294013..f208bd412095 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SWUPDATE
 	bool "swupdate"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	# swupdate requires a parser and uses libconfig as default
 	select BR2_PACKAGE_LIBCONFIG if !BR2_PACKAGE_JSON_C && \
@@ -59,6 +60,6 @@ config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	  installed to /var/www/swupdate.
 endif
 
-comment "swupdate needs a toolchain w/ threads"
+comment "swupdate needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.20.1
