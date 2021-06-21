From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Jun 2021 22:25:44 +0200
Subject: [Buildroot] [PATCH 2/4] support/testing/infra: add
 img_round_power2() function
In-Reply-To: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
References: <20210621202547.360391-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210621202547.360391-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since Qemu 5.1, SD card images must have a size that are a power of
two. While some filesystem (such as ext2/3/4) allow to specify the
expected size of the filesystem, others such as SquashFS do not have
this capability.

We were already extending the size of such images to the next 1 MB
boundary using "truncate -s %1M", but that is no longer sufficient. So
instead, we introduce a helper function that extends the size of an
image to the next power of two.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/__init__.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 6522a265f3..c540fd1940 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -112,3 +112,14 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
             continue
         return m.group(1)
     return None
+
+
+def img_round_power2(img):
+    """
+    Rounds up the size of an image file to the next power of 2
+    """
+    sz = os.stat(img).st_size
+    pow2 = 1
+    while pow2 < sz:
+        pow2 = pow2 << 1
+    subprocess.call(["truncate", "-s", str(pow2), img])
-- 
2.31.1
