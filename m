From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Mon, 28 Oct 2019 12:15:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/gst1-validate: allow to use
 host-python3 and target python3
Message-ID: <20191028111556.245007-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/gstreamer1/gst1-validate/Config.in        | 6 ++++--
 package/gstreamer1/gst1-validate/gst1-validate.mk | 8 ++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/gstreamer1/gst1-validate/Config.in b/package/gstreamer1/gst1-validate/Config.in
index 2022d38d99..63bce613ed 100644
--- a/package/gstreamer1/gst1-validate/Config.in
+++ b/package/gstreamer1/gst1-validate/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GST1_PLUGINS_BASE
 	select BR2_PACKAGE_JSON_GLIB
-	select BR2_PACKAGE_PYTHON_PYEXPAT
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
 	# cairo is autodetected but needs PNG support
 	select BR2_PACKAGE_CAIRO_PNG if BR2_PACKAGE_CAIRO
 	help
@@ -15,3 +16,4 @@ config BR2_PACKAGE_GST1_VALIDATE
 
 comment "gst1-validate depends on python"
 	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON3
diff --git a/package/gstreamer1/gst1-validate/gst1-validate.mk b/package/gstreamer1/gst1-validate/gst1-validate.mk
index da38aeb497..e9522e1568 100644
--- a/package/gstreamer1/gst1-validate/gst1-validate.mk
+++ b/package/gstreamer1/gst1-validate/gst1-validate.mk
@@ -14,10 +14,14 @@ GST1_VALIDATE_DEPENDENCIES = \
 	gstreamer1 \
 	gst1-plugins-base \
 	json-glib \
-	host-python \
-	python \
 	$(if $(BR2_PACKAGE_CAIRO),cairo)
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+GST1_VALIDATE_DEPENDENCIES += host-python3 python3
+else
+GST1_VALIDATE_DEPENDENCIES += host-python python
+endif
+
 GST1_VALIDATE_CONF_OPTS += --disable-sphinx-doc
 
 $(eval $(autotools-package))
-- 
2.21.0
