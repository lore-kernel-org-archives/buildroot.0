From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 15:53:44 +0200
Subject: [Buildroot] [git commit] gnuradio: add gr-audio support
Message-ID: <20160611135436.2DD4281D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d3e30558739560de3a44d62362a385b644eb8f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gr-audio is a gnuradio module to use audio card as sink or source.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnuradio/Config.in   |  6 ++++++
 package/gnuradio/gnuradio.mk | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index b72ece5..d7d2347 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_GNURADIO
 
 if BR2_PACKAGE_GNURADIO
 
+config BR2_PACKAGE_GNURADIO_AUDIO
+	bool "gr-audio"
+	depends on BR2_PACKAGE_ALSA_LIB || BR2_PACKAGE_PORTAUDIO
+	help
+	  Add audio source/sink to GNU Radio
+
 config BR2_PACKAGE_GNURADIO_BLOCKS
 	bool "blocks support"
 	help
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 46d1f4f..8f771fc 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -52,6 +52,18 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_ANALOG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_AUDIO),y)
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+GNURADIO_DEPENDENCIES += alsa-lib
+endif
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+GNURADIO_DEPENDENCIES += portaudio
+endif
+GNURADIO_CONF_OPTS += -DENABLE_GR_AUDIO=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_AUDIO=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_BLOCKS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_BLOCKS=ON
 else
