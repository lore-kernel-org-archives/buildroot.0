From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  5 Apr 2020 00:08:41 +0200
Subject: [Buildroot] [PATCHv2 1/2] support/testing: update the ARM toolchain
 used for the systemd init tests
Message-ID: <20200404220842.362610-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As reported on the mailing list, there is a build issue with systemd 245
when using gcc < 5.0:

http://lists.busybox.net/pipermail/buildroot/2020-April/278931.html

Update to the Bootling toolchain 2017.05 that meet the minimum requered
version of toolchain componant:
GCC           5.4.0
linux-headers 3.10.105

See:
https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/readmes/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.txt

Tested:
https://gitlab.com/kubu93/buildroot/pipelines/132890602

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144403
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144405
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144406
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144408
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144410
https://gitlab.com/buildroot.org/buildroot/-/jobs/498144412

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_systemd.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
index 0ac18cb623..10634cbb1f 100644
--- a/support/testing/tests/init/test_systemd.py
+++ b/support/testing/tests/init/test_systemd.py
@@ -2,11 +2,24 @@ import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
 
+# External Toolchain fragment imported from:
+# https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/fragments/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.frag
 class InitSystemSystemdBase(InitSystemBase):
     config = \
         """
         BR2_arm=y
+        BR2_arm926t=y
+        BR2_ARM_CPU_ARMV5=y
+        BR2_ARM_EABI=y
+        BR2_ARM_SOFT_FLOAT=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+        BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi--glibc--stable-2017.05-toolchains-1-1.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
+        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
+        BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
+        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
         BR2_INIT_SYSTEMD=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
-- 
2.25.1
