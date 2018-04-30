From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:37:41 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] support/testing: set
 $USER in rust tests
Message-ID: <20180501073418.C90CA8271A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=692e9d1a62847cb4bc6f9f5714c65fa676e9124f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

When the run-time tests to build rust and rust-bin packages are run via Docker,
the $USER environment variable is not set, which makes cargo fail when
initializing the test project.

So add it to make cargo happy.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 09a5eb427a6d9160e74ab56941640c02334eabf1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
