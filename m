From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Feb 2011 12:07:45 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: rebase against
	ffb5957bc48f64
Message-ID: <20110202144319.141B48F338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d19a8be27b24ae59ab94815ed52d956c652753bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/conf.c                              |    2 +-
 package/config/confdata.c                          |   24 +++--
 package/config/lkc.h                               |    3 +
 package/config/mconf.c                             |   10 +-
 package/config/menu.c                              |    2 +-
 package/config/nconf.c                             |   12 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |    6 +-
 .../patches/03-change-config-option-prefix.patch   |  100 ++++++++++++--------
 .../patches/09-implement-kconfig-probability.patch |    4 +-
 .../patches/14-support-out-of-tree-config.patch    |   14 ++--
 .../patches/15-use-PATH_MAX-for-path-buffer.patch  |    4 +-
 11 files changed, 107 insertions(+), 74 deletions(-)

diff --git a/package/config/conf.c b/package/config/conf.c
index ab349ba..bd5dcb0 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -425,7 +425,7 @@ static void check_conf(struct menu *menu)
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
 				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("CONFIG_%s\n", sym->name);
+					printf("%s%s\n", CONFIG_, sym->name);
 				}
 			} else if (input_mode != oldnoconfig) {
 				if (!conf_cnt++)
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 8e2d870..9a6d9d0 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -221,7 +221,7 @@ load:
 		conf_lineno++;
 		sym = NULL;
 		if (line[0] == '#') {
-			if (line[1] != ' ')
+			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
 				continue;
 			p = strchr(line + 2, ' ');
 			if (!p)
@@ -424,7 +424,8 @@ static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
 		switch (sym_get_tristate_value(sym)) {
 		case no:
 			if (write_no)
-				fprintf(out, "# %s is not set\n", sym->name);
+				fprintf(out, "# %s is not set\n",
+				    sym->name);
 			break;
 		case mod:
 			fprintf(out, "%s=m\n", sym->name);
@@ -861,14 +862,17 @@ int conf_write_autoconf(void)
 			case no:
 				break;
 			case mod:
-				fprintf(tristate, "%s=M\n", sym->name);
-				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
+				fprintf(tristate, "%s=M\n",
+				    sym->name);
+				fprintf(out_h, "#define %s_MODULE 1\n",
+				    sym->name);
 				break;
 			case yes:
 				if (sym->type == S_TRISTATE)
-					fprintf(tristate, "%s=Y\n",
-							sym->name);
-				fprintf(out_h, "#define %s 1\n", sym->name);
+					fprintf(tristate,"%s=Y\n",
+					    sym->name);
+				fprintf(out_h, "#define %s 1\n",
+				    sym->name);
 				break;
 			}
 			break;
@@ -878,12 +882,14 @@ int conf_write_autoconf(void)
 		case S_HEX:
 			str = sym_get_string_value(sym);
 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
+				fprintf(out_h, "#define %s 0x%s\n",
+				    sym->name, str);
 				break;
 			}
 		case S_INT:
 			str = sym_get_string_value(sym);
-			fprintf(out_h, "#define %s %s\n", sym->name, str);
+			fprintf(out_h, "#define %s %s\n",
+			    sym->name, str);
 			break;
 		default:
 			break;
diff --git a/package/config/lkc.h b/package/config/lkc.h
index bdf71bd..e9a4e51 100644
--- a/package/config/lkc.h
+++ b/package/config/lkc.h
@@ -37,6 +37,9 @@ extern "C" {
 #define _(text) gettext(text)
 #define N_(text) (text)
 
+#ifndef CONFIG_
+#define CONFIG_ "BR_"
+#endif
 
 #define TF_COMMAND	0x0001
 #define TF_PARAM	0x0002
diff --git a/package/config/mconf.c b/package/config/mconf.c
index 41a7b28..dfc0acb 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -315,8 +315,8 @@ static void search_conf(void)
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			      _("Enter " CONFIG_ " (sub)string to search for "
+				"(with or without \"" CONFIG_ "\")"),
 			      10, 75, "");
 	switch (dres) {
 	case 0:
@@ -328,10 +328,10 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
-		dialog_input += 7;
+	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
+		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
 	res = get_relations_str(sym_arr);
diff --git a/package/config/menu.c b/package/config/menu.c
index 4fb5902..64da30c 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -566,7 +566,7 @@ void menu_get_ext_help(struct menu *menu, struct gstr *help)
 
 	if (menu_has_help(menu)) {
 		if (sym->name) {
-			str_printf(help, "CONFIG_%s:\n\n", sym->name);
+			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
 			str_append(help, _(menu_get_help(menu)));
 			str_append(help, "\n");
 		}
diff --git a/package/config/nconf.c b/package/config/nconf.c
index b8a9f37..da5e45d 100644
--- a/package/config/nconf.c
+++ b/package/config/nconf.c
@@ -744,8 +744,8 @@ static void search_conf(void)
 again:
 	dres = dialog_inputbox(main_window,
 			_("Search Configuration Parameter"),
-			_("Enter CONFIG_ (sub)string to search for "
-				"(with or without \"CONFIG\")"),
+			_("Enter " CONFIG_ " (sub)string to search for "
+				"(with or without \"" CONFIG_ "\")"),
 			"", dialog_input_result, 99);
 	switch (dres) {
 	case 0:
@@ -758,10 +758,10 @@ again:
 		return;
 	}
 
-	/* strip CONFIG_ if necessary */
+	/* strip the prefix if necessary */
 	dialog_input = dialog_input_result;
-	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
-		dialog_input += 7;
+	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
+		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
 	res = get_relations_str(sym_arr);
@@ -1261,7 +1261,7 @@ static void show_help(struct menu *menu)
 
 	if (menu && menu->sym && menu_has_help(menu)) {
 		if (menu->sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", menu->sym->name);
+			str_printf(&help, "%s%s:\n\n", CONFIG_, menu->sym->name);
 			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 			get_symbol_str(&help, menu->sym);
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index feff55b..0ef8ed6 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -60,7 +60,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -573,7 +573,7 @@
+@@ -574,7 +574,7 @@
  	if (!out)
  		return 1;
  
@@ -69,7 +69,7 @@ Index: config/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -582,7 +582,7 @@
+@@ -583,7 +583,7 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -78,7 +78,7 @@ Index: config/confdata.c
  		       "%s%s"
  		       "#\n"),
  		     sym_get_string_value(sym),
-@@ -796,25 +796,25 @@
+@@ -797,25 +797,25 @@
  		return 1;
  	}
  
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
index 59f1beb..6ceafcd 100644
--- a/package/config/patches/03-change-config-option-prefix.patch
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -1,6 +1,7 @@
 ---
- confdata.c |   45 +++++++++++++++++++++++----------------------
- 1 file changed, 23 insertions(+), 22 deletions(-)
+ confdata.c |   57 +++++++++++++++++++++++++++++----------------------------
+ lkc.h      |    2 +-
+ 2 files changed, 30 insertions(+), 29 deletions(-)
 
 Index: config/confdata.c
 ===================================================================
@@ -32,14 +33,11 @@ Index: config/confdata.c
  
  	return name ? name : ".config";
  }
-@@ -222,22 +223,22 @@
- 		conf_lineno++;
- 		sym = NULL;
+@@ -224,20 +225,20 @@
  		if (line[0] == '#') {
--			if (memcmp(line + 2, "CONFIG_", 7))
-+			if (line[1] != ' ')
+ 			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
  				continue;
--			p = strchr(line + 9, ' ');
+-			p = strchr(line + 2 + strlen(CONFIG_), ' ');
 +			p = strchr(line + 2, ' ');
  			if (!p)
  				continue;
@@ -47,14 +45,14 @@ Index: config/confdata.c
  			if (strncmp(p, "is not set", 10))
  				continue;
  			if (def == S_DEF_USER) {
--				sym = sym_find(line + 9);
+-				sym = sym_find(line + 2 + strlen(CONFIG_));
 +				sym = sym_find(line + 2);
  				if (!sym) {
  					sym_add_change_count(1);
  					break;
  				}
  			} else {
--				sym = sym_lookup(line + 9, 0);
+-				sym = sym_lookup(line + 2 + strlen(CONFIG_), 0);
 +				sym = sym_lookup(line + 2, 0);
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
@@ -63,8 +61,8 @@ Index: config/confdata.c
  			default:
  				;
  			}
--		} else if (memcmp(line, "CONFIG_", 7) == 0) {
--			p = strchr(line + 7, '=');
+-		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
+-			p = strchr(line + strlen(CONFIG_), '=');
 +		} else if (isupper(line[0])) {
 +			p = strchr(line, '=');
  			if (!p)
@@ -74,14 +72,14 @@ Index: config/confdata.c
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
--				sym = sym_find(line + 7);
+-				sym = sym_find(line + strlen(CONFIG_));
 +				sym = sym_find(line);
  				if (!sym) {
  					sym_add_change_count(1);
  					break;
  				}
  			} else {
--				sym = sym_lookup(line + 7, 0);
+-				sym = sym_lookup(line + strlen(CONFIG_), 0);
 +				sym = sym_lookup(line, 0);
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
@@ -90,71 +88,97 @@ Index: config/confdata.c
  {
  	int l;
  	if (headerfile)
--		fprintf(out, "#define CONFIG_%s \"", name);
+-		fprintf(out, "#define %s%s \"", CONFIG_, name);
 +		fprintf(out, "#define %s \"", name);
  	else
--		fprintf(out, "CONFIG_%s=\"", name);
+-		fprintf(out, "%s%s=\"", CONFIG_, name);
 +		fprintf(out, "%s=\"", name);
  
  	while (1) {
  		l = strcspn(str, "\"\\");
-@@ -425,13 +426,13 @@
+@@ -425,14 +426,14 @@
  		switch (sym_get_tristate_value(sym)) {
  		case no:
  			if (write_no)
--				fprintf(out, "# CONFIG_%s is not set\n", sym->name);
-+				fprintf(out, "# %s is not set\n", sym->name);
+-				fprintf(out, "# %s%s is not set\n",
+-				    CONFIG_, sym->name);
++				fprintf(out, "# %s is not set\n",
++				    sym->name);
  			break;
  		case mod:
--			fprintf(out, "CONFIG_%s=m\n", sym->name);
+-			fprintf(out, "%s%s=m\n", CONFIG_, sym->name);
 +			fprintf(out, "%s=m\n", sym->name);
  			break;
  		case yes:
--			fprintf(out, "CONFIG_%s=y\n", sym->name);
+-			fprintf(out, "%s%s=y\n", CONFIG_, sym->name);
 +			fprintf(out, "%s=y\n", sym->name);
  			break;
  		}
  		break;
-@@ -441,7 +442,7 @@
+@@ -442,7 +443,7 @@
  	case S_HEX:
  	case S_INT:
  		str = sym_get_string_value(sym);
--		fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+-		fprintf(out, "%s%s=%s\n", CONFIG_, sym->name, str);
 +		fprintf(out, "%s=%s\n", sym->name, str);
  		break;
  	case S_OTHER:
  	case S_UNKNOWN:
-@@ -832,14 +833,14 @@
+@@ -833,17 +834,17 @@
  			case no:
  				break;
  			case mod:
--				fprintf(tristate, "CONFIG_%s=M\n", sym->name);
--				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
-+				fprintf(tristate, "%s=M\n", sym->name);
-+				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
+-				fprintf(tristate, "%s%s=M\n",
+-				    CONFIG_, sym->name);
+-				fprintf(out_h, "#define %s%s_MODULE 1\n",
+-				    CONFIG_, sym->name);
++				fprintf(tristate, "%s=M\n",
++				    sym->name);
++				fprintf(out_h, "#define %s_MODULE 1\n",
++				    sym->name);
  				break;
  			case yes:
  				if (sym->type == S_TRISTATE)
--					fprintf(tristate, "CONFIG_%s=Y\n",
-+					fprintf(tristate, "%s=Y\n",
- 							sym->name);
--				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
-+				fprintf(out_h, "#define %s 1\n", sym->name);
+-					fprintf(tristate,"%s%s=Y\n",
+-					    CONFIG_, sym->name);
+-				fprintf(out_h, "#define %s%s 1\n",
+-				    CONFIG_, sym->name);
++					fprintf(tristate,"%s=Y\n",
++					    sym->name);
++				fprintf(out_h, "#define %s 1\n",
++				    sym->name);
  				break;
  			}
  			break;
-@@ -849,12 +850,12 @@
+@@ -853,14 +854,14 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
--				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
-+				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
+-				fprintf(out_h, "#define %s%s 0x%s\n",
+-				    CONFIG_, sym->name, str);
++				fprintf(out_h, "#define %s 0x%s\n",
++				    sym->name, str);
  				break;
  			}
  		case S_INT:
  			str = sym_get_string_value(sym);
--			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
-+			fprintf(out_h, "#define %s %s\n", sym->name, str);
+-			fprintf(out_h, "#define %s%s %s\n",
+-			    CONFIG_, sym->name, str);
++			fprintf(out_h, "#define %s %s\n",
++			    sym->name, str);
  			break;
  		default:
  			break;
+Index: config/lkc.h
+===================================================================
+--- config.orig/lkc.h
++++ config/lkc.h
+@@ -38,7 +38,7 @@
+ #define N_(text) (text)
+ 
+ #ifndef CONFIG_
+-#define CONFIG_ "CONFIG_"
++#define CONFIG_ "BR_"
+ #endif
+ 
+ #define TF_COMMAND	0x0001
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
index e16bca2..7d188e5 100644
--- a/package/config/patches/09-implement-kconfig-probability.patch
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -6,7 +6,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -979,7 +979,16 @@
+@@ -985,7 +985,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: config/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -998,8 +1007,15 @@
+@@ -1004,8 +1013,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
index 1f18711..8cce7dc 100644
--- a/package/config/patches/14-support-out-of-tree-config.patch
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -31,7 +31,7 @@ Index: config/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -540,6 +538,9 @@
+@@ -541,6 +539,9 @@
  	int use_timestamp = 1;
  	char *env;
  
@@ -41,7 +41,7 @@ Index: config/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -656,6 +657,7 @@
+@@ -657,6 +658,7 @@
  {
  	const char *name;
  	char path[128];
@@ -49,7 +49,7 @@ Index: config/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -664,8 +666,20 @@
+@@ -665,8 +667,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: config/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -758,9 +772,11 @@
+@@ -759,9 +773,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: config/confdata.c
  	return res;
  }
  
-@@ -772,25 +788,38 @@
+@@ -773,25 +789,38 @@
  	FILE *out, *tristate, *out_h;
  	time_t now;
  	int i;
@@ -130,7 +130,7 @@ Index: config/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -813,8 +842,7 @@
+@@ -814,8 +843,7 @@
  	fprintf(out_h, "/*\n"
  		       " * Automatically generated C config: don't edit\n"
  		       " * %s"
@@ -140,7 +140,7 @@ Index: config/confdata.c
  		       ctime(&now));
  
  	for_all_symbols(i, sym) {
-@@ -868,19 +896,22 @@
+@@ -874,19 +902,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
diff --git a/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
index 1a2a802..fafc0ff 100644
--- a/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
+++ b/package/config/patches/15-use-PATH_MAX-for-path-buffer.patch
@@ -18,7 +18,7 @@ Index: config/confdata.c
 ===================================================================
 --- config.orig/confdata.c
 +++ config/confdata.c
-@@ -532,7 +532,7 @@
+@@ -533,7 +533,7 @@
  	struct menu *menu;
  	const char *basename;
  	const char *str;
@@ -27,7 +27,7 @@ Index: config/confdata.c
  	enum symbol_type type;
  	time_t now;
  	int use_timestamp = 1;
-@@ -656,7 +656,7 @@
+@@ -657,7 +657,7 @@
  static int conf_split_config(void)
  {
  	const char *name;
-- 
1.7.3.4
