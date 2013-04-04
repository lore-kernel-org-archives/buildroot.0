From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Apr 2013 23:24:24 +0200
Subject: [Buildroot] [PATCH 1/2] support/kconfig: upgrade to 3.9-rc2
In-Reply-To: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365110666-3080-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365110666-3080-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our kconfig code is updated to the version of kernel 3.9-rc2. No major
issues during the migration, except:

 * Some conflicts when applying 03-change-config-option-prefix.patch
   due to upstream kernel changes.

 * The need of adding a new patch, 15-fix-qconf-moc-rule.patch, to fix
   the make rule that generates the moc file for the Qt-based
   interface.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/Makefile                           |  145 +++----
 support/kconfig/README.buildroot2                  |    2 +-
 support/kconfig/check.sh                           |    2 +-
 support/kconfig/conf.c                             |   98 +++--
 support/kconfig/confdata.c                         |  369 ++++++++++++------
 support/kconfig/expr.c                             |   15 +-
 support/kconfig/expr.h                             |   12 +-
 support/kconfig/gconf.c                            |   51 +--
 support/kconfig/kconfig_load.c                     |   35 --
 support/kconfig/kxgettext.c                        |    1 -
 support/kconfig/list.h                             |   91 +++++
 support/kconfig/lkc.h                              |   32 +-
 support/kconfig/lkc_proto.h                        |    7 +-
 support/kconfig/lxdialog/check-lxdialog.sh         |   11 +-
 support/kconfig/lxdialog/dialog.h                  |   10 +-
 support/kconfig/lxdialog/inputbox.c                |  121 ++++--
 support/kconfig/lxdialog/menubox.c                 |   20 +-
 support/kconfig/lxdialog/textbox.c                 |  177 +++++----
 support/kconfig/lxdialog/util.c                    |    7 +
 support/kconfig/mconf.c                            |  269 +++++++++----
 support/kconfig/menu.c                             |   75 +++-
 support/kconfig/merge_config.sh                    |  142 +++++++
 support/kconfig/nconf.c                            |  401 ++++++++++----------
 support/kconfig/nconf.gui.c                        |   69 +++-
 support/kconfig/nconf.h                            |    2 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   32 +-
 .../patches/02-cpp-comments-to-c-comments.patch    |   30 +-
 .../patches/03-change-config-option-prefix.patch   |  174 ++++-----
 .../patches/06-br-build-system-integration.patch   |   10 +-
 .../patches/09-implement-kconfig-probability.patch |   10 +-
 support/kconfig/patches/10-br-build-system.patch   |    8 +-
 .../patches/11-use-mktemp-for-lxdialog.patch       |    8 +-
 .../kconfig/patches/12-fix-glade-file-path.patch   |    8 +-
 .../patches/14-support-out-of-tree-config.patch    |   38 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   24 ++
 support/kconfig/patches/series                     |    1 +
 support/kconfig/qconf.cc                           |   18 +-
 support/kconfig/qconf.h                            |    2 +-
 support/kconfig/streamline_config.pl               |  291 +++++++++++---
 support/kconfig/symbol.c                           |   66 +++-
 support/kconfig/util.c                             |   25 +-
 support/kconfig/zconf.gperf                        |    2 +-
 support/kconfig/zconf.hash.c_shipped               |  273 +++++++------
 support/kconfig/zconf.l                            |   17 +-
 .../{lex.zconf.c_shipped => zconf.lex.c_shipped}   |   35 +-
 support/kconfig/zconf.tab.c_shipped                |   69 ++--
 support/kconfig/zconf.y                            |   19 +-
 47 files changed, 2076 insertions(+), 1248 deletions(-)
 delete mode 100644 support/kconfig/kconfig_load.c
 create mode 100644 support/kconfig/list.h
 create mode 100755 support/kconfig/merge_config.sh
 create mode 100644 support/kconfig/patches/15-fix-qconf-moc-rule.patch
 rename support/kconfig/{lex.zconf.c_shipped => zconf.lex.c_shipped} (98%)

diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
index f2def76..d28b7ac 100644
--- a/support/kconfig/Makefile
+++ b/support/kconfig/Makefile
@@ -11,6 +11,9 @@ else
 Kconfig := Kconfig
 endif
 
+# We need this, in case the user has it in its environment
+unexport CONFIG_
+
 xconfig: $(obj)/qconf
 	$< $(Kconfig)
 
@@ -33,17 +36,9 @@ silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/generated
 	$< --$@ $(Kconfig)
 
-# if no path is given, then use src directory to find file
-ifdef LSMOD
-LSMOD_F := $(LSMOD)
-ifeq ($(findstring /,$(LSMOD)),)
-  LSMOD_F := $(objtree)/$(LSMOD)
-endif
-endif
-
-localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
+localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
+	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
 			(mv -f .config .config.old.1;			\
@@ -56,27 +51,10 @@ localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	fi
 	$(Q)rm -f .tmp.config
 
-localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
-	$(Q)mkdir -p include/generated
-	$(Q)perl $< $(srctree) $(Kconfig) $(LSMOD_F) > .tmp.config
-	$(Q)sed -i s/=m/=y/ .tmp.config
-	$(Q)if [ -f .config ]; then					\
-			cmp -s .tmp.config .config ||			\
-			(mv -f .config .config.old.1;			\
-			 mv -f .tmp.config .config;			\
-			 $(obj)/conf --silentoldconfig $(Kconfig);	\
-			 mv -f .config.old.1 .config.old)		\
-	else								\
-			mv -f .tmp.config .config;			\
-			$(obj)/conf --silentoldconfig $(Kconfig);	\
-	fi
-	$(Q)rm -f .tmp.config
-
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
-# The symlink is used to repair a deficiency in arch/um
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
-	$(Q)echo "  GEN config"
+	$(Q)echo "  GEN     config.pot"
 	$(Q)xgettext --default-domain=linux                         \
 	    --add-comments --keyword=_ --keyword=N_                 \
 	    --from-code=UTF-8                                       \
@@ -84,16 +62,16 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	    --directory=$(srctree) --directory=$(objtree)           \
 	    --output $(obj)/config.pot
 	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
-	$(Q)ln -fs Kconfig.x86 arch/um/Kconfig
-	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig`;    \
+	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig      \
+	    $(srctree)/arch/*/um/Kconfig`;               \
 	    do                                           \
-		echo "  GEN $$i";                        \
+		echo "  GEN     $$i";                    \
 		$(obj)/kxgettext $$i                     \
 		     >> $(obj)/config.pot;               \
 	    done )
+	$(Q)echo "  GEN     linux.pot"
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
-	$(Q)rm -f $(srctree)/arch/um/Kconfig
 	$(Q)rm -f $(obj)/config.pot
 
 PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
@@ -101,11 +79,17 @@ PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
 allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
-PHONY += listnewconfig oldnoconfig savedefconfig defconfig
+PHONY += listnewconfig olddefconfig oldnoconfig savedefconfig defconfig
 
-listnewconfig oldnoconfig: $(obj)/conf
+listnewconfig olddefconfig: $(obj)/conf
 	$< --$@ $(Kconfig)
 
+# oldnoconfig is an alias of olddefconfig, because people already are dependent
+# on its behavior(sets new symbols to their default value but not 'n') with the
+# counter-intuitive name.
+oldnoconfig: $(obj)/conf
+	$< --olddefconfig $(Kconfig)
+
 savedefconfig: $(obj)/conf
 	$< --$@=defconfig $(Kconfig)
 
@@ -139,7 +123,7 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  oldnoconfig     - Same as silentoldconfig but set new symbols to n (unset)'
+	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their default value'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
@@ -170,8 +154,8 @@ mconf-objs     := mconf.o zconf.tab.o $(lxdialog)
 nconf-objs     := nconf.o zconf.tab.o nconf.gui.o
 kxgettext-objs	:= kxgettext.o zconf.tab.o
 qconf-cxxobjs	:= qconf.o
-qconf-objs	:= kconfig_load.o zconf.tab.o
-gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
+qconf-objs	:= zconf.tab.o
+gconf-objs	:= gconf.o zconf.tab.o
 
 hostprogs-y := conf
 
@@ -203,8 +187,8 @@ ifeq ($(gconf-target),1)
 	hostprogs-y += gconf
 endif
 
-clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck .tmp_gtkcheck
-clean-files	+= zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
+clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
 clean-files     += mconf qconf gconf nconf
 clean-files     += config.pot linux.pot
 
@@ -220,15 +204,18 @@ always := dochecklxdialog
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
 
 # generated files seem to need this to find local include files
-HOSTCFLAGS_lex.zconf.o	:= -I$(src)
+HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
-HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
-HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
+LEX_PREFIX_zconf	:= zconf
+YACC_PREFIX_zconf	:= zconf
+
+HOSTLOADLIBES_qconf	= $(KC_QT_LIBS)
+HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS)
 
-HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
+HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
 HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
-                          -D LKC_DIRECT_LINK
+                          -Wno-missing-prototypes
 
 HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
 
@@ -256,12 +243,12 @@ $(obj)/.tmp_qtcheck:
 	        if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
 	      done; \
 	      if [ -z "$$dir" ]; then \
-	        echo "*"; \
-	        echo "* Unable to find any QT installation. Please make sure that"; \
-	        echo "* the QT4 or QT3 development package is correctly installed and"; \
-	        echo "* either qmake can be found or install pkg-config or set"; \
-	        echo "* the QTDIR environment variable to the correct location."; \
-	        echo "*"; \
+	        echo >&2 "*"; \
+	        echo >&2 "* Unable to find any QT installation. Please make sure that"; \
+	        echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
+	        echo >&2 "* either qmake can be found or install pkg-config or set"; \
+	        echo >&2 "* the QTDIR environment variable to the correct location."; \
+	        echo >&2 "*"; \
 	        false; \
 	      fi; \
 	      libpath=$$dir/lib; lib=qt; osdir=""; \
@@ -282,8 +269,8 @@ $(obj)/.tmp_qtcheck:
 	else \
 	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
 	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
-	  binpath="\$$(shell pkg-config QtCore --variable=prefix)"; \
-	  moc="$$binpath/bin/moc"; \
+	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
+	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
 	fi; \
 	echo "KC_QT_CFLAGS=$$cflags" > $@; \
 	echo "KC_QT_LIBS=$$libs" >> $@; \
@@ -301,62 +288,30 @@ $(obj)/.tmp_gtkcheck:
 		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
 			touch $@;								\
 		else									\
-			echo "*"; 							\
-			echo "* GTK+ is present but version >= 2.0.0 is required.";	\
-			echo "*";							\
+			echo >&2 "*"; 							\
+			echo >&2 "* GTK+ is present but version >= 2.0.0 is required.";	\
+			echo >&2 "*";							\
 			false;								\
 		fi									\
 	else										\
-		echo "*"; 								\
-		echo "* Unable to find the GTK+ installation. Please make sure that"; 	\
-		echo "* the GTK+ 2.0 development package is correctly installed..."; 	\
-		echo "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
-		echo "*"; 								\
+		echo >&2 "*"; 								\
+		echo >&2 "* Unable to find the GTK+ installation. Please make sure that"; 	\
+		echo >&2 "* the GTK+ 2.0 development package is correctly installed..."; 	\
+		echo >&2 "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
+		echo >&2 "*"; 								\
 		false;									\
 	fi
 endif
 
-$(obj)/zconf.tab.o: $(obj)/lex.zconf.c $(obj)/zconf.hash.c
+$(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
 
-$(obj)/kconfig_load.o: $(obj)/lkc_defs.h
+$(obj)/qconf.o: $(obj)/qconf.moc
 
-$(obj)/qconf.o: $(obj)/qconf.moc $(obj)/lkc_defs.h
-
-$(obj)/gconf.o: $(obj)/lkc_defs.h
-
-$(obj)/%.moc: $(src)/%.h
+$(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
 	$(KC_QT_MOC) -i $< -o $@
 
-$(obj)/lkc_defs.h: $(src)/lkc_proto.h
-	$(Q)sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
-
 # Extract gconf menu items for I18N support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
 	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
 	$(obj)/gconf.glade
 
-###
-# The following requires flex/bison/gperf
-# By default we use the _shipped versions, uncomment the following line if
-# you are modifying the flex/bison src.
-# LKC_GENPARSER := 1
-
-ifdef LKC_GENPARSER
-
-$(obj)/zconf.tab.c: $(src)/zconf.y
-$(obj)/lex.zconf.c: $(src)/zconf.l
-$(obj)/zconf.hash.c: $(src)/zconf.gperf
-
-%.tab.c: %.y
-	bison -l -b $* -p $(notdir $*) $<
-	cp $@ $@_shipped
-
-lex.%.c: %.l
-	flex -L -P$(notdir $*) -o$@ $<
-	cp $@ $@_shipped
-
-%.hash.c: %.gperf
-	gperf < $< > $@
-	cp $@ $@_shipped
-
-endif
diff --git a/support/kconfig/README.buildroot2 b/support/kconfig/README.buildroot2
index b92ec14..7de485c 100644
--- a/support/kconfig/README.buildroot2
+++ b/support/kconfig/README.buildroot2
@@ -1,4 +1,4 @@
-This is a copy of the kconfig code in the kernel (currently 2.6.37-rc1) tweaked
+This is a copy of the kconfig code in the kernel (currently 3.9-rc2) tweaked
 to suit Buildroot.
 
 To update:
diff --git a/support/kconfig/check.sh b/support/kconfig/check.sh
index fa59cbf..854d9c7 100755
--- a/support/kconfig/check.sh
+++ b/support/kconfig/check.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # Needed for systems without gettext
-$* -xc -o /dev/null - > /dev/null 2>&1 << EOF
+$* -x c -o /dev/null - > /dev/null 2>&1 << EOF
 #include <libintl.h>
 int main()
 {
diff --git a/support/kconfig/conf.c b/support/kconfig/conf.c
index ed9402a..c104941 100644
--- a/support/kconfig/conf.c
+++ b/support/kconfig/conf.c
@@ -14,11 +14,11 @@
 #include <sys/stat.h>
 #include <sys/time.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
+static void xfgets(char *str, int size, FILE *in);
 
 enum input_mode {
 	oldaskconfig,
@@ -32,12 +32,11 @@ enum input_mode {
 	defconfig,
 	savedefconfig,
 	listnewconfig,
-	oldnoconfig,
+	olddefconfig,
 } input_mode = oldaskconfig;
 
-char *defconfig_file;
-
 static int indent = 1;
+static int tty_stdio;
 static int valid_stdin = 1;
 static int sync_kconfig;
 static int conf_cnt;
@@ -106,9 +105,12 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 			return 0;
 		}
 		check_stdin();
+		/* fall through */
 	case oldaskconfig:
 		fflush(stdout);
 		xfgets(line, 128, stdin);
+		if (!tty_stdio)
+			printf("\n");
 		return 1;
 	default:
 		break;
@@ -150,6 +152,7 @@ static int conf_string(struct menu *menu)
 				def = NULL;
 				break;
 			}
+			/* fall through */
 		default:
 			line[strlen(line)-1] = 0;
 			def = line;
@@ -304,6 +307,7 @@ static int conf_choice(struct menu *menu)
 				break;
 			}
 			check_stdin();
+			/* fall through */
 		case oldaskconfig:
 			fflush(stdout);
 			xfgets(line, 128, stdin);
@@ -364,11 +368,12 @@ static void conf(struct menu *menu)
 		case P_MENU:
 			if ((input_mode == silentoldconfig ||
 			     input_mode == listnewconfig ||
-			     input_mode == oldnoconfig) &&
+			     input_mode == olddefconfig) &&
 			    rootEntry != menu) {
 				check_conf(menu);
 				return;
 			}
+			/* fall through */
 		case P_COMMENT:
 			prompt = menu_get_prompt(menu);
 			if (prompt)
@@ -427,7 +432,7 @@ static void check_conf(struct menu *menu)
 				if (sym->name && !sym_is_choice_value(sym)) {
 					printf("%s%s\n", CONFIG_, sym->name);
 				}
-			} else if (input_mode != oldnoconfig) {
+			} else if (input_mode != olddefconfig) {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
@@ -452,20 +457,49 @@ static struct option long_opts[] = {
 	{"alldefconfig",    no_argument,       NULL, alldefconfig},
 	{"randconfig",      no_argument,       NULL, randconfig},
 	{"listnewconfig",   no_argument,       NULL, listnewconfig},
-	{"oldnoconfig",     no_argument,       NULL, oldnoconfig},
+	{"olddefconfig",    no_argument,       NULL, olddefconfig},
+	/*
+	 * oldnoconfig is an alias of olddefconfig, because people already
+	 * are dependent on its behavior(sets new symbols to their default
+	 * value but not 'n') with the counter-intuitive name.
+	 */
+	{"oldnoconfig",     no_argument,       NULL, olddefconfig},
 	{NULL, 0, NULL, 0}
 };
 
+static void conf_usage(const char *progname)
+{
+
+	printf("Usage: %s [option] <kconfig-file>\n", progname);
+	printf("[option] is _one_ of the following:\n");
+	printf("  --listnewconfig         List new options\n");
+	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
+	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
+	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
+	printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
+	printf("  --oldnoconfig           An alias of olddefconfig\n");
+	printf("  --defconfig <file>      New config with default defined in <file>\n");
+	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
+	printf("  --allnoconfig           New config where all options are answered with no\n");
+	printf("  --allyesconfig          New config where all options are answered with yes\n");
+	printf("  --allmodconfig          New config where all options are answered with mod\n");
+	printf("  --alldefconfig          New config with all symbols set to default\n");
+	printf("  --randconfig            New config with random answer to all options\n");
+}
+
 int main(int ac, char **av)
 {
+	const char *progname = av[0];
 	int opt;
-	const char *name;
+	const char *name, *defconfig_file = NULL /* gcc uninit */;
 	struct stat tmpstat;
 
 	setlocale(LC_ALL, "");
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
+	tty_stdio = isatty(0) && isatty(1) && isatty(2);
+
 	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
@@ -491,14 +525,24 @@ int main(int ac, char **av)
 			srand(seed);
 			break;
 		}
+		case oldaskconfig:
+		case oldconfig:
+		case allnoconfig:
+		case allyesconfig:
+		case allmodconfig:
+		case alldefconfig:
+		case listnewconfig:
+		case olddefconfig:
+			break;
 		case '?':
-			fprintf(stderr, _("See README for usage info\n"));
+			conf_usage(progname);
 			exit(1);
 			break;
 		}
 	}
 	if (ac == optind) {
 		printf(_("%s: Kconfig file missing\n"), av[0]);
+		conf_usage(progname);
 		exit(1);
 	}
 	name = av[optind];
@@ -532,7 +576,7 @@ int main(int ac, char **av)
 	case oldaskconfig:
 	case oldconfig:
 	case listnewconfig:
-	case oldnoconfig:
+	case olddefconfig:
 		conf_read(NULL);
 		break;
 	case allnoconfig:
@@ -541,8 +585,15 @@ int main(int ac, char **av)
 	case alldefconfig:
 	case randconfig:
 		name = getenv("KCONFIG_ALLCONFIG");
-		if (name && !stat(name, &tmpstat)) {
-			conf_read_simple(name, S_DEF_USER);
+		if (!name)
+			break;
+		if ((strcmp(name, "") != 0) && (strcmp(name, "1") != 0)) {
+			if (conf_read_simple(name, S_DEF_USER)) {
+				fprintf(stderr,
+					_("*** Can't read seed configuration \"%s\"!\n"),
+					name);
+				exit(1);
+			}
 			break;
 		}
 		switch (input_mode) {
@@ -553,10 +604,13 @@ int main(int ac, char **av)
 		case randconfig:	name = "allrandom.config"; break;
 		default: break;
 		}
-		if (!stat(name, &tmpstat))
-			conf_read_simple(name, S_DEF_USER);
-		else if (!stat("all.config", &tmpstat))
-			conf_read_simple("all.config", S_DEF_USER);
+		if (conf_read_simple(name, S_DEF_USER) &&
+		    conf_read_simple("all.config", S_DEF_USER)) {
+			fprintf(stderr,
+				_("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
+				name);
+			exit(1);
+		}
 		break;
 	default:
 		break;
@@ -571,7 +625,7 @@ int main(int ac, char **av)
 				return 1;
 			}
 		}
-		valid_stdin = isatty(0) && isatty(1) && isatty(2);
+		valid_stdin = tty_stdio;
 	}
 
 	switch (input_mode) {
@@ -602,7 +656,7 @@ int main(int ac, char **av)
 		/* fall through */
 	case oldconfig:
 	case listnewconfig:
-	case oldnoconfig:
+	case olddefconfig:
 	case silentoldconfig:
 		/* Update until a loop caused no more changes */
 		do {
@@ -610,7 +664,7 @@ int main(int ac, char **av)
 			check_conf(&rootmenu);
 		} while (conf_cnt &&
 			 (input_mode != listnewconfig &&
-			  input_mode != oldnoconfig));
+			  input_mode != olddefconfig));
 		break;
 	}
 
@@ -640,13 +694,11 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
+
 /*
  * Helper function to facilitate fgets() by Jean Sacren.
  */
-void xfgets(str, size, in)
-	char *str;
-	int size;
-	FILE *in;
+void xfgets(char *str, int size, FILE *in)
 {
 	if (fgets(str, size, in) == NULL)
 		fprintf(stderr, "\nError in reading or end of file.\n");
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 54f20ca..b7df92f 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -7,6 +7,7 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
+#include <stdarg.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -14,7 +15,6 @@
 #include <unistd.h>
 #include <libgen.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 static void conf_warning(const char *fmt, ...)
@@ -127,6 +127,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->flags |= def_flags;
 			break;
 		}
+		/* fall through */
 	case S_BOOLEAN:
 		if (p[0] == 'y') {
 			sym->def[def].tri = yes;
@@ -139,7 +140,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			break;
 		}
 		conf_warning("symbol value '%s' invalid for %s", p, sym->name);
-		break;
+		return 1;
 	case S_OTHER:
 		if (*p != '"') {
 			for (p2 = p; *p2 && !isspace(*p2); p2++)
@@ -147,6 +148,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			sym->type = S_STRING;
 			goto done;
 		}
+		/* fall through */
 	case S_STRING:
 		if (*p++ != '"')
 			break;
@@ -161,6 +163,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 			conf_warning("invalid string found");
 			return 1;
 		}
+		/* fall through */
 	case S_INT:
 	case S_HEX:
 	done:
@@ -178,10 +181,66 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 	return 0;
 }
 
+#define LINE_GROWTH 16
+static int add_byte(int c, char **lineptr, size_t slen, size_t *n)
+{
+	char *nline;
+	size_t new_size = slen + 1;
+	if (new_size > *n) {
+		new_size += LINE_GROWTH - 1;
+		new_size *= 2;
+		nline = realloc(*lineptr, new_size);
+		if (!nline)
+			return -1;
+
+		*lineptr = nline;
+		*n = new_size;
+	}
+
+	(*lineptr)[slen] = c;
+
+	return 0;
+}
+
+static ssize_t compat_getline(char **lineptr, size_t *n, FILE *stream)
+{
+	char *line = *lineptr;
+	size_t slen = 0;
+
+	for (;;) {
+		int c = getc(stream);
+
+		switch (c) {
+		case '\n':
+			if (add_byte(c, &line, slen, n) < 0)
+				goto e_out;
+			slen++;
+			/* fall through */
+		case EOF:
+			if (add_byte('\0', &line, slen, n) < 0)
+				goto e_out;
+			*lineptr = line;
+			if (slen == 0)
+				return -1;
+			return slen;
+		default:
+			if (add_byte(c, &line, slen, n) < 0)
+				goto e_out;
+			slen++;
+		}
+	}
+
+e_out:
+	line[slen-1] = '\0';
+	*lineptr = line;
+	return -1;
+}
+
 int conf_read_simple(const char *name, int def)
 {
 	FILE *in = NULL;
-	char line[1024];
+	char   *line = NULL;
+	size_t  line_asize = 0;
 	char *p, *p2;
 	struct symbol *sym;
 	int i, def_flags;
@@ -236,13 +295,14 @@ load:
 		case S_STRING:
 			if (sym->def[def].val)
 				free(sym->def[def].val);
+			/* fall through */
 		default:
 			sym->def[def].val = NULL;
 			sym->def[def].tri = no;
 		}
 	}
 
