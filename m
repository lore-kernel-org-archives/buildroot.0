From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Sep 2017 09:48:29 +0200
Subject: [Buildroot] [PATCH 1/1] util-linux: linux-pam is needed for su
Message-ID: <20170903074829.3782-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With linux-pam, the configure script bails out with:

configure: error: su selected, but required PAM header file not available

Fixes:
http://autobuild.buildroot.net/results/338/3381a49d17aa0d4b9711cbb36a5d7b563a8ae08f/
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/util-linux/Config.in | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index d2a925c1b..80aab881a 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -330,10 +330,18 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 
 config BR2_PACKAGE_UTIL_LINUX_SU
 	bool "su"
-	depends on BR2_USE_MMU # fork()
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	depends on BR2_USE_MMU # fork(), linux-pam
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Run a command with substitute user and group ID
 
+comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
 	depends on BR2_USE_MMU # fork()
-- 
2.11.0
