From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 17 Jun 2012 10:07:40 +0100
Subject: [Buildroot] [PATCH] libfreefare: add missing openssl dependency
Message-ID: <1339924060-4250-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

If openssl is not selected, configuration fails for the libfreefare package
as follows.

  configure: error: Cannot find libcrypto.

This patch adds the missing dependency on openssl.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libfreefare/Config.in      |    4 ++++
 package/libfreefare/libfreefare.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
index 2e11f7e..438bcbf 100644
--- a/package/libfreefare/Config.in
+++ b/package/libfreefare/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBFREEFARE
 	bool "libfreefare"
+	depends on BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library for high level manipulation of MIFARE cards.
 
 	  http://code.google.com/p/nfc-tools/wiki/libfreefare
+
+comment "libfreefare requires openssl"
+	depends on !BR2_PACKAGE_OPENSSL
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
index 0499999..16ef8fb 100644
--- a/package/libfreefare/libfreefare.mk
+++ b/package/libfreefare/libfreefare.mk
@@ -5,6 +5,6 @@
 #############################################################
 LIBFREEFARE_VERSION = 0.3.2
 LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
-LIBFREEFARE_DEPENDENCIES = libnfc
+LIBFREEFARE_DEPENDENCIES = libnfc openssl
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.5
