From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 22:16:40 +0200
Subject: [Buildroot] [git commit] support/testing/tests: fix tests to use
 infra.img_round_power2()
Message-ID: <20210626194802.05C46813F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abe32cfdf0dda17af10d290fe1cb33c0fc60a076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the tests that are using if=sd as a Qemu options are changed to
use infra.img_round_power2() instead of simply extending the size of
the image to the next MB boundary, which is not longer sufficient with
Qemu >= 5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: drop now-useless imports]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/core/test_file_capabilities.py | 3 +--
 support/testing/tests/fs/test_squashfs.py            | 3 +--
 support/testing/tests/init/base.py                   | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index b9ece18d7b..d797769ddd 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -28,7 +27,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel=os.path.join(self.builddir, "images", "zImage"),
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 3e58a12ab7..745f93ee55 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 
 import infra.basetest
 
@@ -22,7 +21,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertEqual(out[3], "Compression lz4")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 80f7731ba3..6a85b87783 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -1,5 +1,4 @@
 import os
-import subprocess
 import infra.basetest
 
 
@@ -7,7 +6,7 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
         img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         options = ["-drive",
                    "file={},if=sd,format=raw".format(img),
