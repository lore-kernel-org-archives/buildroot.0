From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 23:11:06 +0200
Subject: [Buildroot] [git commit] libfuse: not available for static builds
Message-ID: <20130414212037.DA9AD9B6AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3776138c7b3ccc031afcb014a5bf1f2c542ba88f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately libfuse uses dl functions exclusively so it can't be used
for static builds so exclude it so.
Fixes:
http://autobuild.buildroot.net/results/a1c3d2b9c436023675c363d9d3b365c95ade0329/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/curlftpfs/Config.in |    5 +++--
 package/libfuse/Config.in   |    6 ++++--
 package/sshfs/Config.in     |    5 +++--
 package/unionfs/Config.in   |    5 +++--
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/curlftpfs/Config.in b/package/curlftpfs/Config.in
index e946d0a..0d8e715 100644
--- a/package/curlftpfs/Config.in
+++ b/package/curlftpfs/Config.in
@@ -10,11 +10,12 @@ config BR2_PACKAGE_CURLFTPFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
 	  CurlFtpFS is a filesystem for accessing FTP hosts based on FUSE
 	  and libcurl.
 
 	  http://curlftpfs.sourceforge.net/
 
-comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR and threads support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "curlftpfs requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index 5d30892..e42f9e0 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
+	# Really doesn't like static, see fuse/lib/fuse.c
+	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
@@ -8,5 +10,5 @@ config BR2_PACKAGE_LIBFUSE
 
 	  http://fuse.sourceforge.net/
 
-comment "libfuse requires a toolchain with LARGEFILE and threads support"
-        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libfuse requires a toolchain with LARGEFILE, threads and dyanmic library support"
+        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 11b6bb9..b6d5aa6 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -9,10 +9,11 @@ config BR2_PACKAGE_SSHFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs requires a toolchain with LARGEFILE, WCHAR and threads support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+comment "sshfs requires a toolchain with LARGEFILE, WCHAR, threads and dynamic library support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index 2ac7be9..6ceee89 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -4,10 +4,11 @@ config BR2_PACKAGE_UNIONFS
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	depends on !BR2_PREFER_STATIC_LIB # libfuse
 	help
 	  A userspace unionfs implementation.
 
 	  http://podgorny.cz/moin/UnionFsFuse
 
-comment "unionfs requires a toolchain with LARGEFILE and threads support"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "unionfs requires a toolchain with LARGEFILE, threads and dynamic library support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
