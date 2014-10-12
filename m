From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 19:25:05 +0200
Subject: [Buildroot] [git commit] nginx: disallow AIO support on AArch64
Message-ID: <20141012173113.55507B2B34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6d8bac0963d2596f8c291c234922f8d28436a25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The nginx AIO support cannot build on AArch64, because it hardcodes
the usage of SYS_eventfd(), while it should just use eventfd() from
the C library.

See https://bugs.launchpad.net/linaro-aarch64/+bug/1160013 for details.

Fixes:

  http://autobuild.buildroot.org/results/54b/54bb761f9e774d91066b78217efcd583fdd85ff3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 30cc9d2..ddab0ca 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -16,6 +16,10 @@ if BR2_PACKAGE_NGINX
 
 config BR2_PACKAGE_NGINX_FILE_AIO
 	bool "file AIO support"
+	# Does not build, because nginx hardcodes using SYS_eventfd,
+	# but it's not available on AArch64, only eventfd() is.
+	# See https://bugs.launchpad.net/linaro-aarch64/+bug/1160013
+	depends on !BR2_aarch64
 
 config BR2_PACKAGE_NGINX_HTTP
 	bool "http server"
