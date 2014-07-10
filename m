From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jul 2014 11:34:54 +0200
Subject: [Buildroot] [git commit] mpd: add twolame support
Message-ID: <20140710093733.13D049D1F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=325dce5f9776799a9e0dcd1f9f981f6468531202
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that there's a twolame package we can add support for it in mpd.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in |   10 ++++++++++
 package/mpd/mpd.mk    |    5 +++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 489b49d..b491126 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -184,6 +184,16 @@ config BR2_PACKAGE_MPD_TREMOR
 	  Enable vorbis input support.
 	  Select this if you want to play back OGG files on softfloat targets.
 
+config BR2_PACKAGE_MPD_TWOLAME
+	bool "twolame"
+	depends on BR2_LARGEFILE # twolame -> libsndfile
+	select BR2_PACKAGE_TWOLAME
+	help
+	  Enable TwoLAME mp2 encoding.
+
+comment "twolame support needs a toolchain w/ largefile"
+        depends on !BR2_LARGEFILE
+
 config BR2_PACKAGE_MPD_VORBIS
 	bool "vorbis"
 	select BR2_PACKAGE_LIBOGG
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 2f0b37e..21eb08e 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -132,6 +132,11 @@ MPD_DEPENDENCIES += tremor
 MPD_CONF_OPT += --with-tremor
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_TWOLAME),y)
+MPD_DEPENDENCIES += twolame
+MPD_CONF_OPT += --enable-twolame-encoder
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_WAVPACK),y)
 MPD_DEPENDENCIES += wavpack
 else
