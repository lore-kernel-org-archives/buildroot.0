From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:56 +0200
Subject: [Buildroot] [PATCH 04/11] Bump package/config to 2.6.36-rc1
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <52a142a6314905422f14f05fccafdce35bea7f08.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The goal is to be able to use savedefconfig to generate minimal
defconfig files.

Four of our patches are removed since the modifications have been
merged upstream. The new nconf configuration utility has appeared.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/config/.gitignore                          |   32 +-
 package/config/Makefile                            |   99 +-
 package/config/README.buildroot2                   |    2 +-
 package/config/conf.c                              |  222 ++--
 package/config/confdata.c                          |  349 +++--
 package/config/expr.c                              |   33 +-
 package/config/expr.h                              |    8 +-
 package/config/gconf.c                             |  137 +--
 package/config/gconf.glade                         |   30 +-
 package/config/kxgettext.c                         |    4 +-
 package/config/lex.zconf.c_shipped                 |   25 +-
 package/config/lkc.h                               |   19 +-
 package/config/lkc_proto.h                         |    7 +-
 package/config/lxdialog/.gitignore                 |    4 +
 package/config/lxdialog/checklist.c                |   10 +-
 package/config/lxdialog/inputbox.c                 |    4 +-
 package/config/lxdialog/menubox.c                  |   22 +-
 package/config/lxdialog/util.c                     |    2 +
 package/config/mconf.c                             |  118 +--
 package/config/menu.c                              |  137 ++-
 package/config/nconf.c                             | 1570 ++++++++++++++++++++
 package/config/nconf.gui.c                         |  617 ++++++++
 package/config/nconf.h                             |   95 ++
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  119 +-
 .../patches/03-change-config-option-prefix.patch   |  118 +-
 .../config/patches/04-fedora-13-build-fix.patch    |   17 -
 .../patches/05-really-clean-everything.patch       |   15 +-
 .../patches/06-br-build-system-integration.patch   |    8 +-
 .../config/patches/07-minor-makefile-fixes.patch   |   26 -
 .../patches/09-implement-kconfig-probability.patch |   25 +-
 .../config/patches/12-fix-glade-file-path.patch    |    8 +-
 .../patches/13-use-conf-write-autoconf.patch       |   26 +-
 .../patches/14-support-out-of-tree-config.patch    |  158 +--
 package/config/patches/15-misc-qconf-changes.patch |  175 ---
 .../config/patches/16-non-identified-changes.patch |   47 -
 package/config/patches/series                      |    4 -
 package/config/qconf.cc                            |  119 +-
 package/config/qconf.h                             |   17 +-
 package/config/streamline_config.pl                |  422 ++++++
 package/config/symbol.c                            |  328 ++++-
 package/config/util.c                              |    4 +-
 package/config/zconf.gperf                         |    2 +
 package/config/zconf.hash.c_shipped                |    2 +
 package/config/zconf.l                             |    6 +-
 package/config/zconf.tab.c_shipped                 |  404 +++---
 package/config/zconf.y                             |   38 +-
 46 files changed, 4298 insertions(+), 1336 deletions(-)
 create mode 100644 package/config/lxdialog/.gitignore
 create mode 100644 package/config/nconf.c
 create mode 100644 package/config/nconf.gui.c
 create mode 100644 package/config/nconf.h
 delete mode 100644 package/config/patches/04-fedora-13-build-fix.patch
 delete mode 100644 package/config/patches/07-minor-makefile-fixes.patch
 delete mode 100644 package/config/patches/15-misc-qconf-changes.patch
 delete mode 100644 package/config/patches/16-non-identified-changes.patch
 create mode 100644 package/config/streamline_config.pl

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 1ea18a2..624f650 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -1,9 +1,23 @@
-/conf
-/mconf
-/qconf
-/qconf.moc
-/.tmp_qtcheck
-/lkc_defs.h
-/lex.zconf.c
-/zconf.hash.c
-/zconf.tab.c
+#
+# Generated files
+#
+config*
+lex.*.c
+*.tab.c
+*.tab.h
+zconf.hash.c
+*.moc
+lkc_defs.h
+gconf.glade.h
+*.pot
+*.mo
+
+#
+# configuration programs
+#
+conf
+mconf
+nconf
+qconf
+gconf
+kxgettext
diff --git a/package/config/Makefile b/package/config/Makefile
index f269348..7e199bc 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -2,7 +2,8 @@
 # Kernel configuration targets
 # These targets are used from top-level makefile
 
-PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config
+PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config \
+	localmodconfig localyesconfig
 
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
@@ -20,13 +21,56 @@ menuconfig: $(obj)/mconf
 	$< $(Kconfig)
 
 config: $(obj)/conf
+	$< --oldaskconfig $(Kconfig)
+
+nconfig: $(obj)/nconf
 	$< $(Kconfig)
 
 oldconfig: $(obj)/conf
-	$< -o $(Kconfig)
+	$< --$@ $(Kconfig)
 
 silentoldconfig: $(obj)/conf
-	$< -s $(Kconfig)
+	$(Q)mkdir -p include/generated
+	$< --$@ $(Kconfig)
+
+# if no path is given, then use src directory to find file
+ifdef LSMOD
+LSMOD_F := $(LSMOD)
+ifeq ($(findstring /,$(LSMOD)),)
+  LSMOD_F := $(objtree)/$(LSMOD)
+endif
+endif
+
+localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
+	$(Q)mkdir -p include/generated
+	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
+	$(Q)if [ -f .config ]; then 					\
+			cmp -s .tmp.config .config ||			\
+			(mv -f .config .config.old.1;			\
+			 mv -f .tmp.config .config;			\
+			 $(obj)/conf --silentoldconfig $(Kconfig);	\
+			 mv -f .config.old.1 .config.old)		\
+	else								\
+			mv -f .tmp.config .config;			\
+			$(obj)/conf --silentoldconfig $(Kconfig);	\
+	fi
+	$(Q)rm -f .tmp.config
+
+localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
+	$(Q)mkdir -p include/generated
+	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
+	$(Q)sed -i s/=m/=y/ .tmp.config
+	$(Q)if [ -f .config ]; then					\
+			cmp -s .tmp.config .config ||			\
+			(mv -f .config .config.old.1;			\
+			 mv -f .tmp.config .config;			\
+			 $(obj)/conf --silentoldconfig $(Kconfig);	\
+			 mv -f .config.old.1 .config.old)		\
+	else								\
+			mv -f .tmp.config .config;			\
+			$(obj)/conf --silentoldconfig $(Kconfig);	\
+	fi
+	$(Q)rm -f .tmp.config
 
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
@@ -51,44 +95,50 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)rm -f arch/um/Kconfig.arch
 	$(Q)rm -f $(obj)/config.pot
 
-PHONY += randconfig allyesconfig allnoconfig allmodconfig defconfig
+PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
 
-randconfig: $(obj)/conf
-	$< -r $(Kconfig)
+allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
+	$< --$@ $(Kconfig)
 
-allyesconfig: $(obj)/conf
-	$< -y $(Kconfig)
+PHONY += listnewconfig oldnoconfig savedefconfig defconfig
 
-allnoconfig: $(obj)/conf
-	$< -n $(Kconfig)
+listnewconfig oldnoconfig: $(obj)/conf
+	$< --$@ $(Kconfig)
 
-allmodconfig: $(obj)/conf
-	$< -m $(Kconfig)
+savedefconfig: $(obj)/conf
+	$< --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
-	$< -d $(Kconfig)
+	$< --defconfig $(Kconfig)
 else
 	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
-	$(Q)$< -D arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 endif
 
 %_defconfig: $(obj)/conf
-	$(Q)$< -D arch/$(SRCARCH)/configs/$@ $(Kconfig)
+	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
 # Help text used by make help
 help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
+	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
+	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
+	@echo  '  localyesconfig  - Update current config converting local mods to core'
 	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
-	@echo  '  randconfig	  - New config with random answer to all options'
-	@echo  '  defconfig	  - New config with default answer to all options'
-	@echo  '  allmodconfig	  - New config selecting modules when possible'
-	@echo  '  allyesconfig	  - New config where all options are accepted with yes'
+	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
+	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
 	@echo  '  allnoconfig	  - New config where all options are answered with no'
+	@echo  '  allyesconfig	  - New config where all options are accepted with yes'
+	@echo  '  allmodconfig	  - New config selecting modules when possible'
+	@echo  '  alldefconfig    - New config with all symbols set to default'
+	@echo  '  randconfig	  - New config with random answer to all options'
+	@echo  '  listnewconfig   - List new options'
+	@echo  '  oldnoconfig     - Same as silentoldconfig but set new symbols to n (unset)'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
@@ -104,6 +154,8 @@ HOST_EXTRACFLAGS += -DLOCALE
 # ===========================================================================
 # Shared Makefile for the various kconfig executables:
 # conf:	  Used for defconfig, oldconfig and related targets
+# nconf:  Used for the nconfig target.
+#         Utilizes ncurses
 # mconf:  Used for the menuconfig target
 #         Utilizes the lxdialog package
 # qconf:  Used for the xconfig target
@@ -116,11 +168,16 @@ lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
 lxdialog += lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
 
 conf-objs	:= conf.o  zconf.tab.o
-mconf-objs	:= mconf.o zconf.tab.o $(lxdialog)
+mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
+nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
 
 hostprogs-y := conf qconf gconf kxgettext
 
+ifeq ($(MAKECMDGOALS),nconfig)
+	hostprogs-y += nconf
+endif
+
 ifeq ($(MAKECMDGOALS),menuconfig)
 	hostprogs-y += mconf
 endif
@@ -156,6 +213,7 @@ clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
 clean-files += config.pot linux.pot
 clean-files += conf $(conf-objs)
 clean-files += mconf $(mconf-objs)
+clean-files += nconf $(nconf-objs)
 clean-files += qconf qconf.o
 clean-files += gconf gconf.o
 clean-files += kconfig_load.o zconf.tab.o
@@ -183,6 +241,7 @@ HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
                           -D LKC_DIRECT_LINK
 
+HOSTLOADLIBES_nconf	= -lmenu -lpanel -lncurses
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
 ifeq ($(qconf-target),1)
diff --git a/package/config/README.buildroot2 b/package/config/README.buildroot2
index 22c50fe..8ff0d09 100644
--- a/package/config/README.buildroot2
+++ b/package/config/README.buildroot2
@@ -1,4 +1,4 @@
-This is a copy of the kconfig code in the kernel (currently 2.6.30) tweaked
+This is a copy of the kconfig code in the kernel (currently 2.6.36-rc1) tweaked
 to suit Buildroot.
 
 To update:
diff --git a/package/config/conf.c b/package/config/conf.c
index 2485dcd..2449ca0 100644
--- a/package/config/conf.c
+++ b/package/config/conf.c
@@ -10,6 +10,7 @@
 #include <string.h>
 #include <time.h>
 #include <unistd.h>
+#include <getopt.h>
 #include <sys/stat.h>
 #include <sys/time.h>
 
@@ -19,16 +20,21 @@
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
 
-enum {
-	ask_all,
-	ask_new,
-	ask_silent,
-	set_default,
-	set_yes,
-	set_mod,
-	set_no,
-	set_random
-} input_mode = ask_all;
+enum input_mode {
+	oldaskconfig,
+	silentoldconfig,
+	oldconfig,
+	allnoconfig,
+	allyesconfig,
+	allmodconfig,
+	alldefconfig,
+	randconfig,
+	defconfig,
+	savedefconfig,
+	listnewconfig,
+	oldnoconfig,
+} input_mode = oldaskconfig;
+
 char *defconfig_file;
 
 static int indent = 1;
@@ -38,14 +44,14 @@ static int conf_cnt;
 static char line[128];
 static struct menu *rootEntry;
 
-static char nohelp_text[] = N_("Sorry, no help available for this option yet.\n");
-
-static const char *get_help(struct menu *menu)
+static void print_help(struct menu *menu)
 {
-	if (menu_has_help(menu))
-		return _(menu_get_help(menu));
-	else
-		return nohelp_text;
+	struct gstr help = str_new();
+
+	menu_get_ext_help(menu, &help);
+
+	printf("\n%s\n", str_get(&help));
+	str_free(&help);
 }
 
 static void strip(char *str)
@@ -93,16 +99,16 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	}
 
 	switch (input_mode) {
-	case ask_new:
-	case ask_silent:
+	case oldconfig:
+	case silentoldconfig:
 		if (sym_has_value(sym)) {
 			printf("%s\n", def);
 			return 0;
 		}
 		check_stdin();
-	case ask_all:
+	case oldaskconfig:
 		fflush(stdout);
-		fgets(line, 128, stdin);
+		xfgets(line, 128, stdin);
 		return 1;
 	default:
 		break;
@@ -121,7 +127,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	return 1;
 }
 
-int conf_string(struct menu *menu)
+static int conf_string(struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
 	const char *def;
@@ -140,7 +146,7 @@ int conf_string(struct menu *menu)
 		case '?':
 			/* print help */
 			if (line[1] == '\n') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				def = NULL;
 				break;
 			}
