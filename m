From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 14:53:05 +0200
Subject: [Buildroot] [git commit] support/testing: add builtin armv5 kernel
 4.19 with entropy
Message-ID: <20190803125127.5AE7C813F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7acb32dabb80cc9f0dfc48f14e9bc86b3ef5df74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

More and more packages being tested by the test infra, e.g. syslog-ng,
need entropy at startup, usually reading from /dev/random.

Some test cases can also depend on a kernel version newer than the
builtin ones already provided by the test infra:
 - 3.11.0 for armv5;
 - 4.0.0 for armv7.

Add a new builtin kernel to be used by such test cases.
Add it for armv5 so most test cases that switch to use this kernel can
keep using BASIC_TOOLCHAIN_CONFIG.
Use the same kernel version and kernel config as qemu_arm_versatile plus
HW_RANDOM_VIRTIO for VirtIORNG to be usable.
Copy the actual binary file from the syslog-ng runtime test at current
master @ 29e1cb8884.

Since there is already a 'kernel-versatile' file on autobuild.buildroot.net
and we must keep it with this name for reproducibility purposes, create a
simple naming convention for newer builtin kernel images and dtb files:
kernel-<defconfig>-<kernel_series_version>
<dtb_name>-<kernel_series_version>.dtb
Pass '-device virtio-rng-pci' to qemu when this kernel is used.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Peter: use this new kernel instead of the old builtin/armv5 kernel]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/infra/emulator.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 3d3e1750c6..093a643a8b 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -61,8 +61,12 @@ class Emulator(object):
                     qemu_cmd += ["-M", "vexpress-a9"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-versatile")
+                                            "kernel-versatile-4.19")
+                    dtb = infra.download(self.downloaddir,
+                                         "versatile-pb-4.19.dtb")
+                    qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "versatilepb"]
+                    qemu_cmd += ["-device", "virtio-rng-pci"]
 
             qemu_cmd += ["-kernel", kernel]
 
