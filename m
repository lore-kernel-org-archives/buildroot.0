From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 3 Aug 2019 21:23:48 +0200
Subject: [Buildroot] [git commit] package/icu: Fix nios2 build
Message-ID: <20190803192803.E22A888FF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=345ed3f15f9a574f725e3dc0f9a8b2935ea29bf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/icu/0006-ICU-20751-Fix-nios2-build.patch | 46 ++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/icu/0006-ICU-20751-Fix-nios2-build.patch b/package/icu/0006-ICU-20751-Fix-nios2-build.patch
new file mode 100644
index 0000000000..6587de484d
--- /dev/null
+++ b/package/icu/0006-ICU-20751-Fix-nios2-build.patch
@@ -0,0 +1,46 @@
+From d9d99097a5b28f4204b3a15e82564e50f9e62f5a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 3 Aug 2019 08:05:35 +0200
+Subject: [PATCH] ICU-20751 Fix nios2 build
+
+Nios2 supports double conversion, tested using qemu:
+
+./main || echo "correct"
+correct
+uname -a
+Linux buildroot 4.19.16 #4 Sat Aug 3 14:46:48 CEST 2019 nios2 GNU/Linux
+
+Solves build error
+
+In file included from double-conversion.h:42:0,
+                 from number_decimalquantity.cpp:19:
+double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
+ #error Target architecture was not detected as supported by Double-Conversion.
+
+detected by buildroot autobuilders:
+http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
+
+Patch sent upstream: https://github.com/unicode-org/icu/pull/725
+Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ source/i18n/double-conversion-utils.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/source/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
+index 1e44fcaa0e..0cf993929f 100644
+--- a/source/i18n/double-conversion-utils.h
++++ b/source/i18n/double-conversion-utils.h
+@@ -95,6 +95,7 @@ int main(int argc, char** argv) {
+     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
++    defined(__nios2__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+-- 
+2.20.1
+
