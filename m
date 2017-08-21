From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 Aug 2017 07:27:16 +0300
Subject: [Buildroot] [PATCH] transmission: fix build without gtk and NLS
	disabled
Message-ID: <dff988c0638beda054e9b28be05fbdbe0140ccf9.1503289636.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The transmission configure script uses with/without instead of
enable/disable to control GTK support. So gtk support was never really
disabled. That broke the build when transmission happened to build after
libgtk3 with NLS disabled.

Fixes:
http://autobuild.buildroot.net/results/e83/e83e112957bbb9b49060fb2b7a5d391b2748b493/
http://autobuild.buildroot.net/results/f5a/f5a77a1ea448498ebd451e4ab308fa647f0a5506/
http://autobuild.buildroot.net/results/d21/d210711ae09d3fb4c6b597c77a457458451a819a/

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---

This also reveals the fact that transmission needs gtk3 not gtk2. But
that's for another patch (after a lengthy build).
---
 package/transmission/transmission.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index f8abb2b8baea..d84e5cb77ded 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -82,10 +82,10 @@ TRANSMISSION_CONF_OPTS += --disable-remote
 endif
 
 ifeq ($(BR2_PACKAGE_TRANSMISSION_GTK),y)
-TRANSMISSION_CONF_OPTS += --enable-gtk
+TRANSMISSION_CONF_OPTS += --with-gtk
 TRANSMISSION_DEPENDENCIES += libgtk2
 else
-TRANSMISSION_CONF_OPTS += --disable-gtk
+TRANSMISSION_CONF_OPTS += --without-gtk
 endif
 
 $(eval $(autotools-package))
-- 
2.14.1
