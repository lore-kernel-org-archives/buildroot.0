From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 24 Mar 2020 10:38:54 -0700
Subject: [Buildroot] [PATCH 3/3]
 support/testing/tests/package/sample_gst1_python.py: fix test
In-Reply-To: <20200324173855.747054-1-aduskett@gmail.com>
References: <20200324173855.747054-1-aduskett@gmail.com>
Message-ID: <20200324173855.747054-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This commit fixes the following issues:
  - No call to main.

  - using autovideosink instead of fakevideosink. Using Fakevideoskink is
    preferred because its primary purpose is for debugging and sample
    pipelines. Autovideosink does not work because there is no video output
    device.

  - No function on_message. Without this function, the script fails because of
    the missing function.

  - The script sets the pipeline to Gst.State.EOS instead of Gst.State.NULL
    which results in a failed pipeline state. When the state is set to NULL,
    gstreamer automatically calls EOS. Manually setting the pipeline state to
    EOS  results in the following error:

        Trying to dispose element sink, but it is in PLAYING instead of the
        NULL state. You need to explicitly set elements to the NULL state
        before dropping the final reference, to allow them to clean up.
        A refcounting bug may also cause this problem in the application or
        some element.

These issues are now properly fixed, and the sample script passes.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 .../tests/package/sample_gst1_python.py       | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index 39107616ed..6ed57a168b 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -1,20 +1,31 @@
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
-- 
2.25.1
