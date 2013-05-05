From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  5 May 2013 17:54:11 -0300
Subject: [Buildroot] [PATCH] bind: fix build failure for static+openssl
Message-ID: <1367787251-725-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bind just links to openssl libraries without checking it's dependencies.
This works when doing shared builds since the linker picks the deps up,
but fails badly on static builds.
So just define LIBS="-lz" when openssl is enabled. Fixes:
http://autobuild.buildroot.net/results/a9a166f932e0b6727ae8e470ce748418797875b9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8a66534..f689594 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -30,7 +30,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
-	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr
+	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz"
 else
 	BIND_CONF_OPT += --with-openssl=no
 endif
-- 
1.8.1.5
