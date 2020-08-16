From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2020 23:43:48 +0200
Subject: [Buildroot] [git commit branch/next]
 support/testing/tests/toolchain/test_external: support non-ELF toolchains
Message-ID: <20200816213717.DEF4C8666F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=679a1ba24bdf63ca83b203d6d81e11b4cb57184f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The TestExternalToolchain() base class implement a test checking if
the ELF interpreter that is advertised by Busybox really exists in the
rootfs. Of course, this only makes sense with ELF toolchains. Until
now, only ELF toolchains were tested, but we are going to use
TestExternalToolchain() with non-ELF toolchains as well, so let's make
this conditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998 at free.fr: strip() lines during readlines()]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/toolchain/test_external.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 881d2b00db..db62a84391 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -26,11 +26,15 @@ class TestExternalToolchain(infra.basetest.BRTest):
             path = os.path.join(self.builddir, "target", d)
             self.assertFalse(has_broken_links(path))
 
-        interp = infra.get_elf_prog_interpreter(self.builddir,
-                                                self.toolchain_prefix,
-                                                "bin/busybox")
-        interp_path = os.path.join(self.builddir, "target", interp[1:])
-        self.assertTrue(os.path.exists(interp_path))
+        with open(os.path.join(self.builddir, ".config"), 'r') as configf:
+            configlines = [l.strip() for l in configf.readlines()]
+
+        if "BR2_BINFMT_ELF=y" in configlines:
+            interp = infra.get_elf_prog_interpreter(self.builddir,
+                                                    self.toolchain_prefix,
+                                                    "bin/busybox")
+            interp_path = os.path.join(self.builddir, "target", interp[1:])
+            self.assertTrue(os.path.exists(interp_path))
 
 
 class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
