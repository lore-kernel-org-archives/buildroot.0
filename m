From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 21 Aug 2018 22:16:17 +0200
Subject: [Buildroot] [PATCH v1] qt5base: fix double conversion for
 microblazeel/microblazebe
Message-ID: <20180821201617.20231-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  ../3rdparty/double-conversion/include/double-conversion/utils.h:81:2: error: #error Target architecture was not detected as supported by Double-Conversion.
  #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/489/4891d96f45c64c2e66fe819bd4175cc1d6243a93

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

Double-converson tested with:

	$ cat div.c
double Div_double(double x, double y) { return x / y; }

	$ cat main.c

double Div_double(double x, double y);

int main(int argc, char** argv) {
  double result = Div_double(89255.0, 1e22);
  if (result == 89255e-22) {
    printf("correct result %e\n", result);
    return 1;
  } else {
    printf("wrong result %e\n", result);
    return 0;
  }
}

For microblazeel (using qemu_microblazeel_mmu_defconfig changed to musl
because the original uclibc resulted in 'mmap of a spare page failed!'
error message):

	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c main.c
	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -c div.c
	$ ./build_qemu_microblazeel_001/host/bin/microblazeel-buildroot-linux-musl-gcc -o main main.o div.o

Fix wrong staging absolute soft link to relative:
	$ ls -l build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
../staging/lib/ld-musl-microblazeel.so.1 -> /lib/libc.so
	$ rm build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1
	$ ln -s libc.so build_qemu_microblazeel_001/staging/lib/ld-musl-microblazeel.so.1

	$ qemu-3.0.0-microblazeel-install/bin/qemu-microblazeel -L build_qemu_microblazeel_001/staging main
correct result 8.925500e-18

For microblazebe (using qemu_microblazebe_mmu_defconfig changed to glibc
because the original uclibc resulted in 'mmap of a spare page failed!'
error message):

	$ ./build_qemu_microblazebe_001/host/bin/microblaze-buildroot-linux-gnu-gcc -c main.c
	$ ./build_qemu_microblazebe_001/host/bin/microblaze-buildroot-linux-gnu-gcc -c div.c
	$ .//build_qemu_microblazebe_001/host/bin/microblaze-buildroot-linux-gnu-gcc -o main main.o div.o

	$ qemu-3.0.0-microblazebe-install/bin/qemu-microblaze  -L build_qemu_microblazebe_001/staging main
correct result 8.925500e-18
---
 ...ble-conversion-enable-for-microblaze.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch

diff --git a/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch b/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch
new file mode 100644
index 0000000000..2d7164b67c
--- /dev/null
+++ b/package/qt5/qt5base/5.11.1/0004-double-conversion-enable-for-microblaze.patch
@@ -0,0 +1,27 @@
+From 372d33fbe549ea73318c187505716ac99fbf3054 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 21 Aug 2018 21:11:40 +0200
+Subject: [PATCH] double-conversion: enable for microblaze
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ .../double-conversion/include/double-conversion/utils.h        | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/double-conversion/include/double-conversion/utils.h b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+index b0a7d5d4f4..485f680180 100644
+--- a/src/3rdparty/double-conversion/include/double-conversion/utils.h
++++ b/src/3rdparty/double-conversion/include/double-conversion/utils.h
+@@ -66,7 +66,8 @@
+     defined(__SH4__) || defined(__alpha__) || \
+     defined(_MIPS_ARCH_MIPS32R2) || \
+     defined(__AARCH64EL__) || defined(__AARCH64EB__) || \
+-    defined(__or1k__)
++    defined(__or1k__) || \
++    defined(__microblaze__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
+ #if defined(_WIN32)
+-- 
+2.18.0
+
-- 
2.18.0
