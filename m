From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon,  6 Feb 2017 21:01:23 +0100
Subject: [Buildroot] [PATCH] package/mbedtls: make compression support a
	config option
Message-ID: <20170206200123.25375-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling TLS compression may make mbedTLS vulnerable to the
CRIME attack [1]. It should not be enabled unless is is sure CRIME and
similar attacks are not applicable to the particulare situation.

As zlib is probably enabled in most systems, the user might end up with
a vulnerable system without knowing. So, instead of enabling compression
support if the zlib package is available, we make the compression support
a config option. This way, the user has to explicitly enable compression
support and is warned by the help text about the risk.

[1] https://tls.mbed.org/kb/how-to/deflate-compression-in-ssl-tls

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mbedtls/Config.in  | 12 ++++++++++++
 package/mbedtls/mbedtls.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mbedtls/Config.in b/package/mbedtls/Config.in
index 24f0f489d..42bdcc4d1 100644
--- a/package/mbedtls/Config.in
+++ b/package/mbedtls/Config.in
@@ -17,4 +17,16 @@ config BR2_PACKAGE_MBEDTLS_PROGRAMS
 	  This option enables the installation and the build of
 	  mbed TLS companion programs.
 
+config BR2_PACKAGE_MBEDTLS_COMPRESSION
+	bool "enable compression support"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable support for compression of the content data before it
+	  enters the secure channel as described in RFC 3749.
+	  
+	  Warning: TLS compression may make you vulnerable to the CRIME
+	  attack. You shoud not enable it unless you know for sure CRIME
+	  and similar attacks are not applicable to your particular
+	  situation.
+
 endif
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 7171af9f9..198879da4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -39,7 +39,7 @@ MBEDTLS_CONF_OPTS += \
 	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
+ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
 MBEDTLS_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
 MBEDTLS_DEPENDENCIES += zlib
 define MBEDTLS_ENABLE_ZLIB
-- 
2.11.1
