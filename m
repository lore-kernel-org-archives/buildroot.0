From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 22 Apr 2020 21:20:59 +0200
Subject: [Buildroot] [PATCH 3/3] package/uacme: ualpn needs X509 unsupported
 critical extension support
In-Reply-To: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
References: <20200422192059.790299-1-fontaine.fabrice@gmail.com>
Message-ID: <20200422192059.790299-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.2 and
https://github.com/ndilieto/uacme/commit/ae483af8953fa478de1e224c0c556ba3a77e3e01,
ualpn on mbedtls needs X509 unsupported critical extension support

Fixes:
 - http://autobuild.buildroot.org/results/5d42189299549cd655218e9e7cfcfa63e79f74ec

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uacme/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index c27727d8c7..0d7cea6d6b 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -38,6 +38,7 @@ endchoice
 config BR2_PACKAGE_UACME_UALPN
 	bool "enable ualpn"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PACKAGE_UACME_MBEDTLS || BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
 	select BR2_PACKAGE_LIBEV
 	help
 	  Build and install ualpn, the transparent proxying tls-alpn-01
@@ -46,4 +47,8 @@ config BR2_PACKAGE_UACME_UALPN
 comment "ualpn needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
+comment "ualpn needs X509 unsupported critical extension support in mbedtls"
+	depends on BR2_PACKAGE_UACME_MBEDTLS
+	depends on !BR2_PACKAGE_MBEDTLS_X509_UNSUPPORTED_CRITICAL_EXTENSION
+
 endif
-- 
2.25.1
