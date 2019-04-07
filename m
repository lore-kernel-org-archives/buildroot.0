From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 18:32:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/civetweb: fix static build with
 openssl
Message-ID: <20190407163231.20134-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use pkg-config to retrieve openssl dependencies such as atomic

Fixes:
 - http://autobuild.buildroot.org/results/b2e210bdefe84f4ec9cfda79a33d81788fb7e66c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/civetweb/civetweb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index fe1cdd5675..94e8f10e26 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -32,8 +32,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 CIVETWEB_COPT += -DNO_SSL_DL
-CIVETWEB_LIBS += -lssl -lcrypto -lz
-CIVETWEB_DEPENDENCIES += openssl
+CIVETWEB_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libssl libcrypto`
+CIVETWEB_DEPENDENCIES += host-pkgconf openssl
 else
 CIVETWEB_COPT += -DNO_SSL
 endif
-- 
2.20.1
