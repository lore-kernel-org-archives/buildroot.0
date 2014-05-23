From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 14:44:26 +0200
Subject: [Buildroot] [git commit] lttng-babeltrace: needs posix_fallocate
Message-ID: <20140523200519.17E289CD77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7467fbead7cf87ee96449014fd37720c64bc3966
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/d8b/d8b5ccc643fe0fb5577392fed37e05b89d4a3951/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-babeltrace/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index cb857c8..fae49ab 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_LARGEFILE # util-linux
+	depends on BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC # posix_fallocate
 	help
 	  Babeltrace is part of the LTTng 2.x project.
 
@@ -25,7 +26,8 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://lttng.org
 
-comment "lttng-babeltrace needs a toolchain w/ wchar, threads, largefile"
+comment "lttng-babeltrace needs a uclibc snapshot or (e)glib toolchain w/ wchar, threads, largefile"
 	depends on BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_UCLIBC_VERSION_SNAPSHOT || !BR2_TOOLCHAIN_USES_GLIBC
