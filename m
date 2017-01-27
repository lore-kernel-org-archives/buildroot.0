From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 27 Jan 2017 10:12:27 +0100
Subject: [Buildroot] [PATCH] package/mpd: bump to version 0.20.3
Message-ID: <20170127091227.2543-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch #2 which has been applied upstream.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...002-Makefile.am-fix-linking-xiph-with-ogg.patch | 41 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch

diff --git a/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch b/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch
deleted file mode 100644
index 1fe609508..000000000
--- a/package/mpd/0002-Makefile.am-fix-linking-xiph-with-ogg.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6ef588b2c230eae15f7f2563eca9d5f40c78d1d0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 11 Jan 2017 21:06:37 +0100
-Subject: [PATCH] Makefile.am: fix linking xiph with ogg
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The internal static xiph library needs to link with libogg. Otherwise
-building mpd will fail:
-
-```
-/mips-linux-gnu/bin/ld: libxiph.a(libxiph_a-OggVisitor.o): undefined
-reference to symbol 'ogg_stream_packetout'
-```
-
-Upstream status: Pending
-http://mailman.blarg.de/pipermail/mpd-devel/2017-January/000594.html
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index e0202b0cc..9030e68fb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -614,7 +614,8 @@ libxiph_a_SOURCES += \
- 	src/lib/xiph/OggStreamState.hxx
- endif
- 
--XIPH_LIBS = libxiph.a
-+XIPH_LIBS = libxiph.a \
-+	$(OGG_LIBS)
- 
- endif
- 
--- 
-2.11.0
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index e1da99475..e4709e691 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  552a87d71c2981baeddf28c1856a7e071ea0236dd38bc75ec25d58529605ff77  mpd-0.20.2.tar.xz
+sha256  2238c1233f5318800ede7c37eeaf705c04920315de572dc666aff6ca682eb0f9  mpd-0.20.3.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 446973730..527de7751 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.20
-MPD_VERSION = $(MPD_VERSION_MAJOR).2
+MPD_VERSION = $(MPD_VERSION_MAJOR).3
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost
-- 
2.11.0
