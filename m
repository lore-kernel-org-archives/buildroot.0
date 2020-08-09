From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  9 Aug 2020 21:38:14 +0200
Subject: [Buildroot] [PATCH v2 2/5]
 support/testing/tests/toolchain/test_external: support non-ELF toolchains
In-Reply-To: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
References: <20200809193818.1139805-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200809193818.1139805-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The TestExternalToolchain() base class implement a test checking if
the ELF interpreter that is advertised by Busybox really exists in the
rootfs. Of course, this only makes sense with ELF toolchains. Until
now, only ELF toolchains were tested, but we are going to use
TestExternalToolchain() with non-ELF toolchains as well, so let's make
this conditional.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/toolchain/test_external.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index 881d2b00db..1818ae0498 100644
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
+        with open(os.path.join(self.builddir, ".config")) as configf:
+            configlines = configf.readlines()
+
+        if "BR2_BINFMT_ELF=y\n" in configlines:
+            interp = infra.get_elf_prog_interpreter(self.builddir,
+                                                    self.toolchain_prefix,
+                                                    "bin/busybox")
+            interp_path = os.path.join(self.builddir, "target", interp[1:])
+            self.assertTrue(os.path.exists(interp_path))
 
 
 class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
-- 
2.26.2
