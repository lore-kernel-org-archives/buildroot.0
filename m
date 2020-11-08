From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  9 Nov 2020 00:00:09 +0100
Subject: [Buildroot] [PATCH] support/testing:
 TestInitSystemSystemdRwIfupdown test expect a RW rootfs
Message-ID: <20201108230009.439548-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When running the TestInitSystemSystemdRwIfupdown test, the rootfs must
be in read-write mode. The commit log [1] introducing systemd tests say
so:

"basic systemd, read-write, network w/ ifupdown"

With systemd 246.5, the service systemd-update-done return an error code
when it can't write on the filesystem (/etc)

[1] 117835d5fcd508f301d62dd08ee658c1982c7fa7
[2] https://github.com/systemd/systemd/commit/8019995e9af9c6d7b5985198cedccd24eda3e26e

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981813

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
Note: systemd-update-done will continue to fail for other systemd tests
when the rootfs is in read-only mode.
---
 support/testing/tests/init/test_systemd.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 65c06d21b7..c0ef5e1202 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -91,7 +91,6 @@ class TestInitSystemSystemdRwIfupdown(InitSystemSystemdBase):
         """
         BR2_SYSTEM_DHCP="eth0"
         # BR2_PACKAGE_SYSTEMD_NETWORKD is not set
-        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
         BR2_TARGET_ROOTFS_EXT2=y
         """
 
-- 
2.25.4
