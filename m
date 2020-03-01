From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 18:43:42 +0100
Subject: [Buildroot] [git commit] support/testing: test_systemd.py: add
 linux fragment to enable CONFIG_BINFMT_MISC
Message-ID: <20200301173253.647468F0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b1e4404c047f87e8c1e5321d9f01b8620e983ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While investigating [1] one units failed due to missing kernel option
CONFIG_BINFMT_MISC needed by "proc-sys-fs-binfmt_misc.mount" service.

It's because the kernel support autofs4 but not MISC binaries.

Since the systemd test infra use the default defconfig (vexpress),
we need to provide a linux fragment to enable CONFIG_BINFMT_MISC.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/454255917

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr:
  - move the kernel config with the others in conf/
]
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/conf/binfmt-misc-kernel-fragment.config | 2 ++
 support/testing/tests/init/test_systemd.py              | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/testing/conf/binfmt-misc-kernel-fragment.config b/support/testing/conf/binfmt-misc-kernel-fragment.config
new file mode 100644
index 0000000000..7c992ff71b
--- /dev/null
+++ b/support/testing/conf/binfmt-misc-kernel-fragment.config
@@ -0,0 +1,2 @@
+# Needed for binfmt_misc service: "Arbitrary Executable File Formats File System"
+CONFIG_BINFMT_MISC=y
diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index a324ba8569..0ac18cb623 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -13,10 +13,11 @@ class InitSystemSystemdBase(InitSystemBase):
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
         BR2_LINUX_KERNEL_DTS_SUPPORT=y
         BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
         # BR2_TARGET_ROOTFS_TAR is not set
-        """
+        """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
 
     def check_init(self):
         super(InitSystemSystemdBase, self).check_init("/lib/systemd/systemd")