@@ -156,14 +162,12 @@ int conf_string(struct menu *menu)
 static int conf_sym(struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
-	int type;
 	tristate oldval, newval;
 
 	while (1) {
 		printf("%*s%s ", indent - 1, "", _(menu->prompt->text));
 		if (sym->name)
 			printf("(%s) ", sym->name);
-		type = sym_get_type(sym);
 		putchar('[');
 		oldval = sym_get_tristate_value(sym);
 		switch (oldval) {
@@ -220,7 +224,7 @@ static int conf_sym(struct menu *menu)
 		if (sym_set_tristate_value(sym, newval))
 			return 0;
 help:
-		printf("\n%s\n", get_help(menu));
+		print_help(menu);
 	}
 }
 
@@ -228,11 +232,9 @@ static int conf_choice(struct menu *menu)
 {
 	struct symbol *sym, *def_sym;
 	struct menu *child;
-	int type;
 	bool is_new;
 
 	sym = menu->sym;
-	type = sym_get_type(sym);
 	is_new = !sym_has_value(sym);
 	if (sym_is_changable(sym)) {
 		conf_sym(menu);
@@ -294,20 +296,20 @@ static int conf_choice(struct menu *menu)
 			printf("?");
 		printf("]: ");
 		switch (input_mode) {
-		case ask_new:
-		case ask_silent:
+		case oldconfig:
+		case silentoldconfig:
 			if (!is_new) {
 				cnt = def;
 				printf("%d\n", cnt);
 				break;
 			}
 			check_stdin();
-		case ask_all:
+		case oldaskconfig:
 			fflush(stdout);
-			fgets(line, 128, stdin);
+			xfgets(line, 128, stdin);
 			strip(line);
 			if (line[0] == '?') {
-				printf("\n%s\n", get_help(menu));
+				print_help(menu);
 				continue;
 			}
 			if (!line[0])
@@ -331,7 +333,7 @@ static int conf_choice(struct menu *menu)
 		if (!child)
 			continue;
 		if (line[strlen(line) - 1] == '?') {
-			printf("\n%s\n", get_help(child));
+			print_help(child);
 			continue;
 		}
 		sym_set_choice_value(sym, child->sym);
@@ -360,7 +362,10 @@ static void conf(struct menu *menu)
 
 		switch (prop->type) {
 		case P_MENU:
-			if (input_mode == ask_silent && rootEntry != menu) {
+			if ((input_mode == silentoldconfig ||
+			     input_mode == listnewconfig ||
+			     input_mode == oldnoconfig) &&
+			    rootEntry != menu) {
 				check_conf(menu);
 				return;
 			}
@@ -418,10 +423,16 @@ static void check_conf(struct menu *menu)
 	if (sym && !sym_has_value(sym)) {
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
-			if (!conf_cnt++)
-				printf(_("*\n* Restart config...\n*\n"));
-			rootEntry = menu_get_parent_menu(menu);
-			conf(rootEntry);
+			if (input_mode == listnewconfig) {
+				if (sym->name && !sym_is_choice_value(sym)) {
+					printf("CONFIG_%s\n", sym->name);
+				}
+			} else {
+				if (!conf_cnt++)
+					printf(_("*\n* Restart config...\n*\n"));
+				rootEntry = menu_get_parent_menu(menu);
+				conf(rootEntry);
+			}
 		}
 	}
 
@@ -429,6 +440,22 @@ static void check_conf(struct menu *menu)
 		check_conf(child);
 }
 
+static struct option long_opts[] = {
+	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
+	{"oldconfig",       no_argument,       NULL, oldconfig},
+	{"silentoldconfig", no_argument,       NULL, silentoldconfig},
+	{"defconfig",       optional_argument, NULL, defconfig},
+	{"savedefconfig",   required_argument, NULL, savedefconfig},
+	{"allnoconfig",     no_argument,       NULL, allnoconfig},
+	{"allyesconfig",    no_argument,       NULL, allyesconfig},
+	{"allmodconfig",    no_argument,       NULL, allmodconfig},
+	{"alldefconfig",    no_argument,       NULL, alldefconfig},
+	{"randconfig",      no_argument,       NULL, randconfig},
+	{"listnewconfig",   no_argument,       NULL, listnewconfig},
+	{"oldnoconfig",     no_argument,       NULL, oldnoconfig},
+	{NULL, 0, NULL, 0}
+};
+
 int main(int ac, char **av)
 {
 	int opt;
@@ -439,32 +466,17 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
-	while ((opt = getopt(ac, av, "osdD:nmyrh")) != -1) {
+	while ((opt = getopt_long_only(ac, av, "", long_opts, NULL)) != -1) {
+		input_mode = (enum input_mode)opt;
 		switch (opt) {
-		case 'o':
-			input_mode = ask_silent;
-			break;
-		case 's':
-			input_mode = ask_silent;
+		case silentoldconfig:
 			sync_kconfig = 1;
 			break;
-		case 'd':
-			input_mode = set_default;
-			break;
-		case 'D':
-			input_mode = set_default;
+		case defconfig:
+		case savedefconfig:
 			defconfig_file = optarg;
 			break;
-		case 'n':
-			input_mode = set_no;
-			break;
-		case 'm':
-			input_mode = set_mod;
-			break;
-		case 'y':
-			input_mode = set_yes;
-			break;
-		case 'r':
+		case randconfig:
 		{
 			struct timeval now;
 			unsigned int seed;
@@ -477,17 +489,12 @@ int main(int ac, char **av)
 
 			seed = (unsigned int)((now.tv_sec + 1) * (now.tv_usec + 1));
 			srand(seed);
-
-			input_mode = set_random;
 			break;
 		}
-		case 'h':
-			printf(_("See README for usage info\n"));
-			exit(0);
-			break;
-		default:
+		case '?':
 			fprintf(stderr, _("See README for usage info\n"));
 			exit(1);
+			break;
 		}
 	}
 	if (ac == optind) {
@@ -500,7 +507,7 @@ int main(int ac, char **av)
 		name = conf_get_configname();
 		if (stat(name, &tmpstat)) {
 			fprintf(stderr, _("***\n"
-				"*** You have not yet configured Buildroot!\n"
+				"*** You have not yet configured your Buildroot!\n"
 				"*** (missing .config file \"%s\")\n"
 				"***\n"
 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
@@ -511,7 +518,7 @@ int main(int ac, char **av)
 	}
 
 	switch (input_mode) {
-	case set_default:
+	case defconfig:
 		if (!defconfig_file)
 			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
@@ -521,25 +528,32 @@ int main(int ac, char **av)
 			exit(1);
 		}
 		break;
-	case ask_silent:
-	case ask_all:
-	case ask_new:
+	case savedefconfig:
+		conf_read(NULL);
+		break;
+	case silentoldconfig:
+	case oldaskconfig:
+	case oldconfig:
+	case listnewconfig:
+	case oldnoconfig:
 		conf_read(NULL);
 		break;
-	case set_no:
-	case set_mod:
-	case set_yes:
-	case set_random:
+	case allnoconfig:
+	case allyesconfig:
+	case allmodconfig:
+	case alldefconfig:
+	case randconfig:
 		name = getenv("KCONFIG_ALLCONFIG");
 		if (name && !stat(name, &tmpstat)) {
 			conf_read_simple(name, S_DEF_USER);
 			break;
 		}
 		switch (input_mode) {
-		case set_no:	 name = "allno.config"; break;
-		case set_mod:	 name = "allmod.config"; break;
-		case set_yes:	 name = "allyes.config"; break;
-		case set_random: name = "allrandom.config"; break;
+		case allnoconfig:	name = "allno.config"; break;
+		case allyesconfig:	name = "allyes.config"; break;
+		case allmodconfig:	name = "allmod.config"; break;
+		case alldefconfig:	name = "alldef.config"; break;
+		case randconfig:	name = "allrandom.config"; break;
 		default: break;
 		}
 		if (!stat(name, &tmpstat))
@@ -564,33 +578,42 @@ int main(int ac, char **av)
 	}
 
 	switch (input_mode) {
-	case set_no:
+	case allnoconfig:
 		conf_set_all_new_symbols(def_no);
 		break;
-	case set_yes:
+	case allyesconfig:
 		conf_set_all_new_symbols(def_yes);
 		break;
-	case set_mod:
+	case allmodconfig:
 		conf_set_all_new_symbols(def_mod);
 		break;
-	case set_random:
+	case alldefconfig:
+		conf_set_all_new_symbols(def_default);
+		break;
+	case randconfig:
 		conf_set_all_new_symbols(def_random);
 		break;
-	case set_default:
+	case defconfig:
 		conf_set_all_new_symbols(def_default);
 		break;
-	case ask_new:
-	case ask_all:
+	case savedefconfig:
+		break;
+	case oldaskconfig:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
-		input_mode = ask_silent;
+		input_mode = silentoldconfig;
 		/* fall through */
-	case ask_silent:
+	case oldconfig:
+	case listnewconfig:
+	case oldnoconfig:
+	case silentoldconfig:
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
 			check_conf(&rootmenu);
-		} while (conf_cnt);
+		} while (conf_cnt &&
+			 (input_mode != listnewconfig &&
+			  input_mode != oldnoconfig));
 		break;
 	}
 
@@ -606,7 +629,13 @@ int main(int ac, char **av)
 			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
 			return 1;
 		}
-	} else {
+	} else if (input_mode == savedefconfig) {
+		if (conf_write_defconfig(defconfig_file)) {
+			fprintf(stderr, _("n*** Error while saving defconfig to: %s\n\n"),
+			        defconfig_file);
+			return 1;
+		}
+	} else if (input_mode != listnewconfig) {
 		if (conf_write(NULL)) {
 			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
 			exit(1);
@@ -618,3 +647,14 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
+/*
+ * Helper function to facilitate fgets() by Jean Sacren.
+ */
+void xfgets(str, size, in)
+	char *str;
+	int size;
+	FILE *in;
+{
+	if (fgets(str, size, in) == NULL)
+		fprintf(stderr, "\nError in reading or end of file.\n");
+}
diff --git a/package/config/confdata.c b/package/config/confdata.c
index 3842470..ba1f8a7 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -169,8 +169,11 @@ int conf_read_simple(const char *name, int def)
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list)
+		if (!sym_defconfig_list) {
+			if (modules_sym)
+				sym_calc_value(modules_sym);
 			return 1;
+		}
 
 		for_all_defaults(sym_defconfig_list, prop) {
 			if (expr_calc_value(prop->visible.expr) == no ||
@@ -391,15 +394,148 @@ int conf_read(const char *name)
 	return 0;
 }
 
+/* Write a S_STRING */
+static void conf_write_string(bool headerfile, const char *name,
+                              const char *str, FILE *out)
+{
+	int l;
+	if (headerfile)
+		fprintf(out, "#define %s \"", name);
+	else
+		fprintf(out, "%s=\"", name);
+
+	while (1) {
+		l = strcspn(str, "\"\\");
+		if (l) {
+			xfwrite(str, l, 1, out);
+			str += l;
+		}
+		if (!*str)
+			break;
+		fprintf(out, "\\%c", *str++);
+	}
+	fputs("\"\n", out);
+}
+
+static void conf_write_symbol(struct symbol *sym, enum symbol_type type,
+                              FILE *out, bool write_no)
+{
+	const char *str;
+
+	switch (type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		switch (sym_get_tristate_value(sym)) {
+		case no:
+			if (write_no)
+				fprintf(out, "# %s is not set\n", sym->name);
+			break;
+		case mod:
+			fprintf(out, "%s=m\n", sym->name);
+			break;
+		case yes:
+			fprintf(out, "%s=y\n", sym->name);
+			break;
+		}
+		break;
+	case S_STRING:
+		conf_write_string(false, sym->name, sym_get_string_value(sym), out);
+		break;
+	case S_HEX:
+	case S_INT:
+		str = sym_get_string_value(sym);
+		fprintf(out, "%s=%s\n", sym->name, str);
+		break;
+	case S_OTHER:
+	case S_UNKNOWN:
+		break;
+	}
+}
+
+/*
+ * Write out a minimal config.
+ * All values that has default values are skipped as this is redundant.
+ */
+int conf_write_defconfig(const char *filename)
+{
+	struct symbol *sym;
+	struct menu *menu;
+	FILE *out;
+
+	out = fopen(filename, "w");
+	if (!out)
+		return 1;
+
+	sym_clear_all_valid();
+
+	/* Traverse all menus to find all relevant symbols */
+	menu = rootmenu.list;
+
+	while (menu != NULL)
+	{
+		sym = menu->sym;
+		if (sym == NULL) {
+			if (!menu_is_visible(menu))
+				goto next_menu;
+		} else if (!sym_is_choice(sym)) {
+			sym_calc_value(sym);
+			if (!(sym->flags & SYMBOL_WRITE))
+				goto next_menu;
+			sym->flags &= ~SYMBOL_WRITE;
+			/* If we cannot change the symbol - skip */
+			if (!sym_is_changable(sym))
+				goto next_menu;
+			/* If symbol equals to default value - skip */
+			if (strcmp(sym_get_string_value(sym), sym_get_string_default(sym)) == 0)
+				goto next_menu;
+
+			/*
+			 * If symbol is a choice value and equals to the
+			 * default for a choice - skip.
+			 * But only if value is bool and equal to "y" .
+			 */
+			if (sym_is_choice_value(sym)) {
+				struct symbol *cs;
+				struct symbol *ds;
+
+				cs = prop_get_symbol(sym_get_choice_prop(sym));
+				ds = sym_choice_default(cs);
+				if (sym == ds) {
+					if ((sym->type == S_BOOLEAN) &&
+					    sym_get_tristate_value(sym) == yes)
+						goto next_menu;
+				}
+			}
+			conf_write_symbol(sym, sym->type, out, true);
+		}
+next_menu:
+		if (menu->list != NULL) {
+			menu = menu->list;
+		}
+		else if (menu->next != NULL) {
+			menu = menu->next;
+		} else {
+			while ((menu = menu->parent)) {
+				if (menu->next != NULL) {
+					menu = menu->next;
+					break;
+				}
+			}
+		}
+	}
+	fclose(out);
+	return 0;
+}
+
 int conf_write(const char *name)
 {
 	FILE *out;
 	struct symbol *sym;
 	struct menu *menu;
 	const char *basename;
-	char dirname[128], tmpname[128], newname[128];
-	int type, l;
 	const char *str;
+	char dirname[128], tmpname[128], newname[128];
+	enum symbol_type type;
 	time_t now;
 	int use_timestamp = 1;
 	char *env;
@@ -480,50 +616,11 @@ int conf_write(const char *name)
 				if (modules_sym->curr.tri == no)
 					type = S_BOOLEAN;
 			}
-			switch (type) {
-			case S_BOOLEAN:
-			case S_TRISTATE:
-				switch (sym_get_tristate_value(sym)) {
-				case no:
-					fprintf(out, "# %s is not set\n", sym->name);
-					break;
-				case mod:
-					fprintf(out, "%s=m\n", sym->name);
-					break;
-				case yes:
-					fprintf(out, "%s=y\n", sym->name);
-					break;
-				}
-				break;
-			case S_STRING:
-				str = sym_get_string_value(sym);
-				fprintf(out, "%s=\"", sym->name);
-				while (1) {
-					l = strcspn(str, "\"\\");
-					if (l) {
-						fwrite(str, l, 1, out);
-						str += l;
-					}
-					if (!*str)
-						break;
-					fprintf(out, "\\%c", *str++);
-				}
-				fputs("\"\n", out);
-				break;
-			case S_HEX:
-				str = sym_get_string_value(sym);
-				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-					fprintf(out, "%s=%s\n", sym->name, str);
-					break;
-				}
-			case S_INT:
-				str = sym_get_string_value(sym);
-				fprintf(out, "%s=%s\n", sym->name, str);
-				break;
-			}
+			/* Write config symbol to file */
+			conf_write_symbol(sym, type, out, true);
 		}
 
-	next:
+next:
 		if (menu->list) {
 			menu = menu->list;
 			continue;
@@ -556,7 +653,7 @@ int conf_write(const char *name)
 	return 0;
 }
 
-int conf_split_config(void)
+static int conf_split_config(void)
 {
 	const char *name;
 	char path[128];
@@ -572,7 +669,7 @@ int conf_split_config(void)
 	opwd = malloc(256);
 	_name = strdup(name);
 	if (opwd == NULL || _name == NULL)
-		return 1;
+ 		return 1;
 	opwd = getcwd(opwd, 256);
 	dir = dirname(_name);
 	if (dir == NULL) {
@@ -688,9 +785,9 @@ int conf_write_autoconf(void)
 	struct symbol *sym;
 	const char *str;
 	const char *name;
-	FILE *out, *out_h;
+	FILE *out, *tristate, *out_h;
 	time_t now;
-	int i, l;
+	int i;
 	char dir[PATH_MAX+1], buf[PATH_MAX+1];
 	char *s;
 
@@ -714,10 +811,18 @@ int conf_write_autoconf(void)
 	if (!out)
 		return 1;
 
+	sprintf(buf, "%s.tmpconfig_tristate", dir);
+	tristate = fopen(buf, "w");
+	if (!tristate) {
+		fclose(out);
+		return 1;
+	}
+
 	sprintf(buf, "%s.tmpconfig.h", dir);
 	out_h = fopen(buf, "w");
 	if (!out_h) {
 		fclose(out);
+		fclose(tristate);
 		return 1;
 	}
 
@@ -729,6 +834,9 @@ int conf_write_autoconf(void)
 		     "# %s"
 		     "#\n",
 		     ctime(&now));
+	fprintf(tristate, "#\n"
+			  "# Automatically generated - do not edit\n"
+			  "\n");
 	fprintf(out_h, "/*\n"
 		       " * Automatically generated C config: don't edit\n"
 		       " * %s"
@@ -739,6 +847,11 @@ int conf_write_autoconf(void)
 		sym_calc_value(sym);
 		if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
 			continue;
+
+		/* write symbol to config file */
+		conf_write_symbol(sym, sym->type, out, false);
+
+		/* update autoconf and tristate files */
 		switch (sym->type) {
 		case S_BOOLEAN:
 		case S_TRISTATE:
@@ -746,45 +859,28 @@ int conf_write_autoconf(void)
 			case no:
 				break;
 			case mod:
-				fprintf(out, "%s=m\n", sym->name);
+				fprintf(tristate, "%s=M\n", sym->name);
 				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
 				break;
 			case yes:
-				fprintf(out, "%s=y\n", sym->name);
+				if (sym->type == S_TRISTATE)
+					fprintf(tristate, "%s=Y\n",
+							sym->name);
 				fprintf(out_h, "#define %s 1\n", sym->name);
 				break;
 			}
 			break;
 		case S_STRING:
-			str = sym_get_string_value(sym);
-			fprintf(out, "%s=\"", sym->name);
-			fprintf(out_h, "#define %s \"", sym->name);
-			while (1) {
-				l = strcspn(str, "\"\\");
-				if (l) {
-					fwrite(str, l, 1, out);
-					fwrite(str, l, 1, out_h);
-					str += l;
-				}
-				if (!*str)
-					break;
-				fprintf(out, "\\%c", *str);
-				fprintf(out_h, "\\%c", *str);
-				str++;
-			}
-			fputs("\"\n", out);
-			fputs("\"\n", out_h);
+			conf_write_string(true, sym->name, sym_get_string_value(sym), out_h);
 			break;
 		case S_HEX:
 			str = sym_get_string_value(sym);
 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-				fprintf(out, "%s=%s\n", sym->name, str);
 				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
 				break;
 			}
 		case S_INT:
 			str = sym_get_string_value(sym);
-			fprintf(out, "%s=%s\n", sym->name, str);
 			fprintf(out_h, "#define %s %s\n", sym->name, str);
 			break;
 		default:
@@ -792,14 +888,21 @@ int conf_write_autoconf(void)
 		}
 	}
 	fclose(out);
+	fclose(tristate);
 	fclose(out_h);
 
 	name = getenv("KCONFIG_AUTOHEADER");
 	if (!name)
-		name = "include/linux/autoconf.h";
+		name = "include/generated/autoconf.h";
 	sprintf(buf, "%s.tmpconfig.h", dir);
 	if (rename(buf, name))
 		return 1;
+	name = getenv("KCONFIG_TRISTATE");
+	if (!name)
+		name = "include/config/tristate.conf";
+	sprintf(buf, "%s.tmpconfig_tristate", dir);
+	if (rename(buf, name))
+		return 1;
 	name = conf_get_autoconfig_name();
 	/*
 	 * This must be the last step, kbuild has a dependency on auto.conf
@@ -839,13 +942,73 @@ void conf_set_changed_callback(void (*fn)(void))
 	conf_changed_callback = fn;
 }
 
+static void randomize_choice_values(struct symbol *csym)
+{
+	struct property *prop;
+	struct symbol *sym;
+	struct expr *e;
+	int cnt, def;
 
-void conf_set_all_new_symbols(enum conf_def_mode mode)
+	/*
+	 * If choice is mod then we may have more items slected
+	 * and if no then no-one.
+	 * In both cases stop.
+	 */
+	if (csym->curr.tri != yes)
+		return;
+
+	prop = sym_get_choice_prop(csym);
+
+	/* count entries in choice block */
+	cnt = 0;
+	expr_list_for_each_sym(prop->expr, e, sym)
+		cnt++;
+
+	/*
+	 * find a random value and set it to yes,
+	 * set the rest to no so we have only one set
+	 */
+	def = (rand() % cnt);
+
+	cnt = 0;
+	expr_list_for_each_sym(prop->expr, e, sym) {
+		if (def == cnt++) {
+			sym->def[S_DEF_USER].tri = yes;
+			csym->def[S_DEF_USER].val = sym;
+		}
+		else {
+			sym->def[S_DEF_USER].tri = no;
+		}
+	}
+	csym->flags |= SYMBOL_DEF_USER;
+	/* clear VALID to get value calculated */
+	csym->flags &= ~(SYMBOL_VALID);
+}
+
+static void set_all_choice_values(struct symbol *csym)
 {
-	struct symbol *sym, *csym;
 	struct property *prop;
+	struct symbol *sym;
 	struct expr *e;
-	int i, cnt, def, prob = 50;
+
+	prop = sym_get_choice_prop(csym);
+
+	/*
+	 * Set all non-assinged choice values to no
+	 */
+	expr_list_for_each_sym(prop->expr, e, sym) {
+		if (!sym_has_value(sym))
+			sym->def[S_DEF_USER].tri = no;
+	}
+	csym->flags |= SYMBOL_DEF_USER;
+	/* clear VALID to get value calculated */
+	csym->flags &= ~(SYMBOL_VALID);
+}
+
+void conf_set_all_new_symbols(enum conf_def_mode mode)
+{
+	struct symbol *sym, *csym;
+	int i, cnt, prob = 50;
 
 	if (mode == def_random) {
 		char *endp, *env = getenv("KCONFIG_PROBABILITY");
@@ -897,8 +1060,6 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 
 	sym_clear_all_valid();
 
-	if (mode != def_random)
-		return;
 	/*
 	 * We have different type of choice blocks.
 	 * If curr.tri equal to mod then we can select several
@@ -913,35 +1074,9 @@ void conf_set_all_new_symbols(enum conf_def_mode mode)
 			continue;
 
 		sym_calc_value(csym);
-
-		if (csym->curr.tri != yes)
-			continue;
-
-		prop = sym_get_choice_prop(csym);
-
-		/* count entries in choice block */
-		cnt = 0;
-		expr_list_for_each_sym(prop->expr, e, sym)
-			cnt++;
-
-		/*
-		 * find a random value and set it to yes,
-		 * set the rest to no so we have only one set
-		 */
-		def = (rand() % cnt);
-
-		cnt = 0;
-		expr_list_for_each_sym(prop->expr, e, sym) {
-			if (def == cnt++) {
-				sym->def[S_DEF_USER].tri = yes;
-				csym->def[S_DEF_USER].val = sym;
-			}
-			else {
-				sym->def[S_DEF_USER].tri = no;
-			}
-		}
-		csym->flags |= SYMBOL_DEF_USER;
-		/* clear VALID to get value calculated */
-		csym->flags &= ~(SYMBOL_VALID);
+		if (mode == def_random)
+			randomize_choice_values(csym);
+		else
+			set_all_choice_values(csym);
 	}
 }
diff --git a/package/config/expr.c b/package/config/expr.c
index 392c7e9..88aace9 100644
--- a/package/config/expr.c
+++ b/package/config/expr.c
@@ -348,7 +348,7 @@ struct expr *expr_trans_bool(struct expr *e)
 /*
  * e1 || e2 -> ?
  */
-struct expr *expr_join_or(struct expr *e1, struct expr *e2)
+static struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 {
 	struct expr *tmp;
 	struct symbol *sym1, *sym2;
@@ -412,7 +412,7 @@ struct expr *expr_join_or(struct expr *e1, struct expr *e2)
 	return NULL;
 }
 
-struct expr *expr_join_and(struct expr *e1, struct expr *e2)
+static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 {
 	struct expr *tmp;
 	struct symbol *sym1, *sym2;
@@ -1087,7 +1087,7 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 
 static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
 {
-	fwrite(str, strlen(str), 1, data);
+	xfwrite(str, strlen(str), 1, data);
 }
 
 void expr_fprint(struct expr *e, FILE *out)
@@ -1097,7 +1097,32 @@ void expr_fprint(struct expr *e, FILE *out)
 
 static void expr_print_gstr_helper(void *data, struct symbol *sym, const char *str)
 {
-	str_append((struct gstr*)data, str);
+	struct gstr *gs = (struct gstr*)data;
+	const char *sym_str = NULL;
+
+	if (sym)
+		sym_str = sym_get_string_value(sym);
+
+	if (gs->max_width) {
+		unsigned extra_length = strlen(str);
+		const char *last_cr = strrchr(gs->s, '\n');
+		unsigned last_line_length;
+
+		if (sym_str)
+			extra_length += 4 + strlen(sym_str);
+
+		if (!last_cr)
+			last_cr = gs->s;
+
+		last_line_length = strlen(gs->s) - (last_cr - gs->s);
+
+		if ((last_line_length + extra_length) > gs->max_width)
+			str_append(gs, "\\\n");
+	}
+
+	str_append(gs, str);
+	if (sym && sym->type != S_UNKNOWN)
+		str_printf(gs, " [=%s]", sym_str);
 }
 
 void expr_gstr_print(struct expr *e, struct gstr *gs)
diff --git a/package/config/expr.h b/package/config/expr.h
index 6408fef..6ee2e4f 100644
--- a/package/config/expr.h
+++ b/package/config/expr.h
@@ -83,10 +83,11 @@ struct symbol {
 	tristate visible;
 	int flags;
 	struct property *prop;
+	struct expr_value dir_dep;
 	struct expr_value rev_dep;
 };
 
-#define for_all_symbols(i, sym) for (i = 0; i < 257; i++) for (sym = symbol_hash[i]; sym; sym = sym->next) if (sym->type != S_OTHER)
+#define for_all_symbols(i, sym) for (i = 0; i < SYMBOL_HASHSIZE; i++) for (sym = symbol_hash[i]; sym; sym = sym->next) if (sym->type != S_OTHER)
 
 #define SYMBOL_CONST      0x0001  /* symbol is const */
 #define SYMBOL_CHECK      0x0008  /* used during dependency checking */
@@ -108,8 +109,7 @@ struct symbol {
 #define SYMBOL_DEF4       0x80000  /* symbol.def[S_DEF_4] is valid */
 
 #define SYMBOL_MAXLENGTH	256
-#define SYMBOL_HASHSIZE		257
-#define SYMBOL_HASHMASK		0xff
+#define SYMBOL_HASHSIZE		9973
 
 /* A property represent the config options that can be associated
  * with a config "symbol".
@@ -132,6 +132,7 @@ enum prop_type {
 	P_SELECT,   /* select BAR */
 	P_RANGE,    /* range 7..100 (for a symbol) */
 	P_ENV,      /* value from environment variable */
+	P_SYMBOL,   /* where a symbol is defined */
 };
 
 struct property {
@@ -164,6 +165,7 @@ struct menu {
 	struct symbol *sym;
 	struct property *prompt;
 	struct expr *dep;
+	struct expr *dir_dep;
 	unsigned int flags;
 	char *help;
 	struct file *file;
diff --git a/package/config/gconf.c b/package/config/gconf.c
index 7c4c76c..f626061 100644
--- a/package/config/gconf.c
+++ b/package/config/gconf.c
@@ -30,13 +30,16 @@ enum {
 	SINGLE_VIEW, SPLIT_VIEW, FULL_VIEW
 };
 
+enum {
+	OPT_NORMAL, OPT_ALL, OPT_PROMPT
+};
+
 static gint view_mode = FULL_VIEW;
 static gboolean show_name = TRUE;
 static gboolean show_range = TRUE;
 static gboolean show_value = TRUE;
-static gboolean show_all = FALSE;
-static gboolean show_debug = FALSE;
 static gboolean resizeable = FALSE;
+static int opt_mode = OPT_NORMAL;
 
 GtkWidget *main_wnd = NULL;
 GtkWidget *tree1_w = NULL;	// left  frame
@@ -76,36 +79,7 @@ static void conf_changed(void);
 
 /* Helping/Debugging Functions */
 
-
-const char *dbg_print_stype(int val)
-{
-	static char buf[256];
-
-	bzero(buf, 256);
-
-	if (val == S_UNKNOWN)
-		strcpy(buf, "unknown");
-	if (val == S_BOOLEAN)
-		strcpy(buf, "boolean");
-	if (val == S_TRISTATE)
-		strcpy(buf, "tristate");
-	if (val == S_INT)
-		strcpy(buf, "int");
-	if (val == S_HEX)
-		strcpy(buf, "hex");
-	if (val == S_STRING)
-		strcpy(buf, "string");
-	if (val == S_OTHER)
-		strcpy(buf, "other");
-
-#ifdef DEBUG
-	printf("%s", buf);
-#endif
-
-	return buf;
-}
-
-const char *dbg_print_flags(int val)
+const char *dbg_sym_flags(int val)
 {
 	static char buf[256];
 
@@ -131,40 +105,10 @@ const char *dbg_print_flags(int val)
 		strcat(buf, "auto/");
 
 	buf[strlen(buf) - 1] = '\0';
-#ifdef DEBUG
-	printf("%s", buf);
-#endif
 
 	return buf;
 }
 
-const char *dbg_print_ptype(int val)
-{
-	static char buf[256];
-
-	bzero(buf, 256);
-
-	if (val == P_UNKNOWN)
-		strcpy(buf, "unknown");
-	if (val == P_PROMPT)
-		strcpy(buf, "prompt");
-	if (val == P_COMMENT)
-		strcpy(buf, "comment");
-	if (val == P_MENU)
-		strcpy(buf, "menu");
-	if (val == P_DEFAULT)
-		strcpy(buf, "default");
-	if (val == P_CHOICE)
-		strcpy(buf, "choice");
-
-#ifdef DEBUG
-	printf("%s", buf);
-#endif
-
-	return buf;
-}
-
-
 void replace_button_icon(GladeXML * xml, GdkDrawable * window,
 			 GtkStyle * style, gchar * btn_name, gchar ** xpm)
 {
@@ -456,19 +400,9 @@ static void text_insert_help(struct menu *menu)
 	GtkTextBuffer *buffer;
 	GtkTextIter start, end;
 	const char *prompt = _(menu_get_prompt(menu));
-	gchar *name;
-	const char *help;
-
-	help = menu_get_help(menu);
-
-	/* Gettextize if the help text not empty */
-	if ((help != 0) && (help[0] != 0))
-		help = _(help);
+	struct gstr help = str_new();
 
-	if (menu->sym && menu->sym->name)
-		name = g_strdup_printf(menu->sym->name);
-	else
-		name = g_strdup("");
+	menu_get_ext_help(menu, &help);
 
 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	gtk_text_buffer_get_bounds(buffer, &start, &end);
@@ -478,14 +412,11 @@ static void text_insert_help(struct menu *menu)
 	gtk_text_buffer_get_end_iter(buffer, &end);
 	gtk_text_buffer_insert_with_tags(buffer, &end, prompt, -1, tag1,
 					 NULL);
-	gtk_text_buffer_insert_at_cursor(buffer, " ", 1);
-	gtk_text_buffer_get_end_iter(buffer, &end);
-	gtk_text_buffer_insert_with_tags(buffer, &end, name, -1, tag1,
-					 NULL);
 	gtk_text_buffer_insert_at_cursor(buffer, "\n\n", 2);
 	gtk_text_buffer_get_end_iter(buffer, &end);
-	gtk_text_buffer_insert_with_tags(buffer, &end, help, -1, tag2,
+	gtk_text_buffer_insert_with_tags(buffer, &end, str_get(&help), -1, tag2,
 					 NULL);
+	str_free(&help);
 }
 
 
@@ -710,20 +641,29 @@ void on_show_data1_activate(GtkMenuItem * menuitem, gpointer user_data)
 
 
 void
-on_show_all_options1_activate(GtkMenuItem * menuitem, gpointer user_data)
+on_set_option_mode1_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	show_all = GTK_CHECK_MENU_ITEM(menuitem)->active;
+	opt_mode = OPT_NORMAL;
+	gtk_tree_store_clear(tree2);
+	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
+}
+
 
+void
+on_set_option_mode2_activate(GtkMenuItem *menuitem, gpointer user_data)
+{
+	opt_mode = OPT_ALL;
 	gtk_tree_store_clear(tree2);
-	display_tree(&rootmenu);	// instead of update_tree to speed-up
+	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
 
 void
-on_show_debug_info1_activate(GtkMenuItem * menuitem, gpointer user_data)
+on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
 {
-	show_debug = GTK_CHECK_MENU_ITEM(menuitem)->active;
-	update_tree(&rootmenu, NULL);
+	opt_mode = OPT_PROMPT;
+	gtk_tree_store_clear(tree2);
+	display_tree(&rootmenu);	/* instead of update_tree to speed-up */
 }
 
 
@@ -1174,9 +1114,12 @@ static gchar **fill_row(struct menu *menu)
 
 	row[COL_OPTION] =
 	    g_strdup_printf("%s %s", _(menu_get_prompt(menu)),
-			    sym && sym_has_value(sym) ? "(NEW)" : "");
+			    sym && !sym_has_value(sym) ? "(NEW)" : "");
 
-	if (show_all && !menu_is_visible(menu))
+	if (opt_mode == OPT_ALL && !menu_is_visible(menu))
+		row[COL_COLOR] = g_strdup("DarkGray");
+	else if (opt_mode == OPT_PROMPT &&
+			menu_has_prompt(menu) && !menu_is_visible(menu))
 		row[COL_COLOR] = g_strdup("DarkGray");
 	else
 		row[COL_COLOR] = g_strdup("Black");
@@ -1399,16 +1342,20 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 		       menu2 ? menu_get_prompt(menu2) : "nil");
 #endif
 
-		if (!menu_is_visible(child1) && !show_all) {	// remove node
+		if ((opt_mode == OPT_NORMAL && !menu_is_visible(child1)) ||
+		    (opt_mode == OPT_PROMPT && !menu_has_prompt(child1)) ||
+		    (opt_mode == OPT_ALL    && !menu_get_prompt(child1))) {
+
+			/* remove node */
 			if (gtktree_iter_find_node(dst, menu1) != NULL) {
 				memcpy(&tmp, child2, sizeof(GtkTreeIter));
 				valid = gtk_tree_model_iter_next(model2,
 								 child2);
 				gtk_tree_store_remove(tree2, &tmp);
 				if (!valid)
-					return;	// next parent
+					return;		/* next parent */
 				else
-					goto reparse;	// next child
+					goto reparse;	/* next child */
 			} else
 				continue;
 		}
@@ -1477,17 +1424,19 @@ static void display_tree(struct menu *menu)
 		    && (tree == tree2))
 			continue;
 
-		if (menu_is_visible(child) || show_all)
+		if ((opt_mode == OPT_NORMAL && menu_is_visible(child)) ||
+		    (opt_mode == OPT_PROMPT && menu_has_prompt(child)) ||
+		    (opt_mode == OPT_ALL    && menu_get_prompt(child)))
 			place_node(child, fill_row(child));
 #ifdef DEBUG
 		printf("%*c%s: ", indent, ' ', menu_get_prompt(child));
 		printf("%s", child->flags & MENU_ROOT ? "rootmenu | " : "");
-		dbg_print_ptype(ptype);
+		printf("%s", prop_get_type_name(ptype));
 		printf(" | ");
 		if (sym) {
-			dbg_print_stype(sym->type);
+			printf("%s", sym_type_name(sym->type));
 			printf(" | ");
-			dbg_print_flags(sym->flags);
+			printf("%s", dbg_sym_flags(sym->flags));
 			printf("\n");
 		} else
 			printf("\n");
diff --git a/package/config/gconf.glade b/package/config/gconf.glade
index 5656bf7..8e7d99e 100644
--- a/package/config/gconf.glade
+++ b/package/config/gconf.glade
@@ -190,26 +190,40 @@
 		  </child>
 
 		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_all_options1">
+		    <widget class="GtkRadioMenuItem" id="set_option_mode1">
+		      <property name="visible">True</property>
+		      <property name="tooltip" translatable="yes">Show normal options</property>
+		      <property name="label" translatable="yes">Show normal options</property>
+		      <property name="use_underline">True</property>
+		      <property name="active">True</property>
+		      <signal name="activate" handler="on_set_option_mode1_activate"/>
+		    </widget>
+		  </child>
+
+		  <child>
+		    <widget class="GtkRadioMenuItem" id="set_option_mode2">
 		      <property name="visible">True</property>
 		      <property name="tooltip" translatable="yes">Show all options</property>
 		      <property name="label" translatable="yes">Show all _options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_all_options1_activate"/>
+		      <property name="group">set_option_mode1</property>
+		      <signal name="activate" handler="on_set_option_mode2_activate"/>
 		    </widget>
 		  </child>
 
 		  <child>
-		    <widget class="GtkCheckMenuItem" id="show_debug_info1">
+		    <widget class="GtkRadioMenuItem" id="set_option_mode3">
 		      <property name="visible">True</property>
-		      <property name="tooltip" translatable="yes">Show masked options</property>
-		      <property name="label" translatable="yes">Show _debug info</property>
+		      <property name="tooltip" translatable="yes">Show all options with prompts</property>
+		      <property name="label" translatable="yes">Show all prompt options</property>
 		      <property name="use_underline">True</property>
 		      <property name="active">False</property>
-		      <signal name="activate" handler="on_show_debug_info1_activate"/>
+		      <property name="group">set_option_mode1</property>
+		      <signal name="activate" handler="on_set_option_mode3_activate"/>
 		    </widget>
 		  </child>
+
 		</widget>
 	      </child>
 	    </widget>
@@ -547,7 +561,7 @@
 		  <property name="headers_visible">True</property>
 		  <property name="rules_hint">False</property>
 		  <property name="reorderable">False</property>
-		  <property name="enable_search">True</property>
+		  <property name="enable_search">False</property>
 		  <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:58:22 GMT"/>
 		  <signal name="button_press_event" handler="on_treeview1_button_press_event" last_modification_time="Sun, 12 Jan 2003 16:03:52 GMT"/>
 		  <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 16:11:44 GMT"/>
@@ -582,7 +596,7 @@
 		      <property name="headers_visible">True</property>
 		      <property name="rules_hint">False</property>
 		      <property name="reorderable">False</property>
-		      <property name="enable_search">True</property>
+		      <property name="enable_search">False</property>
 		      <signal name="cursor_changed" handler="on_treeview2_cursor_changed" last_modification_time="Sun, 12 Jan 2003 15:57:55 GMT"/>
 		      <signal name="button_press_event" handler="on_treeview2_button_press_event" last_modification_time="Sun, 12 Jan 2003 15:57:58 GMT"/>
 		      <signal name="key_press_event" handler="on_treeview2_key_press_event" last_modification_time="Sun, 12 Jan 2003 15:58:01 GMT"/>
diff --git a/package/config/kxgettext.c b/package/config/kxgettext.c
index 8d9ce22..dcc3fcc 100644
--- a/package/config/kxgettext.c
+++ b/package/config/kxgettext.c
@@ -166,7 +166,7 @@ static int message__add(const char *msg, char *option, char *file, int lineno)
 	return rc;
 }
 
-void menu_build_message_list(struct menu *menu)
+static void menu_build_message_list(struct menu *menu)
 {
 	struct menu *child;
 
@@ -211,7 +211,7 @@ static void message__print_gettext_msgid_msgstr(struct message *self)
 	       "msgstr \"\"\n", self->msg);
 }
 
-void menu__xgettext(void)
+static void menu__xgettext(void)
 {
 	struct message *m = message__list;
 
diff --git a/package/config/lex.zconf.c_shipped b/package/config/lex.zconf.c_shipped
index dc3e818..fdc7113 100644
--- a/package/config/lex.zconf.c_shipped
+++ b/package/config/lex.zconf.c_shipped
@@ -160,7 +160,15 @@ typedef unsigned int flex_uint32_t;
 
 /* Size of default input buffer. */
 #ifndef YY_BUF_SIZE
+#ifdef __ia64__
+/* On IA-64, the buffer size is 16k, not 8k.
+ * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
+ * Ditto for the __ia64__ case accordingly.
+ */
+#define YY_BUF_SIZE 32768
+#else
 #define YY_BUF_SIZE 16384
+#endif /* __ia64__ */
 #endif
 
 /* The state buf must be large enough to hold one state per character in the main buffer.
@@ -802,7 +810,7 @@ static int last_ts, first_ts;
 static void zconf_endhelp(void);
 static void zconf_endfile(void);
 
-void new_string(void)
+static void new_string(void)
 {
 	text = malloc(START_STRSIZE);
 	text_asize = START_STRSIZE;
@@ -810,7 +818,7 @@ void new_string(void)
 	*text = 0;
 }
 
-void append_string(const char *str, int size)
+static void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
 	if (new_size > text_asize) {
@@ -824,7 +832,7 @@ void append_string(const char *str, int size)
 	text[text_size] = 0;
 }
 
-void alloc_string(const char *str, int size)
+static void alloc_string(const char *str, int size)
 {
 	text = malloc(size + 1);
 	memcpy(text, str, size);
@@ -914,7 +922,12 @@ static int input (void );
 
 /* Amount of stuff to slurp up with each read. */
 #ifndef YY_READ_BUF_SIZE
+#ifdef __ia64__
+/* On IA-64, the buffer size is 16k, not 8k */
+#define YY_READ_BUF_SIZE 16384
+#else
 #define YY_READ_BUF_SIZE 8192
+#endif /* __ia64__ */
 #endif
 
 /* Copy whatever the last rule matched to the standard output. */
@@ -922,7 +935,7 @@ static int input (void );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO fwrite( zconftext, zconfleng, 1, zconfout )
+#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -2060,8 +2073,8 @@ YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
 
 /** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
  * scan from a @e copy of @a bytes.
- * @param bytes the byte buffer to scan
- * @param len the number of bytes in the buffer pointed to by @a bytes.
+ * @param yybytes the byte buffer to scan
+ * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
diff --git a/package/config/lkc.h b/package/config/lkc.h
index f379b0b..bdf71bd 100644
--- a/package/config/lkc.h
+++ b/package/config/lkc.h
@@ -72,6 +72,9 @@ void zconf_nextfile(const char *name);
 int zconf_lineno(void);
 char *zconf_curname(void);
 
+/* conf.c */
+void xfgets(char *str, int size, FILE *in);
+
 /* confdata.c */
 const char *conf_get_configname(void);
 const char *conf_get_autoconfig_name(void);
@@ -80,11 +83,18 @@ void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 void conf_set_all_new_symbols(enum conf_def_mode mode);
 
+/* confdata.c and expr.c */
+static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
+{
+	if (fwrite(str, len, count, out) < count)
+		fprintf(stderr, "\nError in writing or end of file.\n");
+}
+
 /* kconfig_load.c */
 void kconfig_load(void);
 
 /* menu.c */
-void menu_init(void);
+void _menu_init(void);
 void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
@@ -106,6 +116,11 @@ int file_write_dep(const char *name);
 struct gstr {
 	size_t len;
 	char  *s;
+	/*
+	* when max_width is not zero long lines in string s (if any) get
+	* wrapped not to exceed the max_width value
+	*/
+	int max_width;
 };
 struct gstr str_new(void);
 struct gstr str_assign(const char *s);
@@ -121,6 +136,8 @@ void sym_init(void);
 void sym_clear_all_valid(void);
 void sym_set_all_changed(void);
 void sym_set_changed(struct symbol *sym);
+struct symbol *sym_choice_default(struct symbol *sym);
+const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
 struct property *prop_alloc(enum prop_type type, struct symbol *sym);
 struct symbol *prop_get_symbol(struct property *prop);
diff --git a/package/config/lkc_proto.h b/package/config/lkc_proto.h
index 8e69461..9a948c9 100644
--- a/package/config/lkc_proto.h
+++ b/package/config/lkc_proto.h
@@ -3,6 +3,7 @@
 P(conf_parse,void,(const char *name));
 P(conf_read,int,(const char *name));
 P(conf_read_simple,int,(const char *name, int));
+P(conf_write_defconfig,int,(const char *name));
 P(conf_write,int,(const char *name));
 P(conf_write_autoconf,int,(void));
 P(conf_get_changed,bool,(void));
@@ -11,12 +12,16 @@ P(conf_set_changed_callback, void,(void (*fn)(void)));
 /* menu.c */
 P(rootmenu,struct menu,);
 
-P(menu_is_visible,bool,(struct menu *menu));
+P(menu_is_visible, bool, (struct menu *menu));
+P(menu_has_prompt, bool, (struct menu *menu));
 P(menu_get_prompt,const char *,(struct menu *menu));
 P(menu_get_root_menu,struct menu *,(struct menu *menu));
 P(menu_get_parent_menu,struct menu *,(struct menu *menu));
 P(menu_has_help,bool,(struct menu *menu));
 P(menu_get_help,const char *,(struct menu *menu));
+P(get_symbol_str, void, (struct gstr *r, struct symbol *sym));
+P(get_relations_str, struct gstr, (struct symbol **sym_arr));
+P(menu_get_ext_help,void,(struct menu *menu, struct gstr *help));
 
 /* symbol.c */
 P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
diff --git a/package/config/lxdialog/.gitignore b/package/config/lxdialog/.gitignore
new file mode 100644
index 0000000..90b08ff
--- /dev/null
+++ b/package/config/lxdialog/.gitignore
@@ -0,0 +1,4 @@
+#
+# Generated files
+#
+lxdialog
diff --git a/package/config/lxdialog/checklist.c b/package/config/lxdialog/checklist.c
index bcc6f19..a2eb80f 100644
--- a/package/config/lxdialog/checklist.c
+++ b/package/config/lxdialog/checklist.c
@@ -31,6 +31,10 @@ static int list_width, check_x, item_x;
 static void print_item(WINDOW * win, int choice, int selected)
 {
 	int i;
+	char *list_item = malloc(list_width + 1);
+
+	strncpy(list_item, item_str(), list_width - item_x);
+	list_item[list_width - item_x] = '\0';
 
 	/* Clear 'residue' of last item */
 	wattrset(win, dlg.menubox.atr);
@@ -45,13 +49,14 @@ static void print_item(WINDOW * win, int choice, int selected)
 		wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
 
 	wattrset(win, selected ? dlg.tag_selected.atr : dlg.tag.atr);
-	mvwaddch(win, choice, item_x, item_str()[0]);
+	mvwaddch(win, choice, item_x, list_item[0]);
 	wattrset(win, selected ? dlg.item_selected.atr : dlg.item.atr);
-	waddstr(win, (char *)item_str() + 1);
+	waddstr(win, list_item + 1);
 	if (selected) {
 		wmove(win, choice, check_x + 1);
 		wrefresh(win);
 	}
+	free(list_item);
 }
 
 /*
@@ -175,6 +180,7 @@ do_resize:
 	check_x = 0;
 	item_foreach()
 		check_x = MAX(check_x, strlen(item_str()) + 4);
+	check_x = MIN(check_x, list_width);
 
 	check_x = (list_width - check_x) / 2;
 	item_x = check_x + 4;
diff --git a/package/config/lxdialog/inputbox.c b/package/config/lxdialog/inputbox.c
index 616c601..dd8e587 100644
--- a/package/config/lxdialog/inputbox.c
+++ b/package/config/lxdialog/inputbox.c
@@ -180,7 +180,7 @@ do_resize:
 		case KEY_LEFT:
 			switch (button) {
 			case -1:
-				button = 1;	/* Indicates "Cancel" button is selected */
+				button = 1;	/* Indicates "Help" button is selected */
 				print_buttons(dialog, height, width, 1);
 				break;
 			case 0:
@@ -204,7 +204,7 @@ do_resize:
 				print_buttons(dialog, height, width, 0);
 				break;
 			case 0:
-				button = 1;	/* Indicates "Cancel" button is selected */
+				button = 1;	/* Indicates "Help" button is selected */
 				print_buttons(dialog, height, width, 1);
 				break;
 			case 1:
diff --git a/package/config/lxdialog/menubox.c b/package/config/lxdialog/menubox.c
index fa9d633..1d60473 100644
--- a/package/config/lxdialog/menubox.c
+++ b/package/config/lxdialog/menubox.c
@@ -383,6 +383,10 @@ do_resize:
 		case 'n':
 		case 'm':
 		case '/':
+		case 'h':
+		case '?':
+		case 'z':
+		case '\n':
 			/* save scroll info */
 			*s_scroll = scroll;
 			delwin(menu);
@@ -390,8 +394,10 @@ do_resize:
 			item_set(scroll + choice);
 			item_set_selected(1);
 			switch (key) {
+			case 'h':
+			case '?':
+				return 2;
 			case 's':
-				return 3;
 			case 'y':
 				return 3;
 			case 'n':
@@ -402,18 +408,12 @@ do_resize:
 				return 6;
 			case '/':
 				return 7;
+			case 'z':
+				return 8;
+			case '\n':
+				return button;
 			}
 			return 0;
-		case 'h':
-		case '?':
-			button = 2;
-		case '\n':
-			*s_scroll = scroll;
-			delwin(menu);
-			delwin(dialog);
-			item_set(scroll + choice);
-			item_set_selected(1);
-			return button;
 		case 'e':
 		case 'x':
 			key = KEY_ESC;
diff --git a/package/config/lxdialog/util.c b/package/config/lxdialog/util.c
index 86d95cc..f2375ad 100644
--- a/package/config/lxdialog/util.c
+++ b/package/config/lxdialog/util.c
@@ -19,6 +19,8 @@
  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  */
 
+#include <stdarg.h>
+
 #include "dialog.h"
 
 struct dialog_info dlg;
diff --git a/package/config/mconf.c b/package/config/mconf.c
index 11901e9..317e478 100644
--- a/package/config/mconf.c
+++ b/package/config/mconf.c
@@ -66,13 +66,15 @@ static const char mconf_readme[] = N_(
 "             there is a delayed response which you may find annoying.\n"
 "\n"
 "   Also, the <TAB> and cursor keys will cycle between <Select>,\n"
-"   <Exit> and <Help>\n"
+"   <Exit> and <Help>.\n"
 "\n"
 "o  To get help with an item, use the cursor keys to highlight <Help>\n"
-"   and Press <ENTER>.\n"
+"   and press <ENTER>.\n"
 "\n"
 "   Shortcut: Press <H> or <?>.\n"
 "\n"
+"o  To toggle the display of hidden options, press <Z>.\n"
+"\n"
 "\n"
 "Radiolists  (Choice lists)\n"
 "-----------\n"
@@ -198,8 +200,6 @@ inputbox_instructions_string[] = N_(
 setmod_text[] = N_(
 	"This feature depends on another which has been configured as a module.\n"
 	"As a result, this feature will be built as a module."),
-nohelp_text[] = N_(
-	"There is no help available for this option.\n"),
 load_config_text[] = N_(
 	"Enter the name of the configuration file you wish to load.  "
 	"Accept the name shown to restore the configuration you "
@@ -214,7 +214,7 @@ load_config_help[] = N_(
 	"to modify that configuration.\n"
 	"\n"
 	"If you are uncertain, then you have probably never used alternate\n"
-	"configuration files.  You should therefor leave this blank to abort.\n"),
+	"configuration files. You should therefore leave this blank to abort.\n"),
 save_config_text[] = N_(
 	"Enter a filename to which this configuration should be saved "
 	"as an alternate.  Leave blank to abort."),
@@ -273,6 +273,7 @@ static int indent;
 static struct menu *current_menu;
 static int child_count;
 static int single_menu_mode;
+static int show_all_options;
 
 static void conf(struct menu *menu);
 static void conf_choice(struct menu *menu);
@@ -283,79 +284,6 @@ static void show_textbox(const char *title, const char *text, int r, int c);
 static void show_helptext(const char *title, const char *text);
 static void show_help(struct menu *menu);
 
-static void get_prompt_str(struct gstr *r, struct property *prop)
-{
-	int i, j;
-	struct menu *submenu[8], *menu;
-
-	str_printf(r, _("Prompt: %s\n"), _(prop->text));
-	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
-		prop->menu->lineno);
-	if (!expr_is_yes(prop->visible.expr)) {
-		str_append(r, _("  Depends on: "));
-		expr_gstr_print(prop->visible.expr, r);
-		str_append(r, "\n");
-	}
-	menu = prop->menu->parent;
-	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent)
-		submenu[i++] = menu;
-	if (i > 0) {
-		str_printf(r, _("  Location:\n"));
-		for (j = 4; --i >= 0; j += 2) {
-			menu = submenu[i];
-			str_printf(r, "%*c-> %s", j, ' ', _(menu_get_prompt(menu)));
-			if (menu->sym) {
-				str_printf(r, " (%s [=%s])", menu->sym->name ?
-					menu->sym->name : _("<choice>"),
-					sym_get_string_value(menu->sym));
-			}
-			str_append(r, "\n");
-		}
-	}
-}
-
-static void get_symbol_str(struct gstr *r, struct symbol *sym)
-{
-	bool hit;
-	struct property *prop;
-
-	if (sym && sym->name)
-		str_printf(r, "Symbol: %s [=%s]\n", sym->name,
-		                                    sym_get_string_value(sym));
-	for_all_prompts(sym, prop)
-		get_prompt_str(r, prop);
-	hit = false;
-	for_all_properties(sym, prop, P_SELECT) {
-		if (!hit) {
-			str_append(r, "  Selects: ");
-			hit = true;
-		} else
-			str_printf(r, " && ");
-		expr_gstr_print(prop->expr, r);
-	}
-	if (hit)
-		str_append(r, "\n");
-	if (sym->rev_dep.expr) {
-		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
-		str_append(r, "\n");
-	}
-	str_append(r, "\n\n");
-}
-
-static struct gstr get_relations_str(struct symbol **sym_arr)
-{
-	struct symbol *sym;
-	struct gstr res = str_new();
-	int i;
-
-	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
-		get_symbol_str(&res, sym);
-	if (!i)
-		str_append(&res, _("No matches found.\n"));
-	return res;
-}
-
 static char filename[PATH_MAX+1];
 static void set_config_filename(const char *config_filename)
 {
@@ -420,8 +348,16 @@ static void build_conf(struct menu *menu)
 	int type, tmp, doint = 2;
 	tristate val;
 	char ch;
-
-	if (!menu_is_visible(menu))
+	bool visible;
+
+	/*
+	 * note: menu_is_visible() has side effect that it will
+	 * recalc the value of the symbol.
+	 */
+	visible = menu_is_visible(menu);
+	if (show_all_options && !menu_has_prompt(menu))
+		return;
+	else if (!show_all_options && !visible)
 		return;
 
 	sym = menu->sym;
@@ -680,6 +616,9 @@ static void conf(struct menu *menu)
 		case 7:
 			search_conf();
 			break;
+		case 8:
+			show_all_options = !show_all_options;
+			break;
 		}
 	}
 }
@@ -698,19 +637,10 @@ static void show_helptext(const char *title, const char *text)
 static void show_help(struct menu *menu)
 {
 	struct gstr help = str_new();
-	struct symbol *sym = menu->sym;
-
-	if (menu_has_help(menu))
-	{
-		if (sym->name) {
-			str_printf(&help, "CONFIG_%s:\n\n", sym->name);
-			str_append(&help, _(menu_get_help(menu)));
-			str_append(&help, "\n");
-		}
-	} else {
-		str_append(&help, nohelp_text);
-	}
-	get_symbol_str(&help, sym);
+
+	help.max_width = getmaxx(stdscr) - 10;
+	menu_get_ext_help(menu, &help);
+
 	show_helptext(_(menu_get_prompt(menu)), str_get(&help));
 	str_free(&help);
 }
@@ -887,6 +817,8 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
+	initscr();
+
 	getyx(stdscr, saved_y, saved_x);
 	if (init_dialog(NULL)) {
 		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
diff --git a/package/config/menu.c b/package/config/menu.c
index 07ff8d1..4fb5902 100644
--- a/package/config/menu.c
+++ b/package/config/menu.c
@@ -9,6 +9,9 @@
 #define LKC_DIRECT_LINK
 #include "lkc.h"
 
+static const char nohelp_text[] = N_(
+	"There is no help available for this kernel option.\n");
+
 struct menu rootmenu;
 static struct menu **last_entry_ptr;
 
@@ -35,7 +38,7 @@ static void prop_warn(struct property *prop, const char *fmt, ...)
 	va_end(ap);
 }
 
-void menu_init(void)
+void _menu_init(void)
 {
 	current_entry = current_menu = &rootmenu;
 	last_entry_ptr = &rootmenu.list;
@@ -55,6 +58,8 @@ void menu_add_entry(struct symbol *sym)
 	*last_entry_ptr = menu;
 	last_entry_ptr = &menu->next;
 	current_entry = menu;
+	if (sym)
+		menu_add_symbol(P_SYMBOL, sym, NULL);
 }
 
 void menu_end_entry(void)
@@ -74,7 +79,7 @@ void menu_end_menu(void)
 	current_menu = current_menu->parent;
 }
 
