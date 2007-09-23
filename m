From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 23 Sep 2007 13:28:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070923202854.3B44530046@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-23 13:28:53 -0700 (Sun, 23 Sep 2007)
New Revision: 19978

Log:
- thinking loud about auto-generating dependencies for make(1)
  Don't use this, it doesn't work yet. Thoughs welcome.
  Like: We should probably use the sym->text and not fiddle with the name since
  the name looses information ('_' != '-' in host-fakeroot). This would not
  be too robust, i fear, since the name can contain additional, arbitrary info.
  Also, the real 'depends' are a little bit ugly in kconfig. There doesn't seem
  to be a nice property that holds reverse deps that are only contain selected
  symbols.
  Thoughts?


Modified:
   trunk/buildroot/package/config/kconfig-to-buildroot2.patch
   trunk/buildroot/package/config/util.c


Changeset:
Modified: trunk/buildroot/package/config/kconfig-to-buildroot2.patch
===================================================================
--- trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 18:34:49 UTC (rev 19977)
+++ trunk/buildroot/package/config/kconfig-to-buildroot2.patch	2007-09-23 20:28:53 UTC (rev 19978)
@@ -1303,3 +1303,127 @@
  
  	return name ? name : ".config";
  }
+Index: util.c
+===================================================================
+--- kernel-config/util.c	(revision 19969)
++++ config/util.c	(working copy)
+@@ -26,6 +26,109 @@ struct file *file_lookup(const char *nam
+ 	return file;
+ }
+ 
++static char* br2_symbol_printer(const char * const in)
++{
++	ssize_t i, j, len = strlen(in);
++	char *ret;
++	if (len < 1)
++		return NULL;
++	ret = malloc(len);
++	if (!ret) {
++		printf("Out of memory!");
++		exit(1);
++	}
++	memset(ret, 0, len);
++	i = j = 0;
++	if (strncmp("BR2_", in, 4) == 0)
++		i += 4;
++	if (strncmp("PACKAGE_", in + i, 8) == 0)
++		i += 8;
++	else if (strncmp("TARGET_", in + i, 7) == 0)
++		i += 7;
++	while (i <= len)
++		ret[j++] = tolower(in[i++]);
++	return ret;
++}
++
++/* write dependencies of the infividual config-symbols */
++static int write_make_deps(const char *name)
++{
++	struct menu *menu;
++	struct symbol *sym;
++	struct property *prop, *p;
++	unsigned done;
++	const char * const name_tmp = "..make.deps.tmp";
++	FILE *out;
++	if (!name)
++		name = ".auto.deps";
++	out = fopen(name_tmp, "w");
++	if (!out)
++		return 1;
++	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
++		"# See package/config/util.c write_make_deps()\n#\n");
++	menu = &rootmenu;//rootmenu.list;
++	while (menu) {
++		sym = menu->sym;
++		if (!sym) {
++			if (!menu_is_visible(menu))
++				goto next;
++		} else if (!(sym->flags & SYMBOL_CHOICE)) {
++			sym_calc_value(sym);
++			if (sym->type == S_BOOLEAN
++			    && sym_get_tristate_value(sym) != no) {
++			    done = 0;
++			    for_all_prompts(sym, prop) {
++			        struct expr *e;
++//printf("\nname=%s\n", sym->name);
++			        for_all_properties(sym, p, P_SELECT) {
++				    e = p->expr;
++				    if (e && e->left.sym->name) {
++				        if (!done) {
++					    fprintf(out, "%s:", br2_symbol_printer(sym->name));
++					    done = 1;
++					}
++//printf("SELECTS %s\n",e->left.sym->name);
++					fprintf(out, " %s",br2_symbol_printer(e->left.sym->name));
++				    }
++				}
++				if (done)
++				    fprintf(out, "\n");
++#if 0
++				e = sym->rev_dep.expr;
++				if (e && e->type == E_SYMBOL
++					&& e->left.sym->name) {
++				    fprintf(out, "%s: %s", br2_symbol_printer(e->left.sym->name),
++						br2_symbol_printer(sym->name));
++printf("%s is Selected BY: %s", sym->name, e->left.sym->name);
++				}
++#endif
++			    }
++			}
++		}
++next:
++		if (menu->list) {
++			menu = menu->list;
++			continue;
++		}
++		if (menu->next)
++			menu = menu->next;
++		else while ((menu = menu->parent)) {
++			if (menu->next) {
++				menu = menu->next;
++				break;
++			}
++		}
++	}
++	fclose(out);
++	rename(name_tmp, name);
++	printf(_("#\n"
++		 "# make dependencies written to %s\n"
++		 "# ATTENTION buildroot devels!\n"
++		 "# See top of this file before playing with this auto-preprequisites!\n"
++		 "#\n"), name);
++	return 0;
++}
++
+ /* write a dependency file as used by kbuild to track dependencies */
+ int file_write_dep(const char *name)
+ {
+@@ -49,7 +152,8 @@ int file_write_dep(const char *name)
+ 		     "$(deps_config): ;\n");
+ 	fclose(out);
+ 	rename("..config.tmp", name);
+-	return 0;
++
++	return write_make_deps(NULL);
+ }
+ 
+ 

