From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Apr 2018 19:17:32 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: fix build with or1k
Message-ID: <20180410171732.10233-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch

diff --git a/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch b/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
new file mode 100644
index 0000000000..b5966c4f93
--- /dev/null
+++ b/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
@@ -0,0 +1,43 @@
+From badc194631867f07e4dfcb8f01c4a3f8046ee6c6 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Apr 2018 18:55:11 +0200
+Subject: [PATCH] gio: fix compilation without F_{S,G}ETPIPE_SZ
+
+Commit a5778ef7c51044147fe470ea1707dd297f44f880 broke compilation on
+architectures without F_SETPIPE_SZ and F_GETPIPE_SZ such as or1k.
+If those variables are undefined, put back previous behavior, buffer
+size set to 1024 * 64
+
+Fixes:
+ - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ gio/gfile.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index 334ad8ec3..4df16b7a3 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3012,6 +3012,7 @@ splice_stream_with_progress (GInputStream           *in,
+   if (!g_unix_open_pipe (buffer, FD_CLOEXEC, error))
+     return FALSE;
+ 
++#if defined(F_SETPIPE_SZ) && defined (F_GETPIPE_SZ)
+   /* Try a 1MiB buffer for improved throughput. If that fails, use the default
+    * pipe size. See: https://bugzilla.gnome.org/791457 */
+   buffer_size = fcntl (buffer[1], F_SETPIPE_SZ, 1024 * 1024);
+@@ -3029,6 +3030,9 @@ splice_stream_with_progress (GInputStream           *in,
+           goto out;
+         }
+     }
++#else
++  buffer_size = 1024 * 64;
++#endif
+ 
+   g_assert (buffer_size > 0);
+ 
+-- 
+2.14.1
+
-- 
2.14.1