-struct expr *menu_check_dep(struct expr *e)
+static struct expr *menu_check_dep(struct expr *e)
 {
 	if (!e)
 		return e;
@@ -102,6 +107,7 @@ struct expr *menu_check_dep(struct expr *e)
 void menu_add_dep(struct expr *dep)
 {
 	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
+	current_entry->dir_dep = current_entry->dep;
 }
 
 void menu_set_type(int type)
@@ -184,7 +190,7 @@ static int menu_range_valid_sym(struct symbol *sym, struct symbol *sym2)
 	       (sym2->type == S_UNKNOWN && sym_string_valid(sym, sym2->name));
 }
 
-void sym_check_prop(struct symbol *sym)
+static void sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
 	struct symbol *sym2;
@@ -194,7 +200,7 @@ void sym_check_prop(struct symbol *sym)
 			if ((sym->type == S_STRING || sym->type == S_INT || sym->type == S_HEX) &&
 			    prop->expr->type != E_SYMBOL)
 				prop_warn(prop,
-				    "default for config symbol '%'"
+				    "default for config symbol '%s'"
 				    " must be a single symbol", sym->name);
 			break;
 		case P_SELECT:
@@ -285,6 +291,10 @@ void menu_finalize(struct menu *parent)
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
+		/* ignore inherited dependencies for dir_dep */
+		sym->dir_dep.expr = expr_transform(expr_copy(parent->dir_dep));
+		sym->dir_dep.expr = expr_eliminate_dups(sym->dir_dep.expr);
+
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
 		basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
 		basedep = expr_eliminate_dups(expr_transform(basedep));
@@ -387,6 +397,13 @@ void menu_finalize(struct menu *parent)
 	}
 }
 
+bool menu_has_prompt(struct menu *menu)
+{
+	if (!menu->prompt)
+		return false;
+	return true;
+}
+
 bool menu_is_visible(struct menu *menu)
 {
 	struct menu *child;
@@ -395,6 +412,7 @@ bool menu_is_visible(struct menu *menu)
 
 	if (!menu->prompt)
 		return false;
+
 	sym = menu->sym;
 	if (sym) {
 		sym_calc_value(sym);
@@ -404,12 +422,18 @@ bool menu_is_visible(struct menu *menu)
 
 	if (visible != no)
 		return true;
+
 	if (!sym || sym_get_tristate_value(menu->sym) == no)
 		return false;
 
-	for (child = menu->list; child; child = child->next)
-		if (menu_is_visible(child))
+	for (child = menu->list; child; child = child->next) {
+		if (menu_is_visible(child)) {
+			if (sym)
+				sym->flags |= SYMBOL_DEF_USER;
 			return true;
+		}
+	}
+
 	return false;
 }
 
@@ -451,3 +475,104 @@ const char *menu_get_help(struct menu *menu)
 	else
 		return "";
 }