Modified: trunk/buildroot/package/config/util.c
===================================================================
--- trunk/buildroot/package/config/util.c	2007-09-23 18:34:49 UTC (rev 19977)
+++ trunk/buildroot/package/config/util.c	2007-09-23 20:28:53 UTC (rev 19978)
@@ -26,6 +26,109 @@
 	return file;
 }
 
+static char* br2_symbol_printer(const char * const in)
+{
+	ssize_t i, j, len = strlen(in);
+	char *ret;
+	if (len < 1)
+		return NULL;
+	ret = malloc(len);
+	if (!ret) {
+		printf("Out of memory!");
+		exit(1);
+	}
+	memset(ret, 0, len);
+	i = j = 0;
+	if (strncmp("BR2_", in, 4) == 0)
+		i += 4;
+	if (strncmp("PACKAGE_", in + i, 8) == 0)
+		i += 8;
+	else if (strncmp("TARGET_", in + i, 7) == 0)
+		i += 7;
+	while (i <= len)
+		ret[j++] = tolower(in[i++]);
+	return ret;
+}
+
+/* write dependencies of the infividual config-symbols */
+static int write_make_deps(const char *name)
+{
+	struct menu *menu;
+	struct symbol *sym;
+	struct property *prop, *p;
+	unsigned done;
+	const char * const name_tmp = "..make.deps.tmp";
+	FILE *out;
+	if (!name)
+		name = ".auto.deps";
+	out = fopen(name_tmp, "w");
+	if (!out)
+		return 1;
+	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
+		"# See package/config/util.c write_make_deps()\n#\n");
+	menu = &rootmenu;//rootmenu.list;
+	while (menu) {
+		sym = menu->sym;
+		if (!sym) {
+			if (!menu_is_visible(menu))
+				goto next;
+		} else if (!(sym->flags & SYMBOL_CHOICE)) {
+			sym_calc_value(sym);
+			if (sym->type == S_BOOLEAN
+			    && sym_get_tristate_value(sym) != no) {
+			    done = 0;
+			    for_all_prompts(sym, prop) {
+			        struct expr *e;
+//printf("\nname=%s\n", sym->name);
+			        for_all_properties(sym, p, P_SELECT) {
+				    e = p->expr;
+				    if (e && e->left.sym->name) {
+				        if (!done) {
+					    fprintf(out, "%s:", br2_symbol_printer(sym->name));
+					    done = 1;
+					}
+//printf("SELECTS %s\n",e->left.sym->name);
+					fprintf(out, " %s",br2_symbol_printer(e->left.sym->name));
+				    }
+				}
+				if (done)
+				    fprintf(out, "\n");
+#if 0
+				e = sym->rev_dep.expr;
+				if (e && e->type == E_SYMBOL
+					&& e->left.sym->name) {
+				    fprintf(out, "%s: %s", br2_symbol_printer(e->left.sym->name),
+						br2_symbol_printer(sym->name));
+printf("%s is Selected BY: %s", sym->name, e->left.sym->name);
+				}
+#endif
+			    }
+			}
+		}
+next:
+		if (menu->list) {
+			menu = menu->list;
+			continue;
+		}
+		if (menu->next)
+			menu = menu->next;
+		else while ((menu = menu->parent)) {
+			if (menu->next) {
+				menu = menu->next;
+				break;
+			}
+		}
+	}
+	fclose(out);
+	rename(name_tmp, name);
+	printf(_("#\n"
+		 "# make dependencies written to %s\n"
+		 "# ATTENTION buildroot devels!\n"
+		 "# See top of this file before playing with this auto-preprequisites!\n"
+		 "#\n"), name);
+	return 0;
+}
+
 /* write a dependency file as used by kbuild to track dependencies */
 int file_write_dep(const char *name)
 {
@@ -49,7 +152,8 @@
 		     "$(deps_config): ;\n");
 	fclose(out);
 	rename("..config.tmp", name);
-	return 0;
+
+	return write_make_deps(NULL);
 }
 
 
