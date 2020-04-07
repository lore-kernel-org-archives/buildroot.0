From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 21:05:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/gvfs: fix
 CVE-2019-3827
Message-ID: <20200407185302.70E598D71F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c193316caf490f5c0b79176fbc6383614512150
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

An incorrect permission check in the admin backend in gvfs before
version 1.39.4 was found that allows reading and modify arbitrary files
by privileged users without asking for password when no authentication
agent is running. This vulnerability can be exploited by malicious
programs running under privileges of users belonging to the wheel group
to further escalate its privileges by modifying system files without
user's knowledge. Successful exploitation requires uncommon system
configuration.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 346040e269162cebfb5f127c3e6baaa128880f6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-any-authentication-agent-isn-t-available.patch | 46 ++++++++++++++++++++++
 package/gvfs/gvfs.mk                               |  3 ++
 2 files changed, 49 insertions(+)

diff --git a/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch b/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
new file mode 100644
index 0000000000..b5a6d024cc
--- /dev/null
+++ b/package/gvfs/0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
@@ -0,0 +1,46 @@
+From d8d0c8c40049cfd824b2b90d0cd47914052b9811 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Wed, 2 Jan 2019 17:13:27 +0100
+Subject: [PATCH] admin: Prevent access if any authentication agent isn't
+ available
+
+The backend currently allows to access and modify files without prompting
+for password if any polkit authentication agent isn't available. This seems
+isn't usually problem, because polkit agents are integral parts of
+graphical environments / linux distributions. The agents can't be simply
+disabled without root permissions and are automatically respawned. However,
+this might be a problem in some non-standard cases.
+
+This affects only users which belong to wheel group (i.e. those who are
+already allowed to use sudo). It doesn't allow privilege escalation for
+users, who don't belong to that group.
+
+Let's return permission denied error also when the subject can't be
+authorized by any polkit agent to prevent this behavior.
+
+Closes: https://gitlab.gnome.org/GNOME/gvfs/issues/355
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/gvfs/commit/d8d0c8c40049cfd824b2b90d0cd47914052b9811]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ daemon/gvfsbackendadmin.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/daemon/gvfsbackendadmin.c b/daemon/gvfsbackendadmin.c
+index ec0f2392..0f849008 100644
+--- a/daemon/gvfsbackendadmin.c
++++ b/daemon/gvfsbackendadmin.c
+@@ -130,8 +130,7 @@ check_permission (GVfsBackendAdmin *self,
+       return FALSE;
+     }
+ 
+-  is_authorized = polkit_authorization_result_get_is_authorized (result) ||
+-    polkit_authorization_result_get_is_challenge (result);
++  is_authorized = polkit_authorization_result_get_is_authorized (result);
+ 
+   g_object_unref (result);
+ 
+-- 
+2.24.1
+
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index c380a710fb..6c927fa345 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -15,6 +15,9 @@ GVFS_LICENSE = LGPL-2.0+
 GVFS_LICENSE_FILES = COPYING
 GVFS_LIBS = $(TARGET_NLS_LIBS)
 
+# 0001-admin-Prevent-access-if-any-authentication-agent-isn-t-available.patch
+GVFS_IGNORE_CVES += CVE-2019-3827
+
 # Export ac_cv_path_LIBGCRYPT_CONFIG unconditionally to prevent
 # build system from searching the host paths.
 GVFS_CONF_ENV = \
