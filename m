From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 May 2015 23:58:42 +0200
Subject: [Buildroot] [git commit] janus-gateway: disable for static build
Message-ID: <20150526215916.C2CE37FA9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2888955ed21c54a3a887d5757b35ef18ba5e669
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

janus-gateway requires dlopen().

Fixes:
http://autobuild.buildroot.net/results/092/092aac2b8abe0edd868a7e0cc59cdaaf28ca4ad5/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/janus-gateway/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/janus-gateway/Config.in b/package/janus-gateway/Config.in
index 6ba5f6a..035ee6c 100644
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
