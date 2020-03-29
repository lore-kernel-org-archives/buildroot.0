From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Mar 2020 18:02:44 +0200
Subject: [Buildroot] [PATCH 3/5] package/gvfs: fix CVE-2019-12447
In-Reply-To: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
References: <20200329160246.4053834-1-fontaine.fabrice@gmail.com>
Message-ID: <20200329160246.4053834-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An issue was discovered in GNOME gvfs 1.29.4 through 1.41.2.
daemon/gvfsbackendadmin.c mishandles file ownership because setfsuid is
not used.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0003-admin-Allow-changing-file-owner.patch | 34 +++++++
 ...uid-to-ensure-correct-file-ownership.patch | 91 +++++++++++++++++++
 package/gvfs/gvfs.mk                          |  4 +
 3 files changed, 129 insertions(+)
 create mode 100644 package/gvfs/0003-admin-Allow-changing-file-owner.patch
 create mode 100644 package/gvfs/0004-admin-Use-fsuid-to-ensure-correct-file-ownership.patch

diff --git a/package/gvfs/0003-admin-Allow-changing-file-owner.patch b/package/gvfs/0003-admin-Allow-changing-file-owner.patch
new file mode 100644
index 0000000000..6465693283
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
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/daf1163aba229afcfddf0f925aef7e97047e8959]
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
index 0000000000..a4343ee897
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
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/3895e09d784ebec0fbc4614d5c37068736120e1d]
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
-- 
2.25.1
