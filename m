From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Mon, 28 Sep 2020 16:54:23 +0200
Subject: [Buildroot] [PATCH 5/7] support/testing: add a test for
 BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
In-Reply-To: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
References: <20200928145425.2109095-1-antoine.tenart@bootlin.com>
Message-ID: <20200928145425.2109095-6-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a test for BR2_PACKAGE_REFPOLICY_CUSTOM_GIT (which allows to select
a custom location for the SELinux refpolicy). The test uses the official
refpolicy as a test (we only want to test the functionality is working,
not that another refpolicy is correctly building; that is an user
problematic).

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 support/testing/tests/core/test_selinux.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/tests/core/test_selinux.py b/support/testing/tests/core/test_selinux.py
index 9e189d6114df..bb6604590ab5 100644
--- a/support/testing/tests/core/test_selinux.py
+++ b/support/testing/tests/core/test_selinux.py
@@ -47,3 +47,14 @@ class TestSELinuxExtraModulesDirs(TestSELinuxInfra):
         out, ret = self.emulator.run("seinfo -t buildroot_test_t", 15)
         self.assertEqual(ret, 0)
         self.assertEqual(out[2].strip(), "buildroot_test_t")
+
+class TestSELinuxCustomGit(TestSELinuxInfra):
+    config = TestSELinuxInfra.config + \
+             """
+             BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y
+             BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL="https://github.com/SELinuxProject/refpolicy.git"
+             BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION="RELEASE_2_20200818"
+             """
+
+    def test_run(self):
+        pass
-- 
2.26.2
