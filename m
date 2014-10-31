From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 31 Oct 2014 16:19:08 +0100
Subject: [Buildroot] [PATCH v2 2/3] gst-fsl-plugins: fix plugins loading
In-Reply-To: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
Message-ID: <1414768749-15134-2-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Problem was reported :
  http://lists.busybox.net/pipermail/buildroot/2014-July/101566.html
  http://lists.busybox.net/pipermail/buildroot/2014-October/107613.html

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk             | 9 +++++++++
 .../gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf  | 5 +++++
 2 files changed, 14 insertions(+)
 create mode 100644 package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf

diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 8d8b8b4..21046fc 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -40,4 +40,13 @@ endef
 
 GST_FSL_PLUGINS_POST_PATCH_HOOKS += GST_FSL_PLUGINS_PATCH_M4
 
+define GST_FSL_PLUGINS_FIX_LD_PATH
+	$(INSTALL) -d $(TARGET_DIR)/etc/ld.so.conf.d
+	$(INSTALL) -m 644 \
+		package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf \
+		$(TARGET_DIR)/etc/ld.so.conf.d
+endef
+
+GST_FSL_PLUGINS_POST_INSTALL_TARGET_HOOKS += GST_FSL_PLUGINS_FIX_LD_PATH
+
 $(eval $(autotools-package))
diff --git a/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf b/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf
new file mode 100644
index 0000000..325fbf1
--- /dev/null
+++ b/package/gstreamer/gst-fsl-plugins/ld.so.conf.d-gst-fsl-plugins.conf
@@ -0,0 +1,5 @@
+# cf. https://community.freescale.com/thread/300387
+/usr/lib/imx-mm/audio-codec
+/usr/lib/imx-mm/video-codec
+/usr/lib/imx-mm/parser
+
-- 
1.9.1
