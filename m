From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:11:17 +0200
Subject: [Buildroot] [git commit] package/gnuradio: re-enable gr-qtgui
Message-ID: <20200606211258.079A78442D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=494d7f4a12e8c33afac583c1b641a81d28c48ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit fcd9c85475b65c6e8f22d5f9b4ac7c7ecb93dc6a, gr-qtgui has
been removed because this Qt GUI was based on Qt4 which was no longer
supported by Buildroot.

However, gnuradio 3.8 brings a Qt5-based GUI, and therefore the option
BR2_PACKAGE_GNURADIO_QTGUI can be re-introduced.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy             |  6 ------
 package/gnuradio/Config.in   | 15 +++++++++++++++
 package/gnuradio/gnuradio.mk |  8 +++++++-
 3 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index fb7b0aadd0..d65d963d45 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -841,12 +841,6 @@ config BR2_PACKAGE_PYTHON_PYQT
 	  The python-pyqt package was removed. Consider python-pyqt5
 	  instead.
 
-config BR2_PACKAGE_GNURADIO_QTGUI
-	bool "gnuradio gr-qtgui option removed"
-	select BR2_LEGACY
-	help
-	  The gr-qtgui option was removed.
-
 config BR2_PACKAGE_LUACRYPTO
 	bool "luacrypto package removed"
 	select BR2_LEGACY
diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index bf69ed605b..01a396227f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -126,6 +126,21 @@ config BR2_PACKAGE_GNURADIO_PAGER
 	help
 	  FLEX pager decoder implementation blocks
 
+config BR2_PACKAGE_GNURADIO_QTGUI
+	bool "gr-qtgui"
+	depends on BR2_PACKAGE_GNURADIO_PYTHON
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_GNURADIO_FFT
+	select BR2_PACKAGE_GNURADIO_FILTER
+	select BR2_PACKAGE_PYTHON_PYQT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
+	select BR2_PACKAGE_QT5BASE_GUI # runtime
+	select BR2_PACKAGE_QT5BASE_WIDGETS # runtime
+	select BR2_PACKAGE_QWT
+	help
+	  GNU Radio Qt scopes
+
 config BR2_PACKAGE_GNURADIO_TRELLIS
 	bool "gr-trellis support"
 	select BR2_PACKAGE_GNURADIO_DIGITAL
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 4d69de8dd1..2820334996 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -34,7 +34,6 @@ GNURADIO_CONF_OPTS = \
 	-DENABLE_VOLK=ON \
 	-DENABLE_GNURADIO_RUNTIME=ON \
 	-DENABLE_TESTING=OFF \
-	-DENABLE_GR_QTGUI=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
 
 # For third-party blocks, the gnuradio libraries are mandatory at
@@ -131,6 +130,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_PAGER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_QTGUI),y)
+GNURADIO_DEPENDENCIES += qt5base python-pyqt5 qwt
+GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_QTGUI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_TRELLIS),y)
 GNURADIO_CONF_OPTS += -DENABLE_GR_TRELLIS=ON
 else
