From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 15 Mar 2012 16:15:47 +0000
Subject: [Buildroot] [PATCH] squashfs3: fix build with uClibc
Message-ID: <1331828147-23010-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The squashfs3 package uses the old get_nprocs() GNU extension which does not
exist in uClibc. This has already been fixed in newer squashfs releases (>=4.0).
The patch is similar to the one committed in
dfa2a513e1aa7f6ec47f630c5d31d98cd098f408

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/squashfs3/squashfs3-3.4-get_nprocs.patch |   26 ++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 package/squashfs3/squashfs3-3.4-get_nprocs.patch

diff --git a/package/squashfs3/squashfs3-3.4-get_nprocs.patch b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
new file mode 100644
index 0000000..e6901de
--- /dev/null
+++ b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
@@ -0,0 +1,26 @@
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
-- 
1.7.1
