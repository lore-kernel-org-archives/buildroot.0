From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 31 Dec 2013 11:07:29 +0200
Subject: [Buildroot] [PATCH 1/3] php: fix build for xtensa
In-Reply-To: <cover.1388480526.git.baruch@tkos.co.il>
References: <cover.1388480526.git.baruch@tkos.co.il>
Message-ID: <cb65b97a2a3ae338abbdf2a3f56eb7f74672091b.1388480526.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The php package generates a binary that is too large for the xtensa default
placement of literals in a dedicated section. Use -mtext-section-literal to
place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/a9a/a9a1063104402ec28e01560ec7c8f8a5b6d43dd5/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/php/php.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/php/php.mk b/package/php/php.mk
index 10c314f..f31217e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -36,6 +36,10 @@ ifneq ($(BR2_INET_IPV6),y)
 endif
 endif
 
+ifeq ($(BR2_xtensa),y)
+PHP_CFLAGS += -mtext-section-literals
+endif
+
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CLI),,--disable-cli)
 PHP_CONF_OPT += $(if $(BR2_PACKAGE_PHP_CGI),,--disable-cgi)
 
-- 
1.8.5.2
