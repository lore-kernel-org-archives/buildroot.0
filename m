From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:31 +0100
Subject: [Buildroot] [PATCH 30/52] package/asterisk: add support for PRI
	signalling
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <28146ce0d2f6202bc7c2f9d6cff69e42760cb94a.1483093662.git.yann.morin.1998@free.fr>
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
index 0a33e61..ea27c56 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -63,7 +63,6 @@ ASTERISK_CONF_OPTS += \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-pri \
 	--without-pwlib \
 	--without-resample \
 	--without-sdl \
@@ -185,6 +184,13 @@ ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
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
@@ -193,7 +199,9 @@ ASTERISK_CONF_OPTS += --without-ss7
 endif # SS7
 
 else
-ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone --without-ss7
+ASTERISK_CONF_OPTS += \
+	--without-dahdi --without-tonezone \
+	--without-pri --without-ss7
 endif # DAHDI
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.7.4
