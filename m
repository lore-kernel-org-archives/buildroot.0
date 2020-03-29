From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Mar 2020 18:02:43 +0200
Subject: [Buildroot] [PATCH 2/5] package/gvfs: fix CVE-2019-12448
In-Reply-To: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
References: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329160246.4053834-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An issue was discovered in GNOME gvfs 1.29.4 through 1.41.2.
daemon/gvfsbackendadmin.c has race conditions because the admin backend
doesn't implement query_info_on_read/write.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ery_info_on_read-write-functionality.patch | 131 ++++++++++++++++++
 package/gvfs/gvfs.mk                          |   3 +
 2 files changed, 134 insertions(+)
 create mode 100644 package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch

diff --git a/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch b/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
new file mode 100644
index 0000000000..79a11035de
--- /dev/null
+++ b/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
@@ -0,0 +1,131 @@
+From 5cd76d627f4d1982b6e77a0e271ef9301732d09e Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:24:36 +0200
+Subject: [PATCH] admin: Add query_info_on_read/write functionality
+
+Admin backend doesn't implement query_info_on_read/write which might
+potentially lead to some race conditions which aren't really wanted
+especially in case of admin backend. Let's add this missing functionality.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved fom:
+https://gitlab.gnome.org/GNOME/gvfs/commit/5cd76d627f4d1982b6e77a0e271ef9301732d09e]
+---
+ daemon/gvfsbackendadmin.c | 79 +++++++++++++++++++++++++++++++++------
+ 1 file changed, 67 insertions(+), 12 deletions(-)
+
+diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
+index 65a979e7..23d16f16 100644
+--- a/daemon/gvfsbackendadmin.c
++++ b/daemon/gvfsbackendadmin.c
+@@ -42,6 +42,8 @@
+ #include "gvfsjobopenforwrite.h"
+ #include "gvfsjobqueryattributes.h"
+ #include "gvfsjobqueryinfo.h"
++#include "gvfsjobqueryinforead.h"
++#include "gvfsjobqueryinfowrite.h"
+ #include "gvfsjobread.h"
+ #include "gvfsjobseekread.h"
+ #include "gvfsjobseekwrite.h"
+@@ -155,6 +157,19 @@ complete_job (GVfsJob *job,
+   g_vfs_job_succeeded (job);
+ }
+ 
++static void
++fix_file_info (GFileInfo *info)
++{
++  /* Override read/write flags, since the above call will use access()
++   * to determine permissions, which does not honor our privileged
++   * capabilities.
++   */
++  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
++  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
++  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
++  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
++}
++
+ static void
+ do_query_info (GVfsBackend *backend,
+                GVfsJobQueryInfo *query_info_job,
+@@ -180,19 +195,57 @@ do_query_info (GVfsBackend *backend,
+   if (error != NULL)
+     goto out;
+ 
+-  /* Override read/write flags, since the above call will use access()
+-   * to determine permissions, which does not honor our privileged
+-   * capabilities.
+-   */
+-  g_file_info_set_attribute_boolean (real_info,
+-                                     G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
+-  g_file_info_set_attribute_boolean (real_info,
+-                                     G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
+-  g_file_info_set_attribute_boolean (real_info,
+-                                     G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
+-  g_file_info_set_attribute_boolean (real_info,
+-                                     G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
++  fix_file_info (real_info);
++  g_file_info_copy_into (real_info, info);
++  g_object_unref (real_info);
++
++ out:
++  complete_job (job, error);
++}
++
++static void
++do_query_info_on_read (GVfsBackend *backend,
++                       GVfsJobQueryInfoRead *query_info_job,
++                       GVfsBackendHandle handle,
++                       GFileInfo *info,
++                       GFileAttributeMatcher *matcher)
++{
++  GVfsJob *job = G_VFS_JOB (query_info_job);
++  GFileInputStream *stream = handle;
++  GError *error = NULL;
++  GFileInfo *real_info;
++
++  real_info = g_file_input_stream_query_info (stream, query_info_job->attributes,
++                                              job->cancellable, &error);
++  if (error != NULL)
++    goto out;
++
++  fix_file_info (real_info);
++  g_file_info_copy_into (real_info, info);
++  g_object_unref (real_info);
++
++ out:
++  complete_job (job, error);
++}
++
++static void
++do_query_info_on_write (GVfsBackend *backend,
++                        GVfsJobQueryInfoWrite *query_info_job,
++                        GVfsBackendHandle handle,
++                        GFileInfo *info,
++                        GFileAttributeMatcher *matcher)
++{
++  GVfsJob *job = G_VFS_JOB (query_info_job);
++  GFileOutputStream *stream = handle;
++  GError *error = NULL;
++  GFileInfo *real_info;
++
++  real_info = g_file_output_stream_query_info (stream, query_info_job->attributes,
++                                               job->cancellable, &error);
++  if (error != NULL)
++    goto out;
+ 
++  fix_file_info (real_info);
+   g_file_info_copy_into (real_info, info);
+   g_object_unref (real_info);
+ 
+@@ -868,6 +921,8 @@ g_vfs_backend_admin_class_init (GVfsBackendAdminClass * klass)
+   backend_class->mount = do_mount;
+   backend_class->open_for_read = do_open_for_read;
+   backend_class->query_info = do_query_info;
++  backend_class->query_info_on_read = do_query_info_on_read;
++  backend_class->query_info_on_write = do_query_info_on_write;
+   backend_class->read = do_read;
+   backend_class->create = do_create;
+   backend_class->append_to = do_append_to;
+-- 
+2.24.1
+
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6c927fa345..eb31f6f8df 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -18,6 +18,9 @@ GVFS_LIBS = $(TARGET_NLS_LIBS)
 # 0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
 GVFS_IGNORE_CVES += CVE-2019-3827
 
+# package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
+GVFS_IGNORE_CVES += CVE-2019-12448
+
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
-- 
2.25.1