+
+static void get_prompt_str(struct gstr *r, struct property *prop)
+{
+	int i, j;
+	struct menu *submenu[8], *menu;
+
+	str_printf(r, _("Prompt: %s\n"), _(prop->text));
+	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
+		prop->menu->lineno);
+	if (!expr_is_yes(prop->visible.expr)) {
+		str_append(r, _("  Depends on: "));
+		expr_gstr_print(prop->visible.expr, r);
+		str_append(r, "\n");
+	}
+	menu = prop->menu->parent;
+	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent)
+		submenu[i++] = menu;
+	if (i > 0) {
+		str_printf(r, _("  Location:\n"));
+		for (j = 4; --i >= 0; j += 2) {
+			menu = submenu[i];
+			str_printf(r, "%*c-> %s", j, ' ', _(menu_get_prompt(menu)));
+			if (menu->sym) {
+				str_printf(r, " (%s [=%s])", menu->sym->name ?
+					menu->sym->name : _("<choice>"),
+					sym_get_string_value(menu->sym));
+			}
+			str_append(r, "\n");
+		}
+	}
+}
+
+void get_symbol_str(struct gstr *r, struct symbol *sym)
+{
+	bool hit;
+	struct property *prop;
+
+	if (sym && sym->name) {
+		str_printf(r, "Symbol: %s [=%s]\n", sym->name,
+			   sym_get_string_value(sym));
+		str_printf(r, "Type  : %s\n", sym_type_name(sym->type));
+		if (sym->type == S_INT || sym->type == S_HEX) {
+			prop = sym_get_range_prop(sym);
+			if (prop) {
+				str_printf(r, "Range : ");
+				expr_gstr_print(prop->expr, r);
+				str_append(r, "\n");
+			}
+		}
+	}
+	for_all_prompts(sym, prop)
+		get_prompt_str(r, prop);
+	hit = false;
+	for_all_properties(sym, prop, P_SELECT) {
+		if (!hit) {
+			str_append(r, "  Selects: ");
+			hit = true;
+		} else
+			str_printf(r, " && ");
+		expr_gstr_print(prop->expr, r);
+	}
+	if (hit)
+		str_append(r, "\n");
+	if (sym->rev_dep.expr) {
+		str_append(r, _("  Selected by: "));
+		expr_gstr_print(sym->rev_dep.expr, r);
+		str_append(r, "\n");
+	}
+	str_append(r, "\n\n");
+}
+
+struct gstr get_relations_str(struct symbol **sym_arr)
+{
+	struct symbol *sym;
+	struct gstr res = str_new();
+	int i;
+
+	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
+		get_symbol_str(&res, sym);
+	if (!i)
+		str_append(&res, _("No matches found.\n"));
+	return res;
+}
+
+
+void menu_get_ext_help(struct menu *menu, struct gstr *help)
+{
+	struct symbol *sym = menu->sym;
+
+	if (menu_has_help(menu)) {
+		if (sym->name) {
+			str_printf(help, "CONFIG_%s:\n\n", sym->name);
+			str_append(help, _(menu_get_help(menu)));
+			str_append(help, "\n");
+		}
+	} else {
+		str_append(help, nohelp_text);
+	}
+	if (sym)
+		get_symbol_str(help, sym);
+}
diff --git a/package/config/nconf.c b/package/config/nconf.c
new file mode 100644
index 0000000..2ba71bc
--- /dev/null
+++ b/package/config/nconf.c
@@ -0,0 +1,1570 @@
+/*
+ * Copyright (C) 2008 Nir Tzachar <nir.tzachar@gmail.com?
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ * Derived from menuconfig.
+ *
+ */
+#define LKC_DIRECT_LINK
+#include "lkc.h"
+#include "nconf.h"
+
+static const char nconf_readme[] = N_(
+"Overview\n"
+"--------\n"
+"Some kernel features may be built directly into the kernel.\n"
+"Some may be made into loadable runtime modules.  Some features\n"
+"may be completely removed altogether.  There are also certain\n"
+"kernel parameters which are not really features, but must be\n"
+"entered in as decimal or hexadecimal numbers or possibly text.\n"
+"\n"
+"Menu items beginning with following braces represent features that\n"
+"  [ ] can be built in or removed\n"
+"  < > can be built in, modularized or removed\n"
+"  { } can be built in or modularized (selected by other feature)\n"
+"  - - are selected by other feature,\n"
+"  XXX cannot be selected. use Symbol Info to find out why,\n"
+"while *, M or whitespace inside braces means to build in, build as\n"
+"a module or to exclude the feature respectively.\n"
+"\n"
+"To change any of these features, highlight it with the cursor\n"
+"keys and press <Y> to build it in, <M> to make it a module or\n"
+"<N> to removed it.  You may also press the <Space Bar> to cycle\n"
+"through the available options (ie. Y->N->M->Y).\n"
+"\n"
+"Some additional keyboard hints:\n"
+"\n"
+"Menus\n"
+"----------\n"
+"o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
+"   you wish to change use <Enter> or <Space>. Goto submenu by \n"
+"   pressing <Enter> of <right-arrow>. Use <Esc> or <left-arrow> to go back.\n"
+"   Submenus are designated by \"--->\".\n"
+"\n"
+"   Shortcut: Press the option's highlighted letter (hotkey).\n"
+"             Pressing a hotkey more than once will sequence\n"
+"             through all visible items which use that hotkey.\n"
+"\n"
+"   You may also use the <PAGE UP> and <PAGE DOWN> keys to scroll\n"
+"   unseen options into view.\n"
+"\n"
+"o  To exit a menu use the just press <ESC> <F5> <F8> or <left-arrow>.\n"
+"\n"
+"o  To get help with an item, press <F1>\n"
+"   Shortcut: Press <h> or <?>.\n"
+"\n"
+"\n"
+"Radiolists  (Choice lists)\n"
+"-----------\n"
+"o  Use the cursor keys to select the option you wish to set and press\n"
+"   <S> or the <SPACE BAR>.\n"
+"\n"
+"   Shortcut: Press the first letter of the option you wish to set then\n"
+"             press <S> or <SPACE BAR>.\n"
+"\n"
+"o  To see available help for the item, press <F1>\n"
+"   Shortcut: Press <H> or <?>.\n"
+"\n"
+"\n"
+"Data Entry\n"
+"-----------\n"
+"o  Enter the requested information and press <ENTER>\n"
+"   If you are entering hexadecimal values, it is not necessary to\n"
+"   add the '0x' prefix to the entry.\n"
+"\n"
+"o  For help, press <F1>.\n"
+"\n"
+"\n"
+"Text Box    (Help Window)\n"
+"--------\n"
+"o  Use the cursor keys to scroll up/down/left/right.  The VI editor\n"
+"   keys h,j,k,l function here as do <SPACE BAR> for those\n"
+"   who are familiar with less and lynx.\n"
+"\n"
+"o  Press <Enter>, <F1>, <F5>, <F7> or <Esc> to exit.\n"
+"\n"
+"\n"
+"Alternate Configuration Files\n"
+"-----------------------------\n"
+"nconfig supports the use of alternate configuration files for\n"
+"those who, for various reasons, find it necessary to switch\n"
+"between different kernel configurations.\n"
+"\n"
+"At the end of the main menu you will find two options.  One is\n"
+"for saving the current configuration to a file of your choosing.\n"
+"The other option is for loading a previously saved alternate\n"
+"configuration.\n"
+"\n"
+"Even if you don't use alternate configuration files, but you\n"
+"find during a nconfig session that you have completely messed\n"
+"up your settings, you may use the \"Load Alternate...\" option to\n"
+"restore your previously saved settings from \".config\" without\n"
+"restarting nconfig.\n"
+"\n"
+"Other information\n"
+"-----------------\n"
+"If you use nconfig in an XTERM window make sure you have your\n"
+"$TERM variable set to point to a xterm definition which supports color.\n"
+"Otherwise, nconfig will look rather bad.  nconfig will not\n"
+"display correctly in a RXVT window because rxvt displays only one\n"
+"intensity of color, bright.\n"
+"\n"
+"nconfig will display larger menus on screens or xterms which are\n"
+"set to display more than the standard 25 row by 80 column geometry.\n"
+"In order for this to work, the \"stty size\" command must be able to\n"
+"display the screen's current row and column geometry.  I STRONGLY\n"
+"RECOMMEND that you make sure you do NOT have the shell variables\n"
+"LINES and COLUMNS exported into your environment.  Some distributions\n"
+"export those variables via /etc/profile.  Some ncurses programs can\n"
+"become confused when those variables (LINES & COLUMNS) don't reflect\n"
+"the true screen size.\n"
+"\n"
+"Optional personality available\n"
+"------------------------------\n"
+"If you prefer to have all of the kernel options listed in a single\n"
+"menu, rather than the default multimenu hierarchy, run the nconfig\n"
+"with NCONFIG_MODE environment variable set to single_menu. Example:\n"
+"\n"
+"make NCONFIG_MODE=single_menu nconfig\n"
+"\n"
+"<Enter> will then unroll the appropriate category, or enfold it if it\n"
+"is already unrolled.\n"
+"\n"
+"Note that this mode can eventually be a little more CPU expensive\n"
+"(especially with a larger number of unrolled categories) than the\n"
+"default mode.\n"
+"\n"),
+menu_no_f_instructions[] = N_(
+" You do not have function keys support. Please follow the\n"
+" following instructions:\n"
+" Arrow keys navigate the menu.\n"
+" <Enter> or <right-arrow> selects submenus --->.\n"
+" Capital Letters are hotkeys.\n"
+" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
+" Pressing SpaceBar toggles between the above options\n"
+" Press <Esc> or <left-arrow> to go back one menu, \n"
+" <?> or <h> for Help, </> for Search.\n"
+" <1> is interchangable with <F1>, <2> with <F2>, etc.\n"
+" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+" <Esc> always leaves the current window\n"),
+menu_instructions[] = N_(
+" Arrow keys navigate the menu.\n"
+" <Enter> or <right-arrow> selects submenus --->.\n"
+" Capital Letters are hotkeys.\n"
+" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
+" Pressing SpaceBar toggles between the above options\n"
+" Press <Esc>, <F3> or <left-arrow> to go back one menu, \n"
+" <?>, <F1> or <h> for Help, </> for Search.\n"
+" <1> is interchangable with <F1>, <2> with <F2>, etc.\n"
+" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+" <Esc> always leaves the current window\n"),
+radiolist_instructions[] = N_(
+" Use the arrow keys to navigate this window or\n"
+" press the hotkey of the item you wish to select\n"
+" followed by the <SPACE BAR>.\n"
+" Press <?>, <F1> or <h> for additional information about this option.\n"),
+inputbox_instructions_int[] = N_(
+"Please enter a decimal value.\n"
+"Fractions will not be accepted.\n"
+"Press <RETURN> to accept, <ESC> to cancel."),
+inputbox_instructions_hex[] = N_(
+"Please enter a hexadecimal value.\n"
+"Press <RETURN> to accept, <ESC> to cancel."),
+inputbox_instructions_string[] = N_(
+"Please enter a string value.\n"
+"Press <RETURN> to accept, <ESC> to cancel."),
+setmod_text[] = N_(
+"This feature depends on another which\n"
+"has been configured as a module.\n"
+"As a result, this feature will be built as a module."),
+nohelp_text[] = N_(
+"There is no help available for this kernel option.\n"),
+load_config_text[] = N_(
+"Enter the name of the configuration file you wish to load.\n"
+"Accept the name shown to restore the configuration you\n"
+"last retrieved.  Leave blank to abort."),
+load_config_help[] = N_(
+"\n"
+"For various reasons, one may wish to keep several different kernel\n"
+"configurations available on a single machine.\n"
+"\n"
+"If you have saved a previous configuration in a file other than the\n"
+"kernel's default, entering the name of the file here will allow you\n"
+"to modify that configuration.\n"
+"\n"
+"If you are uncertain, then you have probably never used alternate\n"
+"configuration files.  You should therefor leave this blank to abort.\n"),
+save_config_text[] = N_(
+"Enter a filename to which this configuration should be saved\n"
+"as an alternate.  Leave blank to abort."),
+save_config_help[] = N_(
+"\n"
+"For various reasons, one may wish to keep different kernel\n"
+"configurations available on a single machine.\n"
+"\n"
+"Entering a file name here will allow you to later retrieve, modify\n"
+"and use the current configuration as an alternate to whatever\n"
+"configuration options you have selected at that time.\n"
+"\n"
+"If you are uncertain what all this means then you should probably\n"
+"leave this blank.\n"),
+search_help[] = N_(
+"\n"
+"Search for CONFIG_ symbols and display their relations.\n"
+"Regular expressions are allowed.\n"
+"Example: search for \"^FOO\"\n"
+"Result:\n"
+"-----------------------------------------------------------------\n"
+"Symbol: FOO [ = m]\n"
+"Prompt: Foo bus is used to drive the bar HW\n"
+"Defined at drivers/pci/Kconfig:47\n"
+"Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
+"Location:\n"
+"  -> Bus options (PCI, PCMCIA, EISA, MCA, ISA)\n"
+"    -> PCI support (PCI [ = y])\n"
+"      -> PCI access mode (<choice> [ = y])\n"
+"Selects: LIBCRC32\n"
+"Selected by: BAR\n"
+"-----------------------------------------------------------------\n"
+"o The line 'Prompt:' shows the text used in the menu structure for\n"
+"  this CONFIG_ symbol\n"
+"o The 'Defined at' line tell at what file / line number the symbol\n"
+"  is defined\n"
+"o The 'Depends on:' line tell what symbols needs to be defined for\n"
+"  this symbol to be visible in the menu (selectable)\n"
+"o The 'Location:' lines tell where in the menu structure this symbol\n"
+"  is located\n"
+"    A location followed by a [ = y] indicate that this is a selectable\n"
+"    menu item - and current value is displayed inside brackets.\n"
+"o The 'Selects:' line tell what symbol will be automatically\n"
+"  selected if this symbol is selected (y or m)\n"
+"o The 'Selected by' line tell what symbol has selected this symbol\n"
+"\n"
+"Only relevant lines are shown.\n"
+"\n\n"
+"Search examples:\n"
+"Examples: USB   = > find all CONFIG_ symbols containing USB\n"
+"          ^USB => find all CONFIG_ symbols starting with USB\n"
+"          USB$ => find all CONFIG_ symbols ending with USB\n"
+"\n");
+
+struct mitem {
+	char str[256];
+	char tag;
+	void *usrptr;
+	int is_hot;
+	int is_visible;
+};
+
+#define MAX_MENU_ITEMS 4096
+static int show_all_items;
+static int indent;
+static struct menu *current_menu;
+static int child_count;
+static int single_menu_mode;
+/* the window in which all information appears */
+static WINDOW *main_window;
+/* the largest size of the menu window */
+static int mwin_max_lines;
+static int mwin_max_cols;
+/* the window in which we show option buttons */
+static MENU *curses_menu;
+static ITEM *curses_menu_items[MAX_MENU_ITEMS];
+static struct mitem k_menu_items[MAX_MENU_ITEMS];
+static int items_num;
+static int global_exit;
+/* the currently selected button */
+const char *current_instructions = menu_instructions;
+/* this array is used to implement hot keys. it is updated in item_make and
+ * resetted in clean_items. It would be better to use a hash, but lets keep it
+ * simple... */
+#define MAX_SAME_KEY MAX_MENU_ITEMS
+struct {
+	int count;
+	int ptrs[MAX_MENU_ITEMS];
+} hotkeys[1<<(sizeof(char)*8)];
+
+static void conf(struct menu *menu);
+static void conf_choice(struct menu *menu);
+static void conf_string(struct menu *menu);
+static void conf_load(void);
+static void conf_save(void);
+static void show_help(struct menu *menu);
+static int do_exit(void);
+static void setup_windows(void);
+
+typedef void (*function_key_handler_t)(int *key, struct menu *menu);
+static void handle_f1(int *key, struct menu *current_item);
+static void handle_f2(int *key, struct menu *current_item);
+static void handle_f3(int *key, struct menu *current_item);
+static void handle_f4(int *key, struct menu *current_item);
+static void handle_f5(int *key, struct menu *current_item);
+static void handle_f6(int *key, struct menu *current_item);
+static void handle_f7(int *key, struct menu *current_item);
+static void handle_f8(int *key, struct menu *current_item);
+
+struct function_keys {
+	const char *key_str;
+	const char *func;
+	function_key key;
+	function_key_handler_t handler;
+};
+
+static const int function_keys_num = 8;
+struct function_keys function_keys[] = {
+	{
+		.key_str = "F1",
+		.func = "Help",
+		.key = F_HELP,
+		.handler = handle_f1,
+	},
+	{
+		.key_str = "F2",
+		.func = "Symbol Info",
+		.key = F_SYMBOL,
+		.handler = handle_f2,
+	},
+	{
+		.key_str = "F3",
+		.func = "Instructions",
+		.key = F_INSTS,
+		.handler = handle_f3,
+	},
+	{
+		.key_str = "F4",
+		.func = "Config",
+		.key = F_CONF,
+		.handler = handle_f4,
+	},
+	{
+		.key_str = "F5",
+		.func = "Back",
+		.key = F_BACK,
+		.handler = handle_f5,
+	},
+	{
+		.key_str = "F6",
+		.func = "Save",
+		.key = F_SAVE,
+		.handler = handle_f6,
+	},
+	{
+		.key_str = "F7",
+		.func = "Load",
+		.key = F_LOAD,
+		.handler = handle_f7,
+	},
+	{
+		.key_str = "F8",
+		.func = "Exit",
+		.key = F_EXIT,
+		.handler = handle_f8,
+	},
+};
+
+static void print_function_line(void)
+{
+	int i;
+	int offset = 1;
+	const int skip = 1;
+
+	for (i = 0; i < function_keys_num; i++) {
+		wattrset(main_window, attributes[FUNCTION_HIGHLIGHT]);
+		mvwprintw(main_window, LINES-3, offset,
+				"%s",
+				function_keys[i].key_str);
+		wattrset(main_window, attributes[FUNCTION_TEXT]);
+		offset += strlen(function_keys[i].key_str);
+		mvwprintw(main_window, LINES-3,
+				offset, "%s",
+				function_keys[i].func);
+		offset += strlen(function_keys[i].func) + skip;
+	}
+	wattrset(main_window, attributes[NORMAL]);
+}
+
+/* help */
+static void handle_f1(int *key, struct menu *current_item)
+{
+	show_scroll_win(main_window,
+			_("README"), _(nconf_readme));
+	return;
+}
+
+/* symbole help */
+static void handle_f2(int *key, struct menu *current_item)
+{
+	show_help(current_item);
+	return;
+}
+
+/* instructions */
+static void handle_f3(int *key, struct menu *current_item)
+{
+	show_scroll_win(main_window,
+			_("Instructions"),
+			_(current_instructions));
+	return;
+}
+
+/* config */
+static void handle_f4(int *key, struct menu *current_item)
+{
+	int res = btn_dialog(main_window,
+			_("Show all symbols?"),
+			2,
+			"   <Show All>   ",
+			"<Don't show all>");
+	if (res == 0)
+		show_all_items = 1;
+	else if (res == 1)
+		show_all_items = 0;
+
+	return;
+}
+
+/* back */
+static void handle_f5(int *key, struct menu *current_item)
+{
+	*key = KEY_LEFT;
+	return;
+}
+
+/* save */
+static void handle_f6(int *key, struct menu *current_item)
+{
+	conf_save();
+	return;
+}
+
+/* load */
+static void handle_f7(int *key, struct menu *current_item)
+{
+	conf_load();
+	return;
+}
+
+/* exit */
+static void handle_f8(int *key, struct menu *current_item)
+{
+	do_exit();
+	return;
+}
+
+/* return != 0 to indicate the key was handles */
+static int process_special_keys(int *key, struct menu *menu)
+{
+	int i;
+
+	if (*key == KEY_RESIZE) {
+		setup_windows();
+		return 1;
+	}
+
+	for (i = 0; i < function_keys_num; i++) {
+		if (*key == KEY_F(function_keys[i].key) ||
+		    *key == '0' + function_keys[i].key){
+			function_keys[i].handler(key, menu);
+			return 1;
+		}
+	}
+
+	return 0;
+}
+
+static void clean_items(void)
+{
+	int i;
+	for (i = 0; curses_menu_items[i]; i++)
+		free_item(curses_menu_items[i]);
+	bzero(curses_menu_items, sizeof(curses_menu_items));
+	bzero(k_menu_items, sizeof(k_menu_items));
+	bzero(hotkeys, sizeof(hotkeys));
+	items_num = 0;
+}
+
+/* return the index of the next hot item, or -1 if no such item exists */
+static int get_next_hot(int c)
+{
+	static int hot_index;
+	static int hot_char;
+
+	if (c < 0 || c > 255 || hotkeys[c].count <= 0)
+		return -1;
+
+	if (hot_char == c) {
+		hot_index = (hot_index+1)%hotkeys[c].count;
+		return hotkeys[c].ptrs[hot_index];
+	} else {
+		hot_char = c;
+		hot_index = 0;
+		return hotkeys[c].ptrs[0];
+	}
+}
+
+/* can the char c be a hot key? no, if c is a common shortcut used elsewhere */
+static int canbhot(char c)
+{
+	c = tolower(c);
+	return isalnum(c) && c != 'y' && c != 'm' && c != 'h' &&
+		c != 'n' && c != '?';
+}
+
+/* check if str already contains a hot key. */
+static int is_hot(int index)
+{
+	return k_menu_items[index].is_hot;
+}
+
+/* find the first possible hot key, and mark it.
+ * index is the index of the item in the menu
+ * return 0 on success*/
+static int make_hot(char *dest, int len, const char *org, int index)
+{
+	int position = -1;
+	int i;
+	int tmp;
+	int c;
+	int org_len = strlen(org);
+
+	if (org == NULL || is_hot(index))
+		return 1;
+
+	/* make sure not to make hot keys out of markers.
+	 * find where to start looking for a hot key
+	 */
+	i = 0;
+	/* skip white space */
+	while (i < org_len && org[i] == ' ')
+		i++;
+	if (i == org_len)
+		return -1;
+	/* if encountering '(' or '<' or '[', find the match and look from there
+	 **/
+	if (org[i] == '[' || org[i] == '<' || org[i] == '(') {
+		i++;
+		for (; i < org_len; i++)
+			if (org[i] == ']' || org[i] == '>' || org[i] == ')')
+				break;
+	}
+	if (i == org_len)
+		return -1;
+	for (; i < org_len; i++) {
+		if (canbhot(org[i]) && org[i-1] != '<' && org[i-1] != '(') {
+			position = i;
+			break;
+		}
+	}
+	if (position == -1)
+		return 1;
+
+	/* ok, char@org[position] should be a hot key to this item */
+	c = tolower(org[position]);
+	tmp = hotkeys[c].count;
+	hotkeys[c].ptrs[tmp] = index;
+	hotkeys[c].count++;
+	/*
+	   snprintf(dest, len, "%.*s(%c)%s", position, org, org[position],
+	   &org[position+1]);
+	   */
+	/* make org[position] uppercase, and all leading letter small case */
+	strncpy(dest, org, len);
+	for (i = 0; i < position; i++)
+		dest[i] = tolower(dest[i]);
+	dest[position] = toupper(dest[position]);
+	k_menu_items[index].is_hot = 1;
+	return 0;
+}
+
+/* Make a new item. Add a hotkey mark in the first possible letter.
+ * As ncurses does not allow any attributes inside menue item, we mark the
+ * hot key as the first capitalized letter in the string */
+static void item_make(struct menu *menu, char tag, const char *fmt, ...)
+{
+	va_list ap;
+	char tmp_str[256];
+
+	if (items_num > MAX_MENU_ITEMS-1)
+		return;
+
+	bzero(&k_menu_items[items_num], sizeof(k_menu_items[0]));
+	k_menu_items[items_num].tag = tag;
+	k_menu_items[items_num].usrptr = menu;
+	if (menu != NULL)
+		k_menu_items[items_num].is_visible =
+			menu_is_visible(menu);
+	else
+		k_menu_items[items_num].is_visible = 1;
+
+	va_start(ap, fmt);
+	vsnprintf(tmp_str, sizeof(tmp_str), fmt, ap);
+	if (!k_menu_items[items_num].is_visible)
+		memcpy(tmp_str, "XXX", 3);
+	va_end(ap);
+	if (make_hot(
+		k_menu_items[items_num].str,
+		sizeof(k_menu_items[items_num].str), tmp_str, items_num) != 0)
+		strncpy(k_menu_items[items_num].str,
+			tmp_str,
+			sizeof(k_menu_items[items_num].str));
+
+	curses_menu_items[items_num] = new_item(
+			k_menu_items[items_num].str,
+			k_menu_items[items_num].str);
+	set_item_userptr(curses_menu_items[items_num],
+			&k_menu_items[items_num]);
+	/*
+	if (!k_menu_items[items_num].is_visible)
+		item_opts_off(curses_menu_items[items_num], O_SELECTABLE);
+	*/
+
+	items_num++;
+	curses_menu_items[items_num] = NULL;
+}
+
+/* very hackish. adds a string to the last item added */
+static void item_add_str(const char *fmt, ...)
+{
+	va_list ap;
+	int index = items_num-1;
+	char new_str[256];
+	char tmp_str[256];
+
+	if (index < 0)
+		return;
+
+	va_start(ap, fmt);
+	vsnprintf(new_str, sizeof(new_str), fmt, ap);
+	va_end(ap);
+	snprintf(tmp_str, sizeof(tmp_str), "%s%s",
+			k_menu_items[index].str, new_str);
+	if (make_hot(k_menu_items[index].str,
+			sizeof(k_menu_items[index].str), tmp_str, index) != 0)
+		strncpy(k_menu_items[index].str,
+			tmp_str,
+			sizeof(k_menu_items[index].str));
+
+	free_item(curses_menu_items[index]);
+	curses_menu_items[index] = new_item(
+			k_menu_items[index].str,
+			k_menu_items[index].str);
+	set_item_userptr(curses_menu_items[index],
+			&k_menu_items[index]);
+}
+
+/* get the tag of the currently selected item */
+static char item_tag(void)
+{
+	ITEM *cur;
+	struct mitem *mcur;
+
+	cur = current_item(curses_menu);
+	if (cur == NULL)
+		return 0;
+	mcur = (struct mitem *) item_userptr(cur);
+	return mcur->tag;
+}
+
+static int curses_item_index(void)
+{
+	return  item_index(current_item(curses_menu));
+}
+
+static void *item_data(void)
+{
+	ITEM *cur;
+	struct mitem *mcur;
+
+	cur = current_item(curses_menu);
+	if (!cur)
+		return NULL;
+	mcur = (struct mitem *) item_userptr(cur);
+	return mcur->usrptr;
+
+}
+
+static int item_is_tag(char tag)
+{
+	return item_tag() == tag;
+}
+
+static char filename[PATH_MAX+1];
+static char menu_backtitle[PATH_MAX+128];
+static const char *set_config_filename(const char *config_filename)
+{
+	int size;
+	struct symbol *sym;
+
+	sym = sym_lookup("KERNELVERSION", 0);
+	sym_calc_value(sym);
+	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
+			_("%s - Linux Kernel v%s Configuration"),
+			config_filename, sym_get_string_value(sym));
+	if (size >= sizeof(menu_backtitle))
+		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
+
+	size = snprintf(filename, sizeof(filename), "%s", config_filename);
+	if (size >= sizeof(filename))
+		filename[sizeof(filename)-1] = '\0';
+	return menu_backtitle;
+}
+
+/* command = 0 is supress, 1 is restore */
+static void supress_stdout(int command)
+{
+	static FILE *org_stdout;
+	static FILE *org_stderr;
+
+	if (command == 0) {
+		org_stdout = stdout;
+		org_stderr = stderr;
+		stdout = fopen("/dev/null", "a");
+		stderr = fopen("/dev/null", "a");
+	} else {
+		fclose(stdout);
+		fclose(stderr);
+		stdout = org_stdout;
+		stderr = org_stderr;
+	}
+}
+
+/* return = 0 means we are successful.
+ * -1 means go on doing what you were doing
+ */
+static int do_exit(void)
+{
+	int res;
+	if (!conf_get_changed()) {
+		global_exit = 1;
+		return 0;
+	}
+	res = btn_dialog(main_window,
+			_("Do you wish to save your "
+				"new kernel configuration?\n"
+				"<ESC> to cancel and resume nconfig."),
+			2,
+			"   <save>   ",
+			"<don't save>");
+	if (res == KEY_EXIT) {
+		global_exit = 0;
+		return -1;
+	}
+
+	/* if we got here, the user really wants to exit */
+	switch (res) {
+	case 0:
+		supress_stdout(0);
+		res = conf_write(filename);
+		supress_stdout(1);
+		if (res)
+			btn_dialog(
+				main_window,
+				_("Error during writing of the kernel "
+				  "configuration.\n"
+				  "Your kernel configuration "
+				  "changes were NOT saved."),
+				  1,
+				  "<OK>");
+		else {
+			char buf[1024];
+			snprintf(buf, 1024,
+				_("Configuration written to %s\n"
+				  "End of Linux kernel configuration.\n"
+				  "Execute 'make' to build the kernel or try"
+				  " 'make help'."), filename);
+			btn_dialog(
+				main_window,
+				buf,
+				1,
+				"<OK>");
+		}
+		break;
+	default:
+		btn_dialog(
+			main_window,
+			_("Your kernel configuration changes were NOT saved."),
+			1,
+			"<OK>");
+		break;
+	}
+	global_exit = 1;
+	return 0;
+}
+
+
+static void search_conf(void)
+{
+	struct symbol **sym_arr;
+	struct gstr res;
+	char dialog_input_result[100];
+	char *dialog_input;
+	int dres;
+again:
+	dres = dialog_inputbox(main_window,
+			_("Search Configuration Parameter"),
+			_("Enter CONFIG_ (sub)string to search for "
+				"(with or without \"CONFIG\")"),
+			"", dialog_input_result, 99);
+	switch (dres) {
+	case 0:
+		break;
+	case 1:
+		show_scroll_win(main_window,
+				_("Search Configuration"), search_help);
+		goto again;
+	default:
+		return;
+	}
+
+	/* strip CONFIG_ if necessary */
+	dialog_input = dialog_input_result;
+	if (strncasecmp(dialog_input_result, "CONFIG_", 7) == 0)
+		dialog_input += 7;
+
+	sym_arr = sym_re_search(dialog_input);
+	res = get_relations_str(sym_arr);
+	free(sym_arr);
+	show_scroll_win(main_window,
+			_("Search Results"), str_get(&res));
+	str_free(&res);
+}
+
+
+static void build_conf(struct menu *menu)
+{
+	struct symbol *sym;
+	struct property *prop;
+	struct menu *child;
+	int type, tmp, doint = 2;
+	tristate val;
+	char ch;
+
+	if (!menu || (!show_all_items && !menu_is_visible(menu)))
+		return;
+
+	sym = menu->sym;
+	prop = menu->prompt;
+	if (!sym) {
+		if (prop && menu != current_menu) {
+			const char *prompt = menu_get_prompt(menu);
+			enum prop_type ptype;
+			ptype = menu->prompt ? menu->prompt->type : P_UNKNOWN;
+			switch (ptype) {
+			case P_MENU:
+				child_count++;
+				prompt = _(prompt);
+				if (single_menu_mode) {
+					item_make(menu, 'm',
+						"%s%*c%s",
+						menu->data ? "-->" : "++>",
+						indent + 1, ' ', prompt);
+				} else
+					item_make(menu, 'm',
+						"   %*c%s  --->",
+						indent + 1,
+						' ', prompt);
+
+				if (single_menu_mode && menu->data)
+					goto conf_childs;
+				return;
+			case P_COMMENT:
+				if (prompt) {
+					child_count++;
+					item_make(menu, ':',
+						"   %*c*** %s ***",
+						indent + 1, ' ',
+						_(prompt));
+				}
+				break;
+			default:
+				if (prompt) {
+					child_count++;
+					item_make(menu, ':', "---%*c%s",
+						indent + 1, ' ',
+						_(prompt));
+				}
+			}
+		} else
+			doint = 0;
+		goto conf_childs;
+	}
+
+	type = sym_get_type(sym);
+	if (sym_is_choice(sym)) {
+		struct symbol *def_sym = sym_get_choice_value(sym);
+		struct menu *def_menu = NULL;
+
+		child_count++;
+		for (child = menu->list; child; child = child->next) {
+			if (menu_is_visible(child) && child->sym == def_sym)
+				def_menu = child;
+		}
+
+		val = sym_get_tristate_value(sym);
+		if (sym_is_changable(sym)) {
+			switch (type) {
+			case S_BOOLEAN:
+				item_make(menu, 't', "[%c]",
+						val == no ? ' ' : '*');
+				break;
+			case S_TRISTATE:
+				switch (val) {
+				case yes:
+					ch = '*';
+					break;
+				case mod:
+					ch = 'M';
+					break;
+				default:
+					ch = ' ';
+					break;
+				}
+				item_make(menu, 't', "<%c>", ch);
+				break;
+			}
+		} else {
+			item_make(menu, def_menu ? 't' : ':', "   ");
+		}
+
+		item_add_str("%*c%s", indent + 1,
+				' ', _(menu_get_prompt(menu)));
+		if (val == yes) {
+			if (def_menu) {
+				item_add_str(" (%s)",
+					_(menu_get_prompt(def_menu)));
+				item_add_str("  --->");
+				if (def_menu->list) {
+					indent += 2;
+					build_conf(def_menu);
+					indent -= 2;
+				}
+			}
+			return;
+		}
+	} else {
+		if (menu == current_menu) {
+			item_make(menu, ':',
+				"---%*c%s", indent + 1,
+				' ', _(menu_get_prompt(menu)));
+			goto conf_childs;
+		}
+		child_count++;
+		val = sym_get_tristate_value(sym);
+		if (sym_is_choice_value(sym) && val == yes) {
+			item_make(menu, ':', "   ");
+		} else {
+			switch (type) {
+			case S_BOOLEAN:
+				if (sym_is_changable(sym))
+					item_make(menu, 't', "[%c]",
+						val == no ? ' ' : '*');
+				else
+					item_make(menu, 't', "-%c-",
+						val == no ? ' ' : '*');
+				break;
+			case S_TRISTATE:
+				switch (val) {
+				case yes:
+					ch = '*';
+					break;
+				case mod:
+					ch = 'M';
+					break;
+				default:
+					ch = ' ';
+					break;
+				}
+				if (sym_is_changable(sym)) {
+					if (sym->rev_dep.tri == mod)
+						item_make(menu,
+							't', "{%c}", ch);
+					else
+						item_make(menu,
+							't', "<%c>", ch);
+				} else
+					item_make(menu, 't', "-%c-", ch);
+				break;
+			default:
+				tmp = 2 + strlen(sym_get_string_value(sym));
+				item_make(menu, 's', "    (%s)",
+						sym_get_string_value(sym));
+				tmp = indent - tmp + 4;
+				if (tmp < 0)
+					tmp = 0;
+				item_add_str("%*c%s%s", tmp, ' ',
+						_(menu_get_prompt(menu)),
+						(sym_has_value(sym) ||
+						 !sym_is_changable(sym)) ? "" :
+						_(" (NEW)"));
+				goto conf_childs;
+			}
+		}
+		item_add_str("%*c%s%s", indent + 1, ' ',
+				_(menu_get_prompt(menu)),
+				(sym_has_value(sym) || !sym_is_changable(sym)) ?
+				"" : _(" (NEW)"));
+		if (menu->prompt && menu->prompt->type == P_MENU) {
+			item_add_str("  --->");
+			return;
+		}
+	}
+
+conf_childs:
+	indent += doint;
+	for (child = menu->list; child; child = child->next)
+		build_conf(child);
+	indent -= doint;
+}
+
+static void reset_menu(void)
+{
+	unpost_menu(curses_menu);
+	clean_items();
+}
+
+/* adjust the menu to show this item.
+ * prefer not to scroll the menu if possible*/
+static void center_item(int selected_index, int *last_top_row)
+{
+	int toprow;
+	int maxy, maxx;
+
+	scale_menu(curses_menu, &maxy, &maxx);
+	set_top_row(curses_menu, *last_top_row);
+	toprow = top_row(curses_menu);
+	if (selected_index >= toprow && selected_index < toprow+maxy) {
+		/* we can only move the selected item. no need to scroll */
+		set_current_item(curses_menu,
+				curses_menu_items[selected_index]);
+	} else {
+		toprow = max(selected_index-maxy/2, 0);
+		if (toprow >= item_count(curses_menu)-maxy)
+			toprow = item_count(curses_menu)-mwin_max_lines;
+		set_top_row(curses_menu, toprow);
+		set_current_item(curses_menu,
+				curses_menu_items[selected_index]);
+	}
+	*last_top_row = toprow;
+	post_menu(curses_menu);
+	refresh_all_windows(main_window);
+}
+
+/* this function assumes reset_menu has been called before */
+static void show_menu(const char *prompt, const char *instructions,
+		int selected_index, int *last_top_row)
+{
+	int maxx, maxy;
+	WINDOW *menu_window;
+
+	current_instructions = instructions;
+
+	clear();
+	wattrset(main_window, attributes[NORMAL]);
+	print_in_middle(stdscr, 1, 0, COLS,
+			menu_backtitle,
+			attributes[MAIN_HEADING]);
+
+	wattrset(main_window, attributes[MAIN_MENU_BOX]);
+	box(main_window, 0, 0);
+	wattrset(main_window, attributes[MAIN_MENU_HEADING]);
+	mvwprintw(main_window, 0, 3, " %s ", prompt);
+	wattrset(main_window, attributes[NORMAL]);
+
+	set_menu_items(curses_menu, curses_menu_items);
+
+	/* position the menu at the middle of the screen */
+	scale_menu(curses_menu, &maxy, &maxx);
+	maxx = min(maxx, mwin_max_cols-2);
+	maxy = mwin_max_lines-2;
+	menu_window = derwin(main_window,
+			maxy,
+			maxx,
+			2,
+			(mwin_max_cols-maxx)/2);
+	keypad(menu_window, TRUE);
+	set_menu_win(curses_menu, menu_window);
+	set_menu_sub(curses_menu, menu_window);
+
+	/* must reassert this after changing items, otherwise returns to a
+	 * default of 16
+	 */
+	set_menu_format(curses_menu, maxy, 1);
+	center_item(selected_index, last_top_row);
+	set_menu_format(curses_menu, maxy, 1);
+
+	print_function_line();
+
+	/* Post the menu */
+	post_menu(curses_menu);
+	refresh_all_windows(main_window);
+}
+
+
+static void conf(struct menu *menu)
+{
+	char pattern[256];
+	struct menu *submenu = 0;
+	const char *prompt = menu_get_prompt(menu);
+	struct symbol *sym;
+	struct menu *active_menu = NULL;
+	int res;
+	int current_index = 0;
+	int last_top_row = 0;
+
+	bzero(pattern, sizeof(pattern));
+
+	while (!global_exit) {
+		reset_menu();
+		current_menu = menu;
+		build_conf(menu);
+		if (!child_count)
+			break;
+
+		show_menu(prompt ? _(prompt) : _("Main Menu"),
+				_(menu_instructions),
+				current_index, &last_top_row);
+		keypad((menu_win(curses_menu)), TRUE);
+		while (!global_exit && (res = wgetch(menu_win(curses_menu)))) {
+			if (process_special_keys(&res,
+						(struct menu *) item_data()))
+				break;
+			switch (res) {
+			case KEY_DOWN:
+				menu_driver(curses_menu, REQ_DOWN_ITEM);
+				break;
+			case KEY_UP:
+				menu_driver(curses_menu, REQ_UP_ITEM);
+				break;
+			case KEY_NPAGE:
+				menu_driver(curses_menu, REQ_SCR_DPAGE);
+				break;
+			case KEY_PPAGE:
+				menu_driver(curses_menu, REQ_SCR_UPAGE);
+				break;
+			case KEY_HOME:
+				menu_driver(curses_menu, REQ_FIRST_ITEM);
+				break;
+			case KEY_END:
+				menu_driver(curses_menu, REQ_LAST_ITEM);
+				break;
+			case 'h':
+			case '?':
+				show_help((struct menu *) item_data());
+				break;
+			}
+			if (res == 10 || res == 27 ||
+				res == 32 || res == 'n' || res == 'y' ||
+				res == KEY_LEFT || res == KEY_RIGHT ||
+				res == 'm' || res == '/')
+				break;
+			else if (canbhot(res)) {
+				/* check for hot keys: */
+				int tmp = get_next_hot(res);
+				if (tmp != -1)
+					center_item(tmp, &last_top_row);
+			}
+			refresh_all_windows(main_window);
+		}
+
+		refresh_all_windows(main_window);
+		/* if ESC  or left*/
+		if (res == 27 || (menu != &rootmenu && res == KEY_LEFT))
+			break;
+
+		/* remember location in the menu */
+		last_top_row = top_row(curses_menu);
+		current_index = curses_item_index();
+
+		if (!item_tag())
+			continue;
+
+		submenu = (struct menu *) item_data();
+		active_menu = (struct menu *)item_data();
+		if (!submenu || !menu_is_visible(submenu))
+			continue;
+		if (submenu)
+			sym = submenu->sym;
+		else
+			sym = NULL;
+
+		switch (res) {
+		case ' ':
+			if (item_is_tag('t'))
+				sym_toggle_tristate_value(sym);
+			else if (item_is_tag('m'))
+				conf(submenu);
+			break;
+		case KEY_RIGHT:
+		case 10: /* ENTER WAS PRESSED */
+			switch (item_tag()) {
+			case 'm':
+				if (single_menu_mode)
+					submenu->data =
+						(void *) (long) !submenu->data;
+				else
+					conf(submenu);
+				break;
+			case 't':
+				if (sym_is_choice(sym) &&
+				    sym_get_tristate_value(sym) == yes)
+					conf_choice(submenu);
+				else if (submenu->prompt &&
+					 submenu->prompt->type == P_MENU)
+					conf(submenu);
+				else if (res == 10)
+					sym_toggle_tristate_value(sym);
+				break;
+			case 's':
+				conf_string(submenu);
+				break;
+			}
+			break;
+		case 'y':
+			if (item_is_tag('t')) {
+				if (sym_set_tristate_value(sym, yes))
+					break;
+				if (sym_set_tristate_value(sym, mod))
+					btn_dialog(main_window, setmod_text, 0);
+			}
+			break;
+		case 'n':
+			if (item_is_tag('t'))
+				sym_set_tristate_value(sym, no);
+			break;
+		case 'm':
+			if (item_is_tag('t'))
+				sym_set_tristate_value(sym, mod);
+			break;
+		case '/':
+			search_conf();
+			break;
+		}
+	}
+}
+
+static void show_help(struct menu *menu)
+{
+	struct gstr help = str_new();
+
+	if (menu && menu->sym && menu_has_help(menu)) {
+		if (menu->sym->name) {
+			str_printf(&help, "CONFIG_%s:\n\n", menu->sym->name);
+			str_append(&help, _(menu_get_help(menu)));
+			str_append(&help, "\n");
+			get_symbol_str(&help, menu->sym);
+		}
+	} else {
+		str_append(&help, nohelp_text);
+	}
+	show_scroll_win(main_window, _(menu_get_prompt(menu)), str_get(&help));
+	str_free(&help);
+}
+
+static void conf_choice(struct menu *menu)
+{
+	const char *prompt = _(menu_get_prompt(menu));
+	struct menu *child = 0;
+	struct symbol *active;
+	int selected_index = 0;
+	int last_top_row = 0;
+	int res, i = 0;
+
+	active = sym_get_choice_value(menu->sym);
+	/* this is mostly duplicated from the conf() function. */
+	while (!global_exit) {
+		reset_menu();
+
+		for (i = 0, child = menu->list; child; child = child->next) {
+			if (!show_all_items && !menu_is_visible(child))
+				continue;
+
+			if (child->sym == sym_get_choice_value(menu->sym))
+				item_make(child, ':', "<X> %s",
+						_(menu_get_prompt(child)));
+			else
+				item_make(child, ':', "    %s",
+						_(menu_get_prompt(child)));
+			if (child->sym == active){
+				last_top_row = top_row(curses_menu);
+				selected_index = i;
+			}
+			i++;
+		}
+		show_menu(prompt ? _(prompt) : _("Choice Menu"),
+				_(radiolist_instructions),
+				selected_index,
+				&last_top_row);
+		while (!global_exit && (res = wgetch(menu_win(curses_menu)))) {
+			if (process_special_keys(
+						&res,
+						(struct menu *) item_data()))
+				break;
+			switch (res) {
+			case KEY_DOWN:
+				menu_driver(curses_menu, REQ_DOWN_ITEM);
+				break;
+			case KEY_UP:
+				menu_driver(curses_menu, REQ_UP_ITEM);
+				break;
+			case KEY_NPAGE:
+				menu_driver(curses_menu, REQ_SCR_DPAGE);
+				break;
+			case KEY_PPAGE:
+				menu_driver(curses_menu, REQ_SCR_UPAGE);
+				break;
+			case KEY_HOME:
+				menu_driver(curses_menu, REQ_FIRST_ITEM);
+				break;
+			case KEY_END:
+				menu_driver(curses_menu, REQ_LAST_ITEM);
+				break;
+			case 'h':
+			case '?':
+				show_help((struct menu *) item_data());
+				break;
+			}
+			if (res == 10 || res == 27 || res == ' ' ||
+				res == KEY_LEFT)
+				break;
+			else if (canbhot(res)) {
+				/* check for hot keys: */
+				int tmp = get_next_hot(res);
+				if (tmp != -1)
+					center_item(tmp, &last_top_row);
+			}
+			refresh_all_windows(main_window);
+		}
+		/* if ESC or left */
+		if (res == 27 || res == KEY_LEFT)
+			break;
+
+		child = item_data();
+		if (!child || !menu_is_visible(child))
+			continue;
+		switch (res) {
+		case ' ':
+		case  10:
+		case KEY_RIGHT:
+			sym_set_tristate_value(child->sym, yes);
+			return;
+		case 'h':
+		case '?':
+			show_help(child);
+			active = child->sym;
+			break;
+		case KEY_EXIT:
+			return;
+		}
+	}
+}
+
+static void conf_string(struct menu *menu)
+{
+	const char *prompt = menu_get_prompt(menu);
+	char dialog_input_result[256];
+
+	while (1) {
+		int res;
+		const char *heading;
+
+		switch (sym_get_type(menu->sym)) {
+		case S_INT:
+			heading = _(inputbox_instructions_int);
+			break;
+		case S_HEX:
+			heading = _(inputbox_instructions_hex);
+			break;
+		case S_STRING:
+			heading = _(inputbox_instructions_string);
+			break;
+		default:
+			heading = _("Internal nconf error!");
+		}
+		res = dialog_inputbox(main_window,
+				prompt ? _(prompt) : _("Main Menu"),
+				heading,
+				sym_get_string_value(menu->sym),
+				dialog_input_result,
+				sizeof(dialog_input_result));
+		switch (res) {
+		case 0:
+			if (sym_set_string_value(menu->sym,
+						dialog_input_result))
+				return;
+			btn_dialog(main_window,
+				_("You have made an invalid entry."), 0);
+			break;
+		case 1:
+			show_help(menu);
+			break;
+		case KEY_EXIT:
+			return;
+		}
+	}
+}
+
+static void conf_load(void)
+{
+	char dialog_input_result[256];
+	while (1) {
+		int res;
+		res = dialog_inputbox(main_window,
+				NULL, load_config_text,
+				filename,
+				dialog_input_result,
+				sizeof(dialog_input_result));
+		switch (res) {
+		case 0:
+			if (!dialog_input_result[0])
+				return;
+			if (!conf_read(dialog_input_result)) {
+				set_config_filename(dialog_input_result);
+				sym_set_change_count(1);
+				return;
+			}
+			btn_dialog(main_window, _("File does not exist!"), 0);
+			break;
+		case 1:
+			show_scroll_win(main_window,
+					_("Load Alternate Configuration"),
+					load_config_help);
+			break;
+		case KEY_EXIT:
+			return;
+		}
+	}
+}
+
+static void conf_save(void)
+{
+	char dialog_input_result[256];
+	while (1) {
+		int res;
+		res = dialog_inputbox(main_window,
+				NULL, save_config_text,
+				filename,
+				dialog_input_result,
+				sizeof(dialog_input_result));
+		switch (res) {
+		case 0:
+			if (!dialog_input_result[0])
+				return;
+			supress_stdout(0);
+			res = conf_write(dialog_input_result);
+			supress_stdout(1);
+			if (!res) {
+				char buf[1024];
+				sprintf(buf, "%s %s",
+					_("configuration file saved to: "),
+					dialog_input_result);
+				btn_dialog(main_window,
+					   buf, 1, "<OK>");
+				set_config_filename(dialog_input_result);
+				return;
+			}
+			btn_dialog(main_window, _("Can't create file! "
+				"Probably a nonexistent directory."),
+				1, "<OK>");
+			break;
+		case 1:
+			show_scroll_win(main_window,
+				_("Save Alternate Configuration"),
+				save_config_help);
+			break;
+		case KEY_EXIT:
+			return;
+		}
+	}
+}
+
+void setup_windows(void)
+{
+	if (main_window != NULL)
+		delwin(main_window);
+
+	/* set up the menu and menu window */
+	main_window = newwin(LINES-2, COLS-2, 2, 1);
+	keypad(main_window, TRUE);
+	mwin_max_lines = LINES-6;
+	mwin_max_cols = COLS-6;
+
+	/* panels order is from bottom to top */
+	new_panel(main_window);
+}
+
+int main(int ac, char **av)
+{
+	char *mode;
+
+	setlocale(LC_ALL, "");
+	bindtextdomain(PACKAGE, LOCALEDIR);
+	textdomain(PACKAGE);
+
+	conf_parse(av[1]);
+	conf_read(NULL);
+
+	mode = getenv("NCONFIG_MODE");
+	if (mode) {
+		if (!strcasecmp(mode, "single_menu"))
+			single_menu_mode = 1;
+	}
+
+	/* Initialize curses */
+	initscr();
+	/* set color theme */
+	set_colors();
+
+	cbreak();
+	noecho();
+	keypad(stdscr, TRUE);
+	curs_set(0);
+
+	if (COLS < 75 || LINES < 20) {
+		endwin();
+		printf("Your terminal should have at "
+			"least 20 lines and 75 columns\n");
+		return 1;
+	}
+
+	notimeout(stdscr, FALSE);
+	ESCDELAY = 1;
+
+	/* set btns menu */
+	curses_menu = new_menu(curses_menu_items);
+	menu_opts_off(curses_menu, O_SHOWDESC);
+	menu_opts_off(curses_menu, O_SHOWMATCH);
+	menu_opts_on(curses_menu, O_ONEVALUE);
+	menu_opts_on(curses_menu, O_NONCYCLIC);
+	set_menu_mark(curses_menu, " ");
+	set_menu_fore(curses_menu, attributes[MAIN_MENU_FORE]);
+	set_menu_back(curses_menu, attributes[MAIN_MENU_BACK]);
+	set_menu_grey(curses_menu, attributes[MAIN_MENU_GREY]);
+
+	set_config_filename(conf_get_configname());
+	setup_windows();
+
+	/* check for KEY_FUNC(1) */
+	if (has_key(KEY_F(1)) == FALSE) {
+		show_scroll_win(main_window,
+				_("Instructions"),
+				_(menu_no_f_instructions));
+	}
+
+
+
+	/* do the work */
+	while (!global_exit) {
+		conf(&rootmenu);
+		if (!global_exit && do_exit() == 0)
+			break;
+	}
+	/* ok, we are done */
+	unpost_menu(curses_menu);
+	free_menu(curses_menu);
+	delwin(main_window);
+	clear();
+	refresh();
+	endwin();
+	return 0;
+}
+
diff --git a/package/config/nconf.gui.c b/package/config/nconf.gui.c
new file mode 100644
index 0000000..a9d9344
--- /dev/null
+++ b/package/config/nconf.gui.c
@@ -0,0 +1,617 @@
+/*
+ * Copyright (C) 2008 Nir Tzachar <nir.tzachar@gmail.com?
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ * Derived from menuconfig.
+ *
+ */
+#include "nconf.h"
+
+/* a list of all the different widgets we use */
+attributes_t attributes[ATTR_MAX+1] = {0};
+
+/* available colors:
+   COLOR_BLACK   0
+   COLOR_RED     1
+   COLOR_GREEN   2
+   COLOR_YELLOW  3
+   COLOR_BLUE    4
+   COLOR_MAGENTA 5
+   COLOR_CYAN    6
+   COLOR_WHITE   7
+   */
+static void set_normal_colors(void)
+{
+	init_pair(NORMAL, -1, -1);
+	init_pair(MAIN_HEADING, COLOR_MAGENTA, -1);
+
+	/* FORE is for the selected item */
+	init_pair(MAIN_MENU_FORE, -1, -1);
+	/* BACK for all the rest */
+	init_pair(MAIN_MENU_BACK, -1, -1);
+	init_pair(MAIN_MENU_GREY, -1, -1);
+	init_pair(MAIN_MENU_HEADING, COLOR_GREEN, -1);
+	init_pair(MAIN_MENU_BOX, COLOR_YELLOW, -1);
+
+	init_pair(SCROLLWIN_TEXT, -1, -1);
+	init_pair(SCROLLWIN_HEADING, COLOR_GREEN, -1);
+	init_pair(SCROLLWIN_BOX, COLOR_YELLOW, -1);
+
+	init_pair(DIALOG_TEXT, -1, -1);
+	init_pair(DIALOG_BOX, COLOR_YELLOW, -1);
+	init_pair(DIALOG_MENU_BACK, COLOR_YELLOW, -1);
+	init_pair(DIALOG_MENU_FORE, COLOR_RED, -1);
+
+	init_pair(INPUT_BOX, COLOR_YELLOW, -1);
+	init_pair(INPUT_HEADING, COLOR_GREEN, -1);
+	init_pair(INPUT_TEXT, -1, -1);
+	init_pair(INPUT_FIELD, -1, -1);
+
+	init_pair(FUNCTION_HIGHLIGHT, -1, -1);
+	init_pair(FUNCTION_TEXT, COLOR_BLUE, -1);
+}
+
+/* available attributes:
+   A_NORMAL        Normal display (no highlight)
+   A_STANDOUT      Best highlighting mode of the terminal.
+   A_UNDERLINE     Underlining
+   A_REVERSE       Reverse video
+   A_BLINK         Blinking
+   A_DIM           Half bright
+   A_BOLD          Extra bright or bold
+   A_PROTECT       Protected mode
+   A_INVIS         Invisible or blank mode
+   A_ALTCHARSET    Alternate character set
+   A_CHARTEXT      Bit-mask to extract a character
+   COLOR_PAIR(n)   Color-pair number n
+   */
+static void normal_color_theme(void)
+{
+	/* automatically add color... */
+#define mkattr(name, attr) do { \
+attributes[name] = attr | COLOR_PAIR(name); } while (0)
+	mkattr(NORMAL, NORMAL);
+	mkattr(MAIN_HEADING, A_BOLD | A_UNDERLINE);
+
+	mkattr(MAIN_MENU_FORE, A_REVERSE);
+	mkattr(MAIN_MENU_BACK, A_NORMAL);
+	mkattr(MAIN_MENU_GREY, A_NORMAL);
+	mkattr(MAIN_MENU_HEADING, A_BOLD);
+	mkattr(MAIN_MENU_BOX, A_NORMAL);
+
+	mkattr(SCROLLWIN_TEXT, A_NORMAL);
+	mkattr(SCROLLWIN_HEADING, A_BOLD);
+	mkattr(SCROLLWIN_BOX, A_BOLD);
+
+	mkattr(DIALOG_TEXT, A_BOLD);
+	mkattr(DIALOG_BOX, A_BOLD);
+	mkattr(DIALOG_MENU_FORE, A_STANDOUT);
+	mkattr(DIALOG_MENU_BACK, A_NORMAL);
+
+	mkattr(INPUT_BOX, A_NORMAL);
+	mkattr(INPUT_HEADING, A_BOLD);
+	mkattr(INPUT_TEXT, A_NORMAL);
+	mkattr(INPUT_FIELD, A_UNDERLINE);
+
+	mkattr(FUNCTION_HIGHLIGHT, A_BOLD);
+	mkattr(FUNCTION_TEXT, A_REVERSE);
+}
+
+static void no_colors_theme(void)
+{
+	/* automatically add highlight, no color */
+#define mkattrn(name, attr) { attributes[name] = attr; }
+
+	mkattrn(NORMAL, NORMAL);
+	mkattrn(MAIN_HEADING, A_BOLD | A_UNDERLINE);
+
+	mkattrn(MAIN_MENU_FORE, A_STANDOUT);
+	mkattrn(MAIN_MENU_BACK, A_NORMAL);
+	mkattrn(MAIN_MENU_GREY, A_NORMAL);
+	mkattrn(MAIN_MENU_HEADING, A_BOLD);
+	mkattrn(MAIN_MENU_BOX, A_NORMAL);
+
+	mkattrn(SCROLLWIN_TEXT, A_NORMAL);
+	mkattrn(SCROLLWIN_HEADING, A_BOLD);
+	mkattrn(SCROLLWIN_BOX, A_BOLD);
+
+	mkattrn(DIALOG_TEXT, A_NORMAL);
+	mkattrn(DIALOG_BOX, A_BOLD);
+	mkattrn(DIALOG_MENU_FORE, A_STANDOUT);
+	mkattrn(DIALOG_MENU_BACK, A_NORMAL);
+
+	mkattrn(INPUT_BOX, A_BOLD);
+	mkattrn(INPUT_HEADING, A_BOLD);
+	mkattrn(INPUT_TEXT, A_NORMAL);
+	mkattrn(INPUT_FIELD, A_UNDERLINE);
+
+	mkattrn(FUNCTION_HIGHLIGHT, A_BOLD);
+	mkattrn(FUNCTION_TEXT, A_REVERSE);
+}
+
+void set_colors()
+{
+	start_color();
+	use_default_colors();
+	set_normal_colors();
+	if (has_colors()) {
+		normal_color_theme();
+	} else {
+		/* give deafults */
+		no_colors_theme();
+	}
+}
+
+
+/* this changes the windows attributes !!! */
+void print_in_middle(WINDOW *win,
+		int starty,
+		int startx,
+		int width,
+		const char *string,
+		chtype color)
+{      int length, x, y;
+	float temp;
+
+
+	if (win == NULL)
+		win = stdscr;
+	getyx(win, y, x);
+	if (startx != 0)
+		x = startx;
+	if (starty != 0)
+		y = starty;
+	if (width == 0)
+		width = 80;
+
+	length = strlen(string);
+	temp = (width - length) / 2;
+	x = startx + (int)temp;
+	wattrset(win, color);
+	mvwprintw(win, y, x, "%s", string);
+	refresh();
+}
+
+int get_line_no(const char *text)
+{
+	int i;
+	int total = 1;
+
+	if (!text)
+		return 0;
+
+	for (i = 0; text[i] != '\0'; i++)
+		if (text[i] == '\n')
+			total++;
+	return total;
+}
+
+const char *get_line(const char *text, int line_no)
+{
+	int i;
+	int lines = 0;
+
+	if (!text)
+		return 0;
+
+	for (i = 0; text[i] != '\0' && lines < line_no; i++)
+		if (text[i] == '\n')
+			lines++;
+	return text+i;
+}
+
+int get_line_length(const char *line)
+{
+	int res = 0;
+	while (*line != '\0' && *line != '\n') {
+		line++;
+		res++;
+	}
+	return res;
+}
+
+/* print all lines to the window. */
+void fill_window(WINDOW *win, const char *text)
+{
+	int x, y;
+	int total_lines = get_line_no(text);
+	int i;
+
+	getmaxyx(win, y, x);
+	/* do not go over end of line */
+	total_lines = min(total_lines, y);
+	for (i = 0; i < total_lines; i++) {
+		char tmp[x+10];
+		const char *line = get_line(text, i);
+		int len = get_line_length(line);
+		strncpy(tmp, line, min(len, x));
+		tmp[len] = '\0';
+		mvwprintw(win, i, 0, "%s", tmp);
+	}
+}
+
+/* get the message, and buttons.
+ * each button must be a char*
+ * return the selected button
+ *
+ * this dialog is used for 2 different things:
+ * 1) show a text box, no buttons.
+ * 2) show a dialog, with horizontal buttons
+ */
+int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
+{
+	va_list ap;
+	char *btn;
+	int btns_width = 0;
+	int msg_lines = 0;
+	int msg_width = 0;
+	int total_width;
+	int win_rows = 0;
+	WINDOW *win;
+	WINDOW *msg_win;
+	WINDOW *menu_win;
+	MENU *menu;
+	ITEM *btns[btn_num+1];
+	int i, x, y;
+	int res = -1;
+
+
+	va_start(ap, btn_num);
+	for (i = 0; i < btn_num; i++) {
+		btn = va_arg(ap, char *);
+		btns[i] = new_item(btn, "");
+		btns_width += strlen(btn)+1;
+	}
+	va_end(ap);
+	btns[btn_num] = NULL;
+
+	/* find the widest line of msg: */
+	msg_lines = get_line_no(msg);
+	for (i = 0; i < msg_lines; i++) {
+		const char *line = get_line(msg, i);
+		int len = get_line_length(line);
+		if (msg_width < len)
+			msg_width = len;
+	}
+
+	total_width = max(msg_width, btns_width);
+	/* place dialog in middle of screen */
+	y = (LINES-(msg_lines+4))/2;
+	x = (COLS-(total_width+4))/2;
+
+
+	/* create the windows */
+	if (btn_num > 0)
+		win_rows = msg_lines+4;
+	else
+		win_rows = msg_lines+2;
+
+	win = newwin(win_rows, total_width+4, y, x);
+	keypad(win, TRUE);
+	menu_win = derwin(win, 1, btns_width, win_rows-2,
+			1+(total_width+2-btns_width)/2);
+	menu = new_menu(btns);
+	msg_win = derwin(win, win_rows-2, msg_width, 1,
+			1+(total_width+2-msg_width)/2);
+
+	set_menu_fore(menu, attributes[DIALOG_MENU_FORE]);
+	set_menu_back(menu, attributes[DIALOG_MENU_BACK]);
+
+	wattrset(win, attributes[DIALOG_BOX]);
+	box(win, 0, 0);
+
+	/* print message */
+	wattrset(msg_win, attributes[DIALOG_TEXT]);
+	fill_window(msg_win, msg);
+
+	set_menu_win(menu, win);
+	set_menu_sub(menu, menu_win);
+	set_menu_format(menu, 1, btn_num);
+	menu_opts_off(menu, O_SHOWDESC);
+	menu_opts_off(menu, O_SHOWMATCH);
+	menu_opts_on(menu, O_ONEVALUE);
+	menu_opts_on(menu, O_NONCYCLIC);
+	set_menu_mark(menu, "");
+	post_menu(menu);
+
+
+	touchwin(win);
+	refresh_all_windows(main_window);
+	while ((res = wgetch(win))) {
+		switch (res) {
+		case KEY_LEFT:
+			menu_driver(menu, REQ_LEFT_ITEM);
+			break;
+		case KEY_RIGHT:
+			menu_driver(menu, REQ_RIGHT_ITEM);
+			break;
+		case 10: /* ENTER */
+		case 27: /* ESCAPE */
+		case ' ':
+		case KEY_F(F_BACK):
+		case KEY_F(F_EXIT):
+			break;
+		}
+		touchwin(win);
+		refresh_all_windows(main_window);
+
+		if (res == 10 || res == ' ') {
+			res = item_index(current_item(menu));
+			break;
+		} else if (res == 27 || res == KEY_F(F_BACK) ||
+				res == KEY_F(F_EXIT)) {
+			res = KEY_EXIT;
+			break;
+		}
+	}
+
+	unpost_menu(menu);
+	free_menu(menu);
+	for (i = 0; i < btn_num; i++)
+		free_item(btns[i]);
+
+	delwin(win);
+	return res;
+}
+
+int dialog_inputbox(WINDOW *main_window,
+		const char *title, const char *prompt,
+		const char *init, char *result, int result_len)
+{
+	int prompt_lines = 0;
+	int prompt_width = 0;
+	WINDOW *win;
+	WINDOW *prompt_win;
+	WINDOW *form_win;
+	PANEL *panel;
+	int i, x, y;
+	int res = -1;
+	int cursor_position = strlen(init);
+
+
+	/* find the widest line of msg: */
+	prompt_lines = get_line_no(prompt);
+	for (i = 0; i < prompt_lines; i++) {
+		const char *line = get_line(prompt, i);
+		int len = get_line_length(line);
+		prompt_width = max(prompt_width, len);
+	}
+
+	if (title)
+		prompt_width = max(prompt_width, strlen(title));
+
+	/* place dialog in middle of screen */
+	y = (LINES-(prompt_lines+4))/2;
+	x = (COLS-(prompt_width+4))/2;
+
+	strncpy(result, init, result_len);
+
+	/* create the windows */
+	win = newwin(prompt_lines+6, prompt_width+7, y, x);
+	prompt_win = derwin(win, prompt_lines+1, prompt_width, 2, 2);
+	form_win = derwin(win, 1, prompt_width, prompt_lines+3, 2);
+	keypad(form_win, TRUE);
+
+	wattrset(form_win, attributes[INPUT_FIELD]);
+
+	wattrset(win, attributes[INPUT_BOX]);
+	box(win, 0, 0);
+	wattrset(win, attributes[INPUT_HEADING]);
+	if (title)
+		mvwprintw(win, 0, 3, "%s", title);
+
+	/* print message */
+	wattrset(prompt_win, attributes[INPUT_TEXT]);
+	fill_window(prompt_win, prompt);
+
+	mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
+	mvwprintw(form_win, 0, 0, "%s", result);
+
+	/* create panels */
+	panel = new_panel(win);
+
+	/* show the cursor */
+	curs_set(1);
+
+	touchwin(win);
+	refresh_all_windows(main_window);
+	while ((res = wgetch(form_win))) {
+		int len = strlen(result);
+		switch (res) {
+		case 10: /* ENTER */
+		case 27: /* ESCAPE */
+		case KEY_F(F_HELP):
+		case KEY_F(F_EXIT):
+		case KEY_F(F_BACK):
+			break;
+		case 127:
+		case KEY_BACKSPACE:
+			if (cursor_position > 0) {
+				memmove(&result[cursor_position-1],
+						&result[cursor_position],
+						len-cursor_position+1);
+				cursor_position--;
+			}
+			break;
+		case KEY_DC:
+			if (cursor_position >= 0 && cursor_position < len) {
+				memmove(&result[cursor_position],
+						&result[cursor_position+1],
+						len-cursor_position+1);
+			}
+			break;
+		case KEY_UP:
+		case KEY_RIGHT:
+			if (cursor_position < len &&
+			    cursor_position < min(result_len, prompt_width))
+				cursor_position++;
+			break;
+		case KEY_DOWN:
+		case KEY_LEFT:
+			if (cursor_position > 0)
+				cursor_position--;
+			break;
+		default:
+			if ((isgraph(res) || isspace(res)) &&
+					len-2 < result_len) {
+				/* insert the char@the proper position */
+				memmove(&result[cursor_position+1],
+						&result[cursor_position],
+						len+1);
+				result[cursor_position] = res;
+				cursor_position++;
+			} else {
+				mvprintw(0, 0, "unknow key: %d\n", res);
+			}
+			break;
+		}
+		wmove(form_win, 0, 0);
+		wclrtoeol(form_win);
+		mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
+		mvwprintw(form_win, 0, 0, "%s", result);
+		wmove(form_win, 0, cursor_position);
+		touchwin(win);
+		refresh_all_windows(main_window);
+
+		if (res == 10) {
+			res = 0;
+			break;
+		} else if (res == 27 || res == KEY_F(F_BACK) ||
+				res == KEY_F(F_EXIT)) {
+			res = KEY_EXIT;
+			break;
+		} else if (res == KEY_F(F_HELP)) {
+			res = 1;
+			break;
+		}
+	}
+
+	/* hide the cursor */
+	curs_set(0);
+	del_panel(panel);
+	delwin(prompt_win);
+	delwin(form_win);
+	delwin(win);
+	return res;
+}
+
+/* refresh all windows in the correct order */
+void refresh_all_windows(WINDOW *main_window)
+{
+	update_panels();
+	touchwin(main_window);
+	refresh();
+}
+
+/* layman's scrollable window... */
+void show_scroll_win(WINDOW *main_window,
+		const char *title,
+		const char *text)
+{
+	int res;
+	int total_lines = get_line_no(text);
+	int x, y;
+	int start_x = 0, start_y = 0;
+	int text_lines = 0, text_cols = 0;
+	int total_cols = 0;
+	int win_cols = 0;
+	int win_lines = 0;
+	int i = 0;
+	WINDOW *win;
+	WINDOW *pad;
+	PANEL *panel;
+
+	/* find the widest line of msg: */
+	total_lines = get_line_no(text);
+	for (i = 0; i < total_lines; i++) {
+		const char *line = get_line(text, i);
+		int len = get_line_length(line);
+		total_cols = max(total_cols, len+2);
+	}
+
+	/* create the pad */
+	pad = newpad(total_lines+10, total_cols+10);
+	wattrset(pad, attributes[SCROLLWIN_TEXT]);
+	fill_window(pad, text);
+
+	win_lines = min(total_lines+4, LINES-2);
+	win_cols = min(total_cols+2, COLS-2);
+	text_lines = max(win_lines-4, 0);
+	text_cols = max(win_cols-2, 0);
+
+	/* place window in middle of screen */
+	y = (LINES-win_lines)/2;
+	x = (COLS-win_cols)/2;
+
+	win = newwin(win_lines, win_cols, y, x);
+	keypad(win, TRUE);
+	/* show the help in the help window, and show the help panel */
+	wattrset(win, attributes[SCROLLWIN_BOX]);
+	box(win, 0, 0);
+	wattrset(win, attributes[SCROLLWIN_HEADING]);
+	mvwprintw(win, 0, 3, " %s ", title);
+	panel = new_panel(win);
+
+	/* handle scrolling */
+	do {
+
+		copywin(pad, win, start_y, start_x, 2, 2, text_lines,
+				text_cols, 0);
+		print_in_middle(win,
+				text_lines+2,
+				0,
+				text_cols,
+				"<OK>",
+				attributes[DIALOG_MENU_FORE]);
+		wrefresh(win);
+
+		res = wgetch(win);
+		switch (res) {
+		case KEY_NPAGE:
+		case ' ':
+			start_y += text_lines-2;
+			break;
+		case KEY_PPAGE:
+			start_y -= text_lines+2;
+			break;
+		case KEY_HOME:
+			start_y = 0;
+			break;
+		case KEY_END:
+			start_y = total_lines-text_lines;
+			break;
+		case KEY_DOWN:
+		case 'j':
+			start_y++;
+			break;
+		case KEY_UP:
+		case 'k':
+			start_y--;
+			break;
+		case KEY_LEFT:
+		case 'h':
+			start_x--;
+			break;
+		case KEY_RIGHT:
+		case 'l':
+			start_x++;
+			break;
+		}
+		if (res == 10 || res == 27 || res == 'q'
+		    || res == KEY_F(F_BACK) || res == KEY_F(F_EXIT)) {
+			break;
+		}
+		if (start_y < 0)
+			start_y = 0;
+		if (start_y >= total_lines-text_lines)
+			start_y = total_lines-text_lines;
+		if (start_x < 0)
+			start_x = 0;
+		if (start_x >= total_cols-text_cols)
+			start_x = total_cols-text_cols;
+	} while (res);
+
+	del_panel(panel);
+	delwin(win);
+	refresh_all_windows(main_window);
+}
diff --git a/package/config/nconf.h b/package/config/nconf.h
new file mode 100644
index 0000000..fb42966
--- /dev/null
+++ b/package/config/nconf.h
@@ -0,0 +1,95 @@
+/*
+ * Copyright (C) 2008 Nir Tzachar <nir.tzachar@gmail.com?
+ * Released under the terms of the GNU GPL v2.0.
+ *
+ * Derived from menuconfig.
+ *
+ */
+
+#include <ctype.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <locale.h>
+#include <curses.h>
+#include <menu.h>
+#include <panel.h>
+#include <form.h>
+
+#include <stdio.h>
+#include <time.h>
+#include <sys/time.h>
+
+#include "ncurses.h"
+
+#define max(a, b) ({\
+		typeof(a) _a = a;\
+		typeof(b) _b = b;\
+		_a > _b ? _a : _b; })
+
+#define min(a, b) ({\
+		typeof(a) _a = a;\
+		typeof(b) _b = b;\
+		_a < _b ? _a : _b; })
+
+typedef enum {
+	NORMAL = 1,
+	MAIN_HEADING,
+	MAIN_MENU_BOX,
+	MAIN_MENU_FORE,
+	MAIN_MENU_BACK,
+	MAIN_MENU_GREY,
+	MAIN_MENU_HEADING,
+	SCROLLWIN_TEXT,
+	SCROLLWIN_HEADING,
+	SCROLLWIN_BOX,
+	DIALOG_TEXT,
+	DIALOG_MENU_FORE,
+	DIALOG_MENU_BACK,
+	DIALOG_BOX,
+	INPUT_BOX,
+	INPUT_HEADING,
+	INPUT_TEXT,
+	INPUT_FIELD,
+	FUNCTION_TEXT,
+	FUNCTION_HIGHLIGHT,
+	ATTR_MAX
+} attributes_t;
+extern attributes_t attributes[];
+
+typedef enum {
+	F_HELP = 1,
+	F_SYMBOL = 2,
+	F_INSTS = 3,
+	F_CONF = 4,
+	F_BACK = 5,
+	F_SAVE = 6,
+	F_LOAD = 7,
+	F_EXIT = 8
+} function_key;
+
+void set_colors(void);
+
+/* this changes the windows attributes !!! */
+void print_in_middle(WINDOW *win,
+		int starty,
+		int startx,
+		int width,
+		const char *string,
+		chtype color);
+int get_line_length(const char *line);
+int get_line_no(const char *text);
+const char *get_line(const char *text, int line_no);
+void fill_window(WINDOW *win, const char *text);
+int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...);
+int dialog_inputbox(WINDOW *main_window,
+		const char *title, const char *prompt,
+		const char *init, char *result, int result_len);
+void refresh_all_windows(WINDOW *main_window);
+void show_scroll_win(WINDOW *main_window,
+		const char *title,
+		const char *text);
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
index 5fed731..4e4354a 100644
--- a/package/config/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -3,28 +3,28 @@
  confdata.c          |   12 ++++--------
  gconf.c             |    4 ++--
  gconf.glade         |    2 +-
