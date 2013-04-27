From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:47 -0300
Subject: [Buildroot] [PATCH 4/6] openssl: integrate variable cryptodev
	support
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1367093389-23877-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow openssl to use cryptodev-linux hardware crypto support besides
OCF.
To do this we remove the OCF option from openssl and automatically use
any of the available implementations when available.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssl/Config.in  | 15 ---------------
 package/openssl/openssl.mk |  7 ++++++-
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 2187023..d1ed520 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -23,18 +23,3 @@ config BR2_PACKAGE_OPENSSL_ENGINES
 	depends on BR2_PACKAGE_OPENSSL
 	help
 	  Install additional encryption engine libraries.
-
-config BR2_PACKAGE_OPENSSL_OCF
-	bool "openssl ocf support"
-	depends on BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_OCF_LINUX
-	help
-	  Enable openssl cryptodev (OCF) hardware acceleration support.
-	  This requires the ocf linux kernel extension or you to provide a
-	  pre-patched kernel that includes it.
-	  If kernel support isn't available it'll just make the libraries
-	  a tiny bit larger with a small CPU overhead when starting up and
-	  checking for the required kernel-side support, and then falling
-	  back to regular builtin support.
-
-	  http://ocf-linux.sourceforge.net/
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 8486c44..2e04789 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -22,7 +22,12 @@ endif
 
 OPENSSL_PRE_CONFIGURE_HOOKS += OPENSSL_DISABLE_APPS
 
-ifeq ($(BR2_PACKAGE_OPENSSL_OCF),y)
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
+	OPENSSL_DEPENDENCIES += cryptodev-linux
+endif
+
+ifeq ($(BR2_PACKAGE_OCF_LINUX),y)
 	OPENSSL_CFLAGS += -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS
 	OPENSSL_DEPENDENCIES += ocf-linux
 endif
-- 
1.8.1.5
