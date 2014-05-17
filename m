From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 May 2014 11:31:14 +0200
Subject: [Buildroot] [PATCH] sane-backends: uses fork(),
	not available on noMMU systems
Message-ID: <1400319074-3056-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sane-backends currently doesn't build with the ADI external
toolchains, due to an internal compiler failure. However, using the
internal toolchain backend for Blackfin goes past this internal
compiler failure, but raises the problem that sane-backends uses
fork(). Sane-backends has a --enable-pthreads option that allows to
use threads instead of forking in some parts of sane, but there are
still some other areas of sane-backends that continue to use fork().

Since the probability of using sane-backends on a noMMU system is
fairly small, we'll just disable this package for now on such
architectures, until someone cares enough to investigate deeper.

Fixes:

  http://autobuild.buildroot.org/results/136/136100c3a2d843b7915fdd83d23d8b301fee577e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sane-backends/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index 04222fc..8156e85 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SANE_BACKENDS
 	bool "sane-backends"
+	depends on BR2_USE_MMU # fork()
 	help
 	  SANE - Scanner Access Now Easy
 
-- 
1.9.3
