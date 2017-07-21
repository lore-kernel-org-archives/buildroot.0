From: Glenn Coombs <glenn.coombs@gmail.com>
Date: Fri, 21 Jul 2017 17:13:07 +0800
Subject: [Buildroot] [PATCH 1/1] Add option to the gst1-plugins-bad package
 to enable/disable the qt plugin.
Message-ID: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I wanted to build the qmlglsink gstreamer component but it was not possible
to build it because the gst1-plugins-bad package was previously hard-coded
to run the configure script with the --disable-qt option.  This patch adds
an option to allow selection of either --enable-qt or --disable-qt.  When
enabled this allows users to build the qt plugin package.

Signed-off-by: Glenn Coombs <glenn.coombs@gmail.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 5 +++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 9 +++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
b/package/gstreamer1/gst1-plugins-bad/Config.in
index 0c97899..22aacb3 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -349,6 +349,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM
        help
          PNM plugin

+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
+       bool "qt"
+       help
+         Qt plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
        bool "rawparse"
        help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 2e9e6f1..1caca13 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -58,8 +58,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
        --disable-schro \
        --disable-zbar \
        --disable-spandsp \
-       --disable-gtk3 \
-       --disable-qt
+       --disable-gtk3

 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1

@@ -403,6 +402,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
 endif

+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-qt
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-qt
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
 else
--
2.7.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170721/53eaf8e9/attachment.html>
