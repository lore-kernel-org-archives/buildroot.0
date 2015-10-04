From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 Oct 2015 17:21:53 +0200
Subject: [Buildroot] [PATCH] mpd: Without native RPC use libtirpc
Message-ID: <1443972113-18150-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/mpd/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 28962f7..3bfeb3e 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -179,13 +179,14 @@ config BR2_PACKAGE_MPD_CURL
 
 config BR2_PACKAGE_MPD_LIBNFS
 	bool "nfs"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# libnfs -> libtirpc
+	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBNFS
 	help
 	  Enable Network File System (NFS) support.
 
-comment "nfs support needs a toolchain w/ RPC"
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+comment "nfs support needs a toolchain w/ threads support"
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
 comment "samba support needs an (e)glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.5.3
