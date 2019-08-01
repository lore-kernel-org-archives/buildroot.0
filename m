From: Mark Corbin <mark.corbin@embecosm.com>
Date: Thu,  1 Aug 2019 16:20:05 +0100
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix compiler warnings by
 increasing buffer sizes
Message-ID: <20190801152005.12285-1-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When compiling kconfig with host gcc 8.3.0 several compiler
'-Wformat-overflow=' warnings are generated. This is due to a
number of temporary buffers used by sprintf being too small.
The sizes of these buffers have been increased to remove the
warnings.

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 support/kconfig/confdata.c | 4 ++--
 support/kconfig/util.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 892da74fdc..6f40588a89 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -744,7 +744,7 @@ int conf_write(const char *name)
 	struct menu *menu;
 	const char *basename;
 	const char *str;
-	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
+	char dirname[PATH_MAX+1], tmpname[PATH_MAX+23], newname[PATH_MAX+1];
 	char *env;
 
 	if (!name)
@@ -974,7 +974,7 @@ int conf_write_autoconf(void)
 	const char *name;
 	FILE *out, *tristate, *out_h;
 	int i;
-	char dir[PATH_MAX+1], buf[PATH_MAX+1];
+	char dir[PATH_MAX+1], buf[PATH_MAX+20];
 	char *s;
 
 	strcpy(dir, conf_get_configname());
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 18a8e52391..d051fbea13 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -35,7 +35,7 @@ struct file *file_lookup(const char *name)
 int file_write_dep(const char *name)
 {
 	char *str;
-	char buf[PATH_MAX+1], buf2[PATH_MAX+1], dir[PATH_MAX+1];
+	char buf[PATH_MAX+13], buf2[PATH_MAX+1], dir[PATH_MAX+1];
 	struct symbol *sym, *env_sym;
 	struct expr *e;
 	struct file *file;
-- 
2.19.1
