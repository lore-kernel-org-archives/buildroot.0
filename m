From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 17:40:23 +0100
Subject: [Buildroot] [PATCH] package/libcurl: add option for no SSL/TLS
 support
Message-ID: <20191231164023.10258-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we already have a choice to select the backend to do crypto, push
the limits even further and add an option to do no crypto.

Usually, we would have added that option first in the choice, but if we
were to do that now, existing defconfigs that previously used openssl
(the first item in the choice) would now default to non crypto, which is
not so nice. So we add the new option last in the choice.

Each crypto backend option is used in a conditional block, each of which
default to disabling said backend. So, selecting none will indeed
disable all.

We can now drop the blind intermediate option that would hide the choice
when no backend library was available; there will now always be at least
the none option in the choice, so we need not hide it.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Cc: Julien Grossholtz <julien.grossholtz@openest.io>
---
 package/libcurl/Config.in | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
index 3a9ee0f121..652285c0f8 100644
--- a/package/libcurl/Config.in
+++ b/package/libcurl/Config.in
@@ -45,17 +45,8 @@ config BR2_PACKAGE_LIBCURL_EXTRA_PROTOCOLS_FEATURES
 	  - DICT
 	  - Gopher
 
-config BR2_PACKAGE_LIBCURL_TLS_SUPPORT
-	bool
-	default y if BR2_PACKAGE_OPENSSL
-	default y if BR2_PACKAGE_GNUTLS
-	default y if BR2_PACKAGE_LIBNSS
-	default y if BR2_PACKAGE_MBEDTLS
-	default y if BR2_PACKAGE_WOLFSSL
-
 choice
 	prompt "SSL/TLS library to use"
-	depends on BR2_PACKAGE_LIBCURL_TLS_SUPPORT
 
 config BR2_PACKAGE_LIBCURL_OPENSSL
 	bool "OpenSSL"
@@ -77,9 +68,9 @@ config BR2_PACKAGE_LIBCURL_WOLFSSL
 	bool "WolfSSL"
 	depends on BR2_PACKAGE_WOLFSSL
 
+config BR2_PACKAGE_LIBCURL_TLS_NONE
+	bool "None"
+
 endchoice
 
-comment "A TLS library is needed for SSL/TLS support"
-	depends on !BR2_PACKAGE_LIBCURL_TLS_SUPPORT
-
 endif
-- 
2.20.1
