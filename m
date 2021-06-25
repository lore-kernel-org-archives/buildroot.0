From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 25 Jun 2021 11:05:32 +0300
Subject: [Buildroot] [PATCH] package/openpgm: fix link for 32-bit x86
Message-ID: <1e611fcaedd4a6f29ddf12f9d685d9a29c578d3e.1624608332.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing link with libpgm on build for x86 32-bit.

Fixes:
http://autobuild.buildroot.net/results/80254e61dc55bc07b16b3b66710946c71b9d53bb/
http://autobuild.buildroot.net/results/7bce71db86df8ba204153e0ab5022fb5ace9a6e5/
http://autobuild.buildroot.net/results/24a0aaff8f46953d015218a60da2c9856152eea3/

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...hecksum.c-fix-build-with-32-bits-MMX.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch

diff --git a/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch b/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch
new file mode 100644
index 000000000000..a04dc7dba98d
--- /dev/null
+++ b/package/openpgm/0002-openpgm-pgm-checksum.c-fix-build-with-32-bits-MMX.patch
@@ -0,0 +1,41 @@
+From b7fa865fa6b06d97d424c500fd1c4bc44c096359 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Nov 2020 22:46:18 +0100
+Subject: [PATCH] openpgm/pgm/checksum.c: fix build with 32 bits MMX
+
+Build with i386-pentium-mmx or i686 is broken since version 5-3-128 and
+https://github.com/steve-o/openpgm/commit/b276dc15be5d4e6e1143b9de25d09f63f9c85135
+because _mm_cvtm64_si64 is undefined resulting in the following build
+failure for example on zeromq:
+
+/srv/storage/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i586-buildroot-linux-musl/8.3.0/../../../../i586-buildroot-linux-musl/bin/ld: /srv/storage/autobuild/run/instance-3/output-1/host/i586-buildroot-linux-musl/sysroot/usr/lib32/libpgm-5.3.so.0: undefined reference to `_mm_cvtm64_si64'
+
+So use the fallback if __x86_64__ is not defined
+
+Fixes:
+ - http://autobuild.buildroot.org/results/01d9be37e8a743307128f53f41785654c9971e1a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit b7fa865fa6b06d97d424c500fd1c4bc44c096359
+
+ openpgm/pgm/checksum.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/openpgm/pgm/checksum.c b/openpgm/pgm/checksum.c
+index fef89bce237c..8d8dd3f32305 100644
+--- a/openpgm/pgm/checksum.c
++++ b/openpgm/pgm/checksum.c
+@@ -948,7 +948,7 @@ do_csumcpy_mmx (
+ 
+ 		sum = _mm_add_pi32 (sum, lo);
+ 		sum = _mm_add_pi32 (sum, hi);
+-#if 1
++#if defined(__x86_64__)
+ 		*(int64_t*)dst = _mm_cvtm64_si64 (tmp);
+ #else		
+ 		((int*)dst)[1] = _mm_cvtsi64_si32 (tmp);
+-- 
+2.30.2
+
-- 
2.30.2
