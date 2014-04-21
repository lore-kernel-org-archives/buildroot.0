From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 Apr 2014 07:54:54 +0200
Subject: [Buildroot] [PATCH] util-linux: fix chfn/chsh missing dependencies
Message-ID: <1398059694-9745-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

chfn/chsh utilities need linux-pam.

Fixes:
  http://autobuild.buildroot.org/results/cfc/cfc5fd00b9db21b60efe8b74e9966b6192b1da17/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/util-linux/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index cef8009..28bda11 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -58,9 +58,14 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
+	select BR2_PACKAGE_LINUX_PAM
+	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	help
 	  Change login shell, real user name and information
 
+comment "chfn/chsh needs a toolchain w/ wchar, locale"
+	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
+
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
-- 
1.9.2
