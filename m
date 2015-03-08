From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 08 Mar 2015 15:22:57 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check for
	host-wine
Message-ID: <54FC5B41.5050004@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
v2: minor fixes
v3: Add comment and only modify HOST variables

 package/wine/wine.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 571606d..df13ef7 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -243,6 +243,15 @@ else
 WINE_CONF_OPTS += --without-zlib
 endif
 
+# selecting gettext also enables host-gettext which is
+# essential for .po file support in wrc from host-wine
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+HOST_WINE_CONF_OPTS += --with-gettext --with-gettextpo
+HOST_WINE_DEPENDENCIES += host-gettext
+else
+HOST_WINE_CONF_OPTS += --without-gettext --without-gettextpo
+endif
+
 # Wine needs to enable 64-bit build tools on 64-bit host
 ifeq ($(HOSTARCH),x86_64)
 HOST_WINE_CONF_OPTS += --enable-win64
@@ -280,8 +289,6 @@ HOST_WINE_CONF_OPTS += \
 	--without-curses \
 	--without-dbus \
 	--without-fontconfig \
-	--without-gettext \
-	--without-gettextpo \
 	--without-gphoto \
 	--without-glu \
 	--without-gnutls \
