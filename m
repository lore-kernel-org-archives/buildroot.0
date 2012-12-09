From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Dec 2012 11:05:41 -0300
Subject: [Buildroot] [PATCH] libfuse: needs threads
Message-ID: <1355061941-10170-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libfuse needs threads, fixes:
http://autobuild.buildroot.net/results/0111a67b9ed5f5f5dfc0725d009ea5c756c1755c

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libfuse/Config.in |    5 +++--
 package/sshfs/Config.in   |    1 +
 package/unionfs/Config.in |    1 +
 3 files changed, 5 insertions(+), 2 deletions(-)

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
index 37188ba..f729143 100644
--- a/package/sshfs/Config.in
+++ b/package/sshfs/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_SSHFS
 	select BR2_PACKAGE_OPENSSH
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	help
 	  FUSE filesystem client based on the SSH File Transfer Protocol.
 
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
index a974c8c..84dd7d7 100644
--- a/package/unionfs/Config.in
+++ b/package/unionfs/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_UNIONFS
 	bool "unionfs (FUSE)"
 	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	help
 	  A userspace unionfs implementation.
 
-- 
1.7.8.6
