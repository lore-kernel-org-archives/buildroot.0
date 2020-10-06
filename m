From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit]
 support/testing/tests/init/test_systemd_selinux: new SELinuxSystemdSquashfs
 test
Message-ID: <20201006132255.E328F8EB7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31901a5afd9f60e45991753ef74395eed01cd189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a test called 'SELinuxSystemdSquashfs' which will perform the same
tests as the Ext4 version, but using a Squashfs filesystem. Thanks to
this, we'll have a test on a real only filesystem.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                   |  1 +
 support/testing/tests/init/test_systemd_selinux.py           | 12 ++++++++++++
 .../tests/init/test_systemd_selinux/linux-squashfs.fragment  |  1 +
 3 files changed, 14 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f147088996..3aed57dbc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/gnuplot/
 
 N:	Antoine T??nart <antoine.tenart@bootlin.com>
 F:	package/wf111/
+F:	support/testing/tests/init/test_systemd_selinux/
 F:	support/testing/tests/init/test_systemd_selinux.py
 
 N:	Antony Pavlov <antonynpavlov@gmail.com>
diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 527dbf10ac..9a98a32821 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -60,3 +60,15 @@ class TestSELinuxSystemdExt4(TestSELinuxSystemd):
 
     def test_run(self):
         self.run_tests("ext4")
+
+class TestSELinuxSystemdSquashfs(TestSELinuxSystemd):
+    config = TestSELinuxSystemd.config + \
+        """
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        """.format(
+            infra.filepath("tests/init/test_systemd_selinux/linux-squashfs.fragment"),
+        )
+
+    def test_run(self):
+        self.run_tests("squashfs")
diff --git a/support/testing/tests/init/test_systemd_selinux/linux-squashfs.fragment b/support/testing/tests/init/test_systemd_selinux/linux-squashfs.fragment
new file mode 100644
index 0000000000..7a89d006fa
--- /dev/null
+++ b/support/testing/tests/init/test_systemd_selinux/linux-squashfs.fragment
@@ -0,0 +1 @@
+CONFIG_SQUASHFS=y
