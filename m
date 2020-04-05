From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  6 Apr 2020 01:04:12 +0200
Subject: [Buildroot] [PATCH 5/7] support/testing: test_lxc: use ARM arm
 external toolchain
In-Reply-To: <20200405230414.416403-1-romain.naour@gmail.com>
References: <20200405230414.416403-1-romain.naour@gmail.com>
Message-ID: <20200405230414.416403-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the lxc test was using the ARM CodeSourcery 2014.05 armv5 toolchain.
But the recent systemd version bump to 245 added a toolchain dependency
on systemd package due to build issues with gcc < 5.0.

Before [1] the lxc test was failing to build with the ARM CodeSourcery 2014.05
toolchain. After [1], the test is faling at runtime since the
"BR2_INIT_SYSTEMD=y" symbol disapear from the dot config (.config) due to
the new toolchain dependency.

Fix this by using the same toolchain as for the systemd tests [2]

[1] 2196ee25ff29c87001a42a382655d5b52d5de3c4
[2] b3d979c0d1b10de501576644e7dcdba708889b0c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/package/test_lxc.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 346247da08..b32b7a20c4 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -7,6 +7,8 @@ class TestLxc(infra.basetest.BRTest):
     config = \
             """
             BR2_arm=y
+            BR2_cortex_a9=y
+            BR2_ARM_ENABLE_VFP=y
             BR2_TOOLCHAIN_EXTERNAL=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-- 
2.25.1
