From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Oct 2019 22:06:54 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/icu: fix double conversion
 compile for xtensa
In-Reply-To: <20191028210654.20400-1-ps.report@gmx.net>
References: <20191028210654.20400-1-ps.report@gmx.net>
Message-ID: <20191028210654.20400-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  In file included from double-conversion.h:42,
                   from number_decimalquantity.cpp:19:
  double-conversion-utils.h:121:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   #error Target architecture was not detected as supported by Double-Conversion.

[1] http://autobuild.buildroot.net/results/fc331ae8e2484be6818f4fc334d3f8c9658fffdc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:

Double-conversion tested with:

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

Tested for xtensa (using qemu_xtensa_lx60_defconfig plus BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE):

	$ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c div.c
	$ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c main.c
	$ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -o main main.o div.o

	$ ./host/bin/qemu-xtensa -L staging main
correct result 8.925500e-18
---
 ...-double-conversion-enable-for-xtensa.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/icu/0008-double-conversion-enable-for-xtensa.patch

diff --git a/package/icu/0008-double-conversion-enable-for-xtensa.patch b/package/icu/0008-double-conversion-enable-for-xtensa.patch
new file mode 100644
index 0000000000..7694ee2293
--- /dev/null
+++ b/package/icu/0008-double-conversion-enable-for-xtensa.patch
@@ -0,0 +1,26 @@
+From f8f37357fa7cc403848d2bafe6152a707ca3a074 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 28 Oct 2019 21:26:05 +0100
+Subject: [PATCH] double-conversion: enable for xtensa
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ source/i18n/double-conversion-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index a00037e..b3100ac 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -104,7 +104,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || \
+     defined(__or1k__) || defined(__arc__) || \
+-    defined(__microblaze__) || \
++    defined(__microblaze__) || defined(__XTENSA__) || \
+     defined(__EMSCRIPTEN__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__) || \
+--
+2.23.0
+
--
2.23.0
