From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Aug 2016 11:39:26 +0200
Subject: [Buildroot] [PATCH] package/neon: properly enable expat
Message-ID: <1472463566-10906-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we forcibly tell neon's configure where to look for libexpat.
This means that neon does not search for it, and consequently forgets to
add -lexpat as its Libs.Private in its .pc file. As thus, a static link
against neon forgets to pull in -lexpat (it works for a dynamic link
because libneon has a NEEDED on libexpat).

The reason for specifying the explicit path in this case is lost to
history; neon's configure can correctly find libexpat nowadays.

Fixes:
    http://autobuild.buildroot.org/results/884/884746351fc47f4ad19fb3fda7c5e0ee85fcff15/
    http://autobuild.buildroot.org/results/0c5/0c584522c26640e29980150a87a5b5d8c02e5f8b/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 0cff1a2..13d8084 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -28,7 +28,7 @@ NEON_CONF_OPTS += --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_NEON_EXPAT),y)
-NEON_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr/lib/libexpat.la
+NEON_CONF_OPTS += --with-expat=yes
 NEON_DEPENDENCIES += expat
 else
 NEON_CONF_OPTS += --with-expat=no
-- 
2.7.4
