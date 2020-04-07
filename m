From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 21:05:08 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/gvfs: fix
 CVE-2019-12447
Message-ID: <20200407185316.D609F8D783@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48d8166c71ca326b931afa86180f1df103c5eff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

An issue was discovered in GNOME gvfs 1.29.4 through 1.41.2.
daemon/gvfsbackendadmin.c mishandles file ownership because setfsuid is
not used.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 062d0f6913ed6e787123b32d0d8ffe9703efe3ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-admin-Allow-changing-file-owner.patch     | 34 ++++++++
 ...se-fsuid-to-ensure-correct-file-ownership.patch | 91 ++++++++++++++++++++++
 package/gvfs/gvfs.mk                               |  4 +
 3 files changed, 129 insertions(+)

diff --git a/package/gvfs/0003-admin-Allow-changing-file-owner.patch b/package/gvfs/0003-admin-Allow-changing-file-owner.patch
new file mode 100644
index 0000000000..04138b3957
--- /dev/null
+++ b/package/gvfs/0003-admin-Allow-changing-file-owner.patch
@@ -0,0 +1,34 @@
+From daf1163aba229afcfddf0f925aef7e97047e8959 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:29:08 +0200
+Subject: [PATCH] admin: Allow changing file owner
+
+CAP_CHOWN is dropped together with other privilages and thus the backend
+can't change file owner. This might be probably e.g. in case of copy
+operation when G_FILE_COPY_ALL_METADATA is used. Let's keep CAP_CHOWN
+to fix this.
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/daf1163aba229afcfddf0f925aef7e97047e8959]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/gvfsbackendadmin.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
+index 23d16f16..a74d09cf 100644
+--- a/daemon/gvfsbackendadmin.c
++++ b/daemon/gvfsbackendadmin.c
+@@ -968,7 +968,8 @@ g_vfs_backend_admin_init (GVfsBackendAdmin *self)
+ 
+ #define REQUIRED_CAPS (CAP_TO_MASK(CAP_FOWNER) | \
+                        CAP_TO_MASK(CAP_DAC_OVERRIDE) | \
+-                       CAP_TO_MASK(CAP_DAC_READ_SEARCH))
++                       CAP_TO_MASK(CAP_DAC_READ_SEARCH) | \
++                       CAP_TO_MASK(CAP_CHOWN))
+ 
+ static void
+ acquire_caps (uid_t uid)
+-- 
+2.24.1
+
diff --git a/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch b/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
new file mode 100644
index 0000000000..22fe57002f
--- /dev/null
+++ b/package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
@@ -0,0 +1,91 @@
+From 3895e09d784ebec0fbc4614d5c37068736120e1d Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Thu, 23 May 2019 10:33:30 +0200
+Subject: [PATCH] admin: Use fsuid to ensure correct file ownership
+
+Files created over admin backend should be owned by root, but they are
+owned by the user itself. This is because the daemon drops the uid to
+make dbus connection work. Use fsuid and euid to fix this issue.
+
+Closes: https://gitlab.gnome.org/GNOME/gvfs/issues/21
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/3895e09d784ebec0fbc4614d5c37068736120e1d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/gvfsbackendadmin.c | 29 +++++++----------------------
+ 1 file changed, 7 insertions(+), 22 deletions(-)
+
+diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
+index a74d09cf..32b51b1a 100644
+--- a/daemon/gvfsbackendadmin.c
++++ b/daemon/gvfsbackendadmin.c
+@@ -157,19 +157,6 @@ complete_job (GVfsJob *job,
+   g_vfs_job_succeeded (job);
+ }
+ 
+-static void
+-fix_file_info (GFileInfo *info)
+-{
+-  /* Override read/write flags, since the above call will use access()
+-   * to determine permissions, which does not honor our privileged
+-   * capabilities.
+-   */
+-  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_READ, TRUE);
+-  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_WRITE, TRUE);
+-  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_DELETE, TRUE);
+-  g_file_info_set_attribute_boolean (info, G_FILE_ATTRIBUTE_ACCESS_CAN_RENAME, TRUE);
+-}
+-
+ static void
+ do_query_info (GVfsBackend *backend,
+                GVfsJobQueryInfo *query_info_job,
+@@ -195,7 +182,6 @@ do_query_info (GVfsBackend *backend,
+   if (error != NULL)
+     goto out;
+ 
+-  fix_file_info (real_info);
+   g_file_info_copy_into (real_info, info);
+   g_object_unref (real_info);
+ 
+@@ -220,7 +206,6 @@ do_query_info_on_read (GVfsBackend *backend,
+   if (error != NULL)
+     goto out;
+ 
+-  fix_file_info (real_info);
+   g_file_info_copy_into (real_info, info);
+   g_object_unref (real_info);
+ 
+@@ -245,7 +230,6 @@ do_query_info_on_write (GVfsBackend *backend,
+   if (error != NULL)
+     goto out;
+ 
+-  fix_file_info (real_info);
+   g_file_info_copy_into (real_info, info);
+   g_object_unref (real_info);
+ 
+@@ -977,14 +961,15 @@ acquire_caps (uid_t uid)
+   struct __user_cap_header_struct hdr;
+   struct __user_cap_data_struct data;
+ 
+-  /* Tell kernel not clear capabilities when dropping root */
+-  if (prctl (PR_SET_KEEPCAPS, 1, 0, 0, 0) < 0)
+-    g_error ("prctl(PR_SET_KEEPCAPS) failed");
+-
+-  /* Drop root uid, but retain the required permitted caps */
+-  if (setuid (uid) < 0)
++  /* Set euid to user to make dbus work */
++  if (seteuid (uid) < 0)
+     g_error ("unable to drop privs");
+ 
++  /* Set fsuid to still behave like root when working with files */
++  setfsuid (0);
++  if (setfsuid (-1) != 0)
++   g_error ("setfsuid failed");
++
+   memset (&hdr, 0, sizeof(hdr));
+   hdr.version = _LINUX_CAPABILITY_VERSION;
+ 
+-- 
+2.24.1
+
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index eb31f6f8df..ec75852438 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -21,6 +21,10 @@ GVFS_IGNORE_CVES += CVE-2019-3827
 # package/gvfs/0002-admin-Add-query_info_on_read-write-functionality.patch
 GVFS_IGNORE_CVES += CVE-2019-12448
 
+# 0003-admin-Allow-changing-file-owner.patch
+# 0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch
+GVFS_IGNORE_CVES += CVE-2019-12447
+
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
