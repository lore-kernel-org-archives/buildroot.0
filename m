From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Jul 2017 22:13:21 +0200
Subject: [Buildroot] [PATCH v3] support/testing: add test of BR2_CCACHE with
	an external toolchain
Message-ID: <20170723201321.13594-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
configuration.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
v3:
- += instead of ... = ... + ... [Ricardo]
- remove spaces around parameter equals [Ricardo]
- remove empty line at end of file [Ricardo]

v2: separate test instead of hijacking BuildrootuClibc test
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
