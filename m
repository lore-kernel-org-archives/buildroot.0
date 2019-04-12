From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 12 Apr 2019 23:25:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/pure-ftpd: fix static build with
 openssl and latomic
Message-ID: <20190412212529.23242-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/eba8d344446b0db6327c0588c456c14594984f76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pure-ftpd/pure-ftpd.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 7012268874..6b85b0c651 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -40,10 +40,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
-PURE_FTPD_DEPENDENCIES += openssl
-ifeq ($(BR2_STATIC_LIBS),y)
-PURE_FTPD_CONF_ENV += LIBS='-lssl -lcrypto -lz'
-endif
+PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
+PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
-- 
2.20.1
