From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 28 Mar 2011 04:35:06 -0400
Subject: [Buildroot] [PATCH] autotools: add with/without and enable/disable
	helpers
Message-ID: <1301301306-18134-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than have to write ugly logic in every package .mk file to check
a config var and then expand into a --{en,dis}able-foo flag, add helpers
so code can cleanly expand things.

A simple example:
- ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
- SDL_MIXER_CONF_OPT += --enable-music-ogg
- else
- SDL_MIXER_CONF_OPT += --disable-music-ogg
- endif
+ SDL_MIXER_CONF_OPT += $(call USE_ENABLE,LIBVORBIS,music-ogg)

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/Makefile.autotools.in |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index d445348..e8d1eb0 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -279,3 +279,17 @@ else
 $(call AUTOTARGETS_INNER,$(2),$(call UPPERCASE,$(2)),$(call UPPERCASE,$(2)),$(1),target)
 endif
 endef
+
+################################################################################
+# AUTOTOOLS HELPERS
+################################################################################
+
+# $(call _USE_CONF,enable,disable,LIB_FFMPEG,video,blah) -> --enable-video=blah if LIB_FFMPEG
+# $(call _USE_CONF,with,without,LIB_FFMPEG,video)        -> --with-video if LIB_FFMPEG
+_USE_CONF = $(if $(BR2_PACKAGE_$(3)), --$(1)-$(4)$(if $(5),=$(5)), --$(2)-$(4))
+
+# $(call USE_ENABLE,LIB_FFMPEG,video) => --enable-video if LIB_FFMPEG is set
+USE_ENABLE = $(call _USE_CONF,enable,disable,$(1),$(2),$(3))
+
+# $(call USE_WITH,LIB_FFMPEG,video) => --with-video if LIB_FFMPEG is set
+USE_WITH = $(call _USE_CONF,with,without,$(1),$(2),$(3))
-- 
1.7.4.1
