From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed,  2 Sep 2015 19:44:54 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: gnuradio-python gnuradio-utils:
	add missing dependency to python-numpy
Message-ID: <1441215894-31473-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Some python blocks needs python-numpy present.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/Config.in   | 9 ++++++++-
 package/gnuradio/gnuradio.mk | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index e264a21..ea37d74 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -43,16 +43,23 @@ config BR2_PACKAGE_GNURADIO_FEC
 	help
 	  FEC signal processing blocks
 
+comment "gr-python depends on numpy"
+	depends on !BR2_PACKAGE_PYTHON_NUMPY
+
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
+	depends on BR2_PACKAGE_PYTHON_NUMPY
 	select BR2_PACKAGE_BOOST_PYTHON
 	select BR2_PACKAGE_PYTHON
 	help
 	  Enable python component
 
+comment "gr-utils depends on gr-python"
+	depends on !BR2_PACKAGE_GNURADIO_PYTHON
+
 config BR2_PACKAGE_GNURADIO_UTILS
 	bool "gr-utils support"
-	select BR2_PACKAGE_GNURADIO_PYTHON
+	depends on BR2_PACKAGE_GNURADIO_PYTHON
 	help
 	  Misc python utilities
 
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index fc5cd1f..565c113 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -86,7 +86,7 @@ GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
-GNURADIO_DEPENDENCIES += python
+GNURADIO_DEPENDENCIES += python python-numpy
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 else
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=OFF
-- 
2.4.6
