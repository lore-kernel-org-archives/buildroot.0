From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2013 00:53:35 +0100
Subject: [Buildroot] [PATCH 4/4] support/kconfig: bump to kconfig from
	linux-3.12
In-Reply-To: <cover.1384386575.git.yann.morin.1998@free.fr>
References: <cover.1384386575.git.yann.morin.1998@free.fr>
Message-ID: <eabc0ac6fc62b091a78c1f78a987fbe3962e0c95.1384386575.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

With this, we can trash our probability patch, it's now upstream.
Refresh a few other patches.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/Makefile                           |   4 +-
 support/kconfig/conf.c                             |  16 +-
 support/kconfig/confdata.c                         | 111 +++-
 support/kconfig/expr.h                             |   3 +
 support/kconfig/list.h                             |  40 ++
 support/kconfig/lkc.h                              |   3 +-
 support/kconfig/lkc_proto.h                        |   1 +
 support/kconfig/lxdialog/check-lxdialog.sh         |   6 +-
 support/kconfig/lxdialog/checklist.c               |   8 +-
 support/kconfig/lxdialog/dialog.h                  |  21 +
 support/kconfig/lxdialog/inputbox.c                |   8 +-
 support/kconfig/lxdialog/menubox.c                 |  15 +-
 support/kconfig/lxdialog/textbox.c                 |   6 +-
 support/kconfig/lxdialog/util.c                    |  85 +++-
 support/kconfig/lxdialog/yesno.c                   |   8 +-
 support/kconfig/mconf.c                            | 108 +++-
 support/kconfig/menu.c                             |  73 ++-
 support/kconfig/merge_config.sh                    |  10 +-
 support/kconfig/nconf.c                            |  41 +-
 support/kconfig/nconf.gui.c                        |  20 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  22 +-
 .../patches/09-implement-kconfig-probability.patch |  44 --
 .../patches/11-use-mktemp-for-lxdialog.patch       |   2 +-
 .../patches/14-support-out-of-tree-config.patch    |  14 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   2 +-
 support/kconfig/patches/series                     |   1 -
 support/kconfig/streamline_config.pl               |  26 +-
 support/kconfig/symbol.c                           | 103 +++-
 support/kconfig/zconf.tab.c_shipped                | 562 +++++++++++----------
 support/kconfig/zconf.y                            |  11 +-
 30 files changed, 879 insertions(+), 495 deletions(-)
 delete mode 100644 support/kconfig/patches/09-implement-kconfig-probability.patch

diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
index d28b7ac..7eb4071 100644
--- a/support/kconfig/Makefile
+++ b/support/kconfig/Makefile
@@ -219,7 +219,9 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
 
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
-HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
+HOSTLOADLIBES_nconf	= $(shell \
+				pkg-config --libs menu panel ncurses 2>/dev/null \
+				|| echo "-lmenu -lpanel -lncurses"  )
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
 ifeq ($(qconf-target),1)
diff --git a/support/kconfig/conf.c b/support/kconfig/conf.c
index c104941..553fc76 100644
--- a/support/kconfig/conf.c
+++ b/support/kconfig/conf.c
@@ -13,6 +13,7 @@
 #include <getopt.h>
 #include <sys/stat.h>
 #include <sys/time.h>
+#include <errno.h>
 
 #include "lkc.h"
 
@@ -514,14 +515,24 @@ int main(int ac, char **av)
 		{
 			struct timeval now;
 			unsigned int seed;
+			char *seed_env;
 
 			/*
 			 * Use microseconds derived seed,
 			 * compensate for systems where it may be zero
 			 */
 			gettimeofday(&now, NULL);
-
 			seed = (unsigned int)((now.tv_sec + 1) * (now.tv_usec + 1));
+
+			seed_env = getenv("KCONFIG_SEED");
+			if( seed_env && *seed_env ) {
+				char *endp;
+				int tmp = (int)strtol(seed_env, &endp, 0);
+				if (*endp == '\0') {
+					seed = tmp;
+				}
+			}
+			fprintf( stderr, "KCONFIG_SEED=0x%X\n", seed );
 			srand(seed);
 			break;
 		}
@@ -642,7 +653,8 @@ int main(int ac, char **av)
 		conf_set_all_new_symbols(def_default);
 		break;
 	case randconfig:
-		conf_set_all_new_symbols(def_random);
+		/* Really nothing to do in this loop */
+		while (conf_set_all_new_symbols(def_random)) ;
 		break;
 	case defconfig:
 		conf_set_all_new_symbols(def_default);
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index db1fac5..4b41fe6 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -139,7 +139,9 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->flags |= def_flags;
 			break;
 		}
-		conf_warning("symbol value '%s' invalid for %s", p, sym->name);
+		if (def != S_DEF_AUTO)
+			conf_warning("symbol value '%s' invalid for %s",
+				     p, sym->name);
 		return 1;
 	case S_OTHER:
 		if (*p != '"') {
@@ -160,7 +162,8 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			memmove(p2, p2 + 1, strlen(p2));
 		}
 		if (!p2) {
-			conf_warning("invalid string found");
+			if (def != S_DEF_AUTO)
+				conf_warning("invalid string found");
 			return 1;
 		}
 		/* fall through */
@@ -171,7 +174,9 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->def[def].val = strdup(p);
 			sym->flags |= def_flags;
 		} else {
-			conf_warning("symbol value '%s' invalid for %s", p, sym->name);
+			if (def != S_DEF_AUTO)
+				conf_warning("symbol value '%s' invalid for %s",
+					     p, sym->name);
 			return 1;
 		}
 		break;
@@ -1073,7 +1078,7 @@ void conf_set_changed_callback(void (*fn)(void))
 	conf_changed_callback = fn;
 }
 
-static void randomize_choice_values(struct symbol *csym)
+static bool randomize_choice_values(struct symbol *csym)
 {
 	struct property *prop;
 	struct symbol *sym;
@@ -1086,7 +1091,7 @@ static void randomize_choice_values(struct symbol *csym)
 	 * In both cases stop.
 	 */
 	if (csym->curr.tri != yes)
-		return;
+		return false;
 
 	prop = sym_get_choice_prop(csym);
 
@@ -1110,13 +1115,18 @@ static void randomize_choice_values(struct symbol *csym)
 		else {
 			sym->def[S_DEF_USER].tri = no;
 		}
+		sym->flags |= SYMBOL_DEF_USER;
+		/* clear VALID to get value calculated */
+		sym->flags &= ~SYMBOL_VALID;
 	}
 	csym->flags |= SYMBOL_DEF_USER;
 	/* clear VALID to get value calculated */
 	csym->flags &= ~(SYMBOL_VALID);
+
+	return true;
 }
 
-static void set_all_choice_values(struct symbol *csym)
+void set_all_choice_values(struct symbol *csym)
 {
 	struct property *prop;
 	struct symbol *sym;
@@ -1133,29 +1143,66 @@ static void set_all_choice_values(struct symbol *csym)
 	}
 	csym->flags |= SYMBOL_DEF_USER;
 	/* clear VALID to get value calculated */
-	csym->flags &= ~(SYMBOL_VALID);
+	csym->flags &= ~(SYMBOL_VALID | SYMBOL_NEED_SET_CHOICE_VALUES);
 }
 
-void conf_set_all_new_symbols(enum conf_def_mode mode)
+bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
 	struct symbol *sym, *csym;
