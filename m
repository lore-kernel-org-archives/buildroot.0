From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 26 May 2015 13:36:47 +0300
Subject: [Buildroot] [PATCH] janus-gateway: disable for static build
Message-ID: <29110f591b47ab63c92023efdf9d419a7630a09b.1432636607.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

janus-gateway requires dlopen().

Fixes:
http://autobuild.buildroot.net/results/092/092aac2b8abe0edd868a7e0cc59cdaaf28ca4ad5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/janus-gateway/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 6ba5f6a1e1db..035ee6c3345e 100644
--- a/package/janus-gateway/Config.in
+++ b/package/janus-gateway/Config.in
@@ -10,12 +10,13 @@ config BR2_PACKAGE_JANUS_GATEWAY
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libmicrohttpd
 	depends on BR2_USE_WCHAR # libnice -> libglib2
 	depends on BR2_USE_MMU # libnice
+	depends on !BR2_STATIC_LIBS # dlopen
 	help
 	  Janus is an open source, general purpose, WebRTC gateway
 	  designed and developed by Meetecho.
 
 	  https://github.com/meetecho/janus-gateway
 
-comment "janus-gateway needs a toolchain w/ threads, wchar"
+comment "janus-gateway needs a toolchain w/ dynamic library, threads, wchar"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.1.4
