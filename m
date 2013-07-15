From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 15 Jul 2013 14:47:16 -0500
Subject: [Buildroot] [PATCH 33/67] lttng-babeltrace: libglib2 requires
	threads
In-Reply-To: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
References: <1373917670-30006-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1373917670-30006-34-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/lttng-babeltrace/Config.in | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index 6f47304..4f14477 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
-	# libglib2 needs gettext which needs wchar support, and we
-	# also depends on util-linux which needs wchar
+	# libglib2 needs thread support and gettext which needs wchar support, and 
+	# we also depends on util-linux which needs wchar
 	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# util-linux depends on largefile support
 	depends on BR2_LARGEFILE
 	help
@@ -26,5 +27,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 
 	  http://lttng.org
 
-comment "lttng-babeltrace needs WCHAR and LARGEFILE support"
-	depends on BR2_PACKAGE_LTTNG_TOOLS && !(BR2_USE_WCHAR || BR2_LARGEFILE)
+comment "lttng-babeltrace needs WCHAR, threading and LARGEFILE support"
+	depends on BR2_PACKAGE_LTTNG_TOOLS && \
+		(!BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.8.1.2