-	int i, cnt, prob = 50;
-
+	int i, cnt, pby, pty, ptm;	/* pby: probability of boolean  = y
+					 * pty: probability of tristate = y
+					 * ptm: probability of tristate = m
+					 */
+
+	pby = 50; pty = ptm = 33; /* can't go as the default in switch-case
+				   * below, otherwise gcc whines about
+				   * -Wmaybe-uninitialized */
 	if (mode == def_random) {
-		char *endp, *env = getenv("KCONFIG_PROBABILITY");
-		if (env && *env) {
-			int tmp = (int)strtol(env, &endp, 10);
-			if (*endp == '\0' && tmp >= 0 && tmp <= 100)
-				prob = tmp;
+		int n, p[3];
+		char *env = getenv("KCONFIG_PROBABILITY");
+		n = 0;
+		while( env && *env ) {
+			char *endp;
+			int tmp = strtol( env, &endp, 10 );
+			if( tmp >= 0 && tmp <= 100 ) {
+				p[n++] = tmp;
+			} else {
+				errno = ERANGE;
+				perror( "KCONFIG_PROBABILITY" );
+				exit( 1 );
+			}
+			env = (*endp == ':') ? endp+1 : endp;
+			if( n >=3 ) {
+				break;
+			}
+		}
+		switch( n ) {
+		case 1:
+			pby = p[0]; ptm = pby/2; pty = pby-ptm;
+			break;
+		case 2:
+			pty = p[0]; ptm = p[1]; pby = pty + ptm;
+			break;
+		case 3:
+			pby = p[0]; pty = p[1]; ptm = p[2];
+			break;
+		}
+
+		if( pty+ptm > 100 ) {
+			errno = ERANGE;
+			perror( "KCONFIG_PROBABILITY" );
+			exit( 1 );
 		}
 	}
+	bool has_changed = false;
 
 	for_all_symbols(i, sym) {
-		if (sym_has_value(sym))
+		if (sym_has_value(sym) || (sym->flags & SYMBOL_VALID))
 			continue;
 		switch (sym_get_type(sym)) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
+			has_changed = true;
 			switch (mode) {
 			case def_yes:
 				sym->def[S_DEF_USER].tri = yes;
@@ -1167,15 +1214,15 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
-				cnt = (rand() % 100) - (100 - prob);
-				if (cnt < 0)
-					sym->def[S_DEF_USER].tri = no;
-				else
-					if ((sym_get_type(sym) == S_TRISTATE)
-					    && (cnt > prob/2))
-						sym->def[S_DEF_USER].tri = mod;
-					else
+				sym->def[S_DEF_USER].tri = no;
+				cnt = rand() % 100;
+				if (sym->type == S_TRISTATE) {
+					if (cnt < pty)
 						sym->def[S_DEF_USER].tri = yes;
+					else if (cnt < (pty+ptm))
+						sym->def[S_DEF_USER].tri = mod;
+				} else if (cnt < pby)
+					sym->def[S_DEF_USER].tri = yes;
 				break;
 			default:
 				continue;
@@ -1200,14 +1247,26 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 	 * selected in a choice block and we set it to yes,
 	 * and the rest to no.
 	 */
+	if (mode != def_random) {
+		for_all_symbols(i, csym) {
+			if ((sym_is_choice(csym) && !sym_has_value(csym)) ||
+			    sym_is_choice_value(csym))
+				csym->flags |= SYMBOL_NEED_SET_CHOICE_VALUES;
+		}
+	}
+
 	for_all_symbols(i, csym) {
 		if (sym_has_value(csym) || !sym_is_choice(csym))
 			continue;
 
 		sym_calc_value(csym);
 		if (mode == def_random)
-			randomize_choice_values(csym);
-		else
+			has_changed = randomize_choice_values(csym);
+		else {
 			set_all_choice_values(csym);
+			has_changed = true;
+		}
 	}
+
+	return has_changed;
 }
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index cdd4860..df198a5 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -106,6 +106,9 @@ struct symbol {
 #define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
 
+/* choice values need to be set before calculating this symbol value */
+#define SYMBOL_NEED_SET_CHOICE_VALUES  0x100000
+
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		9973
 
diff --git a/support/kconfig/list.h b/support/kconfig/list.h
index 0ae730b..685d80e 100644
--- a/support/kconfig/list.h
+++ b/support/kconfig/list.h
@@ -51,6 +51,19 @@ struct list_head {
 	     pos = list_entry(pos->member.next, typeof(*pos), member))
 
 /**
+ * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_struct within the struct.
+ */
+#define list_for_each_entry_safe(pos, n, head, member)			\
+	for (pos = list_entry((head)->next, typeof(*pos), member),	\
+		n = list_entry(pos->member.next, typeof(*pos), member);	\
+	     &pos->member != (head);					\
+	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+
+/**
  * list_empty - tests whether a list is empty
  * @head: the list to test.
  */
@@ -88,4 +101,31 @@ static inline void list_add_tail(struct list_head *_new, struct list_head *head)
 	__list_add(_new, head->prev, head);
 }
 
+/*
+ * Delete a list entry by making the prev/next entries
+ * point to each other.
+ *
+ * This is only for internal list manipulation where we know
+ * the prev/next entries already!
+ */
+static inline void __list_del(struct list_head *prev, struct list_head *next)
+{
+	next->prev = prev;
+	prev->next = next;
+}
+
+#define LIST_POISON1  ((void *) 0x00100100)
+#define LIST_POISON2  ((void *) 0x00200200)
+/**
+ * list_del - deletes entry from list.
+ * @entry: the element to delete from the list.
+ * Note: list_empty() on entry does not return true after this, the entry is
+ * in an undefined state.
+ */
+static inline void list_del(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+	entry->next = (struct list_head*)LIST_POISON1;
+	entry->prev = (struct list_head*)LIST_POISON2;
+}
 #endif
diff --git a/support/kconfig/lkc.h b/support/kconfig/lkc.h
index f8aee5f..09f4edf 100644
--- a/support/kconfig/lkc.h
+++ b/support/kconfig/lkc.h
@@ -86,7 +86,8 @@ const char *conf_get_autoconfig_name(void);
 char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
-void conf_set_all_new_symbols(enum conf_def_mode mode);
+bool conf_set_all_new_symbols(enum conf_def_mode mode);
+void set_all_choice_values(struct symbol *csym);
 
 struct conf_printer {
 	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
diff --git a/support/kconfig/lkc_proto.h b/support/kconfig/lkc_proto.h
index ef1a738..ecdb965 100644
--- a/support/kconfig/lkc_proto.h
+++ b/support/kconfig/lkc_proto.h
@@ -14,6 +14,7 @@ P(conf_set_message_callback, void,(void (*fn)(const char *fmt, va_list ap)));
 /* menu.c */
 P(rootmenu,struct menu,);
 
+P(menu_is_empty, bool, (struct menu *menu));
 P(menu_is_visible, bool, (struct menu *menu));
 P(menu_has_prompt, bool, (struct menu *menu));
 P(menu_get_prompt,const char *,(struct menu *menu));
diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 6f6fd9d..4789b72 100644
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -4,6 +4,8 @@
 # What library to link
 ldflags()
 {
+	pkg-config --libs ncursesw 2>/dev/null && exit
+	pkg-config --libs ncurses 2>/dev/null && exit
 	for ext in so a dll.a dylib ; do
 		for lib in ncursesw ncurses curses ; do
 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
@@ -20,12 +22,12 @@ ldflags()
 ccflags()
 {
 	if [ -f /usr/include/ncursesw/curses.h ]; then
-		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncursesw/curses.h>"'
+		echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
 		echo ' -DNCURSES_WIDECHAR=1'
 	elif [ -f /usr/include/ncurses/ncurses.h ]; then
 		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"'
 	elif [ -f /usr/include/ncurses/curses.h ]; then
-		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses/curses.h>"'
+		echo '-I/usr/include/ncurses -DCURSES_LOC="<curses.h>"'
 	elif [ -f /usr/include/ncurses.h ]; then
 		echo '-DCURSES_LOC="<ncurses.h>"'
 	else
diff --git a/support/kconfig/lxdialog/checklist.c b/support/kconfig/lxdialog/checklist.c
index a2eb80f..3b15c08 100644
--- a/support/kconfig/lxdialog/checklist.c
+++ b/support/kconfig/lxdialog/checklist.c
@@ -132,16 +132,16 @@ int dialog_checklist(const char *title, const char *prompt, int height,
 	}
 
 do_resize:
-	if (getmaxy(stdscr) < (height + 6))
+	if (getmaxy(stdscr) < (height + CHECKLIST_HEIGTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) < (width + 6))
+	if (getmaxx(stdscr) < (width + CHECKLIST_WIDTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
 
 	max_choice = MIN(list_height, item_count());
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/support/kconfig/lxdialog/dialog.h b/support/kconfig/lxdialog/dialog.h
index 307022a..b4343d3 100644
--- a/support/kconfig/lxdialog/dialog.h
+++ b/support/kconfig/lxdialog/dialog.h
@@ -106,8 +106,14 @@ struct dialog_color {
 	int hl;		/* highlight this item */
 };
 
+struct subtitle_list {
+	struct subtitle_list *next;
+	const char *text;
+};
+
 struct dialog_info {
 	const char *backtitle;
+	struct subtitle_list *subtitles;
 	struct dialog_color screen;
 	struct dialog_color shadow;
 	struct dialog_color dialog;
@@ -194,8 +200,23 @@ int item_is_tag(char tag);
 int on_key_esc(WINDOW *win);
 int on_key_resize(void);
 
+/* minimum (re)size values */
+#define CHECKLIST_HEIGTH_MIN 6	/* For dialog_checklist() */
+#define CHECKLIST_WIDTH_MIN 6
+#define INPUTBOX_HEIGTH_MIN 2	/* For dialog_inputbox() */
+#define INPUTBOX_WIDTH_MIN 2
+#define MENUBOX_HEIGTH_MIN 15	/* For dialog_menu() */
+#define MENUBOX_WIDTH_MIN 65
+#define TEXTBOX_HEIGTH_MIN 8	/* For dialog_textbox() */
+#define TEXTBOX_WIDTH_MIN 8
+#define YESNO_HEIGTH_MIN 4	/* For dialog_yesno() */
+#define YESNO_WIDTH_MIN 4
+#define WINDOW_HEIGTH_MIN 19	/* For init_dialog() */
+#define WINDOW_WIDTH_MIN 80
+
 int init_dialog(const char *backtitle);
 void set_dialog_backtitle(const char *backtitle);
+void set_dialog_subtitles(struct subtitle_list *subtitles);
 void end_dialog(int x, int y);
 void attr_clear(WINDOW * win, int height, int width, chtype attr);
 void dialog_clear(void);
diff --git a/support/kconfig/lxdialog/inputbox.c b/support/kconfig/lxdialog/inputbox.c
index 21404a0..447a582 100644
--- a/support/kconfig/lxdialog/inputbox.c
+++ b/support/kconfig/lxdialog/inputbox.c
@@ -56,14 +56,14 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 		strcpy(instr, init);
 
 do_resize:
-	if (getmaxy(stdscr) <= (height - 2))
+	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) <= (width - 2))
+	if (getmaxx(stdscr) <= (width - INPUTBOX_WIDTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
index 6fc7e78..b0d0d69 100644
--- a/support/kconfig/lxdialog/menubox.c
+++ b/support/kconfig/lxdialog/menubox.c
@@ -193,7 +193,7 @@ int dialog_menu(const char *title, const char *prompt,
 do_resize:
 	height = getmaxy(stdscr);
 	width = getmaxx(stdscr);
-	if (height < 15 || width < 65)
+	if (height < MENUBOX_HEIGTH_MIN || width < MENUBOX_WIDTH_MIN)
 		return -ERRDISPLAYTOOSMALL;
 
 	height -= 4;
@@ -203,8 +203,8 @@ do_resize:
 	max_choice = MIN(menu_height, item_count());
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
@@ -303,10 +303,11 @@ do_resize:
 				}
 		}
 
-		if (i < max_choice ||
-		    key == KEY_UP || key == KEY_DOWN ||
-		    key == '-' || key == '+' ||
-		    key == KEY_PPAGE || key == KEY_NPAGE) {
+		if (item_count() != 0 &&
+		    (i < max_choice ||
+		     key == KEY_UP || key == KEY_DOWN ||
+		     key == '-' || key == '+' ||
+		     key == KEY_PPAGE || key == KEY_NPAGE)) {
 			/* Remove highligt of current item */
 			print_item(scroll + choice, choice, FALSE);
 
diff --git a/support/kconfig/lxdialog/textbox.c b/support/kconfig/lxdialog/textbox.c
index a48bb93..1773319 100644
--- a/support/kconfig/lxdialog/textbox.c
+++ b/support/kconfig/lxdialog/textbox.c
@@ -80,7 +80,7 @@ int dialog_textbox(const char *title, char *tbuf, int initial_height,
 
 do_resize:
 	getmaxyx(stdscr, height, width);
-	if (height < 8 || width < 8)
+	if (height < TEXTBOX_HEIGTH_MIN || width < TEXTBOX_WIDTH_MIN)
 		return -ERRDISPLAYTOOSMALL;
 	if (initial_height != 0)
 		height = initial_height;
@@ -98,8 +98,8 @@ do_resize:
 			width = 0;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/support/kconfig/lxdialog/util.c b/support/kconfig/lxdialog/util.c
index 109d531..58a8289 100644
--- a/support/kconfig/lxdialog/util.c
+++ b/support/kconfig/lxdialog/util.c
@@ -254,15 +254,56 @@ void attr_clear(WINDOW * win, int height, int width, chtype attr)
 
 void dialog_clear(void)
 {
-	attr_clear(stdscr, LINES, COLS, dlg.screen.atr);
+	int lines, columns;
+
+	lines = getmaxy(stdscr);
+	columns = getmaxx(stdscr);
+
+	attr_clear(stdscr, lines, columns, dlg.screen.atr);
 	/* Display background title if it exists ... - SLH */
 	if (dlg.backtitle != NULL) {
-		int i;
+		int i, len = 0, skip = 0;
+		struct subtitle_list *pos;
 
 		wattrset(stdscr, dlg.screen.atr);
 		mvwaddstr(stdscr, 0, 1, (char *)dlg.backtitle);
+
+		for (pos = dlg.subtitles; pos != NULL; pos = pos->next) {
+			/* 3 is for the arrow and spaces */
+			len += strlen(pos->text) + 3;
+		}
+
 		wmove(stdscr, 1, 1);
-		for (i = 1; i < COLS - 1; i++)
+		if (len > columns - 2) {
+			const char *ellipsis = "[...] ";
+			waddstr(stdscr, ellipsis);
+			skip = len - (columns - 2 - strlen(ellipsis));
+		}
+
+		for (pos = dlg.subtitles; pos != NULL; pos = pos->next) {
+			if (skip == 0)
+				waddch(stdscr, ACS_RARROW);
+			else
+				skip--;
+
+			if (skip == 0)
+				waddch(stdscr, ' ');
+			else
+				skip--;
+
+			if (skip < strlen(pos->text)) {
+				waddstr(stdscr, pos->text + skip);
+				skip = 0;
+			} else
+				skip -= strlen(pos->text);
+
+			if (skip == 0)
+				waddch(stdscr, ' ');
+			else
+				skip--;
+		}
+
+		for (i = len + 1; i < columns - 1; i++)
 			waddch(stdscr, ACS_HLINE);
 	}
 	wnoutrefresh(stdscr);
@@ -281,7 +322,7 @@ int init_dialog(const char *backtitle)
 	getyx(stdscr, saved_y, saved_x);
 
 	getmaxyx(stdscr, height, width);
-	if (height < 19 || width < 80) {
+	if (height < WINDOW_HEIGTH_MIN || width < WINDOW_WIDTH_MIN) {
 		endwin();
 		return -ERRDISPLAYTOOSMALL;
 	}
@@ -302,6 +343,11 @@ void set_dialog_backtitle(const char *backtitle)
 	dlg.backtitle = backtitle;
 }
 
+void set_dialog_subtitles(struct subtitle_list *subtitles)
+{
+	dlg.subtitles = subtitles;
+}
+
 /*
  * End using dialog functions.
  */
@@ -330,27 +376,19 @@ void print_title(WINDOW *dialog, const char *title, int width)
 /*
  * Print a string of text in a window, automatically wrap around to the
  * next line if the string is too long to fit on one line. Newline
- * characters '\n' are replaced by spaces.  We start on a new line
+ * characters '\n' are propperly processed.  We start on a new line
  * if there is no room for@least 4 nonblanks following a double-space.
  */
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 {
 	int newl, cur_x, cur_y;
-	int i, prompt_len, room, wlen;
-	char tempstr[MAX_LEN + 1], *word, *sp, *sp2;
+	int prompt_len, room, wlen;
+	char tempstr[MAX_LEN + 1], *word, *sp, *sp2, *newline_separator = 0;
 
 	strcpy(tempstr, prompt);
 
 	prompt_len = strlen(tempstr);
 
-	/*
-	 * Remove newlines
-	 */
-	for (i = 0; i < prompt_len; i++) {
-		if (tempstr[i] == '\n')
-			tempstr[i] = ' ';
-	}
-
 	if (prompt_len <= width - x * 2) {	/* If prompt is short */
 		wmove(win, y, (width - prompt_len) / 2);
 		waddstr(win, tempstr);
@@ -360,7 +398,10 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 		newl = 1;
 		word = tempstr;
 		while (word && *word) {
-			sp = strchr(word, ' ');
+			sp = strpbrk(word, "\n ");
+			if (sp && *sp == '\n')
+				newline_separator = sp;
+
 			if (sp)
 				*sp++ = 0;
 
@@ -372,7 +413,7 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			if (wlen > room ||
 			    (newl && wlen < 4 && sp
 			     && wlen + 1 + strlen(sp) > room
-			     && (!(sp2 = strchr(sp, ' '))
+			     && (!(sp2 = strpbrk(sp, "\n "))
 				 || wlen + 1 + (sp2 - sp) > room))) {
 				cur_y++;
 				cur_x = x;
@@ -380,7 +421,15 @@ void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x)
 			wmove(win, cur_y, cur_x);
 			waddstr(win, word);
 			getyx(win, cur_y, cur_x);
-			cur_x++;
+
+			/* Move to the next line if the word separator was a newline */
+			if (newline_separator) {
+				cur_y++;
+				cur_x = x;
+				newline_separator = 0;
+			} else
+				cur_x++;
+
 			if (sp && *sp == ' ') {
 				cur_x++;	/* double space */
 				while (*++sp == ' ') ;
diff --git a/support/kconfig/lxdialog/yesno.c b/support/kconfig/lxdialog/yesno.c
index 4e6e809..676fb2f 100644
--- a/support/kconfig/lxdialog/yesno.c
+++ b/support/kconfig/lxdialog/yesno.c
@@ -45,14 +45,14 @@ int dialog_yesno(const char *title, const char *prompt, int height, int width)
 	WINDOW *dialog;
 
 do_resize:
-	if (getmaxy(stdscr) < (height + 4))
+	if (getmaxy(stdscr) < (height + YESNO_HEIGTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
-	if (getmaxx(stdscr) < (width + 4))
+	if (getmaxx(stdscr) < (width + YESNO_WIDTH_MIN))
 		return -ERRDISPLAYTOOSMALL;
 
 	/* center dialog box on screen */
-	x = (COLS - width) / 2;
-	y = (LINES - height) / 2;
+	x = (getmaxx(stdscr) - width) / 2;
+	y = (getmaxy(stdscr) - height) / 2;
 
 	draw_shadow(stdscr, y, x, height, width);
 
diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index fa61759..35e07e0 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -48,7 +48,7 @@ static const char mconf_readme[] = N_(
 "----------\n"
 "o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
 "   you wish to change or submenu wish to select and press <Enter>.\n"
-"   Submenus are designated by \"--->\".\n"
+"   Submenus are designated by \"--->\", empty ones by \"----\".\n"
 "\n"
 "   Shortcut: Press the option's highlighted letter (hotkey).\n"
 "             Pressing a hotkey more than once will sequence\n"
@@ -176,7 +176,7 @@ static const char mconf_readme[] = N_(
 "\n"),
 menu_instructions[] = N_(
 	"Arrow keys navigate the menu.  "
-	"<Enter> selects submenus --->.  "
+	"<Enter> selects submenus ---> (or empty submenus ----).  "
 	"Highlighted letters are hotkeys.  "
 	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
@@ -311,6 +311,50 @@ static void set_config_filename(const char *config_filename)
 		filename[sizeof(filename)-1] = '\0';
 }
 
+struct subtitle_part {
+	struct list_head entries;
+	const char *text;
+};
+static LIST_HEAD(trail);
+
+static struct subtitle_list *subtitles;
+static void set_subtitle(void)
+{
+	struct subtitle_part *sp;
+	struct subtitle_list *pos, *tmp;
+
+	for (pos = subtitles; pos != NULL; pos = tmp) {
+		tmp = pos->next;
+		free(pos);
+	}
+
+	subtitles = NULL;
+	list_for_each_entry(sp, &trail, entries) {
+		if (sp->text) {
+			if (pos) {
+				pos->next = xcalloc(sizeof(*pos), 1);
+				pos = pos->next;
+			} else {
+				subtitles = pos = xcalloc(sizeof(*pos), 1);
+			}
+			pos->text = sp->text;
+		}
+	}
+
+	set_dialog_subtitles(subtitles);
+}
+
+static void reset_subtitle(void)
+{
+	struct subtitle_list *pos, *tmp;
+
+	for (pos = subtitles; pos != NULL; pos = tmp) {
+		tmp = pos->next;
+		free(pos);
+	}
+	subtitles = NULL;
+	set_dialog_subtitles(subtitles);
+}
 
 struct search_data {
 	struct list_head *head;
@@ -353,10 +397,12 @@ static void search_conf(void)
 	char *dialog_input;
 	int dres, vscroll = 0, hscroll = 0;
 	bool again;
+	struct gstr sttext;
+	struct subtitle_part stpart;
 
 	title = str_new();
-	str_printf( &title, _("Enter %s (sub)string to search for "
-			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+	str_printf( &title, _("Enter (sub)string or regexp to search for "
+			      "(with or without \"%s\")"), CONFIG_);
 
 again:
 	dialog_clear();
@@ -379,6 +425,11 @@ again:
 	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
 		dialog_input += strlen(CONFIG_);
 
+	sttext = str_new();
+	str_printf(&sttext, "Search (%s)", dialog_input_result);
+	stpart.text = str_get(&sttext);
+	list_add_tail(&stpart.entries, &trail);
+
 	sym_arr = sym_re_search(dialog_input);
 	do {
 		LIST_HEAD(head);
@@ -389,8 +440,10 @@ again:
 			.targets = targets,
 			.keys = keys,
 		};
+		struct jump_key *pos, *tmp;
 
 		res = get_relations_str(sym_arr, &head);
+		set_subtitle();
 		dres = show_textbox_ext(_("Search Results"), (char *)
 					str_get(&res), 0, 0, keys, &vscroll,
 					&hscroll, &update_text, (void *)
@@ -402,9 +455,13 @@ again:
 				again = true;
 			}
 		str_free(&res);
+		list_for_each_entry_safe(pos, tmp, &head, entries)
+			free(pos);
 	} while (again);
 	free(sym_arr);
 	str_free(&title);
+	list_del(trail.prev);
+	str_free(&sttext);
 }
 
 static void build_conf(struct menu *menu)
@@ -441,8 +498,9 @@ static void build_conf(struct menu *menu)
 						  menu->data ? "-->" : "++>",
 						  indent + 1, ' ', prompt);
 				} else
-					item_make("   %*c%s  --->", indent + 1, ' ', prompt);
-
+					item_make("   %*c%s  %s",
+						  indent + 1, ' ', prompt,
+						  menu_is_empty(menu) ? "----" : "--->");
 				item_set_tag('m');
 				item_set_data(menu);
 				if (single_menu_mode && menu->data)
@@ -573,7 +631,7 @@ static void build_conf(struct menu *menu)
 			  (sym_has_value(sym) || !sym_is_changable(sym)) ?
 			  "" : _(" (NEW)"));
 		if (menu->prompt->type == P_MENU) {
-			item_add_str("  --->");
+			item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
 			return;
 		}
 	}
@@ -589,27 +647,36 @@ static void conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu;
 	const char *prompt = menu_get_prompt(menu);
+	struct subtitle_part stpart;
 	struct symbol *sym;
 	int res;
 	int s_scroll = 0;
 
+	if (menu != &rootmenu)
+		stpart.text = menu_get_prompt(menu);
+	else
+		stpart.text = NULL;
+	list_add_tail(&stpart.entries, &trail);
+
 	while (1) {
 		item_reset();
 		current_menu = menu;
 		build_conf(menu);
 		if (!child_count)
 			break;
+		set_subtitle();
 		dialog_clear();
 		res = dialog_menu(prompt ? _(prompt) : _("Main Menu"),
 				  _(menu_instructions),
 				  active_menu, &s_scroll);
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
 			break;
-		if (!item_activate_selected())
-			continue;
-		if (!item_tag())
-			continue;
-
+		if (item_count() != 0) {
+			if (!item_activate_selected())
+				continue;
+			if (!item_tag())
+				continue;
+		}
 		submenu = item_data();
 		active_menu = item_data();
 		if (submenu)
@@ -640,13 +707,17 @@ static void conf(struct menu *menu, struct menu *active_menu)
 		case 2:
 			if (sym)
 				show_help(submenu);
-			else
+			else {
+				reset_subtitle();
 				show_helptext(_("README"), _(mconf_readme));
+			}
 			break;
 		case 3:
+			reset_subtitle();
 			conf_save();
 			break;
 		case 4:
+			reset_subtitle();
 			conf_load();
 			break;
 		case 5:
@@ -679,6 +750,8 @@ static void conf(struct menu *menu, struct menu *active_menu)
 			break;
 		}
 	}
+
+	list_del(trail.prev);
 }
 
 static int show_textbox_ext(const char *title, char *text, int r, int c, int
@@ -754,7 +827,9 @@ static void conf_choice(struct menu *menu)
 		dialog_clear();
 		res = dialog_checklist(prompt ? _(prompt) : _("Main Menu"),
 					_(radiolist_instructions),
-					 15, 70, 6);
+					MENUBOX_HEIGTH_MIN,
+					MENUBOX_WIDTH_MIN,
+					CHECKLIST_HEIGTH_MIN);
 		selected = item_activate_selected();
 		switch (res) {
 		case 0:
@@ -881,11 +956,12 @@ static int handle_exit(void)
 	int res;
 
 	save_and_exit = 1;
+	reset_subtitle();
 	dialog_clear();
 	if (conf_get_changed())
 		res = dialog_yesno(NULL,
-				   _("Do you wish to save your new configuration ?\n"
-				     "<ESC><ESC> to continue."),
+				   _("Do you wish to save your new configuration?\n"
+				     "(Press <ESC><ESC> to continue kernel configuration.)"),
 				   6, 60);
 	else
 		res = -1;
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index f3bffa3..c1d5320 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -146,11 +146,24 @@ struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *e
 			struct menu *menu = current_entry;
 
 			while ((menu = menu->parent) != NULL) {
+				struct expr *dup_expr;
+
 				if (!menu->visibility)
 					continue;
+				/*
+				 * Do not add a reference to the
+				 * menu's visibility expression but
+				 * use a copy of it.  Otherwise the
+				 * expression reduction functions
+				 * will modify expressions that have
+				 * multiple references which can
+				 * cause unwanted side effects.
+				 */
+				dup_expr = expr_copy(menu->visibility);
+
 				prop->visible.expr
 					= expr_alloc_and(prop->visible.expr,
-							 menu->visibility);
+							 dup_expr);
 			}
 		}
 
@@ -184,12 +197,15 @@ void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep)
 
 void menu_add_option(int token, char *arg)
 {
-	struct property *prop;
-
 	switch (token) {
 	case T_OPT_MODULES:
-		prop = prop_alloc(P_DEFAULT, modules_sym);
-		prop->expr = expr_alloc_symbol(current_entry->sym);
+		if (modules_sym)
+			zconf_error("symbol '%s' redefines option 'modules'"
+				    " already defined by symbol '%s'",
+				    current_entry->sym->name,
+				    modules_sym->name
+				    );
+		modules_sym = current_entry->sym;
 		break;
 	case T_OPT_DEFCONFIG_LIST:
 		if (!sym_defconfig_list)
@@ -430,6 +446,22 @@ bool menu_has_prompt(struct menu *menu)
 	return true;
 }
 
+/*
+ * Determine if a menu is empty.
+ * A menu is considered empty if it contains no or only
+ * invisible entries.
+ */
+bool menu_is_empty(struct menu *menu)
+{
+	struct menu *child;
+
+	for (child = menu->list; child; child = child->next) {
+		if (menu_is_visible(child))
+			return(false);
+	}
+	return(true);
+}
+
 bool menu_is_visible(struct menu *menu)
 {
 	struct menu *child;
@@ -515,13 +547,6 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 	struct jump_key *jump;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
-	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
-		prop->menu->lineno);
-	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, _("  Depends on: "));
-		expr_gstr_print(prop->visible.expr, r);
-		str_append(r, "\n");
-	}
 	menu = prop->menu->parent;
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
 		bool accessible = menu_is_visible(menu);
@@ -572,6 +597,18 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 }
 
 /*
+ * get peoperty of type P_SYMBOL
+ */
+static struct property *get_symbol_prop(struct symbol *sym)
+{
+	struct property *prop = NULL;
+
+	for_all_properties(sym, prop, P_SYMBOL)
+		break;
+	return prop;
+}
+
+/*
  * head is optional and may be NULL
  */
 void get_symbol_str(struct gstr *r, struct symbol *sym,
@@ -595,6 +632,18 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
 	}
 	for_all_prompts(sym, prop)
 		get_prompt_str(r, prop, head);
+
+	prop = get_symbol_prop(sym);
+	if (prop) {
+		str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
+			prop->menu->lineno);
+		if (!expr_is_yes(prop->visible.expr)) {
+			str_append(r, _("  Depends on: "));
+			expr_gstr_print(prop->visible.expr, r);
+			str_append(r, "\n");
+		}
+	}
+
 	hit = false;
 	for_all_properties(sym, prop, P_SELECT) {
 		if (!hit) {
diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 05274fc..81b0c61 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -120,10 +120,18 @@ if [ "$MAKE" = "false" ]; then
 	exit
 fi
 
+# If we have an output dir, setup the O= argument, otherwise leave
+# it blank, since O=. will create an unnecessary ./source softlink
+OUTPUT_ARG=""
+if [ "$OUTPUT" != "." ] ; then
+	OUTPUT_ARG="O=$OUTPUT"
+fi
+
+
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE O=$OUTPUT $ALLTARGET
+make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index dbf31ed..4fbecd2 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -45,8 +45,8 @@ static const char nconf_global_help[] = N_(
 "<n> to remove it.  You may press the <Space> key to cycle through the\n"
 "available options.\n"
 "\n"
-"A trailing \"--->\" designates a submenu.\n"
-"\n"
+"A trailing \"--->\" designates a submenu, a trailing \"----\" an\n"
+"empty submenu.\n"
 "\n"
 "Menu navigation keys\n"
 "----------------------------------------------------------------------\n"
@@ -131,7 +131,7 @@ static const char nconf_global_help[] = N_(
 "\n"),
 menu_no_f_instructions[] = N_(
 "Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-"Submenus are designated by a trailing \"--->\".\n"
+"Submenus are designated by a trailing \"--->\", empty ones by \"----\".\n"
 "\n"
 "Use the following keys to navigate the menus:\n"
 "Move up or down with <Up> and <Down>.\n"
@@ -148,7 +148,7 @@ menu_no_f_instructions[] = N_(
 "For help related to the current menu entry press <?> or <h>.\n"),
 menu_instructions[] = N_(
 "Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-"Submenus are designated by a trailing \"--->\".\n"
+"Submenus are designated by a trailing \"--->\", empty ones by \"----\".\n"
 "\n"
 "Use the following keys to navigate the menus:\n"
 "Move up or down with <Up> or <Down>.\n"
@@ -365,15 +365,16 @@ static void print_function_line(void)
 	int i;
 	int offset = 1;
 	const int skip = 1;
+	int lines = getmaxy(stdscr);
 
 	for (i = 0; i < function_keys_num; i++) {
 		(void) wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
-		mvwprintw(main_window, LINES-3, offset,
+		mvwprintw(main_window, lines-3, offset,
 				"%s",
 				function_keys[i].key_str);
 		(void) wattrset(main_window, attributes[FUNCTION_TEXT]);
 		offset += strlen(function_keys[i].key_str);
-		mvwprintw(main_window, LINES-3,
+		mvwprintw(main_window, lines-3,
 				offset, "%s",
 				function_keys[i].func);
 		offset += strlen(function_keys[i].func) + skip;
@@ -694,8 +695,8 @@ static void search_conf(void)
 	int dres;
 
 	title = str_new();
-	str_printf( &title, _("Enter %s (sub)string to search for "
-			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+	str_printf( &title, _("Enter (sub)string or regexp to search for "
+			      "(with or without \"%s\")"), CONFIG_);
 
 again:
 	dres = dialog_inputbox(main_window,
@@ -759,9 +760,9 @@ static void build_conf(struct menu *menu)
 						indent + 1, ' ', prompt);
 				} else
 					item_make(menu, 'm',
-						"   %*c%s  --->",
-						indent + 1,
-						' ', prompt);
+						  "   %*c%s  %s",
+						  indent + 1, ' ', prompt,
+						  menu_is_empty(menu) ? "----" : "--->");
 
 				if (single_menu_mode && menu->data)
 					goto conf_childs;
@@ -903,7 +904,7 @@ static void build_conf(struct menu *menu)
 				(sym_has_value(sym) || !sym_is_changable(sym)) ?
 				"" : _(" (NEW)"));
 		if (menu->prompt && menu->prompt->type == P_MENU) {
-			item_add_str("  --->");
+			item_add_str("  %s", menu_is_empty(menu) ? "----" : "--->");
 			return;
 		}
 	}
@@ -954,7 +955,7 @@ static void show_menu(const char *prompt, const char *instructions,
 
 	clear();
 	(void) wattrset(main_window, attributes[NORMAL]);
-	print_in_middle(stdscr, 1, 0, COLS,
+	print_in_middle(stdscr, 1, 0, getmaxx(stdscr),
 			menu_backtitle,
 			attributes[MAIN_HEADING]);
 
@@ -1455,14 +1456,18 @@ static void conf_save(void)
 
 void setup_windows(void)
 {
+	int lines, columns;
+
+	getmaxyx(stdscr, lines, columns);
+
 	if (main_window != NULL)
 		delwin(main_window);
 
 	/* set up the menu and menu window */
-	main_window = newwin(LINES-2, COLS-2, 2, 1);
+	main_window = newwin(lines-2, columns-2, 2, 1);
 	keypad(main_window, TRUE);
-	mwin_max_lines = LINES-7;
-	mwin_max_cols = COLS-6;
+	mwin_max_lines = lines-7;
+	mwin_max_cols = columns-6;
 
 	/* panels order is from bottom to top */
 	new_panel(main_window);
@@ -1470,6 +1475,7 @@ void setup_windows(void)
 
 int main(int ac, char **av)
 {
+	int lines, columns;
 	char *mode;
 
 	setlocale(LC_ALL, "");
@@ -1495,7 +1501,8 @@ int main(int ac, char **av)
 	keypad(stdscr, TRUE);
 	curs_set(0);
 
-	if (COLS < 75 || LINES < 20) {
+	getmaxyx(stdscr, lines, columns);
+	if (columns < 75 || lines < 20) {
 		endwin();
 		printf("Your terminal should have@"
 			"least 20 lines and 75 columns\n");
diff --git a/support/kconfig/nconf.gui.c b/support/kconfig/nconf.gui.c
index 9f8c44e..8275f0e 100644
--- a/support/kconfig/nconf.gui.c
+++ b/support/kconfig/nconf.gui.c
@@ -276,8 +276,8 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 
 	total_width = max(msg_width, btns_width);
 	/* place dialog in middle of screen */
-	y = (LINES-(msg_lines+4))/2;
-	x = (COLS-(total_width+4))/2;
+	y = (getmaxy(stdscr)-(msg_lines+4))/2;
+	x = (getmaxx(stdscr)-(total_width+4))/2;
 
 
 	/* create the windows */
@@ -387,8 +387,8 @@ int dialog_inputbox(WINDOW *main_window,
 		prompt_width = max(prompt_width, strlen(title));
 
 	/* place dialog in middle of screen */
-	y = (LINES-(prompt_lines+4))/2;
-	x = (COLS-(prompt_width+4))/2;
+	y = (getmaxy(stdscr)-(prompt_lines+4))/2;
+	x = (getmaxx(stdscr)-(prompt_width+4))/2;
 
 	strncpy(result, init, *result_len);
 
@@ -545,7 +545,7 @@ void show_scroll_win(WINDOW *main_window,
 {
 	int res;
 	int total_lines = get_line_no(text);
-	int x, y;
+	int x, y, lines, columns;
 	int start_x = 0, start_y = 0;
 	int text_lines = 0, text_cols = 0;
 	int total_cols = 0;
@@ -556,6 +556,8 @@ void show_scroll_win(WINDOW *main_window,
 	WINDOW *pad;
 	PANEL *panel;
 
+	getmaxyx(stdscr, lines, columns);
+
 	/* find the widest line of msg: */
 	total_lines = get_line_no(text);
 	for (i = 0; i < total_lines; i++) {
@@ -569,14 +571,14 @@ void show_scroll_win(WINDOW *main_window,
 	(void) wattrset(pad, attributes[SCROLLWIN_TEXT]);
 	fill_window(pad, text);
 
-	win_lines = min(total_lines+4, LINES-2);
-	win_cols = min(total_cols+2, COLS-2);
+	win_lines = min(total_lines+4, lines-2);
+	win_cols = min(total_cols+2, columns-2);
 	text_lines = max(win_lines-4, 0);
 	text_cols = max(win_cols-2, 0);
 
 	/* place window in middle of screen */
-	y = (LINES-win_lines)/2;
-	x = (COLS-win_cols)/2;
+	y = (lines-win_lines)/2;
+	x = (columns-win_cols)/2;
 
 	win = newwin(win_lines, win_cols, y, x);
 	keypad(win, TRUE);
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index d7206a0..25b436b 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -25,7 +25,7 @@ Index: b/mconf.c
 +++ b/mconf.c
 @@ -178,9 +178,9 @@
  	"Arrow keys navigate the menu.  "
- 	"<Enter> selects submenus --->.  "
+ 	"<Enter> selects submenus ---> (or empty submenus ----).  "
  	"Highlighted letters are hotkeys.  "
 -	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
 +	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
@@ -39,10 +39,10 @@ Index: b/zconf.tab.c_shipped
 ===================================================================
 --- a/zconf.tab.c_shipped
 +++ b/zconf.tab.c_shipped
-@@ -2259,7 +2259,7 @@
- 	modules_sym = sym_lookup(NULL, 0);
- 	modules_sym->type = S_BOOLEAN;
- 	modules_sym->flags |= SYMBOL_AUTO;
+@@ -2297,7 +2297,7 @@
+ 
+ 	sym_init();
+ 	_menu_init();
 -	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 +	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
  
@@ -52,10 +52,10 @@ Index: b/zconf.y
 ===================================================================
 --- a/zconf.y
 +++ b/zconf.y
-@@ -496,7 +496,7 @@
- 	modules_sym = sym_lookup(NULL, 0);
- 	modules_sym->type = S_BOOLEAN;
- 	modules_sym->flags |= SYMBOL_AUTO;
+@@ -493,7 +493,7 @@
+ 
+ 	sym_init();
+ 	_menu_init();
 -	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 +	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
  
@@ -65,7 +65,7 @@ Index: b/confdata.c
 ===================================================================
 --- a/confdata.c
 +++ b/confdata.c
-@@ -25,7 +26,7 @@
+@@ -25,7 +25,7 @@
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
  
@@ -74,7 +74,7 @@ Index: b/confdata.c
  
  static void conf_warning(const char *fmt, ...)
  {
-@@ -63,7 +64,7 @@
+@@ -63,7 +63,7 @@
  
  const char *conf_get_configname(void)
  {
diff --git a/support/kconfig/patches/09-implement-kconfig-probability.patch b/support/kconfig/patches/09-implement-kconfig-probability.patch
deleted file mode 100644
index 45fa251..0000000
--- a/support/kconfig/patches/09-implement-kconfig-probability.patch
+++ /dev/null
@@ -1,44 +0,0 @@
----
- confdata.c |   22 +++++++++++++++++++---
- 1 file changed, 19 insertions(+), 3 deletions(-)
-
-Index: b/confdata.c
-===================================================================
---- a/confdata.c
-+++ b/confdata.c
-@@ -1106,7 +1106,16 @@
- void conf_set_all_new_symbols(enum conf_def_mode mode)
- {
- 	struct symbol *sym, *csym;
--	int i, cnt;
-+	int i, cnt, prob = 50;
-+
-+	if (mode == def_random) {
-+		char *endp, *env = getenv("KCONFIG_PROBABILITY");
-+		if (env && *env) {
-+			int tmp = (int)strtol(env, &endp, 10);
-+			if (*endp == '\0' && tmp >= 0 && tmp <= 100)
-+				prob = tmp;
-+		}
-+	}
- 
- 	for_all_symbols(i, sym) {
- 		if (sym_has_value(sym))
-@@ -1125,8 +1134,15 @@
- 				sym->def[S_DEF_USER].tri = no;
- 				break;
- 			case def_random:
--				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
--				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
-+				cnt = (rand() % 100) - (100 - prob);
-+				if (cnt < 0)
-+					sym->def[S_DEF_USER].tri = no;
-+				else
-+					if ((sym_get_type(sym) == S_TRISTATE)
-+					    && (cnt > prob/2))
-+						sym->def[S_DEF_USER].tri = mod;
-+					else
-+						sym->def[S_DEF_USER].tri = yes;
- 				break;
- 			default:
- 				continue;
diff --git a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
index 1e0c803..b38af26 100644
--- a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
+++ b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
@@ -6,7 +6,7 @@ Index: b/lxdialog/check-lxdialog.sh
 ===================================================================
 --- a/lxdialog/check-lxdialog.sh
 +++ b/lxdialog/check-lxdialog.sh
-@@ -34,7 +34,7 @@
+@@ -36,7 +36,7 @@
  }
  
  # Temp file, try to clean up after us
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index e764fb2..ec3134f 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -8,7 +8,7 @@ Index: b/conf.c
 ===================================================================
 --- a/conf.c
 +++ b/conf.c
-@@ -547,7 +547,6 @@
+@@ -558,7 +558,6 @@
  	}
  	name = av[optind];
  	conf_parse(name);
@@ -39,7 +39,7 @@ Index: b/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -737,6 +736,9 @@
+@@ -742,6 +741,9 @@
  	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
@@ -49,7 +49,7 @@ Index: b/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -831,6 +833,7 @@
+@@ -836,6 +838,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -57,7 +57,7 @@ Index: b/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -839,8 +842,20 @@
+@@ -844,8 +847,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -80,7 +80,7 @@ Index: b/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -933,9 +948,11 @@
+@@ -938,9 +953,11 @@
  		close(fd);
  	}
  out:
@@ -95,7 +95,7 @@ Index: b/confdata.c
  	return res;
  }
  
-@@ -945,25 +962,38 @@
+@@ -950,25 +967,38 @@
  	const char *name;
  	FILE *out, *tristate, *out_h;
  	int i;
@@ -138,7 +138,7 @@ Index: b/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -995,19 +1025,22 @@
+@@ -1000,19 +1030,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
diff --git a/support/kconfig/patches/15-fix-qconf-moc-rule.patch b/support/kconfig/patches/15-fix-qconf-moc-rule.patch
index eae978e..c1848d7 100644
--- a/support/kconfig/patches/15-fix-qconf-moc-rule.patch
+++ b/support/kconfig/patches/15-fix-qconf-moc-rule.patch
@@ -9,7 +9,7 @@ Index: b/Makefile
 ===================================================================
 --- a/Makefile
 +++ b/Makefile
-@@ -307,11 +307,8 @@
+@@ -309,11 +309,8 @@
  
  $(obj)/qconf.o: $(obj)/qconf.moc
  
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index a3e9843..9154d83 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -1,6 +1,5 @@
 01-kconfig-kernel-to-buildroot.patch
 06-br-build-system-integration.patch
-09-implement-kconfig-probability.patch
 10-br-build-system.patch
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
diff --git a/support/kconfig/streamline_config.pl b/support/kconfig/streamline_config.pl
index 3368939..4606cdf 100644
--- a/support/kconfig/streamline_config.pl
+++ b/support/kconfig/streamline_config.pl
@@ -156,7 +156,6 @@ sub read_kconfig {
 
     my $state = "NONE";
     my $config;
-    my @kconfigs;
 
     my $cont = 0;
     my $line;
@@ -190,7 +189,13 @@ sub read_kconfig {
 
 	# collect any Kconfig sources
 	if (/^source\s*"(.*)"/) {
-	    $kconfigs[$#kconfigs+1] = $1;
+	    my $kconfig = $1;
+	    # prevent reading twice.
+	    if (!defined($read_kconfigs{$kconfig})) {
+		$read_kconfigs{$kconfig} = 1;
+		read_kconfig($kconfig);
+	    }
+	    next;
 	}
 
 	# configs found
@@ -250,14 +255,6 @@ sub read_kconfig {
 	}
     }
     close($kinfile);
-
-    # read in any configs that were found.
-    foreach my $kconfig (@kconfigs) {
-	if (!defined($read_kconfigs{$kconfig})) {
-	    $read_kconfigs{$kconfig} = 1;
-	    read_kconfig($kconfig);
-	}
-    }
 }
 
 if ($kconfig) {
@@ -396,6 +393,15 @@ foreach my $module (keys(%modules)) {
 	foreach my $conf (@arr) {
 	    $configs{$conf} = $module;
 	    dprint "$conf added by direct ($module)\n";
+	    if ($debugprint) {
+		my $c=$conf;
+		$c =~ s/^CONFIG_//;
+		if (defined($depends{$c})) {
+		    dprint " deps = $depends{$c}\n";
+		} else {
+		    dprint " no deps\n";
+		}
+	    }
 	}
     } else {
 	# Most likely, someone has a custom (binary?) module loaded.
diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
index ecc5aa5..c9a6775 100644
--- a/support/kconfig/symbol.c
+++ b/support/kconfig/symbol.c
@@ -136,7 +136,7 @@ static struct property *sym_get_range_prop(struct symbol *sym)
 	return NULL;
 }
 
-static int sym_get_range_val(struct symbol *sym, int base)
+static long long sym_get_range_val(struct symbol *sym, int base)
 {
 	sym_calc_value(sym);
 	switch (sym->type) {
@@ -149,13 +149,14 @@ static int sym_get_range_val(struct symbol *sym, int base)
 	default:
 		break;
 	}
-	return strtol(sym->curr.val, NULL, base);
+	return strtoll(sym->curr.val, NULL, base);
 }
 
 static void sym_validate_range(struct symbol *sym)
 {
 	struct property *prop;
-	int base, val, val2;
+	int base;
+	long long val, val2;
 	char str[64];
 
 	switch (sym->type) {
@@ -171,7 +172,7 @@ static void sym_validate_range(struct symbol *sym)
 	prop = sym_get_range_prop(sym);
 	if (!prop)
 		return;
-	val = strtol(sym->curr.val, NULL, base);
+	val = strtoll(sym->curr.val, NULL, base);
 	val2 = sym_get_range_val(prop->expr->left.sym, base);
 	if (val >= val2) {
 		val2 = sym_get_range_val(prop->expr->right.sym, base);
@@ -179,9 +180,9 @@ static void sym_validate_range(struct symbol *sym)
 			return;
 	}
 	if (sym->type == S_INT)
-		sprintf(str, "%d", val2);
+		sprintf(str, "%lld", val2);
 	else
-		sprintf(str, "0x%x", val2);
+		sprintf(str, "0x%llx", val2);
 	sym->curr.val = strdup(str);
 }
 
@@ -300,6 +301,14 @@ void sym_calc_value(struct symbol *sym)
 
 	if (sym->flags & SYMBOL_VALID)
 		return;
+
+	if (sym_is_choice_value(sym) &&
+	    sym->flags & SYMBOL_NEED_SET_CHOICE_VALUES) {
+		sym->flags &= ~SYMBOL_NEED_SET_CHOICE_VALUES;
+		prop = sym_get_choice_prop(sym);
+		sym_calc_value(prop_get_symbol(prop));
+	}
+
 	sym->flags |= SYMBOL_VALID;
 
 	oldval = sym->curr;
@@ -425,6 +434,9 @@ void sym_calc_value(struct symbol *sym)
 
 	if (sym->flags & SYMBOL_AUTO)
 		sym->flags &= ~SYMBOL_WRITE;
+
+	if (sym->flags & SYMBOL_NEED_SET_CHOICE_VALUES)
+		set_all_choice_values(sym);
 }
 
 void sym_clear_all_valid(void)
@@ -583,7 +595,7 @@ bool sym_string_valid(struct symbol *sym, const char *str)
 bool sym_string_within_range(struct symbol *sym, const char *str)
 {
 	struct property *prop;
-	int val;
+	long long val;
 
 	switch (sym->type) {
 	case S_STRING:
@@ -594,7 +606,7 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 		prop = sym_get_range_prop(sym);
 		if (!prop)
 			return true;
-		val = strtol(str, NULL, 10);
+		val = strtoll(str, NULL, 10);
 		return val >= sym_get_range_val(prop->expr->left.sym, 10) &&
 		       val <= sym_get_range_val(prop->expr->right.sym, 10);
 	case S_HEX:
@@ -603,7 +615,7 @@ bool sym_string_within_range(struct symbol *sym, const char *str)
 		prop = sym_get_range_prop(sym);
 		if (!prop)
 			return true;
-		val = strtol(str, NULL, 16);
+		val = strtoll(str, NULL, 16);
 		return val >= sym_get_range_val(prop->expr->left.sym, 16) &&
 		       val <= sym_get_range_val(prop->expr->right.sym, 16);
 	case S_BOOLEAN:
@@ -943,38 +955,89 @@ const char *sym_escape_string_value(const char *in)
 	return res;
 }
 
+struct sym_match {
+	struct symbol	*sym;
+	off_t		so, eo;
+};
+
+/* Compare matched symbols as thus:
+ * - first, symbols that match exactly
+ * - then, alphabetical sort
+ */
+static int sym_rel_comp(const void *sym1, const void *sym2)
+{
+	const struct sym_match *s1 = sym1;
+	const struct sym_match *s2 = sym2;
+	int exact1, exact2;
+
+	/* Exact match:
+	 * - if matched length on symbol s1 is the length of that symbol,
+	 *   then this symbol should come first;
+	 * - if matched length on symbol s2 is the length of that symbol,
+	 *   then this symbol should come first.
+	 * Note: since the search can be a regexp, both symbols may match
+	 * exactly; if this is the case, we can't decide which comes first,
+	 * and we fallback to sorting alphabetically.
+	 */
+	exact1 = (s1->eo - s1->so) == strlen(s1->sym->name);
+	exact2 = (s2->eo - s2->so) == strlen(s2->sym->name);
+	if (exact1 && !exact2)
+		return -1;
+	if (!exact1 && exact2)
+		return 1;
+
+	/* As a fallback, sort symbols alphabetically */
+	return strcmp(s1->sym->name, s2->sym->name);
+}
+
 struct symbol **sym_re_search(const char *pattern)
 {
 	struct symbol *sym, **sym_arr = NULL;
+	struct sym_match *sym_match_arr = NULL;
 	int i, cnt, size;
 	regex_t re;
+	regmatch_t match[1];
 
 	cnt = size = 0;
 	/* Skip if empty */
 	if (strlen(pattern) == 0)
 		return NULL;
-	if (regcomp(&re, pattern, REG_EXTENDED|REG_NOSUB|REG_ICASE))
+	if (regcomp(&re, pattern, REG_EXTENDED|REG_ICASE))
 		return NULL;
 
 	for_all_symbols(i, sym) {
 		if (sym->flags & SYMBOL_CONST || !sym->name)
 			continue;
-		if (regexec(&re, sym->name, 0, NULL, 0))
+		if (regexec(&re, sym->name, 1, match, 0))
 			continue;
-		if (cnt + 1 >= size) {
-			void *tmp = sym_arr;
+		if (cnt >= size) {
+			void *tmp;
 			size += 16;
-			sym_arr = realloc(sym_arr, size * sizeof(struct symbol *));
-			if (!sym_arr) {
-				free(tmp);
-				return NULL;
-			}
+			tmp = realloc(sym_match_arr, size * sizeof(struct sym_match));
+			if (!tmp)
+				goto sym_re_search_free;
+			sym_match_arr = tmp;
 		}
 		sym_calc_value(sym);
-		sym_arr[cnt++] = sym;
+		/* As regexec returned 0, we know we have a match, so
+		 * we can use match[0].rm_[se]o without further checks
+		 */
+		sym_match_arr[cnt].so = match[0].rm_so;
+		sym_match_arr[cnt].eo = match[0].rm_eo;
+		sym_match_arr[cnt++].sym = sym;
 	}
-	if (sym_arr)
+	if (sym_match_arr) {
+		qsort(sym_match_arr, cnt, sizeof(struct sym_match), sym_rel_comp);
+		sym_arr = malloc((cnt+1) * sizeof(struct symbol));
+		if (!sym_arr)
+			goto sym_re_search_free;
+		for (i = 0; i < cnt; i++)
+			sym_arr[i] = sym_match_arr[i].sym;
 		sym_arr[cnt] = NULL;
+	}
+sym_re_search_free:
+	/* sym_match_arr can be NULL if no match, but free(NULL) is OK */
+	free(sym_match_arr);
 	regfree(&re);
 
 	return sym_arr;
diff --git a/support/kconfig/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
index 47fa849..f343030 100644
--- a/support/kconfig/zconf.tab.c_shipped
+++ b/support/kconfig/zconf.tab.c_shipped
@@ -1,9 +1,8 @@
-/* A Bison parser, made by GNU Bison 2.4.3.  */
+/* A Bison parser, made by GNU Bison 2.5.  */
 
-/* Skeleton implementation for Bison's Yacc-like parsers in C
+/* Bison implementation for Yacc-like parsers in C
    
-      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
-   2009, 2010 Free Software Foundation, Inc.
+      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -45,7 +44,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.4.3"
+#define YYBISON_VERSION "2.5"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -302,11 +301,11 @@ YYID (yyi)
 #    define alloca _alloca
 #   else
 #    define YYSTACK_ALLOC alloca
-#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
+#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 #     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
-#     ifndef _STDLIB_H
-#      define _STDLIB_H 1
+#     ifndef EXIT_SUCCESS
+#      define EXIT_SUCCESS 0
 #     endif
 #    endif
 #   endif
@@ -329,24 +328,24 @@ YYID (yyi)
 #  ifndef YYSTACK_ALLOC_MAXIMUM
 #   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
 #  endif
-#  if (defined __cplusplus && ! defined _STDLIB_H \
+#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
        && ! ((defined YYMALLOC || defined malloc) \
 	     && (defined YYFREE || defined free)))
 #   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
-#   ifndef _STDLIB_H
-#    define _STDLIB_H 1
+#   ifndef EXIT_SUCCESS
+#    define EXIT_SUCCESS 0
 #   endif
 #  endif
 #  ifndef YYMALLOC
 #   define YYMALLOC malloc
-#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
+#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
 #   endif
 #  endif
 #  ifndef YYFREE
 #   define YYFREE free
-#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
+#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 void free (void *); /* INFRINGES ON USER NAME SPACE */
 #   endif
@@ -375,23 +374,7 @@ union yyalloc
      ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
       + YYSTACK_GAP_MAXIMUM)
 
-/* Copy COUNT objects from FROM to TO.  The source and destination do
-   not overlap.  */
-# ifndef YYCOPY
-#  if defined __GNUC__ && 1 < __GNUC__
-#   define YYCOPY(To, From, Count) \
-      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
-#  else
-#   define YYCOPY(To, From, Count)		\
-      do					\
-	{					\
-	  YYSIZE_T yyi;				\
-	  for (yyi = 0; yyi < (Count); yyi++)	\
-	    (To)[yyi] = (From)[yyi];		\
-	}					\
-      while (YYID (0))
-#  endif
-# endif
+# define YYCOPY_NEEDED 1
 
 /* Relocate STACK from its old location to the new one.  The
    local variables YYSIZE and YYSTACKSIZE give the old and new number of
@@ -411,6 +394,26 @@ union yyalloc
 
 #endif
 
+#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
+/* Copy COUNT objects from FROM to TO.  The source and destination do
+   not overlap.  */
+# ifndef YYCOPY
+#  if defined __GNUC__ && 1 < __GNUC__
+#   define YYCOPY(To, From, Count) \
+      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
+#  else
+#   define YYCOPY(To, From, Count)		\
+      do					\
+	{					\
+	  YYSIZE_T yyi;				\
+	  for (yyi = 0; yyi < (Count); yyi++)	\
+	    (To)[yyi] = (From)[yyi];		\
+	}					\
+      while (YYID (0))
+#  endif
+# endif
+#endif /* !YYCOPY_NEEDED */
+
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  11
 /* YYLAST -- Last index in YYTABLE.  */
@@ -529,18 +532,18 @@ static const yytype_int8 yyrhs[] =
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   104,   104,   104,   106,   106,   108,   110,   111,   112,
-     113,   114,   115,   119,   123,   123,   123,   123,   123,   123,
-     123,   123,   127,   128,   129,   130,   131,   132,   136,   137,
-     143,   151,   157,   165,   175,   177,   178,   179,   180,   181,
-     182,   185,   193,   199,   209,   215,   221,   224,   226,   237,
-     238,   243,   252,   257,   265,   268,   270,   271,   272,   273,
-     274,   277,   283,   294,   300,   310,   312,   317,   325,   333,
-     336,   338,   339,   340,   345,   352,   359,   364,   372,   375,
-     377,   378,   379,   382,   390,   397,   404,   410,   417,   419,
-     420,   421,   424,   432,   434,   435,   438,   445,   447,   452,
-     453,   456,   457,   458,   462,   463,   466,   467,   470,   471,
-     472,   473,   474,   475,   476,   479,   480,   483,   484
+       0,   103,   103,   103,   105,   105,   107,   109,   110,   111,
+     112,   113,   114,   118,   122,   122,   122,   122,   122,   122,
+     122,   122,   126,   127,   128,   129,   130,   131,   135,   136,
+     142,   150,   156,   164,   174,   176,   177,   178,   179,   180,
+     181,   184,   192,   198,   208,   214,   220,   223,   225,   236,
+     237,   242,   251,   256,   264,   267,   269,   270,   271,   272,
+     273,   276,   282,   293,   299,   309,   311,   316,   324,   332,
+     335,   337,   338,   339,   344,   351,   358,   363,   371,   374,
+     376,   377,   378,   381,   389,   396,   403,   409,   416,   418,
+     419,   420,   423,   431,   433,   434,   437,   444,   446,   451,
+     452,   455,   456,   457,   461,   462,   465,   466,   469,   470,
+     471,   472,   473,   474,   475,   478,   479,   482,   483
 };
 #endif
 
@@ -615,8 +618,8 @@ static const yytype_uint8 yyr2[] =
        3,     3,     2,     3,     3,     1,     1,     0,     1
 };
 
-/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
-   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
+/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
+   Performed when YYTABLE doesn't specify something else to do.  Zero
    means the default is an error.  */
 static const yytype_uint8 yydefact[] =
 {
@@ -691,8 +694,7 @@ static const yytype_int16 yypgoto[] =
 
 /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
    positive, shift that token.  If negative, reduce the rule which
-   number is the opposite.  If zero, do what YYDEFACT says.
-   If YYTABLE_NINF, syntax error.  */
+   number is the opposite.  If YYTABLE_NINF, syntax error.  */
 #define YYTABLE_NINF -86
 static const yytype_int16 yytable[] =
 {
@@ -728,6 +730,12 @@ static const yytype_int16 yytable[] =
      184
 };
 
+#define yypact_value_is_default(yystate) \
+  ((yystate) == (-90))
+
+#define yytable_value_is_error(yytable_value) \
+  YYID (0)
+
 static const yytype_int16 yycheck[] =
 {
        1,    67,    68,    10,    93,    94,    76,     3,    76,    14,
@@ -821,7 +829,6 @@ do								\
     {								\
       yychar = (Token);						\
       yylval = (Value);						\
-      yytoken = YYTRANSLATE (yychar);				\
       YYPOPSTACK (1);						\
       goto yybackup;						\
     }								\
@@ -863,19 +870,10 @@ while (YYID (0))
 #endif
 
 
-/* YY_LOCATION_PRINT -- Print the location on the stream.
-   This macro was not mandated originally: define only if we know
-   we won't break user code: when these are the locations we know.  */
+/* This macro is provided for backward compatibility. */
 
 #ifndef YY_LOCATION_PRINT
-# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
-#  define YY_LOCATION_PRINT(File, Loc)			\
-     fprintf (File, "%d.%d-%d.%d",			\
-	      (Loc).first_line, (Loc).first_column,	\
-	      (Loc).last_line,  (Loc).last_column)
-# else
-#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
-# endif
+# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
 #endif
 
 
@@ -1067,7 +1065,6 @@ int yydebug;
 # define YYMAXDEPTH 10000
 #endif
 
-
 
 #if YYERROR_VERBOSE
 
@@ -1170,115 +1167,142 @@ yytnamerr (char *yyres, const char *yystr)
 }
 # endif
 
-/* Copy into YYRESULT an error message about the unexpected token
-   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
-   including the terminating null byte.  If YYRESULT is null, do not
-   copy anything; just return the number of bytes that would be
-   copied.  As a special case, return 0 if an ordinary "syntax error"
-   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
-   size calculation.  */
-static YYSIZE_T
-yysyntax_error (char *yyresult, int yystate, int yychar)
-{
-  int yyn = yypact[yystate];
+/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
+   about the unexpected token YYTOKEN for the state stack whose top is
+   YYSSP.
 
-  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
-    return 0;
-  else
+   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
+   not large enough to hold the message.  In that case, also set
+   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
+   required number of bytes is too large to store.  */
+static int
+yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
+                yytype_int16 *yyssp, int yytoken)
+{
+  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
+  YYSIZE_T yysize = yysize0;
+  YYSIZE_T yysize1;
+  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
+  /* Internationalized format string. */
+  const char *yyformat = 0;
+  /* Arguments of yyformat. */
+  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
+  /* Number of reported tokens (one for the "unexpected", one per
+     "expected"). */
+  int yycount = 0;
+
+  /* There are many possibilities here to consider:
+     - Assume YYFAIL is not used.  It's too flawed to consider.  See
+       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
+       for details.  YYERROR is fine as it does not invoke this
+       function.
+     - If this state is a consistent state with a default action, then
+       the only way this function was invoked is if the default action
+       is an error action.  In that case, don't check for expected
+       tokens because there are none.
+     - The only way there can be no lookahead present (in yychar) is if
+       this state is a consistent state with a default action.  Thus,
+       detecting the absence of a lookahead is sufficient to determine
+       that there is no unexpected or expected token to report.  In that
+       case, just report a simple "syntax error".
+     - Don't assume there isn't a lookahead just because this state is a
+       consistent state with a default action.  There might have been a
+       previous inconsistent state, consistent state with a non-default
+       action, or user semantic action that manipulated yychar.
+     - Of course, the expected token list depends on states to have
+       correct lookahead information, and it depends on the parser not
+       to perform extra reductions after fetching a lookahead from the
+       scanner and before detecting a syntax error.  Thus, state merging
+       (from LALR or IELR) and default reductions corrupt the expected
+       token list.  However, the list is correct for canonical LR with
+       one exception: it will still contain any token that will not be
+       accepted due to an error action in a later state.
+  */
+  if (yytoken != YYEMPTY)
     {
-      int yytype = YYTRANSLATE (yychar);
-      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
-      YYSIZE_T yysize = yysize0;
-      YYSIZE_T yysize1;
-      int yysize_overflow = 0;
-      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
-      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
-      int yyx;
-
-# if 0
-      /* This is so xgettext sees the translatable formats that are
-	 constructed on the fly.  */
-      YY_("syntax error, unexpected %s");
-      YY_("syntax error, unexpected %s, expecting %s");
-      YY_("syntax error, unexpected %s, expecting %s or %s");
-      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
-      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
-# endif
-      char *yyfmt;
-      char const *yyf;
-      static char const yyunexpected[] = "syntax error, unexpected %s";
-      static char const yyexpecting[] = ", expecting %s";
-      static char const yyor[] = " or %s";
-      char yyformat[sizeof yyunexpected
-		    + sizeof yyexpecting - 1
-		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
-		       * (sizeof yyor - 1))];
-      char const *yyprefix = yyexpecting;
-
-      /* Start YYX at -YYN if negative to avoid negative indexes in
-	 YYCHECK.  */
-      int yyxbegin = yyn < 0 ? -yyn : 0;
-
-      /* Stay within bounds of both yycheck and yytname.  */
-      int yychecklim = YYLAST - yyn + 1;
-      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
-      int yycount = 1;
-
-      yyarg[0] = yytname[yytype];
-      yyfmt = yystpcpy (yyformat, yyunexpected);
-
-      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
-	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
-	  {
-	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
-	      {
-		yycount = 1;
-		yysize = yysize0;
-		yyformat[sizeof yyunexpected - 1] = '\0';
-		break;
-	      }
-	    yyarg[yycount++] = yytname[yyx];
-	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
-	    yysize_overflow |= (yysize1 < yysize);
-	    yysize = yysize1;
-	    yyfmt = yystpcpy (yyfmt, yyprefix);
-	    yyprefix = yyor;
-	  }
+      int yyn = yypact[*yyssp];
+      yyarg[yycount++] = yytname[yytoken];
+      if (!yypact_value_is_default (yyn))
+        {
+          /* Start YYX@-YYN if negative to avoid negative indexes in
+             YYCHECK.  In other words, skip the first -YYN actions for
+             this state because they are default actions.  */
+          int yyxbegin = yyn < 0 ? -yyn : 0;
+          /* Stay within bounds of both yycheck and yytname.  */
+          int yychecklim = YYLAST - yyn + 1;
+          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
+          int yyx;
+
+          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
+            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
+                && !yytable_value_is_error (yytable[yyx + yyn]))
+              {
+                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
+                  {
+                    yycount = 1;
+                    yysize = yysize0;
+                    break;
+                  }
+                yyarg[yycount++] = yytname[yyx];
+                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
+                if (! (yysize <= yysize1
+                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+                  return 2;
+                yysize = yysize1;
+              }
+        }
+    }
 
-      yyf = YY_(yyformat);
-      yysize1 = yysize + yystrlen (yyf);
-      yysize_overflow |= (yysize1 < yysize);
-      yysize = yysize1;
+  switch (yycount)
+    {
+# define YYCASE_(N, S)                      \
+      case N:                               \
+        yyformat = S;                       \
+      break
+      YYCASE_(0, YY_("syntax error"));
+      YYCASE_(1, YY_("syntax error, unexpected %s"));
+      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
+      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
+      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
+      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
+# undef YYCASE_
+    }
 
-      if (yysize_overflow)
-	return YYSIZE_MAXIMUM;
+  yysize1 = yysize + yystrlen (yyformat);
+  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+    return 2;
+  yysize = yysize1;
 
-      if (yyresult)
-	{
-	  /* Avoid sprintf, as that infringes on the user's name space.
-	     Don't have undefined behavior even if the translation
-	     produced a string with the wrong number of "%s"s.  */
-	  char *yyp = yyresult;
-	  int yyi = 0;
-	  while ((*yyp = *yyf) != '\0')
-	    {
-	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
-		{
-		  yyp += yytnamerr (yyp, yyarg[yyi++]);
-		  yyf += 2;
-		}
-	      else
-		{
-		  yyp++;
-		  yyf++;
-		}
-	    }
-	}
-      return yysize;
+  if (*yymsg_alloc < yysize)
+    {
+      *yymsg_alloc = 2 * yysize;
+      if (! (yysize <= *yymsg_alloc
+             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
+        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
+      return 1;
     }
+
+  /* Avoid sprintf, as that infringes on the user's name space.
+     Don't have undefined behavior even if the translation
+     produced a string with the wrong number of "%s"s.  */
+  {
+    char *yyp = *yymsg;
+    int yyi = 0;
+    while ((*yyp = *yyformat) != '\0')
+      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
+        {
+          yyp += yytnamerr (yyp, yyarg[yyi++]);
+          yyformat += 2;
+        }
+      else
+        {
+          yyp++;
+          yyformat++;
+        }
+  }
+  return 0;
 }
 #endif /* YYERROR_VERBOSE */
-
 
 /*-----------------------------------------------.
 | Release the memory associated to this symbol.  |
@@ -1341,6 +1365,7 @@ yydestruct (yymsg, yytype, yyvaluep)
     }
 }
 
+
 /* Prevent warnings from -Wmissing-prototypes.  */
 #ifdef YYPARSE_PARAM
 #if defined __STDC__ || defined __cplusplus
@@ -1367,10 +1392,9 @@ YYSTYPE yylval;
 int yynerrs;
 
 
-
-/*-------------------------.
-| yyparse or yypush_parse.  |
-`-------------------------*/
+/*----------.
+| yyparse.  |
+`----------*/
 
 #ifdef YYPARSE_PARAM
 #if (defined __STDC__ || defined __C99__FUNC__ \
@@ -1394,8 +1418,6 @@ yyparse ()
 #endif
 #endif
 {
-
-
     int yystate;
     /* Number of tokens to shift before error messages enabled.  */
     int yyerrstatus;
@@ -1550,7 +1572,7 @@ yybackup:
 
   /* First try to decide what to do without reference to lookahead token.  */
   yyn = yypact[yystate];
-  if (yyn == YYPACT_NINF)
+  if (yypact_value_is_default (yyn))
     goto yydefault;
 
   /* Not known => get a lookahead token if don't already have one.  */
@@ -1581,8 +1603,8 @@ yybackup:
   yyn = yytable[yyn];
   if (yyn <= 0)
     {
-      if (yyn == 0 || yyn == YYTABLE_NINF)
-	goto yyerrlab;
+      if (yytable_value_is_error (yyn))
+        goto yyerrlab;
       yyn = -yyn;
       goto yyreduce;
     }
@@ -1637,34 +1659,34 @@ yyreduce:
     {
         case 10:
 
-    { zconf_error("unexpected end statement"); ;}
+    { zconf_error("unexpected end statement"); }
     break;
 
   case 11:
 
-    { zconf_error("unknown statement \"%s\"", (yyvsp[(2) - (4)].string)); ;}
+    { zconf_error("unknown statement \"%s\"", (yyvsp[(2) - (4)].string)); }
     break;
 
   case 12:
 
     {
 	zconf_error("unexpected option \"%s\"", kconf_id_strings + (yyvsp[(2) - (4)].id)->name);
-;}
+}
     break;
 
   case 13:
 
-    { zconf_error("invalid statement"); ;}
+    { zconf_error("invalid statement"); }
     break;
 
   case 28:
 
-    { zconf_error("unknown option \"%s\"", (yyvsp[(1) - (3)].string)); ;}
+    { zconf_error("unknown option \"%s\"", (yyvsp[(1) - (3)].string)); }
     break;
 
   case 29:
 
-    { zconf_error("invalid option"); ;}
+    { zconf_error("invalid option"); }
     break;
 
   case 30:
@@ -1674,7 +1696,7 @@ yyreduce:
 	sym->flags |= SYMBOL_OPTIONAL;
 	menu_add_entry(sym);
 	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
-;}
+}
     break;
 
   case 31:
@@ -1682,7 +1704,7 @@ yyreduce:
     {
 	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 32:
@@ -1692,7 +1714,7 @@ yyreduce:
 	sym->flags |= SYMBOL_OPTIONAL;
 	menu_add_entry(sym);
 	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
-;}
+}
     break;
 
   case 33:
@@ -1704,7 +1726,7 @@ yyreduce:
 		zconfprint("warning: menuconfig statement without prompt");
 	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 41:
@@ -1714,7 +1736,7 @@ yyreduce:
 	printd(DEBUG_PARSE, "%s:%d:type(%u)\n",
 		zconf_curname(), zconf_lineno(),
 		(yyvsp[(1) - (3)].id)->stype);
-;}
+}
     break;
 
   case 42:
@@ -1722,7 +1744,7 @@ yyreduce:
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 43:
@@ -1734,7 +1756,7 @@ yyreduce:
 	printd(DEBUG_PARSE, "%s:%d:default(%u)\n",
 		zconf_curname(), zconf_lineno(),
 		(yyvsp[(1) - (4)].id)->stype);
-;}
+}
     break;
 
   case 44:
@@ -1742,7 +1764,7 @@ yyreduce:
     {
 	menu_add_symbol(P_SELECT, sym_lookup((yyvsp[(2) - (4)].string), 0), (yyvsp[(3) - (4)].expr));
 	printd(DEBUG_PARSE, "%s:%d:select\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 45:
@@ -1750,7 +1772,7 @@ yyreduce:
     {
 	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[(2) - (5)].symbol), (yyvsp[(3) - (5)].symbol)), (yyvsp[(4) - (5)].expr));
 	printd(DEBUG_PARSE, "%s:%d:range\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 48:
@@ -1762,17 +1784,17 @@ yyreduce:
 	else
 		zconfprint("warning: ignoring unknown option %s", (yyvsp[(2) - (3)].string));
 	free((yyvsp[(2) - (3)].string));
-;}
+}
     break;
 
   case 49:
 
-    { (yyval.string) = NULL; ;}
+    { (yyval.string) = NULL; }
     break;
 
   case 50:
 
-    { (yyval.string) = (yyvsp[(2) - (2)].string); ;}
+    { (yyval.string) = (yyvsp[(2) - (2)].string); }
     break;
 
   case 51:
@@ -1783,14 +1805,14 @@ yyreduce:
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 52:
 
     {
 	(yyval.menu) = menu_add_menu();
-;}
+}
     break;
 
   case 53:
@@ -1800,7 +1822,7 @@ yyreduce:
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endchoice\n", zconf_curname(), zconf_lineno());
 	}
-;}
+}
     break;
 
   case 61:
@@ -1808,7 +1830,7 @@ yyreduce:
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 62:
@@ -1821,7 +1843,7 @@ yyreduce:
 			(yyvsp[(1) - (3)].id)->stype);
 	} else
 		YYERROR;
-;}
+}
     break;
 
   case 63:
@@ -1829,7 +1851,7 @@ yyreduce:
     {
 	current_entry->sym->flags |= SYMBOL_OPTIONAL;
 	printd(DEBUG_PARSE, "%s:%d:optional\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 64:
@@ -1841,7 +1863,7 @@ yyreduce:
 			zconf_curname(), zconf_lineno());
 	} else
 		YYERROR;
-;}
+}
     break;
 
   case 67:
@@ -1851,7 +1873,7 @@ yyreduce:
 	menu_add_entry(NULL);
 	menu_add_dep((yyvsp[(2) - (3)].expr));
 	(yyval.menu) = menu_add_menu();
-;}
+}
     break;
 
   case 68:
@@ -1861,14 +1883,14 @@ yyreduce:
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endif\n", zconf_curname(), zconf_lineno());
 	}
-;}
+}
     break;
 
   case 74:
 
     {
 	menu_add_prompt(P_MENU, (yyvsp[(2) - (3)].string), NULL);
-;}
+}
     break;
 
   case 75:
@@ -1877,14 +1899,14 @@ yyreduce:
 	menu_add_entry(NULL);
 	menu_add_prompt(P_MENU, (yyvsp[(2) - (3)].string), NULL);
 	printd(DEBUG_PARSE, "%s:%d:menu\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 76:
 
     {
 	(yyval.menu) = menu_add_menu();
-;}
+}
     break;
 
   case 77:
@@ -1894,7 +1916,7 @@ yyreduce:
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endmenu\n", zconf_curname(), zconf_lineno());
 	}
-;}
+}
     break;
 
   case 83:
@@ -1902,7 +1924,7 @@ yyreduce:
     {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
 	zconf_nextfile((yyvsp[(2) - (3)].string));
-;}
+}
     break;
 
   case 84:
@@ -1911,14 +1933,14 @@ yyreduce:
 	menu_add_entry(NULL);
 	menu_add_prompt(P_COMMENT, (yyvsp[(2) - (3)].string), NULL);
 	printd(DEBUG_PARSE, "%s:%d:comment\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 85:
 
     {
 	menu_end_entry();
-;}
+}
     break;
 
   case 86:
@@ -1926,14 +1948,14 @@ yyreduce:
     {
 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
 	zconf_starthelp();
-;}
+}
     break;
 
   case 87:
 
     {
 	current_entry->help = (yyvsp[(2) - (2)].string);
-;}
+}
     break;
 
   case 92:
@@ -1941,102 +1963,113 @@ yyreduce:
     {
 	menu_add_dep((yyvsp[(3) - (4)].expr));
 	printd(DEBUG_PARSE, "%s:%d:depends on\n", zconf_curname(), zconf_lineno());
-;}
+}
     break;
 
   case 96:
 
     {
 	menu_add_visibility((yyvsp[(2) - (2)].expr));
-;}
+}
     break;
 
   case 98:
 
     {
 	menu_add_prompt(P_PROMPT, (yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].expr));
-;}
+}
     break;
 
   case 101:
 
