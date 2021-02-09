From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Feb 2021 22:39:07 +0100
Subject: [Buildroot] [git commit] package/gnuradio: add gr-uhd option
Message-ID: <20210209212147.8563281240@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3572b30250788f25df974d7e108389c349e79da4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GNURadio has a block to use USRP, through UHD, to receive or transmit RF
signals.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/Config.in   | 9 +++++++++
 package/gnuradio/gnuradio.mk | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index c7b01b454b..738088802e 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -156,4 +156,13 @@ config BR2_PACKAGE_GNURADIO_TRELLIS
 	help
 	  Trellis coded modulation blocks
 
+config BR2_PACKAGE_GNURADIO_UHD
+	bool "gr-uhd support"
+	select BR2_PACKAGE_UHD
+	select BR2_PACKAGE_GNURADIO_ANALOG
+	select BR2_PACKAGE_GNURADIO_BLOCKS
+	select BR2_PACKAGE_GNURADIO_FILTER
+	help
+	  UHD support
+
 endif
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 0a818cfc24..1f4458db92 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -149,6 +149,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_UHD),y)
+GNURADIO_DEPENDENCIES += uhd
+GNURADIO_CONF_OPTS += -DENABLE_GR_UHD=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_UHD=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_UTILS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_UTILS=ON
 else
