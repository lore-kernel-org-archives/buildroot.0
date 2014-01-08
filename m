From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 09:00:11 +0100
Subject: [Buildroot] [git commit] minidlna: fix static linking
Message-ID: <20140108082945.20CF58DE52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=822b3f0b0f705c49b50f40abc73a8e274e972f46
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script / Makefile forgets to link with some of the dependent
libraries breaking static linking, so help it along.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/Config.in   |    2 --
 package/minidlna/minidlna.mk |    8 +++++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/minidlna/Config.in b/package/minidlna/Config.in
index 9ec4bb4..1fcecde 100644
--- a/package/minidlna/Config.in
+++ b/package/minidlna/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_MINIDLNA
 	depends on BR2_INET_IPV6 # ffmpeg
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# static build is broken w.r.t libgcc_s
-	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FLAC
 	select BR2_PACKAGE_LIBVORBIS # selects libogg
diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index df9c3bb..94c2641 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -13,8 +13,14 @@ MINIDLNA_DEPENDENCIES = \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
-# static build is broken w.r.t libgcc_s
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+# the configure script / Makefile forgets to link with some of the dependent
+# libraries breaking static linking, so help it along
+MINIDLNA_CONF_ENV = \
+	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
+else
 MINIDLNA_CONF_OPT = \
 	--disable-static
+endif
 
 $(eval $(autotools-package))
