From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 21:04:32 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gvfs: fix
 CVE-2019-12449
Message-ID: <20200407185328.F41E88D7B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=256a070187ef3eaee3be46dc59d04ca0af3579b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

An issue was discovered in GNOME gvfs 1.29.4 through 1.41.2.
daemon/gvfsbackendadmin.c mishandles a file's user and group ownership
during move (and copy with G_FILE_COPY_ALL_METADATA) operations from
admin:// to file:// URIs, because root privileges are unavailable.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fc42ac086a1a897be5ca997e416040560aa15cb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...correct-ownership-when-moving-to-file-uri.patch | 84 ++++++++++++++++++++++
 package/gvfs/gvfs.mk                               |  3 +
 2 files changed, 87 insertions(+)

diff --git a/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch b/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
new file mode 100644
index 0000000000..29f7573a65
--- /dev/null
+++ b/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
@@ -0,0 +1,84 @@
+From d5dfd823c94045488aef8727c553f1e0f7666b90 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Fri, 24 May 2019 09:43:43 +0200
+Subject: [PATCH] admin: Ensure correct ownership when moving to file:// uri
+
+User and group is not restored properly when moving (or copying with
+G_FILE_COPY_ALL_METADATA) from admin:// to file://, because it is handled
+by GIO fallback code, which doesn't run with root permissions. Let's
+handle this case with pull method to ensure correct ownership.
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/d5dfd823c94045488aef8727c553f1e0f7666b90]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/gvfsbackendadmin.c | 46 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+
+diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
+index 32b51b1a..9a7e8295 100644
+--- a/daemon/gvfsbackendadmin.c
++++ b/daemon/gvfsbackendadmin.c
+@@ -807,6 +807,51 @@ do_move (GVfsBackend *backend,
+   complete_job (job, error);
+ }
+ 
++static void
++do_pull (GVfsBackend *backend,
++         GVfsJobPull *pull_job,
++         const char *source,
++         const char *local_path,
++         GFileCopyFlags flags,
++         gboolean remove_source,
++         GFileProgressCallback progress_callback,
++         gpointer progress_callback_data)
++{
++  GVfsBackendAdmin *self = G_VFS_BACKEND_ADMIN (backend);
++  GVfsJob *job = G_VFS_JOB (pull_job);
++  GError *error = NULL;
++  GFile *src_file, *dst_file;
++
++  /* Pull method is necessary when user/group needs to be restored, return
++   * G_IO_ERROR_NOT_SUPPORTED in other cases to proceed with the fallback code.
++   */
++  if (!(flags & G_FILE_COPY_ALL_METADATA))
++    {
++      g_vfs_job_failed_literal (G_VFS_JOB (job), G_IO_ERROR,
++                                G_IO_ERROR_NOT_SUPPORTED,
++                                _("Operation not supported"));
++      return;
++    }
++
++  if (!check_permission (self, job))
++    return;
++
++  src_file = g_file_new_for_path (source);
++  dst_file = g_file_new_for_path (local_path);
++
++  if (remove_source)
++    g_file_move (src_file, dst_file, flags, job->cancellable,
++                 progress_callback, progress_callback_data, &error);
++  else
++    g_file_copy (src_file, dst_file, flags, job->cancellable,
++                 progress_callback, progress_callback_data, &error);
++
++  g_object_unref (src_file);
++  g_object_unref (dst_file);
++
++  complete_job (job, error);
++}
++
+ static void
+ do_query_settable_attributes (GVfsBackend *backend,
+                               GVfsJobQueryAttributes *query_job,
+@@ -927,6 +972,7 @@ g_vfs_backend_admin_class_init (GVfsBackendAdminClass * klass)
+   backend_class->set_attribute = do_set_attribute;
+   backend_class->delete = do_delete;
+   backend_class->move = do_move;
++  backend_class->pull = do_pull;
+   backend_class->query_settable_attributes = do_query_settable_attributes;
+   backend_class->query_writable_namespaces = do_query_writable_namespaces;
+ }
+-- 
+2.24.1
+
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index ec75852438..a3308b713d 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -25,6 +25,9 @@ GVFS_IGNORE_CVES += CVE-2019-12448
 # 0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
 GVFS_IGNORE_CVES += CVE-2019-12447
 
+# 0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
+GVFS_IGNORE_CVES += CVE-2019-12449
+
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
