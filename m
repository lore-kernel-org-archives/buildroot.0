From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 11:57:48 +0100
Subject: [Buildroot] [git commit] php: fix build for xtensa
Message-ID: <20131231105813.62B439C2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=410c3cf7ebe69016e73bbe63d1ba4b0a251b5c9a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The php package generates a binary that is too large for the xtensa default
placement of literals in a dedicated section. Use -mtext-section-literal to
place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/a9a/a9a1063104402ec28e01560ec7c8f8a5b6d43dd5/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
 
