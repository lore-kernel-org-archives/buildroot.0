From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:22:26 +0100
Subject: [Buildroot] [git commit] stress-ng: bump to version 0.09.47
Message-ID: <20181202071559.20ECB815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1246179d2e07426b969a49cfaecfdf74dd8a1151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Enable for uClibc, which is supported now.
- Keep microblaze, nios2 and arc restrictions, since it was not possible
  to test on those architectures (no hardware available).
- Keep musl restriction, since it was possible to compile the code (with
  some patches) but it failed at run time with

    Cannot set scheduler: errno=38 (Function not implemented)

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stress-ng/Config.in      | 7 +++----
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 2 +-
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 8816322149..fe92a7eb40 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_STRESS_NG
 	bool "stress-ng"
 	depends on BR2_USE_MMU # fork()
 	# disabled on musl: stress-malloc.c needs mallopt() and M_MMAP_THRESHOLD
-	# disabled on uClibc: stress-aio.c needs aio.h
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	depends on !BR2_microblaze # keyutils
@@ -21,8 +20,8 @@ config BR2_PACKAGE_STRESS_NG
 
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
-comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3"
+comment "stress-ng needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.3"
 	depends on !BR2_microblaze && !BR2_nios2 && !BR2_arc
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
-		|| !BR2_TOOLCHAIN_USES_GLIBC
+		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index e0185fad15..c7c6ec0fe8 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 485f6e7384614fd96955bea4d1f79cd75f8be7e8da30cb3a7e8724ff7b75cd9c stress-ng-0.09.39.tar.xz
+sha256 ed888f5192297855f3ce39b4591b1decc9c580c9753f2cc9c86449f50d23aeb0 stress-ng-0.09.47.tar.xz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 26e100f454..187d276b24 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.09.39
+STRESS_NG_VERSION = 0.09.47
 STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
