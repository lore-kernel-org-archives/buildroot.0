From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 23 May 2014 06:43:55 +0300
Subject: [Buildroot] [PATCH] lttng-babeltrace: needs posix_fallocate
Message-ID: <4273b97938555a6f1005b86be56657523070a08e.1400816635.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d8b/d8b5ccc643fe0fb5577392fed37e05b89d4a3951/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lttng-babeltrace/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index cb857c80beb2..fae49ab21594 100644
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
-- 
2.0.0.rc2
