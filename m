From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:08:55 +0200
Subject: [Buildroot] [git commit] package/sysrepo: bump to version 1.4.2
Message-ID: <20200415205446.82AF78EDB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ea2ca8d8be05f80c8955b3af60bb65711b36b0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Align hashes to the new spacing convention
- Drop patches upstreamed applied

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gind-CHANGE-create-plugins-dir-if-it-does.patch | 41 --------------
 ...gind-BUGFIX-create-plugins-dir-recursivel.patch | 65 ----------------------
 package/sysrepo/sysrepo.hash                       |  5 +-
 package/sysrepo/sysrepo.mk                         |  2 +-
 4 files changed, 4 insertions(+), 109 deletions(-)

diff --git a/package/sysrepo/0001-sysrepo-plugind-CHANGE-create-plugins-dir-if-it-does.patch b/package/sysrepo/0001-sysrepo-plugind-CHANGE-create-plugins-dir-if-it-does.patch
deleted file mode 100644
index 31d27f508d..0000000000
--- a/package/sysrepo/0001-sysrepo-plugind-CHANGE-create-plugins-dir-if-it-does.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 28c27e2001b709a9cae1db0aba2185ec86ba0454 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Thu, 19 Dec 2019 14:01:00 +0100
-Subject: [PATCH 1/9] sysrepo-plugind CHANGE create plugins dir if it does not
- exist
-
-Fixes #1719
-
-[Patch from https://github.com/sysrepo/sysrepo/commit/28c27e2001b709a9cae1db0aba2185ec86ba0454]
-
-Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
----
- src/executables/sysrepo-plugind.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/executables/sysrepo-plugind.c b/src/executables/sysrepo-plugind.c
-index 6b11bad6..ddb41c26 100644
---- a/src/executables/sysrepo-plugind.c
-+++ b/src/executables/sysrepo-plugind.c
-@@ -225,6 +225,18 @@ load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
-         plugins_dir = SRPD_PLUGINS_PATH;
-     }
- 
-+    /* create the directory if it does not exist */
-+    if (access(plugins_dir, F_OK) == -1) {
-+        if (errno != ENOENT) {
-+            error_print(0, "Checking plugins dir existence failed (%s).", strerror(errno));
-+            return -1;
-+        }
-+        if (mkdir(plugins_dir, 00777) == -1) {
-+            error_print(0, "Creating plugins dir \"%s\" failed (%s).", plugins_dir, strerror(errno));
-+            return -1;
-+        }
-+    }
-+
-     dir = opendir(plugins_dir);
-     if (!dir) {
-         error_print(0, "Opening \"%s\" directory failed (%s).", plugins_dir, strerror(errno));
--- 
-2.20.1
-
diff --git a/package/sysrepo/0002-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch b/package/sysrepo/0002-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
deleted file mode 100644
index 9b9734f22c..0000000000
--- a/package/sysrepo/0002-sysrpeo-plugind-BUGFIX-create-plugins-dir-recursivel.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 353faffe13852c4204f158b5d4301405bd222c44 Mon Sep 17 00:00:00 2001
-From: Michal Vasko <mvasko@cesnet.cz>
-Date: Fri, 20 Dec 2019 13:40:35 +0100
-Subject: [PATCH 9/9] sysrpeo-plugind BUGFIX create plugins dir recursively
-
-Refs #1719
-
-[Patch from https://github.com/sysrepo/sysrepo/commit/353faffe13852c4204f158b5d4301405bd222c44]
-
-Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
----
- src/executables/sysrepo-plugind.c | 30 +++++++++++++++++++++++++++++-
- 1 file changed, 29 insertions(+), 1 deletion(-)
-
-diff --git a/src/executables/sysrepo-plugind.c b/src/executables/sysrepo-plugind.c
-index ddb41c26..ca22140e 100644
---- a/src/executables/sysrepo-plugind.c
-+++ b/src/executables/sysrepo-plugind.c
-@@ -206,6 +206,34 @@ daemon_init(int debug, sr_log_level_t log_level)
-     sr_log_syslog("sysrepo-plugind", log_level);
- }
- 
-+/* from src/common.c */
-+int
-+sr_mkpath(const char *path, mode_t mode)
-+{
-+    char *p, *dup;
-+
-+    dup = strdup(path);
-+    for (p = strchr(dup + 1, '/'); p; p = strchr(p + 1, '/')) {
-+        *p = '\0';
-+        if (mkdir(dup, mode) == -1) {
-+            if (errno != EEXIST) {
-+                *p = '/';
-+                return -1;
-+            }
-+        }
-+        *p = '/';
-+    }
-+    free(dup);
-+
-+    if (mkdir(path, mode) == -1) {
-+        if (errno != EEXIST) {
-+            return -1;
-+        }
-+    }
-+
-+    return 0;
-+}
-+
- static int
- load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
- {
-@@ -231,7 +259,7 @@ load_plugins(struct srpd_plugin_s **plugins, int *plugin_count)
-             error_print(0, "Checking plugins dir existence failed (%s).", strerror(errno));
-             return -1;
-         }
--        if (mkdir(plugins_dir, 00777) == -1) {
-+        if (sr_mkpath(plugins_dir, 00777) == -1) {
-             error_print(0, "Creating plugins dir \"%s\" failed (%s).", plugins_dir, strerror(errno));
-             return -1;
-         }
--- 
-2.20.1
-
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
index ff2e1166b2..a759821614 100644
--- a/package/sysrepo/sysrepo.hash
+++ b/package/sysrepo/sysrepo.hash
@@ -1,2 +1,3 @@
-sha256 be405a33b1713d1114f3c092a6349b25a2de2a0f43a15dc6984c029f70230b3b  sysrepo-1.3.21.tar.gz
-sha256 b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+# Locally calculated
+sha256  d84d4f092feab83b0a39fef5d0d62bc6ed1f0f8aa274329f2cbf0a95a6528d8a  sysrepo-1.4.2.tar.gz
+sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 5f87ac38a3..0ca4d2591e 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSREPO_VERSION = 1.3.21
+SYSREPO_VERSION = 1.4.2
 SYSREPO_SITE = $(call github,sysrepo,sysrepo,v$(SYSREPO_VERSION))
 SYSREPO_INSTALL_STAGING = YES
 SYSREPO_LICENSE = Apache-2.0
