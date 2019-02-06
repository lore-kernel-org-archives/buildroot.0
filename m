From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  6 Feb 2019 15:10:43 +0100
Subject: [Buildroot] [PATCH 01/16] package/gnuradio: remove qtgui option
Message-ID: <20190206141058.24155-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gr-qtgui option uses python-pyqt/Qt4, which we are about to remove, so
remove the option.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy             |  6 ++++++
 package/gnuradio/Config.in   | 10 ----------
 package/gnuradio/gnuradio.mk | 10 ++--------
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index be2f722b05..c84a9239a7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2019.02"
 
+config BR2_PACKAGE_GNURADIO_QTGUI
+	bool "gnuradio gr-qtgui option removed"
+	select BR2_LEGACY
+	help
+	  The gr-qtgui option was removed.
+
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto package removed"
 	select BR2_LEGACY
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 533a49c81e..3fdaea850e 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -116,16 +116,6 @@ config BR2_PACKAGE_GNURADIO_PAGER
 	help
 	  FLEX pager decoder implementation blocks
 
-config BR2_PACKAGE_GNURADIO_QTGUI
-	bool "gr-qtgui"
-	depends on BR2_PACKAGE_PYTHON_PYQT
-	depends on BR2_PACKAGE_QWT
-	depends on BR2_PACKAGE_QT_STL
-	select BR2_PACKAGE_GNURADIO_FFT
-	select BR2_PACKAGE_GNURADIO_FILTER
-	help
-	  GNU Radio Qt scopes
-
 config BR2_PACKAGE_GNURADIO_TRELLIS
 	bool "gr-trellis support"
 	select BR2_PACKAGE_GNURADIO_DIGITAL
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 564ad8b2a4..d6d07f6566 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -25,7 +25,8 @@ endif
 GNURADIO_CONF_OPTS = \
 	-DENABLE_DEFAULT=OFF \
 	-DENABLE_VOLK=ON \
-	-DENABLE_GNURADIO_RUNTIME=ON
+	-DENABLE_GNURADIO_RUNTIME=ON \
+	-DENABLE_GR_QTGUI=OFF
 
 # For third-party blocks, the gnuradio libraries are mandatory at
 # compile time.
@@ -126,13 +127,6 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_PAGER=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
-GNURADIO_DEPENDENCIES += python-pyqt qwt
-GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
-else
-GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
 else
-- 
2.11.0
