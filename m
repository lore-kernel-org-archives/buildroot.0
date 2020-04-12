From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Apr 2020 14:57:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/gvfs: bump to version 1.44.1
Message-ID: <20200412125747.1073025-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove all patches (already in version)
- Move to meson-package
- Add new gsettings-desktop-schemas mandatory dependency
- gdu option doesn't exist anymore:
  https://gitlab.gnome.org/GNOME/gvfs/-/commit/1db029df72bcd50dd877d388c2e0934d8ed3d321
- Use new gcrypt otion
- systemd-login option has been replaced by logind option
- avahi option has been replaced by dnsd option
- gtk3 optional dependency has been removed since
  https://gitlab.gnome.org/GNOME/gvfs/-/commit/dff13283c943c8b10265bd3925d86f17cdc4be6f
- Disable new sftp backend:
  https://gitlab.gnome.org/GNOME/gvfs/-/commit/44d45dca5d1ab2369fa7e5c2789b31c51e44f985
- Disable fuse (depends on fuse3 which is not available on buildroot)
- Remove gvfs-less workaround (not installed anymore)
- Update indentation of hash file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...authentication-agent-isn-t-available.patch |  46 ------
 ...ery_info_on_read-write-functionality.patch | 131 ----------------
 ...0003-admin-Allow-changing-file-owner.patch |  34 -----
 ...uid-to-ensure-correct-file-ownership.patch |  91 -----------
 ...ct-ownership-when-moving-to-file-uri.patch |  84 ----------
 ...e-connecting-client-is-the-same-user.patch |  96 ------------
 package/gvfs/Config.in                        |   1 +
 package/gvfs/gvfs.hash                        |   6 +-
 package/gvfs/gvfs.mk                          | 143 +++++++-----------
 9 files changed, 59 insertions(+), 573 deletions(-)
 delete mode 100644 package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
 delete mode 100644 package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
 delete mode 100644 package/gvfs/0003-admin-Allow-changing-file-owner.patch
 delete mode 100644 package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
 delete mode 100644 package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
 delete mode 100644 package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch

