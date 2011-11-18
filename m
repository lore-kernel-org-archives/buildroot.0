From: Konrad Eisele <konrad@gaisler.com>
Date: Fri, 18 Nov 2011 10:04:32 +0100
Subject: [Buildroot] [PATCH 1/1] kconfig: Add "execute" config-type
In-Reply-To: <CAAXf6LXJLXQ1tm_zQTH=XaBLZBEnt0W3u14aYZJ0e0K0vZ5ohw@mail.gmail.com>
References: <CAAXf6LXJLXQ1tm_zQTH=XaBLZBEnt0W3u14aYZJ0e0K0vZ5ohw@mail.gmail.com>
Message-ID: <1321607072-23702-1-git-send-email-konrad@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New kconfig config-type "execute":
Type "execute" is similar to "string". However instead of editing, the string is executed
using call to "system(<string>)" i.e.:
config EXECUTE_BUILD
	execute "title"
	default "make CFLAGS=\"\" build"
	help
	  Execute "make build"

Signed-off-by: Konrad Eisele <konrad@gaisler.com>
---
 support/kconfig/conf.c               |    2 +
 support/kconfig/confdata.c           |    6 +
 support/kconfig/expr.h               |    2 +-
 support/kconfig/gconf.c              |    7 +-
 support/kconfig/lkc_proto.h          |    1 +
 support/kconfig/mconf.c              |    3 +
 support/kconfig/menu.c               |    2 +-
 support/kconfig/nconf.c              |    3 +
 support/kconfig/qconf.cc             |   13 ++-
 support/kconfig/qconf.h              |    1 +
 support/kconfig/symbol.c             |    7 ++
 support/kconfig/util.c               |   24 +++++
 support/kconfig/zconf.gperf          |    1 +
 support/kconfig/zconf.hash.c_shipped |  190 +++++++++++++++++-----------------
 support/kconfig/zconf.tab.c_shipped  |    3 +
 support/kconfig/zconf.y              |    3 +
 16 files changed, 170 insertions(+), 98 deletions(-)

diff --git a/support/kconfig/conf.c b/support/kconfig/conf.c
index 692f779..e6986f2 100644
--- a/support/kconfig/conf.c
+++ b/support/kconfig/conf.c
@@ -120,6 +120,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	case S_STRING:
 		printf("%s\n", def);
 		return 1;
+	case S_EXECUTE:
 	default:
 		;
 	}
@@ -394,6 +395,7 @@ static void conf(struct menu *menu)
 	switch (sym->type) {
 	case S_INT:
 	case S_HEX:
+	case S_EXECUTE:
 	case S_STRING:
 		conf_string(menu);
 		break;
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 3fb4f09..d558e84 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -147,6 +147,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->type = S_STRING;
 			goto done;
 		}
+	case S_EXECUTE:
 	case S_STRING:
 		if (*p++ != '"')
 			break;
@@ -233,6 +234,7 @@ load:
 		switch (sym->type) {
 		case S_INT:
 		case S_HEX:
+		case S_EXECUTE:
 		case S_STRING:
 			if (sym->def[def].val)
 				free(sym->def[def].val);
@@ -408,6 +410,7 @@ int conf_read_level(const char *name, struct conf_level *l)
 			if (sym->visible == no && !conf_unsaved)
 				sym->flags &= ~SYMBOL_DEF_USER;
 			switch (sym->type) {
+			case S_EXECUTE:
 			case S_STRING:
 			case S_INT:
 			case S_HEX:
@@ -491,6 +494,7 @@ static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
 			break;
 		}
 		break;
+	case S_EXECUTE:
 	case S_STRING:
 		conf_write_string(false, CONFPREFIX(sym), sym->name, sym_get_string_value(sym), out);
 		break;
@@ -762,6 +766,7 @@ static int conf_split_config(void)
 					    sym->def[S_DEF_AUTO].tri)
 						continue;
 					break;
+				case S_EXECUTE:
 				case S_STRING:
 				case S_HEX:
 				case S_INT:
@@ -936,6 +941,7 @@ int conf_write_autoconf(void)
 				break;
 			}
 			break;
