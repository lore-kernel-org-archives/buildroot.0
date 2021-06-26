From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Jun 2021 21:27:48 +0200
Subject: [Buildroot] [git commit] support/testing/infra: add
 img_round_power2() function
Message-ID: <20210626194801.E48FF8E437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37a1af7a74e57e42ff6beefb8a7fdcae01a00ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Qemu 5.1, SD card images must have a size that are a power of
two. While some filesystem (such as ext2/3/4) allow to specify the
expected size of the filesystem, others such as SquashFS do not have
this capability.

We were already extending the size of such images to the next 1 MB
boundary using "truncate -s %1M", but that is no longer sufficient. So
instead, we introduce a helper function that extends the size of an
image to the next power of two.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr:
  - use f.trunctate() rather than subprocess.call([truncate,...])
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/__init__.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index 6522a265f3..b10a7601a3 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -112,3 +112,15 @@ def get_elf_prog_interpreter(builddir, prefix, fpath):
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
+    with open(img, 'ab') as f:
+        f.truncate(pow2)
