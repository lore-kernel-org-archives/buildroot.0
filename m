From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:33 +0200
Subject: [Buildroot] [PATCH 27/49 v2] package/asterisk: add support for PRI
	signalling
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <7b16f946d7d3bfc046ebe62a0341110f21e74bb9.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 3fe512e0ed..1fdb5c6902 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -74,7 +74,6 @@ ASTERISK_CONF_OPTS = \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-pri \
 	--without-pwlib \
 	--without-resample \
 	--without-sdl \
@@ -203,6 +202,13 @@ ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
 ASTERISK_DEPENDENCIES += dahdi-linux dahdi-tools
 ASTERISK_CONF_OPTS += --with-dahdi --with-tonezone
 
+ifeq ($(BR2_PACKAGE_LIBPRI),y)
+ASTERISK_DEPENDENCIES += libpri
+ASTERISK_CONF_OPTS += --with-pri
+else
+ASTERISK_CONF_OPTS += --without-pri
+endif # PRI
+
 ifeq ($(BR2_PACKAGE_LIBSS7),y)
 ASTERISK_DEPENDENCIES += libss7
 ASTERISK_CONF_OPTS += --with-ss7
@@ -211,7 +217,9 @@ ASTERISK_CONF_OPTS += --without-ss7
 endif # SS7
 
 else
-ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone --without-ss7
+ASTERISK_CONF_OPTS += \
+	--without-dahdi --without-tonezone \
+	--without-pri --without-ss7
 endif # DAHDI
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.11.0