-	while (fgets(line, sizeof(line), in)) {
+	while (compat_getline(&line, &line_asize, in) != -1) {
 		conf_lineno++;
 		sym = NULL;
 		if (line[0] == '#') {
@@ -330,6 +390,7 @@ setsym:
 			cs->def[def].tri = EXPR_OR(cs->def[def].tri, sym->def[def].tri);
 		}
 	}
+	free(line);
 	fclose(in);
 
 	if (modules_sym)
@@ -339,10 +400,8 @@ setsym:
 
 int conf_read(const char *name)
 {
-	struct symbol *sym, *choice_sym;
-	struct property *prop;
-	struct expr *e;
-	int i, flags;
+	struct symbol *sym;
+	int i;
 
 	sym_set_change_count(0);
 
@@ -352,7 +411,7 @@ int conf_read(const char *name)
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
 		if (sym_is_choice(sym) || (sym->flags & SYMBOL_AUTO))
-			goto sym_ok;
+			continue;
 		if (sym_has_value(sym) && (sym->flags & SYMBOL_WRITE)) {
 			/* check that calculated value agrees with saved value */
 			switch (sym->type) {
@@ -361,29 +420,18 @@ int conf_read(const char *name)
 				if (sym->def[S_DEF_USER].tri != sym_get_tristate_value(sym))
 					break;
 				if (!sym_is_choice(sym))
-					goto sym_ok;
+					continue;
+				/* fall through */
 			default:
 				if (!strcmp(sym->curr.val, sym->def[S_DEF_USER].val))
-					goto sym_ok;
+					continue;
 				break;
 			}
 		} else if (!sym_has_value(sym) && !(sym->flags & SYMBOL_WRITE))
 			/* no previous value and not saved */
-			goto sym_ok;
+			continue;
 		conf_unsaved++;
 		/* maybe print value in verbose mode... */
-	sym_ok:
-		if (!sym_is_choice(sym))
-			continue;
-		/* The choice symbol only has a set value (and thus is not new)
-		 * if all its visible childs have values.
-		 */
-		prop = sym_get_choice_prop(sym);
-		flags = sym->flags;
-		expr_list_for_each_sym(prop->expr, e, choice_sym)
-			if (choice_sym->visible != no)
-				flags &= choice_sym->flags;
-		sym->flags &= flags | ~SYMBOL_DEF_USER;
 	}
 
 	for_all_symbols(i, sym) {
@@ -416,64 +464,191 @@ int conf_read(const char *name)
 	return 0;
 }
 
-/* Write a S_STRING */
-static void conf_write_string(bool headerfile, const char *name,
-                              const char *str, FILE *out)
+/*
+ * Kconfig configuration printer
+ *
+ * This printer is used when generating the resulting configuration after
+ * kconfig invocation and `defconfig' files. Unset symbol might be omitted by
+ * passing a non-NULL argument to the printer.
+ *
+ */
+static void
+kconfig_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 {
-	int l;
-	if (headerfile)
-		fprintf(out, "#define %s \"", name);
-	else
-		fprintf(out, "%s=\"", name);
 
-	while (1) {
-		l = strcspn(str, "\"\\");
+	switch (sym->type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		if (*value == 'n') {
+			bool skip_unset = (arg != NULL);
+
+			if (!skip_unset)
+				fprintf(fp, "# %s is not set\n",
+				    sym->name);
+			return;
+		}
+		break;
+	default:
+		break;
+	}
+
+	fprintf(fp, "%s=%s\n", sym->name, value);
+}
+
+static void
+kconfig_print_comment(FILE *fp, const char *value, void *arg)
+{
+	const char *p = value;
+	size_t l;
+
+	for (;;) {
+		l = strcspn(p, "\n");
+		fprintf(fp, "#");
 		if (l) {
-			xfwrite(str, l, 1, out);
-			str += l;
+			fprintf(fp, " ");
+			xfwrite(p, l, 1, fp);
+			p += l;
 		}
-		if (!*str)
+		fprintf(fp, "\n");
+		if (*p++ == '\0')
 			break;
-		fprintf(out, "\\%c", *str++);
 	}
-	fputs("\"\n", out);
 }
 
-static void conf_write_symbol(struct symbol *sym, FILE *out, bool write_no)
+static struct conf_printer kconfig_printer_cb =
+{
+	.print_symbol = kconfig_print_symbol,
+	.print_comment = kconfig_print_comment,
+};
+
+/*
+ * Header printer
+ *
+ * This printer is used when generating the `include/generated/autoconf.h' file.
+ */
+static void
+header_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
 {
-	const char *str;
 
 	switch (sym->type) {
 	case S_BOOLEAN:
-	case S_TRISTATE:
-		switch (sym_get_tristate_value(sym)) {
-		case no:
-			if (write_no)
-				fprintf(out, "# %s is not set\n",
-				    sym->name);
-			break;
-		case mod:
-			fprintf(out, "%s=m\n", sym->name);
-			break;
-		case yes:
-			fprintf(out, "%s=y\n", sym->name);
+	case S_TRISTATE: {
+		const char *suffix = "";
+
+		switch (*value) {
+		case 'n':
 			break;
+		case 'm':
+			suffix = "_MODULE";
+			/* fall through */
+		default:
+			fprintf(fp, "#define %s%s 1\n",
+			    sym->name, suffix);
 		}
 		break;
-	case S_STRING:
-		conf_write_string(false, sym->name, sym_get_string_value(sym), out);
+	}
+	case S_HEX: {
+		const char *prefix = "";
+
+		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
+			prefix = "0x";
+		fprintf(fp, "#define %s %s%s\n",
+		    sym->name, prefix, value);
 		break;
-	case S_HEX:
+	}
+	case S_STRING:
 	case S_INT:
-		str = sym_get_string_value(sym);
-		fprintf(out, "%s=%s\n", sym->name, str);
+		fprintf(fp, "#define %s %s\n",
+		    sym->name, value);
 		break;
+	default:
+		break;
+	}
+
+}
+
+static void
+header_print_comment(FILE *fp, const char *value, void *arg)
+{
+	const char *p = value;
+	size_t l;
+
+	fprintf(fp, "/*\n");
+	for (;;) {
+		l = strcspn(p, "\n");
+		fprintf(fp, " *");
+		if (l) {
+			fprintf(fp, " ");
+			xfwrite(p, l, 1, fp);
+			p += l;
+		}
+		fprintf(fp, "\n");
+		if (*p++ == '\0')
+			break;
+	}
+	fprintf(fp, " */\n");
+}
+
+static struct conf_printer header_printer_cb =
+{
+	.print_symbol = header_print_symbol,
+	.print_comment = header_print_comment,
+};
+
+/*
+ * Tristate printer
+ *
+ * This printer is used when generating the `include/config/tristate.conf' file.
+ */
+static void
+tristate_print_symbol(FILE *fp, struct symbol *sym, const char *value, void *arg)
+{
+
+	if (sym->type == S_TRISTATE && *value != 'n')
+		fprintf(fp, "%s=%c\n", sym->name, (char)toupper(*value));
+}
+
+static struct conf_printer tristate_printer_cb =
+{
+	.print_symbol = tristate_print_symbol,
+	.print_comment = kconfig_print_comment,
+};
+
+static void conf_write_symbol(FILE *fp, struct symbol *sym,
+			      struct conf_printer *printer, void *printer_arg)
+{
+	const char *str;
+
+	switch (sym->type) {
 	case S_OTHER:
 	case S_UNKNOWN:
 		break;
+	case S_STRING:
+		str = sym_get_string_value(sym);
+		str = sym_escape_string_value(str);
+		printer->print_symbol(fp, sym, str, printer_arg);
+		free((void *)str);
+		break;
+	default:
+		str = sym_get_string_value(sym);
+		printer->print_symbol(fp, sym, str, printer_arg);
 	}
 }
 
+static void
+conf_write_heading(FILE *fp, struct conf_printer *printer, void *printer_arg)
+{
+	char buf[256];
+
+	snprintf(buf, sizeof(buf),
+	    "\n"
+	    "Automatically generated file; DO NOT EDIT.\n"
+	    "%s\n",
+	    rootmenu.prompt->text);
+
+	printer->print_comment(fp, buf, printer_arg);
+}
+
 /*
  * Write out a minimal config.
  * All values that has default values are skipped as this is redundant.
@@ -530,7 +705,7 @@ int conf_write_defconfig(const char *filename)
 						goto next_menu;
 				}
 			}
-			conf_write_symbol(sym, out, true);
+			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
 		}
 next_menu:
 		if (menu->list != NULL) {
@@ -598,11 +773,7 @@ int conf_write(const char *name)
 	if (!out)
 		return 1;
 
-	fprintf(out, _("#\n"
-		       "# Automatically generated make config: don't edit\n"
-		       "# %s\n"
-		       "#\n"),
-		     rootmenu.prompt->text);
+	conf_write_heading(out, &kconfig_printer_cb, NULL);
 
 	if (!conf_get_changed())
 		sym_clear_all_valid();
@@ -623,8 +794,8 @@ int conf_write(const char *name)
 			if (!(sym->flags & SYMBOL_WRITE))
 				goto next;
 			sym->flags &= ~SYMBOL_WRITE;
-			/* Write config symbol to file */
-			conf_write_symbol(sym, out, true);
+
+			conf_write_symbol(out, sym, &kconfig_printer_cb, NULL);
 		}
 
 next:
@@ -788,7 +959,6 @@ err:
 int conf_write_autoconf(void)
 {
 	struct symbol *sym;
-	const char *str;
 	const char *name;
 	FILE *out, *tristate, *out_h;
 	int i;
@@ -830,68 +1000,23 @@ int conf_write_autoconf(void)
 		return 1;
 	}
 
-	fprintf(out, "#\n"
-		     "# Automatically generated make config: don't edit\n"
-		     "# %s\n"
-		     "#\n",
-		     rootmenu.prompt->text);
-	fprintf(tristate, "#\n"
-			  "# Automatically generated - do not edit\n"
-			  "\n");
-	fprintf(out_h, "/*\n"
-		       " * Automatically generated C config: don't edit\n"
-		       " * %s\n"
-		       " */\n",
-		       rootmenu.prompt->text);
+	conf_write_heading(out, &kconfig_printer_cb, NULL);
+
+	conf_write_heading(tristate, &tristate_printer_cb, NULL);
+
+	conf_write_heading(out_h, &header_printer_cb, NULL);
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
 		if (!(sym->flags & SYMBOL_WRITE) || !sym->name)
 			continue;
 
-		/* write symbol to config file */
-		conf_write_symbol(sym, out, false);
+		/* write symbol to auto.conf, tristate and header files */
+		conf_write_symbol(out, sym, &kconfig_printer_cb, (void *)1);
 
-		/* update autoconf and tristate files */
-		switch (sym->type) {
-		case S_BOOLEAN:
-		case S_TRISTATE:
-			switch (sym_get_tristate_value(sym)) {
-			case no:
-				break;
-			case mod:
-				fprintf(tristate, "%s=M\n",
-				    sym->name);
-				fprintf(out_h, "#define %s_MODULE 1\n",
-				    sym->name);
-				break;
-			case yes:
-				if (sym->type == S_TRISTATE)
-					fprintf(tristate,"%s=Y\n",
-					    sym->name);
-				fprintf(out_h, "#define %s 1\n",
-				    sym->name);
-				break;
-			}
-			break;
-		case S_STRING:
-			conf_write_string(true, sym->name, sym_get_string_value(sym), out_h);
-			break;
-		case S_HEX:
-			str = sym_get_string_value(sym);
-			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
-				fprintf(out_h, "#define %s 0x%s\n",
-				    sym->name, str);
-				break;
-			}
-		case S_INT:
-			str = sym_get_string_value(sym);
-			fprintf(out_h, "#define %s %s\n",
-			    sym->name, str);
-			break;
-		default:
-			break;
-		}
+		conf_write_symbol(tristate, sym, &tristate_printer_cb, (void *)1);
+
+		conf_write_symbol(out_h, sym, &header_printer_cb, NULL);
 	}
 	fclose(out);
 	fclose(tristate);
diff --git a/support/kconfig/expr.c b/support/kconfig/expr.c
index c5182f4..bf776b6 100644
--- a/support/kconfig/expr.c
+++ b/support/kconfig/expr.c
@@ -7,15 +7,13 @@
 #include <stdlib.h>
 #include <string.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 #define DEBUG_EXPR	0
 
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = xcalloc(1, sizeof(*e));
 	e->type = E_SYMBOL;
 	e->left.sym = sym;
 	return e;
@@ -23,8 +21,7 @@ struct expr *expr_alloc_symbol(struct symbol *sym)
 
 struct expr *expr_alloc_one(enum expr_type type, struct expr *ce)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = xcalloc(1, sizeof(*e));
 	e->type = type;
 	e->left.expr = ce;
 	return e;
@@ -32,8 +29,7 @@ struct expr *expr_alloc_one(enum expr_type type, struct expr *ce)
 
 struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e2)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = xcalloc(1, sizeof(*e));
 	e->type = type;
 	e->left.expr = e1;
 	e->right.expr = e2;
@@ -42,8 +38,7 @@ struct expr *expr_alloc_two(enum expr_type type, struct expr *e1, struct expr *e
 
 struct expr *expr_alloc_comp(enum expr_type type, struct symbol *s1, struct symbol *s2)
 {
-	struct expr *e = malloc(sizeof(*e));
-	memset(e, 0, sizeof(*e));
+	struct expr *e = xcalloc(1, sizeof(*e));
 	e->type = type;
 	e->left.sym = s1;
 	e->right.sym = s2;
@@ -71,7 +66,7 @@ struct expr *expr_copy(const struct expr *org)
 	if (!org)
 		return NULL;
 
-	e = malloc(sizeof(*org));
+	e = xmalloc(sizeof(*org));
 	memcpy(e, org, sizeof(*org));
 	switch (org->type) {
 	case E_SYMBOL:
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index 16bfae2..cdd4860 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -10,7 +10,9 @@
 extern "C" {
 #endif
 
+#include <assert.h>
 #include <stdio.h>
+#include "list.h"
 #ifndef __cplusplus
 #include <stdbool.h>
 #endif
@@ -172,7 +174,14 @@ struct menu {
 #define MENU_CHANGED		0x0001
 #define MENU_ROOT		0x0002
 
-#ifndef SWIG
+struct jump_key {
+	struct list_head entries;
+	size_t offset;
+	struct menu *target;
+	int index;
+};
+
+#define JUMP_NB			9
 
 extern struct file *file_list;
 extern struct file *current_file;
@@ -218,7 +227,6 @@ static inline int expr_is_no(struct expr *e)
 {
 	return e && (e->type == E_SYMBOL && e->left.sym == &symbol_no);
 }
-#endif
 
 #ifdef __cplusplus
 }
diff --git a/support/kconfig/gconf.c b/support/kconfig/gconf.c
index 79479c3..7cbe68e 100644
--- a/support/kconfig/gconf.c
+++ b/support/kconfig/gconf.c
@@ -10,6 +10,7 @@
 #  include <config.h>
 #endif
 
+#include <stdlib.h>
 #include "lkc.h"
 #include "images.c"
 
@@ -22,7 +23,6 @@
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
-#include <stdlib.h>
 
 //#define DEBUG
 
@@ -285,8 +285,6 @@ void init_left_tree(void)
 static void renderer_edited(GtkCellRendererText * cell,
 			    const gchar * path_string,
 			    const gchar * new_text, gpointer user_data);
-static void renderer_toggled(GtkCellRendererToggle * cellrenderertoggle,
-			     gchar * arg1, gpointer user_data);
 
 void init_right_tree(void)
 {
@@ -320,8 +318,6 @@ void init_right_tree(void)
 					    "inconsistent", COL_BTNINC,
 					    "visible", COL_BTNVIS,
 					    "radio", COL_BTNRAD, NULL);
-	/*g_signal_connect(G_OBJECT(renderer), "toggled",
-	   G_CALLBACK(renderer_toggled), NULL); */
 	renderer = gtk_cell_renderer_text_new();
 	gtk_tree_view_column_pack_start(GTK_TREE_VIEW_COLUMN(column),
 					renderer, FALSE);
@@ -687,7 +683,7 @@ void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
-					GTK_BUTTONS_CLOSE, intro_text);
+					GTK_BUTTONS_CLOSE, "%s", intro_text);
 	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
 				 G_CALLBACK(gtk_widget_destroy),
 				 GTK_OBJECT(dialog));
@@ -705,7 +701,7 @@ void on_about1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
-					GTK_BUTTONS_CLOSE, about_text);
+					GTK_BUTTONS_CLOSE, "%s", about_text);
 	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
 				 G_CALLBACK(gtk_widget_destroy),
 				 GTK_OBJECT(dialog));
@@ -724,7 +720,7 @@ void on_license1_activate(GtkMenuItem * menuitem, gpointer user_data)
 	dialog = gtk_message_dialog_new(GTK_WINDOW(main_wnd),
 					GTK_DIALOG_DESTROY_WITH_PARENT,
 					GTK_MESSAGE_INFO,
-					GTK_BUTTONS_CLOSE, license_text);
+					GTK_BUTTONS_CLOSE, "%s", license_text);
 	g_signal_connect_swapped(GTK_OBJECT(dialog), "response",
 				 G_CALLBACK(gtk_widget_destroy),
 				 GTK_OBJECT(dialog));
