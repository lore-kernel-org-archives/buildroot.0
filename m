From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jun 2019 18:02:08 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libglib2:
 backport upstream security fix for CVE-2019-12450
Message-ID: <20190627160103.BEC3581283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fab4d559d1ec7fcf1029f627db77bfae58e7c5b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2019-12450: file_copy_fallback in gio/gfile.c in GNOME GLib 2.15.0
through 2.61.1 does not properly restrict file permissions while a copy
operation is in progress.  Instead, default permissions are used.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-gfile-Limit-access-to-files-when-copying.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/libglib2/0005-gfile-Limit-access-to-files-when-copying.patch b/package/libglib2/0005-gfile-Limit-access-to-files-when-copying.patch
new file mode 100644
index 0000000000..750767dfbb
--- /dev/null
+++ b/package/libglib2/0005-gfile-Limit-access-to-files-when-copying.patch
@@ -0,0 +1,56 @@
+From cf09035d361287dfadc93f09272ce68b4a9457ad Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:41:53 +0200
+Subject: [PATCH] gfile: Limit access to files when copying
+
+file_copy_fallback creates new files with default permissions and
+set the correct permissions after the operation is finished. This
+might cause that the files can be accessible by more users during
+the operation than expected. Use G_FILE_CREATE_PRIVATE for the new
+files to limit access to those files.
+
+(cherry picked from commit d8f8f4d637ce43f8699ba94c9b7648beda0ca174)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ gio/gfile.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/gio/gfile.c b/gio/gfile.c
+index a67aad383..ff313ebf8 100644
+--- a/gio/gfile.c
++++ b/gio/gfile.c
+@@ -3279,12 +3279,12 @@ file_copy_fallback (GFile                  *source,
+         out = (GOutputStream*)_g_local_file_output_stream_replace (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+                                                                    FALSE, NULL,
+                                                                    flags & G_FILE_COPY_BACKUP,
+-                                                                   G_FILE_CREATE_REPLACE_DESTINATION,
+-                                                                   info,
++                                                                   G_FILE_CREATE_REPLACE_DESTINATION |
++                                                                   G_FILE_CREATE_PRIVATE, info,
+                                                                    cancellable, error);
+       else
+         out = (GOutputStream*)_g_local_file_output_stream_create (_g_local_file_get_filename (G_LOCAL_FILE (destination)),
+-                                                                  FALSE, 0, info,
++                                                                  FALSE, G_FILE_CREATE_PRIVATE, info,
+                                                                   cancellable, error);
+     }
+   else if (flags & G_FILE_COPY_OVERWRITE)
+@@ -3292,12 +3292,13 @@ file_copy_fallback (GFile                  *source,
+       out = (GOutputStream *)g_file_replace (destination,
+                                              NULL,
+                                              flags & G_FILE_COPY_BACKUP,
+-                                             G_FILE_CREATE_REPLACE_DESTINATION,
++                                             G_FILE_CREATE_REPLACE_DESTINATION |
++                                             G_FILE_CREATE_PRIVATE,
+                                              cancellable, error);
+     }
+   else
+     {
+-      out = (GOutputStream *)g_file_create (destination, 0, cancellable, error);
++      out = (GOutputStream *)g_file_create (destination, G_FILE_CREATE_PRIVATE, cancellable, error);
+     }
+ 
+   if (!out)
+-- 
+2.11.0
+
