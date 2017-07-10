From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jul 2017 22:40:07 +0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add test of BR2_CCACHE
	with an external toolchain
In-Reply-To: <20170710204007.8402-1-arnout@mind.be>
References: <20170710204007.8402-1-arnout@mind.be>
Message-ID: <20170710204007.8402-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
configuration.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/toolchain/test_external.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index afb4bb0b50..57e2f11451 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -229,3 +229,15 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
                            kernel="builtin",
                            options=["-initrd", img])
         self.emulator.login()
+
+class TestExternalToolchainCCache(TestExternalToolchainBuildrootuClibc):
+    extraconfig = \
+"""
+BR2_CCACHE=y
+BR2_CCACHE_DIR="{builddir}/ccache-dir"
+"""
+
+    def __init__(self, names):
+        super(TestExternalToolchainBuildrootuClibc, self).__init__(names)
+        self.config = self.config + self.extraconfig.format(builddir = self.builddir)
+
-- 
2.13.2
