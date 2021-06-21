From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:25:45 +0200
Subject: [Buildroot] [PATCH 3/4] support/testing/tests: fix tests to use
 infra.img_round_power2()
In-Reply-To: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210621202547.360391-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the tests that are using if=sd as a Qemu options are changed to
use infra.img_round_power2() instead of simply extending the size of
the image to the next MB boundary, which is not longer sufficient with
Qemu >= 5.1.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/core/test_file_capabilities.py | 2 +-
 support/testing/tests/fs/test_squashfs.py            | 2 +-
 support/testing/tests/init/base.py                   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/core/test_file_capabilities.py b/support/testing/tests/core/test_file_capabilities.py
index b9ece18d7b..bd46f5138d 100644
--- a/support/testing/tests/core/test_file_capabilities.py
+++ b/support/testing/tests/core/test_file_capabilities.py
@@ -28,7 +28,7 @@ class TestFileCapabilities(infra.basetest.BRTest):
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel=os.path.join(self.builddir, "images", "zImage"),
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 234f4944be..7d6297ec5e 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -22,7 +22,7 @@ class TestSquashfs(infra.basetest.BRTest):
         self.assertEqual(out[3], "Compression lz4")
 
         img = os.path.join(self.builddir, "images", "rootfs.squashfs")
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         self.emulator.boot(arch="armv7",
                            kernel="builtin",
diff --git a/support/testing/tests/init/base.py b/support/testing/tests/init/base.py
index 75cfbe9c59..7ed035263b 100644
--- a/support/testing/tests/init/base.py
+++ b/support/testing/tests/init/base.py
@@ -7,7 +7,7 @@ class InitSystemBase(infra.basetest.BRTest):
 
     def start_emulator(self, fs_type, kernel=None, dtb=None, init=None):
         img = os.path.join(self.builddir, "images", "rootfs.{}".format(fs_type))
-        subprocess.call(["truncate", "-s", "%1M", img])
+        infra.img_round_power2(img)
 
         options = ["-drive",
                    "file={},if=sd,format=raw".format(img),
-- 
2.31.1
