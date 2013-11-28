From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 10:18:07 +0100
Subject: [Buildroot] [PATCH] gpsd: do not allow profiling support on AArch64
Message-ID: <1385630287-14110-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The profiling support is not available on AArch64, causing build
failures such as:

  http://autobuild.buildroot.net/results/724f8646e1c2c28cf187f2313244d1e3e61b4c25/

According to Will Newton, function profiling will only be added in the
next version of the AArch64 Linaro toolchain. This indicates it is a
rather new feature in AArch64, so for the moment, just disallow
profiling on AArch64. We can revise this later, when this feature has
been made available in Linaro toolchains, and official gcc releases
(for internal toolchain support).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 5b007d7..2fd97d0 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -34,6 +34,7 @@ config BR2_PACKAGE_GPSD_OLDSTYLE
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_aarch64
 
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
1.8.1.2
