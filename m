From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:59:02 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 configs/qemu_arm_vexpress_tz_defconfig: optee needs host-python3 w/ modules
Message-ID: <20200315104649.D37978106A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa5daca82020a3471db642da8e00d2c84a382263
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

optee-os needs host-python-pycrypto build for python3. The only way we can
force building host-python modules for python3 is to select python3 package
for the target.

Since we want to avoid adding more host-python3-<modules>
(host-python-pycrypto host-python-pyelftools), select python3 package
even if it's not used.

This problem will be fixed as soon as python2 is removed.

Fixes:
File "scripts/pem_to_pub_c.py", line 24, in main
from Crypto.PublicKey import RSA
ImportError: No module named 'Crypto'

https://gitlab.com/buildroot.org/buildroot/-/jobs/456818689

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9f16ddcdc6e73a790d7350dccb4694706f9d95f5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_arm_vexpress_tz_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configs/qemu_arm_vexpress_tz_defconfig b/configs/qemu_arm_vexpress_tz_defconfig
index bf75493dbe..403b863851 100644
--- a/configs/qemu_arm_vexpress_tz_defconfig
+++ b/configs/qemu_arm_vexpress_tz_defconfig
@@ -38,6 +38,13 @@ BR2_PACKAGE_OPTEE_BENCHMARK=y
 BR2_PACKAGE_OPTEE_EXAMPLES=y
 BR2_PACKAGE_OPTEE_TEST=y
 
+# OP-TEE components needs host-python3 interpreter and its modules
+BR2_PACKAGE_HOST_PYTHON3=y
+# Select python3 on the target to make sure Buildroot builds host-python using
+# python3 and builds all host-python modules for python3.
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PACKAGE_PYTHON3=y
+
 # U-boot for booting the dear Linux kernel
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