- mconf.c             |   37 ++++++++++++++++++-------------------
- qconf.cc            |    3 +--
+ mconf.c             |   35 +++++++++++++++++------------------
+ qconf.cc            |    4 ++--
  zconf.tab.c_shipped |    2 +-
  zconf.y             |    2 +-
- 8 files changed, 34 insertions(+), 40 deletions(-)
+ 8 files changed, 34 insertions(+), 39 deletions(-)
 
-Index: config.clean/conf.c
+Index: config.new/conf.c
 ===================================================================
---- config.clean.orig/conf.c
-+++ config.clean/conf.c
-@@ -500,8 +500,8 @@
- 	if (sync_kconfig) {
- 		if (stat(".config", &tmpstat)) {
+--- config.new.orig/conf.c
++++ config.new/conf.c
+@@ -508,8 +508,8 @@
+ 		name = conf_get_configname();
+ 		if (stat(name, &tmpstat)) {
  			fprintf(stderr, _("***\n"
 -				"*** You have not yet configured your kernel!\n"
--				"*** (missing kernel .config file)\n"
-+				"*** You have not yet configured Buildroot!\n"
-+				"*** (missing .config file)\n"
+-				"*** (missing kernel config file \"%s\")\n"
++				"*** You have not yet configured your Buildroot!\n"
++				"*** (missing .config file \"%s\")\n"
  				"***\n"
  				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
  				"*** \"make menuconfig\" or \"make xconfig\").\n"
-@@ -556,7 +556,7 @@
+@@ -571,7 +571,7 @@
  			name = getenv("KCONFIG_NOSILENTUPDATE");
  			if (name && *name) {
  				fprintf(stderr,
@@ -33,7 +33,7 @@ Index: config.clean/conf.c
  				return 1;
  			}
  		}
-@@ -599,16 +599,16 @@
+@@ -623,11 +623,11 @@
  		 * All other commands are only used to generate a config.
  		 */
  		if (conf_get_changed() && conf_write(NULL)) {
@@ -46,18 +46,21 @@ Index: config.clean/conf.c
 +			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
  			return 1;
  		}
- 	} else {
+ 	} else if (input_mode == savedefconfig) {
+@@ -638,7 +638,7 @@
+ 		}
+ 	} else if (input_mode != listnewconfig) {
  		if (conf_write(NULL)) {
 -			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
 +			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
  			exit(1);
  		}
  	}
-Index: config.clean/confdata.c
+Index: config.new/confdata.c
 ===================================================================
---- config.clean.orig/confdata.c
-+++ config.clean/confdata.c
-@@ -436,7 +436,7 @@
+--- config.new.orig/confdata.c
++++ config.new/confdata.c
+@@ -579,7 +579,7 @@
  	if (!out)
  		return 1;
  
@@ -66,7 +69,7 @@ Index: config.clean/confdata.c
  	sym_calc_value(sym);
  	time(&now);
  	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -445,10 +445,8 @@
+@@ -588,10 +588,8 @@
  
  	fprintf(out, _("#\n"
  		       "# Automatically generated make config: don't edit\n"
@@ -77,7 +80,7 @@ Index: config.clean/confdata.c
  		     use_timestamp ? "# " : "",
  		     use_timestamp ? ctime(&now) : "");
  
-@@ -692,22 +690,20 @@
+@@ -802,25 +800,23 @@
  		return 1;
  	}
  
@@ -92,6 +95,9 @@ Index: config.clean/confdata.c
  		     "#\n",
 -		     sym_get_string_value(sym), ctime(&now));
 +		     ctime(&now));
+ 	fprintf(tristate, "#\n"
+ 			  "# Automatically generated - do not edit\n"
+ 			  "\n");
  	fprintf(out_h, "/*\n"
  		       " * Automatically generated C config: don't edit\n"
 -		       " * Linux kernel version: %s\n"
@@ -103,11 +109,11 @@ Index: config.clean/confdata.c
  
  	for_all_symbols(i, sym) {
  		sym_calc_value(sym);
-Index: config.clean/gconf.c
+Index: config.new/gconf.c
 ===================================================================
---- config.clean.orig/gconf.c
-+++ config.clean/gconf.c
-@@ -266,8 +266,8 @@
+--- config.new.orig/gconf.c
++++ config.new/gconf.c
+@@ -210,8 +210,8 @@
  					  /*"style", PANGO_STYLE_OBLIQUE, */
  					  NULL);
  
@@ -118,10 +124,10 @@ Index: config.clean/gconf.c
  	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
  
  	gtk_widget_show(main_wnd);
-Index: config.clean/gconf.glade
+Index: config.new/gconf.glade
 ===================================================================
---- config.clean.orig/gconf.glade
-+++ config.clean/gconf.glade
+--- config.new.orig/gconf.glade
++++ config.new/gconf.glade
 @@ -5,7 +5,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -131,10 +137,10 @@ Index: config.clean/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-Index: config.clean/mconf.c
+Index: config.new/mconf.c
 ===================================================================
---- config.clean.orig/mconf.c
-+++ config.clean/mconf.c
+--- config.new.orig/mconf.c
++++ config.new/mconf.c
 @@ -25,10 +25,9 @@
  static const char mconf_readme[] = N_(
  "Overview\n"
@@ -148,7 +154,7 @@ Index: config.clean/mconf.c
  "entered in as decimal or hexadecimal numbers or possibly text.\n"
  "\n"
  "Menu items beginning with following braces represent features that\n"
-@@ -115,7 +114,7 @@
+@@ -117,7 +116,7 @@
  "-----------------------------\n"
  "Menuconfig supports the use of alternate configuration files for\n"
  "those who, for various reasons, find it necessary to switch\n"
@@ -157,7 +163,7 @@ Index: config.clean/mconf.c
  "\n"
  "At the end of the main menu you will find two options.  One is\n"
  "for saving the current configuration to a file of your choosing.\n"
-@@ -148,7 +147,7 @@
+@@ -150,7 +149,7 @@
  "\n"
  "Optional personality available\n"
  "------------------------------\n"
@@ -166,7 +172,7 @@ Index: config.clean/mconf.c
  "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
  "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
  "\n"
-@@ -178,9 +177,9 @@
+@@ -180,9 +179,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus --->.  "
  	"Highlighted letters are hotkeys.  "
@@ -178,15 +184,7 @@ Index: config.clean/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-@@ -200,18 +199,18 @@
- 	"This feature depends on another which has been configured as a module.\n"
- 	"As a result, this feature will be built as a module."),
- nohelp_text[] = N_(
--	"There is no help available for this kernel option.\n"),
-+	"There is no help available for this option.\n"),
- load_config_text[] = N_(
- 	"Enter the name of the configuration file you wish to load.  "
- 	"Accept the name shown to restore the configuration you "
+@@ -207,11 +206,11 @@
  	"last retrieved.  Leave blank to abort."),
  load_config_help[] = N_(
  	"\n"
@@ -209,7 +207,7 @@ Index: config.clean/mconf.c
  	"configurations available on a single machine.\n"
  	"\n"
  	"Entering a file name here will allow you to later retrieve, modify\n"
-@@ -364,10 +363,10 @@
+@@ -292,10 +291,10 @@
  	int size;
  	struct symbol *sym;
  
@@ -222,7 +220,7 @@ Index: config.clean/mconf.c
  		        config_filename, sym_get_string_value(sym));
  	if (size >= sizeof(menu_backtitle))
  		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-@@ -894,7 +893,7 @@
+@@ -834,7 +833,7 @@
  		if (conf_get_changed())
  			res = dialog_yesno(NULL,
  					   _("Do you wish to save your "
@@ -231,7 +229,7 @@ Index: config.clean/mconf.c
  					     "<ESC><ESC> to continue."),
  					   6, 60);
  		else
-@@ -906,20 +905,20 @@
+@@ -846,20 +845,20 @@
  	case 0:
  		if (conf_write(filename)) {
  			fprintf(stderr, _("\n\n"
@@ -257,25 +255,26 @@ Index: config.clean/mconf.c
  			"\n\n"));
  	}
  
-Index: config.clean/qconf.cc
+Index: config.new/qconf.cc
 ===================================================================
---- config.clean.orig/qconf.cc
-+++ config.clean/qconf.cc
-@@ -1276,8 +1276,7 @@
+--- config.new.orig/qconf.cc
++++ config.new/qconf.cc
+@@ -1263,8 +1263,8 @@
  	char title[256];
  
- 	QWidget *d = configApp->desktop();
+ 	QDesktopWidget *d = configApp->desktop();
 -	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
 -		getenv("KERNELVERSION"));
-+	snprintf(title, sizeof(title), _("Buildroot Configuration"));
++	snprintf(title, sizeof(title), _("Buildroot v%s Configuration"),
++		getenv("BR2_VERSION"));
  	setCaption(title);
  
  	width = configSettings->readNumEntry("/window width", d->width() - 64);
-Index: config.clean/zconf.tab.c_shipped
+Index: config.new/zconf.tab.c_shipped
 ===================================================================
---- config.clean.orig/zconf.tab.c_shipped
-+++ config.clean/zconf.tab.c_shipped
-@@ -2259,7 +2259,7 @@
+--- config.new.orig/zconf.tab.c_shipped
++++ config.new/zconf.tab.c_shipped
+@@ -2224,7 +2224,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
@@ -284,11 +283,11 @@ Index: config.clean/zconf.tab.c_shipped
  
  #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
-Index: config.clean/zconf.y
+Index: config.new/zconf.y
 ===================================================================
---- config.clean.orig/zconf.y
-+++ config.clean/zconf.y
-@@ -476,7 +476,7 @@
+--- config.new.orig/zconf.y
++++ config.new/zconf.y
+@@ -479,7 +479,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
index a786078..5b76df3 100644
--- a/package/config/patches/03-change-config-option-prefix.patch
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -1,11 +1,11 @@
 ---
- confdata.c |   57 +++++++++++++++++++++++++++------------------------------
- 1 file changed, 27 insertions(+), 30 deletions(-)
+ confdata.c |   49 +++++++++++++++++++++++--------------------------
+ 1 file changed, 23 insertions(+), 26 deletions(-)
 
-Index: config.clean/confdata.c
+Index: config.new/confdata.c
 ===================================================================
---- config.clean.orig/confdata.c
-+++ config.clean/confdata.c
+--- config.new.orig/confdata.c
++++ config.new/confdata.c
 @@ -11,6 +11,7 @@
  #include <string.h>
  #include <time.h>
@@ -32,7 +32,7 @@ Index: config.clean/confdata.c
  
  	return name ? name : ".config";
  }
-@@ -212,22 +213,22 @@
+@@ -222,22 +223,22 @@
  		sym = NULL;
  		switch (line[0]) {
  		case '#':
@@ -59,7 +59,7 @@ Index: config.clean/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
  			}
-@@ -244,12 +245,8 @@
+@@ -254,12 +255,8 @@
  				;
  			}
  			break;
@@ -74,7 +74,7 @@ Index: config.clean/confdata.c
  			if (!p)
  				continue;
  			*p++ = 0;
-@@ -260,13 +257,13 @@
+@@ -270,13 +267,13 @@
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
@@ -90,86 +90,74 @@ Index: config.clean/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
  			}
