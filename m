From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Jun 2010 22:45:22 +0200
Subject: [Buildroot] [git commit master 1/1] squashfs: fix build with uClibc
Message-ID: <20100617204627.ECCD381632@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfa2a513e1aa7f6ec47f630c5d31d98cd098f408
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

squashfs used the get_nprocs() GNU extension, instead of directly
calling sysconf(), breaking the build on uClibc.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    4 +-
 .../squashfs-4.0-mksquashfs-get_nprocs.patch       |   37 ++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch

diff --git a/CHANGES b/CHANGES
index 0b1dde9..c9cf1e0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,8 @@
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
 	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, netperf, openssl, php, qt, sqlite, tn5250,
-	usbutils, xkeyboard-config
+	lmbench, lrzsz, netperf, openssl, php, qt, sqlite, squashfs,
+	tn5250, usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
diff --git a/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch b/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch
new file mode 100644
index 0000000..8a19923
--- /dev/null
+++ b/package/squashfs/squashfs-4.0-mksquashfs-get_nprocs.patch
@@ -0,0 +1,37 @@
+[PATCH] squashfs-tools: Don't use get_nprocs()
+
+get_nprocs() is a GNU extension, not supported on E.G. uClibc. It is a
+simple wrapper around sysconf(_SC_NPROCESSORS_CONF), so use that instead.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ squashfs-tools/mksquashfs.c |    2 +-
+ squashfs-tools/unsquashfs.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: squashfs4.0/squashfs-tools/mksquashfs.c
+===================================================================
+--- squashfs4.0.orig/squashfs-tools/mksquashfs.c
++++ squashfs4.0/squashfs-tools/mksquashfs.c
+@@ -3705,7 +3705,7 @@ void initialise_threads()
+ 			processors = 1;
+ 		}
+ #else
+-		processors = get_nprocs();
++		processors = sysconf(_SC_NPROCESSORS_CONF);
+ #endif
+ 	}
+ 
+Index: squashfs4.0/squashfs-tools/unsquashfs.c
+===================================================================
+--- squashfs4.0.orig/squashfs-tools/unsquashfs.c
++++ squashfs4.0/squashfs-tools/unsquashfs.c
+@@ -1811,7 +1811,7 @@ void initialise_threads(int fragment_buf
+ 			processors = 1;
+ 		}
+ #else
+-		processors = get_nprocs();
++		processors = sysconf(_SC_NPROCESSORS_CONF);
+ #endif
+ 	}
+ 
-- 
1.7.1