+		case S_EXECUTE:
 		case S_STRING:
 			conf_write_string(true, CONFPREFIX(sym), sym->name, sym_get_string_value(sym), out_h);
 			break;
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index b2d8b4a..1a7fcf2 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -74,7 +74,7 @@ struct symbol_value {
 };
 
 enum symbol_type {
-	S_UNKNOWN, S_BOOLEAN, S_TRISTATE, S_INT, S_HEX, S_STRING, S_OTHER
+	S_UNKNOWN, S_BOOLEAN, S_TRISTATE, S_INT, S_HEX, S_STRING, S_EXECUTE, S_OTHER
 };
 
 /* enum values are used as index to symbol.def[] */
diff --git a/support/kconfig/gconf.c b/support/kconfig/gconf.c
index 1c3cb81..d44ec15 100644
--- a/support/kconfig/gconf.c
+++ b/support/kconfig/gconf.c
@@ -968,8 +968,10 @@ on_treeview2_button_press_event(GtkWidget * widget,
 	if (event->type == GDK_2BUTTON_PRESS) {
 		enum prop_type ptype;
 		ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
-
-		if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
+		if (menu->sym && (sym_get_type(menu->sym) == S_EXECUTE) &&
+		    (col == COL_OPTION || col == COL_VALUE || col == COL_NAME)) {
+			execute_sym(menu->sym, 0);
+		} if (ptype == P_MENU && view_mode != FULL_VIEW && col == COL_OPTION) {
 			// goes down into menu
 			current = menu;
 			display_tree_part();
@@ -1205,6 +1207,7 @@ static gchar **fill_row(struct menu *menu)
 		break;
 	case S_INT:
 	case S_HEX:
+	case S_EXECUTE:
 	case S_STRING:
 		def = sym_get_string_value(sym);
 		row[COL_VALUE] = g_strdup(def);
diff --git a/support/kconfig/lkc_proto.h b/support/kconfig/lkc_proto.h
index 334fdfc..276001f 100644
--- a/support/kconfig/lkc_proto.h
+++ b/support/kconfig/lkc_proto.h
@@ -56,3 +56,4 @@ P(expr_print,void,(struct expr *e, void (*fn)(void *, struct symbol *, const cha
 
 /* util.c */
 P(resolve_vars,char*,(const char *n, struct conf_level *l));
+P(execute_sym,void,(struct symbol *sym, int isterm));
diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 6711085..5720179 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -714,6 +714,9 @@ static void conf_string(struct menu *menu)
 		case S_HEX:
 			heading = _(inputbox_instructions_hex);
 			break;
+		case S_EXECUTE:
+			execute_sym(menu->sym, 1);
+			return;
 		case S_STRING:
 			heading = _(inputbox_instructions_string);
 			break;
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index 1ffaeac..1629613 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -217,7 +217,7 @@ static void sym_check_prop(struct symbol *sym)
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
 		case P_DEFAULT:
-			if ((sym->type == S_STRING || sym->type == S_INT || sym->type == S_HEX) &&
+			if ((sym->type == S_STRING || sym->type == S_EXECUTE || sym->type == S_INT || sym->type == S_HEX) &&
 			    prop->expr->type != E_SYMBOL)
 				prop_warn(prop,
 				    "default for config symbol '%s'"
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index ca1b055..b6dcb19 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -1373,6 +1373,9 @@ static void conf_string(struct menu *menu)
 		case S_HEX:
 			heading = _(inputbox_instructions_hex);
 			break;
+		case S_EXECUTE:
+			execute_sym(menu->sym, 1);
+			return;
 		case S_STRING:
 			heading = _(inputbox_instructions_string);
 			break;
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index 0760f4f..8c0d7c5 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -296,6 +296,14 @@ ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
 }
 
+void ConfigLineEdit::execute(ConfigItem* i)
+{
+	struct symbol *sym;
+	item = i;
+	sym = item->menu->sym;
+	execute_sym(sym, 0);
+}
+
 void ConfigLineEdit::show(ConfigItem* i)
 {
 	item = i;
@@ -537,7 +545,10 @@ void ConfigList::changeValue(ConfigItem* item)
 		if (oldexpr != newexpr)
 			parent()->updateList(item);
 		break;
-	case S_INT:
+	case S_EXECUTE:
+		parent()->lineEdit->execute(item);
+		break;
+ 	case S_INT:
 	case S_HEX:
 	case S_STRING:
 		if (colMap[dataColIdx] >= 0)
diff --git a/support/kconfig/qconf.h b/support/kconfig/qconf.h
index 91677d9..1537671 100644
--- a/support/kconfig/qconf.h
+++ b/support/kconfig/qconf.h
@@ -209,6 +209,7 @@ public:
 		return (ConfigView*)Parent::parent();
 	}
 	void show(ConfigItem *i);
+	void execute(ConfigItem *i);
 	void keyPressEvent(QKeyEvent *e);
 
 public:
diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
index 941152e..b7d6c09 100644
--- a/support/kconfig/symbol.c
+++ b/support/kconfig/symbol.c
@@ -92,6 +92,8 @@ const char *sym_type_name(enum symbol_type type)
 		return "integer";
 	case S_HEX:
 		return "hex";
+	case S_EXECUTE:
+		return "execute";
 	case S_STRING:
 		return "string";
 	case S_UNKNOWN:
@@ -308,6 +310,7 @@ void sym_calc_value(struct symbol *sym)
 	switch (sym->type) {
 	case S_INT:
 	case S_HEX:
+	case S_EXECUTE:
 	case S_STRING:
 		newval = symbol_empty.curr;
 		break;
@@ -374,6 +377,7 @@ void sym_calc_value(struct symbol *sym)
 		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
 			newval.tri = yes;
 		break;
+	case S_EXECUTE:
 	case S_STRING:
 	case S_HEX:
 	case S_INT:
@@ -550,6 +554,7 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 	signed char ch;
 
 	switch (sym->type) {
+	case S_EXECUTE:
 	case S_STRING:
 		return true;
 	case S_INT:
@@ -594,6 +599,7 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 	int val;
 
 	switch (sym->type) {
+	case S_EXECUTE:
 	case S_STRING:
 		return sym_string_valid(sym, str);
 	case S_INT:
@@ -744,6 +750,7 @@ const char *sym_get_string_default(struct symbol *sym)
 	case S_INT:
 	case S_HEX:
 		return str;
+	case S_EXECUTE:
 	case S_STRING:
 		return str;
 	case S_OTHER:
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index cb8df5f..b970c7e 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -318,3 +318,27 @@ error_out:
 		free(var);
 	return 0;
 }
+
+void execute_sym(struct symbol *sym, int isterm) 
+{
+	if (sym
+	    && sym_get_string_value(sym)
+	    && sym_get_type(sym) == S_EXECUTE) {
+		const char *cmd = sym_get_string_value(sym);
+		char *rcmd = resolve_vars(cmd, sym->level);
+		if (rcmd) {
+			if (isterm) {
+				char *tcmd;
+				tcmd = malloc(strlen(rcmd) + 32);
+				tcmd[0] = 0;
+				strcat(tcmd, "xterm -e ");
+				strcat(tcmd, rcmd);
+				free(rcmd);
+				rcmd = tcmd;
+			}
+			conf_write(NULL);
+			system(rcmd);
+			free(rcmd);
+		}
+	}
+}
diff --git a/support/kconfig/zconf.gperf b/support/kconfig/zconf.gperf
index 88228c6..3a624d3 100644
--- a/support/kconfig/zconf.gperf
+++ b/support/kconfig/zconf.gperf
@@ -37,6 +37,7 @@ def_bool,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN
 int,		T_TYPE,		TF_COMMAND, S_INT
 hex,		T_TYPE,		TF_COMMAND, S_HEX
 string,		T_TYPE,		TF_COMMAND, S_STRING
+execute,	T_TYPE,		TF_COMMAND, S_EXECUTE
 select,		T_SELECT,	TF_COMMAND
 range,		T_RANGE,	TF_COMMAND
 visible,	T_VISIBLE,	TF_COMMAND
diff --git a/support/kconfig/zconf.hash.c_shipped b/support/kconfig/zconf.hash.c_shipped
index dd11aab..0e07a55 100644
--- a/support/kconfig/zconf.hash.c_shipped
+++ b/support/kconfig/zconf.hash.c_shipped
@@ -32,7 +32,7 @@
 struct kconf_id;
 
 static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 47, duplicates = 0 */
+/* maximum key range = 52, duplicates = 0 */
 
 #ifdef __GNUC__
 __inline
@@ -46,32 +46,32 @@ kconf_id_hash (register const char *str, register unsigned int len)
 {
   static unsigned char asso_values[] =
     {
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 30,  5,
-       0,  0,  5, 49,  0, 20, 49, 49, 20, 20,
-       5,  0, 40, 49, 15,  0,  0, 25, 35, 49,
-       0, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 35, 10,
+       5,  0,  5, 54, 10, 25, 54, 54, 20, 20,
+       5,  0, 40, 54,  5,  0,  0, 25, 40, 54,
+       0, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54, 54, 54, 54, 54,
+      54, 54, 54, 54, 54, 54
     };
   register int hval = len;
 
@@ -91,72 +91,74 @@ kconf_id_hash (register const char *str, register unsigned int len)
 struct kconf_id_strings_t
   {
     char kconf_id_strings_str2[sizeof("on")];
-    char kconf_id_strings_str3[sizeof("hex")];
-    char kconf_id_strings_str5[sizeof("endif")];
     char kconf_id_strings_str6[sizeof("option")];
-    char kconf_id_strings_str7[sizeof("endmenu")];
+    char kconf_id_strings_str7[sizeof("execute")];
     char kconf_id_strings_str8[sizeof("optional")];
-    char kconf_id_strings_str9[sizeof("endchoice")];
-    char kconf_id_strings_str11[sizeof("choice")];
-    char kconf_id_strings_str12[sizeof("default")];
-    char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str16[sizeof("config")];
-    char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str19[sizeof("defconfig_list")];
-    char kconf_id_strings_str21[sizeof("string")];
-    char kconf_id_strings_str22[sizeof("if")];
-    char kconf_id_strings_str23[sizeof("int")];
-    char kconf_id_strings_str24[sizeof("help")];
-    char kconf_id_strings_str25[sizeof("range")];
+    char kconf_id_strings_str10[sizeof("endif")];
+    char kconf_id_strings_str11[sizeof("string")];
+    char kconf_id_strings_str12[sizeof("endmenu")];
+    char kconf_id_strings_str13[sizeof("hex")];
+    char kconf_id_strings_str14[sizeof("endchoice")];
+    char kconf_id_strings_str15[sizeof("range")];
+    char kconf_id_strings_str16[sizeof("choice")];
+    char kconf_id_strings_str17[sizeof("default")];
+    char kconf_id_strings_str18[sizeof("def_bool")];
+    char kconf_id_strings_str21[sizeof("config")];
+    char kconf_id_strings_str22[sizeof("def_tristate")];
+    char kconf_id_strings_str24[sizeof("defconfig_list")];
     char kconf_id_strings_str26[sizeof("select")];
-    char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str28[sizeof("tristate")];
+    char kconf_id_strings_str27[sizeof("if")];
+    char kconf_id_strings_str28[sizeof("int")];
     char kconf_id_strings_str29[sizeof("menu")];
     char kconf_id_strings_str31[sizeof("source")];
-    char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str34[sizeof("bool")];
+    char kconf_id_strings_str32[sizeof("modules")];
+    char kconf_id_strings_str33[sizeof("tristate")];
+    char kconf_id_strings_str34[sizeof("help")];
     char kconf_id_strings_str35[sizeof("menuconfig")];
-    char kconf_id_strings_str37[sizeof("boolean")];
-    char kconf_id_strings_str38[sizeof("env")];
-    char kconf_id_strings_str39[sizeof("subsource")];
-    char kconf_id_strings_str42[sizeof("visible")];
+    char kconf_id_strings_str37[sizeof("comment")];
+    char kconf_id_strings_str39[sizeof("bool")];
+    char kconf_id_strings_str42[sizeof("boolean")];
+    char kconf_id_strings_str43[sizeof("env")];
+    char kconf_id_strings_str44[sizeof("subsource")];
     char kconf_id_strings_str46[sizeof("prompt")];
-    char kconf_id_strings_str47[sizeof("depends")];
-    char kconf_id_strings_str48[sizeof("mainmenu")];
+    char kconf_id_strings_str47[sizeof("visible")];
+    char kconf_id_strings_str52[sizeof("depends")];
+    char kconf_id_strings_str53[sizeof("mainmenu")];
   };
 static struct kconf_id_strings_t kconf_id_strings_contents =
   {
     "on",
-    "hex",
-    "endif",
     "option",
-    "endmenu",
+    "execute",
     "optional",
+    "endif",
+    "string",
+    "endmenu",
+    "hex",
     "endchoice",
+    "range",
     "choice",
     "default",
     "def_bool",
     "config",
     "def_tristate",
     "defconfig_list",
-    "string",
+    "select",
     "if",
     "int",
-    "help",
-    "range",
-    "select",
-    "modules",
-    "tristate",
     "menu",
     "source",
+    "modules",
+    "tristate",
+    "help",
+    "menuconfig",
     "comment",
     "bool",
-    "menuconfig",
     "boolean",
     "env",
     "subsource",
-    "visible",
     "prompt",
+    "visible",
     "depends",
     "mainmenu"
   };
@@ -172,59 +174,61 @@ kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
     {
-      TOTAL_KEYWORDS = 33,
+      TOTAL_KEYWORDS = 34,
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 48
+      MAX_HASH_VALUE = 53
     };
 
   static struct kconf_id wordlist[] =
     {
       {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_HEX},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
+      {-1}, {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_TYPE,		TF_COMMAND, S_EXECUTE},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_OPTIONAL,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_CHOICE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str10,		T_ENDIF,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_TYPE,		TF_COMMAND, S_STRING},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_ENDMENU,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,		T_TYPE,		TF_COMMAND, S_HEX},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_ENDCHOICE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str15,		T_RANGE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CHOICE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_CONFIG,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str24,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_TYPE,		TF_COMMAND, S_STRING},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str24,		T_HELP,		TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,		T_RANGE,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_SELECT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,		T_IF,		TF_COMMAND|TF_PARAM},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,		T_TYPE,		TF_COMMAND, S_INT},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
       {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SOURCE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str34,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_OPT_MODULES,	TF_OPTION},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str34,		T_HELP,		TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str38,		T_OPT_ENV,	TF_OPTION},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,	T_SUBSOURCE,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_COMMENT,	TF_COMMAND},
+      {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
-      {-1}, {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_OPT_ENV,	TF_OPTION},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str44,	T_SUBSOURCE,	TF_COMMAND},
+      {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_PROMPT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_DEPENDS,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND}
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_VISIBLE,	TF_COMMAND},
+      {-1}, {-1}, {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str52,	T_DEPENDS,	TF_COMMAND},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str53,	T_MAINMENU,	TF_COMMAND}
     };
 
   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
diff --git a/support/kconfig/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
index 347c5a5..e5be5fb 100644
--- a/support/kconfig/zconf.tab.c_shipped
+++ b/support/kconfig/zconf.tab.c_shipped
@@ -2447,6 +2447,9 @@ static void print_symbol(FILE *out, struct menu *menu)
 	case S_STRING:
 		fputs("  string\n", out);
 		break;
+	case S_EXECUTE:
+		fputs("  execute\n", out);
+		break;
 	case S_INT:
 		fputs("  integer\n", out);
 		break;
diff --git a/support/kconfig/zconf.y b/support/kconfig/zconf.y
index a3ca573..de7c498 100644
--- a/support/kconfig/zconf.y
+++ b/support/kconfig/zconf.y
@@ -648,6 +648,9 @@ static void print_symbol(FILE *out, struct menu *menu)
 	case S_STRING:
 		fputs("  string\n", out);
 		break;
+	case S_EXECUTE:
+		fputs("  execute\n", out);
+		break;
 	case S_INT:
 		fputs("  integer\n", out);
 		break;
-- 
1.6.4.1
