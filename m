From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 3 Apr 2011 22:51:54 +0200
Subject: [Buildroot] [git commit /heads/master] mpd: fix build with tremor
	support
Message-ID: <20110403205311.C72BC81F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4d1118e2d83bcb3d5777f86e560086eaf60b0322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tremor needs the common ogg support (in _ogg_common.c) to get built,
similar to how it is done when libvorbis is used.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../mpd/mpd-0.16.2-tremor-needs-ogg_common.patch   |   20 ++++++++++++++++++++
 package/multimedia/mpd/mpd.mk                      |    1 +
 2 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch

diff --git a/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch b/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch
new file mode 100644
index 0000000..d315f14
--- /dev/null
+++ b/package/multimedia/mpd/mpd-0.16.2-tremor-needs-ogg_common.patch
@@ -0,0 +1,20 @@
+[PATCH] configure: tremor needs common ogg support just like libvorbis does
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: mpd-0.16.2/configure.ac
+===================================================================
+--- mpd-0.16.2.orig/configure.ac
++++ mpd-0.16.2/configure.ac
+@@ -1081,7 +1081,7 @@
+ fi
+ 
+ AM_CONDITIONAL(HAVE_OGG_COMMON,
+-	  test x$enable_vorbis = xyes || test x$enable_oggflac = xyes || test x$enable_flac = xyes)
++	  test x$enable_vorbis = xyes || test x$enable_tremor = xyes || test x$enable_oggflac = xyes || test x$enable_flac = xyes)
+ 
+ AM_CONDITIONAL(HAVE_FLAC_COMMON,
+ 	  test x$enable_flac = xyes || test x$enable_oggflac = xyes)
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
index 3f5057c..d418f61 100644
--- a/package/multimedia/mpd/mpd.mk
+++ b/package/multimedia/mpd/mpd.mk
@@ -6,6 +6,7 @@
 
 MPD_VERSION = 0.16.2
 MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
+MPD_AUTORECONF = YES
 MPD_DEPENDENCIES = host-pkg-config libglib2
 
 # Some options need an explicit --disable or --enable
-- 
1.7.3.4