diff --git a/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch b/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
deleted file mode 100644
index b5a6d024cc..0000000000
--- a/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From d8d0c8c40049cfd824b2b90d0cd47914052b9811 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Wed, 2 Jan 2019 17:13:27 +0100
-Subject: [PATCH] admin: Prevent access if any authentication agent isn't
- available
-
-The backend currently allows to access and modify files without prompting
-for password if any polkit authentication agent isn't available. This seems
-isn't usually problem, because polkit agents are integral parts of
-graphical environments / linux distributions. The agents can't be simply
-disabled without root permissions and are automatically respawned. However,
-this might be a problem in some non-standard cases.
-
-This affects only users which belong to wheel group (i.e. those who are
-already allowed to use sudo). It doesn't allow privilege escalation for
-users, who don't belong to that group.
-
-Let's return permission denied error also when the subject can't be
-authorized by any polkit agent to prevent this behavior.
-
-Closes: https://gitlab.gnome.org/GNOME/gvfs/issues/355
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gvfs/commit/d8d0c8c40049cfd824b2b90d0cd47914052b9811]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsbackendadmin.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
-index ec0f2392..0f849008 100644
---- a/daemon/gvfsbackendadmin.c
-+++ b/daemon/gvfsbackendadmin.c
-@@ -130,8 +130,7 @@ check_permission (GVfsBackendAdmin *self,
-       return FALSE;
-     }
- 
--  is_authorized = polkit_authorization_result_get_is_authorized (result) ||
--    polkit_authorization_result_get_is_challenge (result);
-+  is_authorized = polkit_authorization_result_get_is_authorized (result);
- 
-   g_object_unref (result);
- 
--- 
-2.24.1
-
diff --git a/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch b/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
deleted file mode 100644
index 42174153d2..0000000000
--- a/package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From 5cd76d627f4d1982b6e77a0e271ef9301732d09e Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Thu, 23 May 2019 10:24:36 +0200
-Subject: [PATCH] admin: Add query_info_on_read/write functionality
-
-Admin backend doesn't implement query_info_on_read/write which might
-potentially lead to some race conditions which aren't really wanted
-especially in case of admin backend. Let's add this missing functionality.
-
-[Retrieved fom:
-https://gitlab.gnome.org/GNOME/gvfs/commit/5cd76d627f4d1982b6e77a0e271ef9301732d09e]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsbackendadmin.c | 79 +++++++++++++++++++++++++++++++++------
- 1 file changed, 67 insertions(+), 12 deletions(-)
-
-diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
-index 65a979e7..23d16f16 100644
---- a/daemon/gvfsbackendadmin.c
-+++ b/daemon/gvfsbackendadmin.c
-@@ -42,6 +42,8 @@
- #include "gvfsjobopenforwrite.h"
- #include "gvfsjobqueryattributes.h"
- #include "gvfsjobqueryinfo.h"
-+#include "gvfsjobqueryinforead.h"
-+#include "gvfsjobqueryinfowrite.h"
- #include "gvfsjobread.h"
- #include "gvfsjobseekread.h"
- #include "gvfsjobseekwrite.h"
-@@ -155,6 +157,19 @@ complete_job (GVfsJob *job,
-   g_vfs_job_succeeded (job);
- }
- 
-+static void
-+fix_file_info (GFileInfo *info)
-+{
-+  /* Override read/write flags, since the above call will use access()
-+   * to determine permissions, which does not honor our privileged
-+   * capabilities.
-+   */
-+  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
-+  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
-+  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
-+  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
-+}
-+
- static void
- do_query_info (GVfsBackend *backend,
-                GVfsJobQueryInfo *query_info_job,
-@@ -180,19 +195,57 @@ do_query_info (GVfsBackend *backend,
-   if (error != NULL)
-     goto out;
- 
--  /* Override read/write flags, since the above call will use access()
--   * to determine permissions, which does not honor our privileged
--   * capabilities.
--   */
--  g_file_info_set_attribute_boolean (real_info,
--                                     G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
--  g_file_info_set_attribute_boolean (real_info,
--                                     G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
--  g_file_info_set_attribute_boolean (real_info,
--                                     G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
--  g_file_info_set_attribute_boolean (real_info,
--                                     G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
-+  fix_file_info (real_info);
-+  g_file_info_copy_into (real_info, info);
-+  g_object_unref (real_info);
-+
-+ out:
-+  complete_job (job, error);
-+}
-+
-+static void
-+do_query_info_on_read (GVfsBackend *backend,
-+                       GVfsJobQueryInfoRead *query_info_job,
-+                       GVfsBackendHandle handle,
-+                       GFileInfo *info,
-+                       GFileAttributeMatcher *matcher)
-+{
-+  GVfsJob *job = G_VFS_JOB (query_info_job);
-+  GFileInputStream *stream = handle;
-+  GError *error = NULL;
-+  GFileInfo *real_info;
-+
-+  real_info = g_file_input_stream_query_info (stream, query_info_job->attributes,
-+                                              job->cancellable, &error);
-+  if (error != NULL)
-+    goto out;
-+
-+  fix_file_info (real_info);
-+  g_file_info_copy_into (real_info, info);
-+  g_object_unref (real_info);
-+
-+ out:
-+  complete_job (job, error);
-+}
-+
-+static void
-+do_query_info_on_write (GVfsBackend *backend,
-+                        GVfsJobQueryInfoWrite *query_info_job,
-+                        GVfsBackendHandle handle,
-+                        GFileInfo *info,
-+                        GFileAttributeMatcher *matcher)
-+{
-+  GVfsJob *job = G_VFS_JOB (query_info_job);
-+  GFileOutputStream *stream = handle;
-+  GError *error = NULL;
-+  GFileInfo *real_info;
-+
-+  real_info = g_file_output_stream_query_info (stream, query_info_job->attributes,
-+                                               job->cancellable, &error);
-+  if (error != NULL)
-+    goto out;
- 
-+  fix_file_info (real_info);
-   g_file_info_copy_into (real_info, info);
-   g_object_unref (real_info);
- 
-@@ -868,6 +921,8 @@ g_vfs_backend_admin_class_init (GVfsBackendAdminClass * klass)
-   backend_class->mount = do_mount;
-   backend_class->open_for_read = do_open_for_read;
-   backend_class->query_info = do_query_info;
-+  backend_class->query_info_on_read = do_query_info_on_read;
-+  backend_class->query_info_on_write = do_query_info_on_write;
-   backend_class->read = do_read;
-   backend_class->create = do_create;
-   backend_class->append_to = do_append_to;
--- 
-2.24.1
-
diff --git a/package/gvfs/0003-admin-Allow-changing-file-owner.patch b/package/gvfs/0003-admin-Allow-changing-file-owner.patch
deleted file mode 100644
index 04138b3957..0000000000
--- a/package/gvfs/0003-admin-Allow-changing-file-owner.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From daf1163aba229afcfddf0f925aef7e97047e8959 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Thu, 23 May 2019 10:29:08 +0200
-Subject: [PATCH] admin: Allow changing file owner
-
-CAP_CHOWN is dropped together with other privilages and thus the backend
-can't change file owner. This might be probably e.g. in case of copy
-operation when G_FILE_COPY_ALL_METADATA is used. Let's keep CAP_CHOWN
-to fix this.
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gvfs/commit/daf1163aba229afcfddf0f925aef7e97047e8959]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsbackendadmin.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
-index 23d16f16..a74d09cf 100644
---- a/daemon/gvfsbackendadmin.c
-+++ b/daemon/gvfsbackendadmin.c
-@@ -968,7 +968,8 @@ g_vfs_backend_admin_init (GVfsBackendAdmin *self)
- 
- #define REQUIRED_CAPS (CAP_TO_MASK(CAP_FOWNER) | \
-                        CAP_TO_MASK(CAP_DAC_OVERRIDE) | \
--                       CAP_TO_MASK(CAP_DAC_READ_SEARCH))
-+                       CAP_TO_MASK(CAP_DAC_READ_SEARCH) | \
-+                       CAP_TO_MASK(CAP_CHOWN))
- 
- static void
- acquire_caps (uid_t uid)
--- 
-2.24.1
-
diff --git a/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch b/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
deleted file mode 100644
index 22fe57002f..0000000000
--- a/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 3895e09d784ebec0fbc4614d5c37068736120e1d Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Thu, 23 May 2019 10:33:30 +0200
-Subject: [PATCH] admin: Use fsuid to ensure correct file ownership
-
-Files created over admin backend should be owned by root, but they are
-owned by the user itself. This is because the daemon drops the uid to
-make dbus connection work. Use fsuid and euid to fix this issue.
-
-Closes: https://gitlab.gnome.org/GNOME/gvfs/issues/21
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gvfs/commit/3895e09d784ebec0fbc4614d5c37068736120e1d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsbackendadmin.c | 29 +++++++----------------------
- 1 file changed, 7 insertions(+), 22 deletions(-)
-
-diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
-index a74d09cf..32b51b1a 100644
---- a/daemon/gvfsbackendadmin.c
-+++ b/daemon/gvfsbackendadmin.c
-@@ -157,19 +157,6 @@ complete_job (GVfsJob *job,
-   g_vfs_job_succeeded (job);
- }
- 
--static void
--fix_file_info (GFileInfo *info)
--{
--  /* Override read/write flags, since the above call will use access()
--   * to determine permissions, which does not honor our privileged
--   * capabilities.
--   */
--  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
--  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
--  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
--  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
--}
--
- static void
- do_query_info (GVfsBackend *backend,
-                GVfsJobQueryInfo *query_info_job,
-@@ -195,7 +182,6 @@ do_query_info (GVfsBackend *backend,
-   if (error != NULL)
-     goto out;
- 
--  fix_file_info (real_info);
-   g_file_info_copy_into (real_info, info);
-   g_object_unref (real_info);
- 
-@@ -220,7 +206,6 @@ do_query_info_on_read (GVfsBackend *backend,
-   if (error != NULL)
-     goto out;
- 
--  fix_file_info (real_info);
-   g_file_info_copy_into (real_info, info);
-   g_object_unref (real_info);
- 
-@@ -245,7 +230,6 @@ do_query_info_on_write (GVfsBackend *backend,
-   if (error != NULL)
-     goto out;
- 
--  fix_file_info (real_info);
-   g_file_info_copy_into (real_info, info);
-   g_object_unref (real_info);
- 
-@@ -977,14 +961,15 @@ acquire_caps (uid_t uid)
-   struct __user_cap_header_struct hdr;
-   struct __user_cap_data_struct data;
- 
--  /* Tell kernel not clear capabilities when dropping root */
--  if (prctl (PR_SET_KEEPCAPS, 1, 0, 0, 0) < 0)
--    g_error ("prctl(PR_SET_KEEPCAPS) failed");
--
--  /* Drop root uid, but retain the required permitted caps */
--  if (setuid (uid) < 0)
-+  /* Set euid to user to make dbus work */
-+  if (seteuid (uid) < 0)
-     g_error ("unable to drop privs");
- 
-+  /* Set fsuid to still behave like root when working with files */
-+  setfsuid (0);
-+  if (setfsuid (-1) != 0)
-+   g_error ("setfsuid failed");
-+
-   memset (&hdr, 0, sizeof(hdr));
-   hdr.version = _LINUX_CAPABILITY_VERSION;
- 
--- 
-2.24.1
-
diff --git a/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch b/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
deleted file mode 100644
index 29f7573a65..0000000000
--- a/package/gvfs/0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From d5dfd823c94045488aef8727c553f1e0f7666b90 Mon Sep 17 00:00:00 2001
-From: Ondrej Holy <oholy@redhat.com>
-Date: Fri, 24 May 2019 09:43:43 +0200
-Subject: [PATCH] admin: Ensure correct ownership when moving to file:// uri
-
-User and group is not restored properly when moving (or copying with
-G_FILE_COPY_ALL_METADATA) from admin:// to file://, because it is handled
-by GIO fallback code, which doesn't run with root permissions. Let's
-handle this case with pull method to ensure correct ownership.
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gvfs/commit/d5dfd823c94045488aef8727c553f1e0f7666b90]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsbackendadmin.c | 46 +++++++++++++++++++++++++++++++++++++++
- 1 file changed, 46 insertions(+)
-
-diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
-index 32b51b1a..9a7e8295 100644
---- a/daemon/gvfsbackendadmin.c
-+++ b/daemon/gvfsbackendadmin.c
-@@ -807,6 +807,51 @@ do_move (GVfsBackend *backend,
-   complete_job (job, error);
- }
- 
-+static void
-+do_pull (GVfsBackend *backend,
-+         GVfsJobPull *pull_job,
-+         const char *source,
-+         const char *local_path,
-+         GFileCopyFlags flags,
-+         gboolean remove_source,
-+         GFileProgressCallback progress_callback,
-+         gpointer progress_callback_data)
-+{
-+  GVfsBackendAdmin *self = G_VFS_BACKEND_ADMIN (backend);
-+  GVfsJob *job = G_VFS_JOB (pull_job);
-+  GError *error = NULL;
-+  GFile *src_file, *dst_file;
-+
-+  /* Pull method is necessary when user/group needs to be restored, return
-+   * G_IO_ERROR_NOT_SUPPORTED in other cases to proceed with the fallback code.
-+   */
-+  if (!(flags & G_FILE_COPY_ALL_METADATA))
-+    {
-+      g_vfs_job_failed_literal (G_VFS_JOB (job), G_IO_ERROR,
-+                                G_IO_ERROR_NOT_SUPPORTED,
-+                                _("Operation not supported"));
-+      return;
-+    }
-+
-+  if (!check_permission (self, job))
-+    return;
-+
-+  src_file = g_file_new_for_path (source);
-+  dst_file = g_file_new_for_path (local_path);
-+
-+  if (remove_source)
-+    g_file_move (src_file, dst_file, flags, job->cancellable,
-+                 progress_callback, progress_callback_data, &error);
-+  else
-+    g_file_copy (src_file, dst_file, flags, job->cancellable,
-+                 progress_callback, progress_callback_data, &error);
-+
-+  g_object_unref (src_file);
-+  g_object_unref (dst_file);
-+
-+  complete_job (job, error);
-+}
-+
- static void
- do_query_settable_attributes (GVfsBackend *backend,
-                               GVfsJobQueryAttributes *query_job,
-@@ -927,6 +972,7 @@ g_vfs_backend_admin_class_init (GVfsBackendAdminClass * klass)
-   backend_class->set_attribute = do_set_attribute;
-   backend_class->delete = do_delete;
-   backend_class->move = do_move;
-+  backend_class->pull = do_pull;
-   backend_class->query_settable_attributes = do_query_settable_attributes;
-   backend_class->query_writable_namespaces = do_query_writable_namespaces;
- }
--- 
-2.24.1
-
diff --git a/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch b/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
deleted file mode 100644
index 56bef26b0f..0000000000
--- a/package/gvfs/0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 70dbfc68a79faac49bd3423e079cb6902522082a Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@collabora.com>
-Date: Wed, 5 Jun 2019 13:33:38 +0100
-Subject: [PATCH] gvfsdaemon: Check that the connecting client is the same user
-
-Otherwise, an attacker who learns the abstract socket address from
-netstat(8) or similar could connect to it and issue D-Bus method
-calls.
-
-Signed-off-by: Simon McVittie <smcv@collabora.com>
-
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/gvfs/commit/70dbfc68a79faac49bd3423e079cb6902522082a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- daemon/gvfsdaemon.c | 36 +++++++++++++++++++++++++++++++++++-
- 1 file changed, 35 insertions(+), 1 deletion(-)
-
-diff --git a/daemon/gvfsdaemon.c b/daemon/gvfsdaemon.c
-index 406d4f8e..be148a7b 100644
---- a/daemon/gvfsdaemon.c
-+++ b/daemon/gvfsdaemon.c
-@@ -79,6 +79,7 @@ struct _GVfsDaemon
-   
-   gint mount_counter;
-   
-+  GDBusAuthObserver *auth_observer;
-   GDBusConnection *conn;
-   GVfsDBusDaemon *daemon_skeleton;
-   GVfsDBusMountable *mountable_skeleton;
-@@ -171,6 +172,8 @@ g_vfs_daemon_finalize (GObject *object)
-     }
-   if (daemon->conn != NULL)
-     g_object_unref (daemon->conn);
-+  if (daemon->auth_observer != NULL)
-+    g_object_unref (daemon->auth_observer);
-   
-   g_hash_table_destroy (daemon->registered_paths);
-   g_hash_table_destroy (daemon->client_connections);
-@@ -236,6 +239,35 @@ name_vanished_handler (GDBusConnection *connection,
-   daemon->lost_main_daemon = TRUE;
- }
- 
-+/*
-+ * Authentication observer signal handler that authorizes connections
-+ * from the same uid as this process. This matches the behaviour of a
-+ * libdbus DBusServer/DBusConnection when no DBusAllowUnixUserFunction
-+ * has been set, but is not the default in GDBus.
-+ */
-+static gboolean
-+authorize_authenticated_peer_cb (GDBusAuthObserver *observer,
-+                                 G_GNUC_UNUSED GIOStream *stream,
-+                                 GCredentials *credentials,
-+                                 G_GNUC_UNUSED gpointer user_data)
-+{
-+  gboolean authorized = FALSE;
-+
-+  if (credentials != NULL)
-+    {
-+      GCredentials *own_credentials;
-+
-+      own_credentials = g_credentials_new ();
-+
-+      if (g_credentials_is_same_user (credentials, own_credentials, NULL))
-+        authorized = TRUE;
-+
-+      g_object_unref (own_credentials);
-+    }
-+
-+  return authorized;
-+}
-+
- static void
- g_vfs_daemon_init (GVfsDaemon *daemon)
- {
-@@ -265,6 +297,8 @@ g_vfs_daemon_init (GVfsDaemon *daemon)
- 
-   daemon->conn = g_bus_get_sync (G_BUS_TYPE_SESSION, NULL, NULL);
-   g_assert (daemon->conn != NULL);
-+  daemon->auth_observer = g_dbus_auth_observer_new ();
-+  g_signal_connect (daemon->auth_observer, "authorize-authenticated-peer", G_CALLBACK (authorize_authenticated_peer_cb), NULL);
- 
-   daemon->daemon_skeleton = gvfs_dbus_daemon_skeleton_new ();
-   g_signal_connect (daemon->daemon_skeleton, "handle-get-connection", G_CALLBACK (handle_get_connection), daemon);
-@@ -876,7 +910,7 @@ handle_get_connection (GVfsDBusDaemon *object,
-   server = g_dbus_server_new_sync (address1,
-                                    G_DBUS_SERVER_FLAGS_NONE,
-                                    guid,
--                                   NULL, /* GDBusAuthObserver */
-+                                   daemon->auth_observer,
-                                    NULL, /* GCancellable */
-                                    &error);
-   g_free (guid);
--- 
-2.24.1
-
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 44a75210e5..78280f80e0 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GVFS
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_USE_MMU # dbus, glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, glib2
+	select BR2_PACKAGE_GSETTINGS_DESKTOP_SCHEMAS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_SHARED_MIME_INFO
diff --git a/package/gvfs/gvfs.hash b/package/gvfs/gvfs.hash
index 6b7403ffa4..2ee945e710 100644
--- a/package/gvfs/gvfs.hash
+++ b/package/gvfs/gvfs.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.31/gvfs-1.31.4.sha256sum
-sha256	55244d447d040884dfb335fde638274cb6f2794285ada7fa84bcbbd34f06be04	gvfs-1.31.4.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/gvfs/1.44/gvfs-1.44.1.sha256sum
+sha256  50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46  gvfs-1.44.1.tar.xz
 
 # Hash for license file
-sha256	45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4	COPYING
+sha256  45cf336e2e48176993babc5aabf44437390f40e6a86a472c6abfc7ce9c035db4  COPYING
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b3b18a3482..d3c052587e 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -4,60 +4,46 @@
 #
 ################################################################################
 
-GVFS_VERSION_MAJOR = 1.31
-GVFS_VERSION = $(GVFS_VERSION_MAJOR).4
+GVFS_VERSION_MAJOR = 1.44
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).1
 GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.xz
 GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
 GVFS_INSTALL_STAGING = YES
-GVFS_DEPENDENCIES = host-pkgconf host-libglib2 libglib2 dbus shared-mime-info \
+GVFS_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2 \
+	dbus \
+	gsettings-desktop-schemas \
+	libglib2 \
+	shared-mime-info \
 	$(TARGET_NLS_DEPENDENCIES)
 GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
-GVFS_LIBS = $(TARGET_NLS_LIBS)
 
-# 0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
-GVFS_IGNORE_CVES += CVE-2019-3827
-
-# package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
-GVFS_IGNORE_CVES += CVE-2019-12448
-
-# 0003-admin-Allow-changing-file-owner.patch
-# 0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
-GVFS_IGNORE_CVES += CVE-2019-12447
-
-# 0005-admin-Ensure-correct-ownership-when-moving-to-file-uri.patch
-GVFS_IGNORE_CVES += CVE-2019-12449
-
-# 0006-gvfsdaemon-Check-that-the-connecting-client-is-the-same-user.patch
-GVFS_IGNORE_CVES += CVE-2019-12795
-
-# Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
-# build system from searching the host paths.
-GVFS_CONF_ENV = \
-	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
-	LIBS="$(GVFS_LIBS)"
+GVFS_CONF_ENV = LIBS="$(TARGET_NLS_LIBS)"
 
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
-	--disable-afc \
-	--disable-gdu \
-	--disable-goa \
-	--disable-google \
-	--disable-libmtp \
-	--disable-udisks2
+	-Dafc=false \
+	-Dfuse=false \
+	-Dgoa=false \
+	-Dgoogle=false \
+	-Dmtp=false \
+	-Dsftp=false \
+	-Dudisks2=false
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
-GVFS_CONF_OPTS += --enable-avahi
+GVFS_CONF_OPTS += -Ddnssd=true
 else
-GVFS_CONF_OPTS += --disable-avahi
+GVFS_CONF_OPTS += -Ddnssd=false
 endif
 
 ifeq ($(BR2_PACKAGE_GCR),y)
 GVFS_DEPENDENCIES += gcr
-GVFS_CONF_OPTS += --enable-gcr
+GVFS_CONF_OPTS += -Dgcr=true
 else
-GVFS_CONF_OPTS += --disable-gcr
+GVFS_CONF_OPTS += -Dgcr=false
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
@@ -66,121 +52,103 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
 GVFS_DEPENDENCIES += libgudev
-GVFS_CONF_OPTS  += --enable-gudev
+GVFS_CONF_OPTS += -Dgudev=true
 else
-GVFS_CONF_OPTS += --disable-gudev
+GVFS_CONF_OPTS += -Dgudev=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
 GVFS_DEPENDENCIES += libarchive
-GVFS_CONF_OPTS += \
-	--enable-archive \
-	--with-archive-includes=$(STAGING_DIR)/usr \
-	--with-archive-libs=$(STAGING_DIR)/usr
-GVFS_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs libarchive`
+GVFS_CONF_OPTS += -Darchive=true
 else
-GVFS_CONF_OPTS += --disable-archive
+GVFS_CONF_OPTS += -Darchive=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
 GVFS_DEPENDENCIES += libbluray
-GVFS_CONF_OPTS += --enable-bluray
+GVFS_CONF_OPTS += -Dbluray=true
 else
-GVFS_CONF_OPTS += --disable-bluray
+GVFS_CONF_OPTS += -Dbluray=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP)$(BR2_PACKAGE_POLKIT),yy)
 GVFS_DEPENDENCIES += libcap polkit
-GVFS_CONF_OPTS += --enable-admin
+GVFS_CONF_OPTS += -Dadmin=true
 else
-GVFS_CONF_OPTS += --disable-admin
+GVFS_CONF_OPTS += -Dadmin=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA)$(BR2_PACKAGE_LIBGUDEV),yy)
 GVFS_DEPENDENCIES += libcdio-paranoia libgudev
-GVFS_CONF_OPTS += --enable-cdda
-else
-GVFS_CONF_OPTS += --disable-cdda
-endif
-
-ifeq ($(BR2_PACKAGE_LIBFUSE),y)
-GVFS_DEPENDENCIES += libfuse
-GVFS_CONF_OPTS += --enable-fuse
+GVFS_CONF_OPTS += -Dcdda=true
 else
-GVFS_CONF_OPTS += --disable-fuse
+GVFS_CONF_OPTS += -Dcdda=false
 endif
 
 # AFP support is anon-only without libgcrypt which isn't very useful
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-GVFS_CONF_OPTS += --enable-afp
+GVFS_CONF_OPTS += \
+	-Dafp=true \
+	-Dgcrypt=true
 GVFS_DEPENDENCIES += libgcrypt
 else
-GVFS_CONF_OPTS += --disable-afp
+GVFS_CONF_OPTS += \
+	-Dafp=false \
+	-Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGPHOTO2)$(BR2_PACKAGE_LIBGUDEV),yy)
 GVFS_DEPENDENCIES += libgphoto2 libgudev
-GVFS_CONF_OPTS += --enable-gphoto2
-else
-GVFS_CONF_OPTS += --disable-gphoto2
-endif
-
-ifeq ($(BR2_PACKAGE_LIBGTK3),y)
-GVFS_CONF_OPTS += --enable-gtk
-GVFS_DEPENDENCIES += libgtk3
+GVFS_CONF_OPTS += -Dgphoto2=true
 else
-GVFS_CONF_OPTS += --disable-gtk
+GVFS_CONF_OPTS += -Dgphoto2=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFS),y)
-GVFS_CONF_OPTS += --enable-nfs
+GVFS_CONF_OPTS += -Dnfs=true
 GVFS_DEPENDENCIES += libnfs
 else
-GVFS_CONF_OPTS += --disable-nfs
+GVFS_CONF_OPTS += -Dnfs=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSECRET),y)
 GVFS_DEPENDENCIES += libsecret
-GVFS_CONF_OPTS += --enable-keyring
+GVFS_CONF_OPTS += -Dkeyring=true
 else
-GVFS_CONF_OPTS += --disable-keyring
+GVFS_CONF_OPTS += -Dkeyring=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
 GVFS_DEPENDENCIES += libsoup libxml2
-GVFS_CONF_OPTS += --enable-http
+GVFS_CONF_OPTS += -Dhttp=true
 else
-GVFS_CONF_OPTS += --disable-http
+GVFS_CONF_OPTS += -Dhttp=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 GVFS_DEPENDENCIES += libusb
-GVFS_CONF_OPTS += --enable-libusb
+GVFS_CONF_OPTS += -Dlibusb=true
 else
-GVFS_CONF_OPTS += --disable-libusb
+GVFS_CONF_OPTS += -Dlibusb=false
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA4),y)
 GVFS_DEPENDENCIES += samba4
-GVFS_CONF_OPTS += \
-	--enable-samba \
-	--with-samba-includes=$(STAGING_DIR)/usr/include/samba-4.0 \
-	--with-samba-libs=$(STAGING_DIR)/usr/lib \
-	ac_cv_lib_smbclient_smbc_option_get=yes
+GVFS_CONF_OPTS += -Dsmb=true
 else
-GVFS_CONF_OPTS += --disable-samba
+GVFS_CONF_OPTS += -Dsmb=false
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 GVFS_DEPENDENCIES += systemd
+GVFS_CONF_OPTS += -Dlogind=true
 else
-GVFS_CONF_OPTS += --disable-libsystemd-login
+GVFS_CONF_OPTS += \
+	-Dlogind=false \
+	-Dsystemduserunitdir=no \
+	-Dtmpfilesdir=no
 endif
 
-define GVFS_REMOVE_USELESS_BINARY
-	rm $(TARGET_DIR)/usr/bin/gvfs-less
-endef
-
 define GVFS_REMOVE_TARGET_SCHEMAS
 	rm $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml
 endef
@@ -190,8 +158,7 @@ define GVFS_COMPILE_SCHEMAS
 endef
 
 GVFS_POST_INSTALL_TARGET_HOOKS += \
-	GVFS_REMOVE_USELESS_BINARY \
 	GVFS_REMOVE_TARGET_SCHEMAS \
 	GVFS_COMPILE_SCHEMAS
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.25.1
