From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 11:37:55 +0200
Subject: [Buildroot] [git commit] sane-backends: uses fork(),
	not available on noMMU systems
Message-ID: <20140517093855.651EB9CC52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8989bfc8a6b88b56d7942a95d6e7517075ed8ffc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-backends/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
