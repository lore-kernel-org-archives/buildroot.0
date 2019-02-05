From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Feb 2019 19:01:55 +0100
Subject: [Buildroot] [git commit] support/testing: test_dropbear.py: add
 test for ssh connection to localhost
Message-ID: <20190205180347.4F49A83B8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc84a0dac6ef1a09503991aa5a16c9c996271ed3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use sshpass to pass the password on the command line.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_dropbear.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
index 2a7a1bd8af..ad0f89316c 100644
--- a/support/testing/tests/package/test_dropbear.py
+++ b/support/testing/tests/package/test_dropbear.py
@@ -10,6 +10,7 @@ class TestDropbear(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_ROOT_PASSWD="{}"
         BR2_SYSTEM_DHCP="eth0"
         BR2_PACKAGE_DROPBEAR=y
+        BR2_PACKAGE_SSHPASS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """.format(passwd)
@@ -25,6 +26,7 @@ class TestDropbear(infra.basetest.BRTest):
         cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
         _, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
-        # Would be useful to try to login through SSH here, through
-        # localhost:2222, though it is not easy to pass the ssh
-        # password on the command line.
+
+        cmd = "sshpass -p {} ssh -y localhost /bin/true".format(self.passwd)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
