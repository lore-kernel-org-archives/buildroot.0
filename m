From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] cleanup/simplify kconfig
	changes for O= builds
Message-ID: <20100621210811.1D960817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b8cca06b5089821ee8fb7087d1f88e5e2c74edf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/confdata.c |   64 ++++++++++++++-------------------------------
 package/config/lkc.h      |    1 -
 package/config/util.c     |   47 ++++++++++++++++++--------------
 3 files changed, 46 insertions(+), 66 deletions(-)

diff --git a/package/config/confdata.c b/package/config/confdata.c
index fe1fc2e..51a3d9a 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -404,6 +404,9 @@ int conf_write(const char *name)
 	int use_timestamp = 1;
 	char *env;
 
+	if (!name)
+		name = conf_get_configname();
+
 	dirname[0] = 0;
 	if (name && name[0]) {
 		struct stat st;
@@ -423,17 +426,8 @@ int conf_write(const char *name)
 				basename = conf_get_configname();
 		} else
 			basename = name;
-	} else {
-		char *slash;
-
+	} else
 		basename = conf_get_configname();
-		if((slash = strrchr(basename, '/'))) {
-			int size = slash - basename + 1;
-			memcpy(dirname, basename, size);
-			dirname[size] = 0;
-			basename = slash + 1;
-		}
-	}
 
 	sprintf(newname, "%s%s", dirname, basename);
 	env = getenv("KCONFIG_OVERWRITECONFIG");
@@ -697,51 +691,31 @@ int conf_write_autoconf(void)
 	FILE *out, *out_h;
 	time_t now;
 	int i, l;
-	char buf[PATH_MAX+1];
-	char buf2[PATH_MAX+1];
+	char dir[PATH_MAX+1], buf[PATH_MAX+1];
+	char *s;
 
-	sym_clear_all_valid();
+	strcpy(dir, conf_get_configname());
+	s = strrchr(dir, '/');
+	if (s)
+		s[1] = 0;
+	else
+		dir[0] = 0;
 
-	name = conf_get_configname();
-	str = strrchr(name, '/');
+	sym_clear_all_valid();
 
-	memset(buf, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf, name, str - name + 1);
-	}
-	strcat(buf, ".config.cmd");
+	sprintf(buf, "%s.config.cmd", dir);
 	file_write_dep(buf);
 
-	memset(buf, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf, name, str - name + 1);
-	}
-	strcat(buf, ".auto.deps");
-	write_make_deps(buf);
-
 	if (conf_split_config())
 		return 1;
 
-	memset(buf, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf, name, str - name + 1);
-	}
-	strcat(buf, ".tmpconfig");
-	memset(buf2, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf2, name, str - name + 1);
-	}
-	strcat(buf2, ".tmpconfig.h");
-
+	sprintf(buf, "%s.tmpconfig", dir);
 	out = fopen(buf, "w");
 	if (!out)
 		return 1;
 
-	out_h = fopen(buf2, "w");
+	sprintf(buf, "%s.tmpconfig.h", dir);
+	out_h = fopen(buf, "w");
 	if (!out_h) {
 		fclose(out);
 		return 1;
@@ -823,13 +797,15 @@ int conf_write_autoconf(void)
 	name = getenv("KCONFIG_AUTOHEADER");
 	if (!name)
 		name = "include/linux/autoconf.h";
-	if (rename(buf2, name))
+	sprintf(buf, "%s.tmpconfig.h", dir);
+	if (rename(buf, name))
 		return 1;
 	name = conf_get_autoconfig_name();
 	/*
 	 * This must be the last step, kbuild has a dependency on auto.conf
 	 * and this marks the successful completion of the previous steps.
 	 */
+	sprintf(buf, "%s.tmpconfig", dir);
 	if (rename(buf, name))
 		return 1;
 
diff --git a/package/config/lkc.h b/package/config/lkc.h
index e5661c0..f379b0b 100644
--- a/package/config/lkc.h
+++ b/package/config/lkc.h
@@ -102,7 +102,6 @@ void menu_set_type(int type);
 /* util.c */
 struct file *file_lookup(const char *name);
 int file_write_dep(const char *name);
-int write_make_deps(const char *name);
 
 struct gstr {
 	size_t len;
diff --git a/package/config/util.c b/package/config/util.c
index a1e9dea..c382140 100644
--- a/package/config/util.c
+++ b/package/config/util.c
@@ -51,25 +51,27 @@ static char* br2_symbol_printer(const char * const in)
 }
 
 /* write dependencies of the infividual config-symbols */
-int write_make_deps(const char *name)
+static int write_make_deps(const char *name)
 {
-	const char *str;
-	char buf[PATH_MAX+1];
+	char *str;
+	char dir[PATH_MAX+1], buf[PATH_MAX+1], buf2[PATH_MAX+1];
 	struct menu *menu;
 	struct symbol *sym;
 	struct property *prop, *p;
 	unsigned done;
+	const char * const name_tmp = "..make.deps.tmp";
 	FILE *out;
 	if (!name)
 		name = ".auto.deps";
 
-	str = strrchr(name, '/');
-	memset(buf, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf, name, str - name + 1);
-	}
-	strcat(buf, "..make.deps.tmp");
+	strcpy(dir, conf_get_configname());
+	str = strrchr(dir, '/');
+	if (str)
+		str[1] = 0;
+	else
+		dir[0] = 0;
+
+	sprintf(buf, "%s%s", dir, name_tmp);
 	out = fopen(buf, "w");
 	if (!out)
 		return 1;
@@ -129,7 +131,8 @@ next:
 		}
 	}
 	fclose(out);
-	rename(buf, name);
+	sprintf(buf2, "%s%s", dir, name);
+	rename(buf, buf2);
 	printf(_("#\n"
 		 "# make dependencies written to %s\n"
 		 "# ATTENTION buildroot devels!\n"
@@ -141,8 +144,8 @@ next:
 /* write a dependency file as used by kbuild to track dependencies */
 int file_write_dep(const char *name)
 {
-	const char *str;
-	char buf[PATH_MAX+1];
+	char *str;
+	char buf[PATH_MAX+1], buf2[PATH_MAX+1], dir[PATH_MAX+1];
 	struct symbol *sym, *env_sym;
 	struct expr *e;
 	struct file *file;
@@ -151,14 +154,14 @@ int file_write_dep(const char *name)
 	if (!name)
 		name = ".kconfig.d";
 
-	str = strrchr(name, '/');
-	memset(buf, 0, PATH_MAX+1);
-	if(str)
-	{
-		strncpy(buf, name, str - name + 1);
-	}
-	strcat(buf, "..config.tmp");
+	strcpy(dir, conf_get_configname());
+	str = strrchr(dir, '/');
+	if (str)
+		str[1] = 0;
+	else
+		dir[0] = 0;
 
+	sprintf(buf, "%s..config.tmp", dir);
 	out = fopen(buf, "w");
 	if (!out)
 		return 1;
@@ -190,7 +193,9 @@ int file_write_dep(const char *name)
 
 	fprintf(out, "\n$(deps_config): ;\n");
 	fclose(out);
-	rename(buf, name);
+	sprintf(buf2, "%s%s", dir, name);
+	rename(buf, buf2);
+	return write_make_deps(NULL);
 }
 
 
-- 
1.7.1
