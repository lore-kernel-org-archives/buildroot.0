From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 18:35:15 +0200
Subject: [Buildroot] [git commit] support/testing: add test of BR2_CCACHE
	with an external toolchain
Message-ID: <20170724163121.A64CB81DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6355ec2768c486de318b76835af73fdcb894b311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We reuse TestExternalToolchainBuildrootuClibc and add ccache to its
configuration.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                   |  1 +
 support/testing/tests/toolchain/test_external.py | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 57710ab..42707ad 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -233,6 +233,7 @@ tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainBuildrootuClibc: *runtime_test
+tests.toolchain.test_external.TestExternalToolchainCCache: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainCtngMusl: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
 tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index afb4bb0..394fa17 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -229,3 +229,14 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
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
+        self.config += self.extraconfig.format(builddir=self.builddir)