-@@ -480,19 +477,19 @@
- 			case S_TRISTATE:
- 				switch (sym_get_tristate_value(sym)) {
- 				case no:
--					fprintf(out, "# CONFIG_%s is not set\n", sym->name);
-+					fprintf(out, "# %s is not set\n", sym->name);
- 					break;
- 				case mod:
--					fprintf(out, "CONFIG_%s=m\n", sym->name);
-+					fprintf(out, "%s=m\n", sym->name);
- 					break;
- 				case yes:
--					fprintf(out, "CONFIG_%s=y\n", sym->name);
-+					fprintf(out, "%s=y\n", sym->name);
- 					break;
- 				}
- 				break;
- 			case S_STRING:
- 				str = sym_get_string_value(sym);
--				fprintf(out, "CONFIG_%s=\"", sym->name);
-+				fprintf(out, "%s=\"", sym->name);
- 				while (1) {
- 					l = strcspn(str, "\"\\");
- 					if (l) {
-@@ -508,12 +505,12 @@
- 			case S_HEX:
- 				str = sym_get_string_value(sym);
- 				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
--					fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-+					fprintf(out, "%s=%s\n", sym->name, str);
- 					break;
- 				}
- 			case S_INT:
- 				str = sym_get_string_value(sym);
--				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
-+				fprintf(out, "%s=%s\n", sym->name, str);
- 				break;
- 			}
+@@ -405,9 +402,9 @@
+ {
+ 	int l;
+ 	if (headerfile)
+-		fprintf(out, "#define CONFIG_%s \"", name);
++		fprintf(out, "#define %s \"", name);
+ 	else
+-		fprintf(out, "CONFIG_%s=\"", name);
++		fprintf(out, "%s=\"", name);
+ 
+ 	while (1) {
+ 		l = strcspn(str, "\"\\");
+@@ -433,13 +430,13 @@
+ 		switch (sym_get_tristate_value(sym)) {
+ 		case no:
+ 			if (write_no)
+-				fprintf(out, "# CONFIG_%s is not set\n", sym->name);
++				fprintf(out, "# %s is not set\n", sym->name);
+ 			break;
+ 		case mod:
+-			fprintf(out, "CONFIG_%s=m\n", sym->name);
++			fprintf(out, "%s=m\n", sym->name);
+ 			break;
+ 		case yes:
+-			fprintf(out, "CONFIG_%s=y\n", sym->name);
++			fprintf(out, "%s=y\n", sym->name);
+ 			break;
  		}
-@@ -716,19 +713,19 @@
+ 		break;
+@@ -449,7 +446,7 @@
+ 	case S_HEX:
+ 	case S_INT:
+ 		str = sym_get_string_value(sym);
+-		fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
++		fprintf(out, "%s=%s\n", sym->name, str);
+ 		break;
+ 	case S_OTHER:
+ 	case S_UNKNOWN:
+@@ -834,14 +831,14 @@
  			case no:
  				break;
  			case mod:
--				fprintf(out, "CONFIG_%s=m\n", sym->name);
+-				fprintf(tristate, "CONFIG_%s=M\n", sym->name);
 -				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
-+				fprintf(out, "%s=m\n", sym->name);
++				fprintf(tristate, "%s=M\n", sym->name);
 +				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
  				break;
  			case yes:
--				fprintf(out, "CONFIG_%s=y\n", sym->name);
+ 				if (sym->type == S_TRISTATE)
+-					fprintf(tristate, "CONFIG_%s=Y\n",
++					fprintf(tristate, "%s=Y\n",
+ 							sym->name);
 -				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
-+				fprintf(out, "%s=y\n", sym->name);
 +				fprintf(out_h, "#define %s 1\n", sym->name);
  				break;
  			}
  			break;
- 		case S_STRING:
- 			str = sym_get_string_value(sym);
--			fprintf(out, "CONFIG_%s=\"", sym->name);
--			fprintf(out_h, "#define CONFIG_%s \"", sym->name);
-+			fprintf(out, "%s=\"", sym->name);
-+			fprintf(out_h, "#define %s \"", sym->name);
- 			while (1) {
- 				l = strcspn(str, "\"\\");
- 				if (l) {
-@@ -748,14 +745,14 @@
+@@ -851,12 +848,12 @@
  		case S_HEX:
  			str = sym_get_string_value(sym);
  			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
--				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
 -				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
-+				fprintf(out, "%s=%s\n", sym->name, str);
 +				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
  				break;
  			}
  		case S_INT:
  			str = sym_get_string_value(sym);
--			fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
 -			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
-+			fprintf(out, "%s=%s\n", sym->name, str);
 +			fprintf(out_h, "#define %s %s\n", sym->name, str);
  			break;
  		default:
diff --git a/package/config/patches/04-fedora-13-build-fix.patch b/package/config/patches/04-fedora-13-build-fix.patch
deleted file mode 100644
index 4fa72df..0000000
--- a/package/config/patches/04-fedora-13-build-fix.patch
+++ /dev/null
@@ -1,17 +0,0 @@
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: config.clean/Makefile
-===================================================================
---- config.clean.orig/Makefile
-+++ config.clean/Makefile
-@@ -165,7 +165,7 @@
- HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
- HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
- 
--HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
-+HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
- HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
-                           -D LKC_DIRECT_LINK
- 
diff --git a/package/config/patches/05-really-clean-everything.patch b/package/config/patches/05-really-clean-everything.patch
index c206f55..f8d8a39 100644
--- a/package/config/patches/05-really-clean-everything.patch
+++ b/package/config/patches/05-really-clean-everything.patch
@@ -1,24 +1,25 @@
 ---
- Makefile |   13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
+ Makefile |   14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
 
-Index: config.clean/Makefile
+Index: config.new/Makefile
 ===================================================================
---- config.clean.orig/Makefile
-+++ config.clean/Makefile
-@@ -142,10 +142,15 @@
+--- config.new.orig/Makefile
++++ config.new/Makefile
+@@ -199,10 +199,16 @@
  gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
  endif
  
 -clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
 -		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
--clean-files     += mconf qconf gconf
+-clean-files     += mconf qconf gconf nconf
 -clean-files     += config.pot linux.pot
 +clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
 +               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
 +clean-files += config.pot linux.pot
 +clean-files += conf $(conf-objs)
 +clean-files += mconf $(mconf-objs)
++clean-files += nconf $(nconf-objs)
 +clean-files += qconf qconf.o
 +clean-files += gconf gconf.o
 +clean-files += kconfig_load.o zconf.tab.o
diff --git a/package/config/patches/06-br-build-system-integration.patch b/package/config/patches/06-br-build-system-integration.patch
index 1e340f3..a2e634f 100644
--- a/package/config/patches/06-br-build-system-integration.patch
+++ b/package/config/patches/06-br-build-system-integration.patch
@@ -2,11 +2,11 @@
  Makefile |   11 ++++++++++-
  1 file changed, 10 insertions(+), 1 deletion(-)
 
-Index: config.clean/Makefile
+Index: config.new/Makefile
 ===================================================================
---- config.clean.orig/Makefile
-+++ config.clean/Makefile
-@@ -124,14 +124,23 @@
+--- config.new.orig/Makefile
++++ config.new/Makefile
+@@ -181,14 +181,23 @@
  ifeq ($(MAKECMDGOALS),menuconfig)
  	hostprogs-y += mconf
  endif
diff --git a/package/config/patches/07-minor-makefile-fixes.patch b/package/config/patches/07-minor-makefile-fixes.patch
deleted file mode 100644
index f0f68ee..0000000
--- a/package/config/patches/07-minor-makefile-fixes.patch
+++ /dev/null
@@ -1,26 +0,0 @@
----
- Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: config.clean/Makefile
-===================================================================
---- config.clean.orig/Makefile
-+++ config.clean/Makefile
-@@ -83,7 +83,7 @@
- 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
- 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
- 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
--	@echo  '  silentoldconfig - Same as oldconfig, but quietly'
-+	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
- 	@echo  '  randconfig	  - New config with random answer to all options'
- 	@echo  '  defconfig	  - New config with default answer to all options'
- 	@echo  '  allmodconfig	  - New config selecting modules when possible'
-@@ -104,7 +104,7 @@
- # ===========================================================================
- # Shared Makefile for the various kconfig executables:
- # conf:	  Used for defconfig, oldconfig and related targets
--# mconf:  Used for the mconfig target.
-+# mconf:  Used for the menuconfig target
- #         Utilizes the lxdialog package
- # qconf:  Used for the xconfig target
- #         Based on QT which needs to be installed to compile it
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
index 7adfc0b..7561fbc 100644
--- a/package/config/patches/09-implement-kconfig-probability.patch
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -1,17 +1,17 @@
 ---
- confdata.c |   21 +++++++++++++++++++--
- 1 file changed, 19 insertions(+), 2 deletions(-)
+ confdata.c |   22 +++++++++++++++++++---
+ 1 file changed, 19 insertions(+), 3 deletions(-)
 
-Index: config.clean/confdata.c
+Index: config/confdata.c
 ===================================================================
---- config.clean.orig/confdata.c
-+++ config.clean/confdata.c
-@@ -812,7 +812,16 @@
+--- config.orig/confdata.c
++++ config/confdata.c
+@@ -977,7 +977,16 @@
+ void conf_set_all_new_symbols(enum conf_def_mode mode)
+ {
  	struct symbol *sym, *csym;
- 	struct property *prop;
- 	struct expr *e;
--	int i, cnt, def;
-+	int i, cnt, def, prob = 50;
+-	int i, cnt;
++	int i, cnt, prob = 50;
 +
 +	if (mode == def_random) {
 +		char *endp, *env = getenv("KCONFIG_PROBABILITY");
@@ -24,11 +24,12 @@ Index: config.clean/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -831,7 +840,15 @@
+@@ -996,8 +1005,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
--				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
+-				cnt = sym_get_type(sym) == S_TRISTATE ? 3 : 2;
+-				sym->def[S_DEF_USER].tri = (tristate)(rand() % cnt);
 +				cnt = (rand() % 100) - (100 - prob);
 +				if (cnt < 0)
 +					sym->def[S_DEF_USER].tri = no;
diff --git a/package/config/patches/12-fix-glade-file-path.patch b/package/config/patches/12-fix-glade-file-path.patch
index 233809a..10c7e91 100644
--- a/package/config/patches/12-fix-glade-file-path.patch
+++ b/package/config/patches/12-fix-glade-file-path.patch
@@ -2,11 +2,11 @@
  gconf.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: config.clean/gconf.c
+Index: config.new/gconf.c
 ===================================================================
---- config.clean.orig/gconf.c
-+++ config.clean/gconf.c
-@@ -1576,7 +1576,7 @@
+--- config.new.orig/gconf.c
++++ config.new/gconf.c
+@@ -1525,7 +1525,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
diff --git a/package/config/patches/13-use-conf-write-autoconf.patch b/package/config/patches/13-use-conf-write-autoconf.patch
index 826852d..8297dd9 100644
--- a/package/config/patches/13-use-conf-write-autoconf.patch
+++ b/package/config/patches/13-use-conf-write-autoconf.patch
@@ -4,11 +4,11 @@
  qconf.cc |    2 ++
  3 files changed, 7 insertions(+), 1 deletion(-)
 
-Index: config.clean/conf.c
+Index: config.new/conf.c
 ===================================================================
---- config.clean.orig/conf.c
-+++ config.clean/conf.c
-@@ -611,6 +611,10 @@
+--- config.new.orig/conf.c
++++ config.new/conf.c
+@@ -641,6 +641,10 @@
  			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
  			exit(1);
  		}
@@ -19,11 +19,11 @@ Index: config.clean/conf.c
  	}
  	return 0;
  }
-Index: config.clean/mconf.c
+Index: config.new/mconf.c
 ===================================================================
---- config.clean.orig/mconf.c
-+++ config.clean/mconf.c
-@@ -922,6 +922,6 @@
+--- config.new.orig/mconf.c
++++ config.new/mconf.c
+@@ -862,6 +862,6 @@
  			"\n\n"));
  	}
  
@@ -31,11 +31,11 @@ Index: config.clean/mconf.c
 +	return conf_write_autoconf();
  }
  
-Index: config.clean/qconf.cc
+Index: config.new/qconf.cc
 ===================================================================
---- config.clean.orig/qconf.cc
-+++ config.clean/qconf.cc
-@@ -1608,6 +1608,7 @@
+--- config.new.orig/qconf.cc
++++ config.new/qconf.cc
+@@ -1612,6 +1612,7 @@
  {
  	if (!conf_get_changed()) {
  		e->accept();
@@ -43,7 +43,7 @@ Index: config.clean/qconf.cc
  		return;
  	}
  	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
-@@ -1618,6 +1619,7 @@
+@@ -1622,6 +1623,7 @@
  	switch (mb.exec()) {
  	case QMessageBox::Yes:
  		conf_write(NULL);
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
index 4aae0c1..fb1cca1 100644
--- a/package/config/patches/14-support-out-of-tree-config.patch
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -1,52 +1,37 @@
 ---
- conf.c     |    8 +++---
- confdata.c |   71 ++++++++++++++++++++++++++++++++++++++++++++-----------------
- lkc.h      |    1 
- util.c     |   22 ++++++++++++++----
- 4 files changed, 74 insertions(+), 28 deletions(-)
+ conf.c     |    1 
+ confdata.c |   65 +++++++++++++++++++++++++++++++++++++++++++++----------------
+ util.c     |   16 +++++++++++++--
+ 3 files changed, 62 insertions(+), 20 deletions(-)
 
-Index: config.clean/conf.c
+Index: config/conf.c
 ===================================================================
---- config.clean.orig/conf.c
-+++ config.clean/conf.c
-@@ -496,16 +496,16 @@
+--- config.orig/conf.c
++++ config/conf.c
+@@ -503,7 +503,6 @@
  	}
  	name = av[optind];
  	conf_parse(name);
 -	//zconfdump(stdout);
  	if (sync_kconfig) {
--		if (stat(".config", &tmpstat)) {
-+		name = conf_get_configname();
-+		if (stat(name, &tmpstat)) {
- 			fprintf(stderr, _("***\n"
- 				"*** You have not yet configured Buildroot!\n"
--				"*** (missing .config file)\n"
-+				"*** (missing .config file \"%s\")\n"
- 				"***\n"
- 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
- 				"*** \"make menuconfig\" or \"make xconfig\").\n"
--				"***\n"));
-+				"***\n"), name);
- 			exit(1);
- 		}
- 	}
-Index: config.clean/confdata.c
+ 		name = conf_get_configname();
+ 		if (stat(name, &tmpstat)) {
+Index: config/confdata.c
 ===================================================================
---- config.clean.orig/confdata.c
-+++ config.clean/confdata.c
-@@ -42,6 +42,11 @@
- 	return name ? name : ".config";
- }
+--- config.orig/confdata.c
++++ config/confdata.c
+@@ -44,9 +44,7 @@
  
-+const char *conf_get_autoconfig_name(void)
-+{
+ const char *conf_get_autoconfig_name(void)
+ {
+-	char *name = getenv("KCONFIG_AUTOCONFIG");
+-
+-	return name ? name : "include/config/auto.conf";
 +	return getenv("KCONFIG_AUTOCONFIG");
-+}
-+
+ }
+ 
  static char *conf_expand_value(const char *in)
