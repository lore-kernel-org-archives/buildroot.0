From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 10:49:34 +0100
Subject: [Buildroot] [git commit] package/minidlna: fix static build
Message-ID: <20151119101937.6BD707FE17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de5bfeac56da3a49fadad9c60898bea4fadf54dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libvorbis.pc does not exist, it is named vorbis.pc.
Also, sqlite3 was missing when querying pkg-config.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
