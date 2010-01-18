From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Jan 2010 15:14:18 +0100
Subject: [Buildroot] [git commit master] rpm: needs XML support in libneon
Message-ID: <20100118141648.20C0377708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1653a281b99d12a4bf69cebb73394edab9485b01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RPM-5.2.0 needs the optional XML support in libneon.

Restructure kconfig dependencies to ensure rpm can only be selected
if libneon with XML support (in addition to SSL + ZLIB) is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/rpm/Config.in |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index e6e8769..448606c 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -1,12 +1,14 @@
+comment "rpm requires libneon with SSL, XML and ZLIB support"
+	depends on !BR2_PACKAGE_NEON || BR2_PACKAGE_NEON_NOXML
+
 config BR2_PACKAGE_RPM
 	bool "rpm"
 	select BR2_PACKAGE_BEECRYPT
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_NEON
+	depends on BR2_PACKAGE_NEON
+	depends on !BR2_PACKAGE_NEON_NOXML
 	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_NEON_EXPAT if BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_NEON_LIBXML2 if BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NEON_SSL
 	help
 	  The RPM package management system.
-- 
1.6.3.3