- {
- 	struct symbol *sym;
-@@ -399,6 +404,9 @@
+@@ -542,6 +540,9 @@
  	int use_timestamp = 1;
  	char *env;
  
@@ -56,30 +41,24 @@ Index: config.clean/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -550,19 +558,31 @@
- 
- int conf_split_config(void)
+@@ -656,6 +657,7 @@
  {
--	char *name, path[128];
-+	const char *name;
-+	char path[128];
+ 	const char *name;
+ 	char path[128];
 +	char *opwd, *dir, *_name;
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
- 	int res, i, fd;
- 
--	name = getenv("KCONFIG_AUTOCONFIG");
--	if (!name)
--		name = "include/config/auto.conf";
-+	name = conf_get_autoconfig_name();
+@@ -664,8 +666,20 @@
+ 	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
 -	if (chdir("include/config"))
+-		return 1;
 +	opwd = malloc(256);
 +	_name = strdup(name);
 +	if (opwd == NULL || _name == NULL)
- 		return 1;
++ 		return 1;
 +	opwd = getcwd(opwd, 256);
 +	dir = dirname(_name);
 +	if (dir == NULL) {
@@ -93,7 +72,7 @@ Index: config.clean/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -655,9 +675,11 @@
+@@ -758,9 +772,11 @@
  		close(fd);
  	}
  out:
@@ -108,15 +87,10 @@ Index: config.clean/confdata.c
  	return res;
  }
  
-@@ -665,23 +687,35 @@
- {
- 	struct symbol *sym;
- 	const char *str;
--	char *name;
-+	const char *name;
- 	FILE *out, *out_h;
+@@ -772,25 +788,38 @@
+ 	FILE *out, *tristate, *out_h;
  	time_t now;
- 	int i, l;
+ 	int i;
 +	char dir[PATH_MAX+1], buf[PATH_MAX+1];
 +	char *s;
 +
@@ -142,13 +116,21 @@ Index: config.clean/confdata.c
  	if (!out)
  		return 1;
  
+-	tristate = fopen(".tmpconfig_tristate", "w");
++	sprintf(buf, "%s.tmpconfig_tristate", dir);
++	tristate = fopen(buf, "w");
+ 	if (!tristate) {
+ 		fclose(out);
+ 		return 1;
+ 	}
+ 
 -	out_h = fopen(".tmpconfig.h", "w");
 +	sprintf(buf, "%s.tmpconfig.h", dir);
 +	out_h = fopen(buf, "w");
  	if (!out_h) {
  		fclose(out);
- 		return 1;
-@@ -698,8 +732,7 @@
+ 		fclose(tristate);
+@@ -811,8 +840,7 @@
  	fprintf(out_h, "/*\n"
  		       " * Automatically generated C config: don't edit\n"
  		       " * %s"
@@ -158,18 +140,22 @@ Index: config.clean/confdata.c
  		       ctime(&now));
  
  	for_all_symbols(i, sym) {
-@@ -764,16 +797,16 @@
+@@ -866,19 +894,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
- 		name = "include/linux/autoconf.h";
+ 		name = "include/generated/autoconf.h";
 -	if (rename(".tmpconfig.h", name))
 +	sprintf(buf, "%s.tmpconfig.h", dir);
 +	if (rename(buf, name))
  		return 1;
--	name = getenv("KCONFIG_AUTOCONFIG");
--	if (!name)
--		name = "include/config/auto.conf";
-+	name = conf_get_autoconfig_name();
+ 	name = getenv("KCONFIG_TRISTATE");
+ 	if (!name)
+ 		name = "include/config/tristate.conf";
+-	if (rename(".tmpconfig_tristate", name))
++	sprintf(buf, "%s.tmpconfig_tristate", dir);
++	if (rename(buf, name))
+ 		return 1;
+ 	name = conf_get_autoconfig_name();
  	/*
  	 * This must be the last step, kbuild has a dependency on auto.conf
  	 * and this marks the successful completion of the previous steps.
@@ -180,22 +166,10 @@ Index: config.clean/confdata.c
  		return 1;
  
  	return 0;
-Index: config.clean/lkc.h
+Index: config/util.c
 ===================================================================
---- config.clean.orig/lkc.h
-+++ config.clean/lkc.h
-@@ -74,6 +74,7 @@
- 
- /* confdata.c */
- const char *conf_get_configname(void);
-+const char *conf_get_autoconfig_name(void);
- char *conf_get_default_confname(void);
- void sym_set_change_count(int count);
- void sym_add_change_count(int count);
-Index: config.clean/util.c
-===================================================================
---- config.clean.orig/util.c
-+++ config.clean/util.c
+--- config.orig/util.c
++++ config/util.c
 @@ -144,6 +144,8 @@
  /* write a dependency file as used by kbuild to track dependencies */
  int file_write_dep(const char *name)
@@ -223,25 +197,7 @@ Index: config.clean/util.c
  	if (!out)
  		return 1;
  	fprintf(out, "deps_config := \\\n");
-@@ -161,8 +172,8 @@
- 		else
- 			fprintf(out, "\t%s\n", file->name);
- 	}
--	fprintf(out, "\ninclude/config/auto.conf: \\\n"
--		     "\t$(deps_config)\n\n");
-+	fprintf(out, "\n%s: \\\n"
-+		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
- 
- 	expr_list_for_each_sym(sym_env_list, e, sym) {
- 		struct property *prop;
-@@ -176,13 +187,14 @@
- 		if (!value)
- 			value = "";
- 		fprintf(out, "ifneq \"$(%s)\" \"%s\"\n", env_sym->name, value);
--		fprintf(out, "include/config/auto.conf: FORCE\n");
-+		fprintf(out, "%s: FORCE\n", conf_get_autoconfig_name());
- 		fprintf(out, "endif\n");
- 	}
+@@ -182,7 +193,8 @@
  
  	fprintf(out, "\n$(deps_config): ;\n");
  	fclose(out);
diff --git a/package/config/patches/15-misc-qconf-changes.patch b/package/config/patches/15-misc-qconf-changes.patch
deleted file mode 100644
index 683d518..0000000
--- a/package/config/patches/15-misc-qconf-changes.patch
+++ /dev/null
@@ -1,175 +0,0 @@
----
- qconf.cc |   48 +++++++++++++++++++++++++++---------------------
- 1 file changed, 27 insertions(+), 21 deletions(-)
-
-Index: config.clean/qconf.cc
-===================================================================
---- config.clean.orig/qconf.cc
-+++ config.clean/qconf.cc
-@@ -5,6 +5,7 @@
- 
- #include <qapplication.h>
- #include <qmainwindow.h>
-+#include <qdesktopwidget.h>
- #include <qtoolbar.h>
- #include <qlayout.h>
- #include <qvbox.h>
-@@ -297,10 +298,10 @@
- void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
- {
- 	switch (e->key()) {
--	case Key_Escape:
-+	case Qt::Key_Escape:
- 		break;
--	case Key_Return:
--	case Key_Enter:
-+	case Qt::Key_Return:
-+	case Qt::Key_Enter:
- 		sym_set_string_value(item->menu->sym, text().latin1());
- 		parent()->updateList(item);
- 		break;
-@@ -639,7 +640,7 @@
- 	struct menu *menu;
- 	enum prop_type type;
- 
--	if (ev->key() == Key_Escape && mode != fullMode && mode != listMode) {
-+	if (ev->key() == Qt::Key_Escape && mode != fullMode && mode != listMode) {
- 		emit parentSelected();
- 		ev->accept();
- 		return;
-@@ -652,8 +653,8 @@
- 	item = (ConfigItem*)i;
- 
- 	switch (ev->key()) {
--	case Key_Return:
--	case Key_Enter:
-+	case Qt::Key_Return:
-+	case Qt::Key_Enter:
- 		if (item->goParent) {
- 			emit parentSelected();
- 			break;
-@@ -667,16 +668,16 @@
- 			emit menuSelected(menu);
- 			break;
- 		}
--	case Key_Space:
-+	case Qt::Key_Space:
- 		changeValue(item);
- 		break;
--	case Key_N:
-+	case Qt::Key_N:
- 		setValue(item, no);
- 		break;
--	case Key_M:
-+	case Qt::Key_M:
- 		setValue(item, mod);
- 		break;
--	case Key_Y:
-+	case Qt::Key_Y:
- 		setValue(item, yes);
- 		break;
- 	default:
-@@ -920,7 +921,7 @@
- }
- 
- ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
--	: Parent(parent, name), menu(0), sym(0)
-+	: Parent(parent, name), sym(0), menu(0)
- {
- 	if (name) {
- 		configSettings->beginGroup(name);
-@@ -1199,7 +1200,7 @@
- 	layout1->addLayout(layout2);
- 
- 	split = new QSplitter(this);
--	split->setOrientation(QSplitter::Vertical);
-+	split->setOrientation(Qt::Vertical);
- 	list = new ConfigView(split, name);
- 	list->list->mode = listMode;
- 	info = new ConfigInfoView(split, name);
-@@ -1275,7 +1276,7 @@
- 	int x, y, width, height;
- 	char title[256];
- 
--	QWidget *d = configApp->desktop();
-+	QDesktopWidget *d = configApp->desktop();
- 	snprintf(title, sizeof(title), _("Buildroot Configuration"));
- 	setCaption(title);
- 
-@@ -1289,14 +1290,14 @@
- 		move(x, y);
- 
- 	split1 = new QSplitter(this);
--	split1->setOrientation(QSplitter::Horizontal);
-+	split1->setOrientation(Qt::Horizontal);
- 	setCentralWidget(split1);
- 
- 	menuView = new ConfigView(split1, "menu");
- 	menuList = menuView->list;
- 
- 	split2 = new QSplitter(split1);
--	split2->setOrientation(QSplitter::Vertical);
-+	split2->setOrientation(Qt::Vertical);
- 
- 	// create config tree
- 	configView = new ConfigView(split2, "config");
-@@ -1314,18 +1315,18 @@
- 	backAction = new QAction("Back", QPixmap(xpm_back), _("Back"), 0, this);
- 	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
- 	  backAction->setEnabled(FALSE);
--	QAction *quitAction = new QAction("Quit", _("&Quit"), CTRL+Key_Q, this);
-+	QAction *quitAction = new QAction("Quit", _("&Quit"), Qt::CTRL + Qt::Key_Q, this);
- 	  connect(quitAction, SIGNAL(activated()), SLOT(close()));
--	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), _("&Load"), CTRL+Key_L, this);
-+	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), _("&Load"), Qt::CTRL + Qt::Key_L, this);
- 	  connect(loadAction, SIGNAL(activated()), SLOT(loadConfig()));
--	saveAction = new QAction("Save", QPixmap(xpm_save), _("&Save"), CTRL+Key_S, this);
-+	saveAction = new QAction("Save", QPixmap(xpm_save), _("&Save"), Qt::CTRL + Qt::Key_S, this);
- 	  connect(saveAction, SIGNAL(activated()), SLOT(saveConfig()));
- 	conf_set_changed_callback(conf_changed);
- 	// Set saveAction's initial state
- 	conf_changed();
- 	QAction *saveAsAction = new QAction("Save As...", _("Save &As..."), 0, this);
- 	  connect(saveAsAction, SIGNAL(activated()), SLOT(saveConfigAs()));
--	QAction *searchAction = new QAction("Find", _("&Find"), CTRL+Key_F, this);
-+	QAction *searchAction = new QAction("Find", _("&Find"), Qt::CTRL + Qt::Key_F, this);
- 	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
- 	QAction *singleViewAction = new QAction("Single View", QPixmap(xpm_single_view), _("Single View"), 0, this);
- 	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
-@@ -1446,7 +1447,7 @@
- 
- void ConfigMainWindow::loadConfig(void)
- {
--	QString s = QFileDialog::getOpenFileName(".config", NULL, this);
-+	QString s = QFileDialog::getOpenFileName(conf_get_configname(), NULL, this);
- 	if (s.isNull())
- 		return;
- 	if (conf_read(QFile::encodeName(s)))
-@@ -1462,7 +1463,7 @@
- 
- void ConfigMainWindow::saveConfigAs(void)
- {
--	QString s = QFileDialog::getSaveFileName(".config", NULL, this);
-+	QString s = QFileDialog::getSaveFileName(conf_get_configname(), NULL, this);
- 	if (s.isNull())
- 		return;
- 	if (conf_write(QFile::encodeName(s)))
-@@ -1523,6 +1524,8 @@
- 	case fullMode:
- 		list = configList;
- 		break;
-+	default:
-+		break;
- 	}
- 
- 	if (list) {
-@@ -1674,6 +1677,9 @@
- 	case fullMode :
- 		entry = "full";
- 		break;
-+
-+	default:
-+		break;
- 	}
- 	configSettings->writeEntry("/listMode", entry);
- 
diff --git a/package/config/patches/16-non-identified-changes.patch b/package/config/patches/16-non-identified-changes.patch
deleted file mode 100644
index 3a4bae5..0000000
--- a/package/config/patches/16-non-identified-changes.patch
+++ /dev/null
@@ -1,47 +0,0 @@
----
- lxdialog/checklist.c |    3 ++-
- mconf.c              |   10 +++++++++-
- 2 files changed, 11 insertions(+), 2 deletions(-)
-
-Index: config.clean/lxdialog/checklist.c
-===================================================================
---- config.clean.orig/lxdialog/checklist.c
-+++ config.clean/lxdialog/checklist.c
-@@ -41,7 +41,8 @@
- 	wmove(win, choice, check_x);
- 	wattrset(win, selected ? dlg.check_selected.atr
- 		 : dlg.check.atr);
--	wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
-+	if (!item_is_tag(':'))
-+		wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
- 
- 	wattrset(win, selected ? dlg.tag_selected.atr : dlg.tag.atr);
- 	mvwaddch(win, choice, item_x, item_str()[0]);
-Index: config.clean/mconf.c
-===================================================================
---- config.clean.orig/mconf.c
-+++ config.clean/mconf.c
-@@ -731,7 +731,12 @@
- 		for (child = menu->list; child; child = child->next) {
- 			if (!menu_is_visible(child))
- 				continue;
--			item_make("%s", _(menu_get_prompt(child)));
-+			if (child->sym)
-+				item_make("%s", _(menu_get_prompt(child)));
-+			else {
-+				item_make("*** %s ***", _(menu_get_prompt(child)));
-+				item_set_tag(':');
-+			}
- 			item_set_data(child);
- 			if (child->sym == active)
- 				item_set_selected(1);
-@@ -747,6 +752,9 @@
- 		case 0:
- 			if (selected) {
- 				child = item_data();
-+				if (!child->sym)
-+					break;
-+
- 				sym_set_tristate_value(child->sym, yes);
- 			}
- 			return;
diff --git a/package/config/patches/series b/package/config/patches/series
index d5ab94c..997befd 100644
--- a/package/config/patches/series
+++ b/package/config/patches/series
@@ -1,10 +1,8 @@
 01-kconfig-kernel-to-buildroot.patch
 02-cpp-comments-to-c-comments.patch
 03-change-config-option-prefix.patch
-04-fedora-13-build-fix.patch
 05-really-clean-everything.patch
 06-br-build-system-integration.patch
-07-minor-makefile-fixes.patch
 08-make-write-deps.patch
 09-implement-kconfig-probability.patch
 10-br-build-system.patch
@@ -12,5 +10,3 @@
 12-fix-glade-file-path.patch
 13-use-conf-write-autoconf.patch
 14-support-out-of-tree-config.patch
-15-misc-qconf-changes.patch
-16-non-identified-changes.patch
diff --git a/package/config/qconf.cc b/package/config/qconf.cc
index 9af12a6..0fe8fd4 100644
--- a/package/config/qconf.cc
+++ b/package/config/qconf.cc
@@ -58,11 +58,10 @@ QValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
 	QValueList<int> result;
 	QStringList entryList = readListEntry(key, ok);
-	if (ok) {
-		QStringList::Iterator it;
-		for (it = entryList.begin(); it != entryList.end(); ++it)
-			result.push_back((*it).toInt());
-	}
+	QStringList::Iterator it;
+
+	for (it = entryList.begin(); it != entryList.end(); ++it)
+		result.push_back((*it).toInt());
 
 	return result;
 }
@@ -149,7 +148,7 @@ void ConfigItem::updateMenu(void)
 	case S_TRISTATE:
 		char ch;
 
-		if (!sym_is_changable(sym) && !list->showAll) {
+		if (!sym_is_changable(sym) && list->optMode == normalOpt) {
 			setPixmap(promptColIdx, 0);
 			setText(noColIdx, QString::null);
 			setText(modColIdx, QString::null);
@@ -320,7 +319,7 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	  symbolYesPix(xpm_symbol_yes), symbolModPix(xpm_symbol_mod), symbolNoPix(xpm_symbol_no),
 	  choiceYesPix(xpm_choice_yes), choiceNoPix(xpm_choice_no),
 	  menuPix(xpm_menu), menuInvPix(xpm_menu_inv), menuBackPix(xpm_menuback), voidPix(xpm_void),
-	  showAll(false), showName(false), showRange(false), showData(false),
+	  showName(false), showRange(false), showData(false), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
 	int i;
@@ -337,10 +336,10 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 
 	if (name) {
 		configSettings->beginGroup(name);
-		showAll = configSettings->readBoolEntry("/showAll", false);
 		showName = configSettings->readBoolEntry("/showName", false);
 		showRange = configSettings->readBoolEntry("/showRange", false);
 		showData = configSettings->readBoolEntry("/showData", false);
+		optMode = (enum optionMode)configSettings->readNumEntry("/optionMode", false);
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
@@ -352,6 +351,17 @@ ConfigList::ConfigList(ConfigView* p, const char *name)
 	reinit();
 }
 
+bool ConfigList::menuSkip(struct menu *menu)
+{
+	if (optMode == normalOpt && menu_is_visible(menu))
+		return false;
+	if (optMode == promptOpt && menu_has_prompt(menu))
+		return false;
+	if (optMode == allOpt)
+		return false;
+	return true;
+}
+
 void ConfigList::reinit(void)
 {
 	removeColumn(dataColIdx);
@@ -380,7 +390,7 @@ void ConfigList::saveSettings(void)
 		configSettings->writeEntry("/showName", showName);
 		configSettings->writeEntry("/showRange", showRange);
 		configSettings->writeEntry("/showData", showData);
-		configSettings->writeEntry("/showAll", showAll);
+		configSettings->writeEntry("/optionMode", (int)optMode);
 		configSettings->endGroup();
 	}
 }
@@ -606,7 +616,7 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 		}
 
 		visible = menu_is_visible(child);
-		if (showAll || visible) {
+		if (!menuSkip(child)) {
 			if (!child->sym && !child->list && !child->prompt)
 				continue;
 			if (!item || item->menu != child)
@@ -835,7 +845,10 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 		e->ignore();
 }
 
-ConfigView* ConfigView::viewList;
+ConfigView*ConfigView::viewList;
+QAction *ConfigView::showNormalAction;
+QAction *ConfigView::showAllAction;
+QAction *ConfigView::showPromptAction;
 
 ConfigView::ConfigView(QWidget* parent, const char *name)
 	: Parent(parent, name)
@@ -860,13 +873,16 @@ ConfigView::~ConfigView(void)
 	}
 }
 
-void ConfigView::setShowAll(bool b)
+void ConfigView::setOptionMode(QAction *act)
 {
-	if (list->showAll != b) {
-		list->showAll = b;
-		list->updateListAll();
-		emit showAllChanged(b);
-	}
+	if (act == showNormalAction)
+		list->optMode = normalOpt;
+	else if (act == showAllAction)
+		list->optMode = allOpt;
+	else
+		list->optMode = promptOpt;
+
+	list->updateListAll();
 }
 
 void ConfigView::setShowName(bool b)
@@ -964,34 +980,6 @@ void ConfigInfoView::setInfo(struct menu *m)
 		menuInfo();
 }
 
-void ConfigInfoView::setSource(const QString& name)
-{
-	const char *p = name.latin1();
-
-	menu = NULL;
-	sym = NULL;
-
-	switch (p[0]) {
-	case 'm':
-		struct menu *m;
-
-		if (sscanf(p, "m%p", &m) == 1 && menu != m) {
-			menu = m;
-			menuInfo();
-			emit menuSelected(menu);
-		}
-		break;
-	case 's':
-		struct symbol *s;
-
-		if (sscanf(p, "s%p", &s) == 1 && sym != s) {
-			sym = s;
-			symbolInfo();
-		}
-		break;
-	}
-}
-
 void ConfigInfoView::symbolInfo(void)
 {
 	QString str;
@@ -1042,12 +1030,10 @@ void ConfigInfoView::menuInfo(void)
 		if (showDebug())
 			debug = debug_info(sym);
 
-		help = menu_get_help(menu);
-		/* Gettextize if the help text not empty */
-		if (help.isEmpty())
-			help = print_filter(menu_get_help(menu));
-		else
-			help = print_filter(_(menu_get_help(menu)));
+		struct gstr help_gstr = str_new();
+		menu_get_ext_help(menu, &help_gstr);
+		help = print_filter(str_get(&help_gstr));
+		str_free(&help_gstr);
 	} else if (menu->prompt) {
 		head += "<big><b>";
 		head += print_filter(_(menu->prompt->text));
@@ -1277,7 +1263,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
-	snprintf(title, sizeof(title), _("Buildroot Configuration"));
+	snprintf(title, sizeof(title), _("Buildroot v%s Configuration"),
+		getenv("BR2_VERSION"));
 	setCaption(title);
 
 	width = configSettings->readNumEntry("/window width", d->width() - 64);
@@ -1350,11 +1337,24 @@ ConfigMainWindow::ConfigMainWindow(void)
 	  connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
 	  connect(configView, SIGNAL(showDataChanged(bool)), showDataAction, SLOT(setOn(bool)));
 	  showDataAction->setOn(configList->showData);
-	QAction *showAllAction = new QAction(NULL, _("Show All Options"), 0, this);
-	  showAllAction->setToggleAction(TRUE);
-	  connect(showAllAction, SIGNAL(toggled(bool)), configView, SLOT(setShowAll(bool)));
-	  connect(showAllAction, SIGNAL(toggled(bool)), menuView, SLOT(setShowAll(bool)));
-	  showAllAction->setOn(configList->showAll);
+
+	QActionGroup *optGroup = new QActionGroup(this);
+	optGroup->setExclusive(TRUE);
+	connect(optGroup, SIGNAL(selected(QAction *)), configView,
+		SLOT(setOptionMode(QAction *)));
+	connect(optGroup, SIGNAL(selected(QAction *)), menuView,
+		SLOT(setOptionMode(QAction *)));
+
+	configView->showNormalAction = new QAction(NULL, _("Show Normal Options"), 0, optGroup);
+	configView->showAllAction = new QAction(NULL, _("Show All Options"), 0, optGroup);
+	configView->showPromptAction = new QAction(NULL, _("Show Prompt Options"), 0, optGroup);
+	configView->showNormalAction->setToggleAction(TRUE);
+	configView->showNormalAction->setOn(configList->optMode == normalOpt);
+	configView->showAllAction->setToggleAction(TRUE);
+	configView->showAllAction->setOn(configList->optMode == allOpt);
+	configView->showPromptAction->setToggleAction(TRUE);
+	configView->showPromptAction->setOn(configList->optMode == promptOpt);
+
 	QAction *showDebugAction = new QAction(NULL, _("Show Debug Info"), 0, this);
 	  showDebugAction->setToggleAction(TRUE);
 	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
@@ -1397,7 +1397,8 @@ ConfigMainWindow::ConfigMainWindow(void)
 	showRangeAction->addTo(optionMenu);
 	showDataAction->addTo(optionMenu);
 	optionMenu->insertSeparator();
-	showAllAction->addTo(optionMenu);
+	optGroup->addTo(optionMenu);
+	optionMenu->insertSeparator();
 	showDebugAction->addTo(optionMenu);
 
 	// create help menu
@@ -1492,7 +1493,7 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	ConfigList* list = NULL;
 	ConfigItem* item;
 
-	if (!menu_is_visible(menu) && !configView->showAll())
+	if (configList->menuSkip(menu))
 		return;
 
 	switch (configList->mode) {
diff --git a/package/config/qconf.h b/package/config/qconf.h
index b3b5657..636a74b 100644
--- a/package/config/qconf.h
+++ b/package/config/qconf.h
@@ -44,6 +44,9 @@ enum colIdx {
 enum listMode {
 	singleMode, menuMode, symbolMode, fullMode, listMode
 };
+enum optionMode {
+	normalOpt = 0, allOpt, promptOpt
+};
 
 class ConfigList : public QListView {
 	Q_OBJECT
@@ -115,6 +118,8 @@ public:
 	void setAllOpen(bool open);
 	void setParentMenu(void);
 
+	bool menuSkip(struct menu *);
+
 	template <class P>
 	void updateMenuList(P*, struct menu*);
 
@@ -124,8 +129,9 @@ public:
 	QPixmap choiceYesPix, choiceNoPix;
 	QPixmap menuPix, menuInvPix, menuBackPix, voidPix;
 
-	bool showAll, showName, showRange, showData;
+	bool showName, showRange, showData;
 	enum listMode mode;
+	enum optionMode optMode;
 	struct menu *rootEntry;
 	QColorGroup disabledColorGroup;
 	QColorGroup inactivedColorGroup;
@@ -222,17 +228,15 @@ public:
 	static void updateList(ConfigItem* item);
 	static void updateListAll(void);
 
-	bool showAll(void) const { return list->showAll; }
 	bool showName(void) const { return list->showName; }
 	bool showRange(void) const { return list->showRange; }
 	bool showData(void) const { return list->showData; }
 public slots:
-	void setShowAll(bool);
 	void setShowName(bool);
 	void setShowRange(bool);
 	void setShowData(bool);
+	void setOptionMode(QAction *);
 signals:
-	void showAllChanged(bool);
 	void showNameChanged(bool);
 	void showRangeChanged(bool);
 	void showDataChanged(bool);
@@ -242,6 +246,10 @@ public:
 
 	static ConfigView* viewList;
 	ConfigView* nextView;
+
+	static QAction *showNormalAction;
+	static QAction *showAllAction;
+	static QAction *showPromptAction;
 };
 
 class ConfigInfoView : public QTextBrowser {
@@ -254,7 +262,6 @@ public:
 public slots:
 	void setInfo(struct menu *menu);
 	void saveSettings(void);
-	void setSource(const QString& name);
 	void setShowDebug(bool);
 
 signals:
diff --git a/package/config/streamline_config.pl b/package/config/streamline_config.pl
new file mode 100644
index 0000000..c70a27d
--- /dev/null
+++ b/package/config/streamline_config.pl
@@ -0,0 +1,422 @@
+#!/usr/bin/perl -w
+#
+# Copywrite 2005-2009 - Steven Rostedt
+# Licensed under the terms of the GNU GPL License version 2
+#
+#  It's simple enough to figure out how this works.
+#  If not, then you can ask me at stripconfig at goodmis.org
+#
+# What it does?
+#
+#   If you have installed a Linux kernel from a distribution
+#   that turns on way too many modules than you need, and
+#   you only want the modules you use, then this program
+#   is perfect for you.
+#
+#   It gives you the ability to turn off all the modules that are
+#   not loaded on your system.
+#
+# Howto:
+#
+#  1. Boot up the kernel that you want to stream line the config on.
+#  2. Change directory to the directory holding the source of the
+#       kernel that you just booted.
+#  3. Copy the configuraton file to this directory as .config
+#  4. Have all your devices that you need modules for connected and
+#      operational (make sure that their corresponding modules are loaded)
+#  5. Run this script redirecting the output to some other file
+#       like config_strip.
+#  6. Back up your old config (if you want too).
+#  7. copy the config_strip file to .config
+#  8. Run "make oldconfig"
+#
+#  Now your kernel is ready to be built with only the modules that
+#  are loaded.
+#
+# Here's what I did with my Debian distribution.
+#
+#    cd /usr/src/linux-2.6.10
+#    cp /boot/config-2.6.10-1-686-smp .config
+#    ~/bin/streamline_config > config_strip
+#    mv .config config_sav
+#    mv config_strip .config
+#    make oldconfig
+#
+my $config = ".config";
+
+my $uname = `uname -r`;
+chomp $uname;
+
+my @searchconfigs = (
+	{
+	    "file" => ".config",
+	    "exec" => "cat",
+	},
+	{
+	    "file" => "/proc/config.gz",
+	    "exec" => "zcat",
+	},
+	{
+	    "file" => "/boot/config-$uname",
+	    "exec" => "cat",
+	},
+	{
+	    "file" => "/boot/vmlinuz-$uname",
+	    "exec" => "scripts/extract-ikconfig",
+	    "test" => "scripts/extract-ikconfig",
+	},
+	{
+	    "file" => "vmlinux",
+	    "exec" => "scripts/extract-ikconfig",
+	    "test" => "scripts/extract-ikconfig",
+	},
+	{
+	    "file" => "/lib/modules/$uname/kernel/kernel/configs.ko",
+	    "exec" => "scripts/extract-ikconfig",
+	    "test" => "scripts/extract-ikconfig",
+	},
+	{
+	    "file" => "kernel/configs.ko",
+	    "exec" => "scripts/extract-ikconfig",
+	    "test" => "scripts/extract-ikconfig",
+	},
+	{
+	    "file" => "kernel/configs.o",
+	    "exec" => "scripts/extract-ikconfig",
+	    "test" => "scripts/extract-ikconfig",
+	},
+);
+
+sub find_config {
+    foreach my $conf (@searchconfigs) {
+	my $file = $conf->{"file"};
+
+	next if ( ! -f "$file");
+
+	if (defined($conf->{"test"})) {
+	    `$conf->{"test"} $conf->{"file"} 2>/dev/null`;
+	    next if ($?);
+	}
+
+	my $exec = $conf->{"exec"};
+
+	print STDERR "using config: '$file'\n";
+
+	open(CIN, "$exec $file |") || die "Failed to run $exec $file";
+	return;
+    }
+    die "No config file found";
+}
+
+find_config;
+
+# Get the build source and top level Kconfig file (passed in)
+my $ksource = $ARGV[0];
+my $kconfig = $ARGV[1];
+my $lsmod_file = $ARGV[2];
+
+my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
+chomp @makefiles;
+
+my %depends;
+my %selects;
+my %prompts;
+my %objects;
+my $var;
+my $cont = 0;
+my $iflevel = 0;
+my @ifdeps;
+
+# prevent recursion
+my %read_kconfigs;
+
+sub read_kconfig {
+    my ($kconfig) = @_;
+
+    my $state = "NONE";
+    my $config;
+    my @kconfigs;
+
+    open(KIN, "$ksource/$kconfig") || die "Can't open $kconfig";
+    while (<KIN>) {
+	chomp;
+
+	# collect any Kconfig sources
+	if (/^source\s*"(.*)"/) {
+	    $kconfigs[$#kconfigs+1] = $1;
+	}
+
+	# configs found
+	if (/^\s*config\s+(\S+)\s*$/) {
+	    $state = "NEW";
+	    $config = $1;
+
+	    for (my $i = 0; $i < $iflevel; $i++) {
+		if ($i) {
+		    $depends{$config} .= " " . $ifdeps[$i];
+		} else {
+		    $depends{$config} = $ifdeps[$i];
+		}
+		$state = "DEP";
+	    }
+
+	# collect the depends for the config
+	} elsif ($state eq "NEW" && /^\s*depends\s+on\s+(.*)$/) {
+	    $state = "DEP";
+	    $depends{$config} = $1;
+	} elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
+	    $depends{$config} .= " " . $1;
+
+	# Get the configs that select this config
+	} elsif ($state ne "NONE" && /^\s*select\s+(\S+)/) {
+	    if (defined($selects{$1})) {
+		$selects{$1} .= " " . $config;
+	    } else {
+		$selects{$1} = $config;
+	    }
+
+	# configs without prompts must be selected
+	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
+	    # note if the config has a prompt
+	    $prompt{$config} = 1;
+
+	# Check for if statements
+	} elsif (/^if\s+(.*\S)\s*$/) {
+	    my $deps = $1;
+	    # remove beginning and ending non text
+	    $deps =~ s/^[^a-zA-Z0-9_]*//;
+	    $deps =~ s/[^a-zA-Z0-9_]*$//;
+
+	    my @deps = split /[^a-zA-Z0-9_]+/, $deps;
+
+	    $ifdeps[$iflevel++] = join ':', @deps;
+
+	} elsif (/^endif/) {
+
+	    $iflevel-- if ($iflevel);
+
+	# stop on "help"
+	} elsif (/^\s*help\s*$/) {
+	    $state = "NONE";
+	}
+    }
+    close(KIN);
+
+    # read in any configs that were found.
+    foreach $kconfig (@kconfigs) {
+	if (!defined($read_kconfigs{$kconfig})) {
+	    $read_kconfigs{$kconfig} = 1;
+	    read_kconfig($kconfig);
+	}
+    }
+}
+
+if ($kconfig) {
+    read_kconfig($kconfig);
+}
+
+# Read all Makefiles to map the configs to the objects
+foreach my $makefile (@makefiles) {
+
+    open(MIN,$makefile) || die "Can't open $makefile";
+    while (<MIN>) {
+	my $objs;
+
+	# is this a line after a line with a backslash?
+	if ($cont && /(\S.*)$/) {
+	    $objs = $1;
+	}
+	$cont = 0;
+
+	# collect objects after obj-$(CONFIG_FOO_BAR)
+	if (/obj-\$\((CONFIG_[^\)]*)\)\s*[+:]?=\s*(.*)/) {
+	    $var = $1;
+	    $objs = $2;
+	}
+	if (defined($objs)) {
+	    # test if the line ends with a backslash
+	    if ($objs =~ m,(.*)\\$,) {
+		$objs = $1;
+		$cont = 1;
+	    }
+
+	    foreach my $obj (split /\s+/,$objs) {
+		$obj =~ s/-/_/g;
+		if ($obj =~ /(.*)\.o$/) {
+		    # Objects may be enabled by more than one config.
+		    # Store configs in an array.
+		    my @arr;
+
+		    if (defined($objects{$1})) {
+			@arr = @{$objects{$1}};
+		    }
+
+		    $arr[$#arr+1] = $var;
+
+		    # The objects have a hash mapping to a reference
+		    # of an array of configs.
+		    $objects{$1} = \@arr;
+		}
+	    }
+	}
+    }
+    close(MIN);
+}
+
+my %modules;
+
+if (defined($lsmod_file)) {
+    if ( ! -f $lsmod_file) {
+	die "$lsmod_file not found";
+    }
+    if ( -x $lsmod_file) {
+	# the file is executable, run it
+	open(LIN, "$lsmod_file|");
+    } else {
+	# Just read the contents
+	open(LIN, "$lsmod_file");
+    }
+} else {
+
+    # see what modules are loaded on this system
+    my $lsmod;
+
+    foreach $dir ( ("/sbin", "/bin", "/usr/sbin", "/usr/bin") ) {
+	if ( -x "$dir/lsmod" ) {
+	    $lsmod = "$dir/lsmod";
+	    last;
+	}
+}
+    if (!defined($lsmod)) {
+	# try just the path
+	$lsmod = "lsmod";
+    }
+
+    open(LIN,"$lsmod|") || die "Can not call lsmod with $lsmod";
+}
+
+while (<LIN>) {
+	next if (/^Module/);  # Skip the first line.
+	if (/^(\S+)/) {
+		$modules{$1} = 1;
+	}
+}
+close (LIN);
+
+# add to the configs hash all configs that are needed to enable
+# a loaded module.
+my %configs;
+foreach my $module (keys(%modules)) {
+    if (defined($objects{$module})) {
+	my @arr = @{$objects{$module}};
+	foreach my $conf (@arr) {
+	    $configs{$conf} = $module;
+	}
+    } else {
+	# Most likely, someone has a custom (binary?) module loaded.
+	print STDERR "$module config not found!!\n";
+    }
+}
+
+my $valid = "A-Za-z_0-9";
+my $repeat = 1;
+
+#
+# Note, we do not care about operands (like: &&, ||, !) we want to add any
+# config that is in the depend list of another config. This script does
+# not enable configs that are not already enabled. If we come across a
+# config A that depends on !B, we can still add B to the list of depends
+# to keep on. If A was on in the original config, B would not have been
+# and B would not be turned on by this script.
+#
+sub parse_config_dep_select
+{
+    my ($p) = @_;
+
+    while ($p =~ /[$valid]/) {
+
+	if ($p =~ /^[^$valid]*([$valid]+)/) {
+	    my $conf = "CONFIG_" . $1;
+
+	    $p =~ s/^[^$valid]*[$valid]+//;
+
+	    if (!defined($configs{$conf})) {
+		# We must make sure that this config has its
+		# dependencies met.
+		$repeat = 1; # do again
+		$configs{$conf} = 1;
+	    }
+	} else {
+	    die "this should never happen";
+	}
+    }
+}
+
+while ($repeat) {
+    $repeat = 0;
+
+    foreach my $config (keys %configs) {
+	$config =~ s/^CONFIG_//;
+
+	if (defined($depends{$config})) {
+	    # This config has dependencies. Make sure they are also included
+	    parse_config_dep_select $depends{$config};
+	}
+
+	if (defined($prompt{$config}) || !defined($selects{$config})) {
+	    next;
+	}
+
+	# config has no prompt and must be selected.
+	parse_config_dep_select $selects{$config};
+    }
+}
+
+my %setconfigs;
+
+# Finally, read the .config file and turn off any module enabled that
+# we could not find a reason to keep enabled.
+while(<CIN>) {
+
+    if (/CONFIG_IKCONFIG/) {
+	if (/# CONFIG_IKCONFIG is not set/) {
+	    # enable IKCONFIG at least as a module
+	    print "CONFIG_IKCONFIG=m\n";
+	    # don't ask about PROC
+	    print "# CONFIG_IKCONFIG_PROC is not set\n";
+	} else {
+	    print;
+	}
+	next;
+    }
+
+    if (/^(CONFIG.*)=(m|y)/) {
+	if (defined($configs{$1})) {
+	    $setconfigs{$1} = $2;
+	} elsif ($2 eq "m") {
+	    print "# $1 is not set\n";
+	    next;
+	}
+    }
+    print;
+}
+close(CIN);
+
+# Integrity check, make sure all modules that we want enabled do
+# indeed have their configs set.
+loop:
+foreach my $module (keys(%modules)) {
+    if (defined($objects{$module})) {
+	my @arr = @{$objects{$module}};
+	foreach my $conf (@arr) {
+	    if (defined($setconfigs{$conf})) {
+		next loop;
+	    }
+	}
+	print STDERR "module $module did not have configs";
+	foreach my $conf (@arr) {
+	    print STDERR " " , $conf;
+	}
+	print STDERR "\n";
+    }
+}
diff --git a/package/config/symbol.c b/package/config/symbol.c
index 18f3e5c..e95718f 100644
--- a/package/config/symbol.c
+++ b/package/config/symbol.c
@@ -36,7 +36,7 @@ tristate modules_val;
 
 struct expr *sym_env_list;
 
-void sym_add_default(struct symbol *sym, const char *def)
+static void sym_add_default(struct symbol *sym, const char *def)
 {
 	struct property *prop = prop_alloc(P_DEFAULT, sym);
 
@@ -125,7 +125,7 @@ struct property *sym_get_default_prop(struct symbol *sym)
 	return NULL;
 }
 
-struct property *sym_get_range_prop(struct symbol *sym)
+static struct property *sym_get_range_prop(struct symbol *sym)
 {
 	struct property *prop;
 
@@ -205,6 +205,16 @@ static void sym_calc_visibility(struct symbol *sym)
 	}
 	if (sym_is_choice_value(sym))
 		return;
+	/* defaulting to "yes" if no explicit "depends on" are given */
+	tri = yes;
+	if (sym->dir_dep.expr)
+		tri = expr_calc_value(sym->dir_dep.expr);
+	if (tri == mod)
+		tri = yes;
+	if (sym->dir_dep.tri != tri) {
+		sym->dir_dep.tri = tri;
+		sym_set_changed(sym);
+	}
 	tri = no;
 	if (sym->rev_dep.expr)
 		tri = expr_calc_value(sym->rev_dep.expr);
@@ -216,44 +226,63 @@ static void sym_calc_visibility(struct symbol *sym)
 	}
 }
 
-static struct symbol *sym_calc_choice(struct symbol *sym)
+/*
+ * Find the default symbol for a choice.
+ * First try the default values for the choice symbol
+ * Next locate the first visible choice value
+ * Return NULL if none was found
+ */
+struct symbol *sym_choice_default(struct symbol *sym)
 {
 	struct symbol *def_sym;
 	struct property *prop;
 	struct expr *e;
 
-	/* is the user choice visible? */
-	def_sym = sym->def[S_DEF_USER].val;
-	if (def_sym) {
-		sym_calc_visibility(def_sym);
-		if (def_sym->visible != no)
-			return def_sym;
-	}
-
 	/* any of the defaults visible? */
 	for_all_defaults(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
 		if (prop->visible.tri == no)
 			continue;
 		def_sym = prop_get_symbol(prop);
-		sym_calc_visibility(def_sym);
 		if (def_sym->visible != no)
 			return def_sym;
 	}
 
 	/* just get the first visible value */
 	prop = sym_get_choice_prop(sym);
-	expr_list_for_each_sym(prop->expr, e, def_sym) {
-		sym_calc_visibility(def_sym);
+	expr_list_for_each_sym(prop->expr, e, def_sym)
 		if (def_sym->visible != no)
 			return def_sym;
-	}
 
-	/* no choice? reset tristate value */
-	sym->curr.tri = no;
+	/* failed to locate any defaults */
 	return NULL;
 }
 
+static struct symbol *sym_calc_choice(struct symbol *sym)
+{
+	struct symbol *def_sym;
+	struct property *prop;
+	struct expr *e;
+
+	/* first calculate all choice values' visibilities */
+	prop = sym_get_choice_prop(sym);
+	expr_list_for_each_sym(prop->expr, e, def_sym)
+		sym_calc_visibility(def_sym);
+
+	/* is the user choice visible? */
+	def_sym = sym->def[S_DEF_USER].val;
+	if (def_sym && def_sym->visible != no)
+		return def_sym;
+
+	def_sym = sym_choice_default(sym);
+
+	if (def_sym == NULL)
+		/* no choice? reset tristate value */
+		sym->curr.tri = no;
+
+	return def_sym;
+}
+
 void sym_calc_value(struct symbol *sym)
 {
 	struct symbol_value newval, oldval;
@@ -321,6 +350,14 @@ void sym_calc_value(struct symbol *sym)
 				}
 			}
 		calc_newval:
+			if (sym->dir_dep.tri == no && sym->rev_dep.tri != no) {
+				fprintf(stderr, "warning: (");
+				expr_fprint(sym->rev_dep.expr, stderr);
+				fprintf(stderr, ") selects %s which has unmet direct dependencies (",
+					sym->name);
+				expr_fprint(sym->dir_dep.expr, stderr);
+				fprintf(stderr, ")\n");
+			}
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
 		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
@@ -365,12 +402,13 @@ void sym_calc_value(struct symbol *sym)
 
 	if (sym_is_choice(sym)) {
 		struct symbol *choice_sym;
-		int flags = sym->flags & (SYMBOL_CHANGED | SYMBOL_WRITE);
 
 		prop = sym_get_choice_prop(sym);
 		expr_list_for_each_sym(prop->expr, e, choice_sym) {
-			choice_sym->flags |= flags;
-			if (flags & SYMBOL_CHANGED)
+			if ((sym->flags & SYMBOL_WRITE) &&
+			    choice_sym->visible != no)
+				choice_sym->flags |= SYMBOL_WRITE;
+			if (sym->flags & SYMBOL_CHANGED)
 				sym_set_changed(choice_sym);
 		}
 	}
@@ -623,6 +661,80 @@ bool sym_set_string_value(struct symbol *sym, const char *newval)
 	return true;
 }
 
+/*
+ * Find the default value associated to a symbol.
+ * For tristate symbol handle the modules=n case
+ * in which case "m" becomes "y".
+ * If the symbol does not have any default then fallback
+ * to the fixed default values.
+ */
+const char *sym_get_string_default(struct symbol *sym)
+{
+	struct property *prop;
+	struct symbol *ds;
+	const char *str;
+	tristate val;
+
+	sym_calc_visibility(sym);
+	sym_calc_value(modules_sym);
+	val = symbol_no.curr.tri;
+	str = symbol_empty.curr.val;
+
+	/* If symbol has a default value look it up */
+	prop = sym_get_default_prop(sym);
+	if (prop != NULL) {
+		switch (sym->type) {
+		case S_BOOLEAN:
+		case S_TRISTATE:
+			/* The visibility imay limit the value from yes => mod */
+			val = EXPR_AND(expr_calc_value(prop->expr), prop->visible.tri);
+			break;
+		default:
+			/*
+			 * The following fails to handle the situation
+			 * where a default value is further limited by
+			 * the valid range.
+			 */
+			ds = prop_get_symbol(prop);
+			if (ds != NULL) {
+				sym_calc_value(ds);
+				str = (const char *)ds->curr.val;
+			}
+		}
+	}
+
+	/* Handle select statements */
+	val = EXPR_OR(val, sym->rev_dep.tri);
+
+	/* transpose mod to yes if modules are not enabled */
+	if (val == mod)
+		if (!sym_is_choice_value(sym) && modules_sym->curr.tri == no)
+			val = yes;
+
+	/* transpose mod to yes if type is bool */
+	if (sym->type == S_BOOLEAN && val == mod)
+		val = yes;
+
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		switch (val) {
+		case no: return "n";
+		case mod: return "m";
+		case yes: return "y";
+		}
+	case S_INT:
+	case S_HEX:
+		return str;
+	case S_STRING:
+		return str;
+	case S_OTHER:
+	case S_UNKNOWN:
+		break;
+	}
+	return "";
+}
+
 const char *sym_get_string_value(struct symbol *sym)
 {
 	tristate val;
@@ -651,12 +763,20 @@ bool sym_is_changable(struct symbol *sym)
 	return sym->visible > sym->rev_dep.tri;
 }
 
+static unsigned strhash(const char *s)
+{
+	/* fnv32 hash */
+	unsigned hash = 2166136261U;
+	for (; *s; s++)
+		hash = (hash ^ *s) * 0x01000193;
+	return hash;
+}
+
 struct symbol *sym_lookup(const char *name, int flags)
 {
 	struct symbol *symbol;
-	const char *ptr;
 	char *new_name;
-	int hash = 0;
+	int hash;
 
 	if (name) {
 		if (name[0] && !name[1]) {
@@ -666,12 +786,11 @@ struct symbol *sym_lookup(const char *name, int flags)
 			case 'n': return &symbol_no;
 			}
 		}
-		for (ptr = name; *ptr; ptr++)
-			hash += *ptr;
-		hash &= 0xff;
+		hash = strhash(name) % SYMBOL_HASHSIZE;
 
 		for (symbol = symbol_hash[hash]; symbol; symbol = symbol->next) {
-			if (!strcmp(symbol->name, name) &&
+			if (symbol->name &&
+			    !strcmp(symbol->name, name) &&
 			    (flags ? symbol->flags & flags
 				   : !(symbol->flags & (SYMBOL_CONST|SYMBOL_CHOICE))))
 				return symbol;
@@ -679,7 +798,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 		new_name = strdup(name);
 	} else {
 		new_name = NULL;
-		hash = 256;
+		hash = 0;
 	}
 
 	symbol = malloc(sizeof(*symbol));
@@ -697,7 +816,6 @@ struct symbol *sym_lookup(const char *name, int flags)
 struct symbol *sym_find(const char *name)
 {
 	struct symbol *symbol = NULL;
-	const char *ptr;
 	int hash = 0;
 
 	if (!name)
@@ -710,12 +828,11 @@ struct symbol *sym_find(const char *name)
 		case 'n': return &symbol_no;
 		}
 	}
-	for (ptr = name; *ptr; ptr++)
-		hash += *ptr;
-	hash &= 0xff;
+	hash = strhash(name) % SYMBOL_HASHSIZE;
 
 	for (symbol = symbol_hash[hash]; symbol; symbol = symbol->next) {
-		if (!strcmp(symbol->name, name) &&
+		if (symbol->name &&
+		    !strcmp(symbol->name, name) &&
 		    !(symbol->flags & SYMBOL_CONST))
 				break;
 	}
@@ -750,6 +867,7 @@ struct symbol **sym_re_search(const char *pattern)
 				return NULL;
 			}
 		}
+		sym_calc_value(sym);
 		sym_arr[cnt++] = sym;
 	}
 	if (sym_arr)
@@ -759,6 +877,110 @@ struct symbol **sym_re_search(const char *pattern)
 	return sym_arr;
 }
 
+/*
+ * When we check for recursive dependencies we use a stack to save
+ * current state so we can print out relevant info to user.
+ * The entries are located on the call stack so no need to free memory.
+ * Note inser() remove() must always match to properly clear the stack.
+ */
+static struct dep_stack {
+	struct dep_stack *prev, *next;
+	struct symbol *sym;
+	struct property *prop;
+	struct expr *expr;
+} *check_top;
+
+static void dep_stack_insert(struct dep_stack *stack, struct symbol *sym)
+{
+	memset(stack, 0, sizeof(*stack));
+	if (check_top)
+		check_top->next = stack;
+	stack->prev = check_top;
+	stack->sym = sym;
+	check_top = stack;
+}
+
+static void dep_stack_remove(void)
+{
+	check_top = check_top->prev;
+	if (check_top)
+		check_top->next = NULL;
+}
+
+/*
+ * Called when we have detected a recursive dependency.
+ * check_top point to the top of the stact so we use
+ * the ->prev pointer to locate the bottom of the stack.
+ */
+static void sym_check_print_recursive(struct symbol *last_sym)
+{
+	struct dep_stack *stack;
+	struct symbol *sym, *next_sym;
+	struct menu *menu = NULL;
+	struct property *prop;
+	struct dep_stack cv_stack;
+
+	if (sym_is_choice_value(last_sym)) {
+		dep_stack_insert(&cv_stack, last_sym);
+		last_sym = prop_get_symbol(sym_get_choice_prop(last_sym));
+	}
+
+	for (stack = check_top; stack != NULL; stack = stack->prev)
+		if (stack->sym == last_sym)
+			break;
+	if (!stack) {
+		fprintf(stderr, "unexpected recursive dependency error\n");
+		return;
+	}
+
+	for (; stack; stack = stack->next) {
+		sym = stack->sym;
+		next_sym = stack->next ? stack->next->sym : last_sym;
+		prop = stack->prop;
+
+		/* for choice values find the menu entry (used below) */
+		if (sym_is_choice(sym) || sym_is_choice_value(sym)) {
+			for (prop = sym->prop; prop; prop = prop->next) {
+				menu = prop->menu;
+				if (prop->menu)
+					break;
+			}
+		}
+		if (stack->sym == last_sym)
+			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
+				prop->file->name, prop->lineno);
+		if (stack->expr) {
+			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
+				prop->file->name, prop->lineno,
+				sym->name ? sym->name : "<choice>",
+				prop_get_type_name(prop->type),
+				next_sym->name ? next_sym->name : "<choice>");
+		} else if (stack->prop) {
+			fprintf(stderr, "%s:%d:\tsymbol %s depends on %s\n",
+				prop->file->name, prop->lineno,
+				sym->name ? sym->name : "<choice>",
+				next_sym->name ? next_sym->name : "<choice>");
+		} else if (sym_is_choice(sym)) {
+			fprintf(stderr, "%s:%d:\tchoice %s contains symbol %s\n",
+				menu->file->name, menu->lineno,
+				sym->name ? sym->name : "<choice>",
+				next_sym->name ? next_sym->name : "<choice>");
+		} else if (sym_is_choice_value(sym)) {
+			fprintf(stderr, "%s:%d:\tsymbol %s is part of choice %s\n",
+				menu->file->name, menu->lineno,
+				sym->name ? sym->name : "<choice>",
+				next_sym->name ? next_sym->name : "<choice>");
+		} else {
+			fprintf(stderr, "%s:%d:\tsymbol %s is selected by %s\n",
+				prop->file->name, prop->lineno,
+				sym->name ? sym->name : "<choice>",
+				next_sym->name ? next_sym->name : "<choice>");
+		}
+	}
+
+	if (check_top == &cv_stack)
+		dep_stack_remove();
+}
 
 static struct symbol *sym_check_expr_deps(struct expr *e)
 {
@@ -795,24 +1017,33 @@ static struct symbol *sym_check_sym_deps(struct symbol *sym)
 {
 	struct symbol *sym2;
 	struct property *prop;
+	struct dep_stack stack;
+
+	dep_stack_insert(&stack, sym);
 
 	sym2 = sym_check_expr_deps(sym->rev_dep.expr);
 	if (sym2)
-		return sym2;
+		goto out;
 
 	for (prop = sym->prop; prop; prop = prop->next) {
 		if (prop->type == P_CHOICE || prop->type == P_SELECT)
 			continue;
+		stack.prop = prop;
 		sym2 = sym_check_expr_deps(prop->visible.expr);
 		if (sym2)
 			break;
 		if (prop->type != P_DEFAULT || sym_is_choice(sym))
 			continue;
+		stack.expr = prop->expr;
 		sym2 = sym_check_expr_deps(prop->expr);
 		if (sym2)
 			break;
+		stack.expr = NULL;
 	}
 
+out:
+	dep_stack_remove();
+
 	return sym2;
 }
 
@@ -821,6 +1052,9 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 	struct symbol *sym, *sym2;
 	struct property *prop;
 	struct expr *e;
+	struct dep_stack stack;
+
+	dep_stack_insert(&stack, choice);
 
 	prop = sym_get_choice_prop(choice);
 	expr_list_for_each_sym(prop->expr, e, sym)
@@ -834,10 +1068,8 @@ static struct symbol *sym_check_choice_deps(struct symbol *choice)
 
 	expr_list_for_each_sym(prop->expr, e, sym) {
 		sym2 = sym_check_sym_deps(sym);
-		if (sym2) {
-			fprintf(stderr, " -> %s", sym->name);
+		if (sym2)
 			break;
-		}
 	}
 out:
 	expr_list_for_each_sym(prop->expr, e, sym)
@@ -847,6 +1079,8 @@ out:
 	    prop_get_symbol(sym_get_choice_prop(sym2)) == choice)
 		sym2 = choice;
 
