From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Apr 2018 00:14:13 +0200
Subject: [Buildroot] [PATCH 1/1] support/testing: set $USER in rust tests
Message-ID: <20180428221413.1833-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the run-time tests to build rust and rust-bin packages are run via Docker,
the $USER environment variable is not set, which makes cargo fail when
initializing the test project.

So add it to make cargo happy.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 support/testing/tests/package/test_rust.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index e6c0de2214..2dc814f99d 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -21,6 +21,7 @@ class TestRustBase(infra.basetest.BRTest):
     def build_test_prog(self):
         hostdir = os.path.join(self.builddir, 'host')
         env = os.environ.copy()
+        env["USER"] = "br-user"
         env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
         env["CARGO_HOME"] = os.path.join(hostdir, 'usr', 'share', 'cargo')
         env["RUST_TARGET_PATH"] = os.path.join(hostdir, 'etc', 'rustc')
-- 
2.14.3
