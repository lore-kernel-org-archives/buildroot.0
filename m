From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 24 Mar 2020 10:38:53 -0700
Subject: [Buildroot] [PATCH 2/3]
 support/testing/tests/package/test_gst1_python.py: fix config and timeout
In-Reply-To: <20200324173855.747054-1-aduskett@gmail.com>
References: <20200324173855.747054-1-aduskett@gmail.com>
Message-ID: <20200324173855.747054-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The config is missing the following packages:
  - BR2_PACKAGE_GST1_PLUGINS_BASE
    - This is needed for the videotestsrc plugin which provides videotestsrc.

  - BR2_PACKAGE_GST1_PLUGINS_BAD
    - This is needed for the debugutils plugin which provides fakevideosink.

  - BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
    - videotestsrcplugin used by the example pipeline.

  - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
    - fakevideosink plugin used by the example pipeline.

In addition, the default timeout is set to low and will result in a test
failure, this has been changed to 200 seconds.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 support/testing/tests/package/test_gst1_python.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index 469e0f392d..c6b337dd04 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -14,6 +14,10 @@ class TestGst1Python(TestPythonPackageBase):
         BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
         BR2_PACKAGE_GOBJECT_INTROSPECTION=y
         BR2_PACKAGE_GSTREAMER1=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE=y
+        BR2_PACKAGE_GST1_PLUGINS_BAD=y
+        BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC=y
+        BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS=y
         BR2_PACKAGE_GST1_PYTHON=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_GOBJECT=y
@@ -26,3 +30,4 @@ class TestGst1Python(TestPythonPackageBase):
                            options=["-initrd", cpio_file])
         self.emulator.login()
     sample_scripts = ["tests/package/sample_gst1_python.py"]
+    timeout = 200
-- 
2.25.1
