From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:07:09 +0100
Subject: [Buildroot] [git commit] package/gnuradio: add optional log4cpp
 dependency
Message-ID: <20190309140450.444A98434C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50e1d12e073d2f042730fe6cf0b1915df5afb8af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, logger component is enabled if log4cpp is found

Moreover, it should be noted that log4cpp is now mandatory in latest
upstream:
https://github.com/gnuradio/gnuradio/commit/d2428961205bf62e6b39966f040f98435e5cc2ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnuradio/Config.in   | 6 ++++++
 package/gnuradio/gnuradio.mk | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index 3fdaea850e..6d0669779f 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -56,6 +56,12 @@ config BR2_PACKAGE_GNURADIO_FEC
 	help
 	  FEC signal processing blocks
 
+config BR2_PACKAGE_GNURADIO_LOG
+	bool "gr-log support"
+	select BR2_PACKAGE_LOG4CPP
+	help
+	  Enable logger component
+
 config BR2_PACKAGE_GNURADIO_PYTHON
 	bool "python support"
 	depends on BR2_PACKAGE_PYTHON
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 202c2213a7..ef9723cb01 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -115,6 +115,13 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_FILTER=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_LOG),y)
+GNURADIO_DEPENDENCIES += log4cpp
+GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_LOG=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
