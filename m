From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:27:49 +0100
Subject: [Buildroot] [git commit] package/nginx: disallow AIO support on arc
Message-ID: <20141207202801.B8012800F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e935d6079f8d0d91a3ec6c5aba45c97de47f5c98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nginx AIO support cannot build on arc, because it hardcodes
the usage of SYS_eventfd(), while it should just use eventfd() from
the C library.

Fixes:
  http://autobuild.buildroot.org/results/f3e/f3e2c7a937517a5444f8c6cc0b02692af897b3e0/

[Thomas: adjust comment as suggested by Yann.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index c2a6af1..e5d20af 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -17,9 +17,11 @@ if BR2_PACKAGE_NGINX
 config BR2_PACKAGE_NGINX_FILE_AIO
 	bool "file AIO support"
 	# Does not build, because nginx hardcodes using SYS_eventfd,
-	# but it's not available on AArch64, only eventfd() is.
-	# See https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
+	# but it's available on neither AArch64 nor ARC where only
+	# eventfd() is available.  See
+	# https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
 	depends on !BR2_aarch64
+	depends on !BR2_arc
 
 config BR2_PACKAGE_NGINX_HTTP
 	bool "http server"
