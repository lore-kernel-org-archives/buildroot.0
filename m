From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Wed, 10 Oct 2018 10:18:12 +0100
Subject: [Buildroot] [PATCH v3] manual: add QEMU demo to quick start
Message-ID: <20181010091812.26552-1-ciro.santilli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
---
OK, I think this is the best way to structure the more general intro to
configs and their docs.

 docs/manual/quickstart.txt | 65 +++++++++++++++++++++++++++++++++++---
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 74158ae249..2d7595fb76 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -8,12 +8,67 @@ is no need to be root to configure and use Buildroot. By running all
 commands as a regular user, you protect your system against packages
 behaving badly during compilation and installation.
 
-The first step when using Buildroot is to create a configuration.
-Buildroot has a nice configuration tool similar to the one you can
-find in the http://www.kernel.org/[Linux kernel] or in
-http://www.busybox.net/[BusyBox].
+=== Try it out with QEMU
 
-From the buildroot directory, run
+If you just want to emulate a simple generic QEMU system to see
+Buildroot in action immediately, run from the buildroot directory:
+
+--------------------
+make qemu_x86_64_defconfig
+make BR2_JLEVEL="$(nproc)"
+qemu-system-x86_64 \
+  -M pc \
+  -kernel output/images/bzImage \
+  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
+  -append "root=/dev/vda" \
+  -net nic,model=virtio \
+  -net user
+--------------------
+
+Once QEMU boots, login with +root+, and you are now left inside a minimal
+BusyBox based Linux distribution.
+
+The initial build can take several minutes to a few hours since we download
+and compile GCC, the Linux kernel and other basic system components from
+source.
+
+The QEMU command to use is also documented at: +board/qemu/x86_64/readme.txt+
+
+=== Day-to-day workflow
+
+In your day-to-day workflow, the first step when using Buildroot is to
+create a custom configuration.
+
+If you wish to use an existing configuration as your starting point,
+first find the available configs with:
+
+--------------------
+ $ ls configs/
+--------------------
+
+If you want to build for the Raspberry Pi 3 for example, run:
+
+--------------------
+ $ make raspberrypi3_64_defconfig
+--------------------
+
+This command generates a +.config+ file in the root directory.
+
+Each defconfig is documented under:
+
+--------------------
+ $ board/<config-hyphenated>/readme.txt
+--------------------
+
+for example:
+
+--------------------
+ $ less board/raspberrypi3-64/readme.txt
+--------------------
+
+Next, to customize the +.config+, Buildroot has a nice configuration tool
+similar to the one you can find in the http://www.kernel.org/[Linux kernel]
+or in http://www.busybox.net/[BusyBox]. Run it either with
 
 --------------------
  $ make menuconfig
-- 
2.19.0
