From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Feb 2018 21:29:25 +0100
Subject: [Buildroot] [git commit] package/gpsd: disable profiling support on
 ARC
Message-ID: <20180221203103.AB7B4880C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=937a2cf5a9b6e217692a5bc26ca2b541d97a2cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the currently used ARC glibc version the profiling build fails with
linking error to __mcount. The ARC glibc version arc-2018.03-eng007+
fixes this, therefore when glibc is bumped, this restriction can be
removed.

Fixes:
    http://autobuild.buildroot.net/results/88870f5bf4aff557d8eac4e1cc5d3e397e607af0/

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index d9ab7b7dba..849d22ffa7 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -38,6 +38,8 @@ config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_aarch64
+	# Needs glibc for ARC arc-2018.03-eng007+ for correct __mcount linking
+	depends on !BR2_arc
 
 comment "profiling support not available with uClibc-based toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
