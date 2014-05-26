From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 May 2014 22:12:52 +0200
Subject: [Buildroot] [git commit] libnss: Enable for MIPS64 n32 platforms
Message-ID: <20140526201321.CBF199CD2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89e8b2437c42f50d6a4c55ce24984f58a14d5027
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After talking with upstream we concluded that MIPS64 n32 is treated as a
32-bit architecture by libnss because it has 32-bit pointers, so
USE_64=1 should not be set in that case.

Upstream bug:
   https://bugzilla.mozilla.org/show_bug.cgi?id=1010730

WRT:
   http://git.buildroot.net/buildroot/commit/?id=73e6ae0fe6a69f88183ae33401f2314088b5f799

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/Config.in |    2 --
 package/libnss/libnss.mk |    4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index 9a1668c..690f928 100644
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
@@ -19,4 +18,3 @@ config BR2_PACKAGE_LIBNSS
 comment "libnss needs a toolchain w/ largefile, threads"
 	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_MIPS_NABI32
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 666df74..dcbf8bb 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -30,8 +30,12 @@ LIBNSS_BUILD_VARS = MOZILLA_CLIENT=1 \
 		OS_TEST="$(ARCH)"
 
 ifeq ($(BR2_ARCH_IS_64),y)
+# MIPS64 n32 is treated as a 32-bit architecture by libnss.
+# See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
+ifeq ($(BR2_MIPS_NABI32),)
 LIBNSS_BUILD_VARS += USE_64=1
 endif
+endif
 
 
 define LIBNSS_BUILD_CMDS
