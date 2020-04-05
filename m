From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Apr 2020 20:32:10 +0200
Subject: [Buildroot] [git commit] support/testing: fix systemd test by using
 a more recent gcc
Message-ID: <20200405182013.C4A248BCE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d979c0d1b10de501576644e7dcdba708889b0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported on the mailing list [0], there is a build issue with systemd
245 when using gcc < 5.0, due to the following build issue:

    ../src/shared/gpt.c:7:9: error: initializer element is not constant
             { GPT_ROOT_X86,              "root-x86"              },

The pre-built external toolchain we have for armv5 (the default with
just BR2_arm=y) is a very old toolchain from CodeSourcery, which has a
gcc 4.8; we have no other pre-built toolchains for armv5, except by
using a custom one, like those from the Bootlin toolchain builder. But
using a custom toolchain is not nice, as we want our runtime test to
test nominal configurations.

So, switch the systemd tests to use a Cortex-A9, so that we can use the
ARM 2019.12 toolchain, and with VFP, so that it can boot in the qemu
vexpress machine we use for the test-cases.

Fixes:
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144403
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144405
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144406
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144408
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144410
    https://gitlab.com/buildroot.org/buildroot/-/jobs/498144412

[0] http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[yann.morin.1998 at free.fr:
  - just use cortex-a9_VFP, instead of using a bootlin toolchain
  - adapt the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/init/test_systemd.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 0ac18cb623..371be4ad7d 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -6,6 +6,8 @@ class InitSystemSystemdBase(InitSystemBase):
     config = \
         """
         BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_VFP=y
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