-    { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
+    { (yyval.id) = (yyvsp[(1) - (2)].id); }
     break;
 
   case 102:
 
-    { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
+    { (yyval.id) = (yyvsp[(1) - (2)].id); }
     break;
 
   case 103:
 
-    { (yyval.id) = (yyvsp[(1) - (2)].id); ;}
+    { (yyval.id) = (yyvsp[(1) - (2)].id); }
     break;
 
   case 106:
 
-    { (yyval.expr) = NULL; ;}
+    { (yyval.expr) = NULL; }
     break;
 
   case 107:
 
-    { (yyval.expr) = (yyvsp[(2) - (2)].expr); ;}
+    { (yyval.expr) = (yyvsp[(2) - (2)].expr); }
     break;
 
   case 108:
 
-    { (yyval.expr) = expr_alloc_symbol((yyvsp[(1) - (1)].symbol)); ;}
+    { (yyval.expr) = expr_alloc_symbol((yyvsp[(1) - (1)].symbol)); }
     break;
 
   case 109:
 
-    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); ;}
+    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 110:
 
-    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); ;}
+    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
     break;
 
   case 111:
 
-    { (yyval.expr) = (yyvsp[(2) - (3)].expr); ;}
+    { (yyval.expr) = (yyvsp[(2) - (3)].expr); }
     break;
 
   case 112:
 
