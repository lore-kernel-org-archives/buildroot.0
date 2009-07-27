From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 16:11:10 +0200
Subject: [Buildroot] [PATCH 1/4] config: Update package/config to Kconfig
	2.6.30
In-Reply-To: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
References: <cover.1248703870.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4b3e11b3e7d00881878f45cddbfe8f4bf07d1ebe.1248703870.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alper Yildirim <ayildirim@aselsan.com>

Update the package/config stuff with the code available in the Linux
kernel 2.6.30.

Signed-off-by: Alper Yildirim <ayildirim@aselsan.com>
---
 package/config/Makefile.kconfig            |   53 +-
 package/config/POTFILES.in                 |    7 +
 package/config/conf.c                      |  259 ++++-----
 package/config/confdata.c                  |  139 ++++-
 package/config/expr.c                      |   32 +-
 package/config/expr.h                      |   94 ++-
 package/config/gconf.c                     |   16 +-
 package/config/kconfig-language.txt        |  102 +++-
 package/config/kconfig-to-buildroot2.patch |  908 ++++++----------------------
 package/config/kxgettext.c                 |    4 +
 package/config/lex.zconf.c_shipped         |   87 ++-
 package/config/lkc.h                       |   21 +-
 package/config/lkc_proto.h                 |    2 +-
 package/config/lxdialog/check-lxdialog.sh  |   20 +-
 package/config/lxdialog/checklist.c        |    7 +-
 package/config/lxdialog/dialog.h           |   11 +-
 package/config/lxdialog/inputbox.c         |    6 +-
 package/config/lxdialog/menubox.c          |    6 +-
 package/config/lxdialog/textbox.c          |    2 +-
 package/config/lxdialog/util.c             |   32 +-
 package/config/lxdialog/yesno.c            |    4 +-
 package/config/mconf.c                     |  126 ++---
 package/config/menu.c                      |   74 ++-
 package/config/qconf.cc                    |  149 +++---
 package/config/symbol.c                    |  219 +++++--
 package/config/util.c                      |   28 +-
 package/config/zconf.gperf                 |    2 +-
 package/config/zconf.hash.c_shipped        |   19 +-
 package/config/zconf.l                     |   18 +-
 package/config/zconf.tab.c_shipped         |  301 +++++-----
 package/config/zconf.y                     |   13 +-
 31 files changed, 1311 insertions(+), 1450 deletions(-)

diff --git a/package/config/Makefile.kconfig b/package/config/Makefile.kconfig
index 457d46e..747f23d 100644
--- a/package/config/Makefile.kconfig
+++ b/package/config/Makefile.kconfig
@@ -4,7 +4,11 @@
 
 PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config
 
+ifdef KBUILD_KCONFIG
+Kconfig := $(KBUILD_KCONFIG)
+else
 Kconfig := arch/$(SRCARCH)/Kconfig
+endif
 
 xconfig: $(obj)/qconf
 	$< $(Kconfig)
@@ -24,22 +28,25 @@ oldconfig: $(obj)/conf
 silentoldconfig: $(obj)/conf
 	$< -s $(Kconfig)
 
-# Create new linux.po file
+# Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 # The symlink is used to repair a deficiency in arch/um
-update-po-config: $(obj)/kxgettext
-	xgettext --default-domain=linux                  \
+update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
+	$(Q)echo "  GEN config"
+	$(Q)xgettext --default-domain=linux              \
 	    --add-comments --keyword=_ --keyword=N_      \
 	    --from-code=UTF-8                            \
 	    --files-from=scripts/kconfig/POTFILES.in     \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
 	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	(for i in `ls arch/`;                            \
-	do                                               \
-	    $(obj)/kxgettext arch/$$i/Kconfig;           \
-	done ) >> $(obj)/config.pot
-	msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
+	$(Q)(for i in `ls arch/*/Kconfig`;               \
+	    do                                           \
+		echo "  GEN $$i";                        \
+		$(obj)/kxgettext $$i                     \
+		     >> $(obj)/config.pot;               \
+	    done )
+	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
 	$(Q)rm -f arch/um/Kconfig.arch
 	$(Q)rm -f $(obj)/config.pot
@@ -76,7 +83,7 @@ help:
 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
-	@echo  '  silentoldconfig - Same as oldconfig, but quietly'
+	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  defconfig	  - New config with default answer to all options'
 	@echo  '  allmodconfig	  - New config selecting modules when possible'
@@ -93,17 +100,11 @@ HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
 HOST_EXTRACFLAGS += -DLOCALE
 
-PHONY += $(obj)/dochecklxdialog
-$(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_LOADLIBES)
-
-always := dochecklxdialog
-
 
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
 # conf:	  Used for defconfig, oldconfig and related targets
-# mconf:  Used for the mconfig target.
+# mconf:  Used for the menuconfig target
 #         Utilizes the lxdialog package
 # qconf:  Used for the xconfig target
 #         Based on QT which needs to be installed to compile it
@@ -124,7 +125,7 @@ ifeq ($(MAKECMDGOALS),menuconfig)
 	hostprogs-y += mconf
 endif
 ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-	hostprogs-y += mconf
+       hostprogs-y += mconf
 endif
 
 ifeq ($(MAKECMDGOALS),xconfig)
@@ -145,8 +146,17 @@ gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
 endif
 
 clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c
+		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf
+clean-files     += config.pot linux.pot
+
+# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
+PHONY += $(obj)/dochecklxdialog
+$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
+$(obj)/dochecklxdialog:
+	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOST_LOADLIBES)
+
+always := dochecklxdialog
 
 # Add environment specific flags
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
@@ -184,8 +194,8 @@ $(obj)/.tmp_qtcheck:
 	  done; \
 	  if [ -z "$$dir" ]; then \
 	    echo "*"; \
-	    echo "* Unable to find the QT installation. Please make sure that"; \
-	    echo "* the QT development package is correctly installed and"; \
+	    echo "* Unable to find the QT3 installation. Please make sure that"; \
+	    echo "* the QT3 development package is correctly installed and"; \
 	    echo "* either install pkg-config or set the QTDIR environment"; \
 	    echo "* variable to the correct location."; \
 	    echo "*"; \
@@ -251,6 +261,9 @@ $(obj)/%.moc: $(src)/%.h
 $(obj)/lkc_defs.h: $(src)/lkc_proto.h
 	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
 
+# Extract gconf menu items for I18N support
+$(obj)/gconf.glade.h: $(obj)/gconf.glade
+	intltool-extract --type=gettext/glade $(obj)/gconf.glade
 
 ###
 # The following requires flex/bison/gperf
diff --git a/package/config/POTFILES.in b/package/config/POTFILES.in
index cc94e46..9674573 100644
--- a/package/config/POTFILES.in
+++ b/package/config/POTFILES.in
@@ -1,5 +1,12 @@
+scripts/kconfig/lxdialog/checklist.c
+scripts/kconfig/lxdialog/inputbox.c
+scripts/kconfig/lxdialog/menubox.c
+scripts/kconfig/lxdialog/textbox.c
+scripts/kconfig/lxdialog/util.c
+scripts/kconfig/lxdialog/yesno.c
 scripts/kconfig/mconf.c
 scripts/kconfig/conf.c
 scripts/kconfig/confdata.c
 scripts/kconfig/gconf.c
+scripts/kconfig/gconf.glade.h
 scripts/kconfig/qconf.cc
diff --git a/package/config/conf.c b/package/config/conf.c
index d69b0af..c824805 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -3,13 +3,15 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
+#include <locale.h>
 #include <ctype.h>
-#include <stdlib.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
-#include <unistd.h>
 #include <time.h>
+#include <unistd.h>
 #include <sys/stat.h>
+#include <sys/time.h>
 
 #define LKC_DIRECT_LINK
 #include "lkc.h"
@@ -31,6 +33,7 @@ char *defconfig_file;
 
 static int indent = 1;
 static int valid_stdin = 1;
+static int sync_kconfig;
 static int conf_cnt;
 static char line[128];
 static struct menu *rootEntry;
