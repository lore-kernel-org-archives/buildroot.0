From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 21:46:28 +0100
Subject: [Buildroot] [git commit] squashfs3: fix build with uClibc
Message-ID: <20120315214110.3B66B90D9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b23df14888f1bf464657c57db49f09bdc33042a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The squashfs3 package uses the old get_nprocs() GNU extension which does not
exist in uClibc. This has already been fixed in newer squashfs releases
(>=4.0). The patch is similar to the one committed in
dfa2a513e1aa7f6ec47f630c5d31d98cd098f408

[Peter: add patch header]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squashfs3/squashfs3-3.4-get_nprocs.patch |   33 ++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/squashfs3/squashfs3-3.4-get_nprocs.patch b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
new file mode 100644
index 0000000..db4b350
--- /dev/null
+++ b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
@@ -0,0 +1,33 @@
+squashfs3: fix build with uClibc
+
+The squashfs3 package uses the old get_nprocs() GNU extension which does not
+exist in uClibc. This has already been fixed in newer squashfs releases
+(>=4.0).
+
+Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
+Index: squashfs3-3.4/squashfs-tools/mksquashfs.c
+===================================================================
+--- squashfs3-3.4.orig/squashfs-tools/mksquashfs.c
++++ squashfs3-3.4/squashfs-tools/mksquashfs.c
+@@ -3178,7 +3178,7 @@ void initialise_threads()
+ 			processors = 1;
+ 		}
+ #else
+-		processors = get_nprocs();
++		processors = sysconf(_SC_NPROCESSORS_CONF);
+ #endif
+ 	}
+ 
+Index: squashfs3-3.4/squashfs-tools/unsquashfs.c
+===================================================================
+--- squashfs3-3.4.orig/squashfs-tools/unsquashfs.c
++++ squashfs3-3.4/squashfs-tools/unsquashfs.c
+@@ -2428,7 +2428,7 @@ void initialise_threads(int fragment_buf
+ 			processors = 1;
+ 		}
+ #else
+-		processors = get_nprocs();
++		processors = sysconf(_SC_NPROCESSORS_CONF);
+ #endif
+ 	}
+ 
