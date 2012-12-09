From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 21:34:41 +0100
Subject: [Buildroot] [git commit] libfuse: needs threads
Message-ID: <20121209203933.E3B9C99B0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6e514692cf301edb6917c7b8cff486473bff9c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfuse needs threads, fixes:
http://autobuild.buildroot.net/results/0111a67b9ed5f5f5dfc0725d009ea5c756c1755c

[Peter: update sshfs/unionfs comments to match]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libfuse/Config.in |    5 +++--
 package/sshfs/Config.in   |    5 +++--
 package/unionfs/Config.in |    5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/libfuse/Config.in b/package/libfuse/Config.in
index dffadf8..2e9b7dc 100644
--- a/package/libfuse/Config.in
+++ b/package/libfuse/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_LIBFUSE
 	bool "libfuse"
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  FUSE (Filesystem in UserSpacE)
 
 	  http://fuse.sourceforge.net/
 
-comment "libfuse requires a toolchain with LARGEFILE support"
-        depends on !BR2_LARGEFILE
+comment "libfuse requires a toolchain with LARGEFILE and threads support"
+        depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sshfs/Config.in b/package/sshfs/Config.in
index 37188ba..d0cf932 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
 	  http://fuse.sourceforge.net/sshfs.html
 
-comment "sshfs requires a toolchain with LARGEFILE and WCHAR support"
-	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+comment "sshfs requires a toolchain with LARGEFILE, WCHAR and threads support"
+	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index a974c8c..92f1787 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	help
 	  A userspace unionfs implementation.
 
 	  http://podgorny.cz/moin/UnionFsFuse
 
-comment "unionfs requires a toolchain with LARGEFILE support"
-	depends on !BR2_LARGEFILE
+comment "unionfs requires a toolchain with LARGEFILE and threads support"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