+	dep_stack_remove();
+
 	return sym2;
 }
 
@@ -856,18 +1090,20 @@ struct symbol *sym_check_deps(struct symbol *sym)
 	struct property *prop;
 
 	if (sym->flags & SYMBOL_CHECK) {
-		fprintf(stderr, "%s:%d:error: found recursive dependency: %s",
-		        sym->prop->file->name, sym->prop->lineno,
-			sym->name ? sym->name : "<choice>");
+		sym_check_print_recursive(sym);
 		return sym;
 	}
 	if (sym->flags & SYMBOL_CHECKED)
 		return NULL;
 
 	if (sym_is_choice_value(sym)) {
+		struct dep_stack stack;
+
 		/* for choice groups start the check with main choice symbol */
+		dep_stack_insert(&stack, sym);
 		prop = sym_get_choice_prop(sym);
 		sym2 = sym_check_deps(prop_get_symbol(prop));
+		dep_stack_remove();
 	} else if (sym_is_choice(sym)) {
 		sym2 = sym_check_choice_deps(sym);
 	} else {
@@ -876,14 +1112,8 @@ struct symbol *sym_check_deps(struct symbol *sym)
 		sym->flags &= ~SYMBOL_CHECK;
 	}
 
-	if (sym2) {
-		fprintf(stderr, " -> %s", sym->name ? sym->name : "<choice>");
-		if (sym2 == sym) {
-			fprintf(stderr, "\n");
-			zconfnerrs++;
-			sym2 = NULL;
-		}
-	}
+	if (sym2 && sym2 == sym)
+		sym2 = NULL;
 
 	return sym2;
 }
@@ -937,13 +1167,15 @@ const char *prop_get_type_name(enum prop_type type)
 		return "select";
 	case P_RANGE:
 		return "range";
+	case P_SYMBOL:
+		return "symbol";
 	case P_UNKNOWN:
 		break;
 	}
 	return "unknown";
 }
 
-void prop_add_env(const char *env)
+static void prop_add_env(const char *env)
 {
 	struct symbol *sym, *sym2;
 	struct property *prop;
diff --git a/package/config/util.c b/package/config/util.c
index c382140..b15dbab 100644
--- a/package/config/util.c
+++ b/package/config/util.c
@@ -199,12 +199,13 @@ int file_write_dep(const char *name)
 }
 
 
-/* Allocate initial growable sting */
+/* Allocate initial growable string */
 struct gstr str_new(void)
 {
 	struct gstr gs;
 	gs.s = malloc(sizeof(char) * 64);
 	gs.len = 64;
+	gs.max_width = 0;
 	strcpy(gs.s, "\0");
 	return gs;
 }
@@ -215,6 +216,7 @@ struct gstr str_assign(const char *s)
 	struct gstr gs;
 	gs.s = strdup(s);
 	gs.len = strlen(s) + 1;
+	gs.max_width = 0;
 	return gs;
 }
 
diff --git a/package/config/zconf.gperf b/package/config/zconf.gperf
index 25ef5d0..d8bc742 100644
--- a/package/config/zconf.gperf
+++ b/package/config/zconf.gperf
@@ -9,6 +9,8 @@
 
 struct kconf_id;
 
+static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
+
 %%
 mainmenu,	T_MAINMENU,	TF_COMMAND
 menu,		T_MENU,		TF_COMMAND
diff --git a/package/config/zconf.hash.c_shipped b/package/config/zconf.hash.c_shipped
index 5c73d51..c1748fa 100644
--- a/package/config/zconf.hash.c_shipped
+++ b/package/config/zconf.hash.c_shipped
@@ -30,6 +30,8 @@
 #endif
 
 struct kconf_id;
+
+static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
 /* maximum key range = 47, duplicates = 0 */
 
 #ifdef __GNUC__
diff --git a/package/config/zconf.l b/package/config/zconf.l
index 21ff69c..d8f7236 100644
--- a/package/config/zconf.l
+++ b/package/config/zconf.l
@@ -39,7 +39,7 @@ static int last_ts, first_ts;
 static void zconf_endhelp(void);
 static void zconf_endfile(void);
 
-void new_string(void)
+static void new_string(void)
 {
 	text = malloc(START_STRSIZE);
 	text_asize = START_STRSIZE;
@@ -47,7 +47,7 @@ void new_string(void)
 	*text = 0;
 }
 
-void append_string(const char *str, int size)
+static void append_string(const char *str, int size)
 {
 	int new_size = text_size + size + 1;
 	if (new_size > text_asize) {
@@ -61,7 +61,7 @@ void append_string(const char *str, int size)
 	text[text_size] = 0;
 }
 
-void alloc_string(const char *str, int size)
+static void alloc_string(const char *str, int size)
 {
 	text = malloc(size + 1);
 	memcpy(text, str, size);
diff --git a/package/config/zconf.tab.c_shipped b/package/config/zconf.tab.c_shipped
index bb1e1da..73d8c19 100644
--- a/package/config/zconf.tab.c_shipped
+++ b/package/config/zconf.tab.c_shipped
@@ -1,24 +1,23 @@
-/* A Bison parser, made by GNU Bison 2.3.  */
 
-/* Skeleton implementation for Bison's Yacc-like parsers in C
+/* A Bison parser, made by GNU Bison 2.4.1.  */
 
-   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
+/* Skeleton implementation for Bison's Yacc-like parsers in C
+   
+      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
    Free Software Foundation, Inc.
-
-   This program is free software; you can redistribute it and/or modify
+   
+   This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
-   the Free Software Foundation; either version 2, or (at your option)
-   any later version.
-
+   the Free Software Foundation, either version 3 of the License, or
+   (at your option) any later version.
+   
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
-
+   
    You should have received a copy of the GNU General Public License
-   along with this program; if not, write to the Free Software
-   Foundation, Inc., 51 Franklin Street, Fifth Floor,
-   Boston, MA 02110-1301, USA.  */
+   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
 
 /* As a special exception, you may create a larger work that contains
    part or all of the Bison parser skeleton and distribute that work
@@ -29,7 +28,7 @@
    special exception, which will cause the skeleton and the resulting
    Bison output files to be licensed under the GNU General Public
    License without this special exception.
-
+   
    This special exception was added by the Free Software Foundation in
    version 2.2 of Bison.  */
 
@@ -47,7 +46,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.3"
+#define YYBISON_VERSION "2.4.1"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -55,94 +54,23 @@
 /* Pure parsers.  */
 #define YYPURE 0
 
+/* Push parsers.  */
+#define YYPUSH 0
+
+/* Pull parsers.  */
+#define YYPULL 1
+
 /* Using locations.  */
 #define YYLSP_NEEDED 0
 
 /* Substitute the variable and function names.  */
-#define yyparse zconfparse
-#define yylex   zconflex
-#define yyerror zconferror
-#define yylval  zconflval
-#define yychar  zconfchar
-#define yydebug zconfdebug
-#define yynerrs zconfnerrs
-
-
-/* Tokens.  */
-#ifndef YYTOKENTYPE
-# define YYTOKENTYPE
-   /* Put the tokens into the symbol table, so that GDB and other debuggers
-      know about them.  */
-   enum yytokentype {
-     T_MAINMENU = 258,
-     T_MENU = 259,
-     T_ENDMENU = 260,
-     T_SOURCE = 261,
-     T_CHOICE = 262,
-     T_ENDCHOICE = 263,
-     T_COMMENT = 264,
-     T_CONFIG = 265,
-     T_MENUCONFIG = 266,
-     T_HELP = 267,
-     T_HELPTEXT = 268,
-     T_IF = 269,
-     T_ENDIF = 270,
-     T_DEPENDS = 271,
-     T_OPTIONAL = 272,
-     T_PROMPT = 273,
-     T_TYPE = 274,
-     T_DEFAULT = 275,
-     T_SELECT = 276,
-     T_RANGE = 277,
-     T_OPTION = 278,
-     T_ON = 279,
-     T_WORD = 280,
-     T_WORD_QUOTE = 281,
-     T_UNEQUAL = 282,
-     T_CLOSE_PAREN = 283,
-     T_OPEN_PAREN = 284,
-     T_EOL = 285,
-     T_OR = 286,
-     T_AND = 287,
-     T_EQUAL = 288,
-     T_NOT = 289
-   };
-#endif
-/* Tokens.  */
-#define T_MAINMENU 258
-#define T_MENU 259
-#define T_ENDMENU 260
-#define T_SOURCE 261
-#define T_CHOICE 262
-#define T_ENDCHOICE 263
-#define T_COMMENT 264
-#define T_CONFIG 265
-#define T_MENUCONFIG 266
-#define T_HELP 267
-#define T_HELPTEXT 268
-#define T_IF 269
-#define T_ENDIF 270
-#define T_DEPENDS 271
-#define T_OPTIONAL 272
-#define T_PROMPT 273
-#define T_TYPE 274
-#define T_DEFAULT 275
-#define T_SELECT 276
-#define T_RANGE 277
-#define T_OPTION 278
-#define T_ON 279
-#define T_WORD 280
-#define T_WORD_QUOTE 281
-#define T_UNEQUAL 282
-#define T_CLOSE_PAREN 283
-#define T_OPEN_PAREN 284
-#define T_EOL 285
-#define T_OR 286
-#define T_AND 287
-#define T_EQUAL 288
-#define T_NOT 289
-
-
+#define yyparse         zconfparse
+#define yylex           zconflex
+#define yyerror         zconferror
+#define yylval          zconflval
+#define yychar          zconfchar
+#define yydebug         zconfdebug
+#define yynerrs         zconfnerrs
 
 
 /* Copy the first part of user declarations.  */
@@ -163,8 +91,6 @@
 #define LKC_DIRECT_LINK
 #include "lkc.h"
 
-#include "zconf.hash.c"
-
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
 
 #define PRINTD		0x0001
@@ -178,7 +104,7 @@ static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
 static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
 
-struct symbol *symbol_hash[257];
+struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
@@ -188,6 +114,7 @@ static struct menu *current_menu, *current_entry;
 #endif
 
 
+
 /* Enabling traces.  */
 #ifndef YYDEBUG
 # define YYDEBUG 0
@@ -206,31 +133,77 @@ static struct menu *current_menu, *current_entry;
 # define YYTOKEN_TABLE 0
 #endif
 
+
+/* Tokens.  */
+#ifndef YYTOKENTYPE
+# define YYTOKENTYPE
+   /* Put the tokens into the symbol table, so that GDB and other debuggers
+      know about them.  */
+   enum yytokentype {
+     T_MAINMENU = 258,
+     T_MENU = 259,
+     T_ENDMENU = 260,
+     T_SOURCE = 261,
+     T_CHOICE = 262,
+     T_ENDCHOICE = 263,
+     T_COMMENT = 264,
+     T_CONFIG = 265,
+     T_MENUCONFIG = 266,
+     T_HELP = 267,
+     T_HELPTEXT = 268,
+     T_IF = 269,
+     T_ENDIF = 270,
+     T_DEPENDS = 271,
+     T_OPTIONAL = 272,
+     T_PROMPT = 273,
+     T_TYPE = 274,
+     T_DEFAULT = 275,
+     T_SELECT = 276,
+     T_RANGE = 277,
+     T_OPTION = 278,
+     T_ON = 279,
+     T_WORD = 280,
+     T_WORD_QUOTE = 281,
+     T_UNEQUAL = 282,
+     T_CLOSE_PAREN = 283,
+     T_OPEN_PAREN = 284,
+     T_EOL = 285,
+     T_OR = 286,
+     T_AND = 287,
+     T_EQUAL = 288,
+     T_NOT = 289
+   };
+#endif
+
+
+
 #if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
 typedef union YYSTYPE
-
 {
+
+
 	char *string;
 	struct file *file;
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
 	struct kconf_id *id;
-}
-/* Line 187 of yacc.c.  */
 
-	YYSTYPE;
+
+
+} YYSTYPE;
+# define YYSTYPE_IS_TRIVIAL 1
 # define yystype YYSTYPE /* obsolescent; will be withdrawn */
 # define YYSTYPE_IS_DECLARED 1
-# define YYSTYPE_IS_TRIVIAL 1
 #endif
 
 
-
 /* Copy the second part of user declarations.  */
 
 
-/* Line 216 of yacc.c.  */
+/* Include zconf.hash.c here so it can see the token constants. */
+#include "zconf.hash.c"
+
 
 
 #ifdef short
@@ -306,14 +279,14 @@ typedef short int yytype_int16;
 #if (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 static int
-YYID (int i)
+YYID (int yyi)
 #else
 static int
-YYID (i)
-    int i;
+YYID (yyi)
+    int yyi;
 #endif
 {
-  return i;
+  return yyi;
 }
 #endif
 
@@ -394,9 +367,9 @@ void free (void *); /* INFRINGES ON USER NAME SPACE */
 /* A type that is properly aligned for any stack member.  */
 union yyalloc
 {
-  yytype_int16 yyss;
-  YYSTYPE yyvs;
-  };
+  yytype_int16 yyss_alloc;
+  YYSTYPE yyvs_alloc;
+};
 
 /* The size of the maximum gap between one aligned stack and the next.  */
 # define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)
@@ -430,12 +403,12 @@ union yyalloc
    elements in the stack, and YYPTR gives the new location of the
    stack.  Advance YYPTR to a properly aligned location for the next
    stack.  */
-# define YYSTACK_RELOCATE(Stack)					\
+# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
     do									\
       {									\
 	YYSIZE_T yynewbytes;						\
-	YYCOPY (&yyptr->Stack, Stack, yysize);				\
-	Stack = &yyptr->Stack;						\
+	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
+	Stack = &yyptr->Stack_alloc;					\
 	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
 	yyptr += yynewbytes / sizeof (*yyptr);				\
       }									\
@@ -558,18 +531,18 @@ static const yytype_int8 yyrhs[] =
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   104,   104,   106,   108,   109,   110,   111,   112,   113,
-     114,   118,   122,   122,   122,   122,   122,   122,   122,   126,
-     127,   128,   129,   130,   131,   135,   136,   142,   150,   156,
-     164,   174,   176,   177,   178,   179,   180,   181,   184,   192,
-     198,   208,   214,   220,   223,   225,   236,   237,   242,   251,
-     256,   264,   267,   269,   270,   271,   272,   273,   276,   282,
-     293,   299,   309,   311,   316,   324,   332,   335,   337,   338,
-     339,   344,   351,   356,   364,   367,   369,   370,   371,   374,
-     382,   389,   396,   402,   409,   411,   412,   413,   416,   424,
-     426,   431,   432,   435,   436,   437,   441,   442,   445,   446,
-     449,   450,   451,   452,   453,   454,   455,   458,   459,   462,
-     463
+       0,   107,   107,   109,   111,   112,   113,   114,   115,   116,
+     117,   121,   125,   125,   125,   125,   125,   125,   125,   129,
+     130,   131,   132,   133,   134,   138,   139,   145,   153,   159,
+     167,   177,   179,   180,   181,   182,   183,   184,   187,   195,
+     201,   211,   217,   223,   226,   228,   239,   240,   245,   254,
+     259,   267,   270,   272,   273,   274,   275,   276,   279,   285,
+     296,   302,   312,   314,   319,   327,   335,   338,   340,   341,
+     342,   347,   354,   359,   367,   370,   372,   373,   374,   377,
+     385,   392,   399,   405,   412,   414,   415,   416,   419,   427,
+     429,   434,   435,   438,   439,   440,   444,   445,   448,   449,
+     452,   453,   454,   455,   456,   457,   458,   461,   462,   465,
+     466
 };
 #endif
 
@@ -985,17 +958,20 @@ yy_symbol_print (yyoutput, yytype, yyvaluep)
 #if (defined __STDC__ || defined __C99__FUNC__ \
      || defined __cplusplus || defined _MSC_VER)
 static void
-yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
+yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
 #else
 static void
-yy_stack_print (bottom, top)
-    yytype_int16 *bottom;
-    yytype_int16 *top;
+yy_stack_print (yybottom, yytop)
+    yytype_int16 *yybottom;
+    yytype_int16 *yytop;
 #endif
 {
   YYFPRINTF (stderr, "Stack now");
-  for (; bottom <= top; ++bottom)
-    YYFPRINTF (stderr, " %d", *bottom);
+  for (; yybottom <= yytop; yybottom++)
+    {
+      int yybot = *yybottom;
+      YYFPRINTF (stderr, " %d", yybot);
+    }
   YYFPRINTF (stderr, "\n");
 }
 
@@ -1029,11 +1005,11 @@ yy_reduce_print (yyvsp, yyrule)
   /* The symbols being reduced.  */
   for (yyi = 0; yyi < yynrhs; yyi++)
     {
-      fprintf (stderr, "   $%d = ", yyi + 1);
+      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
       yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
 		       &(yyvsp[(yyi + 1) - (yynrhs)])
 		       		       );
-      fprintf (stderr, "\n");
+      YYFPRINTF (stderr, "\n");
     }
 }
 
@@ -1343,10 +1319,8 @@ yydestruct (yymsg, yytype, yyvaluep)
 	break;
     }
 }
-
 
 /* Prevent warnings from -Wmissing-prototypes.  */
-
 #ifdef YYPARSE_PARAM
 #if defined __STDC__ || defined __cplusplus
 int yyparse (void *YYPARSE_PARAM);
@@ -1362,11 +1336,10 @@ int yyparse ();
 #endif /* ! YYPARSE_PARAM */
 
 
-
-/* The look-ahead symbol.  */
+/* The lookahead symbol.  */
 int yychar;
 
-/* The semantic value of the look-ahead symbol.  */
+/* The semantic value of the lookahead symbol.  */
 YYSTYPE yylval;
 
 /* Number of syntax errors so far.  */
@@ -1374,9 +1347,9 @@ int yynerrs;
 
 
 
-/*----------.
-| yyparse.  |
-`----------*/
+/*-------------------------.
+| yyparse or yypush_parse.  |
+`-------------------------*/
 
 #ifdef YYPARSE_PARAM
 #if (defined __STDC__ || defined __C99__FUNC__ \
@@ -1400,66 +1373,68 @@ yyparse ()
 #endif
 #endif
 {
-  
-  int yystate;
-  int yyn;
-  int yyresult;
-  /* Number of tokens to shift before error messages enabled.  */
-  int yyerrstatus;
-  /* Look-ahead token as an internal (translated) token number.  */
-  int yytoken = 0;
-#if YYERROR_VERBOSE
-  /* Buffer for error messages, and its allocated size.  */
-  char yymsgbuf[128];
-  char *yymsg = yymsgbuf;
-  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
-#endif
-
-  /* Three stacks and their tools:
-     `yyss': related to states,
-     `yyvs': related to semantic values,
-     `yyls': related to locations.
 
-     Refer to the stacks thru separate pointers, to allow yyoverflow
-     to reallocate them elsewhere.  */
 
-  /* The state stack.  */
-  yytype_int16 yyssa[YYINITDEPTH];
-  yytype_int16 *yyss = yyssa;
-  yytype_int16 *yyssp;
+    int yystate;
+    /* Number of tokens to shift before error messages enabled.  */
+    int yyerrstatus;
 
-  /* The semantic value stack.  */
-  YYSTYPE yyvsa[YYINITDEPTH];
-  YYSTYPE *yyvs = yyvsa;
-  YYSTYPE *yyvsp;
+    /* The stacks and their tools:
+       `yyss': related to states.
+       `yyvs': related to semantic values.
 
+       Refer to the stacks thru separate pointers, to allow yyoverflow
+       to reallocate them elsewhere.  */
 
+    /* The state stack.  */
+    yytype_int16 yyssa[YYINITDEPTH];
+    yytype_int16 *yyss;
+    yytype_int16 *yyssp;
 
-#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))
+    /* The semantic value stack.  */
+    YYSTYPE yyvsa[YYINITDEPTH];
+    YYSTYPE *yyvs;
+    YYSTYPE *yyvsp;
 
-  YYSIZE_T yystacksize = YYINITDEPTH;
+    YYSIZE_T yystacksize;
 
+  int yyn;
+  int yyresult;
+  /* Lookahead token as an internal (translated) token number.  */
+  int yytoken;
   /* The variables used to return semantic value and location from the
      action routines.  */
   YYSTYPE yyval;
 
+#if YYERROR_VERBOSE
+  /* Buffer for error messages, and its allocated size.  */
+  char yymsgbuf[128];
+  char *yymsg = yymsgbuf;
+  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
+#endif
+
+#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))
 
   /* The number of symbols on the RHS of the reduced rule.
      Keep to zero when no symbol should be popped.  */
   int yylen = 0;
 
+  yytoken = 0;
+  yyss = yyssa;
+  yyvs = yyvsa;
+  yystacksize = YYINITDEPTH;
+
   YYDPRINTF ((stderr, "Starting parse\n"));
 
   yystate = 0;
   yyerrstatus = 0;
   yynerrs = 0;
-  yychar = YYEMPTY;		/* Cause a token to be read.  */
+  yychar = YYEMPTY; /* Cause a token to be read.  */
 
   /* Initialize stack pointers.
      Waste one element of value and location stack
      so that they stay on the same level as the state stack.
      The wasted elements are never initialized.  */
-
   yyssp = yyss;
   yyvsp = yyvs;
 
@@ -1489,7 +1464,6 @@ yyparse ()
 	YYSTYPE *yyvs1 = yyvs;
 	yytype_int16 *yyss1 = yyss;
 
-
 	/* Each stack pointer address is followed by the size of the
 	   data in use in that stack, in bytes.  This used to be a
 	   conditional around just the two extra args, but that might
@@ -1497,7 +1471,6 @@ yyparse ()
 	yyoverflow (YY_("memory exhausted"),
 		    &yyss1, yysize * sizeof (*yyssp),
 		    &yyvs1, yysize * sizeof (*yyvsp),
-
 		    &yystacksize);
 
 	yyss = yyss1;
@@ -1520,9 +1493,8 @@ yyparse ()
 	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
 	if (! yyptr)
 	  goto yyexhaustedlab;
-	YYSTACK_RELOCATE (yyss);
-	YYSTACK_RELOCATE (yyvs);
-
+	YYSTACK_RELOCATE (yyss_alloc, yyss);
+	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
 #  undef YYSTACK_RELOCATE
 	if (yyss1 != yyssa)
 	  YYSTACK_FREE (yyss1);
@@ -1533,7 +1505,6 @@ yyparse ()
       yyssp = yyss + yysize - 1;
       yyvsp = yyvs + yysize - 1;
 
-
       YYDPRINTF ((stderr, "Stack size increased to %lu\n",
 		  (unsigned long int) yystacksize));
 
@@ -1543,6 +1514,9 @@ yyparse ()
 
   YYDPRINTF ((stderr, "Entering state %d\n", yystate));
 
+  if (yystate == YYFINAL)
+    YYACCEPT;
+
   goto yybackup;
 
 /*-----------.
@@ -1551,16 +1525,16 @@ yyparse ()
 yybackup:
 
   /* Do appropriate processing given the current state.  Read a
-     look-ahead token if we need one and don't already have one.  */
+     lookahead token if we need one and don't already have one.  */
 
-  /* First try to decide what to do without reference to look-ahead token.  */
+  /* First try to decide what to do without reference to lookahead token.  */
   yyn = yypact[yystate];
   if (yyn == YYPACT_NINF)
     goto yydefault;
 
-  /* Not known => get a look-ahead token if don't already have one.  */
+  /* Not known => get a lookahead token if don't already have one.  */
 
-  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
+  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
   if (yychar == YYEMPTY)
     {
       YYDPRINTF ((stderr, "Reading a token: "));
@@ -1592,20 +1566,16 @@ yybackup:
       goto yyreduce;
     }
 
-  if (yyn == YYFINAL)
-    YYACCEPT;
-
   /* Count tokens shifted since error; after three, turn off error
      status.  */
   if (yyerrstatus)
     yyerrstatus--;
 
-  /* Shift the look-ahead token.  */
+  /* Shift the lookahead token.  */
   YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
 
-  /* Discard the shifted token unless it is eof.  */
-  if (yychar != YYEOF)
-    yychar = YYEMPTY;
+  /* Discard the shifted token.  */
+  yychar = YYEMPTY;
 
   yystate = yyn;
   *++yyvsp = yylval;
@@ -2029,7 +1999,6 @@ yyreduce:
     break;
 
 
-/* Line 1267 of yacc.c.  */
 
       default: break;
     }
@@ -2041,7 +2010,6 @@ yyreduce:
 
   *++yyvsp = yyval;
 
-
   /* Now `shift' the result of the reduction.  Determine what state
      that goes to, based on the state we popped back to and the rule
      number reduced by.  */
@@ -2106,7 +2074,7 @@ yyerrlab:
 
   if (yyerrstatus == 3)
     {
-      /* If just tried and failed to reuse look-ahead token after an
+      /* If just tried and failed to reuse lookahead token after an
 	 error, discard it.  */
 
       if (yychar <= YYEOF)
@@ -2123,7 +2091,7 @@ yyerrlab:
 	}
     }
 
-  /* Else will try to reuse look-ahead token after shifting the error
+  /* Else will try to reuse lookahead token after shifting the error
      token.  */
   goto yyerrlab1;
 
@@ -2180,9 +2148,6 @@ yyerrlab1:
       YY_STACK_PRINT (yyss, yyssp);
     }
 
-  if (yyn == YYFINAL)
-    YYACCEPT;
-
   *++yyvsp = yylval;
 
 
@@ -2207,7 +2172,7 @@ yyabortlab:
   yyresult = 1;
   goto yyreturn;
 
-#ifndef yyoverflow
+#if !defined(yyoverflow) || YYERROR_VERBOSE
 /*-------------------------------------------------.
 | yyexhaustedlab -- memory exhaustion comes here.  |
 `-------------------------------------------------*/
@@ -2218,7 +2183,7 @@ yyexhaustedlab:
 #endif
 
 yyreturn:
-  if (yychar != YYEOF && yychar != YYEMPTY)
+  if (yychar != YYEMPTY)
      yydestruct ("Cleanup: discarding lookahead",
 		 yytoken, &yylval);
   /* Do not reclaim the symbols of the rule which action triggered
@@ -2255,7 +2220,7 @@ void conf_parse(const char *name)
 	zconf_initscan(name);
 
 	sym_init();
-	menu_init();
+	_menu_init();
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
@@ -2284,7 +2249,7 @@ void conf_parse(const char *name)
 	sym_set_change_count(1);
 }
 
-const char *zconf_tokenname(int token)
+static const char *zconf_tokenname(int token)
 {
 	switch (token) {
 	case T_MENU:		return "menu";
@@ -2348,7 +2313,7 @@ static void zconferror(const char *err)
 #endif
 }
 
-void print_quoted_string(FILE *out, const char *str)
+static void print_quoted_string(FILE *out, const char *str)
 {
 	const char *p;
 	int len;
@@ -2365,15 +2330,15 @@ void print_quoted_string(FILE *out, const char *str)
 	putc('"', out);
 }
 
-void print_symbol(FILE *out, struct menu *menu)
+static void print_symbol(FILE *out, struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
 	struct property *prop;
 
 	if (sym_is_choice(sym))
-		fprintf(out, "choice\n");
+		fprintf(out, "\nchoice\n");
 	else
-		fprintf(out, "config %s\n", sym->name);
+		fprintf(out, "\nconfig %s\n", sym->name);
 	switch (sym->type) {
 	case S_BOOLEAN:
 		fputs("  boolean\n", out);
@@ -2419,6 +2384,21 @@ void print_symbol(FILE *out, struct menu *menu)
 		case P_CHOICE:
 			fputs("  #choice value\n", out);
 			break;
+		case P_SELECT:
+			fputs( "  select ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
+		case P_RANGE:
+			fputs( "  range ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
+		case P_MENU:
+			fputs( "  menu ", out);
+			print_quoted_string(out, prop->text);
+			fputc('\n', out);
+			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
 			break;
@@ -2430,7 +2410,6 @@ void print_symbol(FILE *out, struct menu *menu)
 			menu->help[len] = 0;
 		fprintf(out, "  help\n%s\n", menu->help);
 	}
-	fputc('\n', out);
 }
 
 void zconfdump(FILE *out)
@@ -2463,7 +2442,6 @@ void zconfdump(FILE *out)
 				expr_fprint(prop->visible.expr, out);
 				fputc('\n', out);
 			}
-			fputs("\n", out);
 		}
 
 		if (menu->list)
diff --git a/package/config/zconf.y b/package/config/zconf.y
index 62eee9c..956add1 100644
--- a/package/config/zconf.y
+++ b/package/config/zconf.y
@@ -14,8 +14,6 @@
 #define LKC_DIRECT_LINK
 #include "lkc.h"
 
-#include "zconf.hash.c"
-
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
 
 #define PRINTD		0x0001
@@ -29,7 +27,7 @@ static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
 static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
 
-struct symbol *symbol_hash[257];
+struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
@@ -100,6 +98,11 @@ static struct menu *current_menu, *current_entry;
 		menu_end_menu();
 } if_entry menu_entry choice_entry
 
+%{
+/* Include zconf.hash.c here so it can see the token constants. */
+#include "zconf.hash.c"
+%}
+
 %%
 input: stmt_list;
 
@@ -472,7 +475,7 @@ void conf_parse(const char *name)
 	zconf_initscan(name);
 
 	sym_init();
-	menu_init();
+	_menu_init();
 	modules_sym = sym_lookup(NULL, 0);
 	modules_sym->type = S_BOOLEAN;
 	modules_sym->flags |= SYMBOL_AUTO;
@@ -501,7 +504,7 @@ void conf_parse(const char *name)
 	sym_set_change_count(1);
 }
 
-const char *zconf_tokenname(int token)
+static const char *zconf_tokenname(int token)
 {
 	switch (token) {
 	case T_MENU:		return "menu";
@@ -565,7 +568,7 @@ static void zconferror(const char *err)
 #endif
 }
 
-void print_quoted_string(FILE *out, const char *str)
+static void print_quoted_string(FILE *out, const char *str)
 {
 	const char *p;
 	int len;
@@ -582,15 +585,15 @@ void print_quoted_string(FILE *out, const char *str)
 	putc('"', out);
 }
 
-void print_symbol(FILE *out, struct menu *menu)
+static void print_symbol(FILE *out, struct menu *menu)
 {
 	struct symbol *sym = menu->sym;
 	struct property *prop;
 
 	if (sym_is_choice(sym))
-		fprintf(out, "choice\n");
+		fprintf(out, "\nchoice\n");
 	else
-		fprintf(out, "config %s\n", sym->name);
+		fprintf(out, "\nconfig %s\n", sym->name);
 	switch (sym->type) {
 	case S_BOOLEAN:
 		fputs("  boolean\n", out);
@@ -636,6 +639,21 @@ void print_symbol(FILE *out, struct menu *menu)
 		case P_CHOICE:
 			fputs("  #choice value\n", out);
 			break;
+		case P_SELECT:
+			fputs( "  select ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
+		case P_RANGE:
+			fputs( "  range ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
+		case P_MENU:
+			fputs( "  menu ", out);
+			print_quoted_string(out, prop->text);
+			fputc('\n', out);
+			break;
 		default:
 			fprintf(out, "  unknown prop %d!\n", prop->type);
 			break;
@@ -647,7 +665,6 @@ void print_symbol(FILE *out, struct menu *menu)
 			menu->help[len] = 0;
 		fprintf(out, "  help\n%s\n", menu->help);
 	}
-	fputc('\n', out);
 }
 
 void zconfdump(FILE *out)
@@ -680,7 +697,6 @@ void zconfdump(FILE *out)
 				expr_fprint(prop->visible.expr, out);
 				fputc('\n', out);
 			}
-			fputs("\n", out);
 		}
 
 		if (menu->list)
-- 
1.7.0.4
