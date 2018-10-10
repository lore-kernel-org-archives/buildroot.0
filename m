From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Wed, 10 Oct 2018 08:38:04 +0100
Subject: [Buildroot] [PATCH] manual: add QEMU demo to quick start
Message-ID: <20181010073804.21049-1-ciro.santilli@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
Your software is awesome, and many more people would see that if the
quickstart actually told them how to quickstart and see something happen ;-)

 docs/manual/quickstart.txt | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 74158ae249..d966278778 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -8,12 +8,39 @@ is no need to be root to configure and use Buildroot. By running all
 commands as a regular user, you protect your system against packages
 behaving badly during compilation and installation.
 
-The first step when using Buildroot is to create a configuration.
-Buildroot has a nice configuration tool similar to the one you can
-find in the http://www.kernel.org/[Linux kernel] or in
-http://www.busybox.net/[BusyBox].
+=== Try it out with QEMU
 
-From the buildroot directory, run
+If you just want to try to emulate a simple generic QEMU system to see
+Buildroot at work immediately, run from the buildroot directory:
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
+The initial build can several minutes to a few hours since we download and
+compile GCC, the Linux kernel and other basic system components from
+source.
+
+The QEMU command to use is also documented at: +board/qemu/x86/readme.txt+
+
+=== Day-to-day workflow
+
+More commonly, in your day-to-day workflow, the first step when using
+Buildroot is to create a custom configuration. Buildroot has a nice
+configuration tool similar to the one you can find in the
+http://www.kernel.org/[Linux kernel] or in
+http://www.busybox.net/[BusyBox]:
 
 --------------------
  $ make menuconfig
-- 
2.19.0
