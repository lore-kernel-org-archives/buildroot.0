From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:10:37 +0200
Subject: [Buildroot] [git commit] proxychains-ng: needs dynamic library
	support
Message-ID: <20131005191321.74F189B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=313e735a68b691827eb17d4486957d52ab8c7630
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error if BR2_PREFER_STATIC_LIB is set:

src/libproxychains.c:34:19: fatal error: dlfcn.h: No such file or directory
compilation terminated.
make[1]: *** [src/libproxychains.o] Error 1

In additional, the README file also mentions that this program works only on
dynamically linked programs.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proxychains-ng/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/proxychains-ng/Config.in b/package/proxychains-ng/Config.in
index 99e49bd..97eaa0c 100644
--- a/package/proxychains-ng/Config.in
+++ b/package/proxychains-ng/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_PROXYCHAINS_NG
 	bool "proxychains-ng"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  Force any tcp connections to flow through a proxy (or proxy chain)
 
 	  https://github.com/rofl0r/proxychains
 
-comment "proxychains-ng needs a toolchain with thread support"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "proxychains-ng needs a toolchain with thread and dynamic library support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
