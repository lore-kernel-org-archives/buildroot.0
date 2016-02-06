From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 13:04:20 +0100
Subject: [Buildroot] [git commit] ympd: needs <dlfcn.h>
Message-ID: <20160206120508.6018F80284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b7a5c10a8d1fcb6cbb41d92c5ce9306754b32b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on !BR2_STATIC_LIBS, since <dlfcn.h> is used. While
we're at it, we also fix the comment which was lacking the BR2_USE_MMU
dependency.

Fixes:

  http://autobuild.buildroot.org/results/30853c1011544f8b6a5d3b3852af93bef4c0f5cb/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ympd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index ba0e5e8..d0901c7 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -3,9 +3,11 @@ config BR2_PACKAGE_YMPD
 	select BR2_PACKAGE_LIBMPDCLIENT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
 	help
 	  ympd, a standalone MPD Web GUI written in C, utilizing
 	  Websockets and Bootstrap/JS
 
-comment "ympd needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "ympd needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
