From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Nov 2015 00:31:06 +0100
Subject: [Buildroot] [PATCH] package/minidlna: fix static build
Message-ID: <1447889466-8504-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libvorbix.pc does not exist, it is named vorbis.pc.
Also, sqlite3 was missing when querying pkg-config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index e9df92b..e00fa09 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -17,7 +17,8 @@ MINIDLNA_DEPENDENCIES = \
 ifeq ($(BR2_STATIC_LIBS),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
-MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif libvorbis`
+MINIDLNA_PKGCONFIG_DEPS = libavcodec libexif vorbis sqlite3
+MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs $(MINIDLNA_PKGCONFIG_DEPS)`
 MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
 MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
 else
-- 
1.9.1