@@ -40,7 +43,7 @@ static char nohelp_text[] = N_("Sorry, no help available for this option yet.\n"
 static const char *get_help(struct menu *menu)
 {
 	if (menu_has_help(menu))
-		return menu_get_help(menu);
+		return _(menu_get_help(menu));
 	else
 		return nohelp_text;
 }
@@ -64,7 +67,7 @@ static void strip(char *str)
 
 static void check_stdin(void)
 {
-	if (!valid_stdin && input_mode == ask_silent) {
+	if (!valid_stdin) {
 		printf(_("aborted!\n\n"));
 		printf(_("Console input/output is redirected. "));
 		printf(_("Run 'make oldconfig' to update configuration.\n\n"));
@@ -75,10 +78,9 @@ static void check_stdin(void)
 static int conf_askvalue(struct symbol *sym, const char *def)
 {
 	enum symbol_type type = sym_get_type(sym);
-	tristate val;
 
 	if (!sym_has_value(sym))
-		printf("(NEW) ");
+		printf(_("(NEW) "));
 
 	line[0] = '\n';
 	line[1] = 0;
@@ -91,15 +93,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	}
 
 	switch (input_mode) {
-	case set_no:
-	case set_mod:
-	case set_yes:
-	case set_random:
-		if (sym_has_value(sym)) {
-			printf("%s\n", def);
-			return 0;
-		}
-		break;
 	case ask_new:
 	case ask_silent:
 		if (sym_has_value(sym)) {
@@ -111,9 +104,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 		fflush(stdout);
 		fgets(line, 128, stdin);
 		return 1;
-	case set_default:
-		printf("%s\n", def);
-		return 1;
 	default:
 		break;
 	}
@@ -127,52 +117,6 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	default:
 		;
 	}
-	switch (input_mode) {
-	case set_yes:
-		if (sym_tristate_within_range(sym, yes)) {
-			line[0] = 'y';
-			line[1] = '\n';
-			line[2] = 0;
-			break;
-		}
-	case set_mod:
-		if (type == S_TRISTATE) {
-			if (sym_tristate_within_range(sym, mod)) {
-				line[0] = 'm';
-				line[1] = '\n';
-				line[2] = 0;
-				break;
-			}
-		} else {
-			if (sym_tristate_within_range(sym, yes)) {
-				line[0] = 'y';
-				line[1] = '\n';
-				line[2] = 0;
-				break;
-			}
-		}
-	case set_no:
-		if (sym_tristate_within_range(sym, no)) {
-			line[0] = 'n';
-			line[1] = '\n';
-			line[2] = 0;
-			break;
-		}
-	case set_random:
-		do {
-			val = (tristate)(random() % 3);
-		} while (!sym_tristate_within_range(sym, val));
-		switch (val) {
-		case no: line[0] = 'n'; break;
-		case mod: line[0] = 'm'; break;
-		case yes: line[0] = 'y'; break;
-		}
-		line[1] = '\n';
-		line[2] = 0;
-		break;
-	default:
-		break;
-	}
 	printf("%s", line);
 	return 1;
 }
@@ -183,7 +127,7 @@ int conf_string(struct menu *menu)
 	const char *def;
 
 	while (1) {
-		printf("%*s%s ", indent - 1, "", menu->prompt->text);
+		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		printf("(%s) ", sym->name);
 		def = sym_get_string_value(sym);
 		if (sym_get_string_value(sym))
@@ -216,7 +160,7 @@ static int conf_sym(struct menu *menu)
 	tristate oldval, newval;
 
 	while (1) {
-		printf("%*s%s ", indent - 1, "", menu->prompt->text);
+		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		if (sym->name)
 			printf("(%s) ", sym->name);
 		type = sym_get_type(sym);
@@ -306,7 +250,7 @@ static int conf_choice(struct menu *menu)
 		case no:
 			return 1;
 		case mod:
-			printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
+			printf("%*s%s\n", indent - 1, "", _(menu_get_prompt(menu)));
 			return 0;
 		case yes:
 			break;
@@ -316,7 +260,7 @@ static int conf_choice(struct menu *menu)
 	while (1) {
 		int cnt, def;
 
-		printf("%*s%s\n", indent - 1, "", menu_get_prompt(menu));
+		printf("%*s%s\n", indent - 1, "", _(menu_get_prompt(menu)));
 		def_sym = sym_get_choice_value(sym);
 		cnt = def = 0;
 		line[0] = 0;
@@ -324,7 +268,7 @@ static int conf_choice(struct menu *menu)
 			if (!menu_is_visible(child))
 				continue;
 			if (!child->sym) {
-				printf("%*c %s\n", indent, '*', menu_get_prompt(child));
+				printf("%*c %s\n", indent, '*', _(menu_get_prompt(child)));
 				continue;
 			}
 			cnt++;
@@ -333,14 +277,14 @@ static int conf_choice(struct menu *menu)
 				printf("%*c", indent, '>');
 			} else
 				printf("%*c", indent, ' ');
-			printf(" %d. %s", cnt, menu_get_prompt(child));
+			printf(" %d. %s", cnt, _(menu_get_prompt(child)));
 			if (child->sym->name)
 				printf(" (%s)", child->sym->name);
 			if (!sym_has_value(child->sym))
-				printf(" (NEW)");
+				printf(_(" (NEW)"));
 			printf("\n");
 		}
-		printf("%*schoice", indent - 1, "");
+		printf(_("%*schoice"), indent - 1, "");
 		if (cnt == 1) {
 			printf("[1]: 1\n");
 			goto conf_childs;
@@ -373,15 +317,7 @@ static int conf_choice(struct menu *menu)
 			else
 				continue;
 			break;
-		case set_random:
-			if (is_new)
-				def = (random() % cnt) + 1;
-		case set_default:
-		case set_yes:
-		case set_mod:
-		case set_no:
-			cnt = def;
-			printf("%d\n", cnt);
+		default:
 			break;
 		}
 
@@ -399,9 +335,9 @@ static int conf_choice(struct menu *menu)
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);
-		if (child->list) {
+		for (child = child->list; child; child = child->next) {
 			indent += 2;
-			conf(child->list);
+			conf(child);
 			indent -= 2;
 		}
 		return 1;
@@ -433,7 +369,7 @@ static void conf(struct menu *menu)
 			if (prompt)
 				printf("%*c\n%*c %s\n%*c\n",
 					indent, '*',
-					indent, '*', prompt,
+					indent, '*', _(prompt),
 					indent, '*');
 		default:
 			;
@@ -495,30 +431,29 @@ static void check_conf(struct menu *menu)
 
 int main(int ac, char **av)
 {
-	int i = 1;
+	int opt;
 	const char *name;
 	struct stat tmpstat;
 
-	if (ac > i && av[i][0] == '-') {
-		switch (av[i++][1]) {
+	setlocale(LC_ALL, "");
+	bindtextdomain(PACKAGE, LOCALEDIR);
+	textdomain(PACKAGE);
+
+	while ((opt = getopt(ac, av, "osdD:nmyrh")) != -1) {
+		switch (opt) {
 		case 'o':
-			input_mode = ask_new;
+			input_mode = ask_silent;
 			break;
 		case 's':
 			input_mode = ask_silent;
-			valid_stdin = isatty(0) && isatty(1) && isatty(2);
+			sync_kconfig = 1;
 			break;
 		case 'd':
 			input_mode = set_default;
 			break;
 		case 'D':
 			input_mode = set_default;
-			defconfig_file = av[i++];
-			if (!defconfig_file) {
-				printf(_("%s: No default config file specified\n"),
-					av[0]);
-				exit(1);
-			}
+			defconfig_file = optarg;
 			break;
 		case 'n':
 			input_mode = set_no;
@@ -530,44 +465,63 @@ int main(int ac, char **av)
 			input_mode = set_yes;
 			break;
 		case 'r':
+		{
+			struct timeval now;
+			unsigned int seed;
+
+			/*
+			 * Use microseconds derived seed,
+			 * compensate for systems where it may be zero
+			 */
+			gettimeofday(&now, NULL);
+
+			seed = (unsigned int)((now.tv_sec + 1) * (now.tv_usec + 1));
+			srand(seed);
+
 			input_mode = set_random;
-			srandom(time(NULL));
 			break;
+		}
 		case 'h':
-		case '?':
-			fprintf(stderr, "See README for usage info\n");
+			printf(_("See README for usage info\n"));
 			exit(0);
+			break;
+		default:
+			fprintf(stderr, _("See README for usage info\n"));
+			exit(1);
 		}
 	}
-  	name = av[i];
-	if (!name) {
+	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
 		exit(1);
 	}
+	name = av[optind];
 	conf_parse(name);
-	/*zconfdump(stdout);*/
+	if (sync_kconfig) {
+		name = conf_get_configname();
+		if (stat(name, &tmpstat)) {
+			fprintf(stderr, _("***\n"
+				"*** You have not yet configured Buildroot!\n"
+				"*** (missing .config file \"%s\")\n"
+				"***\n"
+				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
+				"*** \"make menuconfig\" or \"make xconfig\").\n"
+				"***\n"), name);
+			exit(1);
+		}
+	}
+
 	switch (input_mode) {
 	case set_default:
 		if (!defconfig_file)
 			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
-			printf("***\n"
+			printf(_("***\n"
 				"*** Can't find default configuration \"%s\"!\n"
-				"***\n", defconfig_file);
+				"***\n"), defconfig_file);
 			exit(1);
 		}
 		break;
 	case ask_silent:
-		if (stat(".config", &tmpstat)) {
-			printf(_("***\n"
-				"*** You have not yet configured Buildroot!\n"
-				"*** (missing .config file)\n"
-				"***\n"
-				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
-				"*** \"make menuconfig\" or \"make config\").\n"
-				"***\n"));
-			exit(1);
-		}
 	case ask_all:
 	case ask_new:
 		conf_read(NULL);
@@ -597,35 +551,66 @@ int main(int ac, char **av)
 		break;
 	}
 
-	if (input_mode != ask_silent) {
+	if (sync_kconfig) {
+		if (conf_get_changed()) {
+			name = getenv("KCONFIG_NOSILENTUPDATE");
+			if (name && *name) {
+				fprintf(stderr,
+					_("\n*** Buildroot configuration requires explicit update.\n\n"));
+				return 1;
+			}
+		}
+		valid_stdin = isatty(0) && isatty(1) && isatty(2);
+	}
+
+	switch (input_mode) {
+	case set_no:
+		conf_set_all_new_symbols(def_no);
+		break;
+	case set_yes:
+		conf_set_all_new_symbols(def_yes);
+		break;
+	case set_mod:
+		conf_set_all_new_symbols(def_mod);
+		break;
+	case set_random:
+		conf_set_all_new_symbols(def_random);
+		break;
+	case set_default:
+		conf_set_all_new_symbols(def_default);
+		break;
+	case ask_new:
+	case ask_all:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
-		if (input_mode == ask_all) {
-			input_mode = ask_silent;
-			valid_stdin = 1;
+		input_mode = ask_silent;
+		/* fall through */
+	case ask_silent:
+		/* Update until a loop caused no more changes */
+		do {
+			conf_cnt = 0;
+			check_conf(&rootmenu);
+		} while (conf_cnt);
+		break;
+	}
+
+	if (sync_kconfig) {
+		/* silentoldconfig is used during the build so we shall update autoconf.
+		 * All other commands are only used to generate a config.
+		 */
+		if (conf_get_changed() && conf_write(NULL)) {
+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+			exit(1);
 		}
-	} else if (conf_get_changed()) {
-		name = getenv("KCONFIG_NOSILENTUPDATE");
-		if (name && *name) {
-			fprintf(stderr, _("\n*** Buildroot configuration requires explicit update.\n\n"));
+		if (conf_write_autoconf()) {
+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
 			return 1;
 		}
-	} else
-		goto skip_check;
-
-	do {
-		conf_cnt = 0;
-		check_conf(&rootmenu);
-	} while (conf_cnt);
-	if (conf_write(NULL)) {
-		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
-		return 1;
-	}
-skip_check:
-	if (/*input_mode == ask_silent &&*/ conf_write_autoconf()) {
-		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
-		return 1;
+	} else {
+		if (conf_write(NULL)) {
+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+			exit(1);
+		}
 	}
-
 	return 0;
 }
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 7f06da4..56bcd87 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -42,6 +42,13 @@ const char *conf_get_configname(void)
 	return name ? name : ".config";
 }
 
+const char *conf_get_autoconfig_name(void)
+{
+	char *name = getenv("BUILDROOT_AUTOCONFIG");
+
+	return name ? name : "$(BR2_DEPENDS_DIR)/config/auto.conf";
+}
+
 static char *conf_expand_value(const char *in)
 {
 	struct symbol *sym;
@@ -224,7 +231,7 @@ load:
 			if (def == S_DEF_USER) {
 				sym = sym_find(line + 2);
 				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line + 2);
+					sym_add_change_count(1);
 					break;
 				}
 			} else {
@@ -233,8 +240,7 @@ load:
 					sym->type = S_BOOLEAN;
 			}
 			if (sym->flags & def_flags) {
-				conf_warning("trying to reassign symbol %s", sym->name);
-				break;
+				conf_warning("override: reassigning to symbol %s", sym->name);
 			}
 			switch (sym->type) {
 			case S_BOOLEAN:
@@ -260,7 +266,7 @@ load:
 			if (def == S_DEF_USER) {
 				sym = sym_find(line);
 				if (!sym) {
-					conf_warning("trying to assign nonexistent symbol %s", line);
+					sym_add_change_count(1);
 					break;
 				}
 			} else {
@@ -269,8 +275,7 @@ load:
 					sym->type = S_OTHER;
 			}
 			if (sym->flags & def_flags) {
-				conf_warning("trying to reassign symbol %s", sym->name);
-				break;
+				conf_warning("override: reassigning to symbol %s", sym->name);
 			}
 			if (conf_set_sym_val(sym, def, def_flags, p))
 				continue;
@@ -294,14 +299,12 @@ load:
 				}
 				break;
 			case yes:
-				if (cs->def[def].tri != no) {
-					conf_warning("%s creates inconsistent choice state", sym->name);
-					cs->flags &= ~def_flags;
-				} else
-					cs->def[def].val = sym;
+				if (cs->def[def].tri != no)
+					conf_warning("override: %s changes choice state", sym->name);
+				cs->def[def].val = sym;
 				break;
 			}
-			cs->def[def].tri = E_OR(cs->def[def].tri, sym->def[def].tri);
+			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
 		}
 	}
 	fclose(in);
@@ -313,7 +316,7 @@ load:
 
 int conf_read(const char *name)
 {
-	struct symbol *sym;
+	struct symbol *sym, *choice_sym;
 	struct property *prop;
 	struct expr *e;
 	int i, flags;
@@ -354,9 +357,9 @@ int conf_read(const char *name)
 		 */
 		prop = sym_get_choice_prop(sym);
 		flags = sym->flags;
-		for (e = prop->expr; e; e = e->left.expr)
-			if (e->right.sym->visible != no)
-				flags &= e->right.sym->flags;
+		expr_list_for_each_sym(prop->expr, e, choice_sym)
+			if (choice_sym->visible != no)
+				flags &= choice_sym->flags;
 		sym->flags &= flags | ~SYMBOL_DEF_USER;
 	}
 
@@ -554,15 +557,15 @@ int conf_write(const char *name)
 
 int conf_split_config(void)
 {
-	char *name, path[128], *opwd, *dir, *_name;
+	const char *name;
+	char path[128];
+	char *opwd, *dir, *_name;
 	char *s, *d, c;
 	struct symbol *sym;
 	struct stat sb;
 	int res, i, fd;
 
-	name = getenv("KCONFIG_AUTOCONFIG");
-	if (!name)
-		name = "include/config/auto.conf";
+	name = conf_get_autoconfig_name();
 	conf_read_simple(name, S_DEF_AUTO);
 
 	opwd = malloc(256);
@@ -683,7 +686,7 @@ int conf_write_autoconf(void)
 {
 	struct symbol *sym;
 	const char *str;
-	char *name;
+	const char *name;
 	FILE *out, *out_h;
 	time_t now;
 	int i, l;
@@ -783,9 +786,7 @@ int conf_write_autoconf(void)
 		name = "include/linux/autoconf.h";
 	if (rename(".tmpconfig.h", name))
 		return 1;
-	name = getenv("KCONFIG_AUTOCONFIG");
-	if (!name)
-		name = "include/config/auto.conf";
+	name = conf_get_autoconfig_name();
 	/*
 	 * This must be the last step, kbuild has a dependency on auto.conf
 	 * and this marks the successful completion of the previous steps.
@@ -822,3 +823,93 @@ void conf_set_changed_callback(void (*fn)(void))
 {
 	conf_changed_callback = fn;
 }
+
+
+void conf_set_all_new_symbols(enum conf_def_mode mode)
+{
+	struct symbol *sym, *csym;
+	struct property *prop;
+	struct expr *e;
+	int i, cnt, def;
+
+	for_all_symbols(i, sym) {
+		if (sym_has_value(sym))
+			continue;
+		switch (sym_get_type(sym)) {
+		case S_BOOLEAN:
+		case S_TRISTATE:
+			switch (mode) {
+			case def_yes:
+				sym->def[S_DEF_USER].tri = yes;
+				break;
+			case def_mod:
+				sym->def[S_DEF_USER].tri = mod;
+				break;
+			case def_no:
+				sym->def[S_DEF_USER].tri = no;
+				break;
+			case def_random:
+				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
+				break;
+			default:
+				continue;
+			}
+			if (!(sym_is_choice(sym) && mode == def_random))
+				sym->flags |= SYMBOL_DEF_USER;
+			break;
+		default:
+			break;
+		}
+
+	}
+
+	sym_clear_all_valid();
+
+	if (mode != def_random)
+		return;
+	/*
+	 * We have different type of choice blocks.
+	 * If curr.tri equal to mod then we can select several
+	 * choice symbols in one block.
+	 * In this case we do nothing.
+	 * If curr.tri equal yes then only one symbol can be
+	 * selected in a choice block and we set it to yes,
+	 * and the rest to no.
+	 */
+	for_all_symbols(i, csym) {
+		if (sym_has_value(csym) || !sym_is_choice(csym))
+			continue;
+
+		sym_calc_value(csym);
+
+		if (csym->curr.tri != yes)
+			continue;
+
+		prop = sym_get_choice_prop(csym);
+
+		/* count entries in choice block */
+		cnt = 0;
+		expr_list_for_each_sym(prop->expr, e, sym)
+			cnt++;
+
+		/*
+		 * find a random value and set it to yes,
+		 * set the rest to no so we have only one set
+		 */
+		def = (rand() % cnt);
+
+		cnt = 0;
+		expr_list_for_each_sym(prop->expr, e, sym) {
+			if (def == cnt++) {
+				sym->def[S_DEF_USER].tri = yes;
+				csym->def[S_DEF_USER].val = sym;
+			}
+			else {
+				sym->def[S_DEF_USER].tri = no;
+			}
+		}
+		csym->flags |= SYMBOL_DEF_USER;
+		/* clear VALID to get value calculated */
+		csym->flags &= ~(SYMBOL_VALID);
+	}
+}
diff --git a/package/config/expr.c b/package/config/expr.c
index 5861468..392c7e9 100644
--- a/package/config/expr.c
+++ b/package/config/expr.c
@@ -87,7 +87,7 @@ struct expr *expr_copy(struct expr *org)
 		break;
 	case E_AND:
 	case E_OR:
-	case E_CHOICE:
+	case E_LIST:
 		e->left.expr = expr_copy(org->left.expr);
 		e->right.expr = expr_copy(org->right.expr);
 		break;
@@ -217,7 +217,7 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		expr_free(e2);
 		trans_count = old_count;
 		return res;
-	case E_CHOICE:
+	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -648,7 +648,7 @@ struct expr *expr_transform(struct expr *e)
 	case E_EQUAL:
 	case E_UNEQUAL:
 	case E_SYMBOL:
-	case E_CHOICE:
+	case E_LIST:
 		break;
 	default:
 		e->left.expr = expr_transform(e->left.expr);
@@ -932,7 +932,7 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 		break;
 	case E_SYMBOL:
 		return expr_alloc_comp(type, e->left.sym, sym);
-	case E_CHOICE:
+	case E_LIST:
 	case E_RANGE:
 	case E_NONE:
 		/* panic */;
@@ -955,14 +955,14 @@ tristate expr_calc_value(struct expr *e)
 	case E_AND:
 		val1 = expr_calc_value(e->left.expr);
 		val2 = expr_calc_value(e->right.expr);
-		return E_AND(val1, val2);
+		return EXPR_AND(val1, val2);
 	case E_OR:
 		val1 = expr_calc_value(e->left.expr);
 		val2 = expr_calc_value(e->right.expr);
-		return E_OR(val1, val2);
+		return EXPR_OR(val1, val2);
 	case E_NOT:
 		val1 = expr_calc_value(e->left.expr);
-		return E_NOT(val1);
+		return EXPR_NOT(val1);
 	case E_EQUAL:
 		sym_calc_value(e->left.sym);
 		sym_calc_value(e->right.sym);
@@ -1000,9 +1000,9 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 		if (t2 == E_OR)
 			return 1;
 	case E_OR:
-		if (t2 == E_CHOICE)
+		if (t2 == E_LIST)
 			return 1;
-	case E_CHOICE:
+	case E_LIST:
 		if (t2 == 0)
 			return 1;
 	default:
@@ -1034,12 +1034,18 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		expr_print(e->left.expr, fn, data, E_NOT);
 		break;
 	case E_EQUAL:
-		fn(data, e->left.sym, e->left.sym->name);
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
 		fn(data, NULL, "=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
 	case E_UNEQUAL:
-		fn(data, e->left.sym, e->left.sym->name);
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
 		fn(data, NULL, "!=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
@@ -1053,11 +1059,11 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, NULL, " && ");
 		expr_print(e->right.expr, fn, data, E_AND);
 		break;
-	case E_CHOICE:
+	case E_LIST:
 		fn(data, e->right.sym, e->right.sym->name);
 		if (e->left.expr) {
 			fn(data, NULL, " ^ ");
-			expr_print(e->left.expr, fn, data, E_CHOICE);
+			expr_print(e->left.expr, fn, data, E_LIST);
 		}
 		break;
 	case E_RANGE:
diff --git a/package/config/expr.h b/package/config/expr.h
index 807e6f0..6408fef 100644
--- a/package/config/expr.h
+++ b/package/config/expr.h
@@ -25,14 +25,13 @@ struct file {
 
 #define FILE_BUSY		0x0001
 #define FILE_SCANNED		0x0002
-#define FILE_PRINTED		0x0004
 
 typedef enum tristate {
 	no, mod, yes
 } tristate;
 
 enum expr_type {
-	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_CHOICE, E_SYMBOL, E_RANGE
+	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_LIST, E_SYMBOL, E_RANGE
 };
 
 union expr_data {
@@ -45,9 +44,12 @@ struct expr {
 	union expr_data left, right;
 };
 
-#define E_OR(dep1, dep2)	(((dep1)>(dep2))?(dep1):(dep2))
-#define E_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
-#define E_NOT(dep)		(2-(dep))
+#define EXPR_OR(dep1, dep2)	(((dep1)>(dep2))?(dep1):(dep2))
+#define EXPR_AND(dep1, dep2)	(((dep1)<(dep2))?(dep1):(dep2))
+#define EXPR_NOT(dep)		(2-(dep))
+
+#define expr_list_for_each_sym(l, e, s) \
+	for (e = (l); e && (s = e->right.sym); e = e->left.expr)
 
 struct expr_value {
 	struct expr *expr;
@@ -63,9 +65,13 @@ enum symbol_type {
 	S_UNKNOWN, S_BOOLEAN, S_TRISTATE, S_INT, S_HEX, S_STRING, S_OTHER
 };
 
+/* enum values are used as index to symbol.def[] */
 enum {
 	S_DEF_USER,		/* main user value */
-	S_DEF_AUTO
+	S_DEF_AUTO,		/* values read from auto.conf */
+	S_DEF_DEF3,		/* Reserved for UI usage */
+	S_DEF_DEF4,		/* Reserved for UI usage */
+	S_DEF_COUNT
 };
 
 struct symbol {
@@ -73,7 +79,7 @@ struct symbol {
 	char *name;
 	enum symbol_type type;
 	struct symbol_value curr;
-	struct symbol_value def[4];
+	struct symbol_value def[S_DEF_COUNT];
 	tristate visible;
 	int flags;
 	struct property *prop;
@@ -82,42 +88,64 @@ struct symbol {
 
 #define for_all_symbols(i, sym) for (i = 0; i < 257; i++) for (sym = symbol_hash[i]; sym; sym = sym->next) if (sym->type != S_OTHER)
 
-#define SYMBOL_CONST		0x0001
-#define SYMBOL_CHECK		0x0008
-#define SYMBOL_CHOICE		0x0010
-#define SYMBOL_CHOICEVAL	0x0020
-#define SYMBOL_PRINTED		0x0040
-#define SYMBOL_VALID		0x0080
-#define SYMBOL_OPTIONAL		0x0100
-#define SYMBOL_WRITE		0x0200
-#define SYMBOL_CHANGED		0x0400
-#define SYMBOL_AUTO		0x1000
-#define SYMBOL_CHECKED		0x2000
-#define SYMBOL_WARNED		0x8000
-#define SYMBOL_DEF		0x10000
-#define SYMBOL_DEF_USER		0x10000
-#define SYMBOL_DEF_AUTO		0x20000
-#define SYMBOL_DEF3		0x40000
-#define SYMBOL_DEF4		0x80000
+#define SYMBOL_CONST      0x0001  /* symbol is const */
+#define SYMBOL_CHECK      0x0008  /* used during dependency checking */
+#define SYMBOL_CHOICE     0x0010  /* start of a choice block (null name) */
+#define SYMBOL_CHOICEVAL  0x0020  /* used as a value in a choice block */
+#define SYMBOL_VALID      0x0080  /* set when symbol.curr is calculated */
+#define SYMBOL_OPTIONAL   0x0100  /* choice is optional - values can be 'n' */
+#define SYMBOL_WRITE      0x0200  /* ? */
+#define SYMBOL_CHANGED    0x0400  /* ? */
+#define SYMBOL_AUTO       0x1000  /* value from environment variable */
+#define SYMBOL_CHECKED    0x2000  /* used during dependency checking */
+#define SYMBOL_WARNED     0x8000  /* warning has been issued */
+
+/* Set when symbol.def[] is used */
+#define SYMBOL_DEF        0x10000  /* First bit of SYMBOL_DEF */
+#define SYMBOL_DEF_USER   0x10000  /* symbol.def[S_DEF_USER] is valid */
+#define SYMBOL_DEF_AUTO   0x20000  /* symbol.def[S_DEF_AUTO] is valid */
+#define SYMBOL_DEF3       0x40000  /* symbol.def[S_DEF_3] is valid */
+#define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
 
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		257
 #define SYMBOL_HASHMASK		0xff
 
+/* A property represent the config options that can be associated
+ * with a config "symbol".
+ * Sample:
+ * config FOO
+ *         default y
+ *         prompt "foo prompt"
+ *         select BAR
+ * config BAZ
+ *         int "BAZ Value"
+ *         range 1..255
+ */
 enum prop_type {
-	P_UNKNOWN, P_PROMPT, P_COMMENT, P_MENU, P_DEFAULT, P_CHOICE, P_SELECT, P_RANGE
+	P_UNKNOWN,
+	P_PROMPT,   /* prompt "foo prompt" or "BAZ Value" */
+	P_COMMENT,  /* text associated with a comment */
+	P_MENU,     /* prompt associated with a menuconfig option */
+	P_DEFAULT,  /* default y */
+	P_CHOICE,   /* choice value */
+	P_SELECT,   /* select BAR */
+	P_RANGE,    /* range 7..100 (for a symbol) */
+	P_ENV,      /* value from environment variable */
 };
 
 struct property {
-	struct property *next;
-	struct symbol *sym;
-	enum prop_type type;
-	const char *text;
+	struct property *next;     /* next property - null if last */
+	struct symbol *sym;        /* the symbol for which the property is associated */
+	enum prop_type type;       /* type of property */
+	const char *text;          /* the prompt value - P_PROMPT, P_MENU, P_COMMENT */
 	struct expr_value visible;
-	struct expr *expr;
-	struct menu *menu;
-	struct file *file;
-	int lineno;
+	struct expr *expr;         /* the optional conditional part of the property */
+	struct menu *menu;         /* the menu the property are associated with
+	                            * valid for: P_SELECT, P_RANGE, P_CHOICE,
+	                            * P_PROMPT, P_DEFAULT, P_MENU, P_COMMENT */
+	struct file *file;         /* what file was this property defined */
+	int lineno;                /* what lineno was this property defined */
 };
 
 #define for_all_properties(sym, st, tok) \
diff --git a/package/config/gconf.c b/package/config/gconf.c
index afbddec..b8a1661 100644
--- a/package/config/gconf.c
+++ b/package/config/gconf.c
@@ -119,8 +119,6 @@ const char *dbg_print_flags(int val)
 		strcat(buf, "choice/");
 	if (val & SYMBOL_CHOICEVAL)
 		strcat(buf, "choiceval/");
-	if (val & SYMBOL_PRINTED)
-		strcat(buf, "printed/");
 	if (val & SYMBOL_VALID)
 		strcat(buf, "valid/");
 	if (val & SYMBOL_OPTIONAL)
@@ -457,14 +455,18 @@ static void text_insert_help(struct menu *menu)
 {
 	GtkTextBuffer *buffer;
 	GtkTextIter start, end;
-	const char *prompt = menu_get_prompt(menu);
+	const char *prompt = _(menu_get_prompt(menu));
 	gchar *name;
 	const char *help;
 
-	help = _(menu_get_help(menu));
+	help = menu_get_help(menu);
+
+	/* Gettextize if the help text not empty */
+	if ((help != 0) && (help[0] != 0))
+		help = _(help);
 
 	if (menu->sym && menu->sym->name)
-		name = g_strdup_printf(_(menu->sym->name));
+		name = g_strdup_printf(menu->sym->name);
 	else
 		name = g_strdup("");
 
@@ -1171,7 +1173,7 @@ static gchar **fill_row(struct menu *menu)
 	bzero(row, sizeof(row));
 
 	row[COL_OPTION] =
-	    g_strdup_printf("%s %s", menu_get_prompt(menu),
+	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
 			    sym && sym_has_value(sym) ? "(NEW)" : "");
 
 	if (show_all && !menu_is_visible(menu))
@@ -1221,7 +1223,7 @@ static gchar **fill_row(struct menu *menu)
 
 		if (def_menu)
 			row[COL_VALUE] =
-			    g_strdup(menu_get_prompt(def_menu));
+			    g_strdup(_(menu_get_prompt(def_menu)));
 	}
 	if (sym->flags & SYMBOL_CHOICEVAL)
 		row[COL_BTNRAD] = GINT_TO_POINTER(TRUE);
diff --git a/package/config/kconfig-language.txt b/package/config/kconfig-language.txt
index 616043a..c412c24 100644
--- a/package/config/kconfig-language.txt
+++ b/package/config/kconfig-language.txt
@@ -24,7 +24,7 @@ visible if its parent entry is also visible.
 Menu entries
 ------------
 
-Most entries define a config option, all other entries help to organize
+Most entries define a config option; all other entries help to organize
 them. A single configuration option is defined like this:
 
 config MODVERSIONS
@@ -50,7 +50,7 @@ applicable everywhere (see syntax).
 
 - type definition: "bool"/"tristate"/"string"/"hex"/"int"
   Every config option must have a type. There are only two basic types:
-  tristate and string, the other types are based on these two. The type
+  tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
   are equivalent:
 
@@ -104,14 +104,15 @@ applicable everywhere (see syntax).
   Reverse dependencies can only be used with boolean or tristate
   symbols.
   Note:
-	select is evil.... select will by brute force set a symbol
-	equal to 'y' without visiting the dependencies. So abusing
-	select you are able to select a symbol FOO even if FOO depends
-	on BAR that is not set. In general use select only for
-	non-visible symbols (no promts anywhere) and for symbols with
-	no dependencies. That will limit the usefulness but on the
-	other hand avoid the illegal configurations all over. kconfig
-	should one day warn about such things.
+	select should be used with care. select will force
+	a symbol to a value without visiting the dependencies.
+	By abusing select you are able to select a symbol FOO even
+	if FOO depends on BAR that is not set.
+	In general use select only for non-visible symbols
+	(no prompts anywhere) and for symbols with no dependencies.
+	That will limit the usefulness but on the other hand avoid
+	the illegal configurations all over.
+	kconfig should one day warn about such things.
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
   This allows to limit the range of possible input values for int
@@ -127,6 +128,27 @@ applicable everywhere (see syntax).
   used to help visually separate configuration logic from help within
   the file as an aid to developers.
 
+- misc options: "option" <symbol>[=<value>]
+  Various less common options can be defined via this option syntax,
+  which can modify the behaviour of the menu entry and its config
+  symbol. These options are currently possible:
+
+  - "defconfig_list"
+    This declares a list of default entries which can be used when
+    looking for the default configuration (which is used when the main
+    .config doesn't exists yet.)
+
+  - "modules"
+    This declares the symbol to be used as the MODULES symbol, which
+    enables the third modular state for all config symbols.
+
+  - "env"=<value>
+    This imports the environment variable into Kconfig. It behaves like
+    a default, except that the value comes from the environment, this
+    also means that the behaviour when mixing it with normal defaults is
+    undefined at this point. The symbol is currently not exported back
+    to the build environment (if this is desired, it can be done via
+    another symbol).
 
 Menu dependencies
 -----------------
@@ -162,9 +184,9 @@ An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
 respectively for calculations). A menu entry becomes visible when it's
 expression evaluates to 'm' or 'y'.
 
-There are two types of symbols: constant and nonconstant symbols.
-Nonconstant symbols are the most common ones and are defined with the
-'config' statement. Nonconstant symbols consist entirely of alphanumeric
+There are two types of symbols: constant and non-constant symbols.
+Non-constant symbols are the most common ones and are defined with the
+'config' statement. Non-constant symbols consist entirely of alphanumeric
 characters or underscores.
 Constant symbols are only part of expressions. Constant symbols are
 always surrounded by single or double quotes. Within the quote, any
@@ -301,3 +323,57 @@ mainmenu:
 
 This sets the config program's title bar if the config program chooses
 to use it.
+
+
+Kconfig hints
+-------------
+This is a collection of Kconfig tips, most of which aren't obvious at
+first glance and most of which have become idioms in several Kconfig
+files.
+
+Adding common features and make the usage configurable
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+It is a common idiom to implement a feature/functionality that are
+relevant for some architectures but not all.
+The recommended way to do so is to use a config variable named HAVE_*
+that is defined in a common Kconfig file and selected by the relevant
+architectures.
+An example is the generic IOMAP functionality.
+
+We would in lib/Kconfig see:
+
+# Generic IOMAP is used to ...
+config HAVE_GENERIC_IOMAP
+
+config GENERIC_IOMAP
+	depends on HAVE_GENERIC_IOMAP && FOO
+
+And in lib/Makefile we would see:
+obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
+
+For each architecture using the generic IOMAP functionality we would see:
+
+config X86
+	select ...
+	select HAVE_GENERIC_IOMAP
+	select ...
+
+Note: we use the existing config option and avoid creating a new
+config variable to select HAVE_GENERIC_IOMAP.
+
+Note: the use of the internal config variable HAVE_GENERIC_IOMAP, it is
+introduced to overcome the limitation of select which will force a
+config option to 'y' no matter the dependencies.
+The dependencies are moved to the symbol GENERIC_IOMAP and we avoid the
+situation where select forces a symbol equals to 'y'.
+
+Build as module only
+~~~~~~~~~~~~~~~~~~~~
+To restrict a component build to module-only, qualify its config symbol
+with "depends on m".  E.g.:
+
+config FOO
+	depends on BAR && m
+
+limits FOO to module (=m) or disabled (=n).
+
diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
index a3a35ec..e89046b 100644
--- a/package/config/kconfig-to-buildroot2.patch
+++ b/package/config/kconfig-to-buildroot2.patch
@@ -1,82 +1,111 @@
-diff -rduNp config.new.oorig/Makefile config.new/Makefile
---- config.new.oorig/Makefile	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/Makefile	2008-04-07 11:06:30.000000000 +0200
-@@ -123,6 +123,9 @@ hostprogs-y := conf qconf gconf kxgettex
+---
+ Makefile            |    3 +
+ README.buildroot2   |   22 ++++++++++
+ conf.c              |   13 ++----
+ confdata.c          |  101 ++++++++++++++++++++++++++------------------------
+ expr.c              |   42 ++++++++++----------
+ gconf.c             |    4 -
+ gconf.glade         |    2 
+ mconf.c             |   39 +++++++++----------
+ util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ zconf.tab.c_shipped |    2 
+ zconf.y             |    2 
+ 11 files changed, 234 insertions(+), 101 deletions(-)
+
+Index: config/Makefile
+===================================================================
+--- config.orig/Makefile
++++ config/Makefile
+@@ -124,6 +124,9 @@
  ifeq ($(MAKECMDGOALS),menuconfig)
  	hostprogs-y += mconf
  endif
 +ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-+	hostprogs-y += mconf
++       hostprogs-y += mconf
 +endif
  
  ifeq ($(MAKECMDGOALS),xconfig)
  	qconf-target := 1
-@@ -181,8 +184,8 @@ $(obj)/.tmp_qtcheck:
- 	  done; \
- 	  if [ -z "$$dir" ]; then \
- 	    echo "*"; \
--	    echo "* Unable to find the QT3 installation. Please make sure that"; \
--	    echo "* the QT3 development package is correctly installed and"; \
-+	    echo "* Unable to find the QT installation. Please make sure that"; \
-+	    echo "* the QT development package is correctly installed and"; \
- 	    echo "* either install pkg-config or set the QTDIR environment"; \
- 	    echo "* variable to the correct location."; \
- 	    echo "*"; \
-diff -rduNp config.new.oorig/conf.c config.new/conf.c
---- config.new.oorig/conf.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/conf.c	2008-04-07 11:06:30.000000000 +0200
-@@ -545,7 +545,7 @@ int main(int ac, char **av)
- 		exit(1);
+Index: config/README.buildroot2
+===================================================================
+--- /dev/null
++++ config/README.buildroot2
+@@ -0,0 +1,22 @@
++This is a copy of the kconfig code in the kernel (currently 2.6.24.4) tweaked
++to suit Buildroot.
++
++To update:
++	cp -r /usr/src/linux/scripts/kconfig package/config.new
++	cd package/config.new
++	cp /usr/src/linux/Documentation/kbuild/kconfig-language.txt .
++	patch -p1 < ../config/kconfig-to-buildroot2.patch
++	mv Makefile Makefile.kconfig
++	cp ../config/README.buildroot2 .
++	cp ../config/foo.h .
++	cp ../config/Makefile .
++	cp ../config/kconfig-to-buildroot2.patch .
++	cd ..
++	rm -rf config
++	mv config.new config
++
++Then verify the toplevel targets work:
++	config
++	defconfig
++	menuconfig
++	oldconfig
+Index: config/conf.c
+===================================================================
+--- config.orig/conf.c
++++ config/conf.c
+@@ -496,13 +496,12 @@
  	}
+ 	name = av[optind];
  	conf_parse(name);
 -	//zconfdump(stdout);
-+	/*zconfdump(stdout);*/
- 	switch (input_mode) {
- 	case set_default:
- 		if (!defconfig_file)
-@@ -560,11 +560,11 @@ int main(int ac, char **av)
- 	case ask_silent:
- 		if (stat(".config", &tmpstat)) {
- 			printf(_("***\n"
+ 	if (sync_kconfig) {
+ 		name = conf_get_configname();
+ 		if (stat(name, &tmpstat)) {
+ 			fprintf(stderr, _("***\n"
 -				"*** You have not yet configured your kernel!\n"
--				"*** (missing kernel .config file)\n"
+-				"*** (missing kernel config file \"%s\")\n"
 +				"*** You have not yet configured Buildroot!\n"
-+				"*** (missing .config file)\n"
++				"*** (missing .config file \"%s\")\n"
  				"***\n"
  				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
--				"*** \"make menuconfig\" or \"make xconfig\").\n"
-+				"*** \"make menuconfig\" or \"make config\").\n"
- 				"***\n"));
+ 				"*** \"make menuconfig\" or \"make xconfig\").\n"
+@@ -557,7 +556,7 @@
+ 			name = getenv("KCONFIG_NOSILENTUPDATE");
+ 			if (name && *name) {
+ 				fprintf(stderr,
+-					_("\n*** Kernel configuration requires explicit update.\n\n"));
++					_("\n*** Buildroot configuration requires explicit update.\n\n"));
+ 				return 1;
+ 			}
+ 		}
+@@ -600,16 +599,16 @@
+ 		 * All other commands are only used to generate a config.
+ 		 */
+ 		if (conf_get_changed() && conf_write(NULL)) {
+-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
  			exit(1);
  		}
-@@ -607,7 +607,7 @@ int main(int ac, char **av)
- 	} else if (conf_get_changed()) {
- 		name = getenv("KCONFIG_NOSILENTUPDATE");
- 		if (name && *name) {
--			fprintf(stderr, _("\n*** Kernel configuration requires explicit update.\n\n"));
-+			fprintf(stderr, _("\n*** Buildroot configuration requires explicit update.\n\n"));
+ 		if (conf_write_autoconf()) {
+-			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
  			return 1;
  		}
- 	} else
-@@ -618,12 +618,12 @@ int main(int ac, char **av)
- 		check_conf(&rootmenu);
- 	} while (conf_cnt);
- 	if (conf_write(NULL)) {
--		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 		return 1;
- 	}
- skip_check:
--	if (input_mode == ask_silent && conf_write_autoconf()) {
--		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+	if (/*input_mode == ask_silent &&*/ conf_write_autoconf()) {
-+		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 		return 1;
+ 	} else {
+ 		if (conf_write(NULL)) {
+-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+ 			exit(1);
+ 		}
  	}
- 
-diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
---- config.new.oorig/confdata.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/confdata.c	2008-04-07 11:06:30.000000000 +0200
+Index: config/confdata.c
+===================================================================
+--- config.orig/confdata.c
++++ config/confdata.c
 @@ -11,6 +11,7 @@
  #include <string.h>
  #include <time.h>
@@ -85,7 +114,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  #define LKC_DIRECT_LINK
  #include "lkc.h"
-@@ -21,7 +22,7 @@ static void conf_warning(const char *fmt
+@@ -21,7 +22,7 @@
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
  
@@ -94,7 +123,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  static void conf_warning(const char *fmt, ...)
  {
-@@ -36,7 +37,7 @@ static void conf_warning(const char *fmt
+@@ -36,16 +37,16 @@
  
  const char *conf_get_configname(void)
  {
@@ -103,7 +132,18 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  	return name ? name : ".config";
  }
-@@ -212,22 +213,22 @@ load:
+ 
+ const char *conf_get_autoconfig_name(void)
+ {
+-	char *name = getenv("KCONFIG_AUTOCONFIG");
++	char *name = getenv("BUILDROOT_AUTOCONFIG");
+ 
+-	return name ? name : "include/config/auto.conf";
++	return name ? name : "$(BR2_DEPENDS_DIR)/config/auto.conf";
+ }
+ 
+ static char *conf_expand_value(const char *in)
+@@ -219,22 +220,22 @@
  		sym = NULL;
  		switch (line[0]) {
  		case '#':
@@ -121,8 +161,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
 -				sym = sym_find(line + 9);
 +				sym = sym_find(line + 2);
  				if (!sym) {
--					conf_warning("trying to assign nonexistent symbol %s", line + 9);
-+					conf_warning("trying to assign nonexistent symbol %s", line + 2);
+ 					sym_add_change_count(1);
  					break;
  				}
  			} else {
@@ -131,7 +170,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
  			}
-@@ -245,12 +246,8 @@ load:
+@@ -251,12 +252,8 @@
  				;
  			}
  			break;
@@ -146,15 +185,14 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  			if (!p)
  				continue;
  			*p++ = 0;
-@@ -261,13 +258,13 @@ load:
+@@ -267,13 +264,13 @@
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
 -				sym = sym_find(line + 7);
 +				sym = sym_find(line);
  				if (!sym) {
--					conf_warning("trying to assign nonexistent symbol %s", line + 7);
-+					conf_warning("trying to assign nonexistent symbol %s", line);
+ 					sym_add_change_count(1);
  					break;
  				}
  			} else {
@@ -163,7 +201,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
  			}
-@@ -440,7 +437,7 @@ int conf_write(const char *name)
+@@ -443,7 +440,7 @@
  	if (!out)
  		return 1;
  
@@ -172,7 +210,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -449,10 +446,8 @@ int conf_write(const char *name)
+@@ -452,10 +449,8 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -183,7 +221,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  		     use_timestamp ? "# " : "",
  		     use_timestamp ? ctime(&now) : "");
  
-@@ -486,19 +481,19 @@ int conf_write(const char *name)
+@@ -489,19 +484,19 @@
  			case S_TRISTATE:
  				switch (sym_get_tristate_value(sym)) {
  				case no:
@@ -207,7 +245,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  				while (1) {
  					l = strcspn(str, "\"\\");
  					if (l) {
-@@ -514,12 +509,12 @@ int conf_write(const char *name)
+@@ -517,12 +512,12 @@
  			case S_HEX:
  				str = sym_get_string_value(sym);
  				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -222,17 +260,16 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  				break;
  			}
  		}
-@@ -559,7 +554,7 @@ int conf_write(const char *name)
- 
- int conf_split_config(void)
+@@ -564,6 +559,7 @@
  {
--	char *name, path[128];
-+	char *name, path[128], *opwd, *dir, *_name;
+ 	const char *name;
+ 	char path[128];
++	char *opwd, *dir, *_name;
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -570,8 +565,20 @@ int conf_split_config(void)
- 		name = "include/config/auto.conf";
+@@ -572,8 +568,20 @@
+ 	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
 -	if (chdir("include/config"))
@@ -253,7 +290,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -664,9 +671,11 @@ int conf_split_config(void)
+@@ -666,9 +674,11 @@
  		close(fd);
  	}
  out:
@@ -268,7 +305,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  	return res;
  }
  
-@@ -681,7 +690,7 @@ int conf_write_autoconf(void)
+@@ -683,7 +693,7 @@
  
  	sym_clear_all_valid();
  
@@ -277,7 +314,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  	if (conf_split_config())
  		return 1;
-@@ -696,22 +705,19 @@ int conf_write_autoconf(void)
+@@ -698,22 +708,19 @@
  		return 1;
  	}
  
@@ -304,7 +341,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  
  	for_all_symbols(i, sym) {
  		sym_calc_value(sym);
-@@ -724,19 +730,19 @@ int conf_write_autoconf(void)
+@@ -726,19 +733,19 @@
  			case no:
  				break;
  			case mod:
@@ -330,7 +367,7 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  			while (1) {
  				l = strcspn(str, "\"\\");
  				if (l) {
-@@ -756,14 +762,14 @@ int conf_write_autoconf(void)
+@@ -758,14 +765,14 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
@@ -349,10 +386,11 @@ diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
  			break;
  		default:
  			break;
-diff -rduNp config.new.oorig/expr.c config.new/expr.c
---- config.new.oorig/expr.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/expr.c	2008-04-07 11:06:30.000000000 +0200
-@@ -331,7 +331,7 @@ struct expr *expr_trans_bool(struct expr
+Index: config/expr.c
+===================================================================
+--- config.orig/expr.c
++++ config/expr.c
+@@ -331,7 +331,7 @@
  		e->right.expr = expr_trans_bool(e->right.expr);
  		break;
  	case E_UNEQUAL:
@@ -361,7 +399,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  		if (e->left.sym->type == S_TRISTATE) {
  			if (e->right.sym == &symbol_no) {
  				e->type = E_SYMBOL;
-@@ -380,19 +380,19 @@ struct expr *expr_join_or(struct expr *e
+@@ -380,19 +380,19 @@
  		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
  		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
  		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
@@ -384,7 +422,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
  		}
  	}
-@@ -443,29 +443,29 @@ struct expr *expr_join_and(struct expr *
+@@ -443,29 +443,29 @@
  
  	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
  	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
@@ -419,7 +457,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			sym2 = e2->right.sym;
  			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
  				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-@@ -474,19 +474,19 @@ struct expr *expr_join_and(struct expr *
+@@ -474,19 +474,19 @@
  		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
  			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
  			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
@@ -442,7 +480,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
  
  		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-@@ -579,7 +579,7 @@ static void expr_eliminate_dups2(enum ex
+@@ -579,7 +579,7 @@
  	switch (e1->type) {
  	case E_OR:
  		expr_eliminate_dups2(e1->type, &e1, &e1);
@@ -451,7 +489,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
  		tmp2 = expr_copy(e2);
  		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-@@ -594,7 +594,7 @@ static void expr_eliminate_dups2(enum ex
+@@ -594,7 +594,7 @@
  		break;
  	case E_AND:
  		expr_eliminate_dups2(e1->type, &e1, &e1);
@@ -460,7 +498,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
  		tmp2 = expr_copy(e2);
  		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-@@ -703,7 +703,7 @@ struct expr *expr_transform(struct expr 
+@@ -703,7 +703,7 @@
  	case E_NOT:
  		switch (e->left.expr->type) {
  		case E_NOT:
@@ -469,7 +507,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			tmp = e->left.expr->left.expr;
  			free(e->left.expr);
  			free(e);
-@@ -712,14 +712,14 @@ struct expr *expr_transform(struct expr 
+@@ -712,14 +712,14 @@
  			break;
  		case E_EQUAL:
  		case E_UNEQUAL:
@@ -486,7 +524,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			tmp = e->left.expr;
  			e->type = E_AND;
  			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -728,7 +728,7 @@ struct expr *expr_transform(struct expr 
+@@ -728,7 +728,7 @@
  			e = expr_transform(e);
  			break;
  		case E_AND:
@@ -495,7 +533,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  			tmp = e->left.expr;
  			e->type = E_OR;
  			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -738,7 +738,7 @@ struct expr *expr_transform(struct expr 
+@@ -738,7 +738,7 @@
  			break;
  		case E_SYMBOL:
  			if (e->left.expr->left.sym == &symbol_yes) {
@@ -504,7 +542,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  				tmp = e->left.expr;
  				free(e);
  				e = tmp;
-@@ -747,7 +747,7 @@ struct expr *expr_transform(struct expr 
+@@ -747,7 +747,7 @@
  				break;
  			}
  			if (e->left.expr->left.sym == &symbol_mod) {
@@ -513,7 +551,7 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  				tmp = e->left.expr;
  				free(e);
  				e = tmp;
-@@ -756,7 +756,7 @@ struct expr *expr_transform(struct expr 
+@@ -756,7 +756,7 @@
  				break;
  			}
  			if (e->left.expr->left.sym == &symbol_no) {
@@ -522,22 +560,11 @@ diff -rduNp config.new.oorig/expr.c config.new/expr.c
  				tmp = e->left.expr;
  				free(e);
  				e = tmp;
-diff -rduNp config.new.oorig/expr.h config.new/expr.h
---- config.new.oorig/expr.h	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/expr.h	2008-04-07 11:06:30.000000000 +0200
-@@ -65,7 +65,7 @@ enum symbol_type {
- 
- enum {
- 	S_DEF_USER,		/* main user value */
--	S_DEF_AUTO,
-+	S_DEF_AUTO
- };
- 
- struct symbol {
-diff -rduNp config.new.oorig/gconf.c config.new/gconf.c
---- config.new.oorig/gconf.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/gconf.c	2008-04-07 11:06:30.000000000 +0200
-@@ -268,8 +268,8 @@ void init_main_window(const gchar * glad
+Index: config/gconf.c
+===================================================================
+--- config.orig/gconf.c
++++ config/gconf.c
+@@ -266,8 +266,8 @@
  					  /*"style", PANGO_STYLE_OBLIQUE, */
  					  NULL);
  
@@ -548,9 +575,10 @@ diff -rduNp config.new.oorig/gconf.c config.new/gconf.c
  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
  
  	gtk_widget_show(main_wnd);
-diff -rduNp config.new.oorig/gconf.glade config.new/gconf.glade
---- config.new.oorig/gconf.glade	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/gconf.glade	2008-04-07 11:06:30.000000000 +0200
+Index: config/gconf.glade
+===================================================================
+--- config.orig/gconf.glade
++++ config/gconf.glade
 @@ -5,7 +5,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -560,576 +588,11 @@ diff -rduNp config.new.oorig/gconf.glade config.new/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-diff -rduNp config.new.oorig/kconfig-to-buildroot2.patch config.new/kconfig-to-buildroot2.patch
---- config.new.oorig/kconfig-to-buildroot2.patch	1970-01-01 01:00:00.000000000 +0100
-+++ config.new/kconfig-to-buildroot2.patch	2008-04-07 11:12:30.000000000 +0200
-@@ -0,0 +1,562 @@
-+diff -rduNp config.new.oorig/Makefile config.new/Makefile
-+--- config.new.oorig/Makefile	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/Makefile	2008-04-07 11:06:30.000000000 +0200
-+@@ -123,6 +123,9 @@ hostprogs-y := conf qconf gconf kxgettex
-+ ifeq ($(MAKECMDGOALS),menuconfig)
-+ 	hostprogs-y += mconf
-+ endif
-++ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-++	hostprogs-y += mconf
-++endif
-+ 
-+ ifeq ($(MAKECMDGOALS),xconfig)
-+ 	qconf-target := 1
-+@@ -181,8 +184,8 @@ $(obj)/.tmp_qtcheck:
-+ 	  done; \
-+ 	  if [ -z "$$dir" ]; then \
-+ 	    echo "*"; \
-+-	    echo "* Unable to find the QT3 installation. Please make sure that"; \
-+-	    echo "* the QT3 development package is correctly installed and"; \
-++	    echo "* Unable to find the QT installation. Please make sure that"; \
-++	    echo "* the QT development package is correctly installed and"; \
-+ 	    echo "* either install pkg-config or set the QTDIR environment"; \
-+ 	    echo "* variable to the correct location."; \
-+ 	    echo "*"; \
-+diff -rduNp config.new.oorig/conf.c config.new/conf.c
-+--- config.new.oorig/conf.c	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/conf.c	2008-04-07 11:06:30.000000000 +0200
-+@@ -545,7 +545,7 @@ int main(int ac, char **av)
-+ 		exit(1);
-+ 	}
-+ 	conf_parse(name);
-+-	//zconfdump(stdout);
-++	/*zconfdump(stdout);*/
-+ 	switch (input_mode) {
-+ 	case set_default:
-+ 		if (!defconfig_file)
-+@@ -560,11 +560,11 @@ int main(int ac, char **av)
-+ 	case ask_silent:
-+ 		if (stat(".config", &tmpstat)) {
-+ 			printf(_("***\n"
-+-				"*** You have not yet configured your kernel!\n"
-+-				"*** (missing kernel .config file)\n"
-++				"*** You have not yet configured Buildroot!\n"
-++				"*** (missing .config file)\n"
-+ 				"***\n"
-+ 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
-+-				"*** \"make menuconfig\" or \"make xconfig\").\n"
-++				"*** \"make menuconfig\" or \"make config\").\n"
-+ 				"***\n"));
-+ 			exit(1);
-+ 		}
-+@@ -607,7 +607,7 @@ int main(int ac, char **av)
-+ 	} else if (conf_get_changed()) {
-+ 		name = getenv("KCONFIG_NOSILENTUPDATE");
-+ 		if (name && *name) {
-+-			fprintf(stderr, _("\n*** Kernel configuration requires explicit update.\n\n"));
-++			fprintf(stderr, _("\n*** Buildroot configuration requires explicit update.\n\n"));
-+ 			return 1;
-+ 		}
-+ 	} else
-+@@ -618,12 +618,12 @@ int main(int ac, char **av)
-+ 		check_conf(&rootmenu);
-+ 	} while (conf_cnt);
-+ 	if (conf_write(NULL)) {
-+-		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-++		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
-+ 		return 1;
-+ 	}
-+ skip_check:
-+-	if (input_mode == ask_silent && conf_write_autoconf()) {
-+-		fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-++	if (/*input_mode == ask_silent &&*/ conf_write_autoconf()) {
-++		fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
-+ 		return 1;
-+ 	}
-+ 
-+diff -rduNp config.new.oorig/confdata.c config.new/confdata.c
-+--- config.new.oorig/confdata.c	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/confdata.c	2008-04-07 11:06:30.000000000 +0200
-+@@ -11,6 +11,7 @@
-+ #include <string.h>
-+ #include <time.h>
-+ #include <unistd.h>
-++#include <libgen.h>
-+ 
-+ #define LKC_DIRECT_LINK
-+ #include "lkc.h"
-+@@ -21,7 +22,7 @@ static void conf_warning(const char *fmt
-+ static const char *conf_filename;
-+ static int conf_lineno, conf_warnings, conf_unsaved;
-+ 
-+-const char conf_defname[] = "arch/$ARCH/defconfig";
-++const char conf_defname[] = ".defconfig";
-+ 
-+ static void conf_warning(const char *fmt, ...)
-+ {
-+@@ -36,7 +37,7 @@ static void conf_warning(const char *fmt
-+ 
-+ const char *conf_get_configname(void)
-+ {
-+-	char *name = getenv("KCONFIG_CONFIG");
-++	char *name = getenv("BUILDROOT_CONFIG");
-+ 
-+ 	return name ? name : ".config";
-+ }
-+@@ -212,22 +213,22 @@ load:
-+ 		sym = NULL;
-+ 		switch (line[0]) {
-+ 		case '#':
-+-			if (memcmp(line + 2, "CONFIG_", 7))
-++			if (line[1]!=' ')
-+ 				continue;
-+-			p = strchr(line + 9, ' ');
-++			p = strchr(line + 2, ' ');
-+ 			if (!p)
-+ 				continue;
-+ 			*p++ = 0;
-+ 			if (strncmp(p, "is not set", 10))
-+ 				continue;
-+ 			if (def == S_DEF_USER) {
-+-				sym = sym_find(line + 9);
-++				sym = sym_find(line + 2);
-+ 				if (!sym) {
-+-					conf_warning("trying to assign nonexistent symbol %s", line + 9);
-++					conf_warning("trying to assign nonexistent symbol %s", line + 2);
-+ 					break;
-+ 				}
-+ 			} else {
-+-				sym = sym_lookup(line + 9, 0);
-++				sym = sym_lookup(line + 2, 0);
-+ 				if (sym->type == S_UNKNOWN)
-+ 					sym->type = S_BOOLEAN;
-+ 			}
-+@@ -245,12 +246,8 @@ load:
-+ 				;
-+ 			}
-+ 			break;
-+-		case 'C':
-+-			if (memcmp(line, "CONFIG_", 7)) {
-+-				conf_warning("unexpected data");
-+-				continue;
-+-			}
-+-			p = strchr(line + 7, '=');
-++		case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
-++			p = strchr(line, '=');
-+ 			if (!p)
-+ 				continue;
-+ 			*p++ = 0;
-+@@ -261,13 +258,13 @@ load:
-+ 					*p2 = 0;
-+ 			}
-+ 			if (def == S_DEF_USER) {
-+-				sym = sym_find(line + 7);
-++				sym = sym_find(line);
-+ 				if (!sym) {
-+-					conf_warning("trying to assign nonexistent symbol %s", line + 7);
-++					conf_warning("trying to assign nonexistent symbol %s", line);
-+ 					break;
-+ 				}
-+ 			} else {
-+-				sym = sym_lookup(line + 7, 0);
-++				sym = sym_lookup(line, 0);
-+ 				if (sym->type == S_UNKNOWN)
-+ 					sym->type = S_OTHER;
-+ 			}
-+@@ -440,7 +437,7 @@ int conf_write(const char *name)
-+ 	if (!out)
-+ 		return 1;
-+ 
-+-	sym = sym_lookup("KERNELVERSION", 0);
-++	sym = sym_lookup("BR2_VERSION", 0);
-+ 	sym_calc_value(sym);
-+ 	time(&now);
-+ 	env = getenv("KCONFIG_NOTIMESTAMP");
-+@@ -449,10 +446,8 @@ int conf_write(const char *name)
-+ 
-+ 	fprintf(out, _("#\n"
-+ 		       "# Automatically generated make config: don't edit\n"
-+-		       "# Linux kernel version: %s\n"
-+ 		       "%s%s"
-+ 		       "#\n"),
-+-		     sym_get_string_value(sym),
-+ 		     use_timestamp ? "# " : "",
-+ 		     use_timestamp ? ctime(&now) : "");
-+ 
-+@@ -486,19 +481,19 @@ int conf_write(const char *name)
-+ 			case S_TRISTATE:
-+ 				switch (sym_get_tristate_value(sym)) {
-+ 				case no:
-+-					fprintf(out, "# CONFIG_%s is not set\n", sym->name);
-++					fprintf(out, "# %s is not set\n", sym->name);
-+ 					break;
-+ 				case mod:
-+-					fprintf(out, "CONFIG_%s=m\n", sym->name);
-++					fprintf(out, "%s=m\n", sym->name);
-+ 					break;
-+ 				case yes:
-+-					fprintf(out, "CONFIG_%s=y\n", sym->name);
-++					fprintf(out, "%s=y\n", sym->name);
-+ 					break;
-+ 				}
-+ 				break;
-+ 			case S_STRING:
-+ 				str = sym_get_string_value(sym);
-+-				fprintf(out, "CONFIG_%s=\"", sym->name);
-++				fprintf(out, "%s=\"", sym->name);
-+ 				while (1) {
-+ 					l = strcspn(str, "\"\\");
-+ 					if (l) {
-+@@ -514,12 +509,12 @@ int conf_write(const char *name)
-+ 			case S_HEX:
-+ 				str = sym_get_string_value(sym);
-+ 				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-+-					fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-++					fprintf(out, "%s=%s\n", sym->name, str);
-+ 					break;
-+ 				}
-+ 			case S_INT:
-+ 				str = sym_get_string_value(sym);
-+-				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-++				fprintf(out, "%s=%s\n", sym->name, str);
-+ 				break;
-+ 			}
-+ 		}
-+@@ -559,7 +554,7 @@ int conf_write(const char *name)
-+ 
-+ int conf_split_config(void)
-+ {
-+-	char *name, path[128];
-++	char *name, path[128], *opwd, *dir, *_name;
-+ 	char *s, *d, c;
-+ 	struct symbol *sym;
-+ 	struct stat sb;
-+@@ -570,8 +565,20 @@ int conf_split_config(void)
-+ 		name = "include/config/auto.conf";
-+ 	conf_read_simple(name, S_DEF_AUTO);
-+ 
-+-	if (chdir("include/config"))
-++	opwd = malloc(256);
-++	_name = strdup(name);
-++	if (opwd == NULL || _name == NULL)
-+ 		return 1;
-++	opwd = getcwd(opwd, 256);
-++	dir = dirname(_name);
-++	if (dir == NULL) {
-++		res = 1;
-++		goto err;
-++	}
-++	if (chdir(dir)) {
-++		res = 1;
-++		goto err;
-++	}
-+ 
-+ 	res = 0;
-+ 	for_all_symbols(i, sym) {
-+@@ -664,9 +671,11 @@ int conf_split_config(void)
-+ 		close(fd);
-+ 	}
-+ out:
-+-	if (chdir("../.."))
-+-		return 1;
-+-
-++	if (chdir(opwd))
-++		res = 1;
-++err:
-++	free(opwd);
-++	free(_name);
-+ 	return res;
-+ }
-+ 
-+@@ -681,7 +690,7 @@ int conf_write_autoconf(void)
-+ 
-+ 	sym_clear_all_valid();
-+ 
-+-	file_write_dep("include/config/auto.conf.cmd");
-++	file_write_dep(".config.cmd");
-+ 
-+ 	if (conf_split_config())
-+ 		return 1;
-+@@ -696,22 +705,19 @@ int conf_write_autoconf(void)
-+ 		return 1;
-+ 	}
-+ 
-+-	sym = sym_lookup("KERNELVERSION", 0);
-++	sym = sym_lookup("BR2_VERSION", 0);
-+ 	sym_calc_value(sym);
-+ 	time(&now);
-+ 	fprintf(out, "#\n"
-+ 		     "# Automatically generated make config: don't edit\n"
-+-		     "# Linux kernel version: %s\n"
-+ 		     "# %s"
-+ 		     "#\n",
-+-		     sym_get_string_value(sym), ctime(&now));
-++		     ctime(&now));
-+ 	fprintf(out_h, "/*\n"
-+ 		       " * Automatically generated C config: don't edit\n"
-+-		       " * Linux kernel version: %s\n"
-+ 		       " * %s"
-+-		       " */\n"
-+-		       "#define AUTOCONF_INCLUDED\n",
-+-		       sym_get_string_value(sym), ctime(&now));
-++		       " */\n",
-++		       ctime(&now));
-+ 
-+ 	for_all_symbols(i, sym) {
-+ 		sym_calc_value(sym);
-+@@ -724,19 +730,19 @@ int conf_write_autoconf(void)
-+ 			case no:
-+ 				break;
-+ 			case mod:
-+-				fprintf(out, "CONFIG_%s=m\n", sym->name);
-+-				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
-++				fprintf(out, "%s=m\n", sym->name);
-++				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
-+ 				break;
-+ 			case yes:
-+-				fprintf(out, "CONFIG_%s=y\n", sym->name);
-+-				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
-++				fprintf(out, "%s=y\n", sym->name);
-++				fprintf(out_h, "#define %s 1\n", sym->name);
-+ 				break;
-+ 			}
-+ 			break;
-+ 		case S_STRING:
-+ 			str = sym_get_string_value(sym);
-+-			fprintf(out, "CONFIG_%s=\"", sym->name);
-+-			fprintf(out_h, "#define CONFIG_%s \"", sym->name);
-++			fprintf(out, "%s=\"", sym->name);
-++			fprintf(out_h, "#define %s \"", sym->name);
-+ 			while (1) {
-+ 				l = strcspn(str, "\"\\");
-+ 				if (l) {
-+@@ -756,14 +762,14 @@ int conf_write_autoconf(void)
-+ 		case S_HEX:
-+ 			str = sym_get_string_value(sym);
-+ 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-+-				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-+-				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
-++				fprintf(out, "%s=%s\n", sym->name, str);
-++				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
-+ 				break;
-+ 			}
-+ 		case S_INT:
-+ 			str = sym_get_string_value(sym);
-+-			fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-+-			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
-++			fprintf(out, "%s=%s\n", sym->name, str);
-++			fprintf(out_h, "#define %s %s\n", sym->name, str);
-+ 			break;
-+ 		default:
-+ 			break;
-+diff -rduNp config.new.oorig/expr.c config.new/expr.c
-+--- config.new.oorig/expr.c	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/expr.c	2008-04-07 11:06:30.000000000 +0200
-+@@ -331,7 +331,7 @@ struct expr *expr_trans_bool(struct expr
-+ 		e->right.expr = expr_trans_bool(e->right.expr);
-+ 		break;
-+ 	case E_UNEQUAL:
-+-		// FOO!=n -> FOO
-++		/* FOO!=n -> FOO */
-+ 		if (e->left.sym->type == S_TRISTATE) {
-+ 			if (e->right.sym == &symbol_no) {
-+ 				e->type = E_SYMBOL;
-+@@ -380,19 +380,19 @@ struct expr *expr_join_or(struct expr *e
-+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
-+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
-+ 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
-+-			// (a='y') || (a='m') -> (a!='n')
-++			/* (a='y') || (a='m') -> (a!='n') */
-+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
-+ 		}
-+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
-+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
-+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
-+-			// (a='y') || (a='n') -> (a!='m')
-++			/* (a='y') || (a='n') -> (a!='m') */
-+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
-+ 		}
-+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
-+ 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
-+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
-+-			// (a='m') || (a='n') -> (a!='y')
-++			/* (a='m') || (a='n') -> (a!='y') */
-+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
-+ 		}
-+ 	}
-+@@ -443,29 +443,29 @@ struct expr *expr_join_and(struct expr *
-+ 
-+ 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
-+ 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
-+-		// (a) && (a='y') -> (a='y')
-++		/* (a) && (a='y') -> (a='y') */
-+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
-+ 
-+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
-+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
-+-		// (a) && (a!='n') -> (a)
-++		/* (a) && (a!='n') -> (a) */
-+ 		return expr_alloc_symbol(sym1);
-+ 
-+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
-+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
-+-		// (a) && (a!='m') -> (a='y')
-++		/* (a) && (a!='m') -> (a='y') */
-+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
-+ 
-+ 	if (sym1->type == S_TRISTATE) {
-+ 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
-+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
-+ 			sym2 = e1->right.sym;
-+ 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
-+ 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-+ 							     : expr_alloc_symbol(&symbol_no);
-+ 		}
-+ 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
-+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
-+ 			sym2 = e2->right.sym;
-+ 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
-+ 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-+@@ -474,19 +474,19 @@ struct expr *expr_join_and(struct expr *
-+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
-+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
-+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
-+-			// (a!='y') && (a!='n') -> (a='m')
-++			/* (a!='y') && (a!='n') -> (a='m') */
-+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
-+ 
-+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
-+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
-+ 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
-+-			// (a!='y') && (a!='m') -> (a='n')
-++			/* (a!='y') && (a!='m') -> (a='n') */
-+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
-+ 
-+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
-+ 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
-+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
-+-			// (a!='m') && (a!='n') -> (a='m')
-++			/* (a!='m') && (a!='n') -> (a='m') */
-+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
-+ 
-+ 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-+@@ -579,7 +579,7 @@ static void expr_eliminate_dups2(enum ex
-+ 	switch (e1->type) {
-+ 	case E_OR:
-+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
-+-		// (FOO || BAR) && (!FOO && !BAR) -> n
-++		/* (FOO || BAR) && (!FOO && !BAR) -> n */
-+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-+ 		tmp2 = expr_copy(e2);
-+ 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-+@@ -594,7 +594,7 @@ static void expr_eliminate_dups2(enum ex
-+ 		break;
-+ 	case E_AND:
-+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
-+-		// (FOO && BAR) || (!FOO || !BAR) -> y
-++		/* (FOO && BAR) || (!FOO || !BAR) -> y */
-+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-+ 		tmp2 = expr_copy(e2);
-+ 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-+@@ -703,7 +703,7 @@ struct expr *expr_transform(struct expr 
-+ 	case E_NOT:
-+ 		switch (e->left.expr->type) {
-+ 		case E_NOT:
-+-			// !!a -> a
-++			/* !!a -> a */
-+ 			tmp = e->left.expr->left.expr;
-+ 			free(e->left.expr);
-+ 			free(e);
-+@@ -712,14 +712,14 @@ struct expr *expr_transform(struct expr 
-+ 			break;
-+ 		case E_EQUAL:
-+ 		case E_UNEQUAL:
-+-			// !a='x' -> a!='x'
-++			/* !a='x' -> a!='x' */
-+ 			tmp = e->left.expr;
-+ 			free(e);
-+ 			e = tmp;
-+ 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
-+ 			break;
-+ 		case E_OR:
-+-			// !(a || b) -> !a && !b
-++			/* !(a || b) -> !a && !b */
-+ 			tmp = e->left.expr;
-+ 			e->type = E_AND;
-+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-+@@ -728,7 +728,7 @@ struct expr *expr_transform(struct expr 
-+ 			e = expr_transform(e);
-+ 			break;
-+ 		case E_AND:
-+-			// !(a && b) -> !a || !b
-++			/* !(a && b) -> !a || !b */
-+ 			tmp = e->left.expr;
-+ 			e->type = E_OR;
-+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-+@@ -738,7 +738,7 @@ struct expr *expr_transform(struct expr 
-+ 			break;
-+ 		case E_SYMBOL:
-+ 			if (e->left.expr->left.sym == &symbol_yes) {
-+-				// !'y' -> 'n'
-++				/* !'y' -> 'n' */
-+ 				tmp = e->left.expr;
-+ 				free(e);
-+ 				e = tmp;
-+@@ -747,7 +747,7 @@ struct expr *expr_transform(struct expr 
-+ 				break;
-+ 			}
-+ 			if (e->left.expr->left.sym == &symbol_mod) {
-+-				// !'m' -> 'm'
-++				/* !'m' -> 'm' */
-+ 				tmp = e->left.expr;
-+ 				free(e);
-+ 				e = tmp;
-+@@ -756,7 +756,7 @@ struct expr *expr_transform(struct expr 
-+ 				break;
-+ 			}
-+ 			if (e->left.expr->left.sym == &symbol_no) {
-+-				// !'n' -> 'y'
-++				/* !'n' -> 'y' */
-+ 				tmp = e->left.expr;
-+ 				free(e);
-+ 				e = tmp;
-+diff -rduNp config.new.oorig/expr.h config.new/expr.h
-+--- config.new.oorig/expr.h	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/expr.h	2008-04-07 11:06:30.000000000 +0200
-+@@ -65,7 +65,7 @@ enum symbol_type {
-+ 
-+ enum {
-+ 	S_DEF_USER,		/* main user value */
-+-	S_DEF_AUTO,
-++	S_DEF_AUTO
-+ };
-+ 
-+ struct symbol {
-+diff -rduNp config.new.oorig/gconf.c config.new/gconf.c
-+--- config.new.oorig/gconf.c	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/gconf.c	2008-04-07 11:06:30.000000000 +0200
-+@@ -268,8 +268,8 @@ void init_main_window(const gchar * glad
-+ 					  /*"style", PANGO_STYLE_OBLIQUE, */
-+ 					  NULL);
-+ 
-+-	sprintf(title, _("Linux Kernel v%s Configuration"),
-+-		getenv("KERNELVERSION"));
-++	sprintf(title, _("Buildroot v%s Configuration"),
-++		getenv("BR2_VERSION"));
-+ 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
-+ 
-+ 	gtk_widget_show(main_wnd);
-+diff -rduNp config.new.oorig/gconf.glade config.new/gconf.glade
-+--- config.new.oorig/gconf.glade	2008-04-07 11:03:28.000000000 +0200
-++++ config.new/gconf.glade	2008-04-07 11:06:30.000000000 +0200
-+@@ -5,7 +5,7 @@
-+ 
-+ <widget class="GtkWindow" id="window1">
-+   <property name="visible">True</property>
-+-  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
-++  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
-+   <property name="type">GTK_WINDOW_TOPLEVEL</property>
-+   <property name="window_position">GTK_WIN_POS_NONE</property>
-+   <property name="modal">False</property>
-diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
---- config.new.oorig/mconf.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/mconf.c	2008-04-07 11:09:01.000000000 +0200
-@@ -29,10 +29,9 @@
+Index: config/mconf.c
+===================================================================
+--- config.orig/mconf.c
++++ config/mconf.c
+@@ -25,10 +25,9 @@
  static const char mconf_readme[] = N_(
  "Overview\n"
  "--------\n"
@@ -1142,7 +605,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  "entered in as decimal or hexadecimal numbers or possibly text.\n"
  "\n"
  "Menu items beginning with following braces represent features that\n"
-@@ -119,7 +118,7 @@ static const char mconf_readme[] = N_(
+@@ -115,7 +114,7 @@
  "-----------------------------\n"
  "Menuconfig supports the use of alternate configuration files for\n"
  "those who, for various reasons, find it necessary to switch\n"
@@ -1151,7 +614,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  "\n"
  "At the end of the main menu you will find two options.  One is\n"
  "for saving the current configuration to a file of your choosing.\n"
-@@ -152,7 +151,7 @@ static const char mconf_readme[] = N_(
+@@ -148,7 +147,7 @@
  "\n"
  "Optional personality available\n"
  "------------------------------\n"
@@ -1160,7 +623,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
  "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
  "\n"
-@@ -182,9 +181,9 @@ menu_instructions[] = N_(
+@@ -178,9 +177,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus --->.  "
  	"Highlighted letters are hotkeys.  "
@@ -1172,7 +635,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-@@ -204,18 +203,18 @@ setmod_text[] = N_(
+@@ -200,18 +199,18 @@
  	"This feature depends on another which has been configured as a module.\n"
  	"As a result, this feature will be built as a module."),
  nohelp_text[] = N_(
@@ -1194,7 +657,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  	"to modify that configuration.\n"
  	"\n"
  	"If you are uncertain, then you have probably never used alternate\n"
-@@ -225,7 +224,7 @@ save_config_text[] = N_(
+@@ -221,7 +220,7 @@
  	"as an alternate.  Leave blank to abort."),
  save_config_help[] = N_(
  	"\n"
@@ -1203,7 +666,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  	"configurations available on a single machine.\n"
  	"\n"
  	"Entering a file name here will allow you to later retrieve, modify\n"
-@@ -405,10 +404,10 @@ static void set_config_filename(const ch
+@@ -364,10 +363,10 @@
  	int size;
  	struct symbol *sym;
  
@@ -1216,7 +679,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  		        config_filename, sym_get_string_value(sym));
  	if (size >= sizeof(menu_backtitle))
  		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-@@ -935,7 +934,7 @@ int main(int ac, char **av)
+@@ -902,7 +901,7 @@
  		if (conf_get_changed())
  			res = dialog_yesno(NULL,
  					   _("Do you wish to save your "
@@ -1225,7 +688,7 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
  					     "<ESC><ESC> to continue."),
  					   6, 60);
  		else
-@@ -947,22 +946,22 @@ int main(int ac, char **av)
+@@ -914,23 +913,23 @@
  	case 0:
  		if (conf_write(filename)) {
  			fprintf(stderr, _("\n\n"
@@ -1254,26 +717,12 @@ diff -rduNp config.new.oorig/mconf.c config.new/mconf.c
 -	return 0;
 +	return conf_write_autoconf();
  }
-diff -rduNp config.new.oorig/symbol.c config.new/symbol.c
---- config.new.oorig/symbol.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/symbol.c	2008-04-07 11:06:30.000000000 +0200
-@@ -61,10 +61,10 @@ void sym_init(void)
- 	if (p)
- 		sym_add_default(sym, p);
  
--	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("BR2_VERSION", 0);
- 	sym->type = S_STRING;
- 	sym->flags |= SYMBOL_AUTO;
--	p = getenv("KERNELVERSION");
-+	p = getenv("BR2_VERSION");
- 	if (p)
- 		sym_add_default(sym, p);
- 
-diff -rduNp config.new.oorig/util.c config.new/util.c
---- config.new.oorig/util.c	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/util.c	2008-04-07 11:06:30.000000000 +0200
-@@ -26,6 +26,109 @@ struct file *file_lookup(const char *nam
+Index: config/util.c
+===================================================================
+--- config.orig/util.c
++++ config/util.c
+@@ -26,6 +26,109 @@
  	return file;
  }
  
@@ -1383,26 +832,20 @@ diff -rduNp config.new.oorig/util.c config.new/util.c
  /* write a dependency file as used by kbuild to track dependencies */
  int file_write_dep(const char *name)
  {
-@@ -44,12 +147,13 @@ int file_write_dep(const char *name)
- 		else
- 			fprintf(out, "\t%s\n", file->name);
- 	}
--	fprintf(out, "\ninclude/config/auto.conf: \\\n"
-+	fprintf(out, "\n$(BR2_DEPENDS_DIR)/config/auto.conf: \\\n"
- 		     "\t$(deps_config)\n\n"
- 		     "$(deps_config): ;\n");
+@@ -68,7 +171,7 @@
+ 	fprintf(out, "\n$(deps_config): ;\n");
  	fclose(out);
  	rename("..config.tmp", name);
 -	return 0;
-+
 +	return write_make_deps(NULL);
  }
  
  
-diff -rduNp config.new.oorig/zconf.tab.c_shipped config.new/zconf.tab.c_shipped
---- config.new.oorig/zconf.tab.c_shipped	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/zconf.tab.c_shipped	2008-04-07 11:06:30.000000000 +0200
-@@ -2248,7 +2248,7 @@ void conf_parse(const char *name)
+Index: config/zconf.tab.c_shipped
+===================================================================
+--- config.orig/zconf.tab.c_shipped
++++ config/zconf.tab.c_shipped
+@@ -2259,7 +2259,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
@@ -1411,10 +854,11 @@ diff -rduNp config.new.oorig/zconf.tab.c_shipped config.new/zconf.tab.c_shipped
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
-diff -rduNp config.new.oorig/zconf.y config.new/zconf.y
---- config.new.oorig/zconf.y	2008-04-07 11:03:28.000000000 +0200
-+++ config.new/zconf.y	2008-04-07 11:06:30.000000000 +0200
-@@ -473,7 +473,7 @@ void conf_parse(const char *name)
+Index: config/zconf.y
+===================================================================
+--- config.orig/zconf.y
++++ config/zconf.y
+@@ -476,7 +476,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
diff --git a/package/config/kxgettext.c b/package/config/kxgettext.c
index 6eb72a7..8d9ce22 100644
--- a/package/config/kxgettext.c
+++ b/package/config/kxgettext.c
@@ -43,6 +43,10 @@ static char *escape(const char* text, char *bf, int len)
 			++text;
 			goto next;
 		}
+		else if (*text == '\\') {
+			*bfp++ = '\\';
+			len--;
+		}
 		*bfp++ = *text++;
 next:
 		--len;
diff --git a/package/config/lex.zconf.c_shipped b/package/config/lex.zconf.c_shipped
index f1975f8..dc3e818 100644
--- a/package/config/lex.zconf.c_shipped
+++ b/package/config/lex.zconf.c_shipped
@@ -27,7 +27,7 @@
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
 #define YY_FLEX_MINOR_VERSION 5
-#define YY_FLEX_SUBMINOR_VERSION 33
+#define YY_FLEX_SUBMINOR_VERSION 35
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
@@ -49,7 +49,7 @@
 
 /* C99 systems have <inttypes.h>. Non-C99 systems may or may not. */
 
-#if __STDC_VERSION__ >= 199901L
+#if defined (__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
 
 /* C99 says to define __STDC_LIMIT_MACROS before including stdint.h,
  * if you want the limit (max/min) macros for int types. 
@@ -72,7 +72,6 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
-#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -103,6 +102,8 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
+#endif /* ! C99 */
+
 #endif /* ! FLEXINT_H */
 
 #ifdef __cplusplus
@@ -112,11 +113,12 @@ typedef unsigned int flex_uint32_t;
 
 #else	/* ! __cplusplus */
 
-#if __STDC__
+/* C99 requires __STDC__ to be defined as 1. */
+#if defined (__STDC__)
 
 #define YY_USE_CONST
 
-#endif	/* __STDC__ */
+#endif	/* defined (__STDC__) */
 #endif	/* ! __cplusplus */
 
 #ifdef YY_USE_CONST
@@ -196,14 +198,9 @@ extern FILE *zconfin, *zconfout;
 
 #define unput(c) yyunput( c, (yytext_ptr)  )
 
-/* The following is because we cannot portably get our hands on size_t
- * (without autoconf's help, which isn't available because we want
- * flex-generated scanners to compile on their own).
- */
-
 #ifndef YY_TYPEDEF_YY_SIZE_T
 #define YY_TYPEDEF_YY_SIZE_T
-typedef unsigned int yy_size_t;
+typedef size_t yy_size_t;
 #endif
 
 #ifndef YY_STRUCT_YY_BUFFER_STATE
@@ -767,6 +764,7 @@ int zconf_flex_debug = 0;
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
 char *zconftext;
+#define YY_NO_INPUT 1
 
 /*
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
@@ -815,12 +813,6 @@ void new_string(void)
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
-
-	if ((YY_START == 2 /* HELP */) && (size > 70)) {
-		fprintf (stderr, "%s:%d warning: Overlong line\n",
-		current_file->name, current_file->lineno);
-	}
-
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;
@@ -859,6 +851,35 @@ void alloc_string(const char *str, int size)
 
 static int yy_init_globals (void );
 
+/* Accessor methods to globals.
+   These are made visible to non-reentrant scanners for convenience. */
+
+int zconflex_destroy (void );
+
+int zconfget_debug (void );
+
+void zconfset_debug (int debug_flag  );
+
+YY_EXTRA_TYPE zconfget_extra (void );
+
+void zconfset_extra (YY_EXTRA_TYPE user_defined  );
+
+FILE *zconfget_in (void );
+
+void zconfset_in  (FILE * in_str  );
+
+FILE *zconfget_out (void );
+
+void zconfset_out  (FILE * out_str  );
+
+int zconfget_leng (void );
+
+char *zconfget_text (void );
+
+int zconfget_lineno (void );
+
+void zconfset_lineno (int line_number  );
+
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
  */
@@ -901,7 +922,7 @@ static int input (void );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO (void) fwrite( zconftext, zconfleng, 1, zconfout )
+#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -1281,6 +1302,11 @@ YY_RULE_SETUP
 case 32:
 YY_RULE_SETUP
 {
+		while (zconfleng) {
+			if ((zconftext[zconfleng-1] != ' ') && (zconftext[zconfleng-1] != '\t'))
+				break;
+			zconfleng--;
+		}
 		append_string(zconftext, zconfleng);
 		if (!first_ts)
 			first_ts = last_ts;
@@ -1536,7 +1562,7 @@ static int yy_get_next_buffer (void)
 
 		/* Read in more data. */
 		YY_INPUT( (&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move]),
-			(yy_n_chars), num_to_read );
+			(yy_n_chars), (size_t) num_to_read );
 
 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars);
 		}
@@ -1560,6 +1586,14 @@ static int yy_get_next_buffer (void)
 	else
 		ret_val = EOB_ACT_CONTINUE_SCAN;
 
+	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
+		/* Extend the array by 50%, plus the number we really need. */
+		yy_size_t new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) zconfrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
+		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
+			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
+	}
+
 	(yy_n_chars) += number_to_move;
 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars)] = YY_END_OF_BUFFER_CHAR;
 	YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] = YY_END_OF_BUFFER_CHAR;
@@ -1946,7 +1980,9 @@ static void zconfensure_buffer_stack (void)
 		(yy_buffer_stack) = (struct yy_buffer_state**)zconfalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
-		
+		if ( ! (yy_buffer_stack) )
+			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
+								  
 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
 				
 		(yy_buffer_stack_max) = num_to_alloc;
@@ -1964,6 +2000,8 @@ static void zconfensure_buffer_stack (void)
 								((yy_buffer_stack),
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
+		if ( ! (yy_buffer_stack) )
+			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof(struct yy_buffer_state*));
@@ -2008,7 +2046,7 @@ YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
 
 /** Setup the input buffer state to scan a string. The next call to zconflex() will
  * scan from a @e copy of @a str.
- * @param str a NUL-terminated string to scan
+ * @param yystr a NUL-terminated string to scan
  * 
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
@@ -2332,11 +2370,14 @@ void zconf_nextfile(const char *name)
 	current_buf = buf;
 
 	if (file->flags & FILE_BUSY) {
-		printf("recursive scan (%s)?\n", name);
+		printf("%s:%d: do not source '%s' from itself\n",
+		       zconf_curname(), zconf_lineno(), name);
 		exit(1);
 	}
 	if (file->flags & FILE_SCANNED) {
-		printf("file %s already scanned?\n", name);
+		printf("%s:%d: file '%s' is already sourced from '%s'\n",
+		       zconf_curname(), zconf_lineno(), name,
+		       file->parent->name);
 		exit(1);
 	}
 	file->flags |= FILE_BUSY;
diff --git a/package/config/lkc.h b/package/config/lkc.h
index 8a07ee4..f379b0b 100644
--- a/package/config/lkc.h
+++ b/package/config/lkc.h
@@ -11,9 +11,9 @@
 #ifndef KBUILD_NO_NLS
 # include <libintl.h>
 #else
-# define gettext(Msgid) ((const char *) (Msgid))
-# define textdomain(Domainname) ((const char *) (Domainname))
-# define bindtextdomain(Domainname, Dirname) ((const char *) (Dirname))
+static inline const char *gettext(const char *txt) { return txt; }
+static inline void textdomain(const char *domainname) {}
+static inline void bindtextdomain(const char *name, const char *dir) {}
 #endif
 
 #ifdef __cplusplus
@@ -42,8 +42,17 @@ extern "C" {
 #define TF_PARAM	0x0002
 #define TF_OPTION	0x0004
 
+enum conf_def_mode {
+	def_default,
+	def_yes,
+	def_mod,
+	def_no,
+	def_random
+};
+
 #define T_OPT_MODULES		1
 #define T_OPT_DEFCONFIG_LIST	2
+#define T_OPT_ENV		3
 
 struct kconf_id {
 	int name;
@@ -65,15 +74,18 @@ char *zconf_curname(void);
 
 /* confdata.c */
 const char *conf_get_configname(void);
+const char *conf_get_autoconfig_name(void);
 char *conf_get_default_confname(void);
 void sym_set_change_count(int count);
 void sym_add_change_count(int count);
+void conf_set_all_new_symbols(enum conf_def_mode mode);
 
 /* kconfig_load.c */
 void kconfig_load(void);
 
 /* menu.c */
 void menu_init(void);
+void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
@@ -103,6 +115,8 @@ void str_printf(struct gstr *gs, const char *fmt, ...);
 const char *str_get(struct gstr *gs);
 
 /* symbol.c */
+extern struct expr *sym_env_list;
+
 void sym_init(void);
 void sym_clear_all_valid(void);
 void sym_set_all_changed(void);
@@ -110,6 +124,7 @@ void sym_set_changed(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
 struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
+struct property *sym_get_env_prop(struct symbol *sym);
 
 static inline tristate sym_get_tristate_value(struct symbol *sym)
 {
diff --git a/package/config/lkc_proto.h b/package/config/lkc_proto.h
index 4d09f6d..8e69461 100644
--- a/package/config/lkc_proto.h
+++ b/package/config/lkc_proto.h
@@ -21,7 +21,7 @@ P(menu_get_help,const char *,(struct menu *menu));
 /* symbol.c */
 P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
 
-P(sym_lookup,struct symbol *,(const char *name, int isconst));
+P(sym_lookup,struct symbol *,(const char *name, int flags));
 P(sym_find,struct symbol *,(const char *name));
 P(sym_re_search,struct symbol **,(const char *pattern));
 P(sym_type_name,const char *,(enum symbol_type type));
diff --git a/package/config/lxdialog/check-lxdialog.sh b/package/config/lxdialog/check-lxdialog.sh
index 9681476..fcef0f5 100644
--- a/package/config/lxdialog/check-lxdialog.sh
+++ b/package/config/lxdialog/check-lxdialog.sh
@@ -36,19 +36,23 @@ trap "rm -f $tmp" 0 1 2 3 15
 
 # Check if we can link to ncurses
 check() {
-	echo "main() {}" | $cc -xc - -o $tmp 2> /dev/null
+        $cc -xc - -o $tmp 2>/dev/null <<'EOF'
+#include CURSES_LOC
+main() {}
+EOF
 	if [ $? != 0 ]; then
-		echo " *** Unable to find the ncurses libraries."          1>&2
-		echo " *** make menuconfig require the ncurses libraries"  1>&2
-		echo " *** "                                               1>&2
-		echo " *** Install ncurses (ncurses-devel) and try again"  1>&2
-		echo " *** "                                               1>&2
-		exit 1
+	    echo " *** Unable to find the ncurses libraries or the"       1>&2
+	    echo " *** required header files."                            1>&2
+	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
+	    echo " *** "                                                  1>&2
+	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** "                                                  1>&2
+	    exit 1
 	fi
 }
 
 usage() {
-	printf "Usage: $0 [-check compiler options|-header|-library]\n"
+	printf "Usage: $0 [-check compiler options|-ccflags|-ldflags compiler options]\n"
 }
 
 if [ $# -eq 0 ]; then
diff --git a/package/config/lxdialog/checklist.c b/package/config/lxdialog/checklist.c
index cf69708..bcc6f19 100644
--- a/package/config/lxdialog/checklist.c
+++ b/package/config/lxdialog/checklist.c
@@ -41,7 +41,8 @@ static void print_item(WINDOW * win, int choice, int selected)
 	wmove(win, choice, check_x);
 	wattrset(win, selected ? dlg.check_selected.atr
 		 : dlg.check.atr);
-	wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
+	if (!item_is_tag(':'))
+		wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
 
 	wattrset(win, selected ? dlg.tag_selected.atr : dlg.tag.atr);
 	mvwaddch(win, choice, item_x, item_str()[0]);
@@ -97,8 +98,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 11;
 	int y = height - 2;
 
-	print_button(dialog, "Select", y, x, selected == 0);
-	print_button(dialog, " Help ", y, x + 14, selected == 1);
+	print_button(dialog, gettext("Select"), y, x, selected == 0);
+	print_button(dialog, gettext(" Help "), y, x + 14, selected == 1);
 
 	wmove(dialog, y, x + 1 + 14 * selected);
 	wrefresh(dialog);
diff --git a/package/config/lxdialog/dialog.h b/package/config/lxdialog/dialog.h
index 7e17eba..b5211fc 100644
--- a/package/config/lxdialog/dialog.h
+++ b/package/config/lxdialog/dialog.h
@@ -26,6 +26,12 @@
 #include <string.h>
 #include <stdbool.h>
 
+#ifndef KBUILD_NO_NLS
+# include <libintl.h>
+#else
+# define gettext(Msgid) ((const char *) (Msgid))
+#endif
+
 #ifdef __sun__
 #define CURS_MACROS
 #endif
@@ -187,10 +193,9 @@ int item_is_tag(char tag);
 int on_key_esc(WINDOW *win);
 int on_key_resize(void);
 
-void init_dialog(const char *backtitle);
+int init_dialog(const char *backtitle);
 void set_dialog_backtitle(const char *backtitle);
-void reset_dialog(void);
-void end_dialog(void);
+void end_dialog(int x, int y);
 void attr_clear(WINDOW * win, int height, int width, chtype attr);
 void dialog_clear(void);
 void print_autowrap(WINDOW * win, const char *prompt, int width, int y, int x);
diff --git a/package/config/lxdialog/inputbox.c b/package/config/lxdialog/inputbox.c
index 05e7206..616c601 100644
--- a/package/config/lxdialog/inputbox.c
+++ b/package/config/lxdialog/inputbox.c
@@ -31,8 +31,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 11;
 	int y = height - 2;
 
-	print_button(dialog, "  Ok  ", y, x, selected == 0);
-	print_button(dialog, " Help ", y, x + 14, selected == 1);
+	print_button(dialog, gettext("  Ok  "), y, x, selected == 0);
+	print_button(dialog, gettext(" Help "), y, x + 14, selected == 1);
 
 	wmove(dialog, y, x + 1 + 14 * selected);
 	wrefresh(dialog);
@@ -89,7 +89,7 @@ do_resize:
 	box_y = y + 2;
 	box_x = (width - box_width) / 2;
 	draw_box(dialog, y + 1, box_x - 1, 3, box_width + 2,
-		 dlg.border.atr, dlg.dialog.atr);
+		 dlg.dialog.atr, dlg.border.atr);
 
 	print_buttons(dialog, height, width, 0);
 
diff --git a/package/config/lxdialog/menubox.c b/package/config/lxdialog/menubox.c
index 0d83159..fa9d633 100644
--- a/package/config/lxdialog/menubox.c
+++ b/package/config/lxdialog/menubox.c
@@ -157,9 +157,9 @@ static void print_buttons(WINDOW * win, int height, int width, int selected)
 	int x = width / 2 - 16;
 	int y = height - 2;
 
-	print_button(win, "Select", y, x, selected == 0);
-	print_button(win, " Exit ", y, x + 12, selected == 1);
-	print_button(win, " Help ", y, x + 24, selected == 2);
+	print_button(win, gettext("Select"), y, x, selected == 0);
+	print_button(win, gettext(" Exit "), y, x + 12, selected == 1);
+	print_button(win, gettext(" Help "), y, x + 24, selected == 2);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
diff --git a/package/config/lxdialog/textbox.c b/package/config/lxdialog/textbox.c
index fabfc1a..c704712 100644
--- a/package/config/lxdialog/textbox.c
+++ b/package/config/lxdialog/textbox.c
@@ -114,7 +114,7 @@ do_resize:
 
 	print_title(dialog, title, width);
 
-	print_button(dialog, " Exit ", height - 2, width / 2 - 4, TRUE);
+	print_button(dialog, gettext(" Exit "), height - 2, width / 2 - 4, TRUE);
 	wnoutrefresh(dialog);
 	getyx(dialog, cur_y, cur_x);	/* Save cursor position */
 
diff --git a/package/config/lxdialog/util.c b/package/config/lxdialog/util.c
index a1bddef..86d95cc 100644
--- a/package/config/lxdialog/util.c
+++ b/package/config/lxdialog/util.c
@@ -266,31 +266,41 @@ void dialog_clear(void)
 /*
  * Do some initialization for dialog
  */
-void init_dialog(const char *backtitle)
+int init_dialog(const char *backtitle)
 {
-	dlg.backtitle = backtitle;
-	color_setup(getenv("MENUCONFIG_COLOR"));
-}
+	int height, width;
+
+	initscr();		/* Init curses */
+	getmaxyx(stdscr, height, width);
+	if (height < 19 || width < 80) {
+		endwin();
+		return -ERRDISPLAYTOOSMALL;
+	}
 
-void set_dialog_backtitle(const char *backtitle)
-{
 	dlg.backtitle = backtitle;
-}
+	color_setup(getenv("MENUCONFIG_COLOR"));
 
-void reset_dialog(void)
-{
-	initscr();		/* Init curses */
 	keypad(stdscr, TRUE);
 	cbreak();
 	noecho();
 	dialog_clear();
+
+	return 0;
+}
+
+void set_dialog_backtitle(const char *backtitle)
+{
+	dlg.backtitle = backtitle;
 }
 
 /*
  * End using dialog functions.
  */
-void end_dialog(void)
+void end_dialog(int x, int y)
 {
+	/* move cursor back to original position */
+	move(y, x);
+	refresh();
 	endwin();
 }
 
diff --git a/package/config/lxdialog/yesno.c b/package/config/lxdialog/yesno.c
index ee0a04e..4e6e809 100644
--- a/package/config/lxdialog/yesno.c
+++ b/package/config/lxdialog/yesno.c
@@ -29,8 +29,8 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
 	int x = width / 2 - 10;
 	int y = height - 2;
 
-	print_button(dialog, " Yes ", y, x, selected == 0);
-	print_button(dialog, "  No  ", y, x + 13, selected == 1);
+	print_button(dialog, gettext(" Yes "), y, x, selected == 0);
+	print_button(dialog, gettext("  No  "), y, x + 13, selected == 1);
 
 	wmove(dialog, y, x + 1 + 13 * selected);
 	wrefresh(dialog);
diff --git a/package/config/mconf.c b/package/config/mconf.c
index 7587891..11901e9 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -8,17 +8,13 @@
  * i18n, 2005, Arnaldo Carvalho de Melo <acme@conectiva.com.br>
  */
 
-#include <sys/ioctl.h>
-#include <sys/wait.h>
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
-#include <signal.h>
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
-#include <termios.h>
 #include <unistd.h>
 #include <locale.h>
 
@@ -274,8 +270,6 @@ search_help[] = N_(
 	"\n");
 
 static int indent;
-static struct termios ios_org;
-static int rows = 0, cols = 0;
 static struct menu *current_menu;
 static int child_count;
 static int single_menu_mode;
@@ -289,51 +283,16 @@ static void show_textbox(const char *title, const char *text, int r, int c);
 static void show_helptext(const char *title, const char *text);
 static void show_help(struct menu *menu);
 
-static void init_wsize(void)
-{
-	struct winsize ws;
-	char *env;
-
-	if (!ioctl(STDIN_FILENO, TIOCGWINSZ, &ws)) {
-		rows = ws.ws_row;
-		cols = ws.ws_col;
-	}
-
-	if (!rows) {
-		env = getenv("LINES");
-		if (env)
-			rows = atoi(env);
-		if (!rows)
-			rows = 24;
-	}
-	if (!cols) {
-		env = getenv("COLUMNS");
-		if (env)
-			cols = atoi(env);
-		if (!cols)
-			cols = 80;
-	}
-
-	if (rows < 19 || cols < 80) {
-		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
-		fprintf(stderr, N_("It must be@least 19 lines by 80 columns.\n"));
-		exit(1);
-	}
-
-	rows -= 4;
-	cols -= 5;
-}
-
 static void get_prompt_str(struct gstr *r, struct property *prop)
 {
 	int i, j;
 	struct menu *submenu[8], *menu;
 
-	str_printf(r, "Prompt: %s\n", prop->text);
-	str_printf(r, "  Defined at %s:%d\n", prop->menu->file->name,
+	str_printf(r, _("Prompt: %s\n"), _(prop->text));
+	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
 		prop->menu->lineno);
 	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, "  Depends on: ");
+		str_append(r, _("  Depends on: "));
 		expr_gstr_print(prop->visible.expr, r);
 		str_append(r, "\n");
 	}
@@ -341,13 +300,13 @@ static void get_prompt_str(struct gstr *r, struct property *prop)
 	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent)
 		submenu[i++] = menu;
 	if (i > 0) {
-		str_printf(r, "  Location:\n");
+		str_printf(r, _("  Location:\n"));
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
-			str_printf(r, "%*c-> %s", j, ' ', menu_get_prompt(menu));
+			str_printf(r, "%*c-> %s", j, ' ', _(menu_get_prompt(menu)));
 			if (menu->sym) {
 				str_printf(r, " (%s [=%s])", menu->sym->name ?
-					menu->sym->name : "<choice>",
+					menu->sym->name : _("<choice>"),
 					sym_get_string_value(menu->sym));
 			}
 			str_append(r, "\n");
@@ -377,7 +336,7 @@ static void get_symbol_str(struct gstr *r, struct symbol *sym)
 	if (hit)
 		str_append(r, "\n");
 	if (sym->rev_dep.expr) {
-		str_append(r, "  Selected by: ");
+		str_append(r, _("  Selected by: "));
 		expr_gstr_print(sym->rev_dep.expr, r);
 		str_append(r, "\n");
 	}
@@ -393,7 +352,7 @@ static struct gstr get_relations_str(struct symbol **sym_arr)
 	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
 		get_symbol_str(&res, sym);
 	if (!i)
-		str_append(&res, "No matches found.\n");
+		str_append(&res, _("No matches found.\n"));
 	return res;
 }
 
@@ -473,6 +432,7 @@ static void build_conf(struct menu *menu)
 			switch (prop->type) {
 			case P_MENU:
 				child_count++;
+				prompt = _(prompt);
 				if (single_menu_mode) {
 					item_make("%s%*c%s",
 						  menu->data ? "-->" : "++>",
@@ -488,7 +448,7 @@ static void build_conf(struct menu *menu)
 			case P_COMMENT:
 				if (prompt) {
 					child_count++;
-					item_make("   %*c*** %s ***", indent + 1, ' ', prompt);
+					item_make("   %*c*** %s ***", indent + 1, ' ', _(prompt));
 					item_set_tag(':');
 					item_set_data(menu);
 				}
@@ -496,7 +456,7 @@ static void build_conf(struct menu *menu)
 			default:
 				if (prompt) {
 					child_count++;
-					item_make("---%*c%s", indent + 1, ' ', prompt);
+					item_make("---%*c%s", indent + 1, ' ', _(prompt));
 					item_set_tag(':');
 					item_set_data(menu);
 				}
@@ -540,10 +500,10 @@ static void build_conf(struct menu *menu)
 			item_set_data(menu);
 		}
 
-		item_add_str("%*c%s", indent + 1, ' ', menu_get_prompt(menu));
+		item_add_str("%*c%s", indent + 1, ' ', _(menu_get_prompt(menu)));
 		if (val == yes) {
 			if (def_menu) {
-				item_add_str(" (%s)", menu_get_prompt(def_menu));
+				item_add_str(" (%s)", _(menu_get_prompt(def_menu)));
 				item_add_str("  --->");
 				if (def_menu->list) {
 					indent += 2;
@@ -555,7 +515,7 @@ static void build_conf(struct menu *menu)
 		}
 	} else {
 		if (menu == current_menu) {
-			item_make("---%*c%s", indent + 1, ' ', menu_get_prompt(menu));
+			item_make("---%*c%s", indent + 1, ' ', _(menu_get_prompt(menu)));
 			item_set_tag(':');
 			item_set_data(menu);
 			goto conf_childs;
@@ -598,17 +558,17 @@ static void build_conf(struct menu *menu)
 				tmp = indent - tmp + 4;
 				if (tmp < 0)
 					tmp = 0;
-				item_add_str("%*c%s%s", tmp, ' ', menu_get_prompt(menu),
+				item_add_str("%*c%s%s", tmp, ' ', _(menu_get_prompt(menu)),
 					     (sym_has_value(sym) || !sym_is_changable(sym)) ?
-					     "" : " (NEW)");
+					     "" : _(" (NEW)"));
 				item_set_tag('s');
 				item_set_data(menu);
 				goto conf_childs;
 			}
 		}
-		item_add_str("%*c%s%s", indent + 1, ' ', menu_get_prompt(menu),
+		item_add_str("%*c%s%s", indent + 1, ' ', _(menu_get_prompt(menu)),
 			  (sym_has_value(sym) || !sym_is_changable(sym)) ?
-			  "" : " (NEW)");
+			  "" : _(" (NEW)"));
 		if (menu->prompt->type == P_MENU) {
 			item_add_str("  --->");
 			return;
@@ -646,7 +606,7 @@ static void conf(struct menu *menu)
 			item_set_tag('S');
 		}
 		dialog_clear();
-		res = dialog_menu(prompt ? prompt : _("Main Menu"),
+		res = dialog_menu(prompt ? _(prompt) : _("Main Menu"),
 				  _(menu_instructions),
 				  active_menu, &s_scroll);
 		if (res == 1 || res == KEY_ESC || res == -ERRDISPLAYTOOSMALL)
@@ -693,7 +653,7 @@ static void conf(struct menu *menu)
 			if (sym)
 				show_help(submenu);
 			else
-				show_helptext("README", _(mconf_readme));
+				show_helptext(_("README"), _(mconf_readme));
 			break;
 		case 3:
 			if (item_is_tag('t')) {
@@ -743,7 +703,7 @@ static void show_help(struct menu *menu)
 	if (menu_has_help(menu))
 	{
 		if (sym->name) {
-			str_printf(&help, "%s:\n\n", sym->name);
+			str_printf(&help, "CONFIG_%s:\n\n", sym->name);
 			str_append(&help, _(menu_get_help(menu)));
 			str_append(&help, "\n");
 		}
@@ -751,13 +711,13 @@ static void show_help(struct menu *menu)
 		str_append(&help, nohelp_text);
 	}
 	get_symbol_str(&help, sym);
-	show_helptext(menu_get_prompt(menu), str_get(&help));
+	show_helptext(_(menu_get_prompt(menu)), str_get(&help));
 	str_free(&help);
 }
 
 static void conf_choice(struct menu *menu)
 {
-	const char *prompt = menu_get_prompt(menu);
+	const char *prompt = _(menu_get_prompt(menu));
 	struct menu *child;
 	struct symbol *active;
 
@@ -771,7 +731,12 @@ static void conf_choice(struct menu *menu)
 		for (child = menu->list; child; child = child->next) {
 			if (!menu_is_visible(child))
 				continue;
-			item_make("%s", menu_get_prompt(child));
+			if (child->sym)
+				item_make("%s", _(menu_get_prompt(child)));
+			else {
+				item_make("*** %s ***", _(menu_get_prompt(child)));
+				item_set_tag(':');
+			}
 			item_set_data(child);
 			if (child->sym == active)
 				item_set_selected(1);
@@ -779,7 +744,7 @@ static void conf_choice(struct menu *menu)
 				item_set_tag('X');
 		}
 		dialog_clear();
-		res = dialog_checklist(prompt ? prompt : _("Main Menu"),
+		res = dialog_checklist(prompt ? _(prompt) : _("Main Menu"),
 					_(radiolist_instructions),
 					 15, 70, 6);
 		selected = item_activate_selected();
@@ -787,6 +752,9 @@ static void conf_choice(struct menu *menu)
 		case 0:
 			if (selected) {
 				child = item_data();
+				if (!child->sym)
+					break;
+
 				sym_set_tristate_value(child->sym, yes);
 			}
 			return;
@@ -812,7 +780,7 @@ static void conf_string(struct menu *menu)
 
 	while (1) {
 		int res;
-		char *heading;
+		const char *heading;
 
 		switch (sym_get_type(menu->sym)) {
 		case S_INT:
@@ -825,10 +793,10 @@ static void conf_string(struct menu *menu)
 			heading = _(inputbox_instructions_string);
 			break;
 		default:
-			heading = "Internal mconf error!";
+			heading = _("Internal mconf error!");
 		}
 		dialog_clear();
-		res = dialog_inputbox(prompt ? prompt : _("Main Menu"),
+		res = dialog_inputbox(prompt ? _(prompt) : _("Main Menu"),
 				      heading, 10, 75,
 				      sym_get_string_value(menu->sym));
 		switch (res) {
@@ -860,6 +828,7 @@ static void conf_load(void)
 				return;
 			if (!conf_read(dialog_input_result)) {
 				set_config_filename(dialog_input_result);
+				sym_set_change_count(1);
 				return;
 			}
 			show_textbox(NULL, _("File does not exist!"), 5, 38);
@@ -899,13 +868,9 @@ static void conf_save(void)
 	}
 }
 
-static void conf_cleanup(void)
-{
-	tcsetattr(1, TCSAFLUSH, &ios_org);
-}
-
 int main(int ac, char **av)
 {
+	int saved_x, saved_y;
 	char *mode;
 	int res;
 
@@ -922,11 +887,13 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
-	tcgetattr(1, &ios_org);
-	atexit(conf_cleanup);
-	init_wsize();
-	reset_dialog();
-	init_dialog(NULL);
+	getyx(stdscr, saved_y, saved_x);
+	if (init_dialog(NULL)) {
+		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
+		fprintf(stderr, N_("It must be at least 19 lines by 80 columns.\n"));
+		return 1;
+	}
+
 	set_config_filename(conf_get_configname());
 	do {
 		conf(&rootmenu);
@@ -940,7 +907,7 @@ int main(int ac, char **av)
 		else
 			res = -1;
 	} while (res == KEY_ESC);
-	end_dialog();
+	end_dialog(saved_x, saved_y);
 
 	switch (res) {
 	case 0:
@@ -965,3 +932,4 @@ int main(int ac, char **av)
 
 	return conf_write_autoconf();
 }
+
diff --git a/package/config/menu.c b/package/config/menu.c
index f9d0d91..07ff8d1 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -15,7 +15,7 @@ static struct menu **last_entry_ptr;
 struct file *file_list;
 struct file *current_file;
 
-static void menu_warn(struct menu *menu, const char *fmt, ...)
+void menu_warn(struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
@@ -172,6 +172,9 @@ void menu_add_option(int token, char *arg)
 		else if (sym_defconfig_list != current_entry->sym)
 			zconf_error("trying to redefine defconfig symbol");
 		break;
+	case T_OPT_ENV:
+		prop_add_env(arg);
+		break;
 	}
 }
 
@@ -200,12 +203,9 @@ void sym_check_prop(struct symbol *sym)
 				prop_warn(prop,
 				    "config symbol '%s' uses select, but is "
 				    "not boolean or tristate", sym->name);
-			else if (sym2->type == S_UNKNOWN)
-				prop_warn(prop,
-				    "'select' used by config symbol '%s' "
-				    "refers to undefined symbol '%s'",
-				    sym->name, sym2->name);
-			else if (sym2->type != S_BOOLEAN && sym2->type != S_TRISTATE)
+			else if (sym2->type != S_UNKNOWN &&
+			         sym2->type != S_BOOLEAN &&
+			         sym2->type != S_TRISTATE)
 				prop_warn(prop,
 				    "'%s' has wrong type. 'select' only "
 				    "accept arguments of boolean and "
@@ -235,15 +235,21 @@ void menu_finalize(struct menu *parent)
 	sym = parent->sym;
 	if (parent->list) {
 		if (sym && sym_is_choice(sym)) {
-			/* find the first choice value and find out choice type */
+			if (sym->type == S_UNKNOWN) {
+				/* find the first choice value to find out choice type */
+				current_entry = parent;
+				for (menu = parent->list; menu; menu = menu->next) {
+					if (menu->sym && menu->sym->type != S_UNKNOWN) {
+						menu_set_type(menu->sym->type);
+						break;
+					}
+				}
+			}
+			/* set the type of the remaining choice values */
 			for (menu = parent->list; menu; menu = menu->next) {
-				if (menu->sym) {
-					current_entry = parent;
-					menu_set_type(menu->sym->type);
-					current_entry = menu;
+				current_entry = menu;
+				if (menu->sym && menu->sym->type == S_UNKNOWN)
 					menu_set_type(sym->type);
-					break;
-				}
 			}
 			parentdep = expr_alloc_symbol(sym);
 		} else if (parent->prompt)
@@ -311,27 +317,43 @@ void menu_finalize(struct menu *parent)
 		}
 	}
 	for (menu = parent->list; menu; menu = menu->next) {
-		if (sym && sym_is_choice(sym) && menu->sym) {
+		if (sym && sym_is_choice(sym) &&
+		    menu->sym && !sym_is_choice_value(menu->sym)) {
+			current_entry = menu;
 			menu->sym->flags |= SYMBOL_CHOICEVAL;
 			if (!menu->prompt)
 				menu_warn(menu, "choice value must have a prompt");
 			for (prop = menu->sym->prop; prop; prop = prop->next) {
-				if (prop->type == P_PROMPT && prop->menu != menu) {
-					prop_warn(prop, "choice values "
-					    "currently only support a "
-					    "single prompt");
-				}
 				if (prop->type == P_DEFAULT)
 					prop_warn(prop, "defaults for choice "
-					    "values not supported");
+						  "values not supported");
+				if (prop->menu == menu)
+					continue;
+				if (prop->type == P_PROMPT &&
+				    prop->menu->parent->sym != sym)
+					prop_warn(prop, "choice value used outside its choice group");
+			}
+			/* Non-tristate choice values of tristate choices must
+			 * depend on the choice being set to Y. The choice
+			 * values' dependencies were propagated to their
+			 * properties above, so the change here must be re-
+			 * propagated.
+			 */
+			if (sym->type == S_TRISTATE && menu->sym->type != S_TRISTATE) {
+				basedep = expr_alloc_comp(E_EQUAL, sym, &symbol_yes);
+				menu->dep = expr_alloc_and(basedep, menu->dep);
+				for (prop = menu->sym->prop; prop; prop = prop->next) {
+					if (prop->menu != menu)
+						continue;
+					prop->visible.expr = expr_alloc_and(expr_copy(basedep),
+									    prop->visible.expr);
+				}
 			}
-			current_entry = menu;
-			menu_set_type(sym->type);
 			menu_add_symbol(P_CHOICE, sym, NULL);
 			prop = sym_get_choice_prop(sym);
 			for (ep = &prop->expr; *ep; ep = &(*ep)->left.expr)
 				;
-			*ep = expr_alloc_one(E_CHOICE, NULL);
+			*ep = expr_alloc_one(E_LIST, NULL);
 			(*ep)->right.sym = menu->sym;
 		}
 		if (menu->list && (!menu->prompt || !menu->prompt->text)) {
@@ -394,9 +416,9 @@ bool menu_is_visible(struct menu *menu)
 const char *menu_get_prompt(struct menu *menu)
 {
 	if (menu->prompt)
-		return _(menu->prompt->text);
+		return menu->prompt->text;
 	else if (menu->sym)
-		return _(menu->sym->name);
+		return menu->sym->name;
 	return NULL;
 }
 
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index b9bb32d..ce7d508 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -5,6 +5,7 @@
 
 #include <qapplication.h>
 #include <qmainwindow.h>
+#include <qdesktopwidget.h>
 #include <qtoolbar.h>
 #include <qlayout.h>
 #include <qvbox.h>
@@ -114,7 +115,7 @@ void ConfigItem::updateMenu(void)
 
 	sym = menu->sym;
 	prop = menu->prompt;
-	prompt = QString::fromLocal8Bit(menu_get_prompt(menu));
+	prompt = _(menu_get_prompt(menu));
 
 	if (prop) switch (prop->type) {
 	case P_MENU:
@@ -208,7 +209,7 @@ void ConfigItem::updateMenu(void)
 		break;
 	}
 	if (!sym_has_value(sym) && visible)
-		prompt += " (NEW)";
+		prompt += _(" (NEW)");
 set_prompt:
 	setText(promptColIdx, prompt);
 }
@@ -297,10 +298,10 @@ void ConfigLineEdit::show(ConfigItem* i)
 void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 {
 	switch (e->key()) {
-	case Key_Escape:
+	case Qt::Key_Escape:
 		break;
-	case Key_Return:
-	case Key_Enter:
+	case Qt::Key_Return:
+	case Qt::Key_Enter:
 		sym_set_string_value(item->menu->sym, text().latin1());
 		parent()->updateList(item);
 		break;
@@ -346,7 +347,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 
 	for (i = 0; i < colNr; i++)
 		colMap[i] = colRevMap[i] = -1;
-	addColumn(promptColIdx, "Option");
+	addColumn(promptColIdx, _("Option"));
 
 	reinit();
 }
@@ -360,14 +361,14 @@ void ConfigList::reinit(void)
 	removeColumn(nameColIdx);
 
 	if (showName)
-		addColumn(nameColIdx, "Name");
+		addColumn(nameColIdx, _("Name"));
 	if (showRange) {
 		addColumn(noColIdx, "N");
 		addColumn(modColIdx, "M");
 		addColumn(yesColIdx, "Y");
 	}
 	if (showData)
-		addColumn(dataColIdx, "Value");
+		addColumn(dataColIdx, _("Value"));
 
 	updateListAll();
 }
@@ -639,7 +640,7 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 	struct menu *menu;
 	enum prop_type type;
 
-	if (ev->key() == Key_Escape && mode != fullMode && mode != listMode) {
+	if (ev->key() == Qt::Key_Escape && mode != fullMode && mode != listMode) {
 		emit parentSelected();
 		ev->accept();
 		return;
@@ -652,8 +653,8 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 	item = (ConfigItem*)i;
 
 	switch (ev->key()) {
-	case Key_Return:
-	case Key_Enter:
+	case Qt::Key_Return:
+	case Qt::Key_Enter:
 		if (item->goParent) {
 			emit parentSelected();
 			break;
@@ -667,16 +668,16 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 			emit menuSelected(menu);
 			break;
 		}
-	case Key_Space:
+	case Qt::Key_Space:
 		changeValue(item);
 		break;
-	case Key_N:
+	case Qt::Key_N:
 		setValue(item, no);
 		break;
-	case Key_M:
+	case Qt::Key_M:
 		setValue(item, mod);
 		break;
-	case Key_Y:
+	case Qt::Key_Y:
 		setValue(item, yes);
 		break;
 	default:
@@ -803,7 +804,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 			QAction *action;
 
 			headerPopup = new QPopupMenu(this);
-			action = new QAction(NULL, "Show Name", 0, this);
+			action = new QAction(NULL, _("Show Name"), 0, this);
 			  action->setToggleAction(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowName(bool)));
@@ -811,7 +812,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 				  action, SLOT(setOn(bool)));
 			  action->setOn(showName);
 			  action->addTo(headerPopup);
-			action = new QAction(NULL, "Show Range", 0, this);
+			action = new QAction(NULL, _("Show Range"), 0, this);
 			  action->setToggleAction(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowRange(bool)));
@@ -819,7 +820,7 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 				  action, SLOT(setOn(bool)));
 			  action->setOn(showRange);
 			  action->addTo(headerPopup);
-			action = new QAction(NULL, "Show Data", 0, this);
+			action = new QAction(NULL, _("Show Data"), 0, this);
 			  action->setToggleAction(TRUE);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowData(bool)));
@@ -920,7 +921,7 @@ void ConfigView::updateListAll(void)
 }
 
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
-	: Parent(parent, name), menu(0), sym(0)
+	: Parent(parent, name), sym(0), menu(0)
 {
 	if (name) {
 		configSettings->beginGroup(name);
@@ -1041,7 +1042,12 @@ void ConfigInfoView::menuInfo(void)
 		if (showDebug())
 			debug = debug_info(sym);
 
-		help = print_filter(_(menu_get_help(menu)));
+		help = menu_get_help(menu);
+		/* Gettextize if the help text not empty */
+		if (help.isEmpty())
+			help = print_filter(menu_get_help(menu));
+		else
+			help = print_filter(_(menu_get_help(menu)));
 	} else if (menu->prompt) {
 		head += "<big><b>";
 		head += print_filter(_(menu->prompt->text));
@@ -1083,7 +1089,11 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 			debug += "</a><br>";
 			break;
 		case P_DEFAULT:
-			debug += "default: ";
+		case P_SELECT:
+		case P_RANGE:
+		case P_ENV:
+			debug += prop_get_type_name(prop->type);
+			debug += ": ";
 			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
 			debug += "<br>";
 			break;
@@ -1094,16 +1104,6 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
 				debug += "<br>";
 			}
 			break;
-		case P_SELECT:
-			debug += "select: ";
-			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
-			debug += "<br>";
-			break;
-		case P_RANGE:
-			debug += "range: ";
-			expr_print(prop->expr, expr_print_help, &debug, E_NONE);
-			debug += "<br>";
-			break;
 		default:
 			debug += "unknown property: ";
 			debug += prop_get_type_name(prop->type);
@@ -1167,7 +1167,7 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 QPopupMenu* ConfigInfoView::createPopupMenu(const QPoint& pos)
 {
 	QPopupMenu* popup = Parent::createPopupMenu(pos);
-	QAction* action = new QAction(NULL,"Show Debug Info", 0, popup);
+	QAction* action = new QAction(NULL, _("Show Debug Info"), 0, popup);
 	  action->setToggleAction(TRUE);
 	  connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
 	  connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
@@ -1189,18 +1189,18 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 
 	QVBoxLayout* layout1 = new QVBoxLayout(this, 11, 6);
 	QHBoxLayout* layout2 = new QHBoxLayout(0, 0, 6);
-	layout2->addWidget(new QLabel("Find:", this));
+	layout2->addWidget(new QLabel(_("Find:"), this));
 	editField = new QLineEdit(this);
 	connect(editField, SIGNAL(returnPressed()), SLOT(search()));
 	layout2->addWidget(editField);
-	searchButton = new QPushButton("Search", this);
+	searchButton = new QPushButton(_("Search"), this);
 	searchButton->setAutoDefault(FALSE);
 	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
 
 	split = new QSplitter(this);
-	split->setOrientation(QSplitter::Vertical);
+	split->setOrientation(Qt::Vertical);
 	list = new ConfigView(split, name);
 	list->list->mode = listMode;
 	info = new ConfigInfoView(split, name);
@@ -1276,7 +1276,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	int x, y, width, height;
 	char title[256];
 
-	QWidget *d = configApp->desktop();
+	QDesktopWidget *d = configApp->desktop();
 	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
 		getenv("KERNELVERSION"));
 	setCaption(title);
@@ -1291,14 +1291,14 @@ ConfigMainWindow::ConfigMainWindow(void)
 		move(x, y);
 
 	split1 = new QSplitter(this);
-	split1->setOrientation(QSplitter::Horizontal);
+	split1->setOrientation(Qt::Horizontal);
 	setCentralWidget(split1);
 
 	menuView = new ConfigView(split1, "menu");
 	menuList = menuView->list;
 
 	split2 = new QSplitter(split1);
-	split2->setOrientation(QSplitter::Vertical);
+	split2->setOrientation(Qt::Vertical);
 
 	// create config tree
 	configView = new ConfigView(split2, "config");
@@ -1313,58 +1313,58 @@ ConfigMainWindow::ConfigMainWindow(void)
 	menu = menuBar();
 	toolBar = new QToolBar("Tools", this);
 
-	backAction = new QAction("Back", QPixmap(xpm_back), "Back", 0, this);
+	backAction = new QAction("Back", QPixmap(xpm_back), _("Back"), 0, this);
 	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
 	  backAction->setEnabled(FALSE);
-	QAction *quitAction = new QAction("Quit", "&Quit", CTRL+Key_Q, this);
+	QAction *quitAction = new QAction("Quit", _("&Quit"), Qt::CTRL + Qt::Key_Q, this);
 	  connect(quitAction, SIGNAL(activated()), SLOT(close()));
-	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), "&Load", CTRL+Key_L, this);
+	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), _("&Load"), Qt::CTRL + Qt::Key_L, this);
 	  connect(loadAction, SIGNAL(activated()), SLOT(loadConfig()));
-	saveAction = new QAction("Save", QPixmap(xpm_save), "&Save", CTRL+Key_S, this);
+	saveAction = new QAction("Save", QPixmap(xpm_save), _("&Save"), Qt::CTRL + Qt::Key_S, this);
 	  connect(saveAction, SIGNAL(activated()), SLOT(saveConfig()));
 	conf_set_changed_callback(conf_changed);
 	// Set saveAction's initial state
 	conf_changed();
-	QAction *saveAsAction = new QAction("Save As...", "Save &As...", 0, this);
+	QAction *saveAsAction = new QAction("Save As...", _("Save &As..."), 0, this);
 	  connect(saveAsAction, SIGNAL(activated()), SLOT(saveConfigAs()));
-	QAction *searchAction = new QAction("Find", "&Find", CTRL+Key_F, this);
+	QAction *searchAction = new QAction("Find", _("&Find"), Qt::CTRL + Qt::Key_F, this);
 	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
-	QAction *singleViewAction = new QAction("Single View", QPixmap(xpm_single_view), "Split View", 0, this);
+	QAction *singleViewAction = new QAction("Single View", QPixmap(xpm_single_view), _("Single View"), 0, this);
 	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
-	QAction *splitViewAction = new QAction("Split View", QPixmap(xpm_split_view), "Split View", 0, this);
+	QAction *splitViewAction = new QAction("Split View", QPixmap(xpm_split_view), _("Split View"), 0, this);
 	  connect(splitViewAction, SIGNAL(activated()), SLOT(showSplitView()));
-	QAction *fullViewAction = new QAction("Full View", QPixmap(xpm_tree_view), "Full View", 0, this);
+	QAction *fullViewAction = new QAction("Full View", QPixmap(xpm_tree_view), _("Full View"), 0, this);
 	  connect(fullViewAction, SIGNAL(activated()), SLOT(showFullView()));
 
-	QAction *showNameAction = new QAction(NULL, "Show Name", 0, this);
+	QAction *showNameAction = new QAction(NULL, _("Show Name"), 0, this);
 	  showNameAction->setToggleAction(TRUE);
 	  connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
 	  connect(configView, SIGNAL(showNameChanged(bool)), showNameAction, SLOT(setOn(bool)));
 	  showNameAction->setOn(configView->showName());
-	QAction *showRangeAction = new QAction(NULL, "Show Range", 0, this);
+	QAction *showRangeAction = new QAction(NULL, _("Show Range"), 0, this);
 	  showRangeAction->setToggleAction(TRUE);
 	  connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
 	  connect(configView, SIGNAL(showRangeChanged(bool)), showRangeAction, SLOT(setOn(bool)));
 	  showRangeAction->setOn(configList->showRange);
-	QAction *showDataAction = new QAction(NULL, "Show Data", 0, this);
+	QAction *showDataAction = new QAction(NULL, _("Show Data"), 0, this);
 	  showDataAction->setToggleAction(TRUE);
 	  connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
 	  connect(configView, SIGNAL(showDataChanged(bool)), showDataAction, SLOT(setOn(bool)));
 	  showDataAction->setOn(configList->showData);
-	QAction *showAllAction = new QAction(NULL, "Show All Options", 0, this);
+	QAction *showAllAction = new QAction(NULL, _("Show All Options"), 0, this);
 	  showAllAction->setToggleAction(TRUE);
 	  connect(showAllAction, SIGNAL(toggled(bool)), configView, SLOT(setShowAll(bool)));
 	  connect(showAllAction, SIGNAL(toggled(bool)), menuView, SLOT(setShowAll(bool)));
 	  showAllAction->setOn(configList->showAll);
-	QAction *showDebugAction = new QAction(NULL, "Show Debug Info", 0, this);
+	QAction *showDebugAction = new QAction(NULL, _("Show Debug Info"), 0, this);
 	  showDebugAction->setToggleAction(TRUE);
 	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
 	  connect(helpText, SIGNAL(showDebugChanged(bool)), showDebugAction, SLOT(setOn(bool)));
 	  showDebugAction->setOn(helpText->showDebug());
 
-	QAction *showIntroAction = new QAction(NULL, "Introduction", 0, this);
+	QAction *showIntroAction = new QAction(NULL, _("Introduction"), 0, this);
 	  connect(showIntroAction, SIGNAL(activated()), SLOT(showIntro()));
-	QAction *showAboutAction = new QAction(NULL, "About", 0, this);
+	QAction *showAboutAction = new QAction(NULL, _("About"), 0, this);
 	  connect(showAboutAction, SIGNAL(activated()), SLOT(showAbout()));
 
 	// init tool bar
@@ -1379,7 +1379,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	// create config menu
 	QPopupMenu* config = new QPopupMenu(this);
-	menu->insertItem("&File", config);
+	menu->insertItem(_("&File"), config);
 	loadAction->addTo(config);
 	saveAction->addTo(config);
 	saveAsAction->addTo(config);
@@ -1388,12 +1388,12 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 	// create edit menu
 	QPopupMenu* editMenu = new QPopupMenu(this);
-	menu->insertItem("&Edit", editMenu);
+	menu->insertItem(_("&Edit"), editMenu);
 	searchAction->addTo(editMenu);
 
 	// create options menu
 	QPopupMenu* optionMenu = new QPopupMenu(this);
-	menu->insertItem("&Option", optionMenu);
+	menu->insertItem(_("&Option"), optionMenu);
 	showNameAction->addTo(optionMenu);
 	showRangeAction->addTo(optionMenu);
 	showDataAction->addTo(optionMenu);
@@ -1404,7 +1404,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	// create help menu
 	QPopupMenu* helpMenu = new QPopupMenu(this);
 	menu->insertSeparator();
-	menu->insertItem("&Help", helpMenu);
+	menu->insertItem(_("&Help"), helpMenu);
 	showIntroAction->addTo(helpMenu);
 	showAboutAction->addTo(helpMenu);
 
@@ -1448,27 +1448,27 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 void ConfigMainWindow::loadConfig(void)
 {
-	QString s = QFileDialog::getOpenFileName(".config", NULL, this);
+	QString s = QFileDialog::getOpenFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
 	if (conf_read(QFile::encodeName(s)))
-		QMessageBox::information(this, "qconf", "Unable to load configuration!");
+		QMessageBox::information(this, "qconf", _("Unable to load configuration!"));
 	ConfigView::updateListAll();
 }
 
 void ConfigMainWindow::saveConfig(void)
 {
 	if (conf_write(NULL))
-		QMessageBox::information(this, "qconf", "Unable to save configuration!");
+		QMessageBox::information(this, "qconf", _("Unable to save configuration!"));
 }
 
 void ConfigMainWindow::saveConfigAs(void)
 {
-	QString s = QFileDialog::getSaveFileName(".config", NULL, this);
+	QString s = QFileDialog::getSaveFileName(conf_get_configname(), NULL, this);
 	if (s.isNull())
 		return;
 	if (conf_write(QFile::encodeName(s)))
-		QMessageBox::information(this, "qconf", "Unable to save configuration!");
+		QMessageBox::information(this, "qconf", _("Unable to save configuration!"));
 }
 
 void ConfigMainWindow::searchConfig(void)
@@ -1525,6 +1525,8 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	case fullMode:
 		list = configList;
 		break;
+	default:
+		break;
 	}
 
 	if (list) {
@@ -1612,11 +1614,11 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 		e->accept();
 		return;
 	}
-	QMessageBox mb("qconf", "Save configuration?", QMessageBox::Warning,
+	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
 			QMessageBox::Yes | QMessageBox::Default, QMessageBox::No, QMessageBox::Cancel | QMessageBox::Escape);
-	mb.setButtonText(QMessageBox::Yes, "&Save Changes");
-	mb.setButtonText(QMessageBox::No, "&Discard Changes");
-	mb.setButtonText(QMessageBox::Cancel, "Cancel Exit");
+	mb.setButtonText(QMessageBox::Yes, _("&Save Changes"));
+	mb.setButtonText(QMessageBox::No, _("&Discard Changes"));
+	mb.setButtonText(QMessageBox::Cancel, _("Cancel Exit"));
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
 		conf_write(NULL);
@@ -1631,7 +1633,7 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 
 void ConfigMainWindow::showIntro(void)
 {
-	static char str[] = "Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
+	static const QString str = _("Welcome to the qconf graphical kernel configuration tool for Linux.\n\n"
 		"For each option, a blank box indicates the feature is disabled, a check\n"
 		"indicates it is enabled, and a dot indicates that it is to be compiled\n"
 		"as a module.  Clicking on the box will cycle through the three states.\n\n"
@@ -1641,15 +1643,15 @@ void ConfigMainWindow::showIntro(void)
 		"options must be enabled to support the option you are interested in, you can\n"
 		"still view the help of a grayed-out option.\n\n"
 		"Toggling Show Debug Info under the Options menu will show the dependencies,\n"
-		"which you can then match by examining other options.\n\n";
+		"which you can then match by examining other options.\n\n");
 
 	QMessageBox::information(this, "qconf", str);
 }
 
 void ConfigMainWindow::showAbout(void)
 {
-	static char str[] = "qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n\n"
-		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n";
+	static const QString str = _("qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n\n"
+		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n");
 
 	QMessageBox::information(this, "qconf", str);
 }
@@ -1674,6 +1676,9 @@ void ConfigMainWindow::saveSettings(void)
 	case fullMode :
 		entry = "full";
 		break;
+
+	default:
+		break;
 	}
 	configSettings->writeEntry("/listMode", entry);
 
@@ -1707,7 +1712,7 @@ static const char *progname;
 
 static void usage(void)
 {
-	printf("%s <config>\n", progname);
+	printf(_("%s <config>\n"), progname);
 	exit(0);
 }
 
diff --git a/package/config/symbol.c b/package/config/symbol.c
index 0a61042..18f3e5c 100644
--- a/package/config/symbol.c
+++ b/package/config/symbol.c
@@ -34,18 +34,19 @@ struct symbol *sym_defconfig_list;
 struct symbol *modules_sym;
 tristate modules_val;
 
+struct expr *sym_env_list;
+
 void sym_add_default(struct symbol *sym, const char *def)
 {
 	struct property *prop = prop_alloc(P_DEFAULT, sym);
 
-	prop->expr = expr_alloc_symbol(sym_lookup(def, 1));
+	prop->expr = expr_alloc_symbol(sym_lookup(def, SYMBOL_CONST));
 }
 
 void sym_init(void)
 {
 	struct symbol *sym;
 	struct utsname uts;
-	char *p;
 	static bool inited = false;
 
 	if (inited)
@@ -54,20 +55,6 @@ void sym_init(void)
 
 	uname(&uts);
 
-	sym = sym_lookup("ARCH", 0);
-	sym->type = S_STRING;
-	sym->flags |= SYMBOL_AUTO;
-	p = getenv("ARCH");
-	if (p)
-		sym_add_default(sym, p);
-
-	sym = sym_lookup("BR2_VERSION", 0);
-	sym->type = S_STRING;
-	sym->flags |= SYMBOL_AUTO;
-	p = getenv("BR2_VERSION");
-	if (p)
-		sym_add_default(sym, p);
-
 	sym = sym_lookup("UNAME_RELEASE", 0);
 	sym->type = S_STRING;
 	sym->flags |= SYMBOL_AUTO;
@@ -117,6 +104,15 @@ struct property *sym_get_choice_prop(struct symbol *sym)
 	return NULL;
 }
 
+struct property *sym_get_env_prop(struct symbol *sym)
+{
+	struct property *prop;
+
+	for_all_properties(sym, prop, P_ENV)
+		return prop;
+	return NULL;
+}
+
 struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
@@ -199,7 +195,7 @@ static void sym_calc_visibility(struct symbol *sym)
 	tri = no;
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
-		tri = E_OR(tri, prop->visible.tri);
+		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
 		tri = yes;
@@ -247,8 +243,7 @@ static struct symbol *sym_calc_choice(struct symbol *sym)
 
 	/* just get the first visible value */
 	prop = sym_get_choice_prop(sym);
-	for (e = prop->expr; e; e = e->left.expr) {
-		def_sym = e->right.sym;
+	expr_list_for_each_sym(prop->expr, e, def_sym) {
 		sym_calc_visibility(def_sym);
 		if (def_sym->visible != no)
 			return def_sym;
@@ -303,22 +298,30 @@ void sym_calc_value(struct symbol *sym)
 		if (sym_is_choice_value(sym) && sym->visible == yes) {
 			prop = sym_get_choice_prop(sym);
 			newval.tri = (prop_get_symbol(prop)->curr.val == sym) ? yes : no;
-		} else if (E_OR(sym->visible, sym->rev_dep.tri) != no) {
-			sym->flags |= SYMBOL_WRITE;
-			if (sym_has_value(sym))
-				newval.tri = sym->def[S_DEF_USER].tri;
-			else if (!sym_is_choice(sym)) {
-				prop = sym_get_default_prop(sym);
-				if (prop)
-					newval.tri = expr_calc_value(prop->expr);
+		} else {
+			if (sym->visible != no) {
+				/* if the symbol is visible use the user value
+				 * if available, otherwise try the default value
+				 */
+				sym->flags |= SYMBOL_WRITE;
+				if (sym_has_value(sym)) {
+					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
+							      sym->visible);
+					goto calc_newval;
+				}
 			}
-			newval.tri = E_OR(E_AND(newval.tri, sym->visible), sym->rev_dep.tri);
-		} else if (!sym_is_choice(sym)) {
-			prop = sym_get_default_prop(sym);
-			if (prop) {
+			if (sym->rev_dep.tri != no)
 				sym->flags |= SYMBOL_WRITE;
-				newval.tri = expr_calc_value(prop->expr);
+			if (!sym_is_choice(sym)) {
+				prop = sym_get_default_prop(sym);
+				if (prop) {
+					sym->flags |= SYMBOL_WRITE;
+					newval.tri = EXPR_AND(expr_calc_value(prop->expr),
+							      prop->visible.tri);
+				}
 			}
+		calc_newval:
+			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
 		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
 			newval.tri = yes;
@@ -361,14 +364,19 @@ void sym_calc_value(struct symbol *sym)
 	}
 
 	if (sym_is_choice(sym)) {
+		struct symbol *choice_sym;
 		int flags = sym->flags & (SYMBOL_CHANGED | SYMBOL_WRITE);
+
 		prop = sym_get_choice_prop(sym);
-		for (e = prop->expr; e; e = e->left.expr) {
-			e->right.sym->flags |= flags;
+		expr_list_for_each_sym(prop->expr, e, choice_sym) {
+			choice_sym->flags |= flags;
 			if (flags & SYMBOL_CHANGED)
-				sym_set_changed(e->right.sym);
+				sym_set_changed(choice_sym);
 		}
 	}
+
+	if (sym->flags & SYMBOL_AUTO)
+		sym->flags &= ~SYMBOL_WRITE;
 }
 
 void sym_clear_all_valid(void)
@@ -643,7 +651,7 @@ bool sym_is_changable(struct symbol *sym)
 	return sym->visible > sym->rev_dep.tri;
 }
 
-struct symbol *sym_lookup(const char *name, int isconst)
+struct symbol *sym_lookup(const char *name, int flags)
 {
 	struct symbol *symbol;
 	const char *ptr;
@@ -663,11 +671,10 @@ struct symbol *sym_lookup(const char *name, int isconst)
 		hash &= 0xff;
 
 		for (symbol = symbol_hash[hash]; symbol; symbol = symbol->next) {
-			if (!strcmp(symbol->name, name)) {
-				if ((isconst && symbol->flags & SYMBOL_CONST) ||
-				    (!isconst && !(symbol->flags & SYMBOL_CONST)))
-					return symbol;
-			}
+			if (!strcmp(symbol->name, name) &&
+			    (flags ? symbol->flags & flags
+				   : !(symbol->flags & (SYMBOL_CONST|SYMBOL_CHOICE))))
+				return symbol;
 		}
 		new_name = strdup(name);
 	} else {
@@ -679,8 +686,7 @@ struct symbol *sym_lookup(const char *name, int isconst)
 	memset(symbol, 0, sizeof(*symbol));
 	symbol->name = new_name;
 	symbol->type = S_UNKNOWN;
-	if (isconst)
-		symbol->flags |= SYMBOL_CONST;
+	symbol->flags |= flags;
 
 	symbol->next = symbol_hash[hash];
 	symbol_hash[hash] = symbol;
@@ -754,8 +760,6 @@ struct symbol **sym_re_search(const char *pattern)
 }
 
 
-struct symbol *sym_check_deps(struct symbol *sym);
-
 static struct symbol *sym_check_expr_deps(struct expr *e)
 {
 	struct symbol *sym;
@@ -787,40 +791,100 @@ static struct symbol *sym_check_expr_deps(struct expr *e)
 }
 
 /* return NULL when dependencies are OK */
-struct symbol *sym_check_deps(struct symbol *sym)
+static struct symbol *sym_check_sym_deps(struct symbol *sym)
 {
 	struct symbol *sym2;
 	struct property *prop;
 
-	if (sym->flags & SYMBOL_CHECK) {
-		fprintf(stderr, "%s:%d:error: found recursive dependency: %s",
-		        sym->prop->file->name, sym->prop->lineno, sym->name);
-		return sym;
-	}
-	if (sym->flags & SYMBOL_CHECKED)
-		return NULL;
-
-	sym->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
 	sym2 = sym_check_expr_deps(sym->rev_dep.expr);
 	if (sym2)
-		goto out;
+		return sym2;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		if (prop->type == P_CHOICE || prop->type == P_SELECT)
 			continue;
 		sym2 = sym_check_expr_deps(prop->visible.expr);
 		if (sym2)
-			goto out;
+			break;
 		if (prop->type != P_DEFAULT || sym_is_choice(sym))
 			continue;
 		sym2 = sym_check_expr_deps(prop->expr);
 		if (sym2)
-			goto out;
+			break;
 	}
-out:
+
+	return sym2;
+}
+
+static struct symbol *sym_check_choice_deps(struct symbol *choice)
+{
+	struct symbol *sym, *sym2;
+	struct property *prop;
+	struct expr *e;
+
+	prop = sym_get_choice_prop(choice);
+	expr_list_for_each_sym(prop->expr, e, sym)
+		sym->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
+
+	choice->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
+	sym2 = sym_check_sym_deps(choice);
+	choice->flags &= ~SYMBOL_CHECK;
 	if (sym2)
-		fprintf(stderr, " -> %s%s", sym->name, sym2 == sym? "\n": "");
-	sym->flags &= ~SYMBOL_CHECK;
+		goto out;
+
+	expr_list_for_each_sym(prop->expr, e, sym) {
+		sym2 = sym_check_sym_deps(sym);
+		if (sym2) {
+			fprintf(stderr, " -> %s", sym->name);
+			break;
+		}
+	}
+out:
+	expr_list_for_each_sym(prop->expr, e, sym)
+		sym->flags &= ~SYMBOL_CHECK;
+
+	if (sym2 && sym_is_choice_value(sym2) &&
+	    prop_get_symbol(sym_get_choice_prop(sym2)) == choice)
+		sym2 = choice;
+
+	return sym2;
+}
+
+struct symbol *sym_check_deps(struct symbol *sym)
+{
+	struct symbol *sym2;
+	struct property *prop;
+
+	if (sym->flags & SYMBOL_CHECK) {
+		fprintf(stderr, "%s:%d:error: found recursive dependency: %s",
+		        sym->prop->file->name, sym->prop->lineno,
+			sym->name ? sym->name : "<choice>");
+		return sym;
+	}
+	if (sym->flags & SYMBOL_CHECKED)
+		return NULL;
+
+	if (sym_is_choice_value(sym)) {
+		/* for choice groups start the check with main choice symbol */
+		prop = sym_get_choice_prop(sym);
+		sym2 = sym_check_deps(prop_get_symbol(prop));
+	} else if (sym_is_choice(sym)) {
+		sym2 = sym_check_choice_deps(sym);
+	} else {
+		sym->flags |= (SYMBOL_CHECK | SYMBOL_CHECKED);
+		sym2 = sym_check_sym_deps(sym);
+		sym->flags &= ~SYMBOL_CHECK;
+	}
+
+	if (sym2) {
+		fprintf(stderr, " -> %s", sym->name ? sym->name : "<choice>");
+		if (sym2 == sym) {
+			fprintf(stderr, "\n");
+			zconfnerrs++;
+			sym2 = NULL;
+		}
+	}
+
 	return sym2;
 }
 
@@ -849,7 +913,7 @@ struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 struct symbol *prop_get_symbol(struct property *prop)
 {
 	if (prop->expr && (prop->expr->type == E_SYMBOL ||
-			   prop->expr->type == E_CHOICE))
+			   prop->expr->type == E_LIST))
 		return prop->expr->left.sym;
 	return NULL;
 }
@@ -859,6 +923,8 @@ const char *prop_get_type_name(enum prop_type type)
 	switch (type) {
 	case P_PROMPT:
 		return "prompt";
+	case P_ENV:
+		return "env";
 	case P_COMMENT:
 		return "comment";
 	case P_MENU:
@@ -876,3 +942,32 @@ const char *prop_get_type_name(enum prop_type type)
 	}
 	return "unknown";
 }
+
+void prop_add_env(const char *env)
+{
+	struct symbol *sym, *sym2;
+	struct property *prop;
+	char *p;
+
+	sym = current_entry->sym;
+	sym->flags |= SYMBOL_AUTO;
+	for_all_properties(sym, prop, P_ENV) {
+		sym2 = prop_get_symbol(prop);
+		if (strcmp(sym2->name, env))
+			menu_warn(current_entry, "redefining environment symbol from %s",
+				  sym2->name);
+		return;
+	}
+
+	prop = prop_alloc(P_ENV, sym);
+	prop->expr = expr_alloc_symbol(sym_lookup(env, SYMBOL_CONST));
+
+	sym_env_list = expr_alloc_one(E_LIST, sym_env_list);
+	sym_env_list->right.sym = sym;
+
+	p = getenv(env);
+	if (p)
+		sym_add_default(sym, p);
+	else
+		menu_warn(current_entry, "environment variable %s undefined", env);
+}
diff --git a/package/config/util.c b/package/config/util.c
index a68f752..4203838 100644
--- a/package/config/util.c
+++ b/package/config/util.c
@@ -132,6 +132,8 @@ next:
 /* write a dependency file as used by kbuild to track dependencies */
 int file_write_dep(const char *name)
 {
+	struct symbol *sym, *env_sym;
+	struct expr *e;
 	struct file *file;
 	FILE *out;
 
@@ -147,12 +149,28 @@ int file_write_dep(const char *name)
 		else
 			fprintf(out, "\t%s\n", file->name);
 	}
-	fprintf(out, "\n$(BR2_DEPENDS_DIR)/config/auto.conf: \\\n"
-		     "\t$(deps_config)\n\n"
-		     "$(deps_config): ;\n");
+	fprintf(out, "\n%s: \\\n"
+		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
+
+	expr_list_for_each_sym(sym_env_list, e, sym) {
+		struct property *prop;
+		const char *value;
+
+		prop = sym_get_env_prop(sym);
+		env_sym = prop_get_symbol(prop);
+		if (!env_sym)
+			continue;
+		value = getenv(env_sym->name);
+		if (!value)
+			value = "";
+		fprintf(out, "ifneq \"$(%s)\" \"%s\"\n", env_sym->name, value);
+		fprintf(out, "%s: FORCE\n", conf_get_autoconfig_name());
+		fprintf(out, "endif\n");
+	}
+
+	fprintf(out, "\n$(deps_config): ;\n");
 	fclose(out);
 	rename("..config.tmp", name);
-
 	return write_make_deps(NULL);
 }
 
@@ -162,7 +180,7 @@ struct gstr str_new(void)
 {
 	struct gstr gs;
 	gs.s = malloc(sizeof(char) * 64);
-	gs.len = 16;
+	gs.len = 64;
 	strcpy(gs.s, "\0");
 	return gs;
 }
diff --git a/package/config/zconf.gperf b/package/config/zconf.gperf
index 93538e5..25ef5d0 100644
--- a/package/config/zconf.gperf
+++ b/package/config/zconf.gperf
@@ -35,10 +35,10 @@ int,		T_TYPE,		TF_COMMAND, S_INT
 hex,		T_TYPE,		TF_COMMAND, S_HEX
 string,		T_TYPE,		TF_COMMAND, S_STRING
 select,		T_SELECT,	TF_COMMAND
-enable,		T_SELECT,	TF_COMMAND
 range,		T_RANGE,	TF_COMMAND
 option,		T_OPTION,	TF_COMMAND
 on,		T_ON,		TF_PARAM
 modules,	T_OPT_MODULES,	TF_OPTION
 defconfig_list,	T_OPT_DEFCONFIG_LIST,TF_OPTION
+env,		T_OPT_ENV,	TF_OPTION
 %%
diff --git a/package/config/zconf.hash.c_shipped b/package/config/zconf.hash.c_shipped
index ab28b18..5c73d51 100644
--- a/package/config/zconf.hash.c_shipped
+++ b/package/config/zconf.hash.c_shipped
@@ -1,4 +1,4 @@
-/* ANSI-C code produced by gperf version 3.0.2 */
+/* ANSI-C code produced by gperf version 3.0.3 */
 /* Command-line: gperf  */
 /* Computed positions: -k'1,3' */
 
@@ -53,9 +53,9 @@ kconf_id_hash (register const char *str, register unsigned int len)
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
-      49, 49, 49, 49, 49, 49, 49, 18, 11,  5,
+      49, 49, 49, 49, 49, 49, 49, 49, 11,  5,
        0,  0,  5, 49,  5, 20, 49, 49,  5, 20,
-       5,  0, 30, 49,  0, 15,  0, 10, 49, 49,
+       5,  0, 30, 49,  0, 15,  0, 10,  0, 49,
       25, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
       49, 49, 49, 49, 49, 49, 49, 49, 49, 49,
@@ -89,6 +89,7 @@ kconf_id_hash (register const char *str, register unsigned int len)
 struct kconf_id_strings_t
   {
     char kconf_id_strings_str2[sizeof("on")];
+    char kconf_id_strings_str3[sizeof("env")];
     char kconf_id_strings_str5[sizeof("endif")];
     char kconf_id_strings_str6[sizeof("option")];
     char kconf_id_strings_str7[sizeof("endmenu")];
@@ -107,7 +108,6 @@ struct kconf_id_strings_t
     char kconf_id_strings_str21[sizeof("string")];
     char kconf_id_strings_str22[sizeof("if")];
     char kconf_id_strings_str23[sizeof("int")];
-    char kconf_id_strings_str24[sizeof("enable")];
     char kconf_id_strings_str26[sizeof("select")];
     char kconf_id_strings_str27[sizeof("modules")];
     char kconf_id_strings_str28[sizeof("tristate")];
@@ -123,6 +123,7 @@ struct kconf_id_strings_t
 static struct kconf_id_strings_t kconf_id_strings_contents =
   {
     "on",
+    "env",
     "endif",
     "option",
     "endmenu",
@@ -141,7 +142,6 @@ static struct kconf_id_strings_t kconf_id_strings_contents =
     "string",
     "if",
     "int",
-    "enable",
     "select",
     "modules",
     "tristate",
@@ -157,6 +157,9 @@ static struct kconf_id_strings_t kconf_id_strings_contents =
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
 __inline
+#ifdef __GNUC_STDC_INLINE__
+__attribute__ ((__gnu_inline__))
+#endif
 #endif
 struct kconf_id *
 kconf_id_lookup (register const char *str, register unsigned int len)
@@ -174,7 +177,8 @@ kconf_id_lookup (register const char *str, register unsigned int len)
     {
       {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {-1}, {-1},
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_OPT_ENV,	TF_OPTION},
+      {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
@@ -194,8 +198,7 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_TYPE,		TF_COMMAND, S_STRING},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str24,		T_SELECT,	TF_COMMAND},
-      {-1},
+      {-1}, {-1},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str26,		T_SELECT,	TF_COMMAND},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
diff --git a/package/config/zconf.l b/package/config/zconf.l
index 4a0447b..21ff69c 100644
--- a/package/config/zconf.l
+++ b/package/config/zconf.l
@@ -1,5 +1,6 @@
 %option backup nostdinit noyywrap never-interactive full ecs
 %option 8bit backup nodefault perf-report perf-report
+%option noinput
 %x COMMAND HELP STRING PARAM
 %{
 /*
@@ -49,11 +50,6 @@ void new_string(void)
 void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
-
-	if ((YY_START == 2 /* HELP */) && (size > 70)) {
-	        fprintf (stderr, "%s:%d warning: Overlong line\n",
-			 current_file->name, current_file->lineno);
-	}
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;
@@ -222,6 +218,11 @@ n	[A-Za-z0-9_]
 		append_string("\n", 1);
 	}
 	[^ \t\n].* {
+		while (yyleng) {
+			if ((yytext[yyleng-1] != ' ') && (yytext[yyleng-1] != '\t'))
+				break;
+			yyleng--;
+		}
 		append_string(yytext, yyleng);
 		if (!first_ts)
 			first_ts = last_ts;
@@ -313,11 +314,14 @@ void zconf_nextfile(const char *name)
 	current_buf = buf;
 
 	if (file->flags & FILE_BUSY) {
-		printf("recursive scan (%s)?\n", name);
+		printf("%s:%d: do not source '%s' from itself\n",
+		       zconf_curname(), zconf_lineno(), name);
 		exit(1);
 	}
 	if (file->flags & FILE_SCANNED) {
-		printf("file %s already scanned?\n", name);
+		printf("%s:%d: file '%s' is already sourced from '%s'\n",
+		       zconf_curname(), zconf_lineno(), name,
+		       file->parent->name);
 		exit(1);
 	}
 	file->flags |= FILE_BUSY;
diff --git a/package/config/zconf.tab.c_shipped b/package/config/zconf.tab.c_shipped
index 3e9e908..bb1e1da 100644
--- a/package/config/zconf.tab.c_shipped
+++ b/package/config/zconf.tab.c_shipped
@@ -446,16 +446,16 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  3
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   258
+#define YYLAST   259
 
 /* YYNTOKENS -- Number of terminals.  */
 #define YYNTOKENS  35
 /* YYNNTS -- Number of nonterminals.  */
-#define YYNNTS  45
+#define YYNNTS  46
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  108
+#define YYNRULES  110
 /* YYNRULES -- Number of states.  */
-#define YYNSTATES  178
+#define YYNSTATES  180
 
 /* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
 #define YYUNDEFTOK  2
@@ -507,13 +507,14 @@ static const yytype_uint16 yyprhs[] =
       28,    33,    37,    39,    41,    43,    45,    47,    49,    51,
       53,    55,    57,    59,    61,    63,    67,    70,    74,    77,
       81,    84,    85,    88,    91,    94,    97,   100,   103,   107,
-     112,   117,   122,   128,   132,   133,   137,   138,   141,   144,
-     147,   149,   153,   154,   157,   160,   163,   166,   169,   174,
-     178,   181,   186,   187,   190,   194,   196,   200,   201,   204,
-     207,   210,   214,   217,   219,   223,   224,   227,   230,   233,
-     237,   241,   244,   247,   250,   251,   254,   257,   260,   265,
-     266,   269,   271,   273,   276,   279,   282,   284,   287,   288,
-     291,   293,   297,   301,   305,   308,   312,   316,   318
+     112,   117,   122,   128,   132,   133,   137,   138,   141,   145,
+     148,   150,   154,   155,   158,   161,   164,   167,   170,   175,
+     179,   182,   187,   188,   191,   195,   197,   201,   202,   205,
+     208,   211,   215,   218,   220,   224,   225,   228,   231,   234,
+     238,   242,   245,   248,   251,   252,   255,   258,   261,   266,
+     267,   270,   272,   274,   277,   280,   283,   285,   288,   289,
+     292,   294,   298,   302,   306,   309,   313,   317,   319,   321,
+     322
 };
 
 /* YYRHS -- A `-1'-separated list of the rules' RHS.  */
@@ -533,24 +534,25 @@ static const yytype_int8 yyrhs[] =
       30,    -1,    20,    78,    77,    30,    -1,    21,    25,    77,
       30,    -1,    22,    79,    79,    77,    30,    -1,    23,    48,
       30,    -1,    -1,    48,    25,    49,    -1,    -1,    33,    74,
-      -1,     7,    30,    -1,    50,    54,    -1,    75,    -1,    51,
-      56,    52,    -1,    -1,    54,    55,    -1,    54,    72,    -1,
-      54,    70,    -1,    54,    30,    -1,    54,    40,    -1,    18,
-      74,    77,    30,    -1,    19,    73,    30,    -1,    17,    30,
-      -1,    20,    25,    77,    30,    -1,    -1,    56,    39,    -1,
-      14,    78,    76,    -1,    75,    -1,    57,    60,    58,    -1,
-      -1,    60,    39,    -1,    60,    64,    -1,    60,    53,    -1,
-       4,    74,    30,    -1,    61,    71,    -1,    75,    -1,    62,
-      65,    63,    -1,    -1,    65,    39,    -1,    65,    64,    -1,
-      65,    53,    -1,     6,    74,    30,    -1,     9,    74,    30,
-      -1,    67,    71,    -1,    12,    30,    -1,    69,    13,    -1,
-      -1,    71,    72,    -1,    71,    30,    -1,    71,    40,    -1,
-      16,    24,    78,    30,    -1,    -1,    74,    77,    -1,    25,
-      -1,    26,    -1,     5,    30,    -1,     8,    30,    -1,    15,
-      30,    -1,    30,    -1,    76,    30,    -1,    -1,    14,    78,
-      -1,    79,    -1,    79,    33,    79,    -1,    79,    27,    79,
-      -1,    29,    78,    28,    -1,    34,    78,    -1,    78,    31,
-      78,    -1,    78,    32,    78,    -1,    25,    -1,    26,    -1
+      -1,     7,    80,    30,    -1,    50,    54,    -1,    75,    -1,
+      51,    56,    52,    -1,    -1,    54,    55,    -1,    54,    72,
+      -1,    54,    70,    -1,    54,    30,    -1,    54,    40,    -1,
+      18,    74,    77,    30,    -1,    19,    73,    30,    -1,    17,
+      30,    -1,    20,    25,    77,    30,    -1,    -1,    56,    39,
+      -1,    14,    78,    76,    -1,    75,    -1,    57,    60,    58,
+      -1,    -1,    60,    39,    -1,    60,    64,    -1,    60,    53,
+      -1,     4,    74,    30,    -1,    61,    71,    -1,    75,    -1,
+      62,    65,    63,    -1,    -1,    65,    39,    -1,    65,    64,
+      -1,    65,    53,    -1,     6,    74,    30,    -1,     9,    74,
+      30,    -1,    67,    71,    -1,    12,    30,    -1,    69,    13,
+      -1,    -1,    71,    72,    -1,    71,    30,    -1,    71,    40,
+      -1,    16,    24,    78,    30,    -1,    -1,    74,    77,    -1,
+      25,    -1,    26,    -1,     5,    30,    -1,     8,    30,    -1,
+      15,    30,    -1,    30,    -1,    76,    30,    -1,    -1,    14,
+      78,    -1,    79,    -1,    79,    33,    79,    -1,    79,    27,
+      79,    -1,    29,    78,    28,    -1,    34,    78,    -1,    78,
+      31,    78,    -1,    78,    32,    78,    -1,    25,    -1,    26,
+      -1,    -1,    25,    -1
 };
 
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
@@ -566,7 +568,8 @@ static const yytype_uint16 yyrline[] =
      339,   344,   351,   356,   364,   367,   369,   370,   371,   374,
      382,   389,   396,   402,   409,   411,   412,   413,   416,   424,
      426,   431,   432,   435,   436,   437,   441,   442,   445,   446,
-     449,   450,   451,   452,   453,   454,   455,   458,   459
+     449,   450,   451,   452,   453,   454,   455,   458,   459,   462,
+     463
 };
 #endif
 
@@ -590,7 +593,8 @@ static const char *const yytname[] =
   "if_entry", "if_end", "if_stmt", "if_block", "menu", "menu_entry",
   "menu_end", "menu_stmt", "menu_block", "source_stmt", "comment",
   "comment_stmt", "help_start", "help", "depends_list", "depends",
-  "prompt_stmt_opt", "prompt", "end", "nl", "if_expr", "expr", "symbol", 0
+  "prompt_stmt_opt", "prompt", "end", "nl", "if_expr", "expr", "symbol",
+  "word_opt", 0
 };
 #endif
 
@@ -619,7 +623,8 @@ static const yytype_uint8 yyr1[] =
       60,    61,    62,    63,    64,    65,    65,    65,    65,    66,
       67,    68,    69,    70,    71,    71,    71,    71,    72,    73,
       73,    74,    74,    75,    75,    75,    76,    76,    77,    77,
-      78,    78,    78,    78,    78,    78,    78,    79,    79
+      78,    78,    78,    78,    78,    78,    78,    79,    79,    80,
+      80
 };
 
 /* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
@@ -629,13 +634,14 @@ static const yytype_uint8 yyr2[] =
        4,     3,     1,     1,     1,     1,     1,     1,     1,     1,
        1,     1,     1,     1,     1,     3,     2,     3,     2,     3,
        2,     0,     2,     2,     2,     2,     2,     2,     3,     4,
-       4,     4,     5,     3,     0,     3,     0,     2,     2,     2,
+       4,     4,     5,     3,     0,     3,     0,     2,     3,     2,
        1,     3,     0,     2,     2,     2,     2,     2,     4,     3,
        2,     4,     0,     2,     3,     1,     3,     0,     2,     2,
        2,     3,     2,     1,     3,     0,     2,     2,     2,     3,
        3,     2,     2,     2,     0,     2,     2,     2,     4,     0,
        2,     1,     1,     2,     2,     2,     1,     2,     0,     2,
-       1,     3,     3,     3,     2,     3,     3,     1,     1
+       1,     3,     3,     3,     2,     3,     3,     1,     1,     0,
+       1
 };
 
 /* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
@@ -643,69 +649,69 @@ static const yytype_uint8 yyr2[] =
    means the default is an error.  */
 static const yytype_uint8 yydefact[] =
 {
-       3,     0,     0,     1,     0,     0,     0,     0,     0,     0,
+       3,     0,     0,     1,     0,     0,     0,     0,     0,   109,
        0,     0,     0,     0,     0,     0,    12,    16,    13,    14,
       18,    15,    17,     0,    19,     0,     4,    31,    22,    31,
       23,    52,    62,     5,    67,    20,    84,    75,     6,    24,
       84,    21,     8,    11,    91,    92,     0,     0,    93,     0,
-      48,    94,     0,     0,     0,   107,   108,     0,     0,     0,
-     100,    95,     0,     0,     0,     0,     0,     0,     0,     0,
-       0,     0,    96,     7,    71,    79,    80,    27,    29,     0,
-     104,     0,     0,    64,     0,     0,     9,    10,     0,     0,
-       0,     0,    89,     0,     0,     0,    44,     0,    37,    36,
-      32,    33,     0,    35,    34,     0,     0,    89,     0,    56,
-      57,    53,    55,    54,    63,    51,    50,    68,    70,    66,
-      69,    65,    86,    87,    85,    76,    78,    74,    77,    73,
-      97,   103,   105,   106,   102,   101,    26,    82,     0,    98,
-       0,    98,    98,    98,     0,     0,     0,    83,    60,    98,
-       0,    98,     0,     0,     0,    38,    90,     0,     0,    98,
-      46,    43,    25,     0,    59,     0,    88,    99,    39,    40,
-      41,     0,     0,    45,    58,    61,    42,    47
+     110,     0,    94,     0,     0,     0,   107,   108,     0,     0,
+       0,   100,    95,     0,     0,     0,     0,     0,     0,     0,
+       0,     0,     0,    96,     7,    71,    79,    48,    80,    27,
+      29,     0,   104,     0,     0,    64,     0,     0,     9,    10,
+       0,     0,     0,     0,    89,     0,     0,     0,    44,     0,
+      37,    36,    32,    33,     0,    35,    34,     0,     0,    89,
+       0,    56,    57,    53,    55,    54,    63,    51,    50,    68,
+      70,    66,    69,    65,    86,    87,    85,    76,    78,    74,
+      77,    73,    97,   103,   105,   106,   102,   101,    26,    82,
+       0,    98,     0,    98,    98,    98,     0,     0,     0,    83,
+      60,    98,     0,    98,     0,     0,     0,    38,    90,     0,
+       0,    98,    46,    43,    25,     0,    59,     0,    88,    99,
+      39,    40,    41,     0,     0,    45,    58,    61,    42,    47
 };
 
 /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     1,     2,    25,    26,    99,    27,    28,    29,    30,
-      64,   100,   101,   145,   173,    31,    32,   115,    33,    66,
-     111,    67,    34,   119,    35,    68,    36,    37,   127,    38,
-      70,    39,    40,    41,   102,   103,    69,   104,   140,   141,
-      42,    73,   154,    59,    60
+      -1,     1,     2,    25,    26,   101,    27,    28,    29,    30,
+      65,   102,   103,   147,   175,    31,    32,   117,    33,    67,
+     113,    68,    34,   121,    35,    69,    36,    37,   129,    38,
+      71,    39,    40,    41,   104,   105,    70,   106,   142,   143,
+      42,    74,   156,    60,    61,    51
 };
 
 /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
    STATE-NUM.  */
-#define YYPACT_NINF -78
+#define YYPACT_NINF -80
 static const yytype_int16 yypact[] =
 {
-     -78,    33,   130,   -78,   -28,    73,    73,     7,    73,    36,
-      41,    73,    26,    52,    -4,    58,   -78,   -78,   -78,   -78,
-     -78,   -78,   -78,    90,   -78,    94,   -78,   -78,   -78,   -78,
-     -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,
-     -78,   -78,   -78,   -78,   -78,   -78,    74,    85,   -78,    96,
-     -78,   -78,   131,   134,   147,   -78,   -78,    -4,    -4,   193,
-     -10,   -78,   162,   164,    38,   102,    64,   148,     5,   192,
-       5,   165,   -78,   174,   -78,   -78,   -78,   -78,   -78,    65,
-     -78,    -4,    -4,   174,   103,   103,   -78,   -78,   175,   185,
-     197,    73,    73,    -4,   194,   103,   -78,   231,   -78,   -78,
-     -78,   -78,   220,   -78,   -78,   204,    73,    73,   210,   -78,
-     -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,
-     -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,
-     -78,   -78,   205,   -78,   -78,   -78,   -78,   -78,    -4,   222,
-     208,   222,   195,   222,   103,     2,   209,   -78,   -78,   222,
-     211,   222,   199,    -4,   212,   -78,   -78,   213,   214,   222,
-     207,   -78,   -78,   215,   -78,   216,   -78,   111,   -78,   -78,
-     -78,   217,    73,   -78,   -78,   -78,   -78,   -78
+     -80,     2,   132,   -80,   -13,    -1,    -1,    -2,    -1,     9,
+      33,    -1,    27,    40,    -3,    38,   -80,   -80,   -80,   -80,
+     -80,   -80,   -80,    71,   -80,    77,   -80,   -80,   -80,   -80,
+     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
+     -80,   -80,   -80,   -80,   -80,   -80,    57,    61,   -80,    63,
+     -80,    76,   -80,    87,   101,   133,   -80,   -80,    -3,    -3,
+     195,    -6,   -80,   136,   149,    39,   104,    65,   150,     5,
+     194,     5,   167,   -80,   176,   -80,   -80,   -80,   -80,   -80,
+     -80,    68,   -80,    -3,    -3,   176,    72,    72,   -80,   -80,
+     177,   187,    78,    -1,    -1,    -3,   196,    72,   -80,   222,
+     -80,   -80,   -80,   -80,   221,   -80,   -80,   205,    -1,    -1,
+     211,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
+     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,
+     -80,   -80,   -80,   -80,   206,   -80,   -80,   -80,   -80,   -80,
+      -3,   223,   209,   223,   197,   223,    72,     7,   210,   -80,
+     -80,   223,   212,   223,   201,    -3,   213,   -80,   -80,   214,
+     215,   223,   208,   -80,   -80,   216,   -80,   217,   -80,   113,
+     -80,   -80,   -80,   218,    -1,   -80,   -80,   -80,   -80,   -80
 };
 
 /* YYPGOTO[NTERM-NUM].  */
 static const yytype_int16 yypgoto[] =
 {
-     -78,   -78,   -78,   -78,   121,   -35,   -78,   -78,   -78,   -78,
-     219,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -44,   -78,
-     -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,   -78,    -6,
-     -78,   -78,   -78,   -78,   -78,   183,   218,    21,   143,    -5,
-     146,   196,    69,   -53,   -77
+     -80,   -80,   -80,   -80,   122,   -34,   -80,   -80,   -80,   -80,
+     220,   -80,   -80,   -80,   -80,   -80,   -80,   -80,    59,   -80,
+     -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   -80,   125,
+     -80,   -80,   -80,   -80,   -80,   183,   219,    22,   142,    -5,
+     147,   192,    69,   -54,   -79,   -80
 };
 
 /* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
@@ -715,62 +721,62 @@ static const yytype_int16 yypgoto[] =
 #define YYTABLE_NINF -82
 static const yytype_int16 yytable[] =
 {
-      46,    47,    43,    49,    79,    80,    52,   134,   135,     6,
-       7,     8,     9,    10,    11,    12,    13,    84,   144,    14,
-      15,    55,    56,    85,   118,    57,   126,   160,   132,   133,
-      58,   110,   161,     3,   123,    24,   123,    48,   -28,    88,
-     142,   -28,   -28,   -28,   -28,   -28,   -28,   -28,   -28,   -28,
-      89,    53,   -28,   -28,    90,   -28,    91,    92,    93,    94,
-      95,    96,   120,    97,   128,    88,    50,   159,    98,   -49,
-     -49,    51,   -49,   -49,   -49,   -49,    89,    54,   -49,   -49,
-      90,   105,   106,   107,   108,   152,   139,   113,    61,    97,
-     124,    62,   124,   131,   109,    63,    81,    82,    44,    45,
-     167,   149,   -30,    88,    72,   -30,   -30,   -30,   -30,   -30,
-     -30,   -30,   -30,   -30,    89,    74,   -30,   -30,    90,   -30,
-      91,    92,    93,    94,    95,    96,    75,    97,    55,    56,
-      -2,     4,    98,     5,     6,     7,     8,     9,    10,    11,
-      12,    13,    81,    82,    14,    15,    16,    17,    18,    19,
-      20,    21,    22,     7,     8,    23,    10,    11,    12,    13,
-      24,    76,    14,    15,    77,   -81,    88,   177,   -81,   -81,
-     -81,   -81,   -81,   -81,   -81,   -81,   -81,    78,    24,   -81,
-     -81,    90,   -81,   -81,   -81,   -81,   -81,   -81,   114,   117,
-      97,   125,    86,    88,    87,   122,   -72,   -72,   -72,   -72,
-     -72,   -72,   -72,   -72,   130,   136,   -72,   -72,    90,   153,
-     156,   157,   158,   116,   121,   137,   129,    97,   163,   143,
-     165,   138,   122,    72,    81,    82,    81,    82,   171,   166,
-      81,    82,   146,   147,   148,   151,   153,    82,   155,   162,
-     172,   164,   168,   169,   170,   174,   175,   176,    65,   112,
-     150,     0,     0,     0,     0,    83,     0,     0,    71
+      46,    47,     3,    49,    81,    82,    53,   136,   137,     6,
+       7,     8,     9,    10,    11,    12,    13,    43,   146,    14,
+      15,    86,    56,    57,    44,    45,    58,    87,    48,   134,
+     135,    59,   162,   112,    50,    24,   125,   163,   125,   -28,
+      90,   144,   -28,   -28,   -28,   -28,   -28,   -28,   -28,   -28,
+     -28,    91,    54,   -28,   -28,    92,   -28,    93,    94,    95,
+      96,    97,    98,    52,    99,    55,    90,   161,    62,   100,
+     -49,   -49,    63,   -49,   -49,   -49,   -49,    91,    64,   -49,
+     -49,    92,   107,   108,   109,   110,   154,    73,   141,   115,
+      99,    75,   126,    76,   126,   111,   133,    56,    57,    83,
+      84,   169,   140,   151,   -30,    90,    77,   -30,   -30,   -30,
+     -30,   -30,   -30,   -30,   -30,   -30,    91,    78,   -30,   -30,
+      92,   -30,    93,    94,    95,    96,    97,    98,   120,    99,
+     128,    79,    -2,     4,   100,     5,     6,     7,     8,     9,
+      10,    11,    12,    13,    83,    84,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,     7,     8,    23,    10,    11,
+      12,    13,    24,    80,    14,    15,    88,   -81,    90,   179,
+     -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,   -81,    89,
+      24,   -81,   -81,    92,   -81,   -81,   -81,   -81,   -81,   -81,
+     116,   119,    99,   127,   122,    90,   130,   124,   -72,   -72,
+     -72,   -72,   -72,   -72,   -72,   -72,   132,   138,   -72,   -72,
+      92,   155,   158,   159,   160,   118,   123,   139,   131,    99,
+     165,   145,   167,   148,   124,    73,    83,    84,    83,    84,
+     173,   168,    83,    84,   149,   150,   153,   155,    84,   157,
+     164,   174,   166,   170,   171,   172,   176,   177,   178,    66,
+     114,   152,    85,     0,     0,     0,     0,     0,     0,    72
 };
 
 static const yytype_int16 yycheck[] =
 {
-       5,     6,    30,     8,    57,    58,    11,    84,    85,     4,
-       5,     6,     7,     8,     9,    10,    11,    27,    95,    14,
-      15,    25,    26,    33,    68,    29,    70,    25,    81,    82,
-      34,    66,    30,     0,    69,    30,    71,    30,     0,     1,
-      93,     3,     4,     5,     6,     7,     8,     9,    10,    11,
-      12,    25,    14,    15,    16,    17,    18,    19,    20,    21,
-      22,    23,    68,    25,    70,     1,    30,   144,    30,     5,
-       6,    30,     8,     9,    10,    11,    12,    25,    14,    15,
-      16,    17,    18,    19,    20,   138,    91,    66,    30,    25,
-      69,     1,    71,    28,    30,     1,    31,    32,    25,    26,
-     153,   106,     0,     1,    30,     3,     4,     5,     6,     7,
-       8,     9,    10,    11,    12,    30,    14,    15,    16,    17,
-      18,    19,    20,    21,    22,    23,    30,    25,    25,    26,
-       0,     1,    30,     3,     4,     5,     6,     7,     8,     9,
-      10,    11,    31,    32,    14,    15,    16,    17,    18,    19,
-      20,    21,    22,     5,     6,    25,     8,     9,    10,    11,
-      30,    30,    14,    15,    30,     0,     1,   172,     3,     4,
-       5,     6,     7,     8,     9,    10,    11,    30,    30,    14,
-      15,    16,    17,    18,    19,    20,    21,    22,    67,    68,
-      25,    70,    30,     1,    30,    30,     4,     5,     6,     7,
-       8,     9,    10,    11,    30,    30,    14,    15,    16,    14,
-     141,   142,   143,    67,    68,    30,    70,    25,   149,    25,
-     151,    24,    30,    30,    31,    32,    31,    32,   159,    30,
-      31,    32,     1,    13,    30,    25,    14,    32,    30,    30,
-      33,    30,    30,    30,    30,    30,    30,    30,    29,    66,
-     107,    -1,    -1,    -1,    -1,    59,    -1,    -1,    40
+       5,     6,     0,     8,    58,    59,    11,    86,    87,     4,
+       5,     6,     7,     8,     9,    10,    11,    30,    97,    14,
+      15,    27,    25,    26,    25,    26,    29,    33,    30,    83,
+      84,    34,    25,    67,    25,    30,    70,    30,    72,     0,
+       1,    95,     3,     4,     5,     6,     7,     8,     9,    10,
+      11,    12,    25,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    30,    25,    25,     1,   146,    30,    30,
+       5,     6,     1,     8,     9,    10,    11,    12,     1,    14,
+      15,    16,    17,    18,    19,    20,   140,    30,    93,    67,
+      25,    30,    70,    30,    72,    30,    28,    25,    26,    31,
+      32,   155,    24,   108,     0,     1,    30,     3,     4,     5,
+       6,     7,     8,     9,    10,    11,    12,    30,    14,    15,
+      16,    17,    18,    19,    20,    21,    22,    23,    69,    25,
+      71,    30,     0,     1,    30,     3,     4,     5,     6,     7,
+       8,     9,    10,    11,    31,    32,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,     5,     6,    25,     8,     9,
+      10,    11,    30,    30,    14,    15,    30,     0,     1,   174,
+       3,     4,     5,     6,     7,     8,     9,    10,    11,    30,
+      30,    14,    15,    16,    17,    18,    19,    20,    21,    22,
+      68,    69,    25,    71,    69,     1,    71,    30,     4,     5,
+       6,     7,     8,     9,    10,    11,    30,    30,    14,    15,
+      16,    14,   143,   144,   145,    68,    69,    30,    71,    25,
+     151,    25,   153,     1,    30,    30,    31,    32,    31,    32,
+     161,    30,    31,    32,    13,    30,    25,    14,    32,    30,
+      30,    33,    30,    30,    30,    30,    30,    30,    30,    29,
+      67,   109,    60,    -1,    -1,    -1,    -1,    -1,    -1,    40
 };
 
 /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
@@ -782,19 +788,19 @@ static const yytype_uint8 yystos[] =
       20,    21,    22,    25,    30,    38,    39,    41,    42,    43,
       44,    50,    51,    53,    57,    59,    61,    62,    64,    66,
       67,    68,    75,    30,    25,    26,    74,    74,    30,    74,
-      30,    30,    74,    25,    25,    25,    26,    29,    34,    78,
-      79,    30,     1,     1,    45,    45,    54,    56,    60,    71,
-      65,    71,    30,    76,    30,    30,    30,    30,    30,    78,
-      78,    31,    32,    76,    27,    33,    30,    30,     1,    12,
-      16,    18,    19,    20,    21,    22,    23,    25,    30,    40,
-      46,    47,    69,    70,    72,    17,    18,    19,    20,    30,
-      40,    55,    70,    72,    39,    52,    75,    39,    53,    58,
-      64,    75,    30,    40,    72,    39,    53,    63,    64,    75,
-      30,    28,    78,    78,    79,    79,    30,    30,    24,    74,
-      73,    74,    78,    25,    79,    48,     1,    13,    30,    74,
-      73,    25,    78,    14,    77,    30,    77,    77,    77,    79,
-      25,    30,    30,    77,    30,    77,    30,    78,    30,    30,
-      30,    77,    33,    49,    30,    30,    30,    74
+      25,    80,    30,    74,    25,    25,    25,    26,    29,    34,
+      78,    79,    30,     1,     1,    45,    45,    54,    56,    60,
+      71,    65,    71,    30,    76,    30,    30,    30,    30,    30,
+      30,    78,    78,    31,    32,    76,    27,    33,    30,    30,
+       1,    12,    16,    18,    19,    20,    21,    22,    23,    25,
+      30,    40,    46,    47,    69,    70,    72,    17,    18,    19,
+      20,    30,    40,    55,    70,    72,    39,    52,    75,    39,
+      53,    58,    64,    75,    30,    40,    72,    39,    53,    63,
+      64,    75,    30,    28,    78,    78,    79,    79,    30,    30,
+      24,    74,    73,    74,    78,    25,    79,    48,     1,    13,
+      30,    74,    73,    25,    78,    14,    77,    30,    77,    77,
+      77,    79,    25,    30,    30,    77,    30,    77,    30,    78,
+      30,    30,    30,    77,    33,    49,    30,    30,    30,    74
 };
 
 #define yyerrok		(yyerrstatus = 0)
@@ -1781,8 +1787,8 @@ yyreduce:
   case 48:
 
     {
-	struct symbol *sym = sym_lookup(NULL, 0);
-	sym->flags |= SYMBOL_CHOICE;
+	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), SYMBOL_CHOICE);
+	sym->flags |= SYMBOL_AUTO;
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
@@ -2014,7 +2020,12 @@ yyreduce:
 
   case 108:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 1); free((yyvsp[(1) - (1)].string)); ;}
+    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); ;}
+    break;
+
+  case 109:
+
+    { (yyval.string) = NULL; ;}
     break;
 
 
diff --git a/package/config/zconf.y b/package/config/zconf.y
index 34c907b..62eee9c 100644
--- a/package/config/zconf.y
+++ b/package/config/zconf.y
@@ -91,7 +91,7 @@ static struct menu *current_menu, *current_entry;
 %type <id> end
 %type <id> option_name
 %type <menu> if_entry menu_entry choice_entry
-%type <string> symbol_option_arg
+%type <string> symbol_option_arg word_opt
 
 %destructor {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
@@ -239,10 +239,10 @@ symbol_option_arg:
 
 /* choice entry */
 
-choice: T_CHOICE T_EOL
+choice: T_CHOICE word_opt T_EOL
 {
-	struct symbol *sym = sym_lookup(NULL, 0);
-	sym->flags |= SYMBOL_CHOICE;
+	struct symbol *sym = sym_lookup($2, SYMBOL_CHOICE);
+	sym->flags |= SYMBOL_AUTO;
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
@@ -456,9 +456,12 @@ expr:	  symbol				{ $$ = expr_alloc_symbol($1); }
 ;
 
 symbol:	  T_WORD	{ $$ = sym_lookup($1, 0); free($1); }
-	| T_WORD_QUOTE	{ $$ = sym_lookup($1, 1); free($1); }
+	| T_WORD_QUOTE	{ $$ = sym_lookup($1, SYMBOL_CONST); free($1); }
 ;
 
+word_opt: /* empty */			{ $$ = NULL; }
+	| T_WORD
+
 %%
 
 void conf_parse(const char *name)
-- 
1.6.0.4
