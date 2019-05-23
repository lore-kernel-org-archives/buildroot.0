From: Victor Huesca <victor.huesca@bootlin.com>
Date: Thu, 23 May 2019 12:24:45 +0200
Subject: [Buildroot] [PATCH] support/testing: add test for root password
Message-ID: <20190523102445.12504-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support to test that the root passowrd is working as expected.
- Buildtime test: Check the hash present in the /etc/shadow.
- Runtime test: Build an armv7 image and try to login with a password.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 .../testing/tests/core/test_root_password.py  | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 support/testing/tests/core/test_root_password.py

diff --git a/support/testing/tests/core/test_root_password.py b/support/testing/tests/core/test_root_password.py
new file mode 100644
index 0000000000..226f3ea9d5
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
+                    # Fail if the has isn't right
+                    self.assertTrue(crypt(self.password, h) == h)
+
+        # 2. Test by attempting to login
+        try:
+            cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+            self.emulator.boot(arch="armv7",
+                               kernel="builtin",
+                               options=["-initrd", cpio_file])
+            self.emulator.login(self.password)
+        except SystemError:
+            self.fail("Unable to login with the password")
-- 
2.21.0