-    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); ;}
+    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); }
     break;
 
   case 113:
 
-    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
+    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
     break;
 
   case 114:
 
-    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); ;}
+    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
     break;
 
   case 115:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); ;}
+    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); }
     break;
 
   case 116:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); ;}
+    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); }
     break;
 
   case 117:
 
-    { (yyval.string) = NULL; ;}
+    { (yyval.string) = NULL; }
     break;
 
 
 
       default: break;
     }
+  /* User semantic actions sometimes alter yychar, and that requires
+     that yytoken be updated with the new translation.  We take the
+     approach of translating immediately before every use of yytoken.
+     One alternative is translating here after every semantic action,
+     but that translation would be missed if the semantic action invokes
+     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
+     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
+     incorrect destructor might then be invoked immediately.  In the
+     case of YYERROR or YYBACKUP, subsequent parser actions might lead
+     to an incorrect destructor call or verbose syntax error message
+     before the lookahead is translated.  */
   YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);
 
   YYPOPSTACK (yylen);
@@ -2064,6 +2097,10 @@ yyreduce:
 | yyerrlab -- here on detecting error |
 `------------------------------------*/
 yyerrlab:
+  /* Make sure we have latest lookahead translation.  See comments at
+     user semantic actions for why this is necessary.  */
+  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);
+
   /* If not already recovering from an error, report this error.  */
   if (!yyerrstatus)
     {
@@ -2071,37 +2108,36 @@ yyerrlab:
 #if ! YYERROR_VERBOSE
       yyerror (YY_("syntax error"));
 #else
+# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
+                                        yyssp, yytoken)
       {
-	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
-	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
-	  {
-	    YYSIZE_T yyalloc = 2 * yysize;
-	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
-	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
-	    if (yymsg != yymsgbuf)
-	      YYSTACK_FREE (yymsg);
-	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
-	    if (yymsg)
-	      yymsg_alloc = yyalloc;
-	    else
-	      {
-		yymsg = yymsgbuf;
-		yymsg_alloc = sizeof yymsgbuf;
-	      }
-	  }
-
-	if (0 < yysize && yysize <= yymsg_alloc)
-	  {
-	    (void) yysyntax_error (yymsg, yystate, yychar);
-	    yyerror (yymsg);
-	  }
-	else
-	  {
-	    yyerror (YY_("syntax error"));
-	    if (yysize != 0)
-	      goto yyexhaustedlab;
-	  }
+        char const *yymsgp = YY_("syntax error");
+        int yysyntax_error_status;
+        yysyntax_error_status = YYSYNTAX_ERROR;
+        if (yysyntax_error_status == 0)
+          yymsgp = yymsg;
+        else if (yysyntax_error_status == 1)
+          {
+            if (yymsg != yymsgbuf)
+              YYSTACK_FREE (yymsg);
+            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
+            if (!yymsg)
+              {
+                yymsg = yymsgbuf;
+                yymsg_alloc = sizeof yymsgbuf;
+                yysyntax_error_status = 2;
+              }
+            else
+              {
+                yysyntax_error_status = YYSYNTAX_ERROR;
+                yymsgp = yymsg;
+              }
+          }
+        yyerror (yymsgp);
+        if (yysyntax_error_status == 2)
+          goto yyexhaustedlab;
       }
+# undef YYSYNTAX_ERROR
 #endif
     }
 
@@ -2160,7 +2196,7 @@ yyerrlab1:
   for (;;)
     {
       yyn = yypact[yystate];
-      if (yyn != YYPACT_NINF)
+      if (!yypact_value_is_default (yyn))
 	{
 	  yyn += YYTERROR;
 	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
@@ -2219,8 +2255,13 @@ yyexhaustedlab:
 
 yyreturn:
   if (yychar != YYEMPTY)
-     yydestruct ("Cleanup: discarding lookahead",
-		 yytoken, &yylval);
+    {
+      /* Make sure we have latest lookahead translation.  See comments at
+         user semantic actions for why this is necessary.  */
+      yytoken = YYTRANSLATE (yychar);
+      yydestruct ("Cleanup: discarding lookahead",
+                  yytoken, &yylval);
+    }
   /* Do not reclaim the symbols of the rule which action triggered
      this YYABORT or YYACCEPT.  */
   YYPOPSTACK (yylen);
@@ -2256,9 +2297,6 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	modules_sym = sym_lookup(NULL, 0);
-	modules_sym->type = S_BOOLEAN;
-	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
@@ -2266,12 +2304,8 @@ void conf_parse(const char *name)
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);
-	if (!modules_sym->prop) {
-		struct property *prop;
-
-		prop = prop_alloc(P_DEFAULT, modules_sym);
-		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
-	}
+	if (!modules_sym)
+		modules_sym = sym_find( "n" );
 
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
diff --git a/support/kconfig/zconf.y b/support/kconfig/zconf.y
index 92ac107..08ac041 100644
--- a/support/kconfig/zconf.y
+++ b/support/kconfig/zconf.y
@@ -493,9 +493,6 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	modules_sym = sym_lookup(NULL, 0);
-	modules_sym->type = S_BOOLEAN;
-	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
@@ -503,12 +500,8 @@ void conf_parse(const char *name)
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);
-	if (!modules_sym->prop) {
-		struct property *prop;
-
-		prop = prop_alloc(P_DEFAULT, modules_sym);
-		prop->expr = expr_alloc_symbol(sym_lookup("MODULES", 0));
-	}
+	if (!modules_sym)
+		modules_sym = sym_find( "n" );
 
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
-- 
1.8.1.2
