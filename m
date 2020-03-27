From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Mar 2020 18:31:45 +0100
Subject: [Buildroot] [git commit] support/testing: fix test_gst1_python
Message-ID: <20200327171915.01C347FA47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=207d276d98da21e8e7f911e6559043dcac36548a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The config is missing the following packages:
  - BR2_PACKAGE_GST1_PLUGINS_BASE
    This is needed for the videotestsrc plugin which provides
    videotestsrc.

  - BR2_PACKAGE_GST1_PLUGINS_BAD
    This is needed for the debugutils plugin which provides
    fakevideosink.

  - BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC
    videotestsrcplugin used by the example pipeline.

  - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
    fakevideosink plugin used by the example pipeline.

The sample was also amended to fix:
  - no call to main.

  - using autovideosink instead of fakevideosink. Using Fakevideoskink
    is preferred because its primary purpose is for debugging and sample
    pipelines. Autovideosink does not work because there is no video
    output device.

  - No function on_message. Without this function, the script fails
    because of the missing function.

  - The script sets the pipeline to Gst.State.EOS instead of
    Gst.State.NULL which results in a failed pipeline state. When the
    state is set to NULL, gstreamer automatically calls EOS. Manually
    setting the pipeline state to EOS results in the following error:

        Trying to dispose element sink, but it is in PLAYING instead of
        the NULL state. You need to explicitly set elements to the NULL
        state before dropping the final reference, to allow them to
        clean up. A refcounting bug may also cause this problem in the
        application or some element.

In addition, the default timeout is set too low and would result in a
test failure, this has been changed to 200 seconds.

These issues are now properly fixed, and the sample script passes.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - meld the two patches together
  - add the print() in the on_demand callback
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_gst1_python.py | 20 ++++++++++++++++----
 support/testing/tests/package/test_gst1_python.py   |  5 +++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index 39107616ed..d8cd3fb422 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -1,20 +1,32 @@
 #!/usr/bin/env python
-"""A simple test that uses gst1-python to run a fake videotestsrc for 100 frames"""
+"""A simple test that uses gst1-python to run a fake videotestsrc for 100
+frames
+"""
 import sys
 import gi
 gi.require_version('Gst', '1.0')
 from gi.repository import Gst, GLib  # noqa: E402
 
 
+def on_message(bus: Gst.Bus, message: Gst.Message, loop: GLib.MainLoop):
+    print('Received Gst.Message.type: {}'.format(message.type))
+    if message.type == Gst.MessageType.EOS:
+        loop.quit()
+    return True
+
+
 def main():
     # Initializes Gstreamer
     Gst.init(sys.argv)
-    pipeline = Gst.parse_launch("videotestsrc num-buffers=100 ! autovideosink")
+    pipeline = Gst.parse_launch("videotestsrc num-buffers=100 ! fakevideosink")
     bus = pipeline.get_bus()
     bus.add_signal_watch()
     pipeline.set_state(Gst.State.PLAYING)
     loop = GLib.MainLoop()
     bus.connect("message", on_message, loop)
     loop.run()
-    pipeline.set_state(Gst.State.EOS)
-    exit(0)
+    pipeline.set_state(Gst.State.NULL)
+
+
+if __name__ == '__main__':
+    main()
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
