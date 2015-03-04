From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 4 Mar 2015 17:28:53 +0000
Subject: [Buildroot] [PATCH] openswan: disable for static builds
Message-ID: <1425490133-51779-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openswan is built with -fPIE which produces shared objects, and shared
objects need "/lib/ld.so" which won't be present on a statically built
target. So, building openswan with -static -fPIE is invalid and will
fail with an error like this one:

/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld:
/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libgmp.a(lt2-add.o):
relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when
making a shared object; recompile with -fPIC

Fixes:

  http://autobuild.buildroot.net/results/68b/68b2211cc7acfbdfed8d4b161cbdaf1429315017/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/openswan/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index 932a75f..1ad255e 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
+	depends on !BR2_STATIC_LIBS # -static -fPIE is invalid
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
 	  Openswan is an implementation of IPsec for Linux
 
 	  http://www.openswan.org
+
+comment "openswan needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
1.7.1
