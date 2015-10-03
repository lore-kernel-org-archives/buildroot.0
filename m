From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 18:45:49 +0200
Subject: [Buildroot] [PATCH 4/4] kodi: Without native RPC use libtirpc
In-Reply-To: <1443890749-27092-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443890749-27092-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443890749-27092-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/kodi/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797f59d..e87bb32 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -181,13 +181,14 @@ config BR2_PACKAGE_KODI_LIBMICROHTTPD
 
 config BR2_PACKAGE_KODI_LIBNFS
 	bool "nfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBNFS
 	help
 	  Enable NFS server support.
 
-comment "nfs support needs a toolchain w/ RPC support"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "nfs support needs a toolchain w/ threads support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
-- 
2.5.3
