From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:54:13 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/package/sample_gst1_python.py: fix flake8 warnings
Message-ID: <20200324144153.65B6D8281C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15f354e7dffa19247cecbcf5711c2bffff6f828c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following flake8 warnings:

  support/testing/tests/package/sample_gst1_python.py:5:1: F401 'time' imported but unused
  support/testing/tests/package/sample_gst1_python.py:7:1: E402 module level import not at top of file
  support/testing/tests/package/sample_gst1_python.py:21:12: W292 no newline at end of file

For the E402 warning, we add a "noqa" marker, as we really want the
gi.require_version() to be before.

There is still one remaining warning to be fixed:

  support/testing/tests/package/sample_gst1_python.py:18:28: F821 undefined name 'on_message'

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_gst1_python.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index 41eccbe5fd..39107616ed 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -2,9 +2,8 @@
 """A simple test that uses gst1-python to run a fake videotestsrc for 100 frames"""
 import sys
 import gi
-import time
 gi.require_version('Gst', '1.0')
-from gi.repository import Gst, GLib
+from gi.repository import Gst, GLib  # noqa: E402
 
 
 def main():
@@ -18,4 +17,4 @@ def main():
     bus.connect("message", on_message, loop)
     loop.run()
     pipeline.set_state(Gst.State.EOS)
-    exit(0)
\ No newline at end of file
+    exit(0)
