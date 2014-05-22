From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 22 May 2014 11:02:23 +0100
Subject: [Buildroot] [PATCH] libnss: Enable for MIPS64 n32 platforms
Message-ID: <1400752943-49138-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After talking with upstream we concluded that MIPS64 n32 is treated as a
32-bit architecture by libnss because it has 32-bit pointers, so
USE_64=1 should not be set in that case.

Upstream bug:
   https://bugzilla.mozilla.org/show_bug.cgi?id=1010730

WRT:
   http://git.buildroot.net/buildroot/commit/?id=73e6ae0fe6a69f88183ae33401f2314088b5f799

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libnss/Config.in |    1 -
 package/libnss/libnss.mk |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 9a1668c..0401a67 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_LIBNSS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libnspr
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnspr
-	depends on !BR2_MIPS_NABI32
 	help
 	  Network Security Services (NSS) is a set of libraries designed
 	  to support development of security-enabled client and server
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 666df74..b07cb6f 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -29,7 +29,7 @@ LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		OS_RELEASE="2.6" \
 		OS_TEST="$(ARCH)"
 
-ifeq ($(BR2_ARCH_IS_64),y)
+ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),yn)
 LIBNSS_BUILD_VARS += USE_64=1
 endif
 
-- 
1.7.1
