From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 19:01:42 +0100
Subject: [Buildroot] [git commit] support/testing: test_dropbear.py: use a
 constant for the password
Message-ID: <20190205180347.4952981562@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a34005699b3f9b08f27d312030fae1267cef85a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The password is used in multiple places, so add a constant for it instead of
hardcoding it multiple times.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_dropbear.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index 8f7f1fee82..2a7a1bd8af 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -4,14 +4,15 @@ import infra.basetest
 
 
 class TestDropbear(infra.basetest.BRTest):
+    passwd = "testpwd"
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
+        BR2_TARGET_GENERIC_ROOT_PASSWD="{}"
         BR2_SYSTEM_DHCP="eth0"
         BR2_PACKAGE_DROPBEAR=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        """.format(passwd)
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -20,7 +21,7 @@ class TestDropbear(infra.basetest.BRTest):
                            options=["-initrd", img,
                                     "-net", "nic",
                                     "-net", "user,hostfwd=tcp::2222-:22"])
-        self.emulator.login("testpwd")
+        self.emulator.login(self.passwd)
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
