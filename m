From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 May 2016 09:22:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/stress-ng: mark as not available on
	nios2
Message-ID: <1463815337-3115-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For technical details see
https://git.busybox.net/buildroot/commit/package/ffmpeg/Config.in?id=8b58ec016973bee87a4fc1cc99a32b206bdee136

Fixes
http://autobuild.buildroot.net/results/bb3/bb3b748a14465a6168917bfbed90b2ff84fbdedf/
http://autobuild.buildroot.net/results/0ee/0ee3132f4ee6b5f21851f93516e0d0c419b36b1b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/stress-ng/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 1e475b1..20ec93a 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_STRESS_NG
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	depends on !BR2_microblaze # keyutils
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	depends on !BR2_nios2
 	depends on !BR2_STATIC_LIBS # keyutils
 	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
 	select BR2_PACKAGE_ATTR # stress-xattr.c needs xattr.h
@@ -19,7 +21,7 @@ config BR2_PACKAGE_STRESS_NG
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
 comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3"
-	depends on !BR2_microblaze
+	depends on !BR2_microblaze && !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
 		|| !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.8.1
