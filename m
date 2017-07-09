From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 01:21:21 +0200
Subject: [Buildroot] [PATCH 5/7] support/testing: add test of BR2_CCACHE
	with an external toolchain
In-Reply-To: <20170709232123.30120-1-arnout@mind.be>
References: <20170709232123.30120-1-arnout@mind.be>
Message-ID: <20170709232123.30120-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We piggy-back on an existing test.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/toolchain/test_external.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index afb4bb0b50..c315ef8055 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -207,9 +207,13 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
         self.emulator.login()
 
 class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
+    # On this test we piggy-back a test of BR2_CCACHE in combination
+    # with an external toolchain.
     config = BASIC_CONFIG + \
 """
 BR2_arm=y
+BR2_CCACHE=y
+BR2_CCACHE_DIR="{builddir}/ccache-dir"
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
 BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
@@ -222,6 +226,10 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
 """
     toolchain_prefix = "arm-linux"
 
+    def __init__(self, names):
+        super(TestExternalToolchainBuildrootuClibc, self).__init__(names)
+        self.config = self.config.format(builddir = self.builddir)
+
     def test_run(self):
         TestExternalToolchain.common_check(self)
         img = os.path.join(self.builddir, "images", "rootfs.cpio")
-- 
2.13.2
