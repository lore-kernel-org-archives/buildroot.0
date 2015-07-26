From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:17:08 +0200
Subject: [Buildroot] [git commit branch/next] package/minidlna: Fix static
	compile
Message-ID: <20150808105641.51C807FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=889a4a8d4f609f9e3c33afc8953d045255ef2b54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.net/results/aeb/aeb5481526497a01ada8ee9403f282a2374b0383/
http://autobuild.buildroot.net/results/255/25536df514477f3210caf4af27f2f107683f7fb2/
http://autobuild.buildroot.net/results/fa1/fa11cb360190b02d08e74997b0abc73079760dfa/
and many others

This is a follow-up for these patches:
http://patchwork.ozlabs.org/patch/493360/
http://patchwork.ozlabs.org/patch/416007/

[Thomas:
  - don't pass --static to pkg-config, since our pkg-config wrapper
    already passes it automatically when BR2_STATIC_LIBS=y.
  - make only one call to pkg-config for all three libraries
  - put the libintl logic separately from the definition of
    MINIDLNA_CONF_ENV.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/minidlna/minidlna.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 3a9ad41..ab93484 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -17,8 +17,9 @@ MINIDLNA_DEPENDENCIES = \
 ifeq ($(BR2_STATIC_LIBS),y)
 # the configure script / Makefile forgets to link with some of the dependent
 # libraries breaking static linking, so help it along
-MINIDLNA_CONF_ENV = \
-	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
+MINIDLNA_STATIC_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libavcodec libexif libvorbis`
+MINIDLNA_STATIC_LIBS += $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)
+MINIDLNA_CONF_ENV += LIBS="$(MINIDLNA_STATIC_LIBS)"
 else
 MINIDLNA_CONF_OPTS = \
 	--disable-static
