From: =?UTF-8?q?Beno=C3=AEt=20Mauduit?= <benoit.mauduit@gmail.com>
Date: Tue, 28 Jun 2011 15:51:35 +0200
Subject: [Buildroot] [PATCH] [package/config] Change behaviour of symlink
	.config
In-Reply-To: <1309269095-22620-1-git-send-email-benoit.mauduit@gmail.com>
References: <1309269095-22620-1-git-send-email-benoit.mauduit@gmail.com>
Message-ID: <1309269095-22620-2-git-send-email-benoit.mauduit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Benoit Mauduit <benoit.mauduit@openwide.fr>

If .config is a symlink, the target will be modified and the old
.config is saved to .config.old.
---
 package/config/confdata.c                          |   15 +++++++-
 .../13-Change-behaviour-of-symlink-config.patch    |   40 ++++++++++++++++++++
 package/config/patches/series                      |    1 +
 3 files changed, 55 insertions(+), 1 deletions(-)
 create mode 100644 package/config/patches/13-Change-behaviour-of-symlink-config.patch

diff --git a/package/config/confdata.c b/package/config/confdata.c
index c9f13ee..c00639f 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -588,7 +588,20 @@ int conf_write(const char *name)
 	} else
 		basename = conf_get_configname();
 
-	sprintf(newname, "%s%s", dirname, basename);
+	sprintf(tmpname, "%s%s", dirname, basename);
+
+	realpath(tmpname, newname);
+
+	if (strcmp(tmpname, newname)) {
+		printf(_("#\n"
+		         "# Warning: Symbolic link detected,"
+		         " the target will be overwritten\n"
+		         "#\n")
+		       );
+
+		tmpname[0] = '\0';
+	}
+
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (!env || !*env) {
 		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
diff --git a/package/config/patches/13-Change-behaviour-of-symlink-config.patch b/package/config/patches/13-Change-behaviour-of-symlink-config.patch
new file mode 100644
index 0000000..e4e7be4
--- /dev/null
+++ b/package/config/patches/13-Change-behaviour-of-symlink-config.patch
@@ -0,0 +1,40 @@
+From 3c8ff86dbe779f00eaa5692ef61cabef4466e5d6 Mon Sep 17 00:00:00 2001
+From: Benoit Mauduit <benoit.mauduit@openwide.fr>
+Date: Thu, 3 Mar 2011 16:20:27 +0100
+Subject: [PATCH] [package/config] Change behaviour of symlink .config
+
+If .config is a symlink, the target will be modified and the old
+.config is saved to .config.old.
+---
+ package/config/confdata.c |   15 ++++++++++++++-
+ 1 files changed, 14 insertions(+), 1 deletions(-)
+
+diff --git a/package/config/confdata.c b/package/config/confdata.c
+index c9f13ee..c00639f 100644
+--- a/confdata.c
++++ b/confdata.c
+@@ -588,7 +588,20 @@ int conf_write(const char *name)
+ 	} else
+ 		basename = conf_get_configname();
+ 
+-	sprintf(newname, "%s%s", dirname, basename);
++	sprintf(tmpname, "%s%s", dirname, basename);
++
++	realpath(tmpname, newname);
++
++	if (strcmp(tmpname, newname)) {
++		printf(_("#\n"
++		         "# Warning: Symbolic link detected,"
++		         " the target will be overwritten\n"
++		         "#\n")
++		       );
++
++		tmpname[0] = '\0';
++	}
++
+ 	env = getenv("KCONFIG_OVERWRITECONFIG");
+ 	if (!env || !*env) {
+ 		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
+-- 
+1.7.5.2
+
diff --git a/package/config/patches/series b/package/config/patches/series
index defdf58..b5455fd 100644
--- a/package/config/patches/series
+++ b/package/config/patches/series
@@ -8,4 +8,5 @@
 10-br-build-system.patch
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
+13-Change-behaviour-of-symlink-config.patch
 14-support-out-of-tree-config.patch
-- 
1.7.5.2
