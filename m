From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 5 Mar 2015 09:22:17 +0000
Subject: [Buildroot] [PATCH v2] openswan: do not use -fPIE for static builds
Message-ID: <1425547337-20035-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-fPIE produces shared objects, and shared objects need "/lib/ld.so"
which won't be present on a statically built target. So, building
openswan with -static -fPIE is invalid and will fail with an error like
this one:

/br/output/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-ctng-linux-uclibc/4.8.2/../../../../mipsel-ctng-linux-uclibc/bin/ld:
/br/output/host/usr/mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libgmp.a(lt2-add.o):
relocation R_MIPS_HI16 against `__gnu_local_gp' can not be used when
making a shared object; recompile with -fPIC

Fixes:

  http://autobuild.buildroot.net/results/68b/68b2211cc7acfbdfed8d4b161cbdaf1429315017/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2: do not disable the package for static builds. Instead
of that, only use -fPIE when BR2_STATIC_LIBS is not set.

 package/openswan/openswan.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ba36f7c..863d1f4 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -11,8 +11,9 @@ OPENSWAN_LICENSE_FILES = COPYING LICENSE
 
 OPENSWAN_DEPENDENCIES = host-bison host-flex gmp iproute2
 OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" \
-	USERCOMPILE="$(TARGET_CFLAGS) -fPIE" INC_USRLOCAL=/usr \
-	USE_KLIPS=false USE_MAST=false USE_NM=false
+	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_STATIC_LIBS),,-fPIE)" \
+	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_STATIC_LIBS),,-fPIE)" \
+	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 	OPENSWAN_DEPENDENCIES += libcurl
-- 
1.7.1
