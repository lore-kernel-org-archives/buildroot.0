From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 19:52:13 +0100
Subject: [Buildroot] [git commit master 1/1] config: fix crash with too long
	paths
Message-ID: <20101107185443.593C68DC04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=937367785a568d1b683b1e31b8ad9bdbe0cb607b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2737

Use PATH_MAX rather that 128 for path buffers. Patch from kernel 1408b15b98
(kconfig: Use PATH_MAX instead of 128 for path buffer sizes) by Will Newton.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 package/config/confdata.c                          |    4 +-
 .../patches/15-use-PATH_MAX-for-path-buffer.patch  |   41 ++++++++++++++++++++
 package/config/patches/series                      |    1 +
 4 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 package/config/patches/15-use-PATH_MAX-for-path-buffer.patch

diff --git a/CHANGES b/CHANGES
index 88e061c..3c7b326 100644
--- a/CHANGES
+++ b/CHANGES
@@ -78,6 +78,7 @@
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 	#2707: Can't compile linux kernel using buildroot + crosstool-ng
 	#2731: Build order
+	#2737: buildroot configuration tool crashing when the path exceeds...
 	#2767: Build for lsof broken in buildroot-2010.08
 
 2010.08: Released August 31th, 2010:
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 5cfb6d2..1b1fdb7 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -534,7 +534,7 @@ int conf_write(const char *name)
 	struct menu *menu;
 	const char *basename;
 	const char *str;
-	char dirname[128], tmpname[128], newname[128];
+	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
 	enum symbol_type type;
 	time_t now;
 	int use_timestamp = 1;
@@ -658,7 +658,7 @@ next:
 static int conf_split_config(void)
 {
 	const char *name;
-	char path[128];
+	char path[PATH_MAX+1];
 	char *opwd, *dir, *_name;
 	char *s, *d, c;
 	struct symbol *sym;
diff --git a/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
new file mode 100644
index 0000000..4be6cb6
--- /dev/null
+++ b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
@@ -0,0 +1,41 @@
+From 1408b15b98635a13bad2e2a50b3c2ae2ccdf625b Mon Sep 17 00:00:00 2001
+From: Will Newton <will.newton@gmail.com>
+Date: Wed, 22 Sep 2010 15:59:13 +0100
+Subject: [PATCH] kconfig: Use PATH_MAX instead of 128 for path buffer sizes.
+
+This prevents the buffers being overflowed when using a config
+file with a long name. PATH_MAX is used elsewhere in the same
+file, so use it here as well.
+
+Signed-off-by: Will Newton <will.newton@imgtec.com>
+Acked-by: WANG Cong <xiyou.wangcong@gmail.com>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+---
+ scripts/kconfig/confdata.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/confdata.c b/confdata.c
+index 35c08ec..96110ea 100644
+--- a/confdata.c
++++ b/confdata.c
+@@ -534,7 +534,7 @@ int conf_write(const char *name)
+ 	struct menu *menu;
+ 	const char *basename;
+ 	const char *str;
+-	char dirname[128], tmpname[128], newname[128];
++	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
+ 	enum symbol_type type;
+ 	time_t now;
+ 	int use_timestamp = 1;
+@@ -658,7 +658,7 @@ next:
+ static int conf_split_config(void)
+ {
+ 	const char *name;
+-	char path[128];
++	char path[PATH_MAX+1];
+ 	char *opwd, *dir, *_name;
+ 	char *s, *d, c;
+ 	struct symbol *sym;
+-- 
+1.7.1
+
diff --git a/package/config/patches/series b/package/config/patches/series
index defdf58..098b082 100644
--- a/package/config/patches/series
+++ b/package/config/patches/series
@@ -9,3 +9,4 @@
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
 14-support-out-of-tree-config.patch
+15-use-PATH_MAX-for-path-buffer.patch
-- 
1.7.1
