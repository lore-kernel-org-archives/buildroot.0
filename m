From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:35 -0000
Subject: [Buildroot] [git commit] support/testing: new test for root password
Message-ID: <20190903133619.90DB88A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152776b4207bd7f369f8ff7d4e3b1dff7063111f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support to test that the root passowrd is working as expected.
- Buildtime test: Check the hash present in the generated '/etc/shadow'.
- Runtime test: Build an armv7 image and try to login with a password.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                   |  1 +
 DEVELOPERS                                       |  3 ++
 support/testing/tests/core/test_root_password.py | 36 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7ee6e248b1..99940640a5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -341,6 +341,7 @@ tests.core.test_hardening.TestRelroPartial: { extends: .runtime_test }
 tests.core.test_hardening.TestSspNone: { extends: .runtime_test }
 tests.core.test_hardening.TestSspStrong: { extends: .runtime_test }
 tests.core.test_post_scripts.TestPostScripts: { extends: .runtime_test }
+tests.core.test_root_password.TestRootPassword: { extends: .runtime_test }
 tests.core.test_rootfs_overlay.TestRootfsOverlay: { extends: .runtime_test }
 tests.core.test_timezone.TestGlibcAllTimezone: { extends: .runtime_test }
 tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index 27a98db256..5fe244a570 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2308,6 +2308,9 @@ F:	package/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
+N:	Victor Huesca <victor.huesca@bootlin.com>
+F:	support/testing/tests/core/test_root_password.py
+
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
 F:	package/utp_com/
diff --git a/support/testing/tests/core/test_root_password.py b/support/testing/tests/core/test_root_password.py
new file mode 100644
index 0000000000..aefcd3605c
--- /dev/null
+++ b/support/testing/tests/core/test_root_password.py
@@ -0,0 +1,36 @@
+import os
+import infra.basetest
+from crypt import crypt
+
+
+class TestRootPassword(infra.basetest.BRTest):
+    password = "foo"
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ENABLE_ROOT_LOGIN=y
+        BR2_TARGET_GENERIC_ROOT_PASSWD="{}"
+        """.format(password)
+
+    def test_run(self):
+        # 1. Test by looking hash in the /etc/shadow
+        shadow = os.path.join(self.builddir, "target", "etc", "shadow")
+        with open(shadow, "r") as f:
+            users = f.readlines()
+            for user in users:
+                s = user.split(":")
+                n, h = s[0], s[1]
+                if n == "root":
+                    # Fail if the account is disabled or no password is required
+                    self.assertTrue(h not in ["", "*"])
+                    # Fail if the hash isn't right
+                    self.assertEqual(crypt(self.password, h), h)
+
+        # 2. Test by attempting to login
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        try:
+            self.emulator.boot(arch="armv7", kernel="builtin",
+                               options=["-initrd", cpio_file])
+            self.emulator.login(self.password)
+        except SystemError:
+            self.fail("Unable to login with the password")