@@ -834,7 +830,7 @@ static void renderer_edited(GtkCellRendererText * cell,
 static void change_sym_value(struct menu *menu, gint col)
 {
 	struct symbol *sym = menu->sym;
-	tristate oldval, newval;
+	tristate newval;
 
 	if (!sym)
 		return;
@@ -851,7 +847,6 @@ static void change_sym_value(struct menu *menu, gint col)
 	switch (sym_get_type(sym)) {
 	case S_BOOLEAN:
 	case S_TRISTATE:
-		oldval = sym_get_tristate_value(sym);
 		if (!sym_tristate_within_range(sym, newval))
 			newval = yes;
 		sym_set_tristate_value(sym, newval);
@@ -888,35 +883,6 @@ static void toggle_sym_value(struct menu *menu)
 		display_tree_part();	//fixme: keep exp/coll
 }
 
-static void renderer_toggled(GtkCellRendererToggle * cell,
-			     gchar * path_string, gpointer user_data)
-{
-	GtkTreePath *path, *sel_path = NULL;
-	GtkTreeIter iter, sel_iter;
-	GtkTreeSelection *sel;
-	struct menu *menu;
-
-	path = gtk_tree_path_new_from_string(path_string);
-	if (!gtk_tree_model_get_iter(model2, &iter, path))
-		return;
-
-	sel = gtk_tree_view_get_selection(GTK_TREE_VIEW(tree2_w));
-	if (gtk_tree_selection_get_selected(sel, NULL, &sel_iter))
-		sel_path = gtk_tree_model_get_path(model2, &sel_iter);
-	if (!sel_path)
-		goto out1;
-	if (gtk_tree_path_compare(path, sel_path))
-		goto out2;
-
-	gtk_tree_model_get(model2, &iter, COL_MENU, &menu, -1);
-	toggle_sym_value(menu);
-
-      out2:
-	gtk_tree_path_free(sel_path);
-      out1:
-	gtk_tree_path_free(path);
-}
-
 static gint column2index(GtkTreeViewColumn * column)
 {
 	gint i;
@@ -1172,6 +1138,7 @@ static gchar **fill_row(struct menu *menu)
 			row[COL_BTNVIS] = GINT_TO_POINTER(TRUE);
 		if (sym_is_choice(sym))
 			break;
+		/* fall through */
 	case S_TRISTATE:
 		val = sym_get_tristate_value(sym);
 		switch (val) {
@@ -1310,7 +1277,6 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 	gboolean valid;
 	GtkTreeIter *sibling;
 	struct symbol *sym;
-	struct property *prop;
 	struct menu *menu1, *menu2;
 
 	if (src == &rootmenu)
@@ -1319,7 +1285,6 @@ static void update_tree(struct menu *src, GtkTreeIter * dst)
 	valid = gtk_tree_model_iter_children(model2, child2, dst);
 	for (child1 = src->list; child1; child1 = child1->next) {
 
-		prop = child1->prompt;
 		sym = child1->sym;
 
 	      reparse:
@@ -1506,10 +1471,6 @@ int main(int ac, char *av[])
 	char *env;
 	gchar *glade_file;
 
-#ifndef LKC_DIRECT_LINK
-	kconfig_load();
-#endif
-
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	bind_textdomain_codeset(PACKAGE, "UTF-8");
 	textdomain(PACKAGE);
diff --git a/support/kconfig/kconfig_load.c b/support/kconfig/kconfig_load.c
deleted file mode 100644
index dbdcaad..0000000
--- a/support/kconfig/kconfig_load.c
+++ /dev/null
@@ -1,35 +0,0 @@
-#include <dlfcn.h>
-#include <stdio.h>
-#include <stdlib.h>
-
-#include "lkc.h"
-
-#define P(name,type,arg)	type (*name ## _p) arg
-#include "lkc_proto.h"
-#undef P
-
-void kconfig_load(void)
-{
-	void *handle;
-	char *error;
-
-	handle = dlopen("./libkconfig.so", RTLD_LAZY);
-	if (!handle) {
-		handle = dlopen("./scripts/kconfig/libkconfig.so", RTLD_LAZY);
-		if (!handle) {
-			fprintf(stderr, "%s\n", dlerror());
-			exit(1);
-		}
-	}
-
-#define P(name,type,arg)			\
-{						\
-	name ## _p = dlsym(handle, #name);	\
-        if ((error = dlerror()))  {		\
-                fprintf(stderr, "%s\n", error);	\
-		exit(1);			\
-	}					\
-}
-#include "lkc_proto.h"
-#undef P
-}
diff --git a/support/kconfig/kxgettext.c b/support/kconfig/kxgettext.c
index e9d8e79..2858738 100644
--- a/support/kconfig/kxgettext.c
+++ b/support/kconfig/kxgettext.c
@@ -7,7 +7,6 @@
 #include <stdlib.h>
 #include <string.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 static char *escape(const char* text, char *bf, int len)
diff --git a/support/kconfig/list.h b/support/kconfig/list.h
new file mode 100644
index 0000000..0ae730b
--- /dev/null
+++ b/support/kconfig/list.h
@@ -0,0 +1,91 @@
+#ifndef LIST_H
+#define LIST_H
+
+/*
+ * Copied from include/linux/...
+ */
+
+#undef offsetof
+#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
+
+/**
+ * container_of - cast a member of a structure out to the containing structure
+ * @ptr:        the pointer to the member.
+ * @type:       the type of the container struct this is embedded in.
+ * @member:     the name of the member within the struct.
+ *
+ */
+#define container_of(ptr, type, member) ({                      \
+	const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
+	(type *)( (char *)__mptr - offsetof(type,member) );})
+
+
+struct list_head {
+	struct list_head *next, *prev;
+};
+
+
+#define LIST_HEAD_INIT(name) { &(name), &(name) }
+
+#define LIST_HEAD(name) \
+	struct list_head name = LIST_HEAD_INIT(name)
+
+/**
+ * list_entry - get the struct for this entry
+ * @ptr:	the &struct list_head pointer.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_struct within the struct.
+ */
+#define list_entry(ptr, type, member) \
+	container_of(ptr, type, member)
+
+/**
+ * list_for_each_entry	-	iterate over list of given type
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_struct within the struct.
+ */
+#define list_for_each_entry(pos, head, member)				\
+	for (pos = list_entry((head)->next, typeof(*pos), member);	\
+	     &pos->member != (head); 	\
+	     pos = list_entry(pos->member.next, typeof(*pos), member))
+
+/**
+ * list_empty - tests whether a list is empty
+ * @head: the list to test.
+ */
+static inline int list_empty(const struct list_head *head)
+{
+	return head->next == head;
+}
+
+/*
+ * Insert a new entry between two known consecutive entries.
+ *
+ * This is only for internal list manipulation where we know
+ * the prev/next entries already!
+ */
+static inline void __list_add(struct list_head *_new,
+			      struct list_head *prev,
+			      struct list_head *next)
+{
+	next->prev = _new;
+	_new->next = next;
+	_new->prev = prev;
+	prev->next = _new;
+}
+
+/**
+ * list_add_tail - add a new entry
+ * @new: new entry to be added
+ * @head: list head to add it before
+ *
+ * Insert a new entry before the specified head.
+ * This is useful for implementing queues.
+ */
+static inline void list_add_tail(struct list_head *_new, struct list_head *head)
+{
+	__list_add(_new, head->prev, head);
+}
+
+#endif
diff --git a/support/kconfig/lkc.h b/support/kconfig/lkc.h
index e899066..eeb6a90 100644
--- a/support/kconfig/lkc.h
+++ b/support/kconfig/lkc.h
@@ -21,12 +21,7 @@ static inline char *bind_textdomain_codeset(const char *dn, char *c) { return c;
 extern "C" {
 #endif
 
-#ifdef LKC_DIRECT_LINK
 #define P(name,type,arg)	extern type name arg
-#else
-#include "lkc_defs.h"
-#define P(name,type,arg)	extern type (*name ## _p) arg
-#endif
 #include "lkc_proto.h"
 #undef P
 
@@ -44,6 +39,12 @@ extern "C" {
 #ifndef CONFIG_
 #define CONFIG_ "BR2_"
 #endif
+static inline const char *CONFIG_prefix(void)
+{
+	return getenv( "CONFIG_" ) ?: CONFIG_;
+}
+#undef CONFIG_
+#define CONFIG_ CONFIG_prefix()
 
 #define TF_COMMAND	0x0001
 #define TF_PARAM	0x0002
@@ -68,9 +69,7 @@ struct kconf_id {
 	enum symbol_type stype;
 };
 
-#ifdef YYDEBUG
 extern int zconfdebug;
-#endif
 
 int zconfparse(void);
 void zconfdump(FILE *out);
@@ -81,9 +80,6 @@ void zconf_nextfile(const char *name);
 int zconf_lineno(void);
 const char *zconf_curname(void);
 
-/* conf.c */
-void xfgets(char *str, int size, FILE *in);
-
 /* confdata.c */
 const char *conf_get_configname(void);
 const char *conf_get_autoconfig_name(void);
@@ -92,15 +88,19 @@ void sym_set_change_count(int count);
 void sym_add_change_count(int count);
 void conf_set_all_new_symbols(enum conf_def_mode mode);
 
+struct conf_printer {
+	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
+	void (*print_comment)(FILE *, const char *, void *);
+};
+
 /* confdata.c and expr.c */
 static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 {
-	if (fwrite(str, len, count, out) < count)
-		fprintf(stderr, "\nError in writing or end of file.\n");
-}
+	assert(len != 0);
 
-/* kconfig_load.c */
-void kconfig_load(void);
+	if (fwrite(str, len, count, out) != count)
+		fprintf(stderr, "Error in writing or end of file.\n");
+}
 
 /* menu.c */
 void _menu_init(void);
@@ -122,6 +122,8 @@ void menu_set_type(int type);
 /* util.c */
 struct file *file_lookup(const char *name);
 int file_write_dep(const char *name);
+void *xmalloc(size_t size);
+void *xcalloc(size_t nmemb, size_t size);
 
 struct gstr {
 	size_t len;
diff --git a/support/kconfig/lkc_proto.h b/support/kconfig/lkc_proto.h
index 17342fe..ef1a738 100644
--- a/support/kconfig/lkc_proto.h
+++ b/support/kconfig/lkc_proto.h
@@ -21,8 +21,10 @@ P(menu_get_root_menu,struct menu *,(struct menu *menu));
 P(menu_get_parent_menu,struct menu *,(struct menu *menu));
 P(menu_has_help,bool,(struct menu *menu));
 P(menu_get_help,const char *,(struct menu *menu));
-P(get_symbol_str, void, (struct gstr *r, struct symbol *sym));
-P(get_relations_str, struct gstr, (struct symbol **sym_arr));
+P(get_symbol_str, void, (struct gstr *r, struct symbol *sym, struct list_head
+			 *head));
+P(get_relations_str, struct gstr, (struct symbol **sym_arr, struct list_head
+				   *head));
 P(menu_get_ext_help,void,(struct menu *menu, struct gstr *help));
 
 /* symbol.c */
@@ -31,6 +33,7 @@ P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
 P(sym_lookup,struct symbol *,(const char *name, int flags));
 P(sym_find,struct symbol *,(const char *name));
 P(sym_expand_string_value,const char *,(const char *in));
+P(sym_escape_string_value, const char *,(const char *in));
 P(sym_re_search,struct symbol **,(const char *pattern));
 P(sym_type_name,const char *,(enum symbol_type type));
 P(sym_calc_value,void,(struct symbol *sym));
diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 969cd4c..6f6fd9d 100644
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -4,7 +4,7 @@
 # What library to link
 ldflags()
 {
-	for ext in so a dylib ; do
+	for ext in so a dll.a dylib ; do
 		for lib in ncursesw ncurses curses ; do
 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
 			if [ $? -eq 0 ]; then
@@ -19,12 +19,13 @@ ldflags()
 # Where is ncurses.h?
 ccflags()
 {
-	if [ -f /usr/include/ncurses/ncurses.h ]; then
+	if [ -f /usr/include/ncursesw/curses.h ]; then
+		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncursesw/curses.h>"'
+		echo ' -DNCURSES_WIDECHAR=1'
+	elif [ -f /usr/include/ncurses/ncurses.h ]; then
 		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"'
 	elif [ -f /usr/include/ncurses/curses.h ]; then
 		echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses/curses.h>"'
-	elif [ -f /usr/include/ncursesw/curses.h ]; then
-		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncursesw/curses.h>"'
 	elif [ -f /usr/include/ncurses.h ]; then
 		echo '-DCURSES_LOC="<ncurses.h>"'
 	else
@@ -38,7 +39,7 @@ trap "rm -f $tmp" 0 1 2 3 15
 
 # Check if we can link to ncurses
 check() {
-        $cc -xc - -o $tmp 2>/dev/null <<'EOF'
+        $cc -x c - -o $tmp 2>/dev/null <<'EOF'
 #include CURSES_LOC
 main() {}
 EOF
diff --git a/support/kconfig/lxdialog/dialog.h b/support/kconfig/lxdialog/dialog.h
index b5211fc..307022a 100644
--- a/support/kconfig/lxdialog/dialog.h
+++ b/support/kconfig/lxdialog/dialog.h
@@ -144,6 +144,7 @@ struct dialog_info {
  */
 extern struct dialog_info dlg;
 extern char dialog_input_result[];
+extern int saved_x, saved_y;		/* Needed in signal handler in mconf.c */
 
 /*
  * Function prototypes
@@ -209,12 +210,17 @@ int first_alpha(const char *string, const char *exempt);
 int dialog_yesno(const char *title, const char *prompt, int height, int width);
 int dialog_msgbox(const char *title, const char *prompt, int height,
 		  int width, int pause);
-int dialog_textbox(const char *title, const char *file, int height, int width);
+
+
+typedef void (*update_text_fn)(char *buf, size_t start, size_t end, void
+			       *_data);
+int dialog_textbox(const char *title, char *tbuf, int initial_height,
+		   int initial_width, int *keys, int *_vscroll, int *_hscroll,
+		   update_text_fn update_text, void *data);
 int dialog_menu(const char *title, const char *prompt,
 		const void *selected, int *s_scroll);
 int dialog_checklist(const char *title, const char *prompt, int height,
 		     int width, int list_height);
-extern char dialog_input_result[];
 int dialog_inputbox(const char *title, const char *prompt, int height,
 		    int width, const char *init);
 
diff --git a/support/kconfig/lxdialog/inputbox.c b/support/kconfig/lxdialog/inputbox.c
index dd8e587..21404a0 100644
--- a/support/kconfig/lxdialog/inputbox.c
+++ b/support/kconfig/lxdialog/inputbox.c
@@ -45,7 +45,8 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
                     const char *init)
 {
 	int i, x, y, box_y, box_x, box_width;
-	int input_x = 0, scroll = 0, key = 0, button = -1;
+	int input_x = 0, key = 0, button = -1;
+	int show_x, len, pos;
 	char *instr = dialog_input_result;
 	WINDOW *dialog;
 
@@ -97,14 +98,17 @@ do_resize:
 	wmove(dialog, box_y, box_x);
 	wattrset(dialog, dlg.inputbox.atr);
 
-	input_x = strlen(instr);
+	len = strlen(instr);
+	pos = len;
 
-	if (input_x >= box_width) {
-		scroll = input_x - box_width + 1;
+	if (len >= box_width) {
+		show_x = len - box_width + 1;
 		input_x = box_width - 1;
 		for (i = 0; i < box_width - 1; i++)
-			waddch(dialog, instr[scroll + i]);
+			waddch(dialog, instr[show_x + i]);
 	} else {
+		show_x = 0;
+		input_x = len;
 		waddstr(dialog, instr);
 	}
 
@@ -121,45 +125,104 @@ do_resize:
 			case KEY_UP:
 			case KEY_DOWN:
 				break;
-			case KEY_LEFT:
-				continue;
-			case KEY_RIGHT:
-				continue;
 			case KEY_BACKSPACE:
 			case 127:
-				if (input_x || scroll) {
+				if (pos) {
 					wattrset(dialog, dlg.inputbox.atr);
-					if (!input_x) {
-						scroll = scroll < box_width - 1 ? 0 : scroll - (box_width - 1);
-						wmove(dialog, box_y, box_x);
-						for (i = 0; i < box_width; i++)
-							waddch(dialog,
-							       instr[scroll + input_x + i] ?
-							       instr[scroll + input_x + i] : ' ');
-						input_x = strlen(instr) - scroll;
+					if (input_x == 0) {
+						show_x--;
 					} else
 						input_x--;
-					instr[scroll + input_x] = '\0';
-					mvwaddch(dialog, box_y, input_x + box_x, ' ');
+
+					if (pos < len) {
+						for (i = pos - 1; i < len; i++) {
+							instr[i] = instr[i+1];
+						}
+					}
+
+					pos--;
+					len--;
+					instr[len] = '\0';
+					wmove(dialog, box_y, box_x);
+					for (i = 0; i < box_width; i++) {
+						if (!instr[show_x + i]) {
+							waddch(dialog, ' ');
+							break;
+						}
+						waddch(dialog, instr[show_x + i]);
+					}
 					wmove(dialog, box_y, input_x + box_x);
 					wrefresh(dialog);
 				}
 				continue;
+			case KEY_LEFT:
+				if (pos > 0) {
+					if (input_x > 0) {
+						wmove(dialog, box_y, --input_x + box_x);
+					} else if (input_x == 0) {
+						show_x--;
+						wmove(dialog, box_y, box_x);
+						for (i = 0; i < box_width; i++) {
+							if (!instr[show_x + i]) {
+								waddch(dialog, ' ');
+								break;
+							}
+							waddch(dialog, instr[show_x + i]);
+						}
+						wmove(dialog, box_y, box_x);
+					}
+					pos--;
+				}
+				continue;
+			case KEY_RIGHT:
+				if (pos < len) {
+					if (input_x < box_width - 1) {
+						wmove(dialog, box_y, ++input_x + box_x);
+					} else if (input_x == box_width - 1) {
+						show_x++;
+						wmove(dialog, box_y, box_x);
+						for (i = 0; i < box_width; i++) {
+							if (!instr[show_x + i]) {
+								waddch(dialog, ' ');
+								break;
+							}
+							waddch(dialog, instr[show_x + i]);
+						}
+						wmove(dialog, box_y, input_x + box_x);
+					}
+					pos++;
+				}
+				continue;
 			default:
 				if (key < 0x100 && isprint(key)) {
-					if (scroll + input_x < MAX_LEN) {
+					if (len < MAX_LEN) {
 						wattrset(dialog, dlg.inputbox.atr);
-						instr[scroll + input_x] = key;
-						instr[scroll + input_x + 1] = '\0';
+						if (pos < len) {
+							for (i = len; i > pos; i--)
+								instr[i] = instr[i-1];
+							instr[pos] = key;
+						} else {
+							instr[len] = key;
+						}
+						pos++;
+						len++;
+						instr[len] = '\0';
+
 						if (input_x == box_width - 1) {
-							scroll++;
-							wmove(dialog, box_y, box_x);
-							for (i = 0; i < box_width - 1; i++)
-								waddch(dialog, instr [scroll + i]);
+							show_x++;
 						} else {
-							wmove(dialog, box_y, input_x++ + box_x);
-							waddch(dialog, key);
+							input_x++;
+						}
+
+						wmove(dialog, box_y, box_x);
+						for (i = 0; i < box_width; i++) {
+							if (!instr[show_x + i]) {
+								waddch(dialog, ' ');
+								break;
+							}
+							waddch(dialog, instr[show_x + i]);
 						}
+						wmove(dialog, box_y, input_x + box_x);
 						wrefresh(dialog);
 					} else
 						flash();	/* Alarm user about overflow */
diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
index 1d60473..48d382e 100644
--- a/support/kconfig/lxdialog/menubox.c
+++ b/support/kconfig/lxdialog/menubox.c
@@ -26,7 +26,7 @@
  *
  *    *)  A bugfix for the Page-Down problem
  *
- *    *)  Formerly when I used Page Down and Page Up, the cursor would be set 
+ *    *)  Formerly when I used Page Down and Page Up, the cursor would be set
  *        to the first position in the menu box.  Now lxdialog is a bit
  *        smarter and works more like other menu systems (just have a look at
  *        it).
@@ -154,12 +154,14 @@ static void print_arrows(WINDOW * win, int item_no, int scroll, int y, int x,
  */
 static void print_buttons(WINDOW * win, int height, int width, int selected)
 {
-	int x = width / 2 - 16;
+	int x = width / 2 - 28;
 	int y = height - 2;
 
 	print_button(win, gettext("Select"), y, x, selected == 0);
 	print_button(win, gettext(" Exit "), y, x + 12, selected == 1);
 	print_button(win, gettext(" Help "), y, x + 24, selected == 2);
+	print_button(win, gettext(" Save "), y, x + 36, selected == 3);
+	print_button(win, gettext(" Load "), y, x + 48, selected == 4);
 
 	wmove(win, y, x + 1 + 12 * selected);
 	wrefresh(win);
@@ -372,7 +374,7 @@ do_resize:
 		case TAB:
 		case KEY_RIGHT:
 			button = ((key == KEY_LEFT ? --button : ++button) < 0)
-			    ? 2 : (button > 2 ? 0 : button);
+			    ? 4 : (button > 4 ? 0 : button);
 
 			print_buttons(dialog, height, width, button);
 			wrefresh(menu);
@@ -399,17 +401,17 @@ do_resize:
 				return 2;
 			case 's':
 			case 'y':
-				return 3;
+				return 5;
 			case 'n':
-				return 4;
+				return 6;
 			case 'm':
-				return 5;
+				return 7;
 			case ' ':
-				return 6;
+				return 8;
 			case '/':
-				return 7;
+				return 9;
 			case 'z':
-				return 8;
+				return 10;
 			case '\n':
 				return button;
 			}
diff --git a/support/kconfig/lxdialog/textbox.c b/support/kconfig/lxdialog/textbox.c
index c704712..a48bb93 100644
--- a/support/kconfig/lxdialog/textbox.c
+++ b/support/kconfig/lxdialog/textbox.c
@@ -22,23 +22,25 @@
 #include "dialog.h"
 
 static void back_lines(int n);
-static void print_page(WINDOW * win, int height, int width);
-static void print_line(WINDOW * win, int row, int width);
+static void print_page(WINDOW *win, int height, int width, update_text_fn
+		       update_text, void *data);
+static void print_line(WINDOW *win, int row, int width);
 static char *get_line(void);
 static void print_position(WINDOW * win);
 
 static int hscroll;
 static int begin_reached, end_reached, page_length;
-static const char *buf;
-static const char *page;
+static char *buf;
+static char *page;
 
 /*
  * refresh window content
  */
 static void refresh_text_box(WINDOW *dialog, WINDOW *box, int boxh, int boxw,
-							  int cur_y, int cur_x)
+			     int cur_y, int cur_x, update_text_fn update_text,
+			     void *data)
 {
-	print_page(box, boxh, boxw);
+	print_page(box, boxh, boxw, update_text, data);
 	print_position(dialog);
 	wmove(dialog, cur_y, cur_x);	/* Restore cursor position */
 	wrefresh(dialog);
@@ -47,14 +49,18 @@ static void refresh_text_box(WINDOW *dialog, WINDOW *box, int boxh, int boxw,
 
 /*
  * Display text from a file in a dialog box.
+ *
+ * keys is a null-terminated array
+ * update_text() may not add or remove any '\n' or '\0' in tbuf
  */
-int dialog_textbox(const char *title, const char *tbuf,
-		   int initial_height, int initial_width)
+int dialog_textbox(const char *title, char *tbuf, int initial_height,
+		   int initial_width, int *keys, int *_vscroll, int *_hscroll,
+		   update_text_fn update_text, void *data)
 {
 	int i, x, y, cur_x, cur_y, key = 0;
 	int height, width, boxh, boxw;
-	int passed_end;
 	WINDOW *dialog, *box;
+	bool done = false;
 
 	begin_reached = 1;
 	end_reached = 0;
@@ -63,6 +69,15 @@ int dialog_textbox(const char *title, const char *tbuf,
 	buf = tbuf;
 	page = buf;	/* page is pointer to start of page to be displayed */
 
+	if (_vscroll && *_vscroll) {
+		begin_reached = 0;
+
+		for (i = 0; i < *_vscroll; i++)
+			get_line();
+	}
+	if (_hscroll)
+		hscroll = *_hscroll;
+
 do_resize:
 	getmaxyx(stdscr, height, width);
 	if (height < 8 || width < 8)
@@ -120,25 +135,28 @@ do_resize:
 
 	/* Print first page of text */
 	attr_clear(box, boxh, boxw, dlg.dialog.atr);
-	refresh_text_box(dialog, box, boxh, boxw, cur_y, cur_x);
+	refresh_text_box(dialog, box, boxh, boxw, cur_y, cur_x, update_text,
+			 data);
 
-	while ((key != KEY_ESC) && (key != '\n')) {
+	while (!done) {
 		key = wgetch(dialog);
 		switch (key) {
 		case 'E':	/* Exit */
 		case 'e':
 		case 'X':
 		case 'x':
-			delwin(box);
-			delwin(dialog);
-			return 0;
+		case 'q':
+		case '\n':
+			done = true;
+			break;
 		case 'g':	/* First page */
 		case KEY_HOME:
 			if (!begin_reached) {
 				begin_reached = 1;
 				page = buf;
 				refresh_text_box(dialog, box, boxh, boxw,
-						 cur_y, cur_x);
+						 cur_y, cur_x, update_text,
+						 data);
 			}
 			break;
 		case 'G':	/* Last page */
@@ -148,78 +166,48 @@ do_resize:
 			/* point to last char in buf */
 			page = buf + strlen(buf);
 			back_lines(boxh);
-			refresh_text_box(dialog, box, boxh, boxw,
-					 cur_y, cur_x);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case 'K':	/* Previous line */
 		case 'k':
 		case KEY_UP:
-			if (!begin_reached) {
-				back_lines(page_length + 1);
-
-				/* We don't call print_page() here but use
-				 * scrolling to ensure faster screen update.
-				 * However, 'end_reached' and 'page_length'
-				 * should still be updated, and 'page' should
-				 * point to start of next page. This is done
-				 * by calling get_line() in the following
-				 * 'for' loop. */
-				scrollok(box, TRUE);
-				wscrl(box, -1);	/* Scroll box region down one line */
-				scrollok(box, FALSE);
-				page_length = 0;
-				passed_end = 0;
-				for (i = 0; i < boxh; i++) {
-					if (!i) {
-						/* print first line of page */
-						print_line(box, 0, boxw);
-						wnoutrefresh(box);
-					} else
-						/* Called to update 'end_reached' and 'page' */
-						get_line();
-					if (!passed_end)
-						page_length++;
-					if (end_reached && !passed_end)
-						passed_end = 1;
-				}
+			if (begin_reached)
+				break;
 
-				print_position(dialog);
-				wmove(dialog, cur_y, cur_x);	/* Restore cursor position */
-				wrefresh(dialog);
-			}
+			back_lines(page_length + 1);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case 'B':	/* Previous page */
 		case 'b':
+		case 'u':
 		case KEY_PPAGE:
 			if (begin_reached)
 				break;
 			back_lines(page_length + boxh);
-			refresh_text_box(dialog, box, boxh, boxw,
-					 cur_y, cur_x);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case 'J':	/* Next line */
 		case 'j':
 		case KEY_DOWN:
-			if (!end_reached) {
-				begin_reached = 0;
-				scrollok(box, TRUE);
-				scroll(box);	/* Scroll box region up one line */
-				scrollok(box, FALSE);
-				print_line(box, boxh - 1, boxw);
-				wnoutrefresh(box);
-				print_position(dialog);
-				wmove(dialog, cur_y, cur_x);	/* Restore cursor position */
-				wrefresh(dialog);
-			}
+			if (end_reached)
+				break;
+
+			back_lines(page_length - 1);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case KEY_NPAGE:	/* Next page */
 		case ' ':
+		case 'd':
 			if (end_reached)
 				break;
 
 			begin_reached = 0;
-			refresh_text_box(dialog, box, boxh, boxw,
-					 cur_y, cur_x);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case '0':	/* Beginning of line */
 		case 'H':	/* Scroll left */
@@ -234,8 +222,8 @@ do_resize:
 				hscroll--;
 			/* Reprint current page to scroll horizontally */
 			back_lines(page_length);
-			refresh_text_box(dialog, box, boxh, boxw,
-					 cur_y, cur_x);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case 'L':	/* Scroll right */
 		case 'l':
@@ -245,11 +233,12 @@ do_resize:
 			hscroll++;
 			/* Reprint current page to scroll horizontally */
 			back_lines(page_length);
-			refresh_text_box(dialog, box, boxh, boxw,
-					 cur_y, cur_x);
+			refresh_text_box(dialog, box, boxh, boxw, cur_y,
+					 cur_x, update_text, data);
 			break;
 		case KEY_ESC:
-			key = on_key_esc(dialog);
+			if (on_key_esc(dialog) == KEY_ESC)
+				done = true;
 			break;
 		case KEY_RESIZE:
 			back_lines(height);
@@ -257,11 +246,31 @@ do_resize:
 			delwin(dialog);
 			on_key_resize();
 			goto do_resize;
+		default:
+			for (i = 0; keys[i]; i++) {
+				if (key == keys[i]) {
+					done = true;
+					break;
+				}
+			}
 		}
 	}
 	delwin(box);
 	delwin(dialog);
-	return key;		/* ESC pressed */
+	if (_vscroll) {
+		const char *s;
+
+		s = buf;
+		*_vscroll = 0;
+		back_lines(page_length);
+		while (s < page && (s = strchr(s, '\n'))) {
+			(*_vscroll)++;
+			s++;
+		}
+	}
+	if (_hscroll)
+		*_hscroll = hscroll;
+	return key;
 }
 
 /*
@@ -298,12 +307,23 @@ static void back_lines(int n)
 }
 
 /*
- * Print a new page of text. Called by dialog_textbox().
+ * Print a new page of text.
  */
-static void print_page(WINDOW * win, int height, int width)
+static void print_page(WINDOW *win, int height, int width, update_text_fn
+		       update_text, void *data)
 {
 	int i, passed_end = 0;
 
+	if (update_text) {
+		char *end;
+
+		for (i = 0; i < height; i++)
+			get_line();
+		end = page;
+		back_lines(height);
+		update_text(buf, page - buf, end - buf, data);
+	}
+
 	page_length = 0;
 	for (i = 0; i < height; i++) {
 		print_line(win, i, width);
@@ -316,11 +336,10 @@ static void print_page(WINDOW * win, int height, int width)
 }
 
 /*
- * Print a new line of text. Called by dialog_textbox() and print_page().
+ * Print a new line of text.
  */
 static void print_line(WINDOW * win, int row, int width)
 {
-	int y, x;
 	char *line;
 
 	line = get_line();
@@ -329,10 +348,10 @@ static void print_line(WINDOW * win, int row, int width)
 	waddch(win, ' ');
 	waddnstr(win, line, MIN(strlen(line), width - 2));
 
-	getyx(win, y, x);
 	/* Clear 'residue' of previous line */
 #if OLD_NCURSES
 	{
+		int x = getcurx(win);
 		int i;
 		for (i = 0; i < width - x; i++)
 			waddch(win, ' ');
@@ -355,10 +374,8 @@ static char *get_line(void)
 	end_reached = 0;
 	while (*page != '\n') {
 		if (*page == '\0') {
-			if (!end_reached) {
-				end_reached = 1;
-				break;
-			}
+			end_reached = 1;
+			break;
 		} else if (i < MAX_LEN)
 			line[i++] = *(page++);
 		else {
@@ -371,7 +388,7 @@ static char *get_line(void)
 	if (i <= MAX_LEN)
 		line[i] = '\0';
 	if (!end_reached)
-		page++;		/* move pass '\n' */
+		page++;		/* move past '\n' */
 
 	return line;
 }
diff --git a/support/kconfig/lxdialog/util.c b/support/kconfig/lxdialog/util.c
index f2375ad..109d531 100644
--- a/support/kconfig/lxdialog/util.c
+++ b/support/kconfig/lxdialog/util.c
@@ -23,6 +23,9 @@
 
 #include "dialog.h"
 
+/* Needed in signal handler in mconf.c */
+int saved_x, saved_y;
+
 struct dialog_info dlg;
 
 static void set_mono_theme(void)
@@ -273,6 +276,10 @@ int init_dialog(const char *backtitle)
 	int height, width;
 
 	initscr();		/* Init curses */
+
+	/* Get current cursor position for signal handler in mconf.c */
+	getyx(stdscr, saved_y, saved_x);
+
 	getmaxyx(stdscr, height, width);
 	if (height < 19 || width < 80) {
 		endwin();
diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 3ed8a25..fa61759 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -15,10 +15,10 @@
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
+#include <signal.h>
 #include <unistd.h>
 #include <locale.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 #include "lxdialog/dialog.h"
 
@@ -105,10 +105,10 @@ static const char mconf_readme[] = N_(
 "Text Box    (Help Window)\n"
 "--------\n"
 "o  Use the cursor keys to scroll up/down/left/right.  The VI editor\n"
-"   keys h,j,k,l function here as do <SPACE BAR> and <B> for those\n"
-"   who are familiar with less and lynx.\n"
+"   keys h,j,k,l function here as do <u>, <d>, <SPACE BAR> and <B> for \n"
+"   those who are familiar with less and lynx.\n"
 "\n"
-"o  Press <E>, <X>, <Enter> or <Esc><Esc> to exit.\n"
+"o  Press <E>, <X>, <q>, <Enter> or <Esc><Esc> to exit.\n"
 "\n"
 "\n"
 "Alternate Configuration Files\n"
@@ -236,16 +236,19 @@ search_help[] = N_(
 	"Result:\n"
 	"-----------------------------------------------------------------\n"
 	"Symbol: FOO [=m]\n"
+	"Type  : tristate\n"
 	"Prompt: Foo bus is used to drive the bar HW\n"
-	"Defined at drivers/pci/Kconfig:47\n"
-	"Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
-	"Location:\n"
-	"  -> Bus options (PCI, PCMCIA, EISA, MCA, ISA)\n"
-	"    -> PCI support (PCI [=y])\n"
-	"      -> PCI access mode (<choice> [=y])\n"
-	"Selects: LIBCRC32\n"
-	"Selected by: BAR\n"
+	"  Defined at drivers/pci/Kconfig:47\n"
+	"  Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
+	"  Location:\n"
+	"    -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
+	"      -> PCI support (PCI [=y])\n"
+	"(1)     -> PCI access mode (<choice> [=y])\n"
+	"  Selects: LIBCRC32\n"
+	"  Selected by: BAR\n"
 	"-----------------------------------------------------------------\n"
+	"o The line 'Type:' shows the type of the configuration option for\n"
+	"  this symbol (boolean, tristate, string, ...)\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
 	"  this symbol\n"
 	"o The 'Defined at' line tell at what file / line number the symbol\n"
@@ -254,8 +257,12 @@ search_help[] = N_(
 	"  this symbol to be visible in the menu (selectable)\n"
 	"o The 'Location:' lines tell where in the menu structure this symbol\n"
 	"  is located\n"
-	"    A location followed by a [=y] indicate that this is a selectable\n"
-	"    menu item - and current value is displayed inside brackets.\n"
+	"    A location followed by a [=y] indicates that this is a\n"
+	"    selectable menu item - and the current value is displayed inside\n"
+	"    brackets.\n"
+	"    Press the key in the (#) prefix to jump directly to that\n"
+	"    location. You will be returned to the current search results\n"
+	"    after exiting this new menu.\n"
 	"o The 'Selects:' line tell what symbol will be automatically\n"
 	"  selected if this symbol is selected (y or m)\n"
 	"o The 'Selected by' line tell what symbol has selected this symbol\n"
@@ -273,12 +280,16 @@ static struct menu *current_menu;
 static int child_count;
 static int single_menu_mode;
 static int show_all_options;
+static int save_and_exit;
 
-static void conf(struct menu *menu);
+static void conf(struct menu *menu, struct menu *active_menu);
 static void conf_choice(struct menu *menu);
 static void conf_string(struct menu *menu);
 static void conf_load(void);
 static void conf_save(void);
+static int show_textbox_ext(const char *title, char *text, int r, int c,
+			    int *keys, int *vscroll, int *hscroll,
+			    update_text_fn update_text, void *data);
 static void show_textbox(const char *title, const char *text, int r, int c);
 static void show_helptext(const char *title, const char *text);
 static void show_help(struct menu *menu);
@@ -301,17 +312,56 @@ static void set_config_filename(const char *config_filename)
 }
 
 
+struct search_data {
+	struct list_head *head;
+	struct menu **targets;
+	int *keys;
+};
+
+static void update_text(char *buf, size_t start, size_t end, void *_data)
+{
+	struct search_data *data = _data;
+	struct jump_key *pos;
+	int k = 0;
+
+	list_for_each_entry(pos, data->head, entries) {
+		if (pos->offset >= start && pos->offset < end) {
+			char header[4];
+
+			if (k < JUMP_NB) {
+				int key = '0' + (pos->index % JUMP_NB) + 1;
+
+				sprintf(header, "(%c)", key);
+				data->keys[k] = key;
+				data->targets[k] = pos->target;
+				k++;
+			} else {
+				sprintf(header, "   ");
+			}
+
+			memcpy(buf + pos->offset, header, sizeof(header) - 1);
+		}
+	}
+	data->keys[k] = 0;
+}
+
 static void search_conf(void)
 {
 	struct symbol **sym_arr;
 	struct gstr res;
+	struct gstr title;
 	char *dialog_input;
-	int dres;
+	int dres, vscroll = 0, hscroll = 0;
+	bool again;
+
+	title = str_new();
+	str_printf( &title, _("Enter %s (sub)string to search for "
+			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+
 again:
 	dialog_clear();
 	dres = dialog_inputbox(_("Search Configuration Parameter"),
-			      _("Enter " CONFIG_ " (sub)string to search for "
-				"(with or without \"" CONFIG_ "\")"),
+			      str_get(&title),
 			      10, 75, "");
 	switch (dres) {
 	case 0:
@@ -320,6 +370,7 @@ again:
 		show_helptext(_("Search Configuration"), search_help);
 		goto again;
 	default:
+		str_free(&title);
 		return;
 	}
 
@@ -329,10 +380,31 @@ again:
 		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
-	res = get_relations_str(sym_arr);
+	do {
+		LIST_HEAD(head);
+		struct menu *targets[JUMP_NB];
+		int keys[JUMP_NB + 1], i;
+		struct search_data data = {
+			.head = &head,
+			.targets = targets,
+			.keys = keys,
+		};
+
+		res = get_relations_str(sym_arr, &head);
+		dres = show_textbox_ext(_("Search Results"), (char *)
+					str_get(&res), 0, 0, keys, &vscroll,
+					&hscroll, &update_text, (void *)
+					&data);
+		again = false;
+		for (i = 0; i < JUMP_NB && keys[i]; i++)
+			if (dres == keys[i]) {
+				conf(targets[i]->parent, targets[i]);
+				again = true;
+			}
+		str_free(&res);
+	} while (again);
 	free(sym_arr);
-	show_textbox(_("Search Results"), str_get(&res), 0, 0);
-	str_free(&res);
+	str_free(&title);
 }
 
 static void build_conf(struct menu *menu)
@@ -513,12 +585,11 @@ conf_childs:
 	indent -= doint;
 }
 
-static void conf(struct menu *menu)
+static void conf(struct menu *menu, struct menu *active_menu)
 {
 	struct menu *submenu;
 	const char *prompt = menu_get_prompt(menu);
 	struct symbol *sym;
-	struct menu *active_menu = NULL;
 	int res;
 	int s_scroll = 0;
 
@@ -528,14 +599,6 @@ static void conf(struct menu *menu)
 		build_conf(menu);
 		if (!child_count)
 			break;
-		if (menu == &rootmenu) {
-			item_make("--- ");
-			item_set_tag(':');
-			item_make(_("    Load an Alternate Configuration File"));
-			item_set_tag('L');
-			item_make(_("    Save an Alternate Configuration File"));
-			item_set_tag('S');
-		}
 		dialog_clear();
 		res = dialog_menu(prompt ? _(prompt) : _("Main Menu"),
 				  _(menu_instructions),
@@ -561,23 +624,17 @@ static void conf(struct menu *menu)
 				if (single_menu_mode)
 					submenu->data = (void *) (long) !submenu->data;
 				else
-					conf(submenu);
+					conf(submenu, NULL);
 				break;
 			case 't':
 				if (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)
 					conf_choice(submenu);
 				else if (submenu->prompt->type == P_MENU)
-					conf(submenu);
+					conf(submenu, NULL);
 				break;
 			case 's':
 				conf_string(submenu);
 				break;
-			case 'L':
-				conf_load();
-				break;
-			case 'S':
-				conf_save();
-				break;
 			}
 			break;
 		case 2:
@@ -587,6 +644,12 @@ static void conf(struct menu *menu)
 				show_helptext(_("README"), _(mconf_readme));
 			break;
 		case 3:
+			conf_save();
+			break;
+		case 4:
+			conf_load();
+			break;
+		case 5:
 			if (item_is_tag('t')) {
 				if (sym_set_tristate_value(sym, yes))
 					break;
@@ -594,34 +657,43 @@ static void conf(struct menu *menu)
 					show_textbox(NULL, setmod_text, 6, 74);
 			}
 			break;
-		case 4:
+		case 6:
 			if (item_is_tag('t'))
 				sym_set_tristate_value(sym, no);
 			break;
-		case 5:
+		case 7:
 			if (item_is_tag('t'))
 				sym_set_tristate_value(sym, mod);
 			break;
-		case 6:
+		case 8:
 			if (item_is_tag('t'))
 				sym_toggle_tristate_value(sym);
 			else if (item_is_tag('m'))
-				conf(submenu);
+				conf(submenu, NULL);
 			break;
-		case 7:
+		case 9:
 			search_conf();
 			break;
-		case 8:
+		case 10:
 			show_all_options = !show_all_options;
 			break;
 		}
 	}
 }
 
-static void show_textbox(const char *title, const char *text, int r, int c)
+static int show_textbox_ext(const char *title, char *text, int r, int c, int
+			    *keys, int *vscroll, int *hscroll, update_text_fn
+			    update_text, void *data)
 {
 	dialog_clear();
-	dialog_textbox(title, text, r, c);
+	return dialog_textbox(title, text, r, c, keys, vscroll, hscroll,
+			      update_text, data);
+}
+
+static void show_textbox(const char *title, const char *text, int r, int c)
+{
+	show_textbox_ext(title, (char *) text, r, c, (int []) {0}, NULL, NULL,
+			 NULL, NULL);
 }
 
 static void show_helptext(const char *title, const char *text)
@@ -629,6 +701,17 @@ static void show_helptext(const char *title, const char *text)
 	show_textbox(title, text, 0, 0);
 }
 
+static void conf_message_callback(const char *fmt, va_list ap)
+{
+	char buf[PATH_MAX+1];
+
+	vsnprintf(buf, sizeof(buf), fmt, ap);
+	if (save_and_exit)
+		printf("%s", buf);
+	else
+		show_textbox(NULL, buf, 6, 60);
+}
+
 static void show_help(struct menu *menu)
 {
 	struct gstr help = str_new();
@@ -793,9 +876,57 @@ static void conf_save(void)
 	}
 }
 
+static int handle_exit(void)
+{
+	int res;
+
+	save_and_exit = 1;
+	dialog_clear();
+	if (conf_get_changed())
+		res = dialog_yesno(NULL,
+				   _("Do you wish to save your new configuration ?\n"
+				     "<ESC><ESC> to continue."),
+				   6, 60);
+	else
+		res = -1;
+
+	end_dialog(saved_x, saved_y);
+
+	switch (res) {
+	case 0:
+		if (conf_write(filename)) {
+			fprintf(stderr, _("\n\n"
+					  "Error while writing of the configuration.\n"
+					  "Your configuration changes were NOT saved."
+					  "\n\n"));
+			return 1;
+		}
+		/* fall through */
+	case -1:
+		printf(_("\n\n"
+			 "*** End of the configuration.\n"
+			 "*** Execute 'make' to start the build or try 'make help'."
+			 "\n\n"));
+		res = 0;
+		break;
+	default:
+		fprintf(stderr, _("\n\n"
+				  "Your configuration changes were NOT saved."
+				  "\n\n"));
+		if (res != KEY_ESC)
+			res = 0;
+	}
+
+	return res;
+}
+
+static void sig_handler(int signo)
+{
+	exit(handle_exit());
+}
+
 int main(int ac, char **av)
 {
-	int saved_x, saved_y;
 	char *mode;
 	int res;
 
@@ -803,6 +934,8 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
+	signal(SIGINT, sig_handler);
+
 	conf_parse(av[1]);
 	conf_read(NULL);
 
@@ -812,9 +945,6 @@ int main(int ac, char **av)
 			single_menu_mode = 1;
 	}
 
-	initscr();
-
-	getyx(stdscr, saved_y, saved_x);
 	if (init_dialog(NULL)) {
 		fprintf(stderr, N_("Your display is too small to run Menuconfig!\n"));
 		fprintf(stderr, N_("It must be at least 19 lines by 80 columns.\n"));
@@ -822,41 +952,12 @@ int main(int ac, char **av)
 	}
 
 	set_config_filename(conf_get_configname());
+	conf_set_message_callback(conf_message_callback);
 	do {
-		conf(&rootmenu);
-		dialog_clear();
-		if (conf_get_changed())
-			res = dialog_yesno(NULL,
-					   _("Do you wish to save your "
-					     "new configuration?\n"
-					     "<ESC><ESC> to continue."),
-					   6, 60);
-		else
-			res = -1;
+		conf(&rootmenu, NULL);
+		res = handle_exit();
 	} while (res == KEY_ESC);
-	end_dialog(saved_x, saved_y);
-
-	switch (res) {
-	case 0:
-		if (conf_write(filename)) {
-			fprintf(stderr, _("\n\n"
-				"Error while writing of the configuration.\n"
-				"Your configuration changes were NOT saved."
-				"\n\n"));
-			return 1;
-		}
-	case -1:
-		printf(_("\n\n"
-			"*** End of the configuration.\n"
-			"*** Execute 'make' to start the build or try 'make help'."
-			"\n\n"));
-		break;
-	default:
-		fprintf(stderr, _("\n\n"
-			"Your configuration changes were NOT saved."
-			"\n\n"));
-	}
 
-	return 0;
+	return res;
 }
 
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index d49f8b8..06a9364 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -3,14 +3,14 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
+#include <ctype.h>
+#include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
-static const char nohelp_text[] = N_(
-	"There is no help available for this option.\n");
+static const char nohelp_text[] = "There is no help available for this option.";
 
 struct menu rootmenu;
 static struct menu **last_entry_ptr;
@@ -48,7 +48,7 @@ void menu_add_entry(struct symbol *sym)
 {
 	struct menu *menu;
 
-	menu = malloc(sizeof(*menu));
+	menu = xmalloc(sizeof(*menu));
 	memset(menu, 0, sizeof(*menu));
 	menu->sym = sym;
 	menu->parent = current_menu;
@@ -350,7 +350,7 @@ void menu_finalize(struct menu *parent)
 			last_menu->next = NULL;
 		}
 
-		sym->dir_dep.expr = parent->dep;
+		sym->dir_dep.expr = expr_alloc_or(sym->dir_dep.expr, parent->dep);
 	}
 	for (menu = parent->list; menu; menu = menu->next) {
 		if (sym && sym_is_choice(sym) &&
@@ -507,10 +507,12 @@ const char *menu_get_help(struct menu *menu)
 		return "";
 }
 
-static void get_prompt_str(struct gstr *r, struct property *prop)
+static void get_prompt_str(struct gstr *r, struct property *prop,
+			   struct list_head *head)
 {
 	int i, j;
-	struct menu *submenu[8], *menu;
+	struct menu *submenu[8], *menu, *location = NULL;
+	struct jump_key *jump;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
 	str_printf(r, _("  Defined at %s:%d\n"), prop->menu->file->name,
@@ -521,13 +523,44 @@ static void get_prompt_str(struct gstr *r, struct property *prop)
 		str_append(r, "\n");
 	}
 	menu = prop->menu->parent;
-	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent)
+	for (i = 0; menu != &rootmenu && i < 8; menu = menu->parent) {
+		bool accessible = menu_is_visible(menu);
+
 		submenu[i++] = menu;
+		if (location == NULL && accessible)
+			location = menu;
+	}
+	if (head && location) {
+		jump = xmalloc(sizeof(struct jump_key));
+
+		if (menu_is_visible(prop->menu)) {
+			/*
+			 * There is not enough room to put the hint at the
+			 * beginning of the "Prompt" line. Put the hint on the
+			 * last "Location" line even when it would belong on
+			 * the former.
+			 */
+			jump->target = prop->menu;
+		} else
+			jump->target = location;
+
+		if (list_empty(head))
+			jump->index = 0;
+		else
+			jump->index = list_entry(head->prev, struct jump_key,
+						 entries)->index + 1;
+
+		list_add_tail(&jump->entries, head);
+	}
+
 	if (i > 0) {
 		str_printf(r, _("  Location:\n"));
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
-			str_printf(r, "%*c-> %s", j, ' ', _(menu_get_prompt(menu)));
+			if (head && location && menu == location)
+				jump->offset = r->len - 1;
+			str_printf(r, "%*c-> %s", j, ' ',
+				   _(menu_get_prompt(menu)));
 			if (menu->sym) {
 				str_printf(r, " (%s [=%s])", menu->sym->name ?
 					menu->sym->name : _("<choice>"),
@@ -538,7 +571,11 @@ static void get_prompt_str(struct gstr *r, struct property *prop)
 	}
 }
 
-void get_symbol_str(struct gstr *r, struct symbol *sym)
+/*
+ * head is optional and may be NULL
+ */
+void get_symbol_str(struct gstr *r, struct symbol *sym,
+		    struct list_head *head)
 {
 	bool hit;
 	struct property *prop;
@@ -557,7 +594,7 @@ void get_symbol_str(struct gstr *r, struct symbol *sym)
 		}
 	}
 	for_all_prompts(sym, prop)
-		get_prompt_str(r, prop);
+		get_prompt_str(r, prop, head);
 	hit = false;
 	for_all_properties(sym, prop, P_SELECT) {
 		if (!hit) {
@@ -577,14 +614,14 @@ void get_symbol_str(struct gstr *r, struct symbol *sym)
 	str_append(r, "\n\n");
 }
 
-struct gstr get_relations_str(struct symbol **sym_arr)
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head)
 {
 	struct symbol *sym;
 	struct gstr res = str_new();
 	int i;
 
 	for (i = 0; sym_arr && (sym = sym_arr[i]); i++)
-		get_symbol_str(&res, sym);
+		get_symbol_str(&res, sym, head);
 	if (!i)
 		str_append(&res, _("No matches found.\n"));
 	return res;
@@ -594,16 +631,14 @@ struct gstr get_relations_str(struct symbol **sym_arr)
 void menu_get_ext_help(struct menu *menu, struct gstr *help)
 {
 	struct symbol *sym = menu->sym;
+	const char *help_text = nohelp_text;
 
 	if (menu_has_help(menu)) {
-		if (sym->name) {
+		if (sym->name)
 			str_printf(help, "%s:\n\n", sym->name);
-			str_append(help, _(menu_get_help(menu)));
-			str_append(help, "\n");
-		}
-	} else {
-		str_append(help, nohelp_text);
+		help_text = menu_get_help(menu);
 	}
+	str_printf(help, "%s\n", _(help_text));
 	if (sym)
-		get_symbol_str(help, sym);
+		get_symbol_str(help, sym, NULL);
 }
diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
new file mode 100755
index 0000000..05274fc
--- /dev/null
+++ b/support/kconfig/merge_config.sh
@@ -0,0 +1,142 @@
+#!/bin/sh
+#  merge_config.sh - Takes a list of config fragment values, and merges
+#  them one by one. Provides warnings on overridden values, and specified
+#  values that did not make it to the resulting .config file (due to missed
+#  dependencies or config symbol removal).
+#
+#  Portions reused from kconf_check and generate_cfg:
+#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/kconf_check
+#  http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/tree/tools/generate_cfg
+#
+#  Copyright (c) 2009-2010 Wind River Systems, Inc.
+#  Copyright 2011 Linaro
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License version 2 as
+#  published by the Free Software Foundation.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+#  See the GNU General Public License for more details.
+
+clean_up() {
+	rm -f $TMP_FILE
+	exit
+}
+trap clean_up HUP INT TERM
+
+usage() {
+	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
+	echo "  -h    display this help text"
+	echo "  -m    only merge the fragments, do not execute the make command"
+	echo "  -n    use allnoconfig instead of alldefconfig"
+	echo "  -r    list redundant entries when merging fragments"
+	echo "  -O    dir to put generated output files"
+}
+
+MAKE=true
+ALLTARGET=alldefconfig
+WARNREDUN=false
+OUTPUT=.
+
+while true; do
+	case $1 in
+	"-n")
+		ALLTARGET=allnoconfig
+		shift
+		continue
+		;;
+	"-m")
+		MAKE=false
+		shift
+		continue
+		;;
+	"-h")
+		usage
+		exit
+		;;
+	"-r")
+		WARNREDUN=true
+		shift
+		continue
+		;;
+	"-O")
+		if [ -d $2 ];then
+			OUTPUT=$(echo $2 | sed 's/\/*$//')
+		else
+			echo "output directory $2 does not exist" 1>&2
+			exit 1
+		fi
+		shift 2
+		continue
+		;;
+	*)
+		break
+		;;
+	esac
+done
+
+INITFILE=$1
+shift;
+
+MERGE_LIST=$*
+SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+
+echo "Using $INITFILE as base"
+cat $INITFILE > $TMP_FILE
+
+# Merge files, printing warnings on overrided values
+for MERGE_FILE in $MERGE_LIST ; do
+	echo "Merging $MERGE_FILE"
+	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
+
+	for CFG in $CFG_LIST ; do
+		grep -q -w $CFG $TMP_FILE
+		if [ $? -eq 0 ] ; then
+			PREV_VAL=$(grep -w $CFG $TMP_FILE)
+			NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+			if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+			echo Value of $CFG is redefined by fragment $MERGE_FILE:
+			echo Previous  value: $PREV_VAL
+			echo New value:       $NEW_VAL
+			echo
+			elif [ "$WARNREDUN" = "true" ]; then
+			echo Value of $CFG is redundant by fragment $MERGE_FILE:
+			fi
+			sed -i "/$CFG[ =]/d" $TMP_FILE
+		fi
+	done
+	cat $MERGE_FILE >> $TMP_FILE
+done
+
+if [ "$MAKE" = "false" ]; then
+	cp $TMP_FILE $OUTPUT/.config
+	echo "#"
+	echo "# merged configuration written to $OUTPUT/.config (needs make)"
+	echo "#"
+	clean_up
+	exit
+fi
+
+# Use the merged file as the starting point for:
+# alldefconfig: Fills in any missing symbols with Kconfig default
+# allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
+make KCONFIG_ALLCONFIG=$TMP_FILE O=$OUTPUT $ALLTARGET
+
+
+# Check all specified config values took (might have missed-dependency issues)
+for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
+
+	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
+	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)
+	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
+		echo "Value requested for $CFG not in final .config"
+		echo "Requested value:  $REQUESTED_VAL"
+		echo "Actual value:     $ACTUAL_VAL"
+		echo ""
+	fi
+done
+
+clean_up
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index 488dd74..dbf31ed 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -7,217 +7,208 @@
  */
 #define _GNU_SOURCE
 #include <string.h>
-#define LKC_DIRECT_LINK
+#include <stdlib.h>
+
 #include "lkc.h"
 #include "nconf.h"
 #include <ctype.h>
 
-static const char nconf_readme[] = N_(
-"Overview\n"
-"--------\n"
-"This interface let you select features and parameters for the build.\n"
-"Features can either be built-in, modularized, or ignored. Parameters\n"
-"must be entered in as decimal or hexadecimal numbers or text.\n"
-"\n"
-"Menu items beginning with following braces represent features that\n"
-"  [ ] can be built in or removed\n"
-"  < > can be built in, modularized or removed\n"
-"  { } can be built in or modularized (selected by other feature)\n"
-"  - - are selected by other feature,\n"
-"  XXX cannot be selected. Use Symbol Info to find out why,\n"
-"while *, M or whitespace inside braces means to build in, build as\n"
-"a module or to exclude the feature respectively.\n"
+static const char nconf_global_help[] = N_(
+"Help windows\n"
+"------------\n"
+"o  Global help:  Unless in a data entry window, pressing <F1> will give \n"
+"   you the global help window, which you are just reading.\n"
 "\n"
-"To change any of these features, highlight it with the cursor\n"
-"keys and press <Y> to build it in, <M> to make it a module or\n"
-"<N> to removed it.  You may also press the <Space Bar> to cycle\n"
-"through the available options (ie. Y->N->M->Y).\n"
+"o  A short version of the global help is available by pressing <F3>.\n"
 "\n"
-"Some additional keyboard hints:\n"
+"o  Local help:  To get help related to the current menu entry, use any\n"
+"   of <?> <h>, or if in a data entry window then press <F1>.\n"
 "\n"
-"Menus\n"
-"----------\n"
-"o  Use the Up/Down arrow keys (cursor keys) to highlight the item\n"
-"   you wish to change use <Enter> or <Space>. Goto submenu by \n"
-"   pressing <Enter> of <right-arrow>. Use <Esc> or <left-arrow> to go back.\n"
-"   Submenus are designated by \"--->\".\n"
 "\n"
-"   Searching: pressing '/' triggers interactive search mode.\n"
-"              nconfig performs a case insensitive search for the string\n"
-"              in the menu prompts (no regex support).\n"
-"              Pressing the up/down keys highlights the previous/next\n"
-"              matching item. Backspace removes one character from the\n"
-"              match string. Pressing either '/' again or ESC exits\n"
-"              search mode. All other keys behave normally.\n"
+"Menu entries\n"
+"------------\n"
+"This interface lets you select features and parameters for the kernel\n"
+"build.  Kernel features can either be built-in, modularized, or removed.\n"
+"Parameters must be entered as text or decimal or hexadecimal numbers.\n"
 "\n"
-"   You may also use the <PAGE UP> and <PAGE DOWN> keys to scroll\n"
-"   unseen options into view.\n"
+"Menu entries beginning with following braces represent features that\n"
+"  [ ]  can be built in or removed\n"
+"  < >  can be built in, modularized or removed\n"
+"  { }  can be built in or modularized, are selected by another feature\n"
+"  - -  are selected by another feature\n"
+"  XXX  cannot be selected.  Symbol Info <F2> tells you why.\n"
+"*, M or whitespace inside braces means to build in, build as a module\n"
+"or to exclude the feature respectively.\n"
 "\n"
-"o  To exit a menu use the just press <ESC> <F5> <F8> or <left-arrow>.\n"
+"To change any of these features, highlight it with the movement keys\n"
+"listed below and press <y> to build it in, <m> to make it a module or\n"
+"<n> to remove it.  You may press the <Space> key to cycle through the\n"
+"available options.\n"
 "\n"
-"o  To get help with an item, press <F1>\n"
-"   Shortcut: Press <h> or <?>.\n"
+"A trailing \"--->\" designates a submenu.\n"
 "\n"
 "\n"
-"Radiolists  (Choice lists)\n"
-"-----------\n"
-"o  Use the cursor keys to select the option you wish to set and press\n"
-"   <S> or the <SPACE BAR>.\n"
+"Menu navigation keys\n"
+"----------------------------------------------------------------------\n"
+"Linewise up                 <Up>\n"
+"Linewise down               <Down>\n"
+"Pagewise up                 <Page Up>\n"
+"Pagewise down               <Page Down>\n"
+"First entry                 <Home>\n"
+"Last entry                  <End>\n"
+"Enter a submenu             <Right>  <Enter>\n"
+"Go back to parent menu      <Left>   <Esc>  <F5>\n"
+"Close a help window         <Enter>  <Esc>  <F5>\n"
+"Close entry window, apply   <Enter>\n"
+"Close entry window, forget  <Esc>  <F5>\n"
+"Start incremental, case-insensitive search for STRING in menu entries,\n"
+"    no regex support, STRING is displayed in upper left corner\n"
+"                            </>STRING\n"
+"    Remove last character   <Backspace>\n"
+"    Jump to next hit        <Down>\n"
+"    Jump to previous hit    <Up>\n"
+"Exit menu search mode       </>  <Esc>\n"
+"Search for configuration variables with or without leading CONFIG_\n"
+"                            <F8>RegExpr<Enter>\n"
+"Verbose search help         <F8><F1>\n"
+"----------------------------------------------------------------------\n"
 "\n"
-"   Shortcut: Press the first letter of the option you wish to set then\n"
-"             press <S> or <SPACE BAR>.\n"
+"Unless in a data entry window, key <1> may be used instead of <F1>,\n"
+"<2> instead of <F2>, etc.\n"
 "\n"
-"o  To see available help for the item, press <F1>\n"
-"   Shortcut: Press <H> or <?>.\n"
 "\n"
+"Radiolist (Choice list)\n"
+"-----------------------\n"
+"Use the movement keys listed above to select the option you wish to set\n"
+"and press <Space>.\n"
 "\n"
-"Data Entry\n"
-"-----------\n"
-"o  Enter the requested information and press <ENTER>\n"
-"   If you are entering hexadecimal values, it is not necessary to\n"
-"   add the '0x' prefix to the entry.\n"
 "\n"
-"o  For help, press <F1>.\n"
+"Data entry\n"
+"----------\n"
+"Enter the requested information and press <Enter>.  Hexadecimal values\n"
+"may be entered without the \"0x\" prefix.\n"
 "\n"
 "\n"
-"Text Box    (Help Window)\n"
-"--------\n"
-"o  Use the cursor keys to scroll up/down/left/right.  The VI editor\n"
-"   keys h,j,k,l function here as do <SPACE BAR> for those\n"
-"   who are familiar with less and lynx.\n"
+"Text Box (Help Window)\n"
+"----------------------\n"
+"Use movement keys as listed in table above.\n"
 "\n"
-"o  Press <Enter>, <F1>, <F5>, <F7> or <Esc> to exit.\n"
+"Press any of <Enter> <Esc> <q> <F5> <F9> to exit.\n"
 "\n"
 "\n"
-"Alternate Configuration Files\n"
+"Alternate configuration files\n"
 "-----------------------------\n"
-"nconfig supports the use of alternate configuration files for\n"
-"those who, for various reasons, find it necessary to switch\n"
-"between different configurations.\n"
+"nconfig supports switching between different configurations.\n"
+"Press <F6> to save your current configuration.  Press <F7> and enter\n"
+"a file name to load a previously saved configuration.\n"
 "\n"
-"At the end of the main menu you will find two options.  One is\n"
-"for saving the current configuration to a file of your choosing.\n"
-"The other option is for loading a previously saved alternate\n"
-"configuration.\n"
 "\n"
-"Even if you don't use alternate configuration files, but you\n"
-"find during a nconfig session that you have completely messed\n"
-"up your settings, you may use the \"Load Alternate...\" option to\n"
-"restore your previously saved settings from \".config\" without\n"
-"restarting nconfig.\n"
+"Terminal configuration\n"
+"----------------------\n"
+"If you use nconfig in a xterm window, make sure your TERM environment\n"
+"variable specifies a terminal configuration which supports at least\n"
+"16 colors.  Otherwise nconfig will look rather bad.\n"
 "\n"
-"Other information\n"
-"-----------------\n"
-"If you use nconfig in an XTERM window make sure you have your\n"
-"$TERM variable set to point to a xterm definition which supports color.\n"
-"Otherwise, nconfig will look rather bad.  nconfig will not\n"
-"display correctly in a RXVT window because rxvt displays only one\n"
-"intensity of color, bright.\n"
+"If the \"stty size\" command reports the current terminalsize correctly,\n"
+"nconfig will adapt to sizes larger than the traditional 80x25 \"standard\"\n"
+"and display longer menus properly.\n"
 "\n"
-"nconfig will display larger menus on screens or xterms which are\n"
-"set to display more than the standard 25 row by 80 column geometry.\n"
-"In order for this to work, the \"stty size\" command must be able to\n"
-"display the screen's current row and column geometry.  I STRONGLY\n"
-"RECOMMEND that you make sure you do NOT have the shell variables\n"
-"LINES and COLUMNS exported into your environment.  Some distributions\n"
-"export those variables via /etc/profile.  Some ncurses programs can\n"
-"become confused when those variables (LINES & COLUMNS) don't reflect\n"
-"the true screen size.\n"
 "\n"
-"Optional personality available\n"
-"------------------------------\n"
-"If you prefer to have all of the options listed in a single menu, rather\n"
-"than the default multimenu hierarchy, run the nconfig with NCONFIG_MODE\n"
-"environment variable set to single_menu. Example:\n"
+"Single menu mode\n"
+"----------------\n"
+"If you prefer to have all of the menu entries listed in a single menu,\n"
+"rather than the default multimenu hierarchy, run nconfig with\n"
+"NCONFIG_MODE environment variable set to single_menu.  Example:\n"
 "\n"
 "make NCONFIG_MODE=single_menu nconfig\n"
 "\n"
-"<Enter> will then unroll the appropriate category, or enfold it if it\n"
-"is already unrolled.\n"
+"<Enter> will then unfold the appropriate category, or fold it if it\n"
+"is already unfolded.  Folded menu entries will be designated by a\n"
+"leading \"++>\" and unfolded entries by a leading \"-->\".\n"
 "\n"
-"Note that this mode can eventually be a little more CPU expensive\n"
-"(especially with a larger number of unrolled categories) than the\n"
-"default mode.\n"
+"Note that this mode can eventually be a little more CPU expensive than\n"
+"the default mode, especially with a larger number of unfolded submenus.\n"
 "\n"),
 menu_no_f_instructions[] = N_(
-" You do not have function keys support. Please follow the\n"
-" following instructions:\n"
-" Arrow keys navigate the menu.\n"
-" <Enter> or <right-arrow> selects submenus --->.\n"
-" Capital Letters are hotkeys.\n"
-" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
-" Pressing SpaceBar toggles between the above options.\n"
-" Press <Esc> or <left-arrow> to go back one menu,\n"
-" <?> or <h> for Help, </> for Search.\n"
-" <1> is interchangeable with <F1>, <2> with <F2>, etc.\n"
-" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-" <Esc> always leaves the current window.\n"),
+"Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+"Submenus are designated by a trailing \"--->\".\n"
+"\n"
+"Use the following keys to navigate the menus:\n"
+"Move up or down with <Up> and <Down>.\n"
+"Enter a submenu with <Enter> or <Right>.\n"
+"Exit a submenu to its parent menu with <Esc> or <Left>.\n"
+"Pressing <y> includes, <n> excludes, <m> modularizes features.\n"
+"Pressing <Space> cycles through the available options.\n"
+"To search for menu entries press </>.\n"
+"<Esc> always leaves the current window.\n"
+"\n"
+"You do not have function keys support.\n"
+"Press <1> instead of <F1>, <2> instead of <F2>, etc.\n"
+"For verbose global help use key <1>.\n"
+"For help related to the current menu entry press <?> or <h>.\n"),
 menu_instructions[] = N_(
-" Arrow keys navigate the menu.\n"
-" <Enter> or <right-arrow> selects submenus --->.\n"
-" Capital Letters are hotkeys.\n"
-" Pressing <Y> includes, <N> excludes, <M> modularizes features.\n"
-" Pressing SpaceBar toggles between the above options\n"
-" Press <Esc>, <F5> or <left-arrow> to go back one menu,\n"
-" <?>, <F1> or <h> for Help, </> for Search.\n"
-" <1> is interchangeable with <F1>, <2> with <F2>, etc.\n"
-" Legend: [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
-" <Esc> always leaves the current window\n"),
+"Legend:  [*] built-in  [ ] excluded  <M> module  < > module capable.\n"
+"Submenus are designated by a trailing \"--->\".\n"
+"\n"
+"Use the following keys to navigate the menus:\n"
+"Move up or down with <Up> or <Down>.\n"
+"Enter a submenu with <Enter> or <Right>.\n"
+"Exit a submenu to its parent menu with <Esc> or <Left>.\n"
+"Pressing <y> includes, <n> excludes, <m> modularizes features.\n"
+"Pressing <Space> cycles through the available options.\n"
+"To search for menu entries press </>.\n"
+"<Esc> always leaves the current window.\n"
+"\n"
+"Pressing <1> may be used instead of <F1>, <2> instead of <F2>, etc.\n"
+"For verbose global help press <F1>.\n"
+"For help related to the current menu entry press <?> or <h>.\n"),
 radiolist_instructions[] = N_(
-" Use the arrow keys to navigate this window or\n"
-" press the hotkey of the item you wish to select\n"
-" followed by the <SPACE BAR>.\n"
-" Press <?>, <F1> or <h> for additional information about this option.\n"),
+"Press <Up>, <Down>, <Home> or <End> to navigate a radiolist, select\n"
+"with <Space>.\n"
+"For help related to the current entry press <?> or <h>.\n"
+"For global help press <F1>.\n"),
 inputbox_instructions_int[] = N_(
 "Please enter a decimal value.\n"
 "Fractions will not be accepted.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 inputbox_instructions_hex[] = N_(
 "Please enter a hexadecimal value.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 inputbox_instructions_string[] = N_(
 "Please enter a string value.\n"
-"Press <RETURN> to accept, <ESC> to cancel."),
+"Press <Enter> to apply, <Esc> to cancel."),
 setmod_text[] = N_(
-"This feature depends on another which\n"
-"has been configured as a module.\n"
-"As a result, this feature will be built as a module."),
-nohelp_text[] = N_(
-"There is no help available for this option.\n"),
+"This feature depends on another feature which has been configured as a\n"
+"module.  As a result, the current feature will be built as a module too."),
 load_config_text[] = N_(
 "Enter the name of the configuration file you wish to load.\n"
-"Accept the name shown to restore the configuration you\n"
-"last retrieved.  Leave blank to abort."),
+"Accept the name shown to restore the configuration you last\n"
+"retrieved.  Leave empty to abort."),
 load_config_help[] = N_(
-"\n"
 "For various reasons, one may wish to keep several different\n"
 "configurations available on a single machine.\n"
 "\n"
 "If you have saved a previous configuration in a file other than the\n"
-"default one, entering its name here will allow you to modify that\n"
-"configuration.\n"
+"default one, entering its name here will allow you to load and modify\n"
+"that configuration.\n"
 "\n"
-"If you are uncertain, then you have probably never used alternate\n"
-"configuration files.  You should therefor leave this blank to abort.\n"),
+"Leave empty to abort.\n"),
 save_config_text[] = N_(
 "Enter a filename to which this configuration should be saved\n"
-"as an alternate.  Leave blank to abort."),
+"as an alternate.  Leave empty to abort."),
 save_config_help[] = N_(
-"\n"
-"For various reasons, one may wish to keep different configurations\n"
-"available on a single machine.\n"
+"For various reasons, one may wish to keep several different\n"
+"configurations available on a single machine.\n"
 "\n"
 "Entering a file name here will allow you to later retrieve, modify\n"
 "and use the current configuration as an alternate to whatever\n"
 "configuration options you have selected at that time.\n"
 "\n"
-"If you are uncertain what all this means then you should probably\n"
-"leave this blank.\n"),
+"Leave empty to abort.\n"),
 search_help[] = N_(
-"\n"
-"Search for symbols and display their relations. Regular expressions\n"
-"are allowed.\n"
-"Example: search for \"^FOO\"\n"
+"Search for symbols (configuration variable names CONFIG_*) and display\n"
+"their relations.  Regular expressions are supported.\n"
+"Example:  Search for \"^FOO\".\n"
 "Result:\n"
 "-----------------------------------------------------------------\n"
 "Symbol: FOO [ = m]\n"
@@ -225,32 +216,32 @@ search_help[] = N_(
 "Defined at drivers/pci/Kconfig:47\n"
 "Depends on: X86_LOCAL_APIC && X86_IO_APIC || IA64\n"
 "Location:\n"
-"  -> Bus options (PCI, PCMCIA, EISA, MCA, ISA)\n"
+"  -> Bus options (PCI, PCMCIA, EISA, ISA)\n"
 "    -> PCI support (PCI [ = y])\n"
 "      -> PCI access mode (<choice> [ = y])\n"
 "Selects: LIBCRC32\n"
 "Selected by: BAR\n"
 "-----------------------------------------------------------------\n"
-"o The line 'Prompt:' shows the text used in the menu structure for\n"
-"  this symbol\n"
-"o The 'Defined at' line tell at what file / line number the symbol\n"
-"  is defined\n"
-"o The 'Depends on:' line tell what symbols needs to be defined for\n"
-"  this symbol to be visible in the menu (selectable)\n"
-"o The 'Location:' lines tell where in the menu structure this symbol\n"
-"  is located\n"
-"    A location followed by a [ = y] indicate that this is a selectable\n"
-"    menu item - and current value is displayed inside brackets.\n"
-"o The 'Selects:' line tell what symbol will be automatically\n"
-"  selected if this symbol is selected (y or m)\n"
-"o The 'Selected by' line tell what symbol has selected this symbol\n"
+"o  The line 'Prompt:' shows the text displayed for this symbol in\n"
+"   the menu hierarchy.\n"
+"o  The 'Defined at' line tells at what file / line number the symbol is\n"
+"   defined.\n"
+"o  The 'Depends on:' line lists symbols that need to be defined for\n"
+"   this symbol to be visible and selectable in the menu.\n"
+"o  The 'Location:' lines tell, where in the menu structure this symbol\n"
+"   is located.  A location followed by a [ = y] indicates that this is\n"
+"   a selectable menu item, and the current value is displayed inside\n"
+"   brackets.\n"
+"o  The 'Selects:' line tells, what symbol will be automatically selected\n"
+"   if this symbol is selected (y or m).\n"
+"o  The 'Selected by' line tells what symbol has selected this symbol.\n"
 "\n"
 "Only relevant lines are shown.\n"
 "\n\n"
 "Search examples:\n"
-"Examples: USB  => find all symbols containing USB\n"
-"          ^USB => find all symbols starting with USB\n"
-"          USB$ => find all symbols ending with USB\n"
+"USB  => find all symbols containing USB\n"
+"^USB => find all symbols starting with USB\n"
+"USB$ => find all symbols ending with USB\n"
 "\n");
 
 struct mitem {
@@ -280,6 +271,9 @@ static int global_exit;
 /* the currently selected button */
 const char *current_instructions = menu_instructions;
 
+static char *dialog_input_result;
+static int dialog_input_result_len;
+
 static void conf(struct menu *menu);
 static void conf_choice(struct menu *menu);
 static void conf_string(struct menu *menu);
@@ -318,19 +312,19 @@ struct function_keys function_keys[] = {
 	},
 	{
 		.key_str = "F2",
-		.func = "Sym Info",
+		.func = "SymInfo",
 		.key = F_SYMBOL,
 		.handler = handle_f2,
 	},
 	{
 		.key_str = "F3",
-		.func = "Insts",
+		.func = "Help 2",
 		.key = F_INSTS,
 		.handler = handle_f3,
 	},
 	{
 		.key_str = "F4",
-		.func = "Config",
+		.func = "ShowAll",
 		.key = F_CONF,
 		.handler = handle_f4,
 	},
@@ -354,7 +348,7 @@ struct function_keys function_keys[] = {
 	},
 	{
 		.key_str = "F8",
-		.func = "Sym Search",
+		.func = "SymSearch",
 		.key = F_SEARCH,
 		.handler = handle_f8,
 	},
@@ -391,7 +385,7 @@ static void print_function_line(void)
 static void handle_f1(int *key, struct menu *current_item)
 {
 	show_scroll_win(main_window,
-			_("README"), _(nconf_readme));
+			_("Global help"), _(nconf_global_help));
 	return;
 }
 
@@ -406,7 +400,7 @@ static void handle_f2(int *key, struct menu *current_item)
 static void handle_f3(int *key, struct menu *current_item)
 {
 	show_scroll_win(main_window,
-			_("Instructions"),
+			_("Short help"),
 			_(current_instructions));
 	return;
 }
@@ -695,15 +689,19 @@ static void search_conf(void)
 {
 	struct symbol **sym_arr;
 	struct gstr res;
-	char dialog_input_result[100];
+	struct gstr title;
 	char *dialog_input;
 	int dres;
+
+	title = str_new();
+	str_printf( &title, _("Enter %s (sub)string to search for "
+			      "(with or without \"%s\")"), CONFIG_, CONFIG_);
+
 again:
 	dres = dialog_inputbox(main_window,
 			_("Search Configuration Parameter"),
-			_("Enter " CONFIG_ " (sub)string to search for "
-				"(with or without \"" CONFIG_ "\")"),
-			"", dialog_input_result, 99);
+			str_get(&title),
+			"", &dialog_input_result, &dialog_input_result_len);
 	switch (dres) {
 	case 0:
 		break;
@@ -712,6 +710,7 @@ again:
 				_("Search Configuration"), search_help);
 		goto again;
 	default:
+		str_free(&title);
 		return;
 	}
 
