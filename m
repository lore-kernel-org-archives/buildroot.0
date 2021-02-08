From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon,  8 Feb 2021 16:19:15 +0100
Subject: [Buildroot] [RESEND PATCH 2/2] package/gnuradio: add gr-uhd option
In-Reply-To: <1612797555-14782-1-git-send-email-gwenj@trabucayre.com>
References: <1612797555-14782-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <1612797555-14782-2-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

GNURadio has a block to use USRP, through UHD, to receive or transmit RF
signals.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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
-- 
2.20.1
