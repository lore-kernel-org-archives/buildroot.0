From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 23:11:03 +0100
Subject: [Buildroot] [git commit] stress-ng: not available on ARC
Message-ID: <20171102220502.2F55D80803@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a4fd532b7e5012b532c842639e3b82f751f0f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that ARC supports glibc, stress-ng can be built. Unfortunately,
like NIOS2, it doesn't implement FE_INVALID and a bunch of other
<fenv.h> definitions, so let's prevent stress-ng from being built on
ARC.

Fixes:

  http://autobuild.buildroot.net/results/296b14584c200593f88af75cdda65c4ca03cd863/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/stress-ng/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/Config.in b/package/stress-ng/Config.in
index 20ec93a..8816322 100644
--- a/package/stress-ng/Config.in
+++ b/package/stress-ng/Config.in
@@ -7,8 +7,9 @@ config BR2_PACKAGE_STRESS_NG
 	# perf.c needs PERF_COUNT_HW_REF_CPU_CYCLES
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	depends on !BR2_microblaze # keyutils
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
+	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2 and ARC
 	depends on !BR2_nios2
+	depends on !BR2_arc
 	depends on !BR2_STATIC_LIBS # keyutils
 	select BR2_PACKAGE_KEYUTILS # stress-key.c needs keyutils.h
 	select BR2_PACKAGE_ATTR # stress-xattr.c needs xattr.h
@@ -21,7 +22,7 @@ config BR2_PACKAGE_STRESS_NG
 	  http://kernel.ubuntu.com/~cking/stress-ng/
 
 comment "stress-ng needs a glibc toolchain w/ dynamic library, headers >= 3.3"
-	depends on !BR2_microblaze && !BR2_nios2
+	depends on !BR2_microblaze && !BR2_nios2 && !BR2_arc
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3 \
 		|| !BR2_TOOLCHAIN_USES_GLIBC