@@ -721,11 +720,12 @@ again:
 		dialog_input += strlen(CONFIG_);
 
 	sym_arr = sym_re_search(dialog_input);
-	res = get_relations_str(sym_arr);
+	res = get_relations_str(sym_arr, NULL);
 	free(sym_arr);
 	show_scroll_win(main_window,
 			_("Search Results"), str_get(&res));
 	str_free(&res);
+	str_free(&title);
 }
 
 
@@ -1067,7 +1067,6 @@ static void conf(struct menu *menu)
 	struct menu *submenu = 0;
 	const char *prompt = menu_get_prompt(menu);
 	struct symbol *sym;
-	struct menu *active_menu = NULL;
 	int res;
 	int current_index = 0;
 	int last_top_row = 0;
@@ -1152,13 +1151,9 @@ static void conf(struct menu *menu)
 			continue;
 
 		submenu = (struct menu *) item_data();
-		active_menu = (struct menu *)item_data();
 		if (!submenu || !menu_is_visible(submenu))
 			continue;
-		if (submenu)
-			sym = submenu->sym;
-		else
-			sym = NULL;
+		sym = submenu->sym;
 
 		switch (res) {
 		case ' ':
@@ -1222,20 +1217,13 @@ static void conf_message_callback(const char *fmt, va_list ap)
 
 static void show_help(struct menu *menu)
 {
-	struct gstr help = str_new();
-
-	if (menu && menu->sym && menu_has_help(menu)) {
-		if (menu->sym->name) {
-			str_printf(&help, "%s%s:\n\n", CONFIG_, menu->sym->name);
-			str_append(&help, _(menu_get_help(menu)));
-			str_append(&help, "\n");
-			get_symbol_str(&help, menu->sym);
-		} else {
-			str_append(&help, _(menu_get_help(menu)));
-		}
-	} else {
-		str_append(&help, nohelp_text);
-	}
+	struct gstr help;
+
+	if (!menu)
+		return;
+
+	help = str_new();
+	menu_get_ext_help(menu, &help);
 	show_scroll_win(main_window, _(menu_get_prompt(menu)), str_get(&help));
 	str_free(&help);
 }
@@ -1360,7 +1348,6 @@ static void conf_choice(struct menu *menu)
 static void conf_string(struct menu *menu)
 {
 	const char *prompt = menu_get_prompt(menu);
-	char dialog_input_result[256];
 
 	while (1) {
 		int res;
@@ -1383,8 +1370,8 @@ static void conf_string(struct menu *menu)
 				prompt ? _(prompt) : _("Main Menu"),
 				heading,
 				sym_get_string_value(menu->sym),
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (sym_set_string_value(menu->sym,
@@ -1404,14 +1391,13 @@ static void conf_string(struct menu *menu)
 
 static void conf_load(void)
 {
-	char dialog_input_result[256];
 	while (1) {
 		int res;
 		res = dialog_inputbox(main_window,
 				NULL, load_config_text,
 				filename,
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (!dialog_input_result[0])
@@ -1436,14 +1422,13 @@ static void conf_load(void)
 
 static void conf_save(void)
 {
-	char dialog_input_result[256];
 	while (1) {
 		int res;
 		res = dialog_inputbox(main_window,
 				NULL, save_config_text,
 				filename,
-				dialog_input_result,
-				sizeof(dialog_input_result));
+				&dialog_input_result,
+				&dialog_input_result_len);
 		switch (res) {
 		case 0:
 			if (!dialog_input_result[0])
@@ -1518,7 +1503,11 @@ int main(int ac, char **av)
 	}
 
 	notimeout(stdscr, FALSE);
+#if NCURSES_REENTRANT
+	set_escdelay(1);
+#else
 	ESCDELAY = 1;
+#endif
 
 	/* set btns menu */
 	curses_menu = new_menu(curses_menu_items);
diff --git a/support/kconfig/nconf.gui.c b/support/kconfig/nconf.gui.c
index f8137b3..9f8c44e 100644
--- a/support/kconfig/nconf.gui.c
+++ b/support/kconfig/nconf.gui.c
@@ -48,7 +48,7 @@ static void set_normal_colors(void)
 	init_pair(INPUT_FIELD, -1, -1);
 
 	init_pair(FUNCTION_HIGHLIGHT, -1, -1);
-	init_pair(FUNCTION_TEXT, COLOR_BLUE, -1);
+	init_pair(FUNCTION_TEXT, COLOR_YELLOW, -1);
 }
 
 /* available attributes:
@@ -356,7 +356,7 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len)
+		const char *init, char **resultp, int *result_len)
 {
 	int prompt_lines = 0;
 	int prompt_width = 0;
@@ -367,7 +367,13 @@ int dialog_inputbox(WINDOW *main_window,
 	int i, x, y;
 	int res = -1;
 	int cursor_position = strlen(init);
+	int cursor_form_win;
+	char *result = *resultp;
 
+	if (strlen(init)+1 > *result_len) {
+		*result_len = strlen(init)+1;
+		*resultp = result = realloc(result, *result_len);
+	}
 
 	/* find the widest line of msg: */
 	prompt_lines = get_line_no(prompt);
@@ -384,7 +390,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (LINES-(prompt_lines+4))/2;
 	x = (COLS-(prompt_width+4))/2;
 
-	strncpy(result, init, result_len);
+	strncpy(result, init, *result_len);
 
 	/* create the windows */
 	win = newwin(prompt_lines+6, prompt_width+7, y, x);
@@ -405,7 +411,9 @@ int dialog_inputbox(WINDOW *main_window,
 	fill_window(prompt_win, prompt);
 
 	mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
-	mvwprintw(form_win, 0, 0, "%s", result);
+	cursor_form_win = min(cursor_position, prompt_width-1);
+	mvwprintw(form_win, 0, 0, "%s",
+		  result + cursor_position-cursor_form_win);
 
 	/* create panels */
 	panel = new_panel(win);
@@ -431,6 +439,8 @@ int dialog_inputbox(WINDOW *main_window,
 						&result[cursor_position],
 						len-cursor_position+1);
 				cursor_position--;
+				cursor_form_win--;
+				len--;
 			}
 			break;
 		case KEY_DC:
@@ -438,38 +448,63 @@ int dialog_inputbox(WINDOW *main_window,
 				memmove(&result[cursor_position],
 						&result[cursor_position+1],
 						len-cursor_position+1);
+				len--;
 			}
 			break;
 		case KEY_UP:
 		case KEY_RIGHT:
-			if (cursor_position < len &&
-			    cursor_position < min(result_len, prompt_width))
+			if (cursor_position < len) {
 				cursor_position++;
+				cursor_form_win++;
+			}
 			break;
 		case KEY_DOWN:
 		case KEY_LEFT:
-			if (cursor_position > 0)
+			if (cursor_position > 0) {
 				cursor_position--;
+				cursor_form_win--;
+			}
+			break;
+		case KEY_HOME:
+			cursor_position = 0;
+			cursor_form_win = 0;
+			break;
+		case KEY_END:
+			cursor_position = len;
+			cursor_form_win = min(cursor_position, prompt_width-1);
 			break;
 		default:
-			if ((isgraph(res) || isspace(res)) &&
-					len-2 < result_len) {
+			if ((isgraph(res) || isspace(res))) {
+				/* one for new char, one for '\0' */
+				if (len+2 > *result_len) {
+					*result_len = len+2;
+					*resultp = result = realloc(result,
+								*result_len);
+				}
 				/* insert the char at the proper position */
 				memmove(&result[cursor_position+1],
 						&result[cursor_position],
-						len+1);
+						len-cursor_position+1);
 				result[cursor_position] = res;
 				cursor_position++;
+				cursor_form_win++;
+				len++;
 			} else {
-				mvprintw(0, 0, "unknow key: %d\n", res);
+				mvprintw(0, 0, "unknown key: %d\n", res);
 			}
 			break;
 		}
+		if (cursor_form_win < 0)
+			cursor_form_win = 0;
+		else if (cursor_form_win > prompt_width-1)
+			cursor_form_win = prompt_width-1;
+
 		wmove(form_win, 0, 0);
 		wclrtoeol(form_win);
 		mvwprintw(form_win, 0, 0, "%*s", prompt_width, " ");
-		mvwprintw(form_win, 0, 0, "%s", result);
-		wmove(form_win, 0, cursor_position);
+		mvwprintw(form_win, 0, 0, "%s",
+			result + cursor_position-cursor_form_win);
+		wmove(form_win, 0, cursor_form_win);
 		touchwin(win);
 		refresh_all_windows(main_window);
 
@@ -569,9 +604,11 @@ void show_scroll_win(WINDOW *main_window,
 		switch (res) {
 		case KEY_NPAGE:
 		case ' ':
+		case 'd':
 			start_y += text_lines-2;
 			break;
 		case KEY_PPAGE:
+		case 'u':
 			start_y -= text_lines+2;
 			break;
 		case KEY_HOME:
@@ -597,10 +634,10 @@ void show_scroll_win(WINDOW *main_window,
 			start_x++;
 			break;
 		}
-		if (res == 10 || res == 27 || res == 'q'
-		    || res == KEY_F(F_BACK) || res == KEY_F(F_EXIT)) {
+		if (res == 10 || res == 27 || res == 'q' ||
+			res == KEY_F(F_HELP) || res == KEY_F(F_BACK) ||
+			res == KEY_F(F_EXIT))
 			break;
-		}
 		if (start_y < 0)
 			start_y = 0;
 		if (start_y >= total_lines-text_lines)
diff --git a/support/kconfig/nconf.h b/support/kconfig/nconf.h
index 58fbda8..0d52617 100644
--- a/support/kconfig/nconf.h
+++ b/support/kconfig/nconf.h
@@ -89,7 +89,7 @@ void fill_window(WINDOW *win, const char *text);
 int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...);
 int dialog_inputbox(WINDOW *main_window,
 		const char *title, const char *prompt,
-		const char *init, char *result, int result_len);
+		const char *init, char **resultp, int *result_len);
 void refresh_all_windows(WINDOW *main_window);
 void show_scroll_win(WINDOW *main_window,
 		const char *title,
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index ef3a05e..f28131c 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -5,10 +5,10 @@
  zconf.y             |    2 +-
  4 files changed, 5 insertions(+), 5 deletions(-)
 
-Index: config/gconf.glade
+Index: b/gconf.glade
 ===================================================================
---- config.orig/gconf.glade
-+++ config/gconf.glade
+--- a/gconf.glade
++++ b/gconf.glade
 @@ -4,7 +4,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -18,10 +18,10 @@ Index: config/gconf.glade
    <property name="type">GTK_WINDOW_TOPLEVEL</property>
    <property name="window_position">GTK_WIN_POS_NONE</property>
    <property name="modal">False</property>
-Index: config/mconf.c
+Index: b/mconf.c
 ===================================================================
---- config.orig/mconf.c
-+++ config/mconf.c
+--- a/mconf.c
++++ b/mconf.c
 @@ -178,9 +178,9 @@
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus --->.  "
@@ -34,29 +34,29 @@ Index: config/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-Index: config/zconf.tab.c_shipped
+Index: b/zconf.tab.c_shipped
 ===================================================================
---- config.orig/zconf.tab.c_shipped
-+++ config/zconf.tab.c_shipped
-@@ -2256,7 +2256,7 @@
+--- a/zconf.tab.c_shipped
++++ b/zconf.tab.c_shipped
+@@ -2259,7 +2259,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
 -	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 +	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
  
- #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
-Index: config/zconf.y
+ 		zconfdebug = 1;
+Index: b/zconf.y
 ===================================================================
---- config.orig/zconf.y
-+++ config/zconf.y
-@@ -501,7 +501,7 @@
+--- a/zconf.y
++++ b/zconf.y
+@@ -496,7 +496,7 @@
  	modules_sym = sym_lookup(NULL, 0);
  	modules_sym->type = S_BOOLEAN;
  	modules_sym->flags |= SYMBOL_AUTO;
 -	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
 +	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
  
- #if YYDEBUG
  	if (getenv("ZCONF_DEBUG"))
+ 		zconfdebug = 1;
diff --git a/support/kconfig/patches/02-cpp-comments-to-c-comments.patch b/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
index cb27056..72afa84 100644
--- a/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
+++ b/support/kconfig/patches/02-cpp-comments-to-c-comments.patch
@@ -2,11 +2,11 @@
  expr.c |   42 +++++++++++++++++++++---------------------
  1 file changed, 21 insertions(+), 21 deletions(-)
 
-Index: config/expr.c
+Index: b/expr.c
 ===================================================================
---- config.orig/expr.c
-+++ config/expr.c
-@@ -331,7 +331,7 @@
+--- a/expr.c
++++ b/expr.c
+@@ -326,7 +326,7 @@
  		e->right.expr = expr_trans_bool(e->right.expr);
  		break;
  	case E_UNEQUAL:
@@ -15,7 +15,7 @@ Index: config/expr.c
  		if (e->left.sym->type == S_TRISTATE) {
  			if (e->right.sym == &symbol_no) {
  				e->type = E_SYMBOL;
-@@ -380,19 +380,19 @@
+@@ -375,19 +375,19 @@
  		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
  		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
  		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
@@ -38,7 +38,7 @@ Index: config/expr.c
  			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
  		}
  	}
-@@ -443,29 +443,29 @@
+@@ -438,29 +438,29 @@
  
  	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
  	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
@@ -73,7 +73,7 @@ Index: config/expr.c
  			sym2 = e2->right.sym;
  			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
  				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-@@ -474,19 +474,19 @@
+@@ -469,19 +469,19 @@
  		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
  			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
  			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
@@ -96,7 +96,7 @@ Index: config/expr.c
  			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
  
  		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-@@ -579,7 +579,7 @@
+@@ -574,7 +574,7 @@
  	switch (e1->type) {
  	case E_OR:
  		expr_eliminate_dups2(e1->type, &e1, &e1);
@@ -105,7 +105,7 @@ Index: config/expr.c
  		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
  		tmp2 = expr_copy(e2);
  		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-@@ -594,7 +594,7 @@
+@@ -589,7 +589,7 @@
  		break;
  	case E_AND:
  		expr_eliminate_dups2(e1->type, &e1, &e1);
@@ -114,7 +114,7 @@ Index: config/expr.c
  		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
  		tmp2 = expr_copy(e2);
  		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-@@ -703,7 +703,7 @@
+@@ -698,7 +698,7 @@
  	case E_NOT:
  		switch (e->left.expr->type) {
  		case E_NOT:
@@ -123,7 +123,7 @@ Index: config/expr.c
  			tmp = e->left.expr->left.expr;
  			free(e->left.expr);
  			free(e);
-@@ -712,14 +712,14 @@
+@@ -707,14 +707,14 @@
  			break;
  		case E_EQUAL:
  		case E_UNEQUAL:
@@ -140,7 +140,7 @@ Index: config/expr.c
  			tmp = e->left.expr;
  			e->type = E_AND;
  			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -728,7 +728,7 @@
+@@ -723,7 +723,7 @@
  			e = expr_transform(e);
  			break;
  		case E_AND:
@@ -149,7 +149,7 @@ Index: config/expr.c
  			tmp = e->left.expr;
  			e->type = E_OR;
  			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -738,7 +738,7 @@
+@@ -733,7 +733,7 @@
  			break;
  		case E_SYMBOL:
  			if (e->left.expr->left.sym == &symbol_yes) {
@@ -158,7 +158,7 @@ Index: config/expr.c
  				tmp = e->left.expr;
  				free(e);
  				e = tmp;
-@@ -747,7 +747,7 @@
+@@ -742,7 +742,7 @@
  				break;
  			}
  			if (e->left.expr->left.sym == &symbol_mod) {
@@ -167,7 +167,7 @@ Index: config/expr.c
  				tmp = e->left.expr;
  				free(e);
  				e = tmp;
-@@ -756,7 +756,7 @@
+@@ -751,7 +751,7 @@
  				break;
  			}
  			if (e->left.expr->left.sym == &symbol_no) {
diff --git a/support/kconfig/patches/03-change-config-option-prefix.patch b/support/kconfig/patches/03-change-config-option-prefix.patch
index 4c51eaa..0644ab0 100644
--- a/support/kconfig/patches/03-change-config-option-prefix.patch
+++ b/support/kconfig/patches/03-change-config-option-prefix.patch
@@ -4,18 +4,18 @@
  menu.c     |    2 +-
  3 files changed, 31 insertions(+), 30 deletions(-)
 
-Index: kconfig/confdata.c
+Index: b/confdata.c
 ===================================================================
---- kconfig.orig/confdata.c
-+++ kconfig/confdata.c
-@@ -12,6 +12,7 @@
+--- a/confdata.c
++++ b/confdata.c
+@@ -13,6 +13,7 @@
  #include <string.h>
  #include <time.h>
  #include <unistd.h>
 +#include <libgen.h>
  
- #define LKC_DIRECT_LINK
  #include "lkc.h"
+ 
 @@ -25,7 +26,7 @@
  static const char *conf_filename;
  static int conf_lineno, conf_warnings, conf_unsaved;
@@ -34,7 +34,7 @@ Index: kconfig/confdata.c
  
  	return name ? name : ".config";
  }
-@@ -249,20 +250,20 @@
+@@ -309,20 +310,20 @@
  		if (line[0] == '#') {
  			if (memcmp(line + 2, CONFIG_, strlen(CONFIG_)))
  				continue;
@@ -58,7 +58,7 @@ Index: kconfig/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_BOOLEAN;
  			}
-@@ -278,8 +279,8 @@
+@@ -338,8 +339,8 @@
  			default:
  				;
  			}
@@ -69,7 +69,7 @@ Index: kconfig/confdata.c
  			if (!p)
  				continue;
  			*p++ = 0;
-@@ -290,13 +291,13 @@
+@@ -350,13 +351,13 @@
  					*p2 = 0;
  			}
  			if (def == S_DEF_USER) {
@@ -85,114 +85,88 @@ Index: kconfig/confdata.c
  				if (sym->type == S_UNKNOWN)
  					sym->type = S_OTHER;
  			}
-@@ -423,9 +424,9 @@
- {
- 	int l;
- 	if (headerfile)
--		fprintf(out, "#define %s%s \"", CONFIG_, name);
-+		fprintf(out, "#define %s \"", name);
- 	else
--		fprintf(out, "%s%s=\"", CONFIG_, name);
-+		fprintf(out, "%s=\"", name);
+@@ -484,8 +485,8 @@
+ 			bool skip_unset = (arg != NULL);
  
- 	while (1) {
- 		l = strcspn(str, "\"\\");
-@@ -450,14 +451,14 @@
- 		switch (sym_get_tristate_value(sym)) {
- 		case no:
- 			if (write_no)
--				fprintf(out, "# %s%s is not set\n",
+ 			if (!skip_unset)
+-				fprintf(fp, "# %s%s is not set\n",
 -				    CONFIG_, sym->name);
-+				fprintf(out, "# %s is not set\n",
++				fprintf(fp, "# %s is not set\n",
 +				    sym->name);
- 			break;
- 		case mod:
--			fprintf(out, "%s%s=m\n", CONFIG_, sym->name);
-+			fprintf(out, "%s=m\n", sym->name);
- 			break;
- 		case yes:
--			fprintf(out, "%s%s=y\n", CONFIG_, sym->name);
-+			fprintf(out, "%s=y\n", sym->name);
- 			break;
+ 			return;
  		}
  		break;
-@@ -467,7 +468,7 @@
- 	case S_HEX:
- 	case S_INT:
- 		str = sym_get_string_value(sym);
--		fprintf(out, "%s%s=%s\n", CONFIG_, sym->name, str);
-+		fprintf(out, "%s=%s\n", sym->name, str);
+@@ -493,7 +494,7 @@
  		break;
- 	case S_OTHER:
- 	case S_UNKNOWN:
-@@ -830,17 +831,17 @@
- 			case no:
- 				break;
- 			case mod:
--				fprintf(tristate, "%s%s=M\n",
--				    CONFIG_, sym->name);
--				fprintf(out_h, "#define %s%s_MODULE 1\n",
--				    CONFIG_, sym->name);
-+				fprintf(tristate, "%s=M\n",
-+				    sym->name);
-+				fprintf(out_h, "#define %s_MODULE 1\n",
-+				    sym->name);
- 				break;
- 			case yes:
- 				if (sym->type == S_TRISTATE)
--					fprintf(tristate,"%s%s=Y\n",
--					    CONFIG_, sym->name);
--				fprintf(out_h, "#define %s%s 1\n",
--				    CONFIG_, sym->name);
-+					fprintf(tristate,"%s=Y\n",
-+					    sym->name);
-+				fprintf(out_h, "#define %s 1\n",
-+				    sym->name);
- 				break;
- 			}
- 			break;
-@@ -850,14 +851,14 @@
- 		case S_HEX:
- 			str = sym_get_string_value(sym);
- 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
--				fprintf(out_h, "#define %s%s 0x%s\n",
--				    CONFIG_, sym->name, str);
-+				fprintf(out_h, "#define %s 0x%s\n",
-+				    sym->name, str);
- 				break;
- 			}
- 		case S_INT:
- 			str = sym_get_string_value(sym);
--			fprintf(out_h, "#define %s%s %s\n",
--			    CONFIG_, sym->name, str);
-+			fprintf(out_h, "#define %s %s\n",
-+			    sym->name, str);
- 			break;
+ 	}
+ 
+-	fprintf(fp, "%s%s=%s\n", CONFIG_, sym->name, value);
++	fprintf(fp, "%s=%s\n", sym->name, value);
+ }
+ 
+ static void
+@@ -543,8 +544,8 @@
+ 			suffix = "_MODULE";
+ 			/* fall through */
  		default:
- 			break;
-Index: kconfig/lkc.h
+-			fprintf(fp, "#define %s%s%s 1\n",
+-			    CONFIG_, sym->name, suffix);
++			fprintf(fp, "#define %s%s 1\n",
++			    sym->name, suffix);
+ 		}
+ 		break;
+ 	}
+@@ -553,14 +554,14 @@
+ 
+ 		if (value[0] != '0' || (value[1] != 'x' && value[1] != 'X'))
+ 			prefix = "0x";
+-		fprintf(fp, "#define %s%s %s%s\n",
+-		    CONFIG_, sym->name, prefix, value);
++		fprintf(fp, "#define %s %s%s\n",
++		    sym->name, prefix, value);
+ 		break;
+ 	}
+ 	case S_STRING:
+ 	case S_INT:
+-		fprintf(fp, "#define %s%s %s\n",
+-		    CONFIG_, sym->name, value);
++		fprintf(fp, "#define %s %s\n",
++		    sym->name, value);
+ 		break;
+ 	default:
+ 		break;
+@@ -606,7 +607,7 @@
+ {
+ 
+ 	if (sym->type == S_TRISTATE && *value != 'n')
+-		fprintf(fp, "%s%s=%c\n", CONFIG_, sym->name, (char)toupper(*value));
++		fprintf(fp, "%s=%c\n", sym->name, (char)toupper(*value));
+ }
+ 
+ static struct conf_printer tristate_printer_cb =
+Index: b/lkc.h
 ===================================================================
---- kconfig.orig/lkc.h
-+++ kconfig/lkc.h
-@@ -42,7 +42,7 @@
+--- a/lkc.h
++++ b/lkc.h
+@@ -37,7 +37,7 @@
  #define N_(text) (text)
  
  #ifndef CONFIG_
 -#define CONFIG_ "CONFIG_"
 +#define CONFIG_ "BR2_"
  #endif
- 
- #define TF_COMMAND	0x0001
-Index: kconfig/menu.c
+ static inline const char *CONFIG_prefix(void)
+ {
+Index: b/menu.c
 ===================================================================
---- kconfig.orig/menu.c
-+++ kconfig/menu.c
-@@ -597,7 +597,7 @@
+--- a/menu.c
++++ b/menu.c
+@@ -635,7 +635,7 @@
  
  	if (menu_has_help(menu)) {
- 		if (sym->name) {
+ 		if (sym->name)
 -			str_printf(help, "%s%s:\n\n", CONFIG_, sym->name);
 +			str_printf(help, "%s:\n\n", sym->name);
- 			str_append(help, _(menu_get_help(menu)));
- 			str_append(help, "\n");
- 		}
+ 		help_text = menu_get_help(menu);
+ 	}
+ 	str_printf(help, "%s\n", _(help_text));
diff --git a/support/kconfig/patches/06-br-build-system-integration.patch b/support/kconfig/patches/06-br-build-system-integration.patch
index feb166d..3faa39e 100644
--- a/support/kconfig/patches/06-br-build-system-integration.patch
+++ b/support/kconfig/patches/06-br-build-system-integration.patch
@@ -2,11 +2,11 @@
  Makefile |    8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-Index: kconfig/Makefile
+Index: b/Makefile
 ===================================================================
---- kconfig.orig/Makefile
-+++ kconfig/Makefile
-@@ -175,11 +175,11 @@
+--- a/Makefile
++++ b/Makefile
+@@ -159,11 +159,11 @@
  
  hostprogs-y := conf
  
@@ -20,7 +20,7 @@ Index: kconfig/Makefile
  	hostprogs-y += mconf
  endif
  
-@@ -187,10 +187,10 @@
+@@ -171,10 +171,10 @@
  	hostprogs-y += kxgettext
  endif
  
diff --git a/support/kconfig/patches/09-implement-kconfig-probability.patch b/support/kconfig/patches/09-implement-kconfig-probability.patch
index 3b6eb89..72e2a25 100644
--- a/support/kconfig/patches/09-implement-kconfig-probability.patch
+++ b/support/kconfig/patches/09-implement-kconfig-probability.patch
@@ -2,11 +2,11 @@
  confdata.c |   22 +++++++++++++++++++---
  1 file changed, 19 insertions(+), 3 deletions(-)
 
-Index: kconfig/confdata.c
+Index: b/confdata.c
 ===================================================================
---- kconfig.orig/confdata.c
-+++ kconfig/confdata.c
-@@ -982,7 +982,16 @@
+--- a/confdata.c
++++ b/confdata.c
+@@ -1107,7 +1107,16 @@
  void conf_set_all_new_symbols(enum conf_def_mode mode)
  {
  	struct symbol *sym, *csym;
@@ -24,7 +24,7 @@ Index: kconfig/confdata.c
  
  	for_all_symbols(i, sym) {
  		if (sym_has_value(sym))
-@@ -1001,8 +1010,15 @@
+@@ -1126,8 +1135,15 @@
  				sym->def[S_DEF_USER].tri = no;
  				break;
  			case def_random:
diff --git a/support/kconfig/patches/10-br-build-system.patch b/support/kconfig/patches/10-br-build-system.patch
index c5d9a75..a877318 100644
--- a/support/kconfig/patches/10-br-build-system.patch
+++ b/support/kconfig/patches/10-br-build-system.patch
@@ -3,10 +3,10 @@
  foo.h       |   12 ++++++++++++
  2 files changed, 65 insertions(+)
 
-Index: kconfig/Makefile.br
+Index: b/Makefile.br
 ===================================================================
 --- /dev/null
-+++ kconfig/Makefile.br
++++ b/Makefile.br
 @@ -0,0 +1,53 @@
 +src := .
 +top_srcdir=../../
@@ -61,10 +61,10 @@ Index: kconfig/Makefile.br
 +
 +FORCE:
 +.PHONY: FORCE clean distclean
-Index: kconfig/foo.h
+Index: b/foo.h
 ===================================================================
 --- /dev/null
-+++ kconfig/foo.h
++++ b/foo.h
 @@ -0,0 +1,12 @@
 +#ifndef __KCONFIG_FOO_H
 +#define __KCONFIG_FOO_H
diff --git a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
index 21ca228..1e0c803 100644
--- a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
+++ b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
@@ -2,11 +2,11 @@
  lxdialog/check-lxdialog.sh |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: config/lxdialog/check-lxdialog.sh
+Index: b/lxdialog/check-lxdialog.sh
 ===================================================================
---- config.orig/lxdialog/check-lxdialog.sh
-+++ config/lxdialog/check-lxdialog.sh
-@@ -33,7 +33,7 @@
+--- a/lxdialog/check-lxdialog.sh
++++ b/lxdialog/check-lxdialog.sh
+@@ -34,7 +34,7 @@
  }
  
  # Temp file, try to clean up after us
diff --git a/support/kconfig/patches/12-fix-glade-file-path.patch b/support/kconfig/patches/12-fix-glade-file-path.patch
index badfc91..a5777da 100644
--- a/support/kconfig/patches/12-fix-glade-file-path.patch
+++ b/support/kconfig/patches/12-fix-glade-file-path.patch
@@ -2,11 +2,11 @@
  gconf.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: kconfig/gconf.c
+Index: b/gconf.c
 ===================================================================
---- kconfig.orig/gconf.c
-+++ kconfig/gconf.c
-@@ -1525,7 +1525,7 @@
+--- a/gconf.c
++++ b/gconf.c
+@@ -1486,7 +1486,7 @@
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index 8d76df2..318d0dd 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -4,11 +4,11 @@
  util.c     |   16 +++++++++++++--
  3 files changed, 61 insertions(+), 18 deletions(-)
 
-Index: kconfig/conf.c
+Index: b/conf.c
 ===================================================================
---- kconfig.orig/conf.c
-+++ kconfig/conf.c
-@@ -503,7 +503,6 @@
+--- a/conf.c
++++ b/conf.c
+@@ -547,7 +547,6 @@
  	}
  	name = av[optind];
  	conf_parse(name);
@@ -16,10 +16,10 @@ Index: kconfig/conf.c
  	if (sync_kconfig) {
  		name = conf_get_configname();
  		if (stat(name, &tmpstat)) {
-Index: kconfig/confdata.c
+Index: b/confdata.c
 ===================================================================
---- kconfig.orig/confdata.c
-+++ kconfig/confdata.c
+--- a/confdata.c
++++ b/confdata.c
 @@ -71,9 +71,7 @@
  
  const char *conf_get_autoconfig_name(void)
@@ -31,7 +31,7 @@ Index: kconfig/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -563,6 +561,9 @@
+@@ -738,6 +736,9 @@
  	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
@@ -41,7 +41,7 @@ Index: kconfig/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -661,6 +662,7 @@
+@@ -832,6 +833,7 @@
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -49,7 +49,7 @@ Index: kconfig/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -669,8 +671,20 @@
+@@ -840,8 +842,20 @@
  	name = conf_get_autoconfig_name();
  	conf_read_simple(name, S_DEF_AUTO);
  
@@ -72,7 +72,7 @@ Index: kconfig/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -763,9 +777,11 @@
+@@ -934,9 +948,11 @@
  		close(fd);
  	}
  out:
@@ -87,7 +87,7 @@ Index: kconfig/confdata.c
  	return res;
  }
  
-@@ -776,25 +792,38 @@
+@@ -946,25 +962,38 @@
  	const char *name;
  	FILE *out, *tristate, *out_h;
  	int i;
@@ -130,7 +130,7 @@ Index: kconfig/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -871,19 +900,22 @@
+@@ -996,19 +1025,22 @@
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
@@ -156,11 +156,11 @@ Index: kconfig/confdata.c
  		return 1;
  
  	return 0;
-Index: kconfig/util.c
+Index: b/util.c
 ===================================================================
---- kconfig.orig/util.c
-+++ kconfig/util.c
-@@ -32,6 +32,8 @@
+--- a/util.c
++++ b/util.c
+@@ -34,6 +34,8 @@
  /* write a dependency file as used by kbuild to track dependencies */
  int file_write_dep(const char *name)
  {
@@ -169,7 +169,7 @@ Index: kconfig/util.c
  	struct symbol *sym, *env_sym;
  	struct expr *e;
  	struct file *file;
-@@ -39,7 +41,16 @@
+@@ -41,7 +43,16 @@
  
  	if (!name)
  		name = ".kconfig.d";
@@ -187,7 +187,7 @@ Index: kconfig/util.c
  	if (!out)
  		return 1;
  	fprintf(out, "deps_config := \\\n");
-@@ -70,7 +81,8 @@
+@@ -72,7 +83,8 @@
  
  	fprintf(out, "\n$(deps_config): ;\n");
  	fclose(out);
diff --git a/support/kconfig/patches/15-fix-qconf-moc-rule.patch b/support/kconfig/patches/15-fix-qconf-moc-rule.patch
new file mode 100644
index 0000000..eae978e
--- /dev/null
+++ b/support/kconfig/patches/15-fix-qconf-moc-rule.patch
@@ -0,0 +1,24 @@
+Fix the rule that generates the .moc file
+
+The Linux kernel has a "cmd" make function, but we don't have it in
+Buildroot, so we need to adjust this rule.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile
+===================================================================
+--- a/Makefile
++++ b/Makefile
+@@ -307,11 +307,8 @@
+ 
+ $(obj)/qconf.o: $(obj)/qconf.moc
+ 
+-quiet_cmd_moc = MOC     $@
+-      cmd_moc = $(KC_QT_MOC) -i $< -o $@
+-
+ $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
+-	$(call cmd,moc)
++	$(KC_QT_MOC) -i $< -o $@
+ 
+ # Extract gconf menu items for I18N support
+ $(obj)/gconf.glade.h: $(obj)/gconf.glade
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 573911b..2d0e991 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -7,3 +7,4 @@
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
 14-support-out-of-tree-config.patch
+15-fix-qconf-moc-rule.patch
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index c2796b8..1500c38 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -6,6 +6,7 @@
 #include <qglobal.h>
 
 #if QT_VERSION < 0x040000
+#include <stddef.h>
 #include <qmainwindow.h>
 #include <qvbox.h>
 #include <qvaluelist.h>
@@ -1478,10 +1479,13 @@ void ConfigMainWindow::loadConfig(void)
 	ConfigView::updateListAll();
 }
 
-void ConfigMainWindow::saveConfig(void)
+bool ConfigMainWindow::saveConfig(void)
 {
-	if (conf_write(NULL))
+	if (conf_write(NULL)) {
 		QMessageBox::information(this, "qconf", _("Unable to save configuration!"));
+		return false;
+	}
+	return true;
 }
 
 void ConfigMainWindow::saveConfigAs(void)
@@ -1642,7 +1646,11 @@ void ConfigMainWindow::closeEvent(QCloseEvent* e)
 	mb.setButtonText(QMessageBox::Cancel, _("Cancel Exit"));
 	switch (mb.exec()) {
 	case QMessageBox::Yes:
-		saveConfig();
+		if (saveConfig())
+			e->accept();
+		else
+			e->ignore();
+		break;
 	case QMessageBox::No:
 		e->accept();
 		break;
@@ -1745,10 +1753,6 @@ int main(int ac, char** av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
-#ifndef LKC_DIRECT_LINK
-	kconfig_load();
-#endif
-
 	progname = av[0];
 	configApp = new QApplication(ac, av);
 	if (ac > 1 && av[1][0] == '-') {
diff --git a/support/kconfig/qconf.h b/support/kconfig/qconf.h
index 91677d9..3715b3e 100644
--- a/support/kconfig/qconf.h
+++ b/support/kconfig/qconf.h
@@ -311,7 +311,7 @@ public slots:
 	void listFocusChanged(void);
 	void goBack(void);
 	void loadConfig(void);
-	void saveConfig(void);
+	bool saveConfig(void);
 	void saveConfigAs(void);
 	void searchConfig(void);
 	void showSingleView(void);
diff --git a/support/kconfig/streamline_config.pl b/support/kconfig/streamline_config.pl
index a4fe923..3368939 100644
--- a/support/kconfig/streamline_config.pl
+++ b/support/kconfig/streamline_config.pl
@@ -43,6 +43,17 @@
 #    make oldconfig
 #
 use strict;
+use Getopt::Long;
+
+# set the environment variable LOCALMODCONFIG_DEBUG to get
+# debug output.
+my $debugprint = 0;
+$debugprint = 1 if (defined($ENV{LOCALMODCONFIG_DEBUG}));
+
+sub dprint {
+    return if (!$debugprint);
+    print STDERR @_;
+}
 
 my $config = ".config";
 
@@ -89,7 +100,7 @@ my @searchconfigs = (
 	},
 );
 
-sub find_config {
+sub read_config {
     foreach my $conf (@searchconfigs) {
 	my $file = $conf->{"file"};
 
@@ -104,18 +115,27 @@ sub find_config {
 
 	print STDERR "using config: '$file'\n";
 
-	open(CIN, "$exec $file |") || die "Failed to run $exec $file";
-	return;
+	open(my $infile, '-|', "$exec $file") || die "Failed to run $exec $file";
+	my @x = <$infile>;
+	close $infile;
+	return @x;
     }
     die "No config file found";
 }
 
-find_config;
+my @config_file = read_config;
+
+# Parse options
+my $localmodconfig = 0;
+my $localyesconfig = 0;
+
+GetOptions("localmodconfig" => \$localmodconfig,
+	   "localyesconfig" => \$localyesconfig);
 
 # Get the build source and top level Kconfig file (passed in)
-my $ksource = $ARGV[0];
+my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
 my $kconfig = $ARGV[1];
-my $lsmod_file = $ARGV[2];
+my $lsmod_file = $ENV{'LSMOD'};
 
 my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
 chomp @makefiles;
@@ -151,8 +171,8 @@ sub read_kconfig {
 	$source =~ s/\$$env/$ENV{$env}/;
     }
 
-    open(KIN, "$source") || die "Can't open $kconfig";
-    while (<KIN>) {
+    open(my $kinfile, '<', $source) || die "Can't open $kconfig";
+    while (<$kinfile>) {
 	chomp;
 
 	# Make sure that lines ending with \ continue
@@ -178,6 +198,7 @@ sub read_kconfig {
 	    $state = "NEW";
 	    $config = $2;
 
+	    # Add depends for 'if' nesting
 	    for (my $i = 0; $i < $iflevel; $i++) {
 		if ($i) {
 		    $depends{$config} .= " " . $ifdeps[$i];
@@ -196,10 +217,11 @@ sub read_kconfig {
 
 	# Get the configs that select this config
 	} elsif ($state ne "NONE" && /^\s*select\s+(\S+)/) {
-	    if (defined($selects{$1})) {
-		$selects{$1} .= " " . $config;
+	    my $conf = $1;
+	    if (defined($selects{$conf})) {
+		$selects{$conf} .= " " . $config;
 	    } else {
-		$selects{$1} = $config;
+		$selects{$conf} = $config;
 	    }
 
 	# configs without prompts must be selected
@@ -227,10 +249,10 @@ sub read_kconfig {
 	    $state = "NONE";
 	}
     }
-    close(KIN);
+    close($kinfile);
 
     # read in any configs that were found.
-    foreach $kconfig (@kconfigs) {
+    foreach my $kconfig (@kconfigs) {
 	if (!defined($read_kconfigs{$kconfig})) {
 	    $read_kconfigs{$kconfig} = 1;
 	    read_kconfig($kconfig);
@@ -242,33 +264,63 @@ if ($kconfig) {
     read_kconfig($kconfig);
 }
 
+# Makefiles can use variables to define their dependencies
+sub convert_vars {
+    my ($line, %vars) = @_;
+
+    my $process = "";
+
+    while ($line =~ s/^(.*?)(\$\((.*?)\))//) {
+	my $start = $1;
+	my $variable = $2;
+	my $var = $3;
+
+	if (defined($vars{$var})) {
+	    $process .= $start . $vars{$var};
+	} else {
+	    $process .= $start . $variable;
+	}
+    }
+
+    $process .= $line;
+
+    return $process;
+}
+
 # Read all Makefiles to map the configs to the objects
 foreach my $makefile (@makefiles) {
 
-    my $cont = 0;
+    my $line = "";
+    my %make_vars;
+
+    open(my $infile, '<', $makefile) || die "Can't open $makefile";
+    while (<$infile>) {
+	# if this line ends with a backslash, continue
+	chomp;
+	if (/^(.*)\\$/) {
+	    $line .= $1;
+	    next;
+	}
+
+	$line .= $_;
+	$_ = $line;
+	$line = "";
 
-    open(MIN,$makefile) || die "Can't open $makefile";
-    while (<MIN>) {
 	my $objs;
 
-	# is this a line after a line with a backslash?
-	if ($cont && /(\S.*)$/) {
-	    $objs = $1;
-	}
-	$cont = 0;
+	# Convert variables in a line (could define configs)
+	$_ = convert_vars($_, %make_vars);
 
 	# collect objects after obj-$(CONFIG_FOO_BAR)
 	if (/obj-\$\((CONFIG_[^\)]*)\)\s*[+:]?=\s*(.*)/) {
 	    $var = $1;
 	    $objs = $2;
+
+	# check if variables are set
+	} elsif (/^\s*(\S+)\s*[:]?=\s*(.*\S)/) {
+	    $make_vars{$1} = $2;
 	}
 	if (defined($objs)) {
-	    # test if the line ends with a backslash
-	    if ($objs =~ m,(.*)\\$,) {
-		$objs = $1;
-		$cont = 1;
-	    }
-
 	    foreach my $obj (split /\s+/,$objs) {
 		$obj =~ s/-/_/g;
 		if ($obj =~ /(.*)\.o$/) {
@@ -289,22 +341,24 @@ foreach my $makefile (@makefiles) {
 	    }
 	}
     }
-    close(MIN);
+    close($infile);
 }
 
 my %modules;
+my $linfile;
 
 if (defined($lsmod_file)) {
     if ( ! -f $lsmod_file) {
-	die "$lsmod_file not found";
-    }
-    if ( -x $lsmod_file) {
-	# the file is executable, run it
-	open(LIN, "$lsmod_file|");
-    } else {
-	# Just read the contents
-	open(LIN, "$lsmod_file");
+	if ( -f $ENV{'objtree'}."/".$lsmod_file) {
+	    $lsmod_file = $ENV{'objtree'}."/".$lsmod_file;
+	} else {
+		die "$lsmod_file not found";
+	}
     }
+
+    my $otype = ( -x $lsmod_file) ? '-|' : '<';
+    open($linfile, $otype, $lsmod_file);
+
 } else {
 
     # see what modules are loaded on this system
@@ -321,25 +375,27 @@ if (defined($lsmod_file)) {
 	$lsmod = "lsmod";
     }
 
-    open(LIN,"$lsmod|") || die "Can not call lsmod with $lsmod";
+    open($linfile, '-|', $lsmod) || die "Can not call lsmod with $lsmod";
 }
 
-while (<LIN>) {
+while (<$linfile>) {
 	next if (/^Module/);  # Skip the first line.
 	if (/^(\S+)/) {
 		$modules{$1} = 1;
 	}
 }
-close (LIN);
+close ($linfile);
 
 # add to the configs hash all configs that are needed to enable
-# a loaded module.
+# a loaded module. This is a direct obj-${CONFIG_FOO} += bar.o
+# where we know we need bar.o so we add FOO to the list.
 my %configs;
 foreach my $module (keys(%modules)) {
     if (defined($objects{$module})) {
 	my @arr = @{$objects{$module}};
 	foreach my $conf (@arr) {
 	    $configs{$conf} = $module;
+	    dprint "$conf added by direct ($module)\n";
 	}
     } else {
 	# Most likely, someone has a custom (binary?) module loaded.
@@ -347,9 +403,24 @@ foreach my $module (keys(%modules)) {
     }
 }
 
+# Read the current config, and see what is enabled. We want to
+# ignore configs that we would not enable anyway.
+
+my %orig_configs;
 my $valid = "A-Za-z_0-9";
+
+foreach my $line (@config_file) {
+    $_ = $line;
+
+    if (/(CONFIG_[$valid]*)=(m|y)/) {
+	$orig_configs{$1} = $2;
+    }
+}
+
 my $repeat = 1;
 
+my $depconfig;
+
 #
 # Note, we do not care about operands (like: &&, ||, !) we want to add any
 # config that is in the depend list of another config. This script does
@@ -358,7 +429,7 @@ my $repeat = 1;
 # to keep on. If A was on in the original config, B would not have been
 # and B would not be turned on by this script.
 #
-sub parse_config_dep_select
+sub parse_config_depends
 {
     my ($p) = @_;
 
@@ -369,10 +440,16 @@ sub parse_config_dep_select
 
 	    $p =~ s/^[^$valid]*[$valid]+//;
 
+	    # We only need to process if the depend config is a module
+	    if (!defined($orig_configs{$conf}) || !$orig_configs{conf} eq "m") {
+		next;
+	    }
+
 	    if (!defined($configs{$conf})) {
 		# We must make sure that this config has its
 		# dependencies met.
 		$repeat = 1; # do again
+		dprint "$conf selected by depend $depconfig\n";
 		$configs{$conf} = 1;
 	    }
 	} else {
@@ -381,31 +458,132 @@ sub parse_config_dep_select
     }
 }
 
-while ($repeat) {
-    $repeat = 0;
+# Select is treated a bit differently than depends. We call this
+# when a config has no prompt and requires another config to be
+# selected. We use to just select all configs that selected this
+# config, but found that that can balloon into enabling hundreds
+# of configs that we do not care about.
+#
+# The idea is we look at all the configs that select it. If one
+# is already in our list of configs to enable, then there's nothing
+# else to do. If there isn't, we pick the first config that was
+# enabled in the orignal config and use that.
+sub parse_config_selects
+{
+    my ($config, $p) = @_;
 
-    foreach my $config (keys %configs) {
-	$config =~ s/^CONFIG_//;
+    my $next_config;
+
+    while ($p =~ /[$valid]/) {
+
+	if ($p =~ /^[^$valid]*([$valid]+)/) {
+	    my $conf = "CONFIG_" . $1;
 
-	if (defined($depends{$config})) {
-	    # This config has dependencies. Make sure they are also included
-	    parse_config_dep_select $depends{$config};
+	    $p =~ s/^[^$valid]*[$valid]+//;
+
+	    # Make sure that this config exists in the current .config file
+	    if (!defined($orig_configs{$conf})) {
+		dprint "$conf not set for $config select\n";
+		next;
+	    }
+
+	    # Check if something other than a module selects this config
+	    if (defined($orig_configs{$conf}) && $orig_configs{$conf} ne "m") {
+		dprint "$conf (non module) selects config, we are good\n";
+		# we are good with this
+		return;
+	    }
+	    if (defined($configs{$conf})) {
+		dprint "$conf selects $config so we are good\n";
+		# A set config selects this config, we are good
+		return;
+	    }
+	    # Set this config to be selected
+	    if (!defined($next_config)) {
+		$next_config = $conf;
+	    }
+	} else {
+	    die "this should never happen";
 	}
+    }
 
-	if (defined($prompts{$config}) || !defined($selects{$config})) {
-	    next;
+    # If no possible config selected this, then something happened.
+    if (!defined($next_config)) {
+	print STDERR "WARNING: $config is required, but nothing in the\n";
+	print STDERR "  current config selects it.\n";
+	return;
+    }
+
+    # If we are here, then we found no config that is set and
+    # selects this config. Repeat.
+    $repeat = 1;
+    # Make this config need to be selected
+    $configs{$next_config} = 1;
+    dprint "$next_config selected by select $config\n";
+}
+
+my %process_selects;
+
+# loop through all configs, select their dependencies.
+sub loop_depend {
+    $repeat = 1;
+
+    while ($repeat) {
+	$repeat = 0;
+
+      forloop:
+	foreach my $config (keys %configs) {
+
+	    # If this config is not a module, we do not need to process it
+	    if (defined($orig_configs{$config}) && $orig_configs{$config} ne "m") {
+		next forloop;
+	    }
+
+	    $config =~ s/^CONFIG_//;
+	    $depconfig = $config;
+
+	    if (defined($depends{$config})) {
+		# This config has dependencies. Make sure they are also included
+		parse_config_depends $depends{$config};
+	    }
+
+	    # If the config has no prompt, then we need to check if a config
+	    # that is enabled selected it. Or if we need to enable one.
+	    if (!defined($prompts{$config}) && defined($selects{$config})) {
+		$process_selects{$config} = 1;
+	    }
 	}
+    }
+}
+
+sub loop_select {
+
+    foreach my $config (keys %process_selects) {
+	$config =~ s/^CONFIG_//;
+
+	dprint "Process select $config\n";
 
 	# config has no prompt and must be selected.
-	parse_config_dep_select $selects{$config};
+	parse_config_selects $config, $selects{$config};
     }
 }
 
+while ($repeat) {
+    # Get the first set of configs and their dependencies.
+    loop_depend;
+
+    $repeat = 0;
+
+    # Now we need to see if we have to check selects;
+    loop_select;
+}	    
+
 my %setconfigs;
 
 # Finally, read the .config file and turn off any module enabled that
 # we could not find a reason to keep enabled.
-while(<CIN>) {
+foreach my $line (@config_file) {
+    $_ = $line;
 
     if (/CONFIG_IKCONFIG/) {
 	if (/# CONFIG_IKCONFIG is not set/) {
@@ -421,7 +599,13 @@ while(<CIN>) {
 
     if (/^(CONFIG.*)=(m|y)/) {
 	if (defined($configs{$1})) {
-	    $setconfigs{$1} = $2;
+	    if ($localyesconfig) {
+	        $setconfigs{$1} = 'y';
+		print "$1=y\n";
+		next;
+	    } else {
+	        $setconfigs{$1} = $2;
+	    }
 	} elsif ($2 eq "m") {
 	    print "# $1 is not set\n";
 	    next;
@@ -429,7 +613,6 @@ while(<CIN>) {
     }
     print;
 }
-close(CIN);
 
 # Integrity check, make sure all modules that we want enabled do
 # indeed have their configs set.
diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
index a796c95..ecc5aa5 100644
--- a/support/kconfig/symbol.c
+++ b/support/kconfig/symbol.c
@@ -9,7 +9,6 @@
 #include <regex.h>
 #include <sys/utsname.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 struct symbol symbol_yes = {
@@ -263,11 +262,18 @@ static struct symbol *sym_calc_choice(struct symbol *sym)
 	struct symbol *def_sym;
 	struct property *prop;
 	struct expr *e;
+	int flags;
 
 	/* first calculate all choice values' visibilities */
+	flags = sym->flags;
 	prop = sym_get_choice_prop(sym);
-	expr_list_for_each_sym(prop->expr, e, def_sym)
+	expr_list_for_each_sym(prop->expr, e, def_sym) {
 		sym_calc_visibility(def_sym);
+		if (def_sym->visible != no)
+			flags &= def_sym->flags;
+	}
+
+	sym->flags &= flags | ~SYMBOL_DEF_USER;
 
 	/* is the user choice visible? */
 	def_sym = sym->def[S_DEF_USER].val;
@@ -650,11 +656,11 @@ bool sym_set_string_value(struct symbol *sym, const char *newval)
 	size = strlen(newval) + 1;
 	if (sym->type == S_HEX && (newval[0] != '0' || (newval[1] != 'x' && newval[1] != 'X'))) {
 		size += 2;
-		sym->def[S_DEF_USER].val = val = malloc(size);
+		sym->def[S_DEF_USER].val = val = xmalloc(size);
 		*val++ = '0';
 		*val++ = 'x';
 	} else if (!oldval || strcmp(oldval, newval))
-		sym->def[S_DEF_USER].val = val = malloc(size);
+		sym->def[S_DEF_USER].val = val = xmalloc(size);
 	else
 		return true;
 
@@ -751,7 +757,8 @@ const char *sym_get_string_value(struct symbol *sym)
 		case no:
 			return "n";
 		case mod:
-			return "m";
+			sym_calc_value(modules_sym);
+			return (modules_sym->curr.tri == no) ? "n" : "m";
 		case yes:
 			return "y";
 		}
@@ -805,7 +812,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 		hash = 0;
 	}
 
-	symbol = malloc(sizeof(*symbol));
+	symbol = xmalloc(sizeof(*symbol));
 	memset(symbol, 0, sizeof(*symbol));
 	symbol->name = new_name;
 	symbol->type = S_UNKNOWN;
@@ -856,7 +863,7 @@ const char *sym_expand_string_value(const char *in)
 	size_t reslen;
 
 	reslen = strlen(in) + 1;
-	res = malloc(reslen);
+	res = xmalloc(reslen);
 	res[0] = '\0';
 
 	while ((src = strchr(in, '$'))) {
@@ -893,6 +900,49 @@ const char *sym_expand_string_value(const char *in)
 	return res;
 }
 
+const char *sym_escape_string_value(const char *in)
+{
+	const char *p;
+	size_t reslen;
+	char *res;
+	size_t l;
+
+	reslen = strlen(in) + strlen("\"\"") + 1;
+
+	p = in;
+	for (;;) {
+		l = strcspn(p, "\"\\");
+		p += l;
+
+		if (p[0] == '\0')
+			break;
+
+		reslen++;
+		p++;
+	}
+
+	res = xmalloc(reslen);
+	res[0] = '\0';
+
+	strcat(res, "\"");
+
+	p = in;
+	for (;;) {
+		l = strcspn(p, "\"\\");
+		strncat(res, p, l);
+		p += l;
+
+		if (p[0] == '\0')
+			break;
+
+		strcat(res, "\\");
+		strncat(res, p++, 1);
+	}
+
+	strcat(res, "\"");
+	return res;
+}
+
 struct symbol **sym_re_search(const char *pattern)
 {
 	struct symbol *sym, **sym_arr = NULL;
@@ -1178,7 +1228,7 @@ struct property *prop_alloc(enum prop_type type, struct symbol *sym)
 	struct property *prop;
 	struct property **propp;
 
-	prop = malloc(sizeof(*prop));
+	prop = xmalloc(sizeof(*prop));
 	memset(prop, 0, sizeof(*prop));
 	prop->type = type;
 	prop->sym = sym;
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 6edd8a3..60eb566 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -5,6 +5,8 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
+#include <stdarg.h>
+#include <stdlib.h>
 #include <string.h>
 #include "lkc.h"
 
@@ -21,7 +23,7 @@ struct file *file_lookup(const char *name)
 		}
 	}
 
-	file = malloc(sizeof(*file));
+	file = xmalloc(sizeof(*file));
 	memset(file, 0, sizeof(*file));
 	file->name = file_name;
 	file->next = file_list;
@@ -91,7 +93,7 @@ int file_write_dep(const char *name)
 struct gstr str_new(void)
 {
 	struct gstr gs;
-	gs.s = malloc(sizeof(char) * 64);
+	gs.s = xmalloc(sizeof(char) * 64);
 	gs.len = 64;
 	gs.max_width = 0;
 	strcpy(gs.s, "\0");
@@ -148,3 +150,22 @@ const char *str_get(struct gstr *gs)
 	return gs->s;
 }
 
+void *xmalloc(size_t size)
+{
+	void *p = malloc(size);
+	if (p)
+		return p;
+	fprintf(stderr, "Out of memory.\n");
+	exit(1);
+}
+
+void *xcalloc(size_t nmemb, size_t size)
+{
+	void *p = calloc(nmemb, size);
+	if (p)
+		return p;
+	fprintf(stderr, "Out of memory.\n");
+	exit(1);
+}
+
+
diff --git a/support/kconfig/zconf.gperf b/support/kconfig/zconf.gperf
index c9e690e..f14ab41 100644
--- a/support/kconfig/zconf.gperf
+++ b/support/kconfig/zconf.gperf
@@ -9,7 +9,7 @@
 
 struct kconf_id;
 
-static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
+static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
 
 %%
 mainmenu,	T_MAINMENU,	TF_COMMAND
diff --git a/support/kconfig/zconf.hash.c_shipped b/support/kconfig/zconf.hash.c_shipped
index 4055d5d..40df000 100644
--- a/support/kconfig/zconf.hash.c_shipped
+++ b/support/kconfig/zconf.hash.c_shipped
@@ -1,6 +1,5 @@
-/* ANSI-C code produced by gperf version 3.0.3 */
-/* Command-line: gperf  */
-/* Computed positions: -k'1,3' */
+/* ANSI-C code produced by gperf version 3.0.4 */
+/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
 
 #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
@@ -29,10 +28,11 @@
 #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
 #endif
 
+#line 10 "scripts/kconfig/zconf.gperf"
 struct kconf_id;
 
-static struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 50, duplicates = 0 */
+static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
+/* maximum key range = 71, duplicates = 0 */
 
 #ifdef __GNUC__
 __inline
@@ -44,34 +44,34 @@ inline
 static unsigned int
 kconf_id_hash (register const char *str, register unsigned int len)
 {
-  static unsigned char asso_values[] =
+  static const unsigned char asso_values[] =
     {
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 40,  5,
-       0,  0,  5, 52,  0, 20, 52, 52, 10, 20,
-       5,  0, 35, 52,  0, 30,  0, 15,  0, 52,
-      15, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
-      52, 52, 52, 52, 52, 52
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 25, 25,
+       0,  0,  0,  5,  0,  0, 73, 73,  5,  0,
+      10,  5, 45, 73, 20, 20,  0, 15, 15, 73,
+      20, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
+      73, 73, 73, 73, 73, 73
     };
   register int hval = len;
 
@@ -85,87 +85,87 @@ kconf_id_hash (register const char *str, register unsigned int len)
         hval += asso_values[(unsigned char)str[0]];
         break;
     }
-  return hval;
+  return hval + asso_values[(unsigned char)str[len - 1]];
 }
 
 struct kconf_id_strings_t
   {
-    char kconf_id_strings_str2[sizeof("on")];
-    char kconf_id_strings_str3[sizeof("env")];
+    char kconf_id_strings_str2[sizeof("if")];
+    char kconf_id_strings_str3[sizeof("int")];
     char kconf_id_strings_str5[sizeof("endif")];
-    char kconf_id_strings_str6[sizeof("option")];
-    char kconf_id_strings_str7[sizeof("endmenu")];
-    char kconf_id_strings_str8[sizeof("optional")];
+    char kconf_id_strings_str7[sizeof("default")];
+    char kconf_id_strings_str8[sizeof("tristate")];
     char kconf_id_strings_str9[sizeof("endchoice")];
-    char kconf_id_strings_str10[sizeof("range")];
-    char kconf_id_strings_str11[sizeof("choice")];
-    char kconf_id_strings_str12[sizeof("default")];
+    char kconf_id_strings_str12[sizeof("def_tristate")];
     char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str14[sizeof("help")];
-    char kconf_id_strings_str16[sizeof("config")];
-    char kconf_id_strings_str17[sizeof("def_tristate")];
-    char kconf_id_strings_str18[sizeof("hex")];
-    char kconf_id_strings_str19[sizeof("defconfig_list")];
-    char kconf_id_strings_str22[sizeof("if")];
-    char kconf_id_strings_str23[sizeof("int")];
+    char kconf_id_strings_str14[sizeof("defconfig_list")];
+    char kconf_id_strings_str17[sizeof("on")];
+    char kconf_id_strings_str18[sizeof("optional")];
+    char kconf_id_strings_str21[sizeof("option")];
+    char kconf_id_strings_str22[sizeof("endmenu")];
+    char kconf_id_strings_str23[sizeof("mainmenu")];
+    char kconf_id_strings_str25[sizeof("menuconfig")];
     char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str28[sizeof("tristate")];
     char kconf_id_strings_str29[sizeof("menu")];
+    char kconf_id_strings_str31[sizeof("select")];
     char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str35[sizeof("menuconfig")];
-    char kconf_id_strings_str36[sizeof("string")];
-    char kconf_id_strings_str37[sizeof("visible")];
-    char kconf_id_strings_str41[sizeof("prompt")];
-    char kconf_id_strings_str42[sizeof("depends")];
-    char kconf_id_strings_str44[sizeof("bool")];
-    char kconf_id_strings_str46[sizeof("select")];
+    char kconf_id_strings_str33[sizeof("env")];
+    char kconf_id_strings_str35[sizeof("range")];
+    char kconf_id_strings_str36[sizeof("choice")];
+    char kconf_id_strings_str39[sizeof("bool")];
+    char kconf_id_strings_str41[sizeof("source")];
+    char kconf_id_strings_str42[sizeof("visible")];
+    char kconf_id_strings_str43[sizeof("hex")];
+    char kconf_id_strings_str46[sizeof("config")];
     char kconf_id_strings_str47[sizeof("boolean")];
-    char kconf_id_strings_str48[sizeof("mainmenu")];
-    char kconf_id_strings_str51[sizeof("source")];
+    char kconf_id_strings_str51[sizeof("string")];
+    char kconf_id_strings_str54[sizeof("help")];
+    char kconf_id_strings_str56[sizeof("prompt")];
+    char kconf_id_strings_str72[sizeof("depends")];
   };
-static struct kconf_id_strings_t kconf_id_strings_contents =
+static const struct kconf_id_strings_t kconf_id_strings_contents =
   {
-    "on",
-    "env",
+    "if",
+    "int",
     "endif",
-    "option",
-    "endmenu",
-    "optional",
-    "endchoice",
-    "range",
-    "choice",
     "default",
-    "def_bool",
-    "help",
-    "config",
+    "tristate",
+    "endchoice",
     "def_tristate",
-    "hex",
+    "def_bool",
     "defconfig_list",
-    "if",
-    "int",
+    "on",
+    "optional",
+    "option",
+    "endmenu",
+    "mainmenu",
+    "menuconfig",
     "modules",
-    "tristate",
     "menu",
+    "select",
     "comment",
-    "menuconfig",
-    "string",
-    "visible",
-    "prompt",
-    "depends",
+    "env",
+    "range",
+    "choice",
     "bool",
-    "select",
+    "source",
+    "visible",
+    "hex",
+    "config",
     "boolean",
-    "mainmenu",
-    "source"
+    "string",
+    "help",
+    "prompt",
+    "depends"
   };
 #define kconf_id_strings ((const char *) &kconf_id_strings_contents)
 #ifdef __GNUC__
 __inline
-#ifdef __GNUC_STDC_INLINE__
+#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
 __attribute__ ((__gnu_inline__))
 #endif
 #endif
-struct kconf_id *
+const struct kconf_id *
 kconf_id_lookup (register const char *str, register unsigned int len)
 {
   enum
@@ -174,54 +174,94 @@ kconf_id_lookup (register const char *str, register unsigned int len)
       MIN_WORD_LENGTH = 2,
       MAX_WORD_LENGTH = 14,
       MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 51
+      MAX_HASH_VALUE = 72
     };
 
-  static struct kconf_id wordlist[] =
+  static const struct kconf_id wordlist[] =
     {
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_ON,		TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_OPT_ENV,	TF_OPTION},
+#line 25 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
+#line 36 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
       {-1},
+#line 26 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str6,		T_OPTION,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_ENDMENU,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_OPTIONAL,	TF_COMMAND},
+      {-1},
+#line 29 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+#line 31 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+#line 20 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str10,		T_RANGE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str11,		T_CHOICE,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
+      {-1}, {-1},
+#line 32 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
+#line 35 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,		T_HELP,		TF_COMMAND},
-      {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str16,		T_CONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,		T_TYPE,		TF_COMMAND, S_HEX},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str19,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
+#line 45 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,		T_IF,		TF_COMMAND|TF_PARAM},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,		T_TYPE,		TF_COMMAND, S_INT},
-      {-1}, {-1}, {-1},
+#line 43 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
+#line 28 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
+      {-1}, {-1},
+#line 42 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
+#line 17 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
+#line 15 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
+      {-1},
+#line 23 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
+      {-1},
+#line 44 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str28,	T_TYPE,		TF_COMMAND, S_TRISTATE},
+      {-1},
+#line 16 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
-      {-1}, {-1},
+      {-1},
+#line 39 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
+#line 21 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-      {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,	T_MENUCONFIG,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_TYPE,		TF_COMMAND, S_STRING},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str37,	T_VISIBLE,	TF_COMMAND},
-      {-1}, {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_PROMPT,	TF_COMMAND},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_DEPENDS,	TF_COMMAND},
+#line 46 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str44,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
+#line 40 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
+#line 19 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
+      {-1}, {-1},
+#line 33 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
       {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_SELECT,	TF_COMMAND},
+#line 18 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
+#line 41 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
+#line 37 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
+      {-1}, {-1},
+#line 22 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
+#line 34 "scripts/kconfig/zconf.gperf"
       {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str48,	T_MAINMENU,	TF_COMMAND},
+      {-1}, {-1}, {-1},
+#line 38 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
       {-1}, {-1},
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_SOURCE,	TF_COMMAND}
+#line 24 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
+      {-1},
+#line 30 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+      {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
+#line 27 "scripts/kconfig/zconf.gperf"
+      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
     };
 
   if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
@@ -242,4 +282,5 @@ kconf_id_lookup (register const char *str, register unsigned int len)
     }
   return 0;
 }
+#line 47 "scripts/kconfig/zconf.gperf"
 
diff --git a/support/kconfig/zconf.l b/support/kconfig/zconf.l
index b22f884..6555a47 100644
--- a/support/kconfig/zconf.l
+++ b/support/kconfig/zconf.l
@@ -1,5 +1,5 @@
-%option backup nostdinit noyywrap never-interactive full ecs
-%option 8bit backup nodefault perf-report perf-report
+%option nostdinit noyywrap never-interactive full ecs
+%option 8bit nodefault perf-report perf-report
 %option noinput
 %x COMMAND HELP STRING PARAM
 %{
@@ -14,7 +14,6 @@
 #include <string.h>
 #include <unistd.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 #define START_STRSIZE	16
@@ -41,7 +40,7 @@ static void zconf_endfile(void);
 
 static void new_string(void)
 {
-	text = malloc(START_STRSIZE);
+	text = xmalloc(START_STRSIZE);
 	text_asize = START_STRSIZE;
 	text_size = 0;
 	*text = 0;
@@ -63,7 +62,7 @@ static void append_string(const char *str, int size)
 
 static void alloc_string(const char *str, int size)
 {
-	text = malloc(size + 1);
+	text = xmalloc(size + 1);
 	memcpy(text, str, size);
 	text[size] = 0;
 }
@@ -96,7 +95,7 @@ n	[A-Za-z0-9_]
 
 <COMMAND>{
 	{n}+	{
-		struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
@@ -132,7 +131,7 @@ n	[A-Za-z0-9_]
 	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
 	---	/* ignore */
 	({n}|[-/.])+	{
-		struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
 			zconflval.id = id;
 			return id->token;
@@ -289,7 +288,7 @@ void zconf_initscan(const char *name)
 		exit(1);
 	}
 
-	current_buf = malloc(sizeof(*current_buf));
+	current_buf = xmalloc(sizeof(*current_buf));
 	memset(current_buf, 0, sizeof(*current_buf));
 
 	current_file = file_lookup(name);
@@ -300,7 +299,7 @@ void zconf_nextfile(const char *name)
 {
 	struct file *iter;
 	struct file *file = file_lookup(name);
-	struct buffer *buf = malloc(sizeof(*buf));
+	struct buffer *buf = xmalloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
 
 	current_buf->state = YY_CURRENT_BUFFER;
diff --git a/support/kconfig/lex.zconf.c_shipped b/support/kconfig/zconf.lex.c_shipped
similarity index 98%
rename from support/kconfig/lex.zconf.c_shipped
rename to support/kconfig/zconf.lex.c_shipped
index d918291..a0521aa 100644
--- a/support/kconfig/lex.zconf.c_shipped
+++ b/support/kconfig/zconf.lex.c_shipped
@@ -1,5 +1,5 @@
 
-#line 3 "scripts/kconfig/lex.zconf.c"
+#line 3 "scripts/kconfig/zconf.lex.c_shipped"
 
 #define  YY_INT_ALIGNED short int
 
@@ -72,6 +72,7 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
+#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -102,8 +103,6 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! C99 */
-
 #endif /* ! FLEXINT_H */
 
 #ifdef __cplusplus
@@ -160,15 +159,7 @@ typedef unsigned int flex_uint32_t;
 
 /* Size of default input buffer. */
 #ifndef YY_BUF_SIZE
-#ifdef __ia64__
-/* On IA-64, the buffer size is 16k, not 8k.
- * Moreover, YY_BUF_SIZE is 2*YY_READ_BUF_SIZE in the general case.
- * Ditto for the __ia64__ case accordingly.
- */
-#define YY_BUF_SIZE 32768
-#else
 #define YY_BUF_SIZE 16384
-#endif /* __ia64__ */
 #endif
 
 /* The state buf must be large enough to hold one state per character in the main buffer.
@@ -785,7 +776,6 @@ char *zconftext;
 #include <string.h>
 #include <unistd.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 #define START_STRSIZE	16
@@ -812,7 +802,7 @@ static void zconf_endfile(void);
 
 static void new_string(void)
 {
-	text = malloc(START_STRSIZE);
+	text = xmalloc(START_STRSIZE);
 	text_asize = START_STRSIZE;
 	text_size = 0;
 	*text = 0;
@@ -834,7 +824,7 @@ static void append_string(const char *str, int size)
 
 static void alloc_string(const char *str, int size)
 {
-	text = malloc(size + 1);
+	text = xmalloc(size + 1);
 	memcpy(text, str, size);
 	text[size] = 0;
 }
@@ -922,12 +912,7 @@ static int input (void );
 
 /* Amount of stuff to slurp up with each read. */
 #ifndef YY_READ_BUF_SIZE
-#ifdef __ia64__
-/* On IA-64, the buffer size is 16k, not 8k */
-#define YY_READ_BUF_SIZE 16384
-#else
 #define YY_READ_BUF_SIZE 8192
-#endif /* __ia64__ */
 #endif
 
 /* Copy whatever the last rule matched to the standard output. */
@@ -1100,7 +1085,7 @@ YY_RULE_SETUP
 case 6:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
 		current_pos.lineno = current_file->lineno;
@@ -1175,7 +1160,7 @@ YY_RULE_SETUP
 case 19:
 YY_RULE_SETUP
 {
-		struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
 		if (id && id->flags & TF_PARAM) {
 			zconflval.id = id;
 			return id->token;
@@ -2073,8 +2058,8 @@ YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
 
 /** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
  * scan from a @e copy of @a bytes.
- * @param yybytes the byte buffer to scan
- * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
+ * @param bytes the byte buffer to scan
+ * @param len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
@@ -2358,7 +2343,7 @@ void zconf_initscan(const char *name)
 		exit(1);
 	}
 
-	current_buf = malloc(sizeof(*current_buf));
+	current_buf = xmalloc(sizeof(*current_buf));
 	memset(current_buf, 0, sizeof(*current_buf));
 
 	current_file = file_lookup(name);
@@ -2369,7 +2354,7 @@ void zconf_nextfile(const char *name)
 {
 	struct file *iter;
 	struct file *file = file_lookup(name);
-	struct buffer *buf = malloc(sizeof(*buf));
+	struct buffer *buf = xmalloc(sizeof(*buf));
 	memset(buf, 0, sizeof(*buf));
 
 	current_buf->state = YY_CURRENT_BUFFER;
diff --git a/support/kconfig/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
index c27391d..47fa849 100644
--- a/support/kconfig/zconf.tab.c_shipped
+++ b/support/kconfig/zconf.tab.c_shipped
@@ -1,10 +1,9 @@
-
-/* A Bison parser, made by GNU Bison 2.4.1.  */
+/* A Bison parser, made by GNU Bison 2.4.3.  */
 
 /* Skeleton implementation for Bison's Yacc-like parsers in C
    
-      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
-   Free Software Foundation, Inc.
+      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
+   2009, 2010 Free Software Foundation, Inc.
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -46,7 +45,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.4.1"
+#define YYBISON_VERSION "2.4.3"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -88,7 +87,6 @@
 #include <string.h>
 #include <stdbool.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
@@ -102,22 +100,18 @@ extern int zconflex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
-#define YYDEBUG 0
-#if YYDEBUG
-#define YYERROR_VERBOSE
-#endif
 
 
 
 /* Enabling traces.  */
 #ifndef YYDEBUG
-# define YYDEBUG 0
+# define YYDEBUG 1
 #endif
 
 /* Enabling verbose error messages.  */
@@ -188,7 +182,7 @@ typedef union YYSTYPE
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	struct kconf_id *id;
+	const struct kconf_id *id;
 
 
 
@@ -255,7 +249,7 @@ typedef short int yytype_int16;
 #define YYSIZE_MAXIMUM ((YYSIZE_T) -1)
 
 #ifndef YY_
-# if YYENABLE_NLS
+# if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
 #   define YY_(msgid) dgettext ("bison-runtime", msgid)
@@ -535,18 +529,18 @@ static const yytype_int8 yyrhs[] =
 /* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   108,   108,   108,   110,   110,   112,   114,   115,   116,
-     117,   118,   119,   123,   127,   127,   127,   127,   127,   127,
-     127,   127,   131,   132,   133,   134,   135,   136,   140,   141,
-     147,   155,   161,   169,   179,   181,   182,   183,   184,   185,
-     186,   189,   197,   203,   213,   219,   225,   228,   230,   241,
-     242,   247,   256,   261,   269,   272,   274,   275,   276,   277,
-     278,   281,   287,   298,   304,   314,   316,   321,   329,   337,
-     340,   342,   343,   344,   349,   356,   363,   368,   376,   379,
-     381,   382,   383,   386,   394,   401,   408,   414,   421,   423,
-     424,   425,   428,   436,   438,   439,   442,   449,   451,   456,
-     457,   460,   461,   462,   466,   467,   470,   471,   474,   475,
-     476,   477,   478,   479,   480,   483,   484,   487,   488
+       0,   104,   104,   104,   106,   106,   108,   110,   111,   112,
+     113,   114,   115,   119,   123,   123,   123,   123,   123,   123,
+     123,   123,   127,   128,   129,   130,   131,   132,   136,   137,
+     143,   151,   157,   165,   175,   177,   178,   179,   180,   181,
+     182,   185,   193,   199,   209,   215,   221,   224,   226,   237,
+     238,   243,   252,   257,   265,   268,   270,   271,   272,   273,
+     274,   277,   283,   294,   300,   310,   312,   317,   325,   333,
+     336,   338,   339,   340,   345,   352,   359,   364,   372,   375,
+     377,   378,   379,   382,   390,   397,   404,   410,   417,   419,
+     420,   421,   424,   432,   434,   435,   438,   445,   447,   452,
+     453,   456,   457,   458,   462,   463,   466,   467,   470,   471,
+     472,   473,   474,   475,   476,   479,   480,   483,   484
 };
 #endif
 
@@ -806,9 +800,18 @@ static const yytype_uint8 yystos[] =
 
 /* Like YYERROR except do call yyerror.  This remains here temporarily
    to ease the transition to the new meaning of YYERROR, for GCC.
-   Once GCC version 2 has supplanted version 1, this can go.  */
+   Once GCC version 2 has supplanted version 1, this can go.  However,
+   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
+   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
+   discussed.  */
 
 #define YYFAIL		goto yyerrlab
+#if defined YYFAIL
+  /* This is here to suppress warnings from the GCC cpp's
+     -Wunused-macros.  Normally we don't worry about that warning, but
+     some users do, and we want to make it easy for users to remove
+     YYFAIL uses, which will produce warnings from Bison 2.5.  */
+#endif
 
 #define YYRECOVERING()  (!!yyerrstatus)
 
@@ -865,7 +868,7 @@ while (YYID (0))
    we won't break user code: when these are the locations we know.  */
 
 #ifndef YY_LOCATION_PRINT
-# if YYLTYPE_IS_TRIVIAL
+# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
 #  define YY_LOCATION_PRINT(File, Loc)			\
      fprintf (File, "%d.%d-%d.%d",			\
 	      (Loc).first_line, (Loc).first_column,	\
@@ -1753,7 +1756,7 @@ yyreduce:
   case 48:
 
     {
-	struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
+	const struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
 	if (id && id->flags & TF_OPTION)
 		menu_add_option(id->token, (yyvsp[(3) - (3)].string));
 	else
@@ -2258,10 +2261,8 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
-#if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
-#endif
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);
@@ -2300,7 +2301,7 @@ static const char *zconf_tokenname(int token)
 	return "<token>";
 }
 
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken)
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
@@ -2345,9 +2346,7 @@ static void zconf_error(const char *err, ...)
 
 static void zconferror(const char *err)
 {
-#if YYDEBUG
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
-#endif
 }
 
 static void print_quoted_string(FILE *out, const char *str)
@@ -2496,7 +2495,7 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "lex.zconf.c"
+#include "zconf.lex.c"
 #include "util.c"
 #include "confdata.c"
 #include "expr.c"
diff --git a/support/kconfig/zconf.y b/support/kconfig/zconf.y
index 0717a32..92ac107 100644
--- a/support/kconfig/zconf.y
+++ b/support/kconfig/zconf.y
@@ -11,7 +11,6 @@
 #include <string.h>
 #include <stdbool.h>
 
-#define LKC_DIRECT_LINK
 #include "lkc.h"
 
 #define printd(mask, fmt...) if (cdebug & (mask)) printf(fmt)
@@ -25,16 +24,12 @@ extern int zconflex(void);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
 static void zconferror(const char *err);
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken);
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 
 static struct menu *current_menu, *current_entry;
 
-#define YYDEBUG 0
-#if YYDEBUG
-#define YYERROR_VERBOSE
-#endif
 %}
 %expect 30
 
@@ -45,7 +40,7 @@ static struct menu *current_menu, *current_entry;
 	struct symbol *symbol;
 	struct expr *expr;
 	struct menu *menu;
-	struct kconf_id *id;
+	const struct kconf_id *id;
 }
 
 %token <id>T_MAINMENU
@@ -229,7 +224,7 @@ symbol_option_list:
 	  /* empty */
 	| symbol_option_list T_WORD symbol_option_arg
 {
-	struct kconf_id *id = kconf_id_lookup($2, strlen($2));
+	const struct kconf_id *id = kconf_id_lookup($2, strlen($2));
 	if (id && id->flags & TF_OPTION)
 		menu_add_option(id->token, $3);
 	else
@@ -503,10 +498,8 @@ void conf_parse(const char *name)
 	modules_sym->flags |= SYMBOL_AUTO;
 	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
-#if YYDEBUG
 	if (getenv("ZCONF_DEBUG"))
 		zconfdebug = 1;
-#endif
 	zconfparse();
 	if (zconfnerrs)
 		exit(1);
@@ -545,7 +538,7 @@ static const char *zconf_tokenname(int token)
 	return "<token>";
 }
 
-static bool zconf_endtoken(struct kconf_id *id, int starttoken, int endtoken)
+static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken)
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
@@ -590,9 +583,7 @@ static void zconf_error(const char *err, ...)
 
 static void zconferror(const char *err)
 {
-#if YYDEBUG
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
-#endif
 }
 
 static void print_quoted_string(FILE *out, const char *str)
@@ -741,7 +732,7 @@ void zconfdump(FILE *out)
 	}
 }
 
-#include "lex.zconf.c"
+#include "zconf.lex.c"
 #include "util.c"
 #include "confdata.c"
 #include "expr.c"
-- 
1.7.9.5
