From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 17:19:43 +0200
Subject: [Buildroot] [PATCH v3] kodi: Without native RPC use libtirpc
Message-ID: <1443971983-17800-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
v2 -> v3:
   - Remove the select (not needed, we only have to propagate the
     depends on)
---
 package/kodi/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 797f59d..eede243 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -181,13 +181,14 @@ config BR2_PACKAGE_KODI_LIBMICROHTTPD
 
 config BR2_PACKAGE_KODI_LIBNFS
 	bool "nfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# libnfs -> libtirpc
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS
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
