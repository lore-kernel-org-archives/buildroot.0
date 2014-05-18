From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 May 2014 23:35:25 +0200
Subject: [Buildroot] [git commit] duma: not available on non-MMU platforms
Message-ID: <20140518213731.83DAB9CC00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=822d5d5f19cb8de7f0fdad9db9dee2aad6d13a62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By design, building duma on Blackfin and other non-MMU platforms is
quite useless: it uses page mappings to detect buffer overrun and
use-after-free programming errors. Therefore, this commit simply marks
duma as not available on non-MMU platforms.

Fixes:

  http://autobuild.buildroot.org/results/951/9519d7abb45c6a789874ec6bb84418c31a98916b/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duma/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/duma/Config.in b/package/duma/Config.in
index e9cc9b2..7679e64 100644
--- a/package/duma/Config.in
+++ b/package/duma/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_DUMA
 	bool "duma"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# By design, duma uses page mapping to isolate
+	# allocations. Non-MMU platforms cannot perform such
+	# things.
+	depends on BR2_USE_MMU
 	help
 	  D.U.M.A. - Detect Unintended Memory Access. A fork of the
 	  Electric Fence library. Detects buffer overflow and
@@ -17,4 +21,5 @@ config BR2_PACKAGE_DUMA_NO_LEAKDETECTION
 endif # BR2_PACKAGE_DUMA
 
 comment "duma needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
