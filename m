From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 30 Sep 2019 20:44:46 +0200
Subject: [Buildroot] [PATCH v1] package/qt5multimedia: fix gstreamer-0.10
 compile failure
Message-ID: <20190930184446.15558-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1] (by adding upstream patch [2]):

  qgstreamerplayersession.cpp: In member function 'bool QGstreamerPlayerSession::play()':
  qgstreamerplayersession.cpp:986:9: error: 'gst_debug_bin_to_dot_file_with_ts' was not declared in this scope
           gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_pipeline), GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL), "session.play");
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[1] http://autobuild.buildroot.net/results/fc3cc1de4f910c46f8b18237e215ba9efcd68ef5
[2] https://code.qt.io/cgit/qt/qtmultimedia.git/commit/?id=8756a20821305eabb6026400e6d3cdc79df1690d

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...002-GStreamer-Fix-0.10-compile-error.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/qt5/qt5multimedia/5.12.4/0002-GStreamer-Fix-0.10-compile-error.patch

diff --git a/package/qt5/qt5multimedia/5.12.4/0002-GStreamer-Fix-0.10-compile-error.patch b/package/qt5/qt5multimedia/5.12.4/0002-GStreamer-Fix-0.10-compile-error.patch
new file mode 100644
index 0000000000..4a2dcb9de1
--- /dev/null
+++ b/package/qt5/qt5multimedia/5.12.4/0002-GStreamer-Fix-0.10-compile-error.patch
@@ -0,0 +1,38 @@
+From 736637f5ab19d273b0e6c0c0b8f47fdc9b8f316e Mon Sep 17 00:00:00 2001
+From: Val Doroshchuk <valentyn.doroshchuk@qt.io>
+Date: Mon, 1 Jul 2019 16:12:30 +0200
+Subject: [PATCH] GStreamer: Fix 0.10 compile error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: QTBUG-76816
+Change-Id: I2909c2f2df91ac26b5104e24892310aa62cad172
+Reviewed-by: Christian Str?mme <christian.stromme@qt.io>
+
+Upstream: https://code.qt.io/cgit/qt/qtmultimedia.git/patch/?id=8756a20821305eabb6026400e6d3cdc79df1690d
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/gsttools/qgstreamerplayersession.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/gsttools/qgstreamerplayersession.cpp b/src/gsttools/qgstreamerplayersession.cpp
+index 5ede8a1..15587f0 100644
+--- a/src/gsttools/qgstreamerplayersession.cpp
++++ b/src/gsttools/qgstreamerplayersession.cpp
+@@ -981,9 +981,11 @@ bool QGstreamerPlayerSession::isSeekable() const
+
+ bool QGstreamerPlayerSession::play()
+ {
++#if GST_CHECK_VERSION(1,0,0)
+     static bool dumpDot = qEnvironmentVariableIsSet("GST_DEBUG_DUMP_DOT_DIR");
+     if (dumpDot)
+-        gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_pipeline), GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL), "session.play");
++        gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_pipeline), GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL), "gst.play");
++#endif
+ #ifdef DEBUG_PLAYBIN
+     qDebug() << Q_FUNC_INFO;
+ #endif
+--
+2.23.0
+
--
2.23.0
