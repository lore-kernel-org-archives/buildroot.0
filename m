From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 25 Apr 2018 18:04:29 +0200
Subject: [Buildroot] [RFC PATCH 2/2] support/kconfig: Bump to kconfig from
 Linux 4.17-rc2
In-Reply-To: <20180425160429.21330-1-petr.vorel@gmail.com>
References: <20180425160429.21330-1-petr.vorel@gmail.com>
Message-ID: <20180425160429.21330-2-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tests are not included.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
I gave up fixing tests to be working with buildroot (suppose we don't
need them anyway).

User visible improvements in recent kconfig in mainline are worth to
backport. There has been quite lot of development since Masahiro Yamada
took maintainership of Kconfig in upstream. And there are many other
improvements since v3.13-rc5 :).

Kind regards,
Petr
---
 support/kconfig/Makefile                           |  248 ++-
 support/kconfig/README.buildroot                   |    3 +
 support/kconfig/check.sh                           |    2 +-
 support/kconfig/conf.c                             |  127 +-
 support/kconfig/confdata.c                         |   40 +-
 support/kconfig/expr.c                             |  479 ++++--
 support/kconfig/expr.h                             |  107 +-
 support/kconfig/gconf.c                            |   33 +-
 support/kconfig/kconf_id.c                         |   53 +
 support/kconfig/kxgettext.c                        |    2 +-
 support/kconfig/list.h                             |    7 +-
 support/kconfig/lkc.h                              |   21 +-
 support/kconfig/lkc_proto.h                        |   86 +-
 support/kconfig/lxdialog/check-lxdialog.sh         |    4 +-
 support/kconfig/lxdialog/checklist.c               |    4 +-
 support/kconfig/lxdialog/dialog.h                  |    2 +-
 support/kconfig/lxdialog/inputbox.c                |    2 +-
 support/kconfig/lxdialog/menubox.c                 |    4 +-
 support/kconfig/lxdialog/util.c                    |    2 +-
 support/kconfig/mconf.c                            |   40 +-
 support/kconfig/menu.c                             |  261 ++-
 support/kconfig/merge_config.sh                    |   62 +-
 support/kconfig/nconf.c                            |   20 +-
 support/kconfig/nconf.gui.c                        |   22 +-
 support/kconfig/nconf.h                            |    4 +-
 .../patches/01-kconfig-kernel-to-buildroot.patch   |   66 +-
 .../patches/06-br-build-system-integration.patch   |   56 +-
 support/kconfig/patches/10-br-build-system.patch   |    8 +-
 .../patches/11-use-mktemp-for-lxdialog.patch       |    8 +-
 .../kconfig/patches/12-fix-glade-file-path.patch   |    8 +-
 .../patches/14-support-out-of-tree-config.patch    |   42 +-
 .../kconfig/patches/15-fix-qconf-moc-rule.patch    |   24 -
 .../16-fix-space-to-de-select-options.patch        |    8 +-
 support/kconfig/patches/17-backport-kecho.patch    |   26 +
 ...dialog-get-ncurses-CFLAGS-with-pkg-config.patch |   50 -
 ...onfig-nconfig-fix-multi-byte-UTF-handling.patch |   45 -
 support/kconfig/patches/series                     |    4 +-
 support/kconfig/qconf.cc                           |  708 ++++----
 support/kconfig/qconf.h                            |  150 +-
 support/kconfig/streamline_config.pl               |   58 +-
 support/kconfig/symbol.c                           |  167 +-
 support/kconfig/util.c                             |   34 +-
 support/kconfig/zconf.gperf                        |   47 -
 support/kconfig/zconf.hash.c_shipped               |  286 ----
 support/kconfig/zconf.l                            |  103 +-
 support/kconfig/zconf.lex.c_shipped                | 1138 +++++++------
 support/kconfig/zconf.tab.c_shipped                | 1756 ++++++++++----------
 support/kconfig/zconf.y                            |  149 +-
 48 files changed, 3446 insertions(+), 3130 deletions(-)
 create mode 100644 support/kconfig/kconf_id.c
 delete mode 100644 support/kconfig/patches/15-fix-qconf-moc-rule.patch
 create mode 100644 support/kconfig/patches/17-backport-kecho.patch
 delete mode 100644 support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
 delete mode 100644 support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
 mode change 100644 => 100755 support/kconfig/streamline_config.pl
 delete mode 100644 support/kconfig/zconf.gperf
 delete mode 100644 support/kconfig/zconf.hash.c_shipped

diff --git a/support/kconfig/Makefile b/support/kconfig/Makefile
index af62023863..39354f64b6 100644
--- a/support/kconfig/Makefile
+++ b/support/kconfig/Makefile
@@ -1,60 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0
 # ===========================================================================
 # Kernel configuration targets
 # These targets are used from top-level makefile
 
-PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config \
+PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
 	localmodconfig localyesconfig
 
+# Easy method for doing a status message
+       kecho := :
+ quiet_kecho := echo
+silent_kecho := :
+kecho := $($(quiet)kecho)
+
 ifdef KBUILD_KCONFIG
 Kconfig := $(KBUILD_KCONFIG)
 else
 Kconfig := Kconfig
 endif
 
+ifeq ($(quiet),silent_)
+silent := -s
+endif
+
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
 xconfig: $(obj)/qconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 gconfig: $(obj)/gconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 menuconfig: $(obj)/mconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
 config: $(obj)/conf
-	$< --oldaskconfig $(Kconfig)
+	$< $(silent) --oldaskconfig $(Kconfig)
 
 nconfig: $(obj)/nconf
-	$< $(Kconfig)
+	$< $(silent) $(Kconfig)
 
-oldconfig: $(obj)/conf
-	$< --$@ $(Kconfig)
+# This has become an internal implementation detail and is now deprecated
+# for external use.
+syncconfig: $(obj)/conf
+	$(Q)mkdir -p include/config include/generated
+	$< $(silent) --$@ $(Kconfig)
 
-silentoldconfig: $(obj)/conf
-	$(Q)mkdir -p include/generated
-	$< --$@ $(Kconfig)
-
-localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
-	$(Q)mkdir -p include/generated
-	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
+localyesconfig localmodconfig: $(obj)/conf
+	$(Q)mkdir -p include/config include/generated
+	$(Q)perl $(srctree)/$(src)/streamline_config.pl --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
 			cmp -s .tmp.config .config ||			\
 			(mv -f .config .config.old.1;			\
 			 mv -f .tmp.config .config;			\
-			 $(obj)/conf --silentoldconfig $(Kconfig);	\
+			 $< $(silent) --oldconfig $(Kconfig);		\
 			 mv -f .config.old.1 .config.old)		\
 	else								\
 			mv -f .tmp.config .config;			\
-			$(obj)/conf --silentoldconfig $(Kconfig);	\
+			$< $(silent) --oldconfig $(Kconfig);		\
 	fi
 	$(Q)rm -f .tmp.config
 
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
-	$(Q)echo "  GEN     config.pot"
+	$(Q)$(kecho) "  GEN     config.pot"
 	$(Q)xgettext --default-domain=linux                         \
 	    --add-comments --keyword=_ --keyword=N_                 \
 	    --from-code=UTF-8                                       \
@@ -65,56 +75,96 @@ update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
 	$(Q)(for i in `ls $(srctree)/arch/*/Kconfig      \
 	    $(srctree)/arch/*/um/Kconfig`;               \
 	    do                                           \
-		echo "  GEN     $$i";                    \
+		$(kecho) "  GEN     $$i";                    \
 		$(obj)/kxgettext $$i                     \
 		     >> $(obj)/config.pot;               \
 	    done )
-	$(Q)echo "  GEN     linux.pot"
+	$(Q)$(kecho) "  GEN     linux.pot"
 	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
 	    --output $(obj)/linux.pot
 	$(Q)rm -f $(obj)/config.pot
 
-PHONY += allnoconfig allyesconfig allmodconfig alldefconfig randconfig
-
-allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
-	$< --$@ $(Kconfig)
+# These targets map 1:1 to the commandline options of 'conf'
+simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
+	alldefconfig randconfig listnewconfig olddefconfig
+PHONY += $(simple-targets)
 
-PHONY += listnewconfig olddefconfig oldnoconfig savedefconfig defconfig
+$(simple-targets): $(obj)/conf
+	$< $(silent) --$@ $(Kconfig)
 
-listnewconfig olddefconfig: $(obj)/conf
-	$< --$@ $(Kconfig)
+PHONY += oldnoconfig silentoldconfig savedefconfig defconfig
 
 # oldnoconfig is an alias of olddefconfig, because people already are dependent
-# on its behavior(sets new symbols to their default value but not 'n') with the
+# on its behavior (sets new symbols to their default value but not 'n') with the
 # counter-intuitive name.
-oldnoconfig: $(obj)/conf
-	$< --olddefconfig $(Kconfig)
+oldnoconfig: olddefconfig
+	@echo "  WARNING: \"oldnoconfig\" target will be removed after Linux 4.19"
+	@echo "            Please use \"olddefconfig\" instead, which is an alias."
+
+# We do not expect manual invokcation of "silentoldcofig" (or "syncconfig").
+silentoldconfig: syncconfig
+	@echo "  WARNING: \"silentoldconfig\" has been renamed to \"syncconfig\""
+	@echo "            and is now an internal implementation detail."
+	@echo "            What you want is probably \"oldconfig\"."
+	@echo "            \"silentoldconfig\" will be removed after Linux 4.19"
 
 savedefconfig: $(obj)/conf
-	$< --$@=defconfig $(Kconfig)
+	$< $(silent) --$@=defconfig $(Kconfig)
 
 defconfig: $(obj)/conf
 ifeq ($(KBUILD_DEFCONFIG),)
-	$< --defconfig $(Kconfig)
+	$< $(silent) --defconfig $(Kconfig)
+else
+ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
+	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
+	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 else
-	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
-	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+	@$(kecho) "*** Default configuration is based on target '$(KBUILD_DEFCONFIG)'"
+	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
+endif
 endif
 
 %_defconfig: $(obj)/conf
-	$(Q)$< --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
+	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
+
+configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
+
+%.config: $(obj)/conf
+	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
+	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
+
+PHONY += kvmconfig
+kvmconfig: kvm_guest.config
+	@:
+
+PHONY += xenconfig
+xenconfig: xen.config
+	@:
+
+PHONY += tinyconfig
+tinyconfig:
+	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
+
+# CHECK: -o cache_dir=<path> working?
+PHONY += testconfig
+testconfig: $(obj)/conf
+	$(PYTHON3) -B -m pytest $(srctree)/$(src)/tests \
+	-o cache_dir=$(abspath $(obj)/tests/.cache) \
+	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=no)
+clean-dirs += tests/.cache
 
 # Help text used by make help
 help:
 	@echo  '  config	  - Update current config utilising a line-oriented program'
-	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
+	@echo  '  nconfig         - Update current config utilising a ncurses menu based'
+	@echo  '                    program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
-	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
-	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
+	@echo  '  xconfig	  - Update current config utilising a Qt based front-end'
+	@echo  '  gconfig	  - Update current config utilising a GTK+ based front-end'
 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
 	@echo  '  localmodconfig  - Update current config disabling modules not loaded'
 	@echo  '  localyesconfig  - Update current config converting local mods to core'
-	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
 	@echo  '  defconfig	  - New config with default from ARCH supplied defconfig'
 	@echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
 	@echo  '  allnoconfig	  - New config where all options are answered with no'
@@ -123,7 +173,11 @@ help:
 	@echo  '  alldefconfig    - New config with all symbols set to default'
 	@echo  '  randconfig	  - New config with random answer to all options'
 	@echo  '  listnewconfig   - List new options'
-	@echo  '  olddefconfig	  - Same as silentoldconfig but sets new symbols to their default value'
+	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
+	@echo  '                    default value without prompting'
+	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
+	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
+	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 
 # lxdialog stuff
 check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
@@ -141,9 +195,9 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
 # mconf:  Used for the menuconfig target
 #         Utilizes the lxdialog package
 # qconf:  Used for the xconfig target
-#         Based on QT which needs to be installed to compile it
+#         Based on Qt which needs to be installed to compile it
 # gconf:  Used for the gconfig target
-#         Based on GTK which needs to be installed to compile it
+#         Based on GTK+ which needs to be installed to compile it
 # object files used by all kconfig flavours
 
 lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
@@ -157,44 +211,16 @@ qconf-cxxobjs	:= qconf.o
 qconf-objs	:= zconf.tab.o
 gconf-objs	:= gconf.o zconf.tab.o
 
-hostprogs-y := conf
-
-ifeq ($(MAKECMDGOALS),nconf)
-	hostprogs-y += nconf
-endif
-
-ifeq ($(MAKECMDGOALS),mconf)
-	hostprogs-y += mconf
-endif
-
-ifeq ($(MAKECMDGOALS),update-po-config)
-	hostprogs-y += kxgettext
-endif
-
-ifeq ($(MAKECMDGOALS),qconf)
-	qconf-target := 1
-endif
-ifeq ($(MAKECMDGOALS),gconf)
-	gconf-target := 1
-endif
-
-
-ifeq ($(qconf-target),1)
-	hostprogs-y += qconf
-endif
-
-ifeq ($(gconf-target),1)
-	hostprogs-y += gconf
-endif
+hostprogs-y := conf nconf mconf kxgettext qconf gconf
 
+targets		+= zconf.lex.c
 clean-files	:= qconf.moc .tmp_qtcheck .tmp_gtkcheck
-clean-files	+= zconf.tab.c zconf.lex.c zconf.hash.c gconf.glade.h
-clean-files     += mconf qconf gconf nconf
+clean-files	+= gconf.glade.h
 clean-files     += config.pot linux.pot
 
 # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
 PHONY += $(obj)/dochecklxdialog
-$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
+$(addprefix $(obj)/, mconf.o $(lxdialog)): $(obj)/dochecklxdialog
 $(obj)/dochecklxdialog:
 	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTLOADLIBES_mconf)
 
@@ -202,14 +228,12 @@ always := dochecklxdialog
 
 # Add environment specific flags
 HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
+HOST_EXTRACXXFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCXX) $(HOSTCXXFLAGS))
 
 # generated files seem to need this to find local include files
 HOSTCFLAGS_zconf.lex.o	:= -I$(src)
 HOSTCFLAGS_zconf.tab.o	:= -I$(src)
 
-LEX_PREFIX_zconf	:= zconf
-YACC_PREFIX_zconf	:= zconf
-
 HOSTLOADLIBES_qconf	= $(KC_QT_LIBS)
 HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS)
 
@@ -225,67 +249,38 @@ HOSTLOADLIBES_nconf	= $(shell \
 				|| echo "-lmenu -lpanel -lncurses"  )
 $(obj)/qconf.o: $(obj)/.tmp_qtcheck
 
-ifeq ($(qconf-target),1)
+ifeq ($(MAKECMDGOALS),qconf)
 $(obj)/.tmp_qtcheck: $(src)/Makefile
 -include $(obj)/.tmp_qtcheck
 
-# QT needs some extra effort...
+# Qt needs some extra effort...
 $(obj)/.tmp_qtcheck:
-	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
-	if ! pkg-config --exists QtCore 2> /dev/null; then \
-	    echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
-	    pkg-config --exists qt 2> /dev/null && pkg=qt; \
-	    pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
-	    if [ -n "$$pkg" ]; then \
-	      cflags="\$$(shell pkg-config $$pkg --cflags)"; \
-	      libs="\$$(shell pkg-config $$pkg --libs)"; \
-	      moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
-	      dir="$$(pkg-config $$pkg --variable=prefix)"; \
-	    else \
-	      for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
-	        if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
-	      done; \
-	      if [ -z "$$dir" ]; then \
-	        echo >&2 "*"; \
-	        echo >&2 "* Unable to find any QT installation. Please make sure that"; \
-	        echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
-	        echo >&2 "* either qmake can be found or install pkg-config or set"; \
-	        echo >&2 "* the QTDIR environment variable to the correct location."; \
-	        echo >&2 "*"; \
-	        false; \
-	      fi; \
-	      libpath=$$dir/lib; lib=qt; osdir=""; \
-	      $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
-	        osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
-	      test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
-	      test -f $$libpath/libqt-mt.so && lib=qt-mt; \
-	      cflags="-I$$dir/include"; \
-	      libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
-	      moc="$$dir/bin/moc"; \
-	    fi; \
-	    if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
-	      echo "*"; \
-	      echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
-	      echo "*"; \
-	      moc="/usr/bin/moc"; \
-	    fi; \
+	@set -e; $(kecho) "  CHECK   qt"; \
+	if pkg-config --exists Qt5Core; then \
+	    cflags="-std=c++11 -fPIC `pkg-config --cflags Qt5Core Qt5Gui Qt5Widgets`"; \
+	    libs=`pkg-config --libs Qt5Core Qt5Gui Qt5Widgets`; \
+	    moc=`pkg-config --variable=host_bins Qt5Core`/moc; \
+	elif pkg-config --exists QtCore; then \
+	    cflags=`pkg-config --cflags QtCore QtGui`; \
+	    libs=`pkg-config --libs QtCore QtGui`; \
+	    moc=`pkg-config --variable=moc_location QtCore`; \
 	else \
-	  cflags="\$$(shell pkg-config QtCore QtGui Qt3Support --cflags)"; \
-	  libs="\$$(shell pkg-config QtCore QtGui Qt3Support --libs)"; \
-	  moc="\$$(shell pkg-config QtCore --variable=moc_location)"; \
-	  [ -n "$$moc" ] || moc="\$$(shell pkg-config QtCore --variable=prefix)/bin/moc"; \
+	    echo >&2 "*"; \
+	    echo >&2 "* Could not find Qt via pkg-config."; \
+	    echo >&2 "* Please install either Qt 4.8 or 5.x. and make sure it's in PKG_CONFIG_PATH"; \
+	    echo >&2 "*"; \
+	    exit 1; \
 	fi; \
 	echo "KC_QT_CFLAGS=$$cflags" > $@; \
 	echo "KC_QT_LIBS=$$libs" >> $@; \
 	echo "KC_QT_MOC=$$moc" >> $@
 endif
 
+ifeq ($(MAKECMDGOALS),gconf)
 $(obj)/gconf.o: $(obj)/.tmp_gtkcheck
-
-ifeq ($(gconf-target),1)
 -include $(obj)/.tmp_gtkcheck
 
-# GTK needs some extra effort, too...
+# GTK+ needs some extra effort, too...
 $(obj)/.tmp_gtkcheck:
 	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
 		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
@@ -306,15 +301,14 @@ $(obj)/.tmp_gtkcheck:
 	fi
 endif
 
-$(obj)/zconf.tab.o: $(obj)/zconf.lex.c $(obj)/zconf.hash.c
+$(obj)/zconf.tab.o: $(obj)/zconf.lex.c
 
 $(obj)/qconf.o: $(obj)/qconf.moc
 
 $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
 	$(KC_QT_MOC) -i $< -o $@
 
-# Extract gconf menu items for I18N support
+# Extract gconf menu items for i18n support
 $(obj)/gconf.glade.h: $(obj)/gconf.glade
 	$(Q)intltool-extract --type=gettext/glade --srcdir=$(srctree) \
 	$(obj)/gconf.glade
-
diff --git a/support/kconfig/README.buildroot b/support/kconfig/README.buildroot
index 3140713b39..efe181f81d 100644
--- a/support/kconfig/README.buildroot
+++ b/support/kconfig/README.buildroot
@@ -4,6 +4,9 @@ to suit Buildroot.
 To update:
 	cp -r /usr/src/linux/scripts/kconfig support/kconfig.new
 	cd support/kconfig.new
+	mv zconf.lex.c zconf.lex.c_shipped
+	mv zconf.tab.c zconf.tab.c_shipped
+	rm -rf tests/
 	cp -a ../kconfig/patches ../kconfig/README.buildroot ../kconfig/.gitignore .
 	quilt push -a
 	# Fix any conflict
diff --git a/support/kconfig/check.sh b/support/kconfig/check.sh
index 854d9c7c67..97f0fee7d1 100755
--- a/support/kconfig/check.sh
+++ b/support/kconfig/check.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
 # Needed for systems without gettext
 $* -x c -o /dev/null - > /dev/null 2>&1 << EOF
 #include <libintl.h>
@@ -11,4 +12,3 @@ EOF
 if [ ! "$?" -eq "0"  ]; then
 	echo -DKBUILD_NO_NLS;
 fi
-
diff --git a/support/kconfig/conf.c b/support/kconfig/conf.c
index 553fc76d90..2d7a7ac437 100644
--- a/support/kconfig/conf.c
+++ b/support/kconfig/conf.c
@@ -5,6 +5,7 @@
 
 #include <locale.h>
 #include <ctype.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -19,11 +20,10 @@
 
 static void conf(struct menu *menu);
 static void check_conf(struct menu *menu);
-static void xfgets(char *str, int size, FILE *in);
 
 enum input_mode {
 	oldaskconfig,
-	silentoldconfig,
+	syncconfig,
 	oldconfig,
 	allnoconfig,
 	allyesconfig,
@@ -34,14 +34,14 @@ enum input_mode {
 	savedefconfig,
 	listnewconfig,
 	olddefconfig,
-} input_mode = oldaskconfig;
+};
+static enum input_mode input_mode = oldaskconfig;
 
 static int indent = 1;
 static int tty_stdio;
-static int valid_stdin = 1;
 static int sync_kconfig;
 static int conf_cnt;
-static char line[128];
+static char line[PATH_MAX];
 static struct menu *rootEntry;
 
 static void print_help(struct menu *menu)
@@ -71,14 +71,14 @@ static void strip(char *str)
 		*p-- = 0;
 }
 
-static void check_stdin(void)
+/* Helper function to facilitate fgets() by Jean Sacren. */
+static void xfgets(char *str, int size, FILE *in)
 {
-	if (!valid_stdin) {
-		printf(_("aborted!\n\n"));
-		printf(_("Console input/output is redirected. "));
-		printf(_("Run 'make oldconfig' to update configuration.\n\n"));
-		exit(1);
-	}
+	if (!fgets(str, size, in))
+		fprintf(stderr, "\nError in reading or end of file.\n");
+
+	if (!tty_stdio)
+		printf("%s", str);
 }
 
 static int conf_askvalue(struct symbol *sym, const char *def)
@@ -100,18 +100,15 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 
 	switch (input_mode) {
 	case oldconfig:
-	case silentoldconfig:
+	case syncconfig:
 		if (sym_has_value(sym)) {
 			printf("%s\n", def);
 			return 0;
 		}
-		check_stdin();
 		/* fall through */
 	case oldaskconfig:
 		fflush(stdout);
-		xfgets(line, 128, stdin);
-		if (!tty_stdio)
-			printf("\n");
+		xfgets(line, sizeof(line), stdin);
 		return 1;
 	default:
 		break;
@@ -191,9 +188,7 @@ static int conf_sym(struct menu *menu)
 			printf("/m");
 		if (oldval != yes && sym_tristate_within_range(sym, yes))
 			printf("/y");
-		if (menu_has_help(menu))
-			printf("/?");
-		printf("] ");
+		printf("/?] ");
 		if (!conf_askvalue(sym, sym_get_string_value(sym)))
 			return 0;
 		strip(line);
@@ -295,23 +290,19 @@ static int conf_choice(struct menu *menu)
 			printf("[1]: 1\n");
 			goto conf_childs;
 		}
-		printf("[1-%d", cnt);
-		if (menu_has_help(menu))
-			printf("?");
-		printf("]: ");
+		printf("[1-%d?]: ", cnt);
 		switch (input_mode) {
 		case oldconfig:
-		case silentoldconfig:
+		case syncconfig:
 			if (!is_new) {
 				cnt = def;
 				printf("%d\n", cnt);
 				break;
 			}
-			check_stdin();
 			/* fall through */
 		case oldaskconfig:
 			fflush(stdout);
-			xfgets(line, 128, stdin);
+			xfgets(line, sizeof(line), stdin);
 			strip(line);
 			if (line[0] == '?') {
 				print_help(menu);
@@ -367,10 +358,11 @@ static void conf(struct menu *menu)
 
 		switch (prop->type) {
 		case P_MENU:
-			if ((input_mode == silentoldconfig ||
-			     input_mode == listnewconfig ||
-			     input_mode == olddefconfig) &&
-			    rootEntry != menu) {
+			/*
+			 * Except in oldaskconfig mode, we show only menus that
+			 * contain new symbols.
+			 */
+			if (input_mode != oldaskconfig && rootEntry != menu) {
 				check_conf(menu);
 				return;
 			}
@@ -430,10 +422,20 @@ static void check_conf(struct menu *menu)
 		if (sym_is_changable(sym) ||
 		    (sym_is_choice(sym) && sym_get_tristate_value(sym) == yes)) {
 			if (input_mode == listnewconfig) {
-				if (sym->name && !sym_is_choice_value(sym)) {
-					printf("%s%s\n", CONFIG_, sym->name);
+				if (sym->name) {
+					const char *str;
+
+					if (sym->type == S_STRING) {
+						str = sym_get_string_value(sym);
+						str = sym_escape_string_value(str);
+						printf("%s%s=%s\n", CONFIG_, sym->name, str);
+						free((void *)str);
+					} else {
+						str = sym_get_string_value(sym);
+						printf("%s%s=%s\n", CONFIG_, sym->name, str);
+					}
 				}
-			} else if (input_mode != olddefconfig) {
+			} else {
 				if (!conf_cnt++)
 					printf(_("*\n* Restart config...\n*\n"));
 				rootEntry = menu_get_parent_menu(menu);
@@ -449,7 +451,7 @@ static void check_conf(struct menu *menu)
 static struct option long_opts[] = {
 	{"oldaskconfig",    no_argument,       NULL, oldaskconfig},
 	{"oldconfig",       no_argument,       NULL, oldconfig},
-	{"silentoldconfig", no_argument,       NULL, silentoldconfig},
+	{"syncconfig",      no_argument,       NULL, syncconfig},
 	{"defconfig",       optional_argument, NULL, defconfig},
 	{"savedefconfig",   required_argument, NULL, savedefconfig},
 	{"allnoconfig",     no_argument,       NULL, allnoconfig},
@@ -471,13 +473,14 @@ static struct option long_opts[] = {
 static void conf_usage(const char *progname)
 {
 
-	printf("Usage: %s [option] <kconfig-file>\n", progname);
+	printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
 	printf("[option] is _one_ of the following:\n");
 	printf("  --listnewconfig         List new options\n");
 	printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
 	printf("  --oldconfig             Update a configuration using a provided .config as base\n");
-	printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
-	printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
+	printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
+	       "                          include/{generated/,config/}\n");
+	printf("  --olddefconfig          Same as oldconfig but sets new symbols to their default value\n");
 	printf("  --oldnoconfig           An alias of olddefconfig\n");
 	printf("  --defconfig <file>      New config with default defined in <file>\n");
 	printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
@@ -499,12 +502,16 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
-	tty_stdio = isatty(0) && isatty(1) && isatty(2);
+	tty_stdio = isatty(0) && isatty(1);
 
-	while ((opt = getopt_long(ac, av, "", long_opts, NULL)) != -1) {
+	while ((opt = getopt_long(ac, av, "s", long_opts, NULL)) != -1) {
+		if (opt == 's') {
+			conf_set_message_callback(NULL);
+			continue;
+		}
 		input_mode = (enum input_mode)opt;
 		switch (opt) {
-		case silentoldconfig:
+		case syncconfig:
 			sync_kconfig = 1;
 			break;
 		case defconfig:
@@ -552,7 +559,7 @@ int main(int ac, char **av)
 		}
 	}
 	if (ac == optind) {
-		printf(_("%s: Kconfig file missing\n"), av[0]);
+		fprintf(stderr, _("%s: Kconfig file missing\n"), av[0]);
 		conf_usage(progname);
 		exit(1);
 	}
@@ -576,14 +583,16 @@ int main(int ac, char **av)
 		if (!defconfig_file)
 			defconfig_file = conf_get_default_confname();
 		if (conf_read(defconfig_file)) {
-			printf(_("***\n"
-				"*** Can't find default configuration \"%s\"!\n"
-				"***\n"), defconfig_file);
+			fprintf(stderr,
+				_("***\n"
+				  "*** Can't find default configuration \"%s\"!\n"
+				  "***\n"),
+				defconfig_file);
 			exit(1);
 		}
 		break;
 	case savedefconfig:
-	case silentoldconfig:
+	case syncconfig:
 	case oldaskconfig:
 	case oldconfig:
 	case listnewconfig:
@@ -636,7 +645,6 @@ int main(int ac, char **av)
 				return 1;
 			}
 		}
-		valid_stdin = tty_stdio;
 	}
 
 	switch (input_mode) {
@@ -664,24 +672,24 @@ int main(int ac, char **av)
 	case oldaskconfig:
 		rootEntry = &rootmenu;
 		conf(&rootmenu);
-		input_mode = silentoldconfig;
+		input_mode = oldconfig;
 		/* fall through */
 	case oldconfig:
 	case listnewconfig:
-	case olddefconfig:
-	case silentoldconfig:
+	case syncconfig:
 		/* Update until a loop caused no more changes */
 		do {
 			conf_cnt = 0;
 			check_conf(&rootmenu);
-		} while (conf_cnt &&
-			 (input_mode != listnewconfig &&
-			  input_mode != olddefconfig));
+		} while (conf_cnt);
+		break;
+	case olddefconfig:
+	default:
 		break;
 	}
 
 	if (sync_kconfig) {
-		/* silentoldconfig is used during the build so we shall update autoconf.
+		/* syncconfig is used during the build so we shall update autoconf.
 		 * All other commands are only used to generate a config.
 		 */
 		if (conf_get_changed() && conf_write(NULL)) {
@@ -695,7 +703,7 @@ int main(int ac, char **av)
 	} else if (input_mode == savedefconfig) {
 		if (conf_write_defconfig(defconfig_file)) {
 			fprintf(stderr, _("n*** Error while saving defconfig to: %s\n\n"),
-			        defconfig_file);
+				defconfig_file);
 			return 1;
 		}
 	} else if (input_mode != listnewconfig) {
@@ -706,12 +714,3 @@ int main(int ac, char **av)
 	}
 	return 0;
 }
-
-/*
- * Helper function to facilitate fgets() by Jean Sacren.
- */
-void xfgets(char *str, int size, FILE *in)
-{
-	if (fgets(str, size, in) == NULL)
-		fprintf(stderr, "\nError in reading or end of file.\n");
-}
diff --git a/support/kconfig/confdata.c b/support/kconfig/confdata.c
index 2371fa8179..892da74fdc 100644
--- a/support/kconfig/confdata.c
+++ b/support/kconfig/confdata.c
@@ -17,6 +17,11 @@
 
 #include "lkc.h"
 
+struct conf_printer {
+	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
+	void (*print_comment)(FILE *, const char *, void *);
+};
+
 static void conf_warning(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 
@@ -24,7 +29,7 @@ static void conf_message(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 
 static const char *conf_filename;
-static int conf_lineno, conf_warnings, conf_unsaved;
+static int conf_lineno, conf_warnings;
 
 const char conf_defname[] = ".defconfig";
 
@@ -60,6 +65,7 @@ static void conf_message(const char *fmt, ...)
 	va_start(ap, fmt);
 	if (conf_message_callback)
 		conf_message_callback(fmt, ap);
+	va_end(ap);
 }
 
 const char *conf_get_configname(void)
@@ -171,7 +177,7 @@ static int conf_set_sym_val(struct symbol *sym, int def, int def_flags, char *p)
 	case S_HEX:
 	done:
 		if (sym_string_valid(sym, p)) {
-			sym->def[def].val = strdup(p);
+			sym->def[def].val = xstrdup(p);
 			sym->flags |= def_flags;
 		} else {
 			if (def != S_DEF_AUTO)
@@ -194,7 +200,7 @@ static int add_byte(int c, char **lineptr, size_t slen, size_t *n)
 	if (new_size > *n) {
 		new_size += LINE_GROWTH - 1;
 		new_size *= 2;
-		nline = realloc(*lineptr, new_size);
+		nline = xrealloc(*lineptr, new_size);
 		if (!nline)
 			return -1;
 
@@ -260,11 +266,8 @@ int conf_read_simple(const char *name, int def)
 		if (in)
 			goto load;
 		sym_add_change_count(1);
-		if (!sym_defconfig_list) {
-			if (modules_sym)
-				sym_calc_value(modules_sym);
+		if (!sym_defconfig_list)
 			return 1;
-		}
 
 		for_all_defaults(sym_defconfig_list, prop) {
 			if (expr_calc_value(prop->visible.expr) == no ||
@@ -286,7 +289,6 @@ load:
 	conf_filename = name;
 	conf_lineno = 0;
 	conf_warnings = 0;
-	conf_unsaved = 0;
 
 	def_flags = SYMBOL_DEF << def;
 	for_all_symbols(i, sym) {
@@ -371,7 +373,9 @@ load:
 				continue;
 		} else {
 			if (line[0] != '\r' && line[0] != '\n')
-				conf_warning("unexpected data");
+				conf_warning("unexpected data: %.*s",
+					     (int)strcspn(line, "\r\n"), line);
+
 			continue;
 		}
 setsym:
@@ -397,21 +401,23 @@ setsym:
 	}
 	free(line);
 	fclose(in);
-
-	if (modules_sym)
-		sym_calc_value(modules_sym);
 	return 0;
 }
 
 int conf_read(const char *name)
 {
 	struct symbol *sym;
+	int conf_unsaved = 0;
 	int i;
 
 	sym_set_change_count(0);
 
-	if (conf_read_simple(name, S_DEF_USER))
+	if (conf_read_simple(name, S_DEF_USER)) {
+		sym_calc_value(modules_sym);
 		return 1;
+	}
+
+	sym_calc_value(modules_sym);
 
 	for_all_symbols(i, sym) {
 		sym_calc_value(sym);
@@ -846,6 +852,7 @@ static int conf_split_config(void)
 
 	name = conf_get_autoconfig_name();
 	conf_read_simple(name, S_DEF_AUTO);
+	sym_calc_value(modules_sym);
 
 	opwd = malloc(256);
 	_name = strdup(name);
@@ -1149,7 +1156,7 @@ void set_all_choice_values(struct symbol *csym)
 bool conf_set_all_new_symbols(enum conf_def_mode mode)
 {
 	struct symbol *sym, *csym;
-	int i, cnt, pby, pty, ptm;	/* pby: probability of boolean  = y
+	int i, cnt, pby, pty, ptm;	/* pby: probability of bool     = y
 					 * pty: probability of tristate = y
 					 * ptm: probability of tristate = m
 					 */
@@ -1211,7 +1218,10 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
 				sym->def[S_DEF_USER].tri = mod;
 				break;
 			case def_no:
-				sym->def[S_DEF_USER].tri = no;
+				if (sym->flags & SYMBOL_ALLNOCONFIG_Y)
+					sym->def[S_DEF_USER].tri = yes;
+				else
+					sym->def[S_DEF_USER].tri = no;
 				break;
 			case def_random:
 				sym->def[S_DEF_USER].tri = no;
diff --git a/support/kconfig/expr.c b/support/kconfig/expr.c
index d6626521f9..e1a39e9084 100644
--- a/support/kconfig/expr.c
+++ b/support/kconfig/expr.c
@@ -11,6 +11,9 @@
 
 #define DEBUG_EXPR	0
 
+static int expr_eq(struct expr *e1, struct expr *e2);
+static struct expr *expr_eliminate_yn(struct expr *e);
+
 struct expr *expr_alloc_symbol(struct symbol *sym)
 {
 	struct expr *e = xcalloc(1, sizeof(*e));
@@ -76,6 +79,10 @@ struct expr *expr_copy(const struct expr *org)
 		e->left.expr = expr_copy(org->left.expr);
 		break;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		e->left.sym = org->left.sym;
 		e->right.sym = org->right.sym;
@@ -87,7 +94,7 @@ struct expr *expr_copy(const struct expr *org)
 		e->right.expr = expr_copy(org->right.expr);
 		break;
 	default:
-		printf("can't copy type %d\n", e->type);
+		fprintf(stderr, "can't copy type %d\n", e->type);
 		free(e);
 		e = NULL;
 		break;
@@ -106,8 +113,12 @@ void expr_free(struct expr *e)
 		break;
 	case E_NOT:
 		expr_free(e->left.expr);
-		return;
+		break;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		break;
 	case E_OR:
@@ -116,7 +127,7 @@ void expr_free(struct expr *e)
 		expr_free(e->right.expr);
 		break;
 	default:
-		printf("how to free type %d?\n", e->type);
+		fprintf(stderr, "how to free type %d?\n", e->type);
 		break;
 	}
 	free(e);
@@ -127,8 +138,18 @@ static int trans_count;
 #define e1 (*ep1)
 #define e2 (*ep2)
 
+/*
+ * expr_eliminate_eq() helper.
+ *
+ * Walks the two expression trees given in 'ep1' and 'ep2'. Any node that does
+ * not have type 'type' (E_OR/E_AND) is considered a leaf, and is compared
+ * against all other leaves. Two equal leaves are both replaced with either 'y'
+ * or 'n' as appropriate for 'type', to be eliminated later.
+ */
 static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
+	/* Recurse down to leaves */
+
 	if (e1->type == type) {
 		__expr_eliminate_eq(type, &e1->left.expr, &e2);
 		__expr_eliminate_eq(type, &e1->right.expr, &e2);
@@ -139,12 +160,18 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 		__expr_eliminate_eq(type, &e1, &e2->right.expr);
 		return;
 	}
+
+	/* e1 and e2 are leaves. Compare them. */
+
 	if (e1->type == E_SYMBOL && e2->type == E_SYMBOL &&
 	    e1->left.sym == e2->left.sym &&
 	    (e1->left.sym == &symbol_yes || e1->left.sym == &symbol_no))
 		return;
 	if (!expr_eq(e1, e2))
 		return;
+
+	/* e1 and e2 are equal leaves. Prepare them for elimination. */
+
 	trans_count++;
 	expr_free(e1); expr_free(e2);
 	switch (type) {
@@ -161,6 +188,35 @@ static void __expr_eliminate_eq(enum expr_type type, struct expr **ep1, struct e
 	}
 }
 
+/*
+ * Rewrites the expressions 'ep1' and 'ep2' to remove operands common to both.
+ * Example reductions:
+ *
+ *	ep1: A && B           ->  ep1: y
+ *	ep2: A && B && C      ->  ep2: C
+ *
+ *	ep1: A || B           ->  ep1: n
+ *	ep2: A || B || C      ->  ep2: C
+ *
+ *	ep1: A && (B && FOO)  ->  ep1: FOO
+ *	ep2: (BAR && B) && A  ->  ep2: BAR
+ *
+ *	ep1: A && (B || C)    ->  ep1: y
+ *	ep2: (C || B) && A    ->  ep2: y
+ *
+ * Comparisons are done between all operands at the same "level" of && or ||.
+ * For example, in the expression 'e1 && (e2 || e3) && (e4 || e5)', the
+ * following operands will be compared:
+ *
+ *	- 'e1', 'e2 || e3', and 'e4 || e5', against each other
+ *	- e2 against e3
+ *	- e4 against e5
+ *
+ * Parentheses are irrelevant within a single level. 'e1 && (e2 && e3)' and
+ * '(e1 && e2) && e3' are both a single level.
+ *
+ * See __expr_eliminate_eq() as well.
+ */
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 {
 	if (!e1 || !e2)
@@ -186,7 +242,13 @@ void expr_eliminate_eq(struct expr **ep1, struct expr **ep2)
 #undef e1
 #undef e2
 
-int expr_eq(struct expr *e1, struct expr *e2)
+/*
+ * Returns true if 'e1' and 'e2' are equal, after minor simplification. Two
+ * &&/|| expressions are considered equal if every operand in one expression
+ * equals some operand in the other (operands do not need to appear in the same
+ * order), recursively.
+ */
+static int expr_eq(struct expr *e1, struct expr *e2)
 {
 	int res, old_count;
 
@@ -194,6 +256,10 @@ int expr_eq(struct expr *e1, struct expr *e2)
 		return 0;
 	switch (e1->type) {
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		return e1->left.sym == e2->left.sym && e1->right.sym == e2->right.sym;
 	case E_SYMBOL:
@@ -228,7 +294,18 @@ int expr_eq(struct expr *e1, struct expr *e2)
 	return 0;
 }
 
-struct expr *expr_eliminate_yn(struct expr *e)
+/*
+ * Recursively performs the following simplifications in-place (as well as the
+ * corresponding simplifications with swapped operands):
+ *
+ *	expr && n  ->  n
+ *	expr && y  ->  expr
+ *	expr || n  ->  expr
+ *	expr || y  ->  y
+ *
+ * Returns the optimized expression.
+ */
+static struct expr *expr_eliminate_yn(struct expr *e)
 {
 	struct expr *tmp;
 
@@ -501,12 +578,21 @@ static struct expr *expr_join_and(struct expr *e1, struct expr *e2)
 	return NULL;
 }
 
+/*
+ * expr_eliminate_dups() helper.
+ *
+ * Walks the two expression trees given in 'ep1' and 'ep2'. Any node that does
+ * not have type 'type' (E_OR/E_AND) is considered a leaf, and is compared
+ * against all other leaves to look for simplifications.
+ */
 static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct expr **ep2)
 {
 #define e1 (*ep1)
 #define e2 (*ep2)
 	struct expr *tmp;
 
+	/* Recurse down to leaves */
+
 	if (e1->type == type) {
 		expr_eliminate_dups1(type, &e1->left.expr, &e2);
 		expr_eliminate_dups1(type, &e1->right.expr, &e2);
@@ -517,6 +603,9 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 		expr_eliminate_dups1(type, &e1, &e2->right.expr);
 		return;
 	}
+
+	/* e1 and e2 are leaves. Compare and process them. */
+
 	if (e1 == e2)
 		return;
 
@@ -553,62 +642,17 @@ static void expr_eliminate_dups1(enum expr_type type, struct expr **ep1, struct
 #undef e2
 }
 
-static void expr_eliminate_dups2(enum expr_type type, struct expr **ep1, struct expr **ep2)
-{
-#define e1 (*ep1)
-#define e2 (*ep2)
-	struct expr *tmp, *tmp1, *tmp2;
-
-	if (e1->type == type) {
-		expr_eliminate_dups2(type, &e1->left.expr, &e2);
-		expr_eliminate_dups2(type, &e1->right.expr, &e2);
-		return;
-	}
-	if (e2->type == type) {
-		expr_eliminate_dups2(type, &e1, &e2->left.expr);
-		expr_eliminate_dups2(type, &e1, &e2->right.expr);
-	}
-	if (e1 == e2)
-		return;
-
-	switch (e1->type) {
-	case E_OR:
-		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO || BAR) && (!FOO && !BAR) -> n
-		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-		tmp2 = expr_copy(e2);
-		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-		if (expr_is_yes(tmp1)) {
-			expr_free(e1);
-			e1 = expr_alloc_symbol(&symbol_no);
-			trans_count++;
-		}
-		expr_free(tmp2);
-		expr_free(tmp1);
-		expr_free(tmp);
-		break;
-	case E_AND:
-		expr_eliminate_dups2(e1->type, &e1, &e1);
-		// (FOO && BAR) || (!FOO || !BAR) -> y
-		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
-		tmp2 = expr_copy(e2);
-		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-		if (expr_is_no(tmp1)) {
-			expr_free(e1);
-			e1 = expr_alloc_symbol(&symbol_yes);
-			trans_count++;
-		}
-		expr_free(tmp2);
-		expr_free(tmp1);
-		expr_free(tmp);
-		break;
-	default:
-		;
-	}
-#undef e1
-#undef e2
-}
-
+/*
+ * Rewrites 'e' in-place to remove ("join") duplicate and other redundant
+ * operands.
+ *
+ * Example simplifications:
+ *
+ *	A || B || A    ->  A || B
+ *	A && B && A=y  ->  A=y && B
+ *
+ * Returns the deduplicated expression.
+ */
 struct expr *expr_eliminate_dups(struct expr *e)
 {
 	int oldcount;
@@ -621,11 +665,11 @@ struct expr *expr_eliminate_dups(struct expr *e)
 		switch (e->type) {
 		case E_OR: case E_AND:
 			expr_eliminate_dups1(e->type, &e, &e);
-			expr_eliminate_dups2(e->type, &e, &e);
 		default:
 			;
 		}
 		if (!trans_count)
+			/* No simplifications done in this pass. We're done */
 			break;
 		e = expr_eliminate_yn(e);
 	}
@@ -633,6 +677,12 @@ struct expr *expr_eliminate_dups(struct expr *e)
 	return e;
 }
 
+/*
+ * Performs various simplifications involving logical operators and
+ * comparisons.
+ *
+ * Allocates and returns a new expression.
+ */
 struct expr *expr_transform(struct expr *e)
 {
 	struct expr *tmp;
@@ -641,6 +691,10 @@ struct expr *expr_transform(struct expr *e)
 		return NULL;
 	switch (e->type) {
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 	case E_SYMBOL:
 	case E_LIST:
@@ -713,6 +767,22 @@ struct expr *expr_transform(struct expr *e)
 			e = tmp;
 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
 			break;
+		case E_LEQ:
+		case E_GEQ:
+			// !a<='x' -> a>'x'
+			tmp = e->left.expr;
+			free(e);
+			e = tmp;
+			e->type = e->type == E_LEQ ? E_GTH : E_LTH;
+			break;
+		case E_LTH:
+		case E_GTH:
+			// !a<'x' -> a>='x'
+			tmp = e->left.expr;
+			free(e);
+			e = tmp;
+			e->type = e->type == E_LTH ? E_GEQ : E_LEQ;
+			break;
 		case E_OR:
 			// !(a || b) -> !a && !b
 			tmp = e->left.expr;
@@ -783,6 +853,10 @@ int expr_contains_symbol(struct expr *dep, struct symbol *sym)
 	case E_SYMBOL:
 		return dep->left.sym == sym;
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		return dep->left.sym == sym ||
 		       dep->right.sym == sym;
@@ -823,57 +897,20 @@ bool expr_depends_symbol(struct expr *dep, struct symbol *sym)
  	return false;
 }
 
-struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2)
-{
-	struct expr *tmp = NULL;
-	expr_extract_eq(E_AND, &tmp, ep1, ep2);
-	if (tmp) {
-		*ep1 = expr_eliminate_yn(*ep1);
-		*ep2 = expr_eliminate_yn(*ep2);
-	}
-	return tmp;
-}
-
-struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2)
-{
-	struct expr *tmp = NULL;
-	expr_extract_eq(E_OR, &tmp, ep1, ep2);
-	if (tmp) {
-		*ep1 = expr_eliminate_yn(*ep1);
-		*ep2 = expr_eliminate_yn(*ep2);
-	}
-	return tmp;
-}
-
-void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2)
-{
-#define e1 (*ep1)
-#define e2 (*ep2)
-	if (e1->type == type) {
-		expr_extract_eq(type, ep, &e1->left.expr, &e2);
-		expr_extract_eq(type, ep, &e1->right.expr, &e2);
-		return;
-	}
-	if (e2->type == type) {
-		expr_extract_eq(type, ep, ep1, &e2->left.expr);
-		expr_extract_eq(type, ep, ep1, &e2->right.expr);
-		return;
-	}
-	if (expr_eq(e1, e2)) {
-		*ep = *ep ? expr_alloc_two(type, *ep, e1) : e1;
-		expr_free(e2);
-		if (type == E_AND) {
-			e1 = expr_alloc_symbol(&symbol_yes);
-			e2 = expr_alloc_symbol(&symbol_yes);
-		} else if (type == E_OR) {
-			e1 = expr_alloc_symbol(&symbol_no);
-			e2 = expr_alloc_symbol(&symbol_no);
-		}
-	}
-#undef e1
-#undef e2
-}
-
+/*
+ * Inserts explicit comparisons of type 'type' to symbol 'sym' into the
+ * expression 'e'.
+ *
+ * Examples transformations for type == E_UNEQUAL, sym == &symbol_no:
+ *
+ *	A              ->  A!=n
+ *	!A             ->  A=n
+ *	A && B         ->  !(A=n || B=n)
+ *	A || B         ->  !(A=n && B=n)
+ *	A && (B || C)  ->  !(A=n || (B=n && C=n))
+ *
+ * Allocates and returns a new expression.
+ */
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym)
 {
 	struct expr *e1, *e2;
@@ -908,6 +945,10 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 	case E_NOT:
 		return expr_trans_compare(e->left.expr, type == E_EQUAL ? E_UNEQUAL : E_EQUAL, sym);
 	case E_UNEQUAL:
+	case E_LTH:
+	case E_LEQ:
+	case E_GTH:
+	case E_GEQ:
 	case E_EQUAL:
 		if (type == E_EQUAL) {
 			if (sym == &symbol_yes)
@@ -935,10 +976,60 @@ struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symb
 	return NULL;
 }
 
+enum string_value_kind {
+	k_string,
+	k_signed,
+	k_unsigned,
+	k_invalid
+};
+
+union string_value {
+	unsigned long long u;
+	signed long long s;
+};
+
+static enum string_value_kind expr_parse_string(const char *str,
+						enum symbol_type type,
+						union string_value *val)
+{
+	char *tail;
+	enum string_value_kind kind;
+
+	errno = 0;
+	switch (type) {
+	case S_BOOLEAN:
+	case S_TRISTATE:
+		val->s = !strcmp(str, "n") ? 0 :
+			 !strcmp(str, "m") ? 1 :
+			 !strcmp(str, "y") ? 2 : -1;
+		return k_signed;
+	case S_INT:
+		val->s = strtoll(str, &tail, 10);
+		kind = k_signed;
+		break;
+	case S_HEX:
+		val->u = strtoull(str, &tail, 16);
+		kind = k_unsigned;
+		break;
+	case S_STRING:
+	case S_UNKNOWN:
+		val->s = strtoll(str, &tail, 0);
+		kind = k_signed;
+		break;
+	default:
+		return k_invalid;
+	}
+	return !errno && !*tail && tail > str && isxdigit(tail[-1])
+	       ? kind : k_string;
+}
+
 tristate expr_calc_value(struct expr *e)
 {
 	tristate val1, val2;
 	const char *str1, *str2;
+	enum string_value_kind k1 = k_string, k2 = k_string;
+	union string_value lval = {}, rval = {};
+	int res;
 
 	if (!e)
 		return yes;
@@ -959,31 +1050,70 @@ tristate expr_calc_value(struct expr *e)
 		val1 = expr_calc_value(e->left.expr);
 		return EXPR_NOT(val1);
 	case E_EQUAL:
-		sym_calc_value(e->left.sym);
-		sym_calc_value(e->right.sym);
-		str1 = sym_get_string_value(e->left.sym);
-		str2 = sym_get_string_value(e->right.sym);
-		return !strcmp(str1, str2) ? yes : no;
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
-		sym_calc_value(e->left.sym);
-		sym_calc_value(e->right.sym);
-		str1 = sym_get_string_value(e->left.sym);
-		str2 = sym_get_string_value(e->right.sym);
-		return !strcmp(str1, str2) ? no : yes;
+		break;
 	default:
 		printf("expr_calc_value: %d?\n", e->type);
 		return no;
 	}
+
+	sym_calc_value(e->left.sym);
+	sym_calc_value(e->right.sym);
+	str1 = sym_get_string_value(e->left.sym);
+	str2 = sym_get_string_value(e->right.sym);
+
+	if (e->left.sym->type != S_STRING || e->right.sym->type != S_STRING) {
+		k1 = expr_parse_string(str1, e->left.sym->type, &lval);
+		k2 = expr_parse_string(str2, e->right.sym->type, &rval);
+	}
+
+	if (k1 == k_string || k2 == k_string)
+		res = strcmp(str1, str2);
+	else if (k1 == k_invalid || k2 == k_invalid) {
+		if (e->type != E_EQUAL && e->type != E_UNEQUAL) {
+			printf("Cannot compare \"%s\" and \"%s\"\n", str1, str2);
+			return no;
+		}
+		res = strcmp(str1, str2);
+	} else if (k1 == k_unsigned || k2 == k_unsigned)
+		res = (lval.u > rval.u) - (lval.u < rval.u);
+	else /* if (k1 == k_signed && k2 == k_signed) */
+		res = (lval.s > rval.s) - (lval.s < rval.s);
+
+	switch(e->type) {
+	case E_EQUAL:
+		return res ? no : yes;
+	case E_GEQ:
+		return res >= 0 ? yes : no;
+	case E_GTH:
+		return res > 0 ? yes : no;
+	case E_LEQ:
+		return res <= 0 ? yes : no;
+	case E_LTH:
+		return res < 0 ? yes : no;
+	case E_UNEQUAL:
+		return res ? yes : no;
+	default:
+		printf("expr_calc_value: relation %d?\n", e->type);
+		return no;
+	}
 }
 
-int expr_compare_type(enum expr_type t1, enum expr_type t2)
+static int expr_compare_type(enum expr_type t1, enum expr_type t2)
 {
-#if 0
-	return 1;
-#else
 	if (t1 == t2)
 		return 0;
 	switch (t1) {
+	case E_LEQ:
+	case E_LTH:
+	case E_GEQ:
+	case E_GTH:
+		if (t2 == E_EQUAL || t2 == E_UNEQUAL)
+			return 1;
 	case E_EQUAL:
 	case E_UNEQUAL:
 		if (t2 == E_NOT)
@@ -1005,52 +1135,11 @@ int expr_compare_type(enum expr_type t1, enum expr_type t2)
 	}
 	printf("[%dgt%d?]", t1, t2);
 	return 0;
-#endif
-}
-
-static inline struct expr *
-expr_get_leftmost_symbol(const struct expr *e)
-{
-
-	if (e == NULL)
-		return NULL;
-
-	while (e->type != E_SYMBOL)
-		e = e->left.expr;
-
-	return expr_copy(e);
-}
-
-/*
- * Given expression `e1' and `e2', returns the leaf of the longest
- * sub-expression of `e1' not containing 'e2.
- */
-struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2)
-{
-	struct expr *ret;
-
-	switch (e1->type) {
-	case E_OR:
-		return expr_alloc_and(
-		    expr_simplify_unmet_dep(e1->left.expr, e2),
-		    expr_simplify_unmet_dep(e1->right.expr, e2));
-	case E_AND: {
-		struct expr *e;
-		e = expr_alloc_and(expr_copy(e1), expr_copy(e2));
-		e = expr_eliminate_dups(e);
-		ret = (!expr_eq(e, e1)) ? e1 : NULL;
-		expr_free(e);
-		break;
-		}
-	default:
-		ret = e1;
-		break;
-	}
-
-	return expr_get_leftmost_symbol(ret);
 }
 
-void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken)
+void expr_print(struct expr *e,
+		void (*fn)(void *, struct symbol *, const char *),
+		void *data, int prevtoken)
 {
 	if (!e) {
 		fn(data, NULL, "y");
@@ -1078,6 +1167,24 @@ void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *
 		fn(data, NULL, "=");
 		fn(data, e->right.sym, e->right.sym->name);
 		break;
+	case E_LEQ:
+	case E_LTH:
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
+		fn(data, NULL, e->type == E_LEQ ? "<=" : "<");
+		fn(data, e->right.sym, e->right.sym->name);
+		break;
+	case E_GEQ:
+	case E_GTH:
+		if (e->left.sym->name)
+			fn(data, e->left.sym, e->left.sym->name);
+		else
+			fn(data, NULL, "<choice>");
+		fn(data, NULL, e->type == E_GEQ ? ">=" : ">");
+		fn(data, e->right.sym, e->right.sym->name);
+		break;
 	case E_UNEQUAL:
 		if (e->left.sym->name)
 			fn(data, e->left.sym, e->left.sym->name);
@@ -1166,3 +1273,33 @@ void expr_gstr_print(struct expr *e, struct gstr *gs)
 {
 	expr_print(e, expr_print_gstr_helper, gs, E_NONE);
 }
+
+/*
+ * Transform the top level "||" tokens into newlines and prepend each
+ * line with a minus. This makes expressions much easier to read.
+ * Suitable for reverse dependency expressions.
+ */
+static void expr_print_revdep(struct expr *e,
+			      void (*fn)(void *, struct symbol *, const char *),
+			      void *data, tristate pr_type, const char **title)
+{
+	if (e->type == E_OR) {
+		expr_print_revdep(e->left.expr, fn, data, pr_type, title);
+		expr_print_revdep(e->right.expr, fn, data, pr_type, title);
+	} else if (expr_calc_value(e) == pr_type) {
+		if (*title) {
+			fn(data, NULL, *title);
+			*title = NULL;
+		}
+
+		fn(data, NULL, "  - ");
+		expr_print(e, fn, data, E_NONE);
+		fn(data, NULL, "\n");
+	}
+}
+
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
+			    tristate pr_type, const char *title)
+{
+	expr_print_revdep(e, expr_print_gstr_helper, gs, pr_type, &title);
+}
diff --git a/support/kconfig/expr.h b/support/kconfig/expr.h
index ba663e1dc7..94a383b21d 100644
--- a/support/kconfig/expr.h
+++ b/support/kconfig/expr.h
@@ -29,7 +29,9 @@ typedef enum tristate {
 } tristate;
 
 enum expr_type {
-	E_NONE, E_OR, E_AND, E_NOT, E_EQUAL, E_UNEQUAL, E_LIST, E_SYMBOL, E_RANGE
+	E_NONE, E_OR, E_AND, E_NOT,
+	E_EQUAL, E_UNEQUAL, E_LTH, E_LEQ, E_GTH, E_GEQ,
+	E_LIST, E_SYMBOL, E_RANGE
 };
 
 union expr_data {
@@ -72,17 +74,61 @@ enum {
 	S_DEF_COUNT
 };
 
+/*
+ * Represents a configuration symbol.
+ *
+ * Choices are represented as a special kind of symbol and have the
+ * SYMBOL_CHOICE bit set in 'flags'.
+ */
 struct symbol {
+	/* The next symbol in the same bucket in the symbol hash table */
 	struct symbol *next;
+
+	/* The name of the symbol, e.g. "FOO" for 'config FOO' */
 	char *name;
+
+	/* S_BOOLEAN, S_TRISTATE, ... */
 	enum symbol_type type;
+
+	/*
+	 * The calculated value of the symbol. The SYMBOL_VALID bit is set in
+	 * 'flags' when this is up to date. Note that this value might differ
+	 * from the user value set in e.g. a .config file, due to visibility.
+	 */
 	struct symbol_value curr;
+
+	/*
+	 * Values for the symbol provided from outside. def[S_DEF_USER] holds
+	 * the .config value.
+	 */
 	struct symbol_value def[S_DEF_COUNT];
+
+	/*
+	 * An upper bound on the tristate value the user can set for the symbol
+	 * if it is a boolean or tristate. Calculated from prompt dependencies,
+	 * which also inherit dependencies from enclosing menus, choices, and
+	 * ifs. If 'n', the user value will be ignored.
+	 *
+	 * Symbols lacking prompts always have visibility 'n'.
+	 */
 	tristate visible;
+
+	/* SYMBOL_* flags */
 	int flags;
+
+	/* List of properties. See prop_type. */
 	struct property *prop;
+
+	/* Dependencies from enclosing menus, choices, and ifs */
 	struct expr_value dir_dep;
+
+	/* Reverse dependencies through being selected by other symbols */
 	struct expr_value rev_dep;
+
+	/*
+	 * "Weak" reverse dependencies through being implied by other symbols
+	 */
+	struct expr_value implied;
 };
 
 #define for_all_symbols(i, sym) for (i = 0; i < SYMBOL_HASHSIZE; i++) for (sym = symbol_hash[i]; sym; sym = sym->next) if (sym->type != S_OTHER)
@@ -109,6 +155,9 @@ struct symbol {
 /* choice values need to be set before calculating this symbol value */
 #define SYMBOL_NEED_SET_CHOICE_VALUES  0x100000
 
+/* Set symbol to y if allnoconfig; used for symbols that hide others */
+#define SYMBOL_ALLNOCONFIG_Y 0x200000
+
 #define SYMBOL_MAXLENGTH	256
 #define SYMBOL_HASHSIZE		9973
 
@@ -127,10 +176,11 @@ enum prop_type {
 	P_UNKNOWN,
 	P_PROMPT,   /* prompt "foo prompt" or "BAZ Value" */
 	P_COMMENT,  /* text associated with a comment */
-	P_MENU,     /* prompt associated with a menuconfig option */
+	P_MENU,     /* prompt associated with a menu or menuconfig symbol */
 	P_DEFAULT,  /* default y */
 	P_CHOICE,   /* choice value */
 	P_SELECT,   /* select BAR */
+	P_IMPLY,    /* imply BAR */
 	P_RANGE,    /* range 7..100 (for a symbol) */
 	P_ENV,      /* value from environment variable */
 	P_SYMBOL,   /* where a symbol is defined */
@@ -159,22 +209,67 @@ struct property {
 	for (st = sym->prop; st; st = st->next) \
 		if (st->text)
 
+/*
+ * Represents a node in the menu tree, as seen in e.g. menuconfig (though used
+ * for all front ends). Each symbol, menu, etc. defined in the Kconfig files
+ * gets a node. A symbol defined in multiple locations gets one node at each
+ * location.
+ */
 struct menu {
+	/* The next menu node at the same level */
 	struct menu *next;
+
+	/* The parent menu node, corresponding to e.g. a menu or choice */
 	struct menu *parent;
+
+	/* The first child menu node, for e.g. menus and choices */
 	struct menu *list;
+
+	/*
+	 * The symbol associated with the menu node. Choices are implemented as
+	 * a special kind of symbol. NULL for menus, comments, and ifs.
+	 */
 	struct symbol *sym;
+
+	/*
+	 * The prompt associated with the node. This holds the prompt for a
+	 * symbol as well as the text for a menu or comment, along with the
+	 * type (P_PROMPT, P_MENU, etc.)
+	 */
 	struct property *prompt;
+
+	/*
+	 * 'visible if' dependencies. If more than one is given, they will be
+	 * ANDed together.
+	 */
 	struct expr *visibility;
+
+	/*
+	 * Ordinary dependencies from e.g. 'depends on' and 'if', ANDed
+	 * together
+	 */
 	struct expr *dep;
+
+	/* MENU_* flags */
 	unsigned int flags;
+
+	/* Any help text associated with the node */
 	char *help;
+
+	/* The location where the menu node appears in the Kconfig files */
 	struct file *file;
 	int lineno;
+
+	/* For use by front ends that need to store auxiliary data */
 	void *data;
 };
 
+/*
+ * Set on a menu node when the corresponding symbol changes state in some way.
+ * Can be checked by front ends.
+ */
 #define MENU_CHANGED		0x0001
+
 #define MENU_ROOT		0x0002
 
 struct jump_key {
@@ -202,24 +297,20 @@ struct expr *expr_alloc_and(struct expr *e1, struct expr *e2);
 struct expr *expr_alloc_or(struct expr *e1, struct expr *e2);
 struct expr *expr_copy(const struct expr *org);
 void expr_free(struct expr *e);
-int expr_eq(struct expr *e1, struct expr *e2);
 void expr_eliminate_eq(struct expr **ep1, struct expr **ep2);
 tristate expr_calc_value(struct expr *e);
-struct expr *expr_eliminate_yn(struct expr *e);
 struct expr *expr_trans_bool(struct expr *e);
 struct expr *expr_eliminate_dups(struct expr *e);
 struct expr *expr_transform(struct expr *e);
 int expr_contains_symbol(struct expr *dep, struct symbol *sym);
 bool expr_depends_symbol(struct expr *dep, struct symbol *sym);
-struct expr *expr_extract_eq_and(struct expr **ep1, struct expr **ep2);
-struct expr *expr_extract_eq_or(struct expr **ep1, struct expr **ep2);
-void expr_extract_eq(enum expr_type type, struct expr **ep, struct expr **ep1, struct expr **ep2);
 struct expr *expr_trans_compare(struct expr *e, enum expr_type type, struct symbol *sym);
-struct expr *expr_simplify_unmet_dep(struct expr *e1, struct expr *e2);
 
 void expr_fprint(struct expr *e, FILE *out);
 struct gstr; /* forward */
 void expr_gstr_print(struct expr *e, struct gstr *gs);
+void expr_gstr_print_revdep(struct expr *e, struct gstr *gs,
+			    tristate pr_type, const char *title);
 
 static inline int expr_is_yes(struct expr *e)
 {
diff --git a/support/kconfig/gconf.c b/support/kconfig/gconf.c
index 7cbe68eb01..0c2d1c18f9 100644
--- a/support/kconfig/gconf.c
+++ b/support/kconfig/gconf.c
@@ -169,14 +169,6 @@ void init_main_window(const gchar * glade_file)
 	style = gtk_widget_get_style(main_wnd);
 	widget = glade_xml_get_widget(xml, "toolbar1");
 
-#if 0	/* Use stock Gtk icons instead */
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button1", (gchar **) xpm_back);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button2", (gchar **) xpm_load);
-	replace_button_icon(xml, main_wnd->window, style,
-			    "button3", (gchar **) xpm_save);
-#endif
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button4", (gchar **) xpm_single_view);
 	replace_button_icon(xml, main_wnd->window, style,
@@ -184,22 +176,6 @@ void init_main_window(const gchar * glade_file)
 	replace_button_icon(xml, main_wnd->window, style,
 			    "button6", (gchar **) xpm_tree_view);
 
-#if 0
-	switch (view_mode) {
-	case SINGLE_VIEW:
-		widget = glade_xml_get_widget(xml, "button4");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	case SPLIT_VIEW:
-		widget = glade_xml_get_widget(xml, "button5");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	case FULL_VIEW:
-		widget = glade_xml_get_widget(xml, "button6");
-		g_signal_emit_by_name(widget, "clicked");
-		break;
-	}
-#endif
 	txtbuf = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	tag1 = gtk_text_buffer_create_tag(txtbuf, "mytag1",
 					  "foreground", "red",
@@ -938,7 +914,7 @@ on_treeview2_button_press_event(GtkWidget * widget,
 			current = menu;
 			display_tree_part();
 			gtk_widget_set_sensitive(back_btn, TRUE);
-		} else if ((col == COL_OPTION)) {
+		} else if (col == COL_OPTION) {
 			toggle_sym_value(menu);
 			gtk_tree_view_expand_row(view, path, TRUE);
 		}
@@ -1404,7 +1380,7 @@ static void display_tree(struct menu *menu)
 		    && (tree == tree2))
 			continue;
 /*
-                if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
+		if (((menu != &rootmenu) && !(menu->flags & MENU_ROOT))
 		    || (view_mode == FULL_VIEW)
 		    || (view_mode == SPLIT_VIEW))*/
 
@@ -1498,9 +1474,12 @@ int main(int ac, char *av[])
 		case 'a':
 			//showAll = 1;
 			break;
+		case 's':
+			conf_set_message_callback(NULL);
+			break;
 		case 'h':
 		case '?':
-			printf("%s <config>\n", av[0]);
+			printf("%s [-s] <config>\n", av[0]);
 			exit(0);
 		}
 		name = av[2];
diff --git a/support/kconfig/kconf_id.c b/support/kconfig/kconf_id.c
new file mode 100644
index 0000000000..3ea9c5f9f7
--- /dev/null
+++ b/support/kconfig/kconf_id.c
@@ -0,0 +1,53 @@
+
+static struct kconf_id kconf_id_array[] = {
+	{ "mainmenu",		T_MAINMENU,		TF_COMMAND },
+	{ "menu",		T_MENU,			TF_COMMAND },
+	{ "endmenu",		T_ENDMENU,		TF_COMMAND },
+	{ "source",		T_SOURCE,		TF_COMMAND },
+	{ "choice",		T_CHOICE,		TF_COMMAND },
+	{ "endchoice",		T_ENDCHOICE,		TF_COMMAND },
+	{ "comment",		T_COMMENT,		TF_COMMAND },
+	{ "config",		T_CONFIG,		TF_COMMAND },
+	{ "menuconfig",		T_MENUCONFIG,		TF_COMMAND },
+	{ "help",		T_HELP,			TF_COMMAND },
+	{ "---help---",		T_HELP,			TF_COMMAND },
+	{ "if",			T_IF,			TF_COMMAND|TF_PARAM },
+	{ "endif",		T_ENDIF,		TF_COMMAND },
+	{ "depends",		T_DEPENDS,		TF_COMMAND },
+	{ "optional",		T_OPTIONAL,		TF_COMMAND },
+	{ "default",		T_DEFAULT,		TF_COMMAND, S_UNKNOWN },
+	{ "prompt",		T_PROMPT,		TF_COMMAND },
+	{ "tristate",		T_TYPE,			TF_COMMAND, S_TRISTATE },
+	{ "def_tristate",	T_DEFAULT,		TF_COMMAND, S_TRISTATE },
+	{ "bool",		T_TYPE,			TF_COMMAND, S_BOOLEAN },
+	{ "def_bool",		T_DEFAULT,		TF_COMMAND, S_BOOLEAN },
+	{ "int",		T_TYPE,			TF_COMMAND, S_INT },
+	{ "hex",		T_TYPE,			TF_COMMAND, S_HEX },
+	{ "string",		T_TYPE,			TF_COMMAND, S_STRING },
+	{ "select",		T_SELECT,		TF_COMMAND },
+	{ "imply",		T_IMPLY,		TF_COMMAND },
+	{ "range",		T_RANGE,		TF_COMMAND },
+	{ "visible",		T_VISIBLE,		TF_COMMAND },
+	{ "option",		T_OPTION,		TF_COMMAND },
+	{ "on",			T_ON,			TF_PARAM },
+	{ "modules",		T_OPT_MODULES,		TF_OPTION },
+	{ "defconfig_list",	T_OPT_DEFCONFIG_LIST,	TF_OPTION },
+	{ "env",		T_OPT_ENV,		TF_OPTION },
+	{ "allnoconfig_y",	T_OPT_ALLNOCONFIG_Y,	TF_OPTION },
+};
+
+#define KCONF_ID_ARRAY_SIZE (sizeof(kconf_id_array)/sizeof(struct kconf_id))
+
+static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len)
+{
+	int i;
+
+	for (i = 0; i < KCONF_ID_ARRAY_SIZE; i++) {
+		struct kconf_id *id = kconf_id_array+i;
+		int l = strlen(id->name);
+
+		if (len == l && !memcmp(str, id->name, len))
+			return id;
+	}
+	return NULL;
+}
diff --git a/support/kconfig/kxgettext.c b/support/kconfig/kxgettext.c
index 2858738b22..240880a891 100644
--- a/support/kconfig/kxgettext.c
+++ b/support/kconfig/kxgettext.c
@@ -101,7 +101,7 @@ static struct message *message__new(const char *msg, char *option,
 	if (self->files == NULL)
 		goto out_fail;
 
-	self->msg = strdup(msg);
+	self->msg = xstrdup(msg);
 	if (self->msg == NULL)
 		goto out_fail_msg;
 
diff --git a/support/kconfig/list.h b/support/kconfig/list.h
index 685d80e1bb..45cb237ab7 100644
--- a/support/kconfig/list.h
+++ b/support/kconfig/list.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef LIST_H
 #define LIST_H
 
@@ -34,7 +35,7 @@ struct list_head {
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
  * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_entry(ptr, type, member) \
 	container_of(ptr, type, member)
@@ -43,7 +44,7 @@ struct list_head {
  * list_for_each_entry	-	iterate over list of given type
  * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry(pos, head, member)				\
 	for (pos = list_entry((head)->next, typeof(*pos), member);	\
@@ -55,7 +56,7 @@ struct list_head {
  * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)			\
 	for (pos = list_entry((head)->next, typeof(*pos), member),	\
diff --git a/support/kconfig/lkc.h b/support/kconfig/lkc.h
index 09f4edfdc9..f4394af6e4 100644
--- a/support/kconfig/lkc.h
+++ b/support/kconfig/lkc.h
@@ -21,9 +21,7 @@ static inline char *bind_textdomain_codeset(const char *dn, char *c) { return c;
 extern "C" {
 #endif
 
-#define P(name,type,arg)	extern type name arg
 #include "lkc_proto.h"
-#undef P
 
 #define SRCTREE "srctree"
 
@@ -61,17 +59,16 @@ enum conf_def_mode {
 #define T_OPT_MODULES		1
 #define T_OPT_DEFCONFIG_LIST	2
 #define T_OPT_ENV		3
+#define T_OPT_ALLNOCONFIG_Y	4
 
 struct kconf_id {
-	int name;
+	const char *name;
 	int token;
 	unsigned int flags;
 	enum symbol_type stype;
 };
 
-extern int zconfdebug;
-
-int zconfparse(void);
+extern int yylineno;
 void zconfdump(FILE *out);
 void zconf_starthelp(void);
 FILE *zconf_fopen(const char *name);
@@ -89,11 +86,6 @@ void sym_add_change_count(int count);
 bool conf_set_all_new_symbols(enum conf_def_mode mode);
 void set_all_choice_values(struct symbol *csym);
 
-struct conf_printer {
-	void (*print_symbol)(FILE *, struct symbol *, const char *, void *);
-	void (*print_comment)(FILE *, const char *, void *);
-};
-
 /* confdata.c and expr.c */
 static inline void xfwrite(const void *str, size_t len, size_t count, FILE *out)
 {
@@ -109,10 +101,8 @@ void menu_warn(struct menu *menu, const char *fmt, ...);
 struct menu *menu_add_menu(void);
 void menu_end_menu(void);
 void menu_add_entry(struct symbol *sym);
-void menu_end_entry(void);
 void menu_add_dep(struct expr *dep);
 void menu_add_visibility(struct expr *dep);
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep);
 struct property *menu_add_prompt(enum prop_type type, char *prompt, struct expr *dep);
 void menu_add_expr(enum prop_type type, struct expr *expr, struct expr *dep);
 void menu_add_symbol(enum prop_type type, struct symbol *sym, struct expr *dep);
@@ -125,6 +115,8 @@ struct file *file_lookup(const char *name);
 int file_write_dep(const char *name);
 void *xmalloc(size_t size);
 void *xcalloc(size_t nmemb, size_t size);
+void *xrealloc(void *p, size_t size);
+char *xstrdup(const char *s);
 
 struct gstr {
 	size_t len;
@@ -136,7 +128,6 @@ struct gstr {
 	int max_width;
 };
 struct gstr str_new(void);
-struct gstr str_assign(const char *s);
 void str_free(struct gstr *gs);
 void str_append(struct gstr *gs, const char *s);
 void str_printf(struct gstr *gs, const char *fmt, ...);
@@ -147,8 +138,6 @@ extern struct expr *sym_env_list;
 
 void sym_init(void);
 void sym_clear_all_valid(void);
-void sym_set_all_changed(void);
-void sym_set_changed(struct symbol *sym);
 struct symbol *sym_choice_default(struct symbol *sym);
 const char *sym_get_string_default(struct symbol *sym);
 struct symbol *sym_check_deps(struct symbol *sym);
diff --git a/support/kconfig/lkc_proto.h b/support/kconfig/lkc_proto.h
index ecdb9659b6..9dc8abfb1d 100644
--- a/support/kconfig/lkc_proto.h
+++ b/support/kconfig/lkc_proto.h
@@ -1,57 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #include <stdarg.h>
 
 /* confdata.c */
-P(conf_parse,void,(const char *name));
-P(conf_read,int,(const char *name));
-P(conf_read_simple,int,(const char *name, int));
-P(conf_write_defconfig,int,(const char *name));
-P(conf_write,int,(const char *name));
-P(conf_write_autoconf,int,(void));
-P(conf_get_changed,bool,(void));
-P(conf_set_changed_callback, void,(void (*fn)(void)));
-P(conf_set_message_callback, void,(void (*fn)(const char *fmt, va_list ap)));
+void conf_parse(const char *name);
+int conf_read(const char *name);
+int conf_read_simple(const char *name, int);
+int conf_write_defconfig(const char *name);
+int conf_write(const char *name);
+int conf_write_autoconf(void);
+bool conf_get_changed(void);
+void conf_set_changed_callback(void (*fn)(void));
+void conf_set_message_callback(void (*fn)(const char *fmt, va_list ap));
 
 /* menu.c */
-P(rootmenu,struct menu,);
+extern struct menu rootmenu;
 
-P(menu_is_empty, bool, (struct menu *menu));
-P(menu_is_visible, bool, (struct menu *menu));
-P(menu_has_prompt, bool, (struct menu *menu));
-P(menu_get_prompt,const char *,(struct menu *menu));
-P(menu_get_root_menu,struct menu *,(struct menu *menu));
-P(menu_get_parent_menu,struct menu *,(struct menu *menu));
-P(menu_has_help,bool,(struct menu *menu));
-P(menu_get_help,const char *,(struct menu *menu));
-P(get_symbol_str, void, (struct gstr *r, struct symbol *sym, struct list_head
-			 *head));
-P(get_relations_str, struct gstr, (struct symbol **sym_arr, struct list_head
-				   *head));
-P(menu_get_ext_help,void,(struct menu *menu, struct gstr *help));
+bool menu_is_empty(struct menu *menu);
+bool menu_is_visible(struct menu *menu);
+bool menu_has_prompt(struct menu *menu);
+const char * menu_get_prompt(struct menu *menu);
+struct menu * menu_get_root_menu(struct menu *menu);
+struct menu * menu_get_parent_menu(struct menu *menu);
+bool menu_has_help(struct menu *menu);
+const char * menu_get_help(struct menu *menu);
+struct gstr get_relations_str(struct symbol **sym_arr, struct list_head *head);
+void menu_get_ext_help(struct menu *menu, struct gstr *help);
 
 /* symbol.c */
-P(symbol_hash,struct symbol *,[SYMBOL_HASHSIZE]);
+extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
-P(sym_lookup,struct symbol *,(const char *name, int flags));
-P(sym_find,struct symbol *,(const char *name));
-P(sym_expand_string_value,const char *,(const char *in));
-P(sym_escape_string_value, const char *,(const char *in));
-P(sym_re_search,struct symbol **,(const char *pattern));
-P(sym_type_name,const char *,(enum symbol_type type));
-P(sym_calc_value,void,(struct symbol *sym));
-P(sym_get_type,enum symbol_type,(struct symbol *sym));
-P(sym_tristate_within_range,bool,(struct symbol *sym,tristate tri));
-P(sym_set_tristate_value,bool,(struct symbol *sym,tristate tri));
-P(sym_toggle_tristate_value,tristate,(struct symbol *sym));
-P(sym_string_valid,bool,(struct symbol *sym, const char *newval));
-P(sym_string_within_range,bool,(struct symbol *sym, const char *str));
-P(sym_set_string_value,bool,(struct symbol *sym, const char *newval));
-P(sym_is_changable,bool,(struct symbol *sym));
-P(sym_get_choice_prop,struct property *,(struct symbol *sym));
-P(sym_get_default_prop,struct property *,(struct symbol *sym));
-P(sym_get_string_value,const char *,(struct symbol *sym));
+struct symbol * sym_lookup(const char *name, int flags);
+struct symbol * sym_find(const char *name);
+char *sym_expand_string_value(const char *in);
+const char * sym_escape_string_value(const char *in);
+struct symbol ** sym_re_search(const char *pattern);
+const char * sym_type_name(enum symbol_type type);
+void sym_calc_value(struct symbol *sym);
+enum symbol_type sym_get_type(struct symbol *sym);
+bool sym_tristate_within_range(struct symbol *sym,tristate tri);
+bool sym_set_tristate_value(struct symbol *sym,tristate tri);
+tristate sym_toggle_tristate_value(struct symbol *sym);
+bool sym_string_valid(struct symbol *sym, const char *newval);
+bool sym_string_within_range(struct symbol *sym, const char *str);
+bool sym_set_string_value(struct symbol *sym, const char *newval);
+bool sym_is_changable(struct symbol *sym);
+struct property * sym_get_choice_prop(struct symbol *sym);
+const char * sym_get_string_value(struct symbol *sym);
 
-P(prop_get_type_name,const char *,(enum prop_type type));
+const char * prop_get_type_name(enum prop_type type);
 
 /* expr.c */
-P(expr_compare_type,int,(enum expr_type t1, enum expr_type t2));
-P(expr_print,void,(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken));
+void expr_print(struct expr *e, void (*fn)(void *, struct symbol *, const char *), void *data, int prevtoken);
diff --git a/support/kconfig/lxdialog/check-lxdialog.sh b/support/kconfig/lxdialog/check-lxdialog.sh
index 3ce0a23349..16cd9a3186 100755
--- a/support/kconfig/lxdialog/check-lxdialog.sh
+++ b/support/kconfig/lxdialog/check-lxdialog.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
 # Check ncurses compatibility
 
 # What library to link
@@ -54,7 +55,8 @@ EOF
 	    echo " *** required header files."                            1>&2
 	    echo " *** 'make menuconfig' requires the ncurses libraries." 1>&2
 	    echo " *** "                                                  1>&2
-	    echo " *** Install ncurses (ncurses-devel) and try again."    1>&2
+	    echo " *** Install ncurses (ncurses-devel or libncurses-dev " 1>&2
+	    echo " *** depending on your distribution) and try again."    1>&2
 	    echo " *** "                                                  1>&2
 	    exit 1
 	fi
diff --git a/support/kconfig/lxdialog/checklist.c b/support/kconfig/lxdialog/checklist.c
index 3b15c08ec1..8d016faa28 100644
--- a/support/kconfig/lxdialog/checklist.c
+++ b/support/kconfig/lxdialog/checklist.c
@@ -168,13 +168,13 @@ do_resize:
 
 	/* create new window for the list */
 	list = subwin(dialog, list_height, list_width, y + box_y + 1,
-	              x + box_x + 1);
+		      x + box_x + 1);
 
 	keypad(list, TRUE);
 
 	/* draw a box around the list items */
 	draw_box(dialog, box_y, box_x, list_height + 2, list_width + 2,
-	         dlg.menubox_border.atr, dlg.menubox.atr);
+		 dlg.menubox_border.atr, dlg.menubox.atr);
 
 	/* Find length of longest item in order to center checklist */
 	check_x = 0;
diff --git a/support/kconfig/lxdialog/dialog.h b/support/kconfig/lxdialog/dialog.h
index b4343d3849..fcffd5b41f 100644
--- a/support/kconfig/lxdialog/dialog.h
+++ b/support/kconfig/lxdialog/dialog.h
@@ -170,7 +170,7 @@ char item_tag(void);
 /* item list manipulation for lxdialog use */
 #define MAXITEMSTR 200
 struct dialog_item {
-	char str[MAXITEMSTR];	/* promtp displayed */
+	char str[MAXITEMSTR];	/* prompt displayed */
 	char tag;
 	void *data;	/* pointer to menu item - used by menubox+checklist */
 	int selected;	/* Set to 1 by dialog_*() function if selected. */
diff --git a/support/kconfig/lxdialog/inputbox.c b/support/kconfig/lxdialog/inputbox.c
index 447a582198..d58de1dc53 100644
--- a/support/kconfig/lxdialog/inputbox.c
+++ b/support/kconfig/lxdialog/inputbox.c
@@ -42,7 +42,7 @@ static void print_buttons(WINDOW * dialog, int height, int width, int selected)
  * Display a dialog box for inputing a string
  */
 int dialog_inputbox(const char *title, const char *prompt, int height, int width,
-                    const char *init)
+		    const char *init)
 {
 	int i, x, y, box_y, box_x, box_width;
 	int input_x = 0, key = 0, button = -1;
diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
index b0d0d698e1..185524901d 100644
--- a/support/kconfig/lxdialog/menubox.c
+++ b/support/kconfig/lxdialog/menubox.c
@@ -64,7 +64,7 @@ static int menu_width, item_x;
  * Print menu item
  */
 static void do_print_item(WINDOW * win, const char *item, int line_y,
-                          int selected, int hotkey)
+			  int selected, int hotkey)
 {
 	int j;
 	char *menu_item = malloc(menu_width + 1);
@@ -182,7 +182,7 @@ static void do_scroll(WINDOW *win, int *scroll, int n)
  * Display a menu for choosing among a number of options
  */
 int dialog_menu(const char *title, const char *prompt,
-                const void *selected, int *s_scroll)
+		const void *selected, int *s_scroll)
 {
 	int i, j, x, y, box_x, box_y;
 	int height, width, menu_height;
diff --git a/support/kconfig/lxdialog/util.c b/support/kconfig/lxdialog/util.c
index 58a8289dd6..f7abdeb92a 100644
--- a/support/kconfig/lxdialog/util.c
+++ b/support/kconfig/lxdialog/util.c
@@ -623,7 +623,7 @@ void item_make(const char *fmt, ...)
 void item_add_str(const char *fmt, ...)
 {
 	va_list ap;
-        size_t avail;
+	size_t avail;
 
 	avail = sizeof(item_cur->node.str) - strlen(item_cur->node.str);
 
diff --git a/support/kconfig/mconf.c b/support/kconfig/mconf.c
index 91c4df78f3..279f4552a1 100644
--- a/support/kconfig/mconf.c
+++ b/support/kconfig/mconf.c
@@ -246,7 +246,7 @@ search_help[] = N_(
 	"  Selected by: BAR [=n]\n"
 	"-----------------------------------------------------------------\n"
 	"o The line 'Type:' shows the type of the configuration option for\n"
-	"  this symbol (boolean, tristate, string, ...)\n"
+	"  this symbol (bool, tristate, string, ...)\n"
 	"o The line 'Prompt:' shows the text used in the menu structure for\n"
 	"  this symbol\n"
 	"o The 'Defined at' line tells at what file / line number the symbol\n"
@@ -279,6 +279,7 @@ static int child_count;
 static int single_menu_mode;
 static int show_all_options;
 static int save_and_exit;
+static int silent;
 
 static void conf(struct menu *menu, struct menu *active_menu);
 static void conf_choice(struct menu *menu);
@@ -299,7 +300,7 @@ static void set_config_filename(const char *config_filename)
 	int size;
 
 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
-	                "%s - %s", config_filename, rootmenu.prompt->text);
+			"%s - %s", config_filename, rootmenu.prompt->text);
 	if (size >= sizeof(menu_backtitle))
 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
 	set_dialog_backtitle(menu_backtitle);
@@ -330,10 +331,10 @@ static void set_subtitle(void)
 	list_for_each_entry(sp, &trail, entries) {
 		if (sp->text) {
 			if (pos) {
-				pos->next = xcalloc(sizeof(*pos), 1);
+				pos->next = xcalloc(1, sizeof(*pos));
 				pos = pos->next;
 			} else {
-				subtitles = pos = xcalloc(sizeof(*pos), 1);
+				subtitles = pos = xcalloc(1, sizeof(*pos));
 			}
 			pos->text = sp->text;
 		}
@@ -777,10 +778,12 @@ static void conf_message_callback(const char *fmt, va_list ap)
 	char buf[PATH_MAX+1];
 
 	vsnprintf(buf, sizeof(buf), fmt, ap);
-	if (save_and_exit)
-		printf("%s", buf);
-	else
+	if (save_and_exit) {
+		if (!silent)
+			printf("%s", buf);
+	} else {
 		show_textbox(NULL, buf, 6, 60);
+	}
 }
 
 static void show_help(struct menu *menu)
@@ -977,16 +980,18 @@ static int handle_exit(void)
 		}
 		/* fall through */
 	case -1:
-		printf(_("\n\n"
-			 "*** End of the configuration.\n"
-			 "*** Execute 'make' to start the build or try 'make help'."
-			 "\n\n"));
+		if (!silent)
+			printf(_("\n\n"
+				 "*** End of the configuration.\n"
+				 "*** Execute 'make' to start the build or try 'make help'."
+				 "\n\n"));
 		res = 0;
 		break;
 	default:
-		fprintf(stderr, _("\n\n"
-				  "Your configuration changes were NOT saved."
-				  "\n\n"));
+		if (!silent)
+			fprintf(stderr, _("\n\n"
+					  "Your configuration changes were NOT saved."
+					  "\n\n"));
 		if (res != KEY_ESC)
 			res = 0;
 	}
@@ -1010,6 +1015,12 @@ int main(int ac, char **av)
 
 	signal(SIGINT, sig_handler);
 
+	if (ac > 1 && strcmp(av[1], "-s") == 0) {
+		silent = 1;
+		/* Silence conf_read() until the real callback is set up */
+		conf_set_message_callback(NULL);
+		av++;
+	}
 	conf_parse(av[1]);
 	conf_read(NULL);
 
@@ -1034,4 +1045,3 @@ int main(int ac, char **av)
 
 	return res;
 }
-
diff --git a/support/kconfig/menu.c b/support/kconfig/menu.c
index db1512ae30..5c5c1374b1 100644
--- a/support/kconfig/menu.c
+++ b/support/kconfig/menu.c
@@ -62,13 +62,8 @@ void menu_add_entry(struct symbol *sym)
 		menu_add_symbol(P_SYMBOL, sym, NULL);
 }
 
-void menu_end_entry(void)
-{
-}
-
 struct menu *menu_add_menu(void)
 {
-	menu_end_entry();
 	last_entry_ptr = &current_entry->list;
 	return current_menu = current_entry;
 }
@@ -79,19 +74,23 @@ void menu_end_menu(void)
 	current_menu = current_menu->parent;
 }
 
-static struct expr *menu_check_dep(struct expr *e)
+/*
+ * Rewrites 'm' to 'm' && MODULES, so that it evaluates to 'n' when running
+ * without modules
+ */
+static struct expr *rewrite_m(struct expr *e)
 {
 	if (!e)
 		return e;
 
 	switch (e->type) {
 	case E_NOT:
-		e->left.expr = menu_check_dep(e->left.expr);
+		e->left.expr = rewrite_m(e->left.expr);
 		break;
 	case E_OR:
 	case E_AND:
-		e->left.expr = menu_check_dep(e->left.expr);
-		e->right.expr = menu_check_dep(e->right.expr);
+		e->left.expr = rewrite_m(e->left.expr);
+		e->right.expr = rewrite_m(e->right.expr);
 		break;
 	case E_SYMBOL:
 		/* change 'm' into 'm' && MODULES */
@@ -106,7 +105,7 @@ static struct expr *menu_check_dep(struct expr *e)
 
 void menu_add_dep(struct expr *dep)
 {
-	current_entry->dep = expr_alloc_and(current_entry->dep, menu_check_dep(dep));
+	current_entry->dep = expr_alloc_and(current_entry->dep, dep);
 }
 
 void menu_set_type(int type)
@@ -125,13 +124,13 @@ void menu_set_type(int type)
 		sym_type_name(sym->type), sym_type_name(type));
 }
 
-struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
+static struct property *menu_add_prop(enum prop_type type, char *prompt, struct expr *expr, struct expr *dep)
 {
 	struct property *prop = prop_alloc(type, current_entry->sym);
 
 	prop->menu = current_entry;
 	prop->expr = expr;
-	prop->visible.expr = menu_check_dep(dep);
+	prop->visible.expr = dep;
 
 	if (prompt) {
 		if (isspace(*prompt)) {
@@ -213,10 +212,14 @@ void menu_add_option(int token, char *arg)
 			sym_defconfig_list = current_entry->sym;
 		else if (sym_defconfig_list != current_entry->sym)
 			zconf_error("trying to redefine defconfig symbol");
+		sym_defconfig_list->flags |= SYMBOL_AUTO;
 		break;
 	case T_OPT_ENV:
 		prop_add_env(arg);
 		break;
+	case T_OPT_ALLNOCONFIG_Y:
+		current_entry->sym->flags |= SYMBOL_ALLNOCONFIG_Y;
+		break;
 	}
 }
 
@@ -230,6 +233,8 @@ static void sym_check_prop(struct symbol *sym)
 {
 	struct property *prop;
 	struct symbol *sym2;
+	char *use;
+
 	for (prop = sym->prop; prop; prop = prop->next) {
 		switch (prop->type) {
 		case P_DEFAULT:
@@ -247,25 +252,37 @@ static void sym_check_prop(struct symbol *sym)
 					    "'%s': number is invalid",
 					    sym->name);
 			}
+			if (sym_is_choice(sym)) {
+				struct property *choice_prop =
+					sym_get_choice_prop(sym2);
+
+				if (!choice_prop ||
+				    prop_get_symbol(choice_prop) != sym)
+					prop_warn(prop,
+						  "choice default symbol '%s' is not contained in the choice",
+						  sym2->name);
+			}
 			break;
 		case P_SELECT:
+		case P_IMPLY:
+			use = prop->type == P_SELECT ? "select" : "imply";
 			sym2 = prop_get_symbol(prop);
 			if (sym->type != S_BOOLEAN && sym->type != S_TRISTATE)
 				prop_warn(prop,
-				    "config symbol '%s' uses select, but is "
-				    "not boolean or tristate", sym->name);
+				    "config symbol '%s' uses %s, but is "
+				    "not bool or tristate", sym->name, use);
 			else if (sym2->type != S_UNKNOWN &&
-			         sym2->type != S_BOOLEAN &&
-			         sym2->type != S_TRISTATE)
+				 sym2->type != S_BOOLEAN &&
+				 sym2->type != S_TRISTATE)
 				prop_warn(prop,
-				    "'%s' has wrong type. 'select' only "
-				    "accept arguments of boolean and "
-				    "tristate type", sym2->name);
+				    "'%s' has wrong type. '%s' only "
+				    "accept arguments of bool and "
+				    "tristate type", sym2->name, use);
 			break;
 		case P_RANGE:
 			if (sym->type != S_INT && sym->type != S_HEX)
 				prop_warn(prop, "range is only allowed "
-				                "for int or hex symbols");
+						"for int or hex symbols");
 			if (!menu_validate_number(sym, prop->expr->left.sym) ||
 			    !menu_validate_number(sym, prop->expr->right.sym))
 				prop_warn(prop, "range is invalid");
@@ -285,6 +302,11 @@ void menu_finalize(struct menu *parent)
 
 	sym = parent->sym;
 	if (parent->list) {
+		/*
+		 * This menu node has children. We (recursively) process them
+		 * and propagate parent dependencies before moving on.
+		 */
+
 		if (sym && sym_is_choice(sym)) {
 			if (sym->type == S_UNKNOWN) {
 				/* find the first choice value to find out choice type */
@@ -302,65 +324,169 @@ void menu_finalize(struct menu *parent)
 				if (menu->sym && menu->sym->type == S_UNKNOWN)
 					menu_set_type(sym->type);
 			}
+
+			/*
+			 * Use the choice itself as the parent dependency of
+			 * the contained items. This turns the mode of the
+			 * choice into an upper bound on the visibility of the
+			 * choice value symbols.
+			 */
 			parentdep = expr_alloc_symbol(sym);
 		} else if (parent->prompt)
+			/* Menu node for 'menu' */
 			parentdep = parent->prompt->visible.expr;
 		else
+			/* Menu node for 'if' */
 			parentdep = parent->dep;
 
+		/* For each child menu node... */
 		for (menu = parent->list; menu; menu = menu->next) {
-			basedep = expr_transform(menu->dep);
+			/*
+			 * Propagate parent dependencies to the child menu
+			 * node, also rewriting and simplifying expressions
+			 */
+			basedep = rewrite_m(menu->dep);
+			basedep = expr_transform(basedep);
 			basedep = expr_alloc_and(expr_copy(parentdep), basedep);
 			basedep = expr_eliminate_dups(basedep);
 			menu->dep = basedep;
+
 			if (menu->sym)
+				/*
+				 * Note: For symbols, all prompts are included
+				 * too in the symbol's own property list
+				 */
 				prop = menu->sym->prop;
 			else
+				/*
+				 * For non-symbol menu nodes, we just need to
+				 * handle the prompt
+				 */
 				prop = menu->prompt;
+
+			/* For each property... */
 			for (; prop; prop = prop->next) {
 				if (prop->menu != menu)
+					/*
+					 * Two possibilities:
+					 *
+					 * 1. The property lacks dependencies
+					 *    and so isn't location-specific,
+					 *    e.g. an 'option'
+					 *
+					 * 2. The property belongs to a symbol
+					 *    defined in multiple locations and
+					 *    is from some other location. It
+					 *    will be handled there in that
+					 *    case.
+					 *
+					 * Skip the property.
+					 */
 					continue;
-				dep = expr_transform(prop->visible.expr);
+
+				/*
+				 * Propagate parent dependencies to the
+				 * property's condition, rewriting and
+				 * simplifying expressions at the same time
+				 */
+				dep = rewrite_m(prop->visible.expr);
+				dep = expr_transform(dep);
 				dep = expr_alloc_and(expr_copy(basedep), dep);
 				dep = expr_eliminate_dups(dep);
 				if (menu->sym && menu->sym->type != S_TRISTATE)
 					dep = expr_trans_bool(dep);
 				prop->visible.expr = dep;
+
+				/*
+				 * Handle selects and implies, which modify the
+				 * dependencies of the selected/implied symbol
+				 */
 				if (prop->type == P_SELECT) {
 					struct symbol *es = prop_get_symbol(prop);
 					es->rev_dep.expr = expr_alloc_or(es->rev_dep.expr,
 							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
+				} else if (prop->type == P_IMPLY) {
+					struct symbol *es = prop_get_symbol(prop);
+					es->implied.expr = expr_alloc_or(es->implied.expr,
+							expr_alloc_and(expr_alloc_symbol(menu->sym), expr_copy(dep)));
 				}
 			}
 		}
+
+		if (sym && sym_is_choice(sym))
+			expr_free(parentdep);
+
+		/*
+		 * Recursively process children in the same fashion before
+		 * moving on
+		 */
 		for (menu = parent->list; menu; menu = menu->next)
 			menu_finalize(menu);
 	} else if (sym) {
+		/*
+		 * Automatic submenu creation. If sym is a symbol and A, B, C,
+		 * ... are consecutive items (symbols, menus, ifs, etc.) that
+		 * all depend on sym, then the following menu structure is
+		 * created:
+		 *
+		 *	sym
+		 *	 +-A
+		 *	 +-B
+		 *	 +-C
+		 *	 ...
+		 *
+		 * This also works recursively, giving the following structure
+		 * if A is a symbol and B depends on A:
+		 *
+		 *	sym
+		 *	 +-A
+		 *	 | +-B
+		 *	 +-C
+		 *	 ...
+		 */
+
 		basedep = parent->prompt ? parent->prompt->visible.expr : NULL;
 		basedep = expr_trans_compare(basedep, E_UNEQUAL, &symbol_no);
 		basedep = expr_eliminate_dups(expr_transform(basedep));
+
+		/* Examine consecutive elements after sym */
 		last_menu = NULL;
 		for (menu = parent->next; menu; menu = menu->next) {
 			dep = menu->prompt ? menu->prompt->visible.expr : menu->dep;
 			if (!expr_contains_symbol(dep, sym))
+				/* No dependency, quit */
 				break;
 			if (expr_depends_symbol(dep, sym))
+				/* Absolute dependency, put in submenu */
 				goto next;
+
+			/*
+			 * Also consider it a dependency on sym if our
+			 * dependencies contain sym and are a "superset" of
+			 * sym's dependencies, e.g. '(sym || Q) && R' when sym
+			 * depends on R.
+			 *
+			 * Note that 'R' might be from an enclosing menu or if,
+			 * making this a more common case than it might seem.
+			 */
 			dep = expr_trans_compare(dep, E_UNEQUAL, &symbol_no);
 			dep = expr_eliminate_dups(expr_transform(dep));
 			dep2 = expr_copy(basedep);
 			expr_eliminate_eq(&dep, &dep2);
 			expr_free(dep);
 			if (!expr_is_yes(dep2)) {
+				/* Not superset, quit */
 				expr_free(dep2);
 				break;
 			}
+			/* Superset, put in submenu */
 			expr_free(dep2);
 		next:
 			menu_finalize(menu);
 			menu->parent = parent;
 			last_menu = menu;
 		}
+		expr_free(basedep);
 		if (last_menu) {
 			parent->list = parent->next;
 			parent->next = last_menu->next;
@@ -409,6 +535,35 @@ void menu_finalize(struct menu *parent)
 			*ep = expr_alloc_one(E_LIST, NULL);
 			(*ep)->right.sym = menu->sym;
 		}
+
+		/*
+		 * This code serves two purposes:
+		 *
+		 * (1) Flattening 'if' blocks, which do not specify a submenu
+		 *     and only add dependencies.
+		 *
+		 *     (Automatic submenu creation might still create a submenu
+		 *     from an 'if' before this code runs.)
+		 *
+		 * (2) "Undoing" any automatic submenus created earlier below
+		 *     promptless symbols.
+		 *
+		 * Before:
+		 *
+		 *	A
+		 *	if ... (or promptless symbol)
+		 *	 +-B
+		 *	 +-C
+		 *	D
+		 *
+		 * After:
+		 *
+		 *	A
+		 *	if ... (or promptless symbol)
+		 *	B
+		 *	C
+		 *	D
+		 */
 		if (menu->list && (!menu->prompt || !menu->prompt->text)) {
 			for (last_menu = menu->list; ; last_menu = last_menu->next) {
 				last_menu->parent = parent;
@@ -433,6 +588,15 @@ void menu_finalize(struct menu *parent)
 		sym->flags |= SYMBOL_WARNED;
 	}
 
+	/*
+	 * For non-optional choices, add a reverse dependency (corresponding to
+	 * a select) of '<visibility> && m'. This prevents the user from
+	 * setting the choice mode to 'n' when the choice is visible.
+	 *
+	 * This would also work for non-choice symbols, but only non-optional
+	 * choices clear SYMBOL_OPTIONAL as of writing. Choices are implemented
+	 * as a type of symbol.
+	 */
 	if (sym && !sym_is_optional(sym) && parent->prompt) {
 		sym->rev_dep.expr = expr_alloc_or(sym->rev_dep.expr,
 				expr_alloc_and(parent->prompt->visible.expr,
@@ -474,7 +638,7 @@ bool menu_is_visible(struct menu *menu)
 
 	if (menu->visibility) {
 		if (expr_calc_value(menu->visibility) == no)
-			return no;
+			return false;
 	}
 
 	sym = menu->sym;
@@ -545,7 +709,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 {
 	int i, j;
 	struct menu *submenu[8], *menu, *location = NULL;
-	struct jump_key *jump;
+	struct jump_key *jump = NULL;
 
 	str_printf(r, _("Prompt: %s\n"), _(prop->text));
 	menu = prop->menu->parent;
@@ -583,7 +747,7 @@ static void get_prompt_str(struct gstr *r, struct property *prop,
 		str_printf(r, _("  Location:\n"));
 		for (j = 4; --i >= 0; j += 2) {
 			menu = submenu[i];
-			if (head && location && menu == location)
+			if (jump && menu == location)
 				jump->offset = strlen(r->s);
 			str_printf(r, "%*c-> %s", j, ' ',
 				   _(menu_get_prompt(menu)));
@@ -609,13 +773,30 @@ static struct property *get_symbol_prop(struct symbol *sym)
 	return prop;
 }
 
+static void get_symbol_props_str(struct gstr *r, struct symbol *sym,
+				 enum prop_type tok, const char *prefix)
+{
+	bool hit = false;
+	struct property *prop;
+
+	for_all_properties(sym, prop, tok) {
+		if (!hit) {
+			str_append(r, prefix);
+			hit = true;
+		} else
+			str_printf(r, " && ");
+		expr_gstr_print(prop->expr, r);
+	}
+	if (hit)
+		str_append(r, "\n");
+}
+
 /*
  * head is optional and may be NULL
  */
-void get_symbol_str(struct gstr *r, struct symbol *sym,
+static void get_symbol_str(struct gstr *r, struct symbol *sym,
 		    struct list_head *head)
 {
-	bool hit;
 	struct property *prop;
 
 	if (sym && sym->name) {
@@ -645,22 +826,20 @@ void get_symbol_str(struct gstr *r, struct symbol *sym,
 		}
 	}
 
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
+	get_symbol_props_str(r, sym, P_SELECT, _("  Selects: "));
 	if (sym->rev_dep.expr) {
-		str_append(r, _("  Selected by: "));
-		expr_gstr_print(sym->rev_dep.expr, r);
-		str_append(r, "\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, yes, "  Selected by [y]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, mod, "  Selected by [m]:\n");
+		expr_gstr_print_revdep(sym->rev_dep.expr, r, no, "  Selected by [n]:\n");
 	}
+
+	get_symbol_props_str(r, sym, P_IMPLY, _("  Implies: "));
+	if (sym->implied.expr) {
+		expr_gstr_print_revdep(sym->implied.expr, r, yes, "  Implied by [y]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, mod, "  Implied by [m]:\n");
+		expr_gstr_print_revdep(sym->implied.expr, r, no, "  Implied by [n]:\n");
+	}
+
 	str_append(r, "\n\n");
 }
 
diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index e1d7ffa7b5..67d1314476 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -32,11 +32,10 @@ usage() {
 	echo "  -m    only merge the fragments, do not execute the make command"
 	echo "  -n    use allnoconfig instead of alldefconfig"
 	echo "  -r    list redundant entries when merging fragments"
-	echo "  -O    dir to put generated output files"
-	echo "  -e    colon-separated list of br2-external trees to use (optional)"
+	echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
 }
 
-MAKE=true
+RUNMAKE=true
 ALLTARGET=alldefconfig
 WARNREDUN=false
 OUTPUT=.
@@ -49,7 +48,7 @@ while true; do
 		continue
 		;;
 	"-m")
-		MAKE=false
+		RUNMAKE=false
 		shift
 		continue
 		;;
@@ -72,55 +71,70 @@ while true; do
 		shift 2
 		continue
 		;;
-	"-e")
-		EXTERNAL_ARG="BR2_EXTERNAL=$2"
-		shift 2
-		continue
-		;;
 	*)
 		break
 		;;
 	esac
 done
 
+if [ "$#" -lt 1 ] ; then
+	usage
+	exit
+fi
+
+if [ -z "$KCONFIG_CONFIG" ]; then
+	if [ "$OUTPUT" != . ]; then
+		KCONFIG_CONFIG=$(readlink -m -- "$OUTPUT/.config")
+	else
+		KCONFIG_CONFIG=.config
+	fi
+fi
+
 INITFILE=$1
 shift;
 
+if [ ! -r "$INITFILE" ]; then
+	echo "The base file '$INITFILE' does not exist.  Exit." >&2
+	exit 1
+fi
+
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
 
-# Merge files, printing warnings on overrided values
+# Merge files, printing warnings on overridden values
 for MERGE_FILE in $MERGE_LIST ; do
 	echo "Merging $MERGE_FILE"
+	if [ ! -r "$MERGE_FILE" ]; then
+		echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
+		exit 1
+	fi
 	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
 
 	for CFG in $CFG_LIST ; do
-		grep -q -w $CFG $TMP_FILE
-		if [ $? -eq 0 ] ; then
-			PREV_VAL=$(grep -w $CFG $TMP_FILE)
-			NEW_VAL=$(grep -w $CFG $MERGE_FILE)
-			if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
+		grep -q -w $CFG $TMP_FILE || continue
+		PREV_VAL=$(grep -w $CFG $TMP_FILE)
+		NEW_VAL=$(grep -w $CFG $MERGE_FILE)
+		if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
 			echo Value of $CFG is redefined by fragment $MERGE_FILE:
 			echo Previous  value: $PREV_VAL
 			echo New value:       $NEW_VAL
 			echo
-			elif [ "$WARNREDUN" = "true" ]; then
+		elif [ "$WARNREDUN" = "true" ]; then
 			echo Value of $CFG is redundant by fragment $MERGE_FILE:
-			fi
-			sed -i "/$CFG[ =]/d" $TMP_FILE
 		fi
+		sed -i "/$CFG[ =]/d" $TMP_FILE
 	done
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
-if [ "$MAKE" = "false" ]; then
-	cp $TMP_FILE $OUTPUT/.config
+if [ "$RUNMAKE" = "false" ]; then
+	cp -T -- "$TMP_FILE" "$KCONFIG_CONFIG"
 	echo "#"
-	echo "# merged configuration written to $OUTPUT/.config (needs make)"
+	echo "# merged configuration written to $KCONFIG_CONFIG (needs make)"
 	echo "#"
 	clean_up
 	exit
@@ -137,14 +151,14 @@ fi
 # Use the merged file as the starting point for:
 # alldefconfig: Fills in any missing symbols with Kconfig default
 # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
-make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
+make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
 
 
 # Check all specified config values took (might have missed-dependency issues)
 for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
 
 	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
-	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)
+	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
 	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
 		echo "Value requested for $CFG not in final .config"
 		echo "Requested value:  $REQUESTED_VAL"
diff --git a/support/kconfig/nconf.c b/support/kconfig/nconf.c
index 4fbecd2473..0031147798 100644
--- a/support/kconfig/nconf.c
+++ b/support/kconfig/nconf.c
@@ -5,7 +5,9 @@
  * Derived from menuconfig.
  *
  */
+#ifndef _GNU_SOURCE
 #define _GNU_SOURCE
+#endif
 #include <string.h>
 #include <stdlib.h>
 
@@ -269,7 +271,7 @@ static struct mitem k_menu_items[MAX_MENU_ITEMS];
 static int items_num;
 static int global_exit;
 /* the currently selected button */
-const char *current_instructions = menu_instructions;
+static const char *current_instructions = menu_instructions;
 
 static char *dialog_input_result;
 static int dialog_input_result_len;
@@ -303,7 +305,7 @@ struct function_keys {
 };
 
 static const int function_keys_num = 9;
-struct function_keys function_keys[] = {
+static struct function_keys function_keys[] = {
 	{
 		.key_str = "F1",
 		.func = "Help",
@@ -506,7 +508,7 @@ static int get_mext_match(const char *match_str, match_f flag)
 	index = (index + items_num) % items_num;
 	while (true) {
 		char *str = k_menu_items[index].str;
-		if (strcasestr(str, match_str) != 0)
+		if (strcasestr(str, match_str) != NULL)
 			return index;
 		if (flag == FIND_NEXT_MATCH_UP ||
 		    flag == MATCH_TINKER_PATTERN_UP)
@@ -1065,7 +1067,7 @@ static int do_match(int key, struct match_state *state, int *ans)
 
 static void conf(struct menu *menu)
 {
-	struct menu *submenu = 0;
+	struct menu *submenu = NULL;
 	const char *prompt = menu_get_prompt(menu);
 	struct symbol *sym;
 	int res;
@@ -1232,7 +1234,7 @@ static void show_help(struct menu *menu)
 static void conf_choice(struct menu *menu)
 {
 	const char *prompt = _(menu_get_prompt(menu));
-	struct menu *child = 0;
+	struct menu *child = NULL;
 	struct symbol *active;
 	int selected_index = 0;
 	int last_top_row = 0;
@@ -1454,7 +1456,7 @@ static void conf_save(void)
 	}
 }
 
-void setup_windows(void)
+static void setup_windows(void)
 {
 	int lines, columns;
 
@@ -1482,6 +1484,11 @@ int main(int ac, char **av)
 	bindtextdomain(PACKAGE, LOCALEDIR);
 	textdomain(PACKAGE);
 
+	if (ac > 1 && strcmp(av[1], "-s") == 0) {
+		/* Silence conf_read() until the real callback is set up */
+		conf_set_message_callback(NULL);
+		av++;
+	}
 	conf_parse(av[1]);
 	conf_read(NULL);
 
@@ -1554,4 +1561,3 @@ int main(int ac, char **av)
 	endwin();
 	return 0;
 }
-
diff --git a/support/kconfig/nconf.gui.c b/support/kconfig/nconf.gui.c
index 8275f0e551..88874acfda 100644
--- a/support/kconfig/nconf.gui.c
+++ b/support/kconfig/nconf.gui.c
@@ -6,6 +6,7 @@
  *
  */
 #include "nconf.h"
+#include "lkc.h"
 
 /* a list of all the different widgets we use */
 attributes_t attributes[ATTR_MAX+1] = {0};
@@ -129,7 +130,7 @@ static void no_colors_theme(void)
 	mkattrn(FUNCTION_TEXT, A_REVERSE);
 }
 
-void set_colors()
+void set_colors(void)
 {
 	start_color();
 	use_default_colors();
@@ -192,7 +193,7 @@ const char *get_line(const char *text, int line_no)
 	int lines = 0;
 
 	if (!text)
-		return 0;
+		return NULL;
 
 	for (i = 0; text[i] != '\0' && lines < line_no; i++)
 		if (text[i] == '\n')
@@ -364,15 +365,17 @@ int dialog_inputbox(WINDOW *main_window,
 	WINDOW *prompt_win;
 	WINDOW *form_win;
 	PANEL *panel;
-	int i, x, y;
+	int i, x, y, lines, columns, win_lines, win_cols;
 	int res = -1;
 	int cursor_position = strlen(init);
 	int cursor_form_win;
 	char *result = *resultp;
 
+	getmaxyx(stdscr, lines, columns);
+
 	if (strlen(init)+1 > *result_len) {
 		*result_len = strlen(init)+1;
-		*resultp = result = realloc(result, *result_len);
+		*resultp = result = xrealloc(result, *result_len);
 	}
 
 	/* find the widest line of msg: */
@@ -386,14 +389,19 @@ int dialog_inputbox(WINDOW *main_window,
 	if (title)
 		prompt_width = max(prompt_width, strlen(title));
 
+	win_lines = min(prompt_lines+6, lines-2);
+	win_cols = min(prompt_width+7, columns-2);
+	prompt_lines = max(win_lines-6, 0);
+	prompt_width = max(win_cols-7, 0);
+
 	/* place dialog in middle of screen */
-	y = (getmaxy(stdscr)-(prompt_lines+4))/2;
-	x = (getmaxx(stdscr)-(prompt_width+4))/2;
+	y = (lines-win_lines)/2;
+	x = (columns-win_cols)/2;
 
 	strncpy(result, init, *result_len);
 
 	/* create the windows */
-	win = newwin(prompt_lines+6, prompt_width+7, y, x);
+	win = newwin(win_lines, win_cols, y, x);
 	prompt_win = derwin(win, prompt_lines+1, prompt_width, 2, 2);
 	form_win = derwin(win, 1, prompt_width, prompt_lines+3, 2);
 	keypad(form_win, TRUE);
diff --git a/support/kconfig/nconf.h b/support/kconfig/nconf.h
index 0d5261705e..9f6f21d3b0 100644
--- a/support/kconfig/nconf.h
+++ b/support/kconfig/nconf.h
@@ -15,7 +15,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <locale.h>
-#include <curses.h>
+#include <ncurses.h>
 #include <menu.h>
 #include <panel.h>
 #include <form.h>
@@ -24,8 +24,6 @@
 #include <time.h>
 #include <sys/time.h>
 
-#include "ncurses.h"
-
 #define max(a, b) ({\
 		typeof(a) _a = a;\
 		typeof(b) _b = b;\
diff --git a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
index e76198a36b..f15e5f4337 100644
--- a/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
+++ b/support/kconfig/patches/01-kconfig-kernel-to-buildroot.patch
@@ -8,8 +8,8 @@
 
 Index: kconfig/gconf.glade
 ===================================================================
---- kconfig.orig/gconf.glade	2013-12-27 22:14:32.395629843 +0100
-+++ kconfig/gconf.glade	2013-12-27 22:14:32.387630158 +0100
+--- kconfig.orig/gconf.glade
++++ kconfig/gconf.glade
 @@ -4,7 +4,7 @@
  
  <widget class="GtkWindow" id="window1">
@@ -21,9 +21,9 @@ Index: kconfig/gconf.glade
    <property name="modal">False</property>
 Index: kconfig/mconf.c
 ===================================================================
---- kconfig.orig/mconf.c	2013-12-27 22:14:32.395629843 +0100
-+++ kconfig/mconf.c	2013-12-27 22:14:42.179244153 +0100
-@@ -176,9 +176,9 @@
+--- kconfig.orig/mconf.c
++++ kconfig/mconf.c
+@@ -176,9 +176,9 @@ menu_instructions[] = N_(
  	"Arrow keys navigate the menu.  "
  	"<Enter> selects submenus ---> (or empty submenus ----).  "
  	"Highlighted letters are hotkeys.  "
@@ -35,7 +35,7 @@ Index: kconfig/mconf.c
  radiolist_instructions[] = N_(
  	"Use the arrow keys to navigate this window or "
  	"press the hotkey of the item you wish to select "
-@@ -959,7 +959,7 @@
+@@ -962,7 +962,7 @@ static int handle_exit(void)
  	if (conf_get_changed())
  		res = dialog_yesno(NULL,
  				   _("Do you wish to save your new configuration?\n"
@@ -46,44 +46,44 @@ Index: kconfig/mconf.c
  		res = -1;
 Index: kconfig/zconf.tab.c_shipped
 ===================================================================
---- kconfig.orig/zconf.tab.c_shipped	2013-12-27 22:14:32.395629843 +0100
-+++ kconfig/zconf.tab.c_shipped	2013-12-27 22:14:32.391630000 +0100
-@@ -2297,7 +2297,7 @@
- 
- 	sym_init();
- 	_menu_init();
--	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
-+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
+--- kconfig.orig/zconf.tab.c_shipped
++++ kconfig/zconf.tab.c_shipped
+@@ -1515,7 +1515,7 @@
+ 	 * later regardless of whether it comes from the 'prompt' in
+ 	 * mainmenu_stmt or here
+ 	 */
+-	menu_add_prompt(P_MENU, xstrdup("Linux Kernel Configuration"), NULL);
++	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
+ }
  
- 	if (getenv("ZCONF_DEBUG"))
- 		zconfdebug = 1;
+     break;
 Index: kconfig/zconf.y
 ===================================================================
---- kconfig.orig/zconf.y	2013-12-27 22:14:32.395629843 +0100
-+++ kconfig/zconf.y	2013-12-27 22:14:32.391630000 +0100
-@@ -493,7 +493,7 @@
+--- kconfig.orig/zconf.y
++++ kconfig/zconf.y
+@@ -127,7 +127,7 @@ no_mainmenu_stmt: /* empty */
+ 	 * later regardless of whether it comes from the 'prompt' in
+ 	 * mainmenu_stmt or here
+ 	 */
+-	menu_add_prompt(P_MENU, xstrdup("Linux Kernel Configuration"), NULL);
++	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
+ };
  
- 	sym_init();
- 	_menu_init();
--	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
-+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
  
- 	if (getenv("ZCONF_DEBUG"))
- 		zconfdebug = 1;
 Index: kconfig/confdata.c
 ===================================================================
---- kconfig.orig/confdata.c	2013-12-27 22:14:32.395629843 +0100
-+++ kconfig/confdata.c	2013-12-27 22:14:32.391630000 +0100
-@@ -25,7 +25,7 @@
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
+@@ -30,7 +30,7 @@ static void conf_message(const char *fmt
  static const char *conf_filename;
- static int conf_lineno, conf_warnings, conf_unsaved;
+ static int conf_lineno, conf_warnings;
  
 -const char conf_defname[] = "arch/$ARCH/defconfig";
 +const char conf_defname[] = ".defconfig";
  
  static void conf_warning(const char *fmt, ...)
  {
-@@ -63,7 +63,7 @@
+@@ -69,7 +69,7 @@ static void conf_message(const char *fmt
  
  const char *conf_get_configname(void)
  {
@@ -94,9 +94,9 @@ Index: kconfig/confdata.c
  }
 Index: kconfig/qconf.cc
 ===================================================================
---- kconfig.orig/qconf.cc	2013-12-27 22:12:15.825013567 +0100
-+++ kconfig/qconf.cc	2013-12-27 22:14:57.826627300 +0100
-@@ -70,7 +70,7 @@
+--- kconfig.orig/qconf.cc
++++ kconfig/qconf.cc
+@@ -55,7 +55,7 @@ static inline QString qgettext(const QSt
  }
  
  ConfigSettings::ConfigSettings()
diff --git a/support/kconfig/patches/06-br-build-system-integration.patch b/support/kconfig/patches/06-br-build-system-integration.patch
index 3faa39ed63..bd652dfb66 100644
--- a/support/kconfig/patches/06-br-build-system-integration.patch
+++ b/support/kconfig/patches/06-br-build-system-integration.patch
@@ -1,35 +1,37 @@
----
- Makefile |    8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-Index: b/Makefile
+Index: kconfig/Makefile
 ===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -159,11 +159,11 @@
+--- kconfig.orig/Makefile
++++ kconfig/Makefile
+@@ -243,7 +243,7 @@ HOSTLOADLIBES_nconf	= $(shell \
+ 				|| echo "-lmenu -lpanel -lncurses"  )
+ $(obj)/qconf.o: $(obj)/.tmp_qtcheck
  
- hostprogs-y := conf
+-ifeq ($(MAKECMDGOALS),xconfig)
++ifeq ($(MAKECMDGOALS),qconf)
+ $(obj)/.tmp_qtcheck: $(src)/Makefile
+ -include $(obj)/.tmp_qtcheck
  
--ifeq ($(MAKECMDGOALS),nconfig)
-+ifeq ($(MAKECMDGOALS),nconf)
- 	hostprogs-y += nconf
+@@ -270,9 +276,8 @@
+ 	echo "KC_QT_MOC=$$moc" >> $@
  endif
  
--ifeq ($(MAKECMDGOALS),menuconfig)
-+ifeq ($(MAKECMDGOALS),mconf)
- 	hostprogs-y += mconf
- endif
++ifeq ($(MAKECMDGOALS),gconf)
+ $(obj)/gconf.o: $(obj)/.tmp_gtkcheck
+-
+-ifeq ($(MAKECMDGOALS),gconfig)
+ -include $(obj)/.tmp_gtkcheck
  
-@@ -171,10 +171,10 @@
- 	hostprogs-y += kxgettext
- endif
+ # GTK+ needs some extra effort, too...
+@@ -300,11 +305,8 @@
  
--ifeq ($(MAKECMDGOALS),xconfig)
-+ifeq ($(MAKECMDGOALS),qconf)
- 	qconf-target := 1
- endif
--ifeq ($(MAKECMDGOALS),gconfig)
-+ifeq ($(MAKECMDGOALS),gconf)
- 	gconf-target := 1
- endif
+ $(obj)/qconf.o: $(obj)/qconf.moc
+ 
+-quiet_cmd_moc = MOC     $@
+-      cmd_moc = $(KC_QT_MOC) -i $< -o $@
+-
+ $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
+-	$(call cmd,moc)
++	$(KC_QT_MOC) -i $< -o $@
  
+ # Extract gconf menu items for i18n support
+ $(obj)/gconf.glade.h: $(obj)/gconf.glade
diff --git a/support/kconfig/patches/10-br-build-system.patch b/support/kconfig/patches/10-br-build-system.patch
index be6fda07af..abf2463691 100644
--- a/support/kconfig/patches/10-br-build-system.patch
+++ b/support/kconfig/patches/10-br-build-system.patch
@@ -3,10 +3,10 @@
  foo.h       |   12 ++++++++++++
  2 files changed, 65 insertions(+)
 
-Index: b/Makefile.br
+Index: kconfig/Makefile.br
 ===================================================================
 --- /dev/null
-+++ b/Makefile.br
++++ kconfig/Makefile.br
 @@ -0,0 +1,53 @@
 +src := .
 +top_srcdir=../../
@@ -61,10 +61,10 @@ Index: b/Makefile.br
 +
 +FORCE:
 +.PHONY: FORCE clean distclean
-Index: b/foo.h
+Index: kconfig/foo.h
 ===================================================================
 --- /dev/null
-+++ b/foo.h
++++ kconfig/foo.h
 @@ -0,0 +1,12 @@
 +#ifndef __KCONFIG_FOO_H
 +#define __KCONFIG_FOO_H
diff --git a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
index b38af26211..387c633ae2 100644
--- a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
+++ b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
@@ -2,11 +2,11 @@
  lxdialog/check-lxdialog.sh |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/lxdialog/check-lxdialog.sh
+Index: kconfig/lxdialog/check-lxdialog.sh
 ===================================================================
---- a/lxdialog/check-lxdialog.sh
-+++ b/lxdialog/check-lxdialog.sh
-@@ -36,7 +36,7 @@
+--- kconfig.orig/lxdialog/check-lxdialog.sh
++++ kconfig/lxdialog/check-lxdialog.sh
+@@ -41,7 +41,7 @@ ccflags()
  }
  
  # Temp file, try to clean up after us
diff --git a/support/kconfig/patches/12-fix-glade-file-path.patch b/support/kconfig/patches/12-fix-glade-file-path.patch
index a5777da3e9..7d5941fc9e 100644
--- a/support/kconfig/patches/12-fix-glade-file-path.patch
+++ b/support/kconfig/patches/12-fix-glade-file-path.patch
@@ -2,11 +2,11 @@
  gconf.c |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: b/gconf.c
+Index: kconfig/gconf.c
 ===================================================================
---- a/gconf.c
-+++ b/gconf.c
-@@ -1486,7 +1486,7 @@
+--- kconfig.orig/gconf.c
++++ kconfig/gconf.c
+@@ -1462,7 +1462,7 @@ int main(int ac, char *av[])
  	/* Determine GUI path */
  	env = getenv(SRCTREE);
  	if (env)
diff --git a/support/kconfig/patches/14-support-out-of-tree-config.patch b/support/kconfig/patches/14-support-out-of-tree-config.patch
index ec3134f94e..a3b33ba688 100644
--- a/support/kconfig/patches/14-support-out-of-tree-config.patch
+++ b/support/kconfig/patches/14-support-out-of-tree-config.patch
@@ -4,11 +4,11 @@
  util.c     |   16 +++++++++++++--
  3 files changed, 61 insertions(+), 18 deletions(-)
 
-Index: b/conf.c
+Index: kconfig/conf.c
 ===================================================================
---- a/conf.c
-+++ b/conf.c
-@@ -558,7 +558,6 @@
+--- kconfig.orig/conf.c
++++ kconfig/conf.c
+@@ -565,7 +565,6 @@ int main(int ac, char **av)
  	}
  	name = av[optind];
  	conf_parse(name);
@@ -16,10 +16,10 @@ Index: b/conf.c
  	if (sync_kconfig) {
  		name = conf_get_configname();
  		if (stat(name, &tmpstat)) {
-Index: b/confdata.c
+Index: kconfig/confdata.c
 ===================================================================
---- a/confdata.c
-+++ b/confdata.c
+--- kconfig.orig/confdata.c
++++ kconfig/confdata.c
 @@ -13,6 +13,7 @@
  #include <string.h>
  #include <time.h>
@@ -28,7 +28,7 @@ Index: b/confdata.c
  
  #include "lkc.h"
  
-@@ -70,9 +71,7 @@
+@@ -76,9 +77,7 @@ const char *conf_get_configname(void)
  
  const char *conf_get_autoconfig_name(void)
  {
@@ -39,7 +39,7 @@ Index: b/confdata.c
  }
  
  static char *conf_expand_value(const char *in)
-@@ -742,6 +741,9 @@
+@@ -748,6 +747,9 @@ int conf_write(const char *name)
  	char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
  	char *env;
  
@@ -49,7 +49,7 @@ Index: b/confdata.c
  	dirname[0] = 0;
  	if (name && name[0]) {
  		struct stat st;
-@@ -836,6 +838,7 @@
+@@ -842,6 +844,7 @@ static int conf_split_config(void)
  {
  	const char *name;
  	char path[PATH_MAX+1];
@@ -57,9 +57,9 @@ Index: b/confdata.c
  	char *s, *d, c;
  	struct symbol *sym;
  	struct stat sb;
-@@ -844,8 +847,20 @@
- 	name = conf_get_autoconfig_name();
+@@ -851,8 +854,20 @@ static int conf_split_config(void)
  	conf_read_simple(name, S_DEF_AUTO);
+ 	sym_calc_value(modules_sym);
  
 -	if (chdir("include/config"))
 -		return 1;
@@ -80,7 +80,7 @@ Index: b/confdata.c
  
  	res = 0;
  	for_all_symbols(i, sym) {
-@@ -938,9 +953,11 @@
+@@ -945,9 +960,11 @@ static int conf_split_config(void)
  		close(fd);
  	}
  out:
@@ -95,7 +95,7 @@ Index: b/confdata.c
  	return res;
  }
  
-@@ -950,25 +967,38 @@
+@@ -957,25 +974,38 @@ int conf_write_autoconf(void)
  	const char *name;
  	FILE *out, *tristate, *out_h;
  	int i;
@@ -138,7 +138,7 @@ Index: b/confdata.c
  	if (!out_h) {
  		fclose(out);
  		fclose(tristate);
-@@ -1000,19 +1030,22 @@
+@@ -1007,19 +1037,22 @@ int conf_write_autoconf(void)
  	name = getenv("KCONFIG_AUTOHEADER");
  	if (!name)
  		name = "include/generated/autoconf.h";
@@ -164,11 +164,11 @@ Index: b/confdata.c
  		return 1;
  
  	return 0;
-Index: b/util.c
+Index: kconfig/util.c
 ===================================================================
---- a/util.c
-+++ b/util.c
-@@ -34,6 +34,8 @@
+--- kconfig.orig/util.c
++++ kconfig/util.c
+@@ -34,6 +34,8 @@ struct file *file_lookup(const char *nam
  /* write a dependency file as used by kbuild to track dependencies */
  int file_write_dep(const char *name)
  {
@@ -177,7 +177,7 @@ Index: b/util.c
  	struct symbol *sym, *env_sym;
  	struct expr *e;
  	struct file *file;
-@@ -41,7 +43,16 @@
+@@ -41,7 +43,16 @@ int file_write_dep(const char *name)
  
  	if (!name)
  		name = ".kconfig.d";
@@ -195,7 +195,7 @@ Index: b/util.c
  	if (!out)
  		return 1;
  	fprintf(out, "deps_config := \\\n");
-@@ -72,7 +83,8 @@
+@@ -72,7 +83,8 @@ int file_write_dep(const char *name)
  
  	fprintf(out, "\n$(deps_config): ;\n");
  	fclose(out);
diff --git a/support/kconfig/patches/15-fix-qconf-moc-rule.patch b/support/kconfig/patches/15-fix-qconf-moc-rule.patch
deleted file mode 100644
index c1848d764e..0000000000
--- a/support/kconfig/patches/15-fix-qconf-moc-rule.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix the rule that generates the .moc file
-
-The Linux kernel has a "cmd" make function, but we don't have it in
-Buildroot, so we need to adjust this rule.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/Makefile
-===================================================================
---- a/Makefile
-+++ b/Makefile
-@@ -309,11 +309,8 @@
- 
- $(obj)/qconf.o: $(obj)/qconf.moc
- 
--quiet_cmd_moc = MOC     $@
--      cmd_moc = $(KC_QT_MOC) -i $< -o $@
--
- $(obj)/%.moc: $(src)/%.h $(obj)/.tmp_qtcheck
--	$(call cmd,moc)
-+	$(KC_QT_MOC) -i $< -o $@
- 
- # Extract gconf menu items for I18N support
- $(obj)/gconf.glade.h: $(obj)/gconf.glade
diff --git a/support/kconfig/patches/16-fix-space-to-de-select-options.patch b/support/kconfig/patches/16-fix-space-to-de-select-options.patch
index 972d2de9ea..08f7ec5d95 100644
--- a/support/kconfig/patches/16-fix-space-to-de-select-options.patch
+++ b/support/kconfig/patches/16-fix-space-to-de-select-options.patch
@@ -26,10 +26,10 @@ Date:   Wed Nov 13 22:45:02 2013 +0100
     ---
     Note: I'll be running this upstream soonish.
 
-diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
-index 48d382e..6fc7e78 100644
---- a/lxdialog/menubox.c
-+++ b/lxdialog/menubox.c
+Index: kconfig/lxdialog/menubox.c
+===================================================================
+--- kconfig.orig/lxdialog/menubox.c
++++ kconfig/lxdialog/menubox.c
 @@ -285,7 +285,7 @@ do_resize:
  		if (key < 256 && isalpha(key))
  			key = tolower(key);
diff --git a/support/kconfig/patches/17-backport-kecho.patch b/support/kconfig/patches/17-backport-kecho.patch
new file mode 100644
index 0000000000..9d13876616
--- /dev/null
+++ b/support/kconfig/patches/17-backport-kecho.patch
@@ -0,0 +1,26 @@
+This commit added kecho to scripts/Kbuild.include (and doc).
+Backported just Kbuild.include part to Makefile
+
+commit 5410ecc0def8955ab99810c5626cc7e156991896
+Author: Mike Frysinger <vapier@gentoo.org>
+Date:   Thu Nov 6 03:31:34 2008 -0500
+
+    kbuild: introduce $(kecho) convenience echo
+
+Index: kconfig/Makefile
+===================================================================
+--- kconfig.orig/Makefile
++++ kconfig/Makefile
+@@ -6,6 +6,12 @@
+ PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
+ 	localmodconfig localyesconfig
+ 
++# Easy method for doing a status message
++       kecho := :
++ quiet_kecho := echo
++silent_kecho := :
++kecho := $($(quiet)kecho)
++
+ ifdef KBUILD_KCONFIG
+ Kconfig := $(KBUILD_KCONFIG)
+ else
diff --git a/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch b/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
deleted file mode 100644
index 1eb48ef974..0000000000
--- a/support/kconfig/patches/17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From be8af2d54a66911693eddc556e4f7a866670082b Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
-Date: Sun, 14 Sep 2014 12:57:50 +0200
-Subject: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This makes "make menuconfig" also work on systems where ncurses is not
-installed in a standard location (such as on NixOS).
-
-This patch changes ccflags() so that it tries pkg-config first, and only
-if pkg-config fails does it go back to the fallback/manual checks. This
-is the same algorithm that ldflags() already uses.
-
-Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
-Signed-off-by: Michal Marek <mmarek@suse.cz>
----
-[This patch is already applied upstream (is part of linux v3.18):
-https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=be8af2d54a66911693eddc556e4f7a866670082b
-
-I'm adding this instead of doing a full upstream kconfig sync because
-there was a conflict in one of the Buildroot kconfig patches (against
-linux 3.18-rc1), which I was unable to resolve. Just drop this patch next time
-Buildroot kconfig is synced against upstream.
-]
-
- scripts/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
-index 9d2a4c5..5075ebf 100755
---- a/lxdialog/check-lxdialog.sh
-+++ b/lxdialog/check-lxdialog.sh
-@@ -21,7 +21,11 @@ ldflags()
- # Where is ncurses.h?
- ccflags()
- {
--	if [ -f /usr/include/ncursesw/curses.h ]; then
-+	if pkg-config --cflags ncursesw 2>/dev/null; then
-+		echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
-+	elif pkg-config --cflags ncurses 2>/dev/null; then
-+		echo '-DCURSES_LOC="<ncurses.h>"'
-+	elif [ -f /usr/include/ncursesw/curses.h ]; then
- 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
- 		echo ' -DNCURSES_WIDECHAR=1'
- 	elif [ -f /usr/include/ncurses/ncurses.h ]; then
--- 
-2.1.3
-
diff --git a/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch b/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
deleted file mode 100644
index 3ca48d0714..0000000000
--- a/support/kconfig/patches/18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 7285996aa0006d671bb01f0d35991d254b2b2b01 Mon Sep 17 00:00:00 2001
-From: Brian Norris <computersforpeace@gmail.com>
-Date: Wed, 4 Jun 2014 00:52:31 -0700
-Subject: kconfig: nconfig: fix multi-byte UTF handling
-
-Currently, Kconfig descriptions that use multi-byte UTF-8 characters
-(such as MTD_NAND_CAFE) will have their menu entries dropped from the
-'make nconfig' ncurses menu, and all subsequent entries in the same
-window will be omitted. This seems to be due to the ncurses 'menu'
-library, which does not traditionally handle UTF-8 >8-bit characters
-properly.
-
-The ncursesw library ('w' is for "wide") is written to handle these
-UTF-8 characters, and is practically a drop-in replacement at the source
-level. Use it by default, if available.
-
-Link: https://bugzilla.kernel.org/show_bug.cgi?id=43067
-Signed-off-by: Brian Norris <computersforpeace@gmail.com>
-Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Cc: Martin Walch <walch.martin@web.de>
-Acked-by: Sam Ravnborg <sam@ravnborg.org>
-Signed-off-by: Michal Marek <mmarek@suse.cz>
----
- scripts/kconfig/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-(limited to 'scripts/kconfig/Makefile')
-
-diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
-index e7bf38e..c059385 100644
---- a/scripts/kconfig/Makefile
-+++ b/scripts/kconfig/Makefile
-@@ -191,7 +191,8 @@ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
- HOSTLOADLIBES_mconf   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
- 
- HOSTLOADLIBES_nconf	= $(shell \
--				pkg-config --libs menu panel ncurses 2>/dev/null \
-+				pkg-config --libs menuw panelw ncursesw 2>/dev/null \
-+				|| pkg-config --libs menu panel ncurses 2>/dev/null \
- 				|| echo "-lmenu -lpanel -lncurses"  )
- $(obj)/qconf.o: $(obj)/.tmp_qtcheck
- 
--- 
-cgit v1.1
-
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 1a53ba9958..36591e2189 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -4,7 +4,5 @@
 11-use-mktemp-for-lxdialog.patch
 12-fix-glade-file-path.patch
 14-support-out-of-tree-config.patch
-15-fix-qconf-moc-rule.patch
 16-fix-space-to-de-select-options.patch
-17-kconfig-lxdialog-get-ncurses-CFLAGS-with-pkg-config.patch
-18-kconfig-nconfig-fix-multi-byte-UTF-handling.patch
+17-backport-kecho.patch
diff --git a/support/kconfig/qconf.cc b/support/kconfig/qconf.cc
index f630567c82..7896b584c8 100644
--- a/support/kconfig/qconf.cc
+++ b/support/kconfig/qconf.cc
@@ -1,32 +1,17 @@
 /*
  * Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>
+ * Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>
  * Released under the terms of the GNU GPL v2.0.
  */
 
 #include <qglobal.h>
 
-#if QT_VERSION < 0x040000
-#include <stddef.h>
-#include <qmainwindow.h>
-#include <qvbox.h>
-#include <qvaluelist.h>
+#include <QMainWindow>
+#include <QList>
 #include <qtextbrowser.h>
-#include <qaction.h>
-#include <qheader.h>
-#include <qfiledialog.h>
-#include <qdragobject.h>
-#include <qpopupmenu.h>
-#else
-#include <q3mainwindow.h>
-#include <q3vbox.h>
-#include <q3valuelist.h>
-#include <q3textbrowser.h>
-#include <q3action.h>
-#include <q3header.h>
-#include <q3filedialog.h>
-#include <q3dragobject.h>
-#include <q3popupmenu.h>
-#endif
+#include <QAction>
+#include <QFileDialog>
+#include <QMenu>
 
 #include <qapplication.h>
 #include <qdesktopwidget.h>
@@ -57,7 +42,7 @@
 static QApplication *configApp;
 static ConfigSettings *configSettings;
 
-Q3Action *ConfigMainWindow::saveAction;
+QAction *ConfigMainWindow::saveAction;
 
 static inline QString qgettext(const char* str)
 {
@@ -66,7 +51,7 @@ static inline QString qgettext(const char* str)
 
 static inline QString qgettext(const QString& str)
 {
-	return QString::fromLocal8Bit(gettext(str.latin1()));
+	return QString::fromLocal8Bit(gettext(str.toLatin1()));
 }
 
 ConfigSettings::ConfigSettings()
@@ -77,14 +62,22 @@ ConfigSettings::ConfigSettings()
 /**
  * Reads a list of integer values from the application settings.
  */
-Q3ValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
+QList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 {
-	Q3ValueList<int> result;
-	QStringList entryList = readListEntry(key, ok);
-	QStringList::Iterator it;
+	QList<int> result;
+
+	if (contains(key))
+	{
+		QStringList entryList = value(key).toStringList();
+		QStringList::Iterator it;
 
-	for (it = entryList.begin(); it != entryList.end(); ++it)
-		result.push_back((*it).toInt());
+		for (it = entryList.begin(); it != entryList.end(); ++it)
+			result.push_back((*it).toInt());
+
+		*ok = true;
+	}
+	else
+		*ok = false;
 
 	return result;
 }
@@ -92,14 +85,16 @@ Q3ValueList<int> ConfigSettings::readSizes(const QString& key, bool *ok)
 /**
  * Writes a list of integer values to the application settings.
  */
-bool ConfigSettings::writeSizes(const QString& key, const Q3ValueList<int>& value)
+bool ConfigSettings::writeSizes(const QString& key, const QList<int>& value)
 {
 	QStringList stringList;
-	Q3ValueList<int>::ConstIterator it;
+	QList<int>::ConstIterator it;
 
 	for (it = value.begin(); it != value.end(); ++it)
 		stringList.push_back(QString::number(*it));
-	return writeEntry(key, stringList);
+	setValue(key, stringList);
+
+	return true;
 }
 
 
@@ -109,9 +104,6 @@ bool ConfigSettings::writeSizes(const QString& key, const Q3ValueList<int>& valu
  */
 void ConfigItem::okRename(int col)
 {
-	Parent::okRename(col);
-	sym_set_string_value(menu->sym, text(dataColIdx).latin1());
-	listView()->updateList(this);
 }
 
 /*
@@ -149,11 +141,11 @@ void ConfigItem::updateMenu(void)
 		} else {
 			if (sym)
 				break;
-			setPixmap(promptColIdx, 0);
+			setPixmap(promptColIdx, QIcon());
 		}
 		goto set_prompt;
 	case P_COMMENT:
-		setPixmap(promptColIdx, 0);
+		setPixmap(promptColIdx, QIcon());
 		goto set_prompt;
 	default:
 		;
@@ -170,7 +162,7 @@ void ConfigItem::updateMenu(void)
 		char ch;
 
 		if (!sym_is_changable(sym) && list->optMode == normalOpt) {
-			setPixmap(promptColIdx, 0);
+			setPixmap(promptColIdx, QIcon());
 			setText(noColIdx, QString::null);
 			setText(modColIdx, QString::null);
 			setText(yesColIdx, QString::null);
@@ -216,9 +208,6 @@ void ConfigItem::updateMenu(void)
 
 		data = sym_get_string_value(sym);
 
-		int i = list->mapIdx(dataColIdx);
-		if (i >= 0)
-			setRenameEnabled(i, TRUE);
 		setText(dataColIdx, data);
 		if (type == S_STRING)
 			prompt = QString("%1: %2").arg(prompt).arg(data);
@@ -250,18 +239,6 @@ void ConfigItem::testUpdateMenu(bool v)
 		updateMenu();
 }
 
-void ConfigItem::paintCell(QPainter* p, const QColorGroup& cg, int column, int width, int align)
-{
-	ConfigList* list = listView();
-
-	if (visible) {
-		if (isSelected() && !list->hasFocus() && list->mode == menuMode)
-			Parent::paintCell(p, list->inactivedColorGroup, column, width, align);
-		else
-			Parent::paintCell(p, cg, column, width, align);
-	} else
-		Parent::paintCell(p, list->disabledColorGroup, column, width, align);
-}
 
 /*
  * construct a menu entry
@@ -274,7 +251,7 @@ void ConfigItem::init(void)
 		menu->data = this;
 
 		if (list->mode != fullMode)
-			setOpen(TRUE);
+			setExpanded(true);
 		sym_calc_value(menu->sym);
 	}
 	updateMenu();
@@ -299,7 +276,7 @@ ConfigItem::~ConfigItem(void)
 ConfigLineEdit::ConfigLineEdit(ConfigView* parent)
 	: Parent(parent)
 {
-	connect(this, SIGNAL(lostFocus()), SLOT(hide()));
+	connect(this, SIGNAL(editingFinished()), SLOT(hide()));
 }
 
 void ConfigLineEdit::show(ConfigItem* i)
@@ -320,7 +297,7 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 		break;
 	case Qt::Key_Return:
 	case Qt::Key_Enter:
-		sym_set_string_value(item->menu->sym, text().latin1());
+		sym_set_string_value(item->menu->sym, text().toLatin1());
 		parent()->updateList(item);
 		break;
 	default:
@@ -333,39 +310,39 @@ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
 }
 
 ConfigList::ConfigList(ConfigView* p, const char *name)
-	: Parent(p, name),
+	: Parent(p),
 	  updateAll(false),
 	  symbolYesPix(xpm_symbol_yes), symbolModPix(xpm_symbol_mod), symbolNoPix(xpm_symbol_no),
 	  choiceYesPix(xpm_choice_yes), choiceNoPix(xpm_choice_no),
 	  menuPix(xpm_menu), menuInvPix(xpm_menu_inv), menuBackPix(xpm_menuback), voidPix(xpm_void),
-	  showName(false), showRange(false), showData(false), optMode(normalOpt),
+	  showName(false), showRange(false), showData(false), mode(singleMode), optMode(normalOpt),
 	  rootEntry(0), headerPopup(0)
 {
 	int i;
 
-	setSorting(-1);
-	setRootIsDecorated(TRUE);
-	disabledColorGroup = palette().active();
-	disabledColorGroup.setColor(QColorGroup::Text, palette().disabled().text());
-	inactivedColorGroup = palette().active();
-	inactivedColorGroup.setColor(QColorGroup::Highlight, palette().disabled().highlight());
+	setObjectName(name);
+	setSortingEnabled(false);
+	setRootIsDecorated(true);
+
+	setVerticalScrollMode(ScrollPerPixel);
+	setHorizontalScrollMode(ScrollPerPixel);
 
-	connect(this, SIGNAL(selectionChanged(void)),
+	setHeaderLabels(QStringList() << _("Option") << _("Name") << "N" << "M" << "Y" << _("Value"));
+
+	connect(this, SIGNAL(itemSelectionChanged(void)),
 		SLOT(updateSelection(void)));
 
 	if (name) {
 		configSettings->beginGroup(name);
-		showName = configSettings->readBoolEntry("/showName", false);
-		showRange = configSettings->readBoolEntry("/showRange", false);
-		showData = configSettings->readBoolEntry("/showData", false);
-		optMode = (enum optionMode)configSettings->readNumEntry("/optionMode", false);
+		showName = configSettings->value("/showName", false).toBool();
+		showRange = configSettings->value("/showRange", false).toBool();
+		showData = configSettings->value("/showData", false).toBool();
+		optMode = (enum optionMode)configSettings->value("/optionMode", 0).toInt();
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
 
-	for (i = 0; i < colNr; i++)
-		colMap[i] = colRevMap[i] = -1;
-	addColumn(promptColIdx, _("Option"));
+	addColumn(promptColIdx);
 
 	reinit();
 }
@@ -390,26 +367,26 @@ void ConfigList::reinit(void)
 	removeColumn(nameColIdx);
 
 	if (showName)
-		addColumn(nameColIdx, _("Name"));
+		addColumn(nameColIdx);
 	if (showRange) {
-		addColumn(noColIdx, "N");
-		addColumn(modColIdx, "M");
-		addColumn(yesColIdx, "Y");
+		addColumn(noColIdx);
+		addColumn(modColIdx);
+		addColumn(yesColIdx);
 	}
 	if (showData)
-		addColumn(dataColIdx, _("Value"));
+		addColumn(dataColIdx);
 
 	updateListAll();
 }
 
 void ConfigList::saveSettings(void)
 {
-	if (name()) {
-		configSettings->beginGroup(name());
-		configSettings->writeEntry("/showName", showName);
-		configSettings->writeEntry("/showRange", showRange);
-		configSettings->writeEntry("/showData", showData);
-		configSettings->writeEntry("/optionMode", (int)optMode);
+	if (!objectName().isEmpty()) {
+		configSettings->beginGroup(objectName());
+		configSettings->setValue("/showName", showName);
+		configSettings->setValue("/showRange", showRange);
+		configSettings->setValue("/showData", showData);
+		configSettings->setValue("/optionMode", (int)optMode);
 		configSettings->endGroup();
 	}
 }
@@ -431,7 +408,10 @@ void ConfigList::updateSelection(void)
 	struct menu *menu;
 	enum prop_type type;
 
-	ConfigItem* item = (ConfigItem*)selectedItem();
+	if (selectedItems().count() == 0)
+		return;
+
+	ConfigItem* item = (ConfigItem*)selectedItems().first();
 	if (!item)
 		return;
 
@@ -451,21 +431,23 @@ void ConfigList::updateList(ConfigItem* item)
 	if (!rootEntry) {
 		if (mode != listMode)
 			goto update;
-		Q3ListViewItemIterator it(this);
+		QTreeWidgetItemIterator it(this);
 		ConfigItem* item;
 
-		for (; it.current(); ++it) {
-			item = (ConfigItem*)it.current();
+		while (*it) {
+			item = (ConfigItem*)(*it);
 			if (!item->menu)
 				continue;
 			item->testUpdateMenu(menu_is_visible(item->menu));
+
+			++it;
 		}
 		return;
 	}
 
 	if (rootEntry != &rootmenu && (mode == singleMode ||
 	    (mode == symbolMode && rootEntry->parent != &rootmenu))) {
-		item = firstChild();
+		item = (ConfigItem *)topLevelItem(0);
 		if (!item)
 			item = new ConfigItem(this, 0, true);
 		last = item;
@@ -479,12 +461,14 @@ void ConfigList::updateList(ConfigItem* item)
 			item->testUpdateMenu(true);
 
 		updateMenuList(item, rootEntry);
-		triggerUpdate();
+		update();
+		resizeColumnToContents(0);
 		return;
 	}
 update:
 	updateMenuList(this, rootEntry);
-	triggerUpdate();
+	update();
+	resizeColumnToContents(0);
 }
 
 void ConfigList::setValue(ConfigItem* item, tristate val)
@@ -506,7 +490,7 @@ void ConfigList::setValue(ConfigItem* item, tristate val)
 		if (!sym_set_tristate_value(sym, val))
 			return;
 		if (oldval == no && item->menu->list)
-			item->setOpen(TRUE);
+			item->setExpanded(true);
 		parent()->updateList(item);
 		break;
 	}
@@ -524,7 +508,7 @@ void ConfigList::changeValue(ConfigItem* item)
 	sym = menu->sym;
 	if (!sym) {
 		if (item->menu->list)
-			item->setOpen(!item->isOpen());
+			item->setExpanded(!item->isExpanded());
 		return;
 	}
 
@@ -536,9 +520,9 @@ void ConfigList::changeValue(ConfigItem* item)
 		newexpr = sym_toggle_tristate_value(sym);
 		if (item->menu->list) {
 			if (oldexpr == newexpr)
-				item->setOpen(!item->isOpen());
+				item->setExpanded(!item->isExpanded());
 			else if (oldexpr == no)
-				item->setOpen(TRUE);
+				item->setExpanded(true);
 		}
 		if (oldexpr != newexpr)
 			parent()->updateList(item);
@@ -546,10 +530,7 @@ void ConfigList::changeValue(ConfigItem* item)
 	case S_INT:
 	case S_HEX:
 	case S_STRING:
-		if (colMap[dataColIdx] >= 0)
-			item->startRename(colMap[dataColIdx]);
-		else
-			parent()->lineEdit->show(item);
+		parent()->lineEdit->show(item);
 		break;
 	}
 }
@@ -566,8 +547,10 @@ void ConfigList::setRootMenu(struct menu *menu)
 	updateMenuList(this, 0);
 	rootEntry = menu;
 	updateListAll();
-	setSelected(currentItem(), hasFocus());
-	ensureItemVisible(currentItem());
+	if (currentItem()) {
+		currentItem()->setSelected(hasFocus());
+		scrollToItem(currentItem());
+	}
 }
 
 void ConfigList::setParentMenu(void)
@@ -580,13 +563,16 @@ void ConfigList::setParentMenu(void)
 		return;
 	setRootMenu(menu_get_parent_menu(rootEntry->parent));
 
-	Q3ListViewItemIterator it(this);
-	for (; (item = (ConfigItem*)it.current()); it++) {
+	QTreeWidgetItemIterator it(this);
+	while (*it) {
+		item = (ConfigItem *)(*it);
 		if (item->menu == oldroot) {
 			setCurrentItem(item);
-			ensureItemVisible(item);
+			scrollToItem(item);
 			break;
 		}
+
+		++it;
 	}
 }
 
@@ -597,8 +583,7 @@ void ConfigList::setParentMenu(void)
  * parent: either the menu list widget or a menu entry widget
  * menu: entry to be updated
  */
-template <class P>
-void ConfigList::updateMenuList(P* parent, struct menu* menu)
+void ConfigList::updateMenuList(ConfigItem *parent, struct menu* menu)
 {
 	struct menu* child;
 	ConfigItem* item;
@@ -607,8 +592,11 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 	enum prop_type type;
 
 	if (!menu) {
-		while ((item = parent->firstChild()))
-			delete item;
+		while (parent->childCount() > 0)
+		{
+			delete parent->takeChild(0);
+		}
+
 		return;
 	}
 
@@ -660,9 +648,74 @@ void ConfigList::updateMenuList(P* parent, struct menu* menu)
 	}
 }
 
+void ConfigList::updateMenuList(ConfigList *parent, struct menu* menu)
+{
+	struct menu* child;
+	ConfigItem* item;
+	ConfigItem* last;
+	bool visible;
+	enum prop_type type;
+
+	if (!menu) {
+		while (parent->topLevelItemCount() > 0)
+		{
+			delete parent->takeTopLevelItem(0);
+		}
+
+		return;
+	}
+
+	last = (ConfigItem*)parent->topLevelItem(0);
+	if (last && !last->goParent)
+		last = 0;
+	for (child = menu->list; child; child = child->next) {
+		item = last ? last->nextSibling() : (ConfigItem*)parent->topLevelItem(0);
+		type = child->prompt ? child->prompt->type : P_UNKNOWN;
+
+		switch (mode) {
+		case menuMode:
+			if (!(child->flags & MENU_ROOT))
+				goto hide;
+			break;
+		case symbolMode:
+			if (child->flags & MENU_ROOT)
+				goto hide;
+			break;
+		default:
+			break;
+		}
+
+		visible = menu_is_visible(child);
+		if (!menuSkip(child)) {
+			if (!child->sym && !child->list && !child->prompt)
+				continue;
+			if (!item || item->menu != child)
+				item = new ConfigItem(parent, last, child, visible);
+			else
+				item->testUpdateMenu(visible);
+
+			if (mode == fullMode || mode == menuMode || type != P_MENU)
+				updateMenuList(item, child);
+			else
+				updateMenuList(item, 0);
+			last = item;
+			continue;
+		}
+	hide:
+		if (item && item->menu == child) {
+			last = (ConfigItem*)parent->topLevelItem(0);
+			if (last == item)
+				last = 0;
+			else while (last->nextSibling() != item)
+				last = last->nextSibling();
+			delete item;
+		}
+	}
+}
+
 void ConfigList::keyPressEvent(QKeyEvent* ev)
 {
-	Q3ListViewItem* i = currentItem();
+	QTreeWidgetItem* i = currentItem();
 	ConfigItem* item;
 	struct menu *menu;
 	enum prop_type type;
@@ -714,20 +767,20 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 	ev->accept();
 }
 
-void ConfigList::contentsMousePressEvent(QMouseEvent* e)
+void ConfigList::mousePressEvent(QMouseEvent* e)
 {
 	//QPoint p(contentsToViewport(e->pos()));
 	//printf("contentsMousePressEvent: %d,%d\n", p.x(), p.y());
-	Parent::contentsMousePressEvent(e);
+	Parent::mousePressEvent(e);
 }
 
-void ConfigList::contentsMouseReleaseEvent(QMouseEvent* e)
+void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 {
-	QPoint p(contentsToViewport(e->pos()));
+	QPoint p = e->pos();
 	ConfigItem* item = (ConfigItem*)itemAt(p);
 	struct menu *menu;
 	enum prop_type ptype;
-	const QPixmap* pm;
+	QIcon icon;
 	int idx, x;
 
 	if (!item)
@@ -735,14 +788,13 @@ void ConfigList::contentsMouseReleaseEvent(QMouseEvent* e)
 
 	menu = item->menu;
 	x = header()->offset() + p.x();
-	idx = colRevMap[header()->sectionAt(x)];
+	idx = header()->logicalIndexAt(x);
 	switch (idx) {
 	case promptColIdx:
-		pm = item->pixmap(promptColIdx);
-		if (pm) {
-			int off = header()->sectionPos(0) + itemMargin() +
-				treeStepSize() * (item->depth() + (rootIsDecorated() ? 1 : 0));
-			if (x >= off && x < off + pm->width()) {
+		icon = item->pixmap(promptColIdx);
+		if (!icon.isNull()) {
+			int off = header()->sectionPosition(0) + visualRect(indexAt(p)).x() + 4; // 4 is Hardcoded image offset. There might be a way to do it properly.
+			if (x >= off && x < off + icon.availableSizes().first().width()) {
 				if (item->goParent) {
 					emit parentSelected();
 					break;
@@ -773,19 +825,19 @@ void ConfigList::contentsMouseReleaseEvent(QMouseEvent* e)
 
 skip:
 	//printf("contentsMouseReleaseEvent: %d,%d\n", p.x(), p.y());
-	Parent::contentsMouseReleaseEvent(e);
+	Parent::mouseReleaseEvent(e);
 }
 
-void ConfigList::contentsMouseMoveEvent(QMouseEvent* e)
+void ConfigList::mouseMoveEvent(QMouseEvent* e)
 {
 	//QPoint p(contentsToViewport(e->pos()));
 	//printf("contentsMouseMoveEvent: %d,%d\n", p.x(), p.y());
-	Parent::contentsMouseMoveEvent(e);
+	Parent::mouseMoveEvent(e);
 }
 
-void ConfigList::contentsMouseDoubleClickEvent(QMouseEvent* e)
+void ConfigList::mouseDoubleClickEvent(QMouseEvent* e)
 {
-	QPoint p(contentsToViewport(e->pos()));
+	QPoint p = e->pos(); // TODO: Check if this works(was contentsToViewport).
 	ConfigItem* item = (ConfigItem*)itemAt(p);
 	struct menu *menu;
 	enum prop_type ptype;
@@ -807,7 +859,7 @@ void ConfigList::contentsMouseDoubleClickEvent(QMouseEvent* e)
 
 skip:
 	//printf("contentsMouseDoubleClickEvent: %d,%d\n", p.x(), p.y());
-	Parent::contentsMouseDoubleClickEvent(e);
+	Parent::mouseDoubleClickEvent(e);
 }
 
 void ConfigList::focusInEvent(QFocusEvent *e)
@@ -818,7 +870,7 @@ void ConfigList::focusInEvent(QFocusEvent *e)
 
 	ConfigItem* item = (ConfigItem *)currentItem();
 	if (item) {
-		setSelected(item, TRUE);
+		item->setSelected(true);
 		menu = item->menu;
 	}
 	emit gotFocus(menu);
@@ -828,33 +880,33 @@ void ConfigList::contextMenuEvent(QContextMenuEvent *e)
 {
 	if (e->y() <= header()->geometry().bottom()) {
 		if (!headerPopup) {
-			Q3Action *action;
+			QAction *action;
 
-			headerPopup = new Q3PopupMenu(this);
-			action = new Q3Action(NULL, _("Show Name"), 0, this);
-			  action->setToggleAction(TRUE);
+			headerPopup = new QMenu(this);
+			action = new QAction(_("Show Name"), this);
+			  action->setCheckable(true);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowName(bool)));
 			  connect(parent(), SIGNAL(showNameChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showName);
-			  action->addTo(headerPopup);
-			action = new Q3Action(NULL, _("Show Range"), 0, this);
-			  action->setToggleAction(TRUE);
+			  action->setChecked(showName);
+			  headerPopup->addAction(action);
+			action = new QAction(_("Show Range"), this);
+			  action->setCheckable(true);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowRange(bool)));
 			  connect(parent(), SIGNAL(showRangeChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showRange);
-			  action->addTo(headerPopup);
-			action = new Q3Action(NULL, _("Show Data"), 0, this);
-			  action->setToggleAction(TRUE);
+			  action->setChecked(showRange);
+			  headerPopup->addAction(action);
+			action = new QAction(_("Show Data"), this);
+			  action->setCheckable(true);
 			  connect(action, SIGNAL(toggled(bool)),
 				  parent(), SLOT(setShowData(bool)));
 			  connect(parent(), SIGNAL(showDataChanged(bool)),
 				  action, SLOT(setOn(bool)));
-			  action->setOn(showData);
-			  action->addTo(headerPopup);
+			  action->setChecked(showData);
+			  headerPopup->addAction(action);
 		}
 		headerPopup->exec(e->globalPos());
 		e->accept();
@@ -868,11 +920,17 @@ QAction *ConfigView::showAllAction;
 QAction *ConfigView::showPromptAction;
 
 ConfigView::ConfigView(QWidget* parent, const char *name)
-	: Parent(parent, name)
+	: Parent(parent)
 {
-	list = new ConfigList(this, name);
+	setObjectName(name);
+	QVBoxLayout *verticalLayout = new QVBoxLayout(this);
+	verticalLayout->setContentsMargins(0, 0, 0, 0);
+
+	list = new ConfigList(this);
+	verticalLayout->addWidget(list);
 	lineEdit = new ConfigLineEdit(this);
 	lineEdit->hide();
+	verticalLayout->addWidget(lineEdit);
 
 	this->nextView = viewList;
 	viewList = this;
@@ -931,10 +989,13 @@ void ConfigView::setShowData(bool b)
 
 void ConfigList::setAllOpen(bool open)
 {
-	Q3ListViewItemIterator it(this);
+	QTreeWidgetItemIterator it(this);
+
+	while (*it) {
+		(*it)->setExpanded(open);
 
-	for (; it.current(); it++)
-		it.current()->setOpen(open);
+		++it;
+	}
 }
 
 void ConfigView::updateList(ConfigItem* item)
@@ -954,11 +1015,14 @@ void ConfigView::updateListAll(void)
 }
 
 ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
-	: Parent(parent, name), sym(0), _menu(0)
+	: Parent(parent), sym(0), _menu(0)
 {
-	if (name) {
-		configSettings->beginGroup(name);
-		_showDebug = configSettings->readBoolEntry("/showDebug", false);
+	setObjectName(name);
+
+
+	if (!objectName().isEmpty()) {
+		configSettings->beginGroup(objectName());
+		setShowDebug(configSettings->value("/showDebug", false).toBool());
 		configSettings->endGroup();
 		connect(configApp, SIGNAL(aboutToQuit()), SLOT(saveSettings()));
 	}
@@ -966,9 +1030,9 @@ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
 
 void ConfigInfoView::saveSettings(void)
 {
-	if (name()) {
-		configSettings->beginGroup(name());
-		configSettings->writeEntry("/showDebug", showDebug());
+	if (!objectName().isEmpty()) {
+		configSettings->beginGroup(objectName());
+		configSettings->setValue("/showDebug", showDebug());
 		configSettings->endGroup();
 	}
 }
@@ -1127,8 +1191,8 @@ QString ConfigInfoView::print_filter(const QString &str)
 {
 	QRegExp re("[<>&\"\\n]");
 	QString res = str;
-	for (int i = 0; (i = res.find(re, i)) >= 0;) {
-		switch (res[i].latin1()) {
+	for (int i = 0; (i = res.indexOf(re, i)) >= 0;) {
+		switch (res[i].toLatin1()) {
 		case '<':
 			res.replace(i, 1, "&lt;");
 			i += 4;
@@ -1167,37 +1231,42 @@ void ConfigInfoView::expr_print_help(void *data, struct symbol *sym, const char
 		*text += str2;
 }
 
-Q3PopupMenu* ConfigInfoView::createPopupMenu(const QPoint& pos)
+QMenu* ConfigInfoView::createStandardContextMenu(const QPoint & pos)
 {
-	Q3PopupMenu* popup = Parent::createPopupMenu(pos);
-	Q3Action* action = new Q3Action(NULL, _("Show Debug Info"), 0, popup);
-	  action->setToggleAction(TRUE);
+	QMenu* popup = Parent::createStandardContextMenu(pos);
+	QAction* action = new QAction(_("Show Debug Info"), popup);
+	  action->setCheckable(true);
 	  connect(action, SIGNAL(toggled(bool)), SLOT(setShowDebug(bool)));
 	  connect(this, SIGNAL(showDebugChanged(bool)), action, SLOT(setOn(bool)));
-	  action->setOn(showDebug());
-	popup->insertSeparator();
-	action->addTo(popup);
+	  action->setChecked(showDebug());
+	popup->addSeparator();
+	popup->addAction(action);
 	return popup;
 }
 
-void ConfigInfoView::contentsContextMenuEvent(QContextMenuEvent *e)
+void ConfigInfoView::contextMenuEvent(QContextMenuEvent *e)
 {
-	Parent::contentsContextMenuEvent(e);
+	Parent::contextMenuEvent(e);
 }
 
 ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *name)
-	: Parent(parent, name), result(NULL)
+	: Parent(parent), result(NULL)
 {
-	setCaption("Search Config");
+	setObjectName(name);
+	setWindowTitle("Search Config");
 
-	QVBoxLayout* layout1 = new QVBoxLayout(this, 11, 6);
-	QHBoxLayout* layout2 = new QHBoxLayout(0, 0, 6);
+	QVBoxLayout* layout1 = new QVBoxLayout(this);
+	layout1->setContentsMargins(11, 11, 11, 11);
+	layout1->setSpacing(6);
+	QHBoxLayout* layout2 = new QHBoxLayout(0);
+	layout2->setContentsMargins(0, 0, 0, 0);
+	layout2->setSpacing(6);
 	layout2->addWidget(new QLabel(_("Find:"), this));
 	editField = new QLineEdit(this);
 	connect(editField, SIGNAL(returnPressed()), SLOT(search()));
 	layout2->addWidget(editField);
 	searchButton = new QPushButton(_("Search"), this);
-	searchButton->setAutoDefault(FALSE);
+	searchButton->setAutoDefault(false);
 	connect(searchButton, SIGNAL(clicked()), SLOT(search()));
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
@@ -1215,19 +1284,19 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 	layout1->addWidget(split);
 
 	if (name) {
-		int x, y, width, height;
+		QVariant x, y;
+		int width, height;
 		bool ok;
 
 		configSettings->beginGroup(name);
-		width = configSettings->readNumEntry("/window width", parent->width() / 2);
-		height = configSettings->readNumEntry("/window height", parent->height() / 2);
+		width = configSettings->value("/window width", parent->width() / 2).toInt();
+		height = configSettings->value("/window height", parent->height() / 2).toInt();
 		resize(width, height);
-		x = configSettings->readNumEntry("/window x", 0, &ok);
-		if (ok)
-			y = configSettings->readNumEntry("/window y", 0, &ok);
-		if (ok)
-			move(x, y);
-		Q3ValueList<int> sizes = configSettings->readSizes("/split", &ok);
+		x = configSettings->value("/window x");
+		y = configSettings->value("/window y");
+		if ((x.isValid())&&(y.isValid()))
+			move(x.toInt(), y.toInt());
+		QList<int> sizes = configSettings->readSizes("/split", &ok);
 		if (ok)
 			split->setSizes(sizes);
 		configSettings->endGroup();
@@ -1237,12 +1306,12 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 
 void ConfigSearchWindow::saveSettings(void)
 {
-	if (name()) {
-		configSettings->beginGroup(name());
-		configSettings->writeEntry("/window x", pos().x());
-		configSettings->writeEntry("/window y", pos().y());
-		configSettings->writeEntry("/window width", size().width());
-		configSettings->writeEntry("/window height", size().height());
+	if (!objectName().isEmpty()) {
+		configSettings->beginGroup(objectName());
+		configSettings->setValue("/window x", pos().x());
+		configSettings->setValue("/window y", pos().y());
+		configSettings->setValue("/window width", size().width());
+		configSettings->setValue("/window height", size().height());
 		configSettings->writeSizes("/split", split->sizes());
 		configSettings->endGroup();
 	}
@@ -1258,7 +1327,7 @@ void ConfigSearchWindow::search(void)
 	list->list->clear();
 	info->clear();
 
-	result = sym_re_search(editField->text().latin1());
+	result = sym_re_search(editField->text().toLatin1());
 	if (!result)
 		return;
 	for (p = result; *p; p++) {
@@ -1275,29 +1344,25 @@ ConfigMainWindow::ConfigMainWindow(void)
 	: searchWindow(0)
 {
 	QMenuBar* menu;
-	bool ok;
-	int x, y, width, height;
+	bool ok = true;
+	QVariant x, y;
+	int width, height;
 	char title[256];
 
 	QDesktopWidget *d = configApp->desktop();
 	snprintf(title, sizeof(title), "%s%s",
 		rootmenu.prompt->text,
-#if QT_VERSION < 0x040000
-		" (Qt3)"
-#else
 		""
-#endif
 		);
-	setCaption(title);
+	setWindowTitle(title);
 
-	width = configSettings->readNumEntry("/window width", d->width() - 64);
-	height = configSettings->readNumEntry("/window height", d->height() - 64);
+	width = configSettings->value("/window width", d->width() - 64).toInt();
+	height = configSettings->value("/window height", d->height() - 64).toInt();
 	resize(width, height);
-	x = configSettings->readNumEntry("/window x", 0, &ok);
-	if (ok)
-		y = configSettings->readNumEntry("/window y", 0, &ok);
-	if (ok)
-		move(x, y);
+	x = configSettings->value("/window x");
+	y = configSettings->value("/window y");
+	if ((x.isValid())&&(y.isValid()))
+		move(x.toInt(), y.toInt());
 
 	split1 = new QSplitter(this);
 	split1->setOrientation(Qt::Horizontal);
@@ -1314,127 +1379,116 @@ ConfigMainWindow::ConfigMainWindow(void)
 	configList = configView->list;
 
 	helpText = new ConfigInfoView(split2, "help");
-	helpText->setTextFormat(Qt::RichText);
 
 	setTabOrder(configList, helpText);
 	configList->setFocus();
 
 	menu = menuBar();
-	toolBar = new Q3ToolBar("Tools", this);
-
-	backAction = new Q3Action("Back", QPixmap(xpm_back), _("Back"), 0, this);
-	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
-	  backAction->setEnabled(FALSE);
-	Q3Action *quitAction = new Q3Action("Quit", _("&Quit"), Qt::CTRL + Qt::Key_Q, this);
-	  connect(quitAction, SIGNAL(activated()), SLOT(close()));
-	Q3Action *loadAction = new Q3Action("Load", QPixmap(xpm_load), _("&Load"), Qt::CTRL + Qt::Key_L, this);
-	  connect(loadAction, SIGNAL(activated()), SLOT(loadConfig()));
-	saveAction = new Q3Action("Save", QPixmap(xpm_save), _("&Save"), Qt::CTRL + Qt::Key_S, this);
-	  connect(saveAction, SIGNAL(activated()), SLOT(saveConfig()));
+	toolBar = new QToolBar("Tools", this);
+	addToolBar(toolBar);
+
+	backAction = new QAction(QPixmap(xpm_back), _("Back"), this);
+	  connect(backAction, SIGNAL(triggered(bool)), SLOT(goBack()));
+	  backAction->setEnabled(false);
+	QAction *quitAction = new QAction(_("&Quit"), this);
+	quitAction->setShortcut(Qt::CTRL + Qt::Key_Q);
+	  connect(quitAction, SIGNAL(triggered(bool)), SLOT(close()));
+	QAction *loadAction = new QAction(QPixmap(xpm_load), _("&Load"), this);
+	loadAction->setShortcut(Qt::CTRL + Qt::Key_L);
+	  connect(loadAction, SIGNAL(triggered(bool)), SLOT(loadConfig()));
+	saveAction = new QAction(QPixmap(xpm_save), _("&Save"), this);
+	saveAction->setShortcut(Qt::CTRL + Qt::Key_S);
+	  connect(saveAction, SIGNAL(triggered(bool)), SLOT(saveConfig()));
 	conf_set_changed_callback(conf_changed);
 	// Set saveAction's initial state
 	conf_changed();
-	Q3Action *saveAsAction = new Q3Action("Save As...", _("Save &As..."), 0, this);
-	  connect(saveAsAction, SIGNAL(activated()), SLOT(saveConfigAs()));
-	Q3Action *searchAction = new Q3Action("Find", _("&Find"), Qt::CTRL + Qt::Key_F, this);
-	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
-	Q3Action *singleViewAction = new Q3Action("Single View", QPixmap(xpm_single_view), _("Single View"), 0, this);
-	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
-	Q3Action *splitViewAction = new Q3Action("Split View", QPixmap(xpm_split_view), _("Split View"), 0, this);
-	  connect(splitViewAction, SIGNAL(activated()), SLOT(showSplitView()));
-	Q3Action *fullViewAction = new Q3Action("Full View", QPixmap(xpm_tree_view), _("Full View"), 0, this);
-	  connect(fullViewAction, SIGNAL(activated()), SLOT(showFullView()));
-
-	Q3Action *showNameAction = new Q3Action(NULL, _("Show Name"), 0, this);
-	  showNameAction->setToggleAction(TRUE);
+	QAction *saveAsAction = new QAction(_("Save &As..."), this);
+	  connect(saveAsAction, SIGNAL(triggered(bool)), SLOT(saveConfigAs()));
+	QAction *searchAction = new QAction(_("&Find"), this);
+	searchAction->setShortcut(Qt::CTRL + Qt::Key_F);
+	  connect(searchAction, SIGNAL(triggered(bool)), SLOT(searchConfig()));
+	singleViewAction = new QAction(QPixmap(xpm_single_view), _("Single View"), this);
+	singleViewAction->setCheckable(true);
+	  connect(singleViewAction, SIGNAL(triggered(bool)), SLOT(showSingleView()));
+	splitViewAction = new QAction(QPixmap(xpm_split_view), _("Split View"), this);
+	splitViewAction->setCheckable(true);
+	  connect(splitViewAction, SIGNAL(triggered(bool)), SLOT(showSplitView()));
+	fullViewAction = new QAction(QPixmap(xpm_tree_view), _("Full View"), this);
+	fullViewAction->setCheckable(true);
+	  connect(fullViewAction, SIGNAL(triggered(bool)), SLOT(showFullView()));
+
+	QAction *showNameAction = new QAction(_("Show Name"), this);
+	  showNameAction->setCheckable(true);
 	  connect(showNameAction, SIGNAL(toggled(bool)), configView, SLOT(setShowName(bool)));
-	  connect(configView, SIGNAL(showNameChanged(bool)), showNameAction, SLOT(setOn(bool)));
-	  showNameAction->setOn(configView->showName());
-	Q3Action *showRangeAction = new Q3Action(NULL, _("Show Range"), 0, this);
-	  showRangeAction->setToggleAction(TRUE);
+	  showNameAction->setChecked(configView->showName());
+	QAction *showRangeAction = new QAction(_("Show Range"), this);
+	  showRangeAction->setCheckable(true);
 	  connect(showRangeAction, SIGNAL(toggled(bool)), configView, SLOT(setShowRange(bool)));
-	  connect(configView, SIGNAL(showRangeChanged(bool)), showRangeAction, SLOT(setOn(bool)));
-	  showRangeAction->setOn(configList->showRange);
-	Q3Action *showDataAction = new Q3Action(NULL, _("Show Data"), 0, this);
-	  showDataAction->setToggleAction(TRUE);
+	QAction *showDataAction = new QAction(_("Show Data"), this);
+	  showDataAction->setCheckable(true);
 	  connect(showDataAction, SIGNAL(toggled(bool)), configView, SLOT(setShowData(bool)));
-	  connect(configView, SIGNAL(showDataChanged(bool)), showDataAction, SLOT(setOn(bool)));
-	  showDataAction->setOn(configList->showData);
 
 	QActionGroup *optGroup = new QActionGroup(this);
-	optGroup->setExclusive(TRUE);
-	connect(optGroup, SIGNAL(selected(QAction *)), configView,
+	optGroup->setExclusive(true);
+	connect(optGroup, SIGNAL(triggered(QAction*)), configView,
 		SLOT(setOptionMode(QAction *)));
-	connect(optGroup, SIGNAL(selected(QAction *)), menuView,
+	connect(optGroup, SIGNAL(triggered(QAction *)), menuView,
 		SLOT(setOptionMode(QAction *)));
 
-#if QT_VERSION >= 0x040000
 	configView->showNormalAction = new QAction(_("Show Normal Options"), optGroup);
 	configView->showAllAction = new QAction(_("Show All Options"), optGroup);
 	configView->showPromptAction = new QAction(_("Show Prompt Options"), optGroup);
-#else
-	configView->showNormalAction = new QAction(_("Show Normal Options"), 0, optGroup);
-	configView->showAllAction = new QAction(_("Show All Options"), 0, optGroup);
-	configView->showPromptAction = new QAction(_("Show Prompt Options"), 0, optGroup);
-#endif
-	configView->showNormalAction->setToggleAction(TRUE);
-	configView->showNormalAction->setOn(configList->optMode == normalOpt);
-	configView->showAllAction->setToggleAction(TRUE);
-	configView->showAllAction->setOn(configList->optMode == allOpt);
-	configView->showPromptAction->setToggleAction(TRUE);
-	configView->showPromptAction->setOn(configList->optMode == promptOpt);
-
-	Q3Action *showDebugAction = new Q3Action(NULL, _("Show Debug Info"), 0, this);
-	  showDebugAction->setToggleAction(TRUE);
+	configView->showNormalAction->setCheckable(true);
+	configView->showAllAction->setCheckable(true);
+	configView->showPromptAction->setCheckable(true);
+
+	QAction *showDebugAction = new QAction( _("Show Debug Info"), this);
+	  showDebugAction->setCheckable(true);
 	  connect(showDebugAction, SIGNAL(toggled(bool)), helpText, SLOT(setShowDebug(bool)));
-	  connect(helpText, SIGNAL(showDebugChanged(bool)), showDebugAction, SLOT(setOn(bool)));
-	  showDebugAction->setOn(helpText->showDebug());
+	  showDebugAction->setChecked(helpText->showDebug());
 
-	Q3Action *showIntroAction = new Q3Action(NULL, _("Introduction"), 0, this);
-	  connect(showIntroAction, SIGNAL(activated()), SLOT(showIntro()));
-	Q3Action *showAboutAction = new Q3Action(NULL, _("About"), 0, this);
-	  connect(showAboutAction, SIGNAL(activated()), SLOT(showAbout()));
+	QAction *showIntroAction = new QAction( _("Introduction"), this);
+	  connect(showIntroAction, SIGNAL(triggered(bool)), SLOT(showIntro()));
+	QAction *showAboutAction = new QAction( _("About"), this);
+	  connect(showAboutAction, SIGNAL(triggered(bool)), SLOT(showAbout()));
 
 	// init tool bar
-	backAction->addTo(toolBar);
+	toolBar->addAction(backAction);
 	toolBar->addSeparator();
-	loadAction->addTo(toolBar);
-	saveAction->addTo(toolBar);
+	toolBar->addAction(loadAction);
+	toolBar->addAction(saveAction);
 	toolBar->addSeparator();
-	singleViewAction->addTo(toolBar);
-	splitViewAction->addTo(toolBar);
-	fullViewAction->addTo(toolBar);
+	toolBar->addAction(singleViewAction);
+	toolBar->addAction(splitViewAction);
+	toolBar->addAction(fullViewAction);
 
 	// create config menu
-	Q3PopupMenu* config = new Q3PopupMenu(this);
-	menu->insertItem(_("&File"), config);
-	loadAction->addTo(config);
-	saveAction->addTo(config);
-	saveAsAction->addTo(config);
-	config->insertSeparator();
-	quitAction->addTo(config);
+	QMenu* config = menu->addMenu(_("&File"));
+	config->addAction(loadAction);
+	config->addAction(saveAction);
+	config->addAction(saveAsAction);
+	config->addSeparator();
+	config->addAction(quitAction);
 
 	// create edit menu
-	Q3PopupMenu* editMenu = new Q3PopupMenu(this);
-	menu->insertItem(_("&Edit"), editMenu);
-	searchAction->addTo(editMenu);
+	QMenu* editMenu = menu->addMenu(_("&Edit"));
+	editMenu->addAction(searchAction);
 
 	// create options menu
-	Q3PopupMenu* optionMenu = new Q3PopupMenu(this);
-	menu->insertItem(_("&Option"), optionMenu);
-	showNameAction->addTo(optionMenu);
-	showRangeAction->addTo(optionMenu);
-	showDataAction->addTo(optionMenu);
-	optionMenu->insertSeparator();
-	optGroup->addTo(optionMenu);
-	optionMenu->insertSeparator();
+	QMenu* optionMenu = menu->addMenu(_("&Option"));
+	optionMenu->addAction(showNameAction);
+	optionMenu->addAction(showRangeAction);
+	optionMenu->addAction(showDataAction);
+	optionMenu->addSeparator();
+	optionMenu->addActions(optGroup->actions());
+	optionMenu->addSeparator();
+	optionMenu->addAction(showDebugAction);
 
 	// create help menu
-	Q3PopupMenu* helpMenu = new Q3PopupMenu(this);
-	menu->insertSeparator();
-	menu->insertItem(_("&Help"), helpMenu);
-	showIntroAction->addTo(helpMenu);
-	showAboutAction->addTo(helpMenu);
+	menu->addSeparator();
+	QMenu* helpMenu = menu->addMenu(_("&Help"));
+	helpMenu->addAction(showIntroAction);
+	helpMenu->addAction(showAboutAction);
 
 	connect(configList, SIGNAL(menuChanged(struct menu *)),
 		helpText, SLOT(setInfo(struct menu *)));
@@ -1456,7 +1510,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 	connect(helpText, SIGNAL(menuSelected(struct menu *)),
 		SLOT(setMenuLink(struct menu *)));
 
-	QString listMode = configSettings->readEntry("/listMode", "symbol");
+	QString listMode = configSettings->value("/listMode", "symbol").toString();
 	if (listMode == "single")
 		showSingleView();
 	else if (listMode == "full")
@@ -1465,7 +1519,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 		showSplitView();
 
 	// UI setup done, restore splitter positions
-	Q3ValueList<int> sizes = configSettings->readSizes("/split1", &ok);
+	QList<int> sizes = configSettings->readSizes("/split1", &ok);
 	if (ok)
 		split1->setSizes(sizes);
 
@@ -1476,7 +1530,7 @@ ConfigMainWindow::ConfigMainWindow(void)
 
 void ConfigMainWindow::loadConfig(void)
 {
-	QString s = Q3FileDialog::getOpenFileName(conf_get_configname(), NULL, this);
+	QString s = QFileDialog::getOpenFileName(this, "", conf_get_configname());
 	if (s.isNull())
 		return;
 	if (conf_read(QFile::encodeName(s)))
@@ -1495,7 +1549,7 @@ bool ConfigMainWindow::saveConfig(void)
 
 void ConfigMainWindow::saveConfigAs(void)
 {
-	QString s = Q3FileDialog::getSaveFileName(conf_get_configname(), NULL, this);
+	QString s = QFileDialog::getSaveFileName(this, "", conf_get_configname());
 	if (s.isNull())
 		return;
 	saveConfig();
@@ -1512,9 +1566,9 @@ void ConfigMainWindow::changeMenu(struct menu *menu)
 {
 	configList->setRootMenu(menu);
 	if (configList->rootEntry->parent == &rootmenu)
-		backAction->setEnabled(FALSE);
+		backAction->setEnabled(false);
 	else
-		backAction->setEnabled(TRUE);
+		backAction->setEnabled(true);
 }
 
 void ConfigMainWindow::setMenuLink(struct menu *menu)
@@ -1546,8 +1600,8 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 				return;
 			item = menuList->findConfigItem(parent);
 			if (item) {
-				menuList->setSelected(item, TRUE);
-				menuList->ensureItemVisible(item);
+				item->setSelected(true);
+				menuList->scrollToItem(item);
 			}
 			list->setRootMenu(parent);
 		}
@@ -1562,8 +1616,8 @@ void ConfigMainWindow::setMenuLink(struct menu *menu)
 	if (list) {
 		item = list->findConfigItem(menu);
 		if (item) {
-			list->setSelected(item, TRUE);
-			list->ensureItemVisible(item);
+			item->setSelected(true);
+			list->scrollToItem(item);
 			list->setFocus();
 		}
 	}
@@ -1577,15 +1631,21 @@ void ConfigMainWindow::listFocusChanged(void)
 
 void ConfigMainWindow::goBack(void)
 {
-	ConfigItem* item;
+	ConfigItem* item, *oldSelection;
 
 	configList->setParentMenu();
 	if (configList->rootEntry == &rootmenu)
-		backAction->setEnabled(FALSE);
-	item = (ConfigItem*)menuList->selectedItem();
+		backAction->setEnabled(false);
+
+	if (menuList->selectedItems().count() == 0)
+		return;
+
+	item = (ConfigItem*)menuList->selectedItems().first();
+	oldSelection = item;
 	while (item) {
 		if (item->menu == configList->rootEntry) {
-			menuList->setSelected(item, TRUE);
+			oldSelection->setSelected(false);
+			item->setSelected(true);
 			break;
 		}
 		item = (ConfigItem*)item->parent();
@@ -1594,6 +1654,13 @@ void ConfigMainWindow::goBack(void)
 
 void ConfigMainWindow::showSingleView(void)
 {
+	singleViewAction->setEnabled(false);
+	singleViewAction->setChecked(true);
+	splitViewAction->setEnabled(true);
+	splitViewAction->setChecked(false);
+	fullViewAction->setEnabled(true);
+	fullViewAction->setChecked(false);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = singleMode;
@@ -1601,28 +1668,41 @@ void ConfigMainWindow::showSingleView(void)
 		configList->updateListAll();
 	else
 		configList->setRootMenu(&rootmenu);
-	configList->setAllOpen(TRUE);
 	configList->setFocus();
 }
 
 void ConfigMainWindow::showSplitView(void)
 {
+	singleViewAction->setEnabled(true);
+	singleViewAction->setChecked(false);
+	splitViewAction->setEnabled(false);
+	splitViewAction->setChecked(true);
+	fullViewAction->setEnabled(true);
+	fullViewAction->setChecked(false);
+
 	configList->mode = symbolMode;
 	if (configList->rootEntry == &rootmenu)
 		configList->updateListAll();
 	else
 		configList->setRootMenu(&rootmenu);
-	configList->setAllOpen(TRUE);
+	configList->setAllOpen(true);
 	configApp->processEvents();
 	menuList->mode = menuMode;
 	menuList->setRootMenu(&rootmenu);
-	menuList->setAllOpen(TRUE);
+	menuList->setAllOpen(true);
 	menuView->show();
 	menuList->setFocus();
 }
 
 void ConfigMainWindow::showFullView(void)
 {
+	singleViewAction->setEnabled(true);
+	singleViewAction->setChecked(false);
+	splitViewAction->setEnabled(true);
+	splitViewAction->setChecked(false);
+	fullViewAction->setEnabled(false);
+	fullViewAction->setChecked(true);
+
 	menuView->hide();
 	menuList->setRootMenu(0);
 	configList->mode = fullMode;
@@ -1630,7 +1710,6 @@ void ConfigMainWindow::showFullView(void)
 		configList->updateListAll();
 	else
 		configList->setRootMenu(&rootmenu);
-	configList->setAllOpen(FALSE);
 	configList->setFocus();
 }
 
@@ -1684,7 +1763,8 @@ void ConfigMainWindow::showIntro(void)
 
 void ConfigMainWindow::showAbout(void)
 {
-	static const QString str = _("qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n\n"
+	static const QString str = _("qconf is Copyright (C) 2002 Roman Zippel <zippel@linux-m68k.org>.\n"
+		"Copyright (C) 2015 Boris Barbulovski <bbarbulovski@gmail.com>.\n\n"
 		"Bug reports and feature request can also be entered at http://bugzilla.kernel.org/\n");
 
 	QMessageBox::information(this, "qconf", str);
@@ -1692,10 +1772,10 @@ void ConfigMainWindow::showAbout(void)
 
 void ConfigMainWindow::saveSettings(void)
 {
-	configSettings->writeEntry("/window x", pos().x());
-	configSettings->writeEntry("/window y", pos().y());
-	configSettings->writeEntry("/window width", size().width());
-	configSettings->writeEntry("/window height", size().height());
+	configSettings->setValue("/window x", pos().x());
+	configSettings->setValue("/window y", pos().y());
+	configSettings->setValue("/window width", size().width());
+	configSettings->setValue("/window height", size().height());
 
 	QString entry;
 	switch(configList->mode) {
@@ -1714,7 +1794,7 @@ void ConfigMainWindow::saveSettings(void)
 	default:
 		break;
 	}
-	configSettings->writeEntry("/listMode", entry);
+	configSettings->setValue("/listMode", entry);
 
 	configSettings->writeSizes("/split1", split1->sizes());
 	configSettings->writeSizes("/split2", split2->sizes());
@@ -1746,7 +1826,7 @@ static const char *progname;
 
 static void usage(void)
 {
-	printf(_("%s <config>\n"), progname);
+	printf(_("%s [-s] <config>\n").toLatin1().constData(), progname);
 	exit(0);
 }
 
@@ -1762,6 +1842,9 @@ int main(int ac, char** av)
 	configApp = new QApplication(ac, av);
 	if (ac > 1 && av[1][0] == '-') {
 		switch (av[1][1]) {
+		case 's':
+			conf_set_message_callback(NULL);
+			break;
 		case 'h':
 		case '?':
 			usage();
@@ -1782,7 +1865,6 @@ int main(int ac, char** av)
 	v = new ConfigMainWindow();
 
 	//zconfdump(stdout);
-	configApp->setMainWidget(v);
 	configApp->connect(configApp, SIGNAL(lastWindowClosed()), SLOT(quit()));
 	configApp->connect(configApp, SIGNAL(aboutToQuit()), v, SLOT(saveSettings()));
 	v->show();
@@ -1790,6 +1872,8 @@ int main(int ac, char** av)
 
 	configSettings->endGroup();
 	delete configSettings;
+	delete v;
+	delete configApp;
 
 	return 0;
 }
diff --git a/support/kconfig/qconf.h b/support/kconfig/qconf.h
index bde0c6b6f9..a40036d1b0 100644
--- a/support/kconfig/qconf.h
+++ b/support/kconfig/qconf.h
@@ -3,26 +3,18 @@
  * Released under the terms of the GNU GPL v2.0.
  */
 
-#if QT_VERSION < 0x040000
-#include <qlistview.h>
-#else
-#include <q3listview.h>
-#endif
+#include <QTextBrowser>
+#include <QTreeWidget>
+#include <QMainWindow>
+#include <QHeaderView>
 #include <qsettings.h>
-
-#if QT_VERSION < 0x040000
-#define Q3ValueList             QValueList
-#define Q3PopupMenu             QPopupMenu
-#define Q3ListView              QListView
-#define Q3ListViewItem          QListViewItem
-#define Q3VBox                  QVBox
-#define Q3TextBrowser           QTextBrowser
-#define Q3MainWindow            QMainWindow
-#define Q3Action                QAction
-#define Q3ToolBar               QToolBar
-#define Q3ListViewItemIterator  QListViewItemIterator
-#define Q3FileDialog            QFileDialog
-#endif
+#include <QPushButton>
+#include <QSettings>
+#include <QLineEdit>
+#include <QSplitter>
+#include <QCheckBox>
+#include <QDialog>
+#include "expr.h"
 
 class ConfigView;
 class ConfigList;
@@ -33,8 +25,8 @@ class ConfigMainWindow;
 class ConfigSettings : public QSettings {
 public:
 	ConfigSettings();
-	Q3ValueList<int> readSizes(const QString& key, bool *ok);
-	bool writeSizes(const QString& key, const Q3ValueList<int>& value);
+	QList<int> readSizes(const QString& key, bool *ok);
+	bool writeSizes(const QString& key, const QList<int>& value);
 };
 
 enum colIdx {
@@ -47,9 +39,9 @@ enum optionMode {
 	normalOpt = 0, allOpt, promptOpt
 };
 
-class ConfigList : public Q3ListView {
+class ConfigList : public QTreeWidget {
 	Q_OBJECT
-	typedef class Q3ListView Parent;
+	typedef class QTreeWidget Parent;
 public:
 	ConfigList(ConfigView* p, const char *name = 0);
 	void reinit(void);
@@ -61,10 +53,10 @@ public:
 
 protected:
 	void keyPressEvent(QKeyEvent *e);
-	void contentsMousePressEvent(QMouseEvent *e);
-	void contentsMouseReleaseEvent(QMouseEvent *e);
-	void contentsMouseMoveEvent(QMouseEvent *e);
-	void contentsMouseDoubleClickEvent(QMouseEvent *e);
+	void mousePressEvent(QMouseEvent *e);
+	void mouseReleaseEvent(QMouseEvent *e);
+	void mouseMoveEvent(QMouseEvent *e);
+	void mouseDoubleClickEvent(QMouseEvent *e);
 	void focusInEvent(QFocusEvent *e);
 	void contextMenuEvent(QContextMenuEvent *e);
 
@@ -95,32 +87,23 @@ public:
 	}
 	ConfigItem* firstChild() const
 	{
-		return (ConfigItem *)Parent::firstChild();
-	}
-	int mapIdx(colIdx idx)
-	{
-		return colMap[idx];
+		return (ConfigItem *)children().first();
 	}
-	void addColumn(colIdx idx, const QString& label)
+	void addColumn(colIdx idx)
 	{
-		colMap[idx] = Parent::addColumn(label);
-		colRevMap[colMap[idx]] = idx;
+		showColumn(idx);
 	}
 	void removeColumn(colIdx idx)
 	{
-		int col = colMap[idx];
-		if (col >= 0) {
-			Parent::removeColumn(col);
-			colRevMap[col] = colMap[idx] = -1;
-		}
+		hideColumn(idx);
 	}
 	void setAllOpen(bool open);
 	void setParentMenu(void);
 
 	bool menuSkip(struct menu *);
 
-	template <class P>
-	void updateMenuList(P*, struct menu*);
+	void updateMenuList(ConfigItem *parent, struct menu*);
+	void updateMenuList(ConfigList *parent, struct menu*);
 
 	bool updateAll;
 
@@ -132,30 +115,26 @@ public:
 	enum listMode mode;
 	enum optionMode optMode;
 	struct menu *rootEntry;
-	QColorGroup disabledColorGroup;
-	QColorGroup inactivedColorGroup;
-	Q3PopupMenu* headerPopup;
-
-private:
-	int colMap[colNr];
-	int colRevMap[colNr];
+	QPalette disabledColorGroup;
+	QPalette inactivedColorGroup;
+	QMenu* headerPopup;
 };
 
-class ConfigItem : public Q3ListViewItem {
-	typedef class Q3ListViewItem Parent;
+class ConfigItem : public QTreeWidgetItem {
+	typedef class QTreeWidgetItem Parent;
 public:
-	ConfigItem(Q3ListView *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	ConfigItem(ConfigList *parent, ConfigItem *after, struct menu *m, bool v)
+	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
 	{
 		init();
 	}
 	ConfigItem(ConfigItem *parent, ConfigItem *after, struct menu *m, bool v)
-	: Parent(parent, after), menu(m), visible(v), goParent(false)
+	: Parent(parent, after), nextItem(0), menu(m), visible(v), goParent(false)
 	{
 		init();
 	}
-	ConfigItem(Q3ListView *parent, ConfigItem *after, bool v)
-	: Parent(parent, after), menu(0), visible(v), goParent(true)
+	ConfigItem(ConfigList *parent, ConfigItem *after, bool v)
+	: Parent(parent, after), nextItem(0), menu(0), visible(v), goParent(true)
 	{
 		init();
 	}
@@ -166,33 +145,43 @@ public:
 	void testUpdateMenu(bool v);
 	ConfigList* listView() const
 	{
-		return (ConfigList*)Parent::listView();
+		return (ConfigList*)Parent::treeWidget();
 	}
 	ConfigItem* firstChild() const
 	{
-		return (ConfigItem *)Parent::firstChild();
+		return (ConfigItem *)Parent::child(0);
 	}
-	ConfigItem* nextSibling() const
+	ConfigItem* nextSibling()
 	{
-		return (ConfigItem *)Parent::nextSibling();
+		ConfigItem *ret = NULL;
+		ConfigItem *_parent = (ConfigItem *)parent();
+
+		if(_parent) {
+			ret = (ConfigItem *)_parent->child(_parent->indexOfChild(this)+1);
+		} else {
+			QTreeWidget *_treeWidget = treeWidget();
+			ret = (ConfigItem *)_treeWidget->topLevelItem(_treeWidget->indexOfTopLevelItem(this)+1);
+		}
+
+		return ret;
 	}
 	void setText(colIdx idx, const QString& text)
 	{
-		Parent::setText(listView()->mapIdx(idx), text);
+		Parent::setText(idx, text);
 	}
 	QString text(colIdx idx) const
 	{
-		return Parent::text(listView()->mapIdx(idx));
+		return Parent::text(idx);
 	}
-	void setPixmap(colIdx idx, const QPixmap& pm)
+	void setPixmap(colIdx idx, const QIcon &icon)
 	{
-		Parent::setPixmap(listView()->mapIdx(idx), pm);
+		Parent::setIcon(idx, icon);
 	}
-	const QPixmap* pixmap(colIdx idx) const
+	const QIcon pixmap(colIdx idx) const
 	{
-		return Parent::pixmap(listView()->mapIdx(idx));
+		return icon(idx);
 	}
-	void paintCell(QPainter* p, const QColorGroup& cg, int column, int width, int align);
+	// TODO: Implement paintCell
 
 	ConfigItem* nextItem;
 	struct menu *menu;
@@ -216,9 +205,9 @@ public:
 	ConfigItem *item;
 };
 
-class ConfigView : public Q3VBox {
+class ConfigView : public QWidget {
 	Q_OBJECT
-	typedef class Q3VBox Parent;
+	typedef class QWidget Parent;
 public:
 	ConfigView(QWidget* parent, const char *name = 0);
 	~ConfigView(void);
@@ -249,9 +238,9 @@ public:
 	static QAction *showPromptAction;
 };
 
-class ConfigInfoView : public Q3TextBrowser {
+class ConfigInfoView : public QTextBrowser {
 	Q_OBJECT
-	typedef class Q3TextBrowser Parent;
+	typedef class QTextBrowser Parent;
 public:
 	ConfigInfoView(QWidget* parent, const char *name = 0);
 	bool showDebug(void) const { return _showDebug; }
@@ -271,8 +260,8 @@ protected:
 	QString debug_info(struct symbol *sym);
 	static QString print_filter(const QString &str);
 	static void expr_print_help(void *data, struct symbol *sym, const char *str);
-	Q3PopupMenu* createPopupMenu(const QPoint& pos);
-	void contentsContextMenuEvent(QContextMenuEvent *e);
+	QMenu *createStandardContextMenu(const QPoint & pos);
+	void contextMenuEvent(QContextMenuEvent *e);
 
 	struct symbol *sym;
 	struct menu *_menu;
@@ -299,10 +288,10 @@ protected:
 	struct symbol **result;
 };
 
-class ConfigMainWindow : public Q3MainWindow {
+class ConfigMainWindow : public QMainWindow {
 	Q_OBJECT
 
-	static Q3Action *saveAction;
+	static QAction *saveAction;
 	static void conf_changed(void);
 public:
 	ConfigMainWindow(void);
@@ -331,8 +320,11 @@ protected:
 	ConfigView *configView;
 	ConfigList *configList;
 	ConfigInfoView *helpText;
-	Q3ToolBar *toolBar;
-	Q3Action *backAction;
-	QSplitter* split1;
-	QSplitter* split2;
+	QToolBar *toolBar;
+	QAction *backAction;
+	QAction *singleViewAction;
+	QAction *splitViewAction;
+	QAction *fullViewAction;
+	QSplitter *split1;
+	QSplitter *split2;
 };
diff --git a/support/kconfig/streamline_config.pl b/support/kconfig/streamline_config.pl
old mode 100644
new mode 100755
index 4606cdfb85..a2e83ab17d
--- a/support/kconfig/streamline_config.pl
+++ b/support/kconfig/streamline_config.pl
@@ -1,4 +1,4 @@
-#!/usr/bin/perl -w
+#!/usr/bin/env perl
 #
 # Copyright 2005-2009 - Steven Rostedt
 # Licensed under the terms of the GNU GPL License version 2
@@ -42,6 +42,7 @@
 #    mv config_strip .config
 #    make oldconfig
 #
+use warnings;
 use strict;
 use Getopt::Long;
 
@@ -137,7 +138,7 @@ my $ksource = ($ARGV[0] ? $ARGV[0] : '.');
 my $kconfig = $ARGV[1];
 my $lsmod_file = $ENV{'LSMOD'};
 
-my @makefiles = `find $ksource -name Makefile 2>/dev/null`;
+my @makefiles = `find $ksource -name Makefile -or -name Kbuild 2>/dev/null`;
 chomp @makefiles;
 
 my %depends;
@@ -188,7 +189,7 @@ sub read_kconfig {
 	$cont = 0;
 
 	# collect any Kconfig sources
-	if (/^source\s*"(.*)"/) {
+	if (/^source\s+"?([^"]+)/) {
 	    my $kconfig = $1;
 	    # prevent reading twice.
 	    if (!defined($read_kconfigs{$kconfig})) {
@@ -219,6 +220,13 @@ sub read_kconfig {
 	    $depends{$config} = $1;
 	} elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
 	    $depends{$config} .= " " . $1;
+	} elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
+	    my $dep = $3;
+	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
+		$dep =~ s/.*\sif\s+//;
+		$depends{$config} .= " " . $dep;
+		dprint "Added default depends $dep to $config\n";
+	    }
 
 	# Get the configs that select this config
 	} elsif ($state ne "NONE" && /^\s*select\s+(\S+)/) {
@@ -230,7 +238,7 @@ sub read_kconfig {
 	    }
 
 	# configs without prompts must be selected
-	} elsif ($state ne "NONE" && /^\s*tristate\s\S/) {
+	} elsif ($state ne "NONE" && /^\s*(tristate\s+\S|prompt\b)/) {
 	    # note if the config has a prompt
 	    $prompts{$config} = 1;
 
@@ -249,8 +257,8 @@ sub read_kconfig {
 
 	    $iflevel-- if ($iflevel);
 
-	# stop on "help"
-	} elsif (/^\s*help\s*$/) {
+	# stop on "help" and keywords that end a menu entry
+	} elsif (/^\s*(---)?help(---)?\s*$/ || /^(comment|choice|menu)\b/) {
 	    $state = "NONE";
 	}
     }
@@ -447,7 +455,7 @@ sub parse_config_depends
 	    $p =~ s/^[^$valid]*[$valid]+//;
 
 	    # We only need to process if the depend config is a module
-	    if (!defined($orig_configs{$conf}) || !$orig_configs{conf} eq "m") {
+	    if (!defined($orig_configs{$conf}) || $orig_configs{$conf} eq "y") {
 		next;
 	    }
 
@@ -582,7 +590,7 @@ while ($repeat) {
 
     # Now we need to see if we have to check selects;
     loop_select;
-}	    
+}
 
 my %setconfigs;
 
@@ -603,6 +611,40 @@ foreach my $line (@config_file) {
 	next;
     }
 
+    if (/CONFIG_MODULE_SIG_KEY="(.+)"/) {
+        my $orig_cert = $1;
+        my $default_cert = "certs/signing_key.pem";
+
+        # Check that the logic in this script still matches the one in Kconfig
+        if (!defined($depends{"MODULE_SIG_KEY"}) ||
+            $depends{"MODULE_SIG_KEY"} !~ /"\Q$default_cert\E"/) {
+            print STDERR "WARNING: MODULE_SIG_KEY assertion failure, ",
+                "update needed to ", __FILE__, " line ", __LINE__, "\n";
+            print;
+        } elsif ($orig_cert ne $default_cert && ! -f $orig_cert) {
+            print STDERR "Module signature verification enabled but ",
+                "module signing key \"$orig_cert\" not found. Resetting ",
+                "signing key to default value.\n";
+            print "CONFIG_MODULE_SIG_KEY=\"$default_cert\"\n";
+        } else {
+            print;
+        }
+        next;
+    }
+
+    if (/CONFIG_SYSTEM_TRUSTED_KEYS="(.+)"/) {
+        my $orig_keys = $1;
+
+        if (! -f $orig_keys) {
+            print STDERR "System keyring enabled but keys \"$orig_keys\" ",
+                "not found. Resetting keys to default value.\n";
+            print "CONFIG_SYSTEM_TRUSTED_KEYS=\"\"\n";
+        } else {
+            print;
+        }
+        next;
+    }
+
     if (/^(CONFIG.*)=(m|y)/) {
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
diff --git a/support/kconfig/symbol.c b/support/kconfig/symbol.c
index 7caabdb51c..f0b2e3b310 100644
--- a/support/kconfig/symbol.c
+++ b/support/kconfig/symbol.c
@@ -77,7 +77,7 @@ const char *sym_type_name(enum symbol_type type)
 {
 	switch (type) {
 	case S_BOOLEAN:
-		return "boolean";
+		return "bool";
 	case S_TRISTATE:
 		return "tristate";
 	case S_INT:
@@ -112,7 +112,7 @@ struct property *sym_get_env_prop(struct symbol *sym)
 	return NULL;
 }
 
-struct property *sym_get_default_prop(struct symbol *sym)
+static struct property *sym_get_default_prop(struct symbol *sym)
 {
 	struct property *prop;
 
@@ -183,18 +183,52 @@ static void sym_validate_range(struct symbol *sym)
 		sprintf(str, "%lld", val2);
 	else
 		sprintf(str, "0x%llx", val2);
-	sym->curr.val = strdup(str);
+	sym->curr.val = xstrdup(str);
+}
+
+static void sym_set_changed(struct symbol *sym)
+{
+	struct property *prop;
+
+	sym->flags |= SYMBOL_CHANGED;
+	for (prop = sym->prop; prop; prop = prop->next) {
+		if (prop->menu)
+			prop->menu->flags |= MENU_CHANGED;
+	}
+}
+
+static void sym_set_all_changed(void)
+{
+	struct symbol *sym;
+	int i;
+
+	for_all_symbols(i, sym)
+		sym_set_changed(sym);
 }
 
 static void sym_calc_visibility(struct symbol *sym)
 {
 	struct property *prop;
+	struct symbol *choice_sym = NULL;
 	tristate tri;
 
 	/* any prompt visible? */
 	tri = no;
+
+	if (sym_is_choice_value(sym))
+		choice_sym = prop_get_symbol(sym_get_choice_prop(sym));
+
 	for_all_prompts(sym, prop) {
 		prop->visible.tri = expr_calc_value(prop->visible.expr);
+		/*
+		 * Tristate choice_values with visibility 'mod' are
+		 * not visible if the corresponding choice's value is
+		 * 'yes'.
+		 */
+		if (choice_sym && sym->type == S_TRISTATE &&
+		    prop->visible.tri == mod && choice_sym->curr.tri == yes)
+			prop->visible.tri = no;
+
 		tri = EXPR_OR(tri, prop->visible.tri);
 	}
 	if (tri == mod && (sym->type != S_TRISTATE || modules_val == no))
@@ -209,7 +243,7 @@ static void sym_calc_visibility(struct symbol *sym)
 	tri = yes;
 	if (sym->dir_dep.expr)
 		tri = expr_calc_value(sym->dir_dep.expr);
-	if (tri == mod)
+	if (tri == mod && sym_get_type(sym) == S_BOOLEAN)
 		tri = yes;
 	if (sym->dir_dep.tri != tri) {
 		sym->dir_dep.tri = tri;
@@ -224,6 +258,15 @@ static void sym_calc_visibility(struct symbol *sym)
 		sym->rev_dep.tri = tri;
 		sym_set_changed(sym);
 	}
+	tri = no;
+	if (sym->implied.expr && sym->dir_dep.tri != no)
+		tri = expr_calc_value(sym->implied.expr);
+	if (tri == mod && sym_get_type(sym) == S_BOOLEAN)
+		tri = yes;
+	if (sym->implied.tri != tri) {
+		sym->implied.tri = tri;
+		sym_set_changed(sym);
+	}
 }
 
 /*
@@ -290,6 +333,27 @@ static struct symbol *sym_calc_choice(struct symbol *sym)
 	return def_sym;
 }
 
+static void sym_warn_unmet_dep(struct symbol *sym)
+{
+	struct gstr gs = str_new();
+
+	str_printf(&gs,
+		   "\nWARNING: unmet direct dependencies detected for %s\n",
+		   sym->name);
+	str_printf(&gs,
+		   "  Depends on [%c]: ",
+		   sym->dir_dep.tri == mod ? 'm' : 'n');
+	expr_gstr_print(sym->dir_dep.expr, &gs);
+	str_printf(&gs, "\n");
+
+	expr_gstr_print_revdep(sym->rev_dep.expr, &gs, yes,
+			       "  Selected by [y]:\n");
+	expr_gstr_print_revdep(sym->rev_dep.expr, &gs, mod,
+			       "  Selected by [m]:\n");
+
+	fputs(str_get(&gs), stderr);
+}
+
 void sym_calc_value(struct symbol *sym)
 {
 	struct symbol_value newval, oldval;
@@ -328,11 +392,13 @@ void sym_calc_value(struct symbol *sym)
 		sym->curr.tri = no;
 		return;
 	}
-	if (!sym_is_choice_value(sym))
-		sym->flags &= ~SYMBOL_WRITE;
+	sym->flags &= ~SYMBOL_WRITE;
 
 	sym_calc_visibility(sym);
 
+	if (sym->visible != no)
+		sym->flags |= SYMBOL_WRITE;
+
 	/* set default if recursively called */
 	sym->curr = newval;
 
@@ -347,7 +413,6 @@ void sym_calc_value(struct symbol *sym)
 				/* if the symbol is visible use the user value
 				 * if available, otherwise try the default value
 				 */
-				sym->flags |= SYMBOL_WRITE;
 				if (sym_has_value(sym)) {
 					newval.tri = EXPR_AND(sym->def[S_DEF_USER].tri,
 							      sym->visible);
@@ -359,38 +424,31 @@ void sym_calc_value(struct symbol *sym)
 			if (!sym_is_choice(sym)) {
 				prop = sym_get_default_prop(sym);
 				if (prop) {
-					sym->flags |= SYMBOL_WRITE;
 					newval.tri = EXPR_AND(expr_calc_value(prop->expr),
 							      prop->visible.tri);
+					if (newval.tri != no)
+						sym->flags |= SYMBOL_WRITE;
+				}
+				if (sym->implied.tri != no) {
+					sym->flags |= SYMBOL_WRITE;
+					newval.tri = EXPR_OR(newval.tri, sym->implied.tri);
 				}
 			}
 		calc_newval:
-			if (sym->dir_dep.tri == no && sym->rev_dep.tri != no) {
-				struct expr *e;
-				e = expr_simplify_unmet_dep(sym->rev_dep.expr,
-				    sym->dir_dep.expr);
-				fprintf(stderr, "warning: (");
-				expr_fprint(e, stderr);
-				fprintf(stderr, ") selects %s which has unmet direct dependencies (",
-					sym->name);
-				expr_fprint(sym->dir_dep.expr, stderr);
-				fprintf(stderr, ")\n");
-				expr_free(e);
-			}
+			if (sym->dir_dep.tri < sym->rev_dep.tri)
+				sym_warn_unmet_dep(sym);
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
-		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
+		if (newval.tri == mod &&
+		    (sym_get_type(sym) == S_BOOLEAN || sym->implied.tri == yes))
 			newval.tri = yes;
 		break;
 	case S_STRING:
 	case S_HEX:
 	case S_INT:
-		if (sym->visible != no) {
-			sym->flags |= SYMBOL_WRITE;
-			if (sym_has_value(sym)) {
-				newval.val = sym->def[S_DEF_USER].val;
-				break;
-			}
+		if (sym->visible != no && sym_has_value(sym)) {
+			newval.val = sym->def[S_DEF_USER].val;
+			break;
 		}
 		prop = sym_get_default_prop(sym);
 		if (prop) {
@@ -447,28 +505,7 @@ void sym_clear_all_valid(void)
 	for_all_symbols(i, sym)
 		sym->flags &= ~SYMBOL_VALID;
 	sym_add_change_count(1);
-	if (modules_sym)
-		sym_calc_value(modules_sym);
-}
-
-void sym_set_changed(struct symbol *sym)
-{
-	struct property *prop;
-
-	sym->flags |= SYMBOL_CHANGED;
-	for (prop = sym->prop; prop; prop = prop->next) {
-		if (prop->menu)
-			prop->menu->flags |= MENU_CHANGED;
-	}
-}
-
-void sym_set_all_changed(void)
-{
-	struct symbol *sym;
-	int i;
-
-	for_all_symbols(i, sym)
-		sym_set_changed(sym);
+	sym_calc_value(modules_sym);
 }
 
 bool sym_tristate_within_range(struct symbol *sym, tristate val)
@@ -485,6 +522,8 @@ bool sym_tristate_within_range(struct symbol *sym, tristate val)
 		return false;
 	if (sym->visible <= sym->rev_dep.tri)
 		return false;
+	if (sym->implied.tri == yes && val == mod)
+		return false;
 	if (sym_is_choice_value(sym) && sym->visible == yes)
 		return val == yes;
 	return val >= sym->rev_dep.tri && val <= sym->visible;
@@ -737,6 +776,10 @@ const char *sym_get_string_default(struct symbol *sym)
 	if (sym->type == S_BOOLEAN && val == mod)
 		val = yes;
 
+	/* adjust the default value if this symbol is implied by another */
+	if (val < sym->implied.tri)
+		val = sym->implied.tri;
+
 	switch (sym->type) {
 	case S_BOOLEAN:
 	case S_TRISTATE:
@@ -818,7 +861,7 @@ struct symbol *sym_lookup(const char *name, int flags)
 				   : !(symbol->flags & (SYMBOL_CONST|SYMBOL_CHOICE))))
 				return symbol;
 		}
-		new_name = strdup(name);
+		new_name = xstrdup(name);
 	} else {
 		new_name = NULL;
 		hash = 0;
@@ -868,12 +911,16 @@ struct symbol *sym_find(const char *name)
  * name to be expanded shall be prefixed by a '$'. Unknown symbol expands to
  * the empty string.
  */
-const char *sym_expand_string_value(const char *in)
+char *sym_expand_string_value(const char *in)
 {
 	const char *src;
 	char *res;
 	size_t reslen;
 
+	/*
+	 * Note: 'in' might come from a token that's about to be
+	 * freed, so make sure to always allocate a new string
+	 */
 	reslen = strlen(in) + 1;
 	res = xmalloc(reslen);
 	res[0] = '\0';
@@ -901,7 +948,7 @@ const char *sym_expand_string_value(const char *in)
 		newlen = strlen(res) + strlen(symval) + strlen(src) + 1;
 		if (newlen > reslen) {
 			reslen = newlen;
-			res = realloc(res, reslen);
+			res = xrealloc(res, reslen);
 		}
 
 		strcat(res, symval);
@@ -1028,7 +1075,7 @@ struct symbol **sym_re_search(const char *pattern)
 	}
 	if (sym_match_arr) {
 		qsort(sym_match_arr, cnt, sizeof(struct sym_match), sym_rel_comp);
-		sym_arr = malloc((cnt+1) * sizeof(struct symbol));
+		sym_arr = malloc((cnt+1) * sizeof(struct symbol *));
 		if (!sym_arr)
 			goto sym_re_search_free;
 		for (i = 0; i < cnt; i++)
@@ -1117,6 +1164,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		if (stack->sym == last_sym)
 			fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
 				prop->file->name, prop->lineno);
+
 		if (stack->expr) {
 			fprintf(stderr, "%s:%d:\tsymbol %s %s value contains %s\n",
 				prop->file->name, prop->lineno,
@@ -1146,6 +1194,11 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		}
 	}
 
+	fprintf(stderr,
+		"For a resolution refer to Documentation/kbuild/kconfig-language.txt\n"
+		"subsection \"Kconfig recursive dependency limitations\"\n"
+		"\n");
+
 	if (check_top == &cv_stack)
 		dep_stack_remove();
 }
@@ -1166,6 +1219,10 @@ static struct symbol *sym_check_expr_deps(struct expr *e)
 	case E_NOT:
 		return sym_check_expr_deps(e->left.expr);
 	case E_EQUAL:
+	case E_GEQ:
+	case E_GTH:
+	case E_LEQ:
+	case E_LTH:
 	case E_UNEQUAL:
 		sym = sym_check_deps(e->left.sym);
 		if (sym)
@@ -1176,7 +1233,7 @@ static struct symbol *sym_check_expr_deps(struct expr *e)
 	default:
 		break;
 	}
-	printf("Oops! How to check %d?\n", e->type);
+	fprintf(stderr, "Oops! How to check %d?\n", e->type);
 	return NULL;
 }
 
@@ -1333,6 +1390,8 @@ const char *prop_get_type_name(enum prop_type type)
 		return "choice";
 	case P_SELECT:
 		return "select";
+	case P_IMPLY:
+		return "imply";
 	case P_RANGE:
 		return "range";
 	case P_SYMBOL:
diff --git a/support/kconfig/util.c b/support/kconfig/util.c
index 60eb566180..18a8e52391 100644
--- a/support/kconfig/util.c
+++ b/support/kconfig/util.c
@@ -14,11 +14,11 @@
 struct file *file_lookup(const char *name)
 {
 	struct file *file;
-	const char *file_name = sym_expand_string_value(name);
+	char *file_name = sym_expand_string_value(name);
 
 	for (file = file_list; file; file = file->next) {
 		if (!strcmp(name, file->name)) {
-			free((void *)file_name);
+			free(file_name);
 			return file;
 		}
 	}
@@ -100,16 +100,6 @@ struct gstr str_new(void)
 	return gs;
 }
 
-/* Allocate and assign growable string */
-struct gstr str_assign(const char *s)
-{
-	struct gstr gs;
-	gs.s = strdup(s);
-	gs.len = strlen(s) + 1;
-	gs.max_width = 0;
-	return gs;
-}
-
 /* Free storage for growable string */
 void str_free(struct gstr *gs)
 {
@@ -126,7 +116,7 @@ void str_append(struct gstr *gs, const char *s)
 	if (s) {
 		l = strlen(gs->s) + strlen(s) + 1;
 		if (l > gs->len) {
-			gs->s   = realloc(gs->s, l);
+			gs->s = xrealloc(gs->s, l);
 			gs->len = l;
 		}
 		strcat(gs->s, s);
@@ -168,4 +158,22 @@ void *xcalloc(size_t nmemb, size_t size)
 	exit(1);
 }
 
+void *xrealloc(void *p, size_t size)
+{
+	p = realloc(p, size);
+	if (p)
+		return p;
+	fprintf(stderr, "Out of memory.\n");
+	exit(1);
+}
 
+char *xstrdup(const char *s)
+{
+	char *p;
+
+	p = strdup(s);
+	if (p)
+		return p;
+	fprintf(stderr, "Out of memory.\n");
+	exit(1);
+}
diff --git a/support/kconfig/zconf.gperf b/support/kconfig/zconf.gperf
deleted file mode 100644
index f14ab41154..0000000000
--- a/support/kconfig/zconf.gperf
+++ /dev/null
@@ -1,47 +0,0 @@
-%language=ANSI-C
-%define hash-function-name kconf_id_hash
-%define lookup-function-name kconf_id_lookup
-%define string-pool-name kconf_id_strings
-%compare-strncmp
-%enum
-%pic
-%struct-type
-
-struct kconf_id;
-
-static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-
-%%
-mainmenu,	T_MAINMENU,	TF_COMMAND
-menu,		T_MENU,		TF_COMMAND
-endmenu,	T_ENDMENU,	TF_COMMAND
-source,		T_SOURCE,	TF_COMMAND
-choice,		T_CHOICE,	TF_COMMAND
-endchoice,	T_ENDCHOICE,	TF_COMMAND
-comment,	T_COMMENT,	TF_COMMAND
-config,		T_CONFIG,	TF_COMMAND
-menuconfig,	T_MENUCONFIG,	TF_COMMAND
-help,		T_HELP,		TF_COMMAND
-if,		T_IF,		TF_COMMAND|TF_PARAM
-endif,		T_ENDIF,	TF_COMMAND
-depends,	T_DEPENDS,	TF_COMMAND
-optional,	T_OPTIONAL,	TF_COMMAND
-default,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN
-prompt,		T_PROMPT,	TF_COMMAND
-tristate,	T_TYPE,		TF_COMMAND, S_TRISTATE
-def_tristate,	T_DEFAULT,	TF_COMMAND, S_TRISTATE
-bool,		T_TYPE,		TF_COMMAND, S_BOOLEAN
-boolean,	T_TYPE,		TF_COMMAND, S_BOOLEAN
-def_bool,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN
-int,		T_TYPE,		TF_COMMAND, S_INT
-hex,		T_TYPE,		TF_COMMAND, S_HEX
-string,		T_TYPE,		TF_COMMAND, S_STRING
-select,		T_SELECT,	TF_COMMAND
-range,		T_RANGE,	TF_COMMAND
-visible,	T_VISIBLE,	TF_COMMAND
-option,		T_OPTION,	TF_COMMAND
-on,		T_ON,		TF_PARAM
-modules,	T_OPT_MODULES,	TF_OPTION
-defconfig_list,	T_OPT_DEFCONFIG_LIST,TF_OPTION
-env,		T_OPT_ENV,	TF_OPTION
-%%
diff --git a/support/kconfig/zconf.hash.c_shipped b/support/kconfig/zconf.hash.c_shipped
deleted file mode 100644
index 40df0005da..0000000000
--- a/support/kconfig/zconf.hash.c_shipped
+++ /dev/null
@@ -1,286 +0,0 @@
-/* ANSI-C code produced by gperf version 3.0.4 */
-/* Command-line: gperf -t --output-file scripts/kconfig/zconf.hash.c_shipped -a -C -E -g -k '1,3,$' -p -t scripts/kconfig/zconf.gperf  */
-
-#if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
-      && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
-      && (')' == 41) && ('*' == 42) && ('+' == 43) && (',' == 44) \
-      && ('-' == 45) && ('.' == 46) && ('/' == 47) && ('0' == 48) \
-      && ('1' == 49) && ('2' == 50) && ('3' == 51) && ('4' == 52) \
-      && ('5' == 53) && ('6' == 54) && ('7' == 55) && ('8' == 56) \
-      && ('9' == 57) && (':' == 58) && (';' == 59) && ('<' == 60) \
-      && ('=' == 61) && ('>' == 62) && ('?' == 63) && ('A' == 65) \
-      && ('B' == 66) && ('C' == 67) && ('D' == 68) && ('E' == 69) \
-      && ('F' == 70) && ('G' == 71) && ('H' == 72) && ('I' == 73) \
-      && ('J' == 74) && ('K' == 75) && ('L' == 76) && ('M' == 77) \
-      && ('N' == 78) && ('O' == 79) && ('P' == 80) && ('Q' == 81) \
-      && ('R' == 82) && ('S' == 83) && ('T' == 84) && ('U' == 85) \
-      && ('V' == 86) && ('W' == 87) && ('X' == 88) && ('Y' == 89) \
-      && ('Z' == 90) && ('[' == 91) && ('\\' == 92) && (']' == 93) \
-      && ('^' == 94) && ('_' == 95) && ('a' == 97) && ('b' == 98) \
-      && ('c' == 99) && ('d' == 100) && ('e' == 101) && ('f' == 102) \
-      && ('g' == 103) && ('h' == 104) && ('i' == 105) && ('j' == 106) \
-      && ('k' == 107) && ('l' == 108) && ('m' == 109) && ('n' == 110) \
-      && ('o' == 111) && ('p' == 112) && ('q' == 113) && ('r' == 114) \
-      && ('s' == 115) && ('t' == 116) && ('u' == 117) && ('v' == 118) \
-      && ('w' == 119) && ('x' == 120) && ('y' == 121) && ('z' == 122) \
-      && ('{' == 123) && ('|' == 124) && ('}' == 125) && ('~' == 126))
-/* The character set is not based on ISO-646.  */
-#error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
-#endif
-
-#line 10 "scripts/kconfig/zconf.gperf"
-struct kconf_id;
-
-static const struct kconf_id *kconf_id_lookup(register const char *str, register unsigned int len);
-/* maximum key range = 71, duplicates = 0 */
-
-#ifdef __GNUC__
-__inline
-#else
-#ifdef __cplusplus
-inline
-#endif
-#endif
-static unsigned int
-kconf_id_hash (register const char *str, register unsigned int len)
-{
-  static const unsigned char asso_values[] =
-    {
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 25, 25,
-       0,  0,  0,  5,  0,  0, 73, 73,  5,  0,
-      10,  5, 45, 73, 20, 20,  0, 15, 15, 73,
-      20, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
-      73, 73, 73, 73, 73, 73
-    };
-  register int hval = len;
-
-  switch (hval)
-    {
-      default:
-        hval += asso_values[(unsigned char)str[2]];
-      /*FALLTHROUGH*/
-      case 2:
-      case 1:
-        hval += asso_values[(unsigned char)str[0]];
-        break;
-    }
-  return hval + asso_values[(unsigned char)str[len - 1]];
-}
-
-struct kconf_id_strings_t
-  {
-    char kconf_id_strings_str2[sizeof("if")];
-    char kconf_id_strings_str3[sizeof("int")];
-    char kconf_id_strings_str5[sizeof("endif")];
-    char kconf_id_strings_str7[sizeof("default")];
-    char kconf_id_strings_str8[sizeof("tristate")];
-    char kconf_id_strings_str9[sizeof("endchoice")];
-    char kconf_id_strings_str12[sizeof("def_tristate")];
-    char kconf_id_strings_str13[sizeof("def_bool")];
-    char kconf_id_strings_str14[sizeof("defconfig_list")];
-    char kconf_id_strings_str17[sizeof("on")];
-    char kconf_id_strings_str18[sizeof("optional")];
-    char kconf_id_strings_str21[sizeof("option")];
-    char kconf_id_strings_str22[sizeof("endmenu")];
-    char kconf_id_strings_str23[sizeof("mainmenu")];
-    char kconf_id_strings_str25[sizeof("menuconfig")];
-    char kconf_id_strings_str27[sizeof("modules")];
-    char kconf_id_strings_str29[sizeof("menu")];
-    char kconf_id_strings_str31[sizeof("select")];
-    char kconf_id_strings_str32[sizeof("comment")];
-    char kconf_id_strings_str33[sizeof("env")];
-    char kconf_id_strings_str35[sizeof("range")];
-    char kconf_id_strings_str36[sizeof("choice")];
-    char kconf_id_strings_str39[sizeof("bool")];
-    char kconf_id_strings_str41[sizeof("source")];
-    char kconf_id_strings_str42[sizeof("visible")];
-    char kconf_id_strings_str43[sizeof("hex")];
-    char kconf_id_strings_str46[sizeof("config")];
-    char kconf_id_strings_str47[sizeof("boolean")];
-    char kconf_id_strings_str51[sizeof("string")];
-    char kconf_id_strings_str54[sizeof("help")];
-    char kconf_id_strings_str56[sizeof("prompt")];
-    char kconf_id_strings_str72[sizeof("depends")];
-  };
-static const struct kconf_id_strings_t kconf_id_strings_contents =
-  {
-    "if",
-    "int",
-    "endif",
-    "default",
-    "tristate",
-    "endchoice",
-    "def_tristate",
-    "def_bool",
-    "defconfig_list",
-    "on",
-    "optional",
-    "option",
-    "endmenu",
-    "mainmenu",
-    "menuconfig",
-    "modules",
-    "menu",
-    "select",
-    "comment",
-    "env",
-    "range",
-    "choice",
-    "bool",
-    "source",
-    "visible",
-    "hex",
-    "config",
-    "boolean",
-    "string",
-    "help",
-    "prompt",
-    "depends"
-  };
-#define kconf_id_strings ((const char *) &kconf_id_strings_contents)
-#ifdef __GNUC__
-__inline
-#if defined __GNUC_STDC_INLINE__ || defined __GNUC_GNU_INLINE__
-__attribute__ ((__gnu_inline__))
-#endif
-#endif
-const struct kconf_id *
-kconf_id_lookup (register const char *str, register unsigned int len)
-{
-  enum
-    {
-      TOTAL_KEYWORDS = 32,
-      MIN_WORD_LENGTH = 2,
-      MAX_WORD_LENGTH = 14,
-      MIN_HASH_VALUE = 2,
-      MAX_HASH_VALUE = 72
-    };
-
-  static const struct kconf_id wordlist[] =
-    {
-      {-1}, {-1},
-#line 25 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str2,		T_IF,		TF_COMMAND|TF_PARAM},
-#line 36 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str3,		T_TYPE,		TF_COMMAND, S_INT},
-      {-1},
-#line 26 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str5,		T_ENDIF,	TF_COMMAND},
-      {-1},
-#line 29 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str7,	T_DEFAULT,	TF_COMMAND, S_UNKNOWN},
-#line 31 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str8,	T_TYPE,		TF_COMMAND, S_TRISTATE},
-#line 20 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str9,	T_ENDCHOICE,	TF_COMMAND},
-      {-1}, {-1},
-#line 32 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str12,	T_DEFAULT,	TF_COMMAND, S_TRISTATE},
-#line 35 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str13,	T_DEFAULT,	TF_COMMAND, S_BOOLEAN},
-#line 45 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str14,	T_OPT_DEFCONFIG_LIST,TF_OPTION},
-      {-1}, {-1},
-#line 43 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str17,		T_ON,		TF_PARAM},
-#line 28 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str18,	T_OPTIONAL,	TF_COMMAND},
-      {-1}, {-1},
-#line 42 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str21,		T_OPTION,	TF_COMMAND},
-#line 17 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str22,	T_ENDMENU,	TF_COMMAND},
-#line 15 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str23,	T_MAINMENU,	TF_COMMAND},
-      {-1},
-#line 23 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str25,	T_MENUCONFIG,	TF_COMMAND},
-      {-1},
-#line 44 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str27,	T_OPT_MODULES,	TF_OPTION},
-      {-1},
-#line 16 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str29,		T_MENU,		TF_COMMAND},
-      {-1},
-#line 39 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str31,		T_SELECT,	TF_COMMAND},
-#line 21 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str32,	T_COMMENT,	TF_COMMAND},
-#line 46 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str33,		T_OPT_ENV,	TF_OPTION},
-      {-1},
-#line 40 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str35,		T_RANGE,	TF_COMMAND},
-#line 19 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str36,		T_CHOICE,	TF_COMMAND},
-      {-1}, {-1},
-#line 33 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str39,		T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1},
-#line 18 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str41,		T_SOURCE,	TF_COMMAND},
-#line 41 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str42,	T_VISIBLE,	TF_COMMAND},
-#line 37 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str43,		T_TYPE,		TF_COMMAND, S_HEX},
-      {-1}, {-1},
-#line 22 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str46,		T_CONFIG,	TF_COMMAND},
-#line 34 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str47,	T_TYPE,		TF_COMMAND, S_BOOLEAN},
-      {-1}, {-1}, {-1},
-#line 38 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str51,		T_TYPE,		TF_COMMAND, S_STRING},
-      {-1}, {-1},
-#line 24 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str54,		T_HELP,		TF_COMMAND},
-      {-1},
-#line 30 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str56,		T_PROMPT,	TF_COMMAND},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-      {-1}, {-1}, {-1}, {-1}, {-1}, {-1},
-#line 27 "scripts/kconfig/zconf.gperf"
-      {(int)(long)&((struct kconf_id_strings_t *)0)->kconf_id_strings_str72,	T_DEPENDS,	TF_COMMAND}
-    };
-
-  if (len <= MAX_WORD_LENGTH && len >= MIN_WORD_LENGTH)
-    {
-      register int key = kconf_id_hash (str, len);
-
-      if (key <= MAX_HASH_VALUE && key >= 0)
-        {
-          register int o = wordlist[key].name;
-          if (o >= 0)
-            {
-              register const char *s = o + kconf_id_strings;
-
-              if (*str == *s && !strncmp (str + 1, s + 1, len - 1) && s[len] == '\0')
-                return &wordlist[key];
-            }
-        }
-    }
-  return 0;
-}
-#line 47 "scripts/kconfig/zconf.gperf"
-
diff --git a/support/kconfig/zconf.l b/support/kconfig/zconf.l
index 1a9f53e535..045093d827 100644
--- a/support/kconfig/zconf.l
+++ b/support/kconfig/zconf.l
@@ -1,5 +1,5 @@
 %option nostdinit noyywrap never-interactive full ecs
-%option 8bit nodefault perf-report perf-report
+%option 8bit nodefault yylineno
 %option noinput
 %x COMMAND HELP STRING PARAM
 %{
@@ -27,8 +27,8 @@ static char *text;
 static int text_size, text_asize;
 
 struct buffer {
-        struct buffer *parent;
-        YY_BUFFER_STATE state;
+	struct buffer *parent;
+	YY_BUFFER_STATE state;
 };
 
 struct buffer *current_buf;
@@ -52,7 +52,7 @@ static void append_string(const char *str, int size)
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;
-		text = realloc(text, new_size);
+		text = xrealloc(text, new_size);
 		text_asize = new_size;
 	}
 	memcpy(text + text_size, str, size);
@@ -66,9 +66,16 @@ static void alloc_string(const char *str, int size)
 	memcpy(text, str, size);
 	text[size] = 0;
 }
+
+static void warn_ignored_character(char chr)
+{
+	fprintf(stderr,
+	        "%s:%d:warning: ignoring unsupported character '%c'\n",
+	        zconf_curname(), zconf_lineno(), chr);
+}
 %}
 
-n	[A-Za-z0-9_]
+n	[A-Za-z0-9_-]
 
 %%
 	int str = 0;
@@ -76,7 +83,6 @@ n	[A-Za-z0-9_]
 
 [ \t]*#.*\n	|
 [ \t]*\n	{
-	current_file->lineno++;
 	return T_EOL;
 }
 [ \t]*#.*
@@ -97,19 +103,18 @@ n	[A-Za-z0-9_]
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
-		current_pos.lineno = current_file->lineno;
+		current_pos.lineno = yylineno;
 		if (id && id->flags & TF_COMMAND) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD;
 	}
-	.
+	.	warn_ignored_character(*yytext);
 	\n	{
 		BEGIN(INITIAL);
-		current_file->lineno++;
 		return T_EOL;
 	}
 }
@@ -122,26 +127,30 @@ n	[A-Za-z0-9_]
 	"!"	return T_NOT;
 	"="	return T_EQUAL;
 	"!="	return T_UNEQUAL;
+	"<="	return T_LESS_EQUAL;
+	">="	return T_GREATER_EQUAL;
+	"<"	return T_LESS;
+	">"	return T_GREATER;
 	\"|\'	{
 		str = yytext[0];
 		new_string();
 		BEGIN(STRING);
 	}
-	\n	BEGIN(INITIAL); current_file->lineno++; return T_EOL;
-	---	/* ignore */
-	({n}|[-/.])+	{
+	\n	BEGIN(INITIAL); return T_EOL;
+	({n}|[/.])+	{
 		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
 		alloc_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD;
 	}
 	#.*	/* comment */
-	\\\n	current_file->lineno++;
-	.
+	\\\n	;
+	[[:blank:]]+
+	.	warn_ignored_character(*yytext);
 	<<EOF>> {
 		BEGIN(INITIAL);
 	}
@@ -150,7 +159,7 @@ n	[A-Za-z0-9_]
 <STRING>{
 	[^'"\\\n]+/\n	{
 		append_string(yytext, yyleng);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	[^'"\\\n]+	{
@@ -158,7 +167,7 @@ n	[A-Za-z0-9_]
 	}
 	\\.?/\n	{
 		append_string(yytext + 1, yyleng - 1);
-		zconflval.string = text;
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	\\.?	{
@@ -167,14 +176,15 @@ n	[A-Za-z0-9_]
 	\'|\"	{
 		if (str == yytext[0]) {
 			BEGIN(PARAM);
-			zconflval.string = text;
+			yylval.string = text;
 			return T_WORD_QUOTE;
 		} else
 			append_string(yytext, 1);
 	}
 	\n	{
-		printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
-		current_file->lineno++;
+		fprintf(stderr,
+			"%s:%d:warning: multi-line strings not supported\n",
+			zconf_curname(), zconf_lineno());
 		BEGIN(INITIAL);
 		return T_EOL;
 	}
@@ -207,12 +217,10 @@ n	[A-Za-z0-9_]
 		}
 	}
 	[ \t]*\n/[^ \t\n] {
-		current_file->lineno++;
 		zconf_endhelp();
 		return T_HELPTEXT;
 	}
 	[ \t]*\n	{
-		current_file->lineno++;
 		append_string("\n", 1);
 	}
 	[^ \t\n].* {
@@ -250,7 +258,7 @@ void zconf_starthelp(void)
 
 static void zconf_endhelp(void)
 {
-	zconflval.string = text;
+	yylval.string = text;
 	BEGIN(INITIAL);
 }
 
@@ -283,7 +291,7 @@ void zconf_initscan(const char *name)
 {
 	yyin = zconf_fopen(name);
 	if (!yyin) {
-		printf("can't find file %s\n", name);
+		fprintf(stderr, "can't find file %s\n", name);
 		exit(1);
 	}
 
@@ -291,7 +299,7 @@ void zconf_initscan(const char *name)
 	memset(current_buf, 0, sizeof(*current_buf));
 
 	current_file = file_lookup(name);
-	current_file->lineno = 1;
+	yylineno = 1;
 }
 
 void zconf_nextfile(const char *name)
@@ -304,35 +312,34 @@ void zconf_nextfile(const char *name)
 	current_buf->state = YY_CURRENT_BUFFER;
 	yyin = zconf_fopen(file->name);
 	if (!yyin) {
-		printf("%s:%d: can't open file \"%s\"\n",
-		    zconf_curname(), zconf_lineno(), file->name);
+		fprintf(stderr, "%s:%d: can't open file \"%s\"\n",
+			zconf_curname(), zconf_lineno(), file->name);
 		exit(1);
 	}
 	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	for (iter = current_file->parent; iter; iter = iter->parent ) {
-		if (!strcmp(current_file->name,iter->name) ) {
-			printf("%s:%d: recursive inclusion detected. "
-			       "Inclusion path:\n  current file : '%s'\n",
-			       zconf_curname(), zconf_lineno(),
-			       zconf_curname());
-			iter = current_file->parent;
-			while (iter && \
-			       strcmp(iter->name,current_file->name)) {
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno-1);
+	current_file->lineno = yylineno;
+	file->parent = current_file;
+
+	for (iter = current_file; iter; iter = iter->parent) {
+		if (!strcmp(iter->name, file->name)) {
+			fprintf(stderr,
+				"Recursive inclusion detected.\n"
+				"Inclusion path:\n"
+				"  current file : %s\n", file->name);
+			iter = file;
+			do {
 				iter = iter->parent;
-			}
-			if (iter)
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno+1);
+				fprintf(stderr, "  included from: %s:%d\n",
+					iter->name, iter->lineno - 1);
+			} while (strcmp(iter->name, file->name));
 			exit(1);
 		}
 	}
-	file->lineno = 1;
-	file->parent = current_file;
+
+	yylineno = 1;
 	current_file = file;
 }
 
@@ -341,6 +348,8 @@ static void zconf_endfile(void)
 	struct buffer *parent;
 
 	current_file = current_file->parent;
+	if (current_file)
+		yylineno = current_file->lineno;
 
 	parent = current_buf->parent;
 	if (parent) {
diff --git a/support/kconfig/zconf.lex.c_shipped b/support/kconfig/zconf.lex.c_shipped
index a0521aa597..71be03b2df 100644
--- a/support/kconfig/zconf.lex.c_shipped
+++ b/support/kconfig/zconf.lex.c_shipped
@@ -1,33 +1,12 @@
 
-#line 3 "scripts/kconfig/zconf.lex.c_shipped"
-
 #define  YY_INT_ALIGNED short int
 
 /* A lexical scanner generated by flex */
 
-#define yy_create_buffer zconf_create_buffer
-#define yy_delete_buffer zconf_delete_buffer
-#define yy_flex_debug zconf_flex_debug
-#define yy_init_buffer zconf_init_buffer
-#define yy_flush_buffer zconf_flush_buffer
-#define yy_load_buffer_state zconf_load_buffer_state
-#define yy_switch_to_buffer zconf_switch_to_buffer
-#define yyin zconfin
-#define yyleng zconfleng
-#define yylex zconflex
-#define yylineno zconflineno
-#define yyout zconfout
-#define yyrestart zconfrestart
-#define yytext zconftext
-#define yywrap zconfwrap
-#define yyalloc zconfalloc
-#define yyrealloc zconfrealloc
-#define yyfree zconffree
-
 #define FLEX_SCANNER
 #define YY_FLEX_MAJOR_VERSION 2
-#define YY_FLEX_MINOR_VERSION 5
-#define YY_FLEX_SUBMINOR_VERSION 35
+#define YY_FLEX_MINOR_VERSION 6
+#define YY_FLEX_SUBMINOR_VERSION 4
 #if YY_FLEX_SUBMINOR_VERSION > 0
 #define FLEX_BETA
 #endif
@@ -72,7 +51,6 @@ typedef int flex_int32_t;
 typedef unsigned char flex_uint8_t; 
 typedef unsigned short int flex_uint16_t;
 typedef unsigned int flex_uint32_t;
-#endif /* ! C99 */
 
 /* Limits of integral types. */
 #ifndef INT8_MIN
@@ -103,63 +81,61 @@ typedef unsigned int flex_uint32_t;
 #define UINT32_MAX             (4294967295U)
 #endif
 
-#endif /* ! FLEXINT_H */
-
-#ifdef __cplusplus
-
-/* The "const" storage-class-modifier is valid. */
-#define YY_USE_CONST
-
-#else	/* ! __cplusplus */
+#ifndef SIZE_MAX
+#define SIZE_MAX               (~(size_t)0)
+#endif
 
-/* C99 requires __STDC__ to be defined as 1. */
-#if defined (__STDC__)
+#endif /* ! C99 */
 
-#define YY_USE_CONST
+#endif /* ! FLEXINT_H */
 
-#endif	/* defined (__STDC__) */
-#endif	/* ! __cplusplus */
+/* begin standard C++ headers. */
 
-#ifdef YY_USE_CONST
+/* TODO: this is always defined, so inline it */
 #define yyconst const
+
+#if defined(__GNUC__) && __GNUC__ >= 3
+#define yynoreturn __attribute__((__noreturn__))
 #else
-#define yyconst
+#define yynoreturn
 #endif
 
 /* Returned upon end-of-file. */
 #define YY_NULL 0
 
-/* Promotes a possibly negative, possibly signed char to an unsigned
- * integer for use as an array index.  If the signed char is negative,
- * we want to instead treat it as an 8-bit unsigned char, hence the
- * double cast.
+/* Promotes a possibly negative, possibly signed char to an
+ *   integer in range [0..255] for use as an array index.
  */
-#define YY_SC_TO_UI(c) ((unsigned int) (unsigned char) c)
+#define YY_SC_TO_UI(c) ((YY_CHAR) (c))
 
 /* Enter a start condition.  This macro really ought to take a parameter,
  * but we do it the disgusting crufty way forced on us by the ()-less
  * definition of BEGIN.
  */
 #define BEGIN (yy_start) = 1 + 2 *
-
 /* Translate the current start state into a value that can be later handed
  * to BEGIN to return to the state.  The YYSTATE alias is for lex
  * compatibility.
  */
 #define YY_START (((yy_start) - 1) / 2)
 #define YYSTATE YY_START
-
 /* Action number for EOF rule of a given start state. */
 #define YY_STATE_EOF(state) (YY_END_OF_BUFFER + state + 1)
-
 /* Special action meaning "start processing a new file". */
-#define YY_NEW_FILE zconfrestart(zconfin  )
-
+#define YY_NEW_FILE yyrestart( yyin  )
 #define YY_END_OF_BUFFER_CHAR 0
 
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
@@ -171,37 +147,56 @@ typedef unsigned int flex_uint32_t;
 typedef struct yy_buffer_state *YY_BUFFER_STATE;
 #endif
 
-extern int zconfleng;
+#ifndef YY_TYPEDEF_YY_SIZE_T
+#define YY_TYPEDEF_YY_SIZE_T
+typedef size_t yy_size_t;
+#endif
+
+extern int yyleng;
 
-extern FILE *zconfin, *zconfout;
+extern FILE *yyin, *yyout;
 
 #define EOB_ACT_CONTINUE_SCAN 0
 #define EOB_ACT_END_OF_FILE 1
 #define EOB_ACT_LAST_MATCH 2
-
-    #define YY_LESS_LINENO(n)
+    
+    /* Note: We specifically omit the test for yy_rule_can_match_eol because it requires
+     *       access to the local variable yy_act. Since yyless() is a macro, it would break
+     *       existing scanners that call yyless() from OUTSIDE yylex.
+     *       One obvious solution it to make yy_act a global. I tried that, and saw
+     *       a 5% performance hit in a non-yylineno scanner, because yy_act is
+     *       normally declared as a register variable-- so it is not worth it.
+     */
+    #define  YY_LESS_LINENO(n) \
+            do { \
+                int yyl;\
+                for ( yyl = n; yyl < yyleng; ++yyl )\
+                    if ( yytext[yyl] == '\n' )\
+                        --yylineno;\
+            }while(0)
+    #define YY_LINENO_REWIND_TO(dst) \
+            do {\
+                const char *p;\
+                for ( p = yy_cp-1; p >= (dst); --p)\
+                    if ( *p == '\n' )\
+                        --yylineno;\
+            }while(0)
     
 /* Return all but the first "n" matched characters back to the input stream. */
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up zconftext. */ \
+		/* Undo effects of setting up yytext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
 		*yy_cp = (yy_hold_char); \
 		YY_RESTORE_YY_MORE_OFFSET \
 		(yy_c_buf_p) = yy_cp = yy_bp + yyless_macro_arg - YY_MORE_ADJ; \
-		YY_DO_BEFORE_ACTION; /* set up zconftext again */ \
+		YY_DO_BEFORE_ACTION; /* set up yytext again */ \
 		} \
 	while ( 0 )
-
 #define unput(c) yyunput( c, (yytext_ptr)  )
 
-#ifndef YY_TYPEDEF_YY_SIZE_T
-#define YY_TYPEDEF_YY_SIZE_T
-typedef size_t yy_size_t;
-#endif
-
 #ifndef YY_STRUCT_YY_BUFFER_STATE
 #define YY_STRUCT_YY_BUFFER_STATE
 struct yy_buffer_state
@@ -214,7 +209,7 @@ struct yy_buffer_state
 	/* Size of input buffer in bytes, not including room for EOB
 	 * characters.
 	 */
-	yy_size_t yy_buf_size;
+	int yy_buf_size;
 
 	/* Number of characters read into yy_ch_buf, not including EOB
 	 * characters.
@@ -242,7 +237,7 @@ struct yy_buffer_state
 
     int yy_bs_lineno; /**< The line count. */
     int yy_bs_column; /**< The column count. */
-    
+
 	/* Whether to try to fill the input buffer when we reach the
 	 * end of it.
 	 */
@@ -259,8 +254,8 @@ struct yy_buffer_state
 	 * possible backing-up.
 	 *
 	 * When we actually see the EOF, we change the status to "new"
-	 * (via zconfrestart()), so that the user can continue scanning by
-	 * just pointing zconfin at a new input file.
+	 * (via yyrestart()), so that the user can continue scanning by
+	 * just pointing yyin@a new input file.
 	 */
 #define YY_BUFFER_EOF_PENDING 2
 
@@ -270,7 +265,7 @@ struct yy_buffer_state
 /* Stack of input buffers. */
 static size_t yy_buffer_stack_top = 0; /**< index of top of stack. */
 static size_t yy_buffer_stack_max = 0; /**< capacity of stack. */
-static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
+static YY_BUFFER_STATE * yy_buffer_stack = NULL; /**< Stack as an array. */
 
 /* We provide macros for accessing buffer states in case in the
  * future we want to put the buffer states in a more general
@@ -281,428 +276,439 @@ static YY_BUFFER_STATE * yy_buffer_stack = 0; /**< Stack as an array. */
 #define YY_CURRENT_BUFFER ( (yy_buffer_stack) \
                           ? (yy_buffer_stack)[(yy_buffer_stack_top)] \
                           : NULL)
-
 /* Same as previous macro, but useful when we know that the buffer stack is not
  * NULL or when we need an lvalue. For internal use only.
  */
 #define YY_CURRENT_BUFFER_LVALUE (yy_buffer_stack)[(yy_buffer_stack_top)]
 
-/* yy_hold_char holds the character lost when zconftext is formed. */
+/* yy_hold_char holds the character lost when yytext is formed. */
 static char yy_hold_char;
 static int yy_n_chars;		/* number of characters read into yy_ch_buf */
-int zconfleng;
+int yyleng;
 
 /* Points to current character in buffer. */
-static char *yy_c_buf_p = (char *) 0;
+static char *yy_c_buf_p = NULL;
 static int yy_init = 0;		/* whether we need to initialize */
 static int yy_start = 0;	/* start state number */
 
-/* Flag which is used to allow zconfwrap()'s to do buffer switches
- * instead of setting up a fresh zconfin.  A bit of a hack ...
+/* Flag which is used to allow yywrap()'s to do buffer switches
+ * instead of setting up a fresh yyin.  A bit of a hack ...
  */
 static int yy_did_buffer_switch_on_eof;
 
-void zconfrestart (FILE *input_file  );
-void zconf_switch_to_buffer (YY_BUFFER_STATE new_buffer  );
-YY_BUFFER_STATE zconf_create_buffer (FILE *file,int size  );
-void zconf_delete_buffer (YY_BUFFER_STATE b  );
-void zconf_flush_buffer (YY_BUFFER_STATE b  );
-void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer  );
-void zconfpop_buffer_state (void );
+void yyrestart ( FILE *input_file  );
+void yy_switch_to_buffer ( YY_BUFFER_STATE new_buffer  );
+YY_BUFFER_STATE yy_create_buffer ( FILE *file, int size  );
+void yy_delete_buffer ( YY_BUFFER_STATE b  );
+void yy_flush_buffer ( YY_BUFFER_STATE b  );
+void yypush_buffer_state ( YY_BUFFER_STATE new_buffer  );
+void yypop_buffer_state ( void );
 
-static void zconfensure_buffer_stack (void );
-static void zconf_load_buffer_state (void );
-static void zconf_init_buffer (YY_BUFFER_STATE b,FILE *file  );
+static void yyensure_buffer_stack ( void );
+static void yy_load_buffer_state ( void );
+static void yy_init_buffer ( YY_BUFFER_STATE b, FILE *file  );
+#define YY_FLUSH_BUFFER yy_flush_buffer( YY_CURRENT_BUFFER )
 
-#define YY_FLUSH_BUFFER zconf_flush_buffer(YY_CURRENT_BUFFER )
+YY_BUFFER_STATE yy_scan_buffer ( char *base, yy_size_t size  );
+YY_BUFFER_STATE yy_scan_string ( const char *yy_str  );
+YY_BUFFER_STATE yy_scan_bytes ( const char *bytes, int len  );
 
-YY_BUFFER_STATE zconf_scan_buffer (char *base,yy_size_t size  );
-YY_BUFFER_STATE zconf_scan_string (yyconst char *yy_str  );
-YY_BUFFER_STATE zconf_scan_bytes (yyconst char *bytes,int len  );
-
-void *zconfalloc (yy_size_t  );
-void *zconfrealloc (void *,yy_size_t  );
-void zconffree (void *  );
-
-#define yy_new_buffer zconf_create_buffer
+void *yyalloc ( yy_size_t  );
+void *yyrealloc ( void *, yy_size_t  );
+void yyfree ( void *  );
 
+#define yy_new_buffer yy_create_buffer
 #define yy_set_interactive(is_interactive) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){ \
-        zconfensure_buffer_stack (); \
+        yyensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            zconf_create_buffer(zconfin,YY_BUF_SIZE ); \
+            yy_create_buffer( yyin, YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_is_interactive = is_interactive; \
 	}
-
 #define yy_set_bol(at_bol) \
 	{ \
 	if ( ! YY_CURRENT_BUFFER ){\
-        zconfensure_buffer_stack (); \
+        yyensure_buffer_stack (); \
 		YY_CURRENT_BUFFER_LVALUE =    \
-            zconf_create_buffer(zconfin,YY_BUF_SIZE ); \
+            yy_create_buffer( yyin, YY_BUF_SIZE ); \
 	} \
 	YY_CURRENT_BUFFER_LVALUE->yy_at_bol = at_bol; \
 	}
-
 #define YY_AT_BOL() (YY_CURRENT_BUFFER_LVALUE->yy_at_bol)
 
 /* Begin user sect3 */
 
-#define zconfwrap(n) 1
+#define yywrap() (/*CONSTCOND*/1)
 #define YY_SKIP_YYWRAP
+typedef flex_uint8_t YY_CHAR;
 
-typedef unsigned char YY_CHAR;
-
-FILE *zconfin = (FILE *) 0, *zconfout = (FILE *) 0;
+FILE *yyin = NULL, *yyout = NULL;
 
 typedef int yy_state_type;
 
-extern int zconflineno;
+extern int yylineno;
+int yylineno = 1;
 
-int zconflineno = 1;
+extern char *yytext;
+#ifdef yytext_ptr
+#undef yytext_ptr
+#endif
+#define yytext_ptr yytext
 
-extern char *zconftext;
-#define yytext_ptr zconftext
-static yyconst flex_int16_t yy_nxt[][17] =
+static const flex_int16_t yy_nxt[][18] =
     {
     {
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
-        0,    0,    0,    0,    0,    0,    0
+        0,    0,    0,    0,    0,    0,    0,    0
     },
 
     {
        11,   12,   13,   14,   12,   12,   15,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,   12
+       12,   12,   12,   12,   12,   12,   12,   12
     },
 
     {
        11,   12,   13,   14,   12,   12,   15,   12,   12,   12,
-       12,   12,   12,   12,   12,   12,   12
+       12,   12,   12,   12,   12,   12,   12,   12
     },
 
     {
        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
-       16,   16,   16,   18,   16,   16,   16
+       16,   18,   16,   16,   16,   16,   16,   16
     },
 
     {
        11,   16,   16,   17,   16,   16,   16,   16,   16,   16,
-       16,   16,   16,   18,   16,   16,   16
+       16,   18,   16,   16,   16,   16,   16,   16
 
     },
 
     {
        11,   19,   20,   21,   19,   19,   19,   19,   19,   19,
-       19,   19,   19,   19,   19,   19,   19
+       19,   19,   19,   19,   19,   19,   19,   19
     },
 
     {
        11,   19,   20,   21,   19,   19,   19,   19,   19,   19,
-       19,   19,   19,   19,   19,   19,   19
+       19,   19,   19,   19,   19,   19,   19,   19
     },
 
     {
        11,   22,   22,   23,   22,   24,   22,   22,   24,   22,
-       22,   22,   22,   22,   22,   25,   22
+       22,   22,   22,   22,   22,   22,   25,   22
     },
 
     {
        11,   22,   22,   23,   22,   24,   22,   22,   24,   22,
-       22,   22,   22,   22,   22,   25,   22
+       22,   22,   22,   22,   22,   22,   25,   22
     },
 
     {
-       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
-       33,   34,   35,   35,   36,   37,   38
+       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
+       34,   35,   35,   36,   37,   38,   39,   40
 
     },
 
     {
-       11,   26,   26,   27,   28,   29,   30,   31,   29,   32,
-       33,   34,   35,   35,   36,   37,   38
+       11,   26,   27,   28,   29,   30,   31,   32,   30,   33,
+       34,   35,   35,   36,   37,   38,   39,   40
     },
 
     {
       -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11,
-      -11,  -11,  -11,  -11,  -11,  -11,  -11
+      -11,  -11,  -11,  -11,  -11,  -11,  -11,  -11
     },
 
     {
        11,  -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12,
-      -12,  -12,  -12,  -12,  -12,  -12,  -12
+      -12,  -12,  -12,  -12,  -12,  -12,  -12,  -12
     },
 
     {
-       11,  -13,   39,   40,  -13,  -13,   41,  -13,  -13,  -13,
-      -13,  -13,  -13,  -13,  -13,  -13,  -13
+       11,  -13,   41,   42,  -13,  -13,   43,  -13,  -13,  -13,
+      -13,  -13,  -13,  -13,  -13,  -13,  -13,  -13
     },
 
     {
        11,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14,
-      -14,  -14,  -14,  -14,  -14,  -14,  -14
+      -14,  -14,  -14,  -14,  -14,  -14,  -14,  -14
 
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,   44,   44,   45,   44,   44,   44,   44,   44,   44,
+       44,   44,   44,   44,   44,   44,   44,   44
     },
 
     {
        11,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16,
-      -16,  -16,  -16,  -16,  -16,  -16,  -16
+      -16,  -16,  -16,  -16,  -16,  -16,  -16,  -16
     },
 
     {
        11,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17,
-      -17,  -17,  -17,  -17,  -17,  -17,  -17
+      -17,  -17,  -17,  -17,  -17,  -17,  -17,  -17
     },
 
     {
        11,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,  -18,
-      -18,  -18,  -18,   44,  -18,  -18,  -18
+      -18,   46,  -18,  -18,  -18,  -18,  -18,  -18
     },
 
     {
-       11,   45,   45,  -19,   45,   45,   45,   45,   45,   45,
-       45,   45,   45,   45,   45,   45,   45
+       11,   47,   47,  -19,   47,   47,   47,   47,   47,   47,
+       47,   47,   47,   47,   47,   47,   47,   47
 
     },
 
     {
-       11,  -20,   46,   47,  -20,  -20,  -20,  -20,  -20,  -20,
-      -20,  -20,  -20,  -20,  -20,  -20,  -20
+       11,  -20,   48,   49,  -20,  -20,  -20,  -20,  -20,  -20,
+      -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20
     },
 
     {
-       11,   48,  -21,  -21,   48,   48,   48,   48,   48,   48,
-       48,   48,   48,   48,   48,   48,   48
+       11,   50,  -21,  -21,   50,   50,   50,   50,   50,   50,
+       50,   50,   50,   50,   50,   50,   50,   50
     },
 
     {
-       11,   49,   49,   50,   49,  -22,   49,   49,  -22,   49,
-       49,   49,   49,   49,   49,  -22,   49
+       11,   51,   51,   52,   51,  -22,   51,   51,  -22,   51,
+       51,   51,   51,   51,   51,   51,  -22,   51
     },
 
     {
        11,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23,
-      -23,  -23,  -23,  -23,  -23,  -23,  -23
+      -23,  -23,  -23,  -23,  -23,  -23,  -23,  -23
     },
 
     {
        11,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24,
-      -24,  -24,  -24,  -24,  -24,  -24,  -24
+      -24,  -24,  -24,  -24,  -24,  -24,  -24,  -24
 
     },
 
     {
-       11,   51,   51,   52,   51,   51,   51,   51,   51,   51,
-       51,   51,   51,   51,   51,   51,   51
+       11,   53,   53,   54,   53,   53,   53,   53,   53,   53,
+       53,   53,   53,   53,   53,   53,   53,   53
     },
 
     {
        11,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26,
-      -26,  -26,  -26,  -26,  -26,  -26,  -26
+      -26,  -26,  -26,  -26,  -26,  -26,  -26,  -26
     },
 
     {
-       11,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
-      -27,  -27,  -27,  -27,  -27,  -27,  -27
+       11,  -27,   55,  -27,  -27,  -27,  -27,  -27,  -27,  -27,
+      -27,  -27,  -27,  -27,  -27,  -27,  -27,  -27
     },
 
     {
        11,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28,
-      -28,  -28,  -28,  -28,   53,  -28,  -28
+      -28,  -28,  -28,  -28,  -28,  -28,  -28,  -28
     },
 
     {
        11,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,  -29,
-      -29,  -29,  -29,  -29,  -29,  -29,  -29
+      -29,  -29,  -29,  -29,   56,  -29,  -29,  -29
 
     },
 
     {
-       11,   54,   54,  -30,   54,   54,   54,   54,   54,   54,
-       54,   54,   54,   54,   54,   54,   54
+       11,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30,
+      -30,  -30,  -30,  -30,  -30,  -30,  -30,  -30
     },
 
     {
-       11,  -31,  -31,  -31,  -31,  -31,  -31,   55,  -31,  -31,
-      -31,  -31,  -31,  -31,  -31,  -31,  -31
+       11,   57,   57,  -31,   57,   57,   57,   57,   57,   57,
+       57,   57,   57,   57,   57,   57,   57,   57
     },
 
     {
-       11,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32,
-      -32,  -32,  -32,  -32,  -32,  -32,  -32
+       11,  -32,  -32,  -32,  -32,  -32,  -32,   58,  -32,  -32,
+      -32,  -32,  -32,  -32,  -32,  -32,  -32,  -32
     },
 
     {
        11,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33,
-      -33,  -33,  -33,  -33,  -33,  -33,  -33
+      -33,  -33,  -33,  -33,  -33,  -33,  -33,  -33
     },
 
     {
        11,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34,
-      -34,   56,   57,   57,  -34,  -34,  -34
+      -34,  -34,  -34,  -34,  -34,  -34,  -34,  -34
 
     },
 
     {
        11,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,  -35,
-      -35,   57,   57,   57,  -35,  -35,  -35
+      -35,   59,   59,  -35,  -35,  -35,  -35,  -35
     },
 
     {
        11,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,  -36,
-      -36,  -36,  -36,  -36,  -36,  -36,  -36
+      -36,  -36,  -36,  -36,   60,  -36,  -36,  -36
     },
 
     {
-       11,  -37,  -37,   58,  -37,  -37,  -37,  -37,  -37,  -37,
-      -37,  -37,  -37,  -37,  -37,  -37,  -37
+       11,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37,
+      -37,  -37,  -37,  -37,  -37,  -37,  -37,  -37
     },
 
     {
        11,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,  -38,
-      -38,  -38,  -38,  -38,  -38,  -38,   59
+      -38,  -38,  -38,  -38,   61,  -38,  -38,  -38
     },
 
     {
-       11,  -39,   39,   40,  -39,  -39,   41,  -39,  -39,  -39,
-      -39,  -39,  -39,  -39,  -39,  -39,  -39
+       11,  -39,  -39,   62,  -39,  -39,  -39,  -39,  -39,  -39,
+      -39,  -39,  -39,  -39,  -39,  -39,  -39,  -39
 
     },
 
     {
        11,  -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40,  -40,
-      -40,  -40,  -40,  -40,  -40,  -40,  -40
+      -40,  -40,  -40,  -40,  -40,  -40,  -40,   63
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,  -41,   41,   42,  -41,  -41,   43,  -41,  -41,  -41,
+      -41,  -41,  -41,  -41,  -41,  -41,  -41,  -41
     },
 
     {
-       11,   42,   42,   43,   42,   42,   42,   42,   42,   42,
-       42,   42,   42,   42,   42,   42,   42
+       11,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42,
+      -42,  -42,  -42,  -42,  -42,  -42,  -42,  -42
     },
 
     {
-       11,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,  -43,
-      -43,  -43,  -43,  -43,  -43,  -43,  -43
+       11,   44,   44,   45,   44,   44,   44,   44,   44,   44,
+       44,   44,   44,   44,   44,   44,   44,   44
     },
 
     {
-       11,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,  -44,
-      -44,  -44,  -44,   44,  -44,  -44,  -44
+       11,   44,   44,   45,   44,   44,   44,   44,   44,   44,
+       44,   44,   44,   44,   44,   44,   44,   44
 
     },
 
     {
-       11,   45,   45,  -45,   45,   45,   45,   45,   45,   45,
-       45,   45,   45,   45,   45,   45,   45
+       11,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45,
+      -45,  -45,  -45,  -45,  -45,  -45,  -45,  -45
     },
 
     {
-       11,  -46,   46,   47,  -46,  -46,  -46,  -46,  -46,  -46,
-      -46,  -46,  -46,  -46,  -46,  -46,  -46
+       11,  -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46,  -46,
+      -46,   46,  -46,  -46,  -46,  -46,  -46,  -46
     },
 
     {
-       11,   48,  -47,  -47,   48,   48,   48,   48,   48,   48,
-       48,   48,   48,   48,   48,   48,   48
+       11,   47,   47,  -47,   47,   47,   47,   47,   47,   47,
+       47,   47,   47,   47,   47,   47,   47,   47
     },
 
     {
-       11,  -48,  -48,  -48,  -48,  -48,  -48,  -48,  -48,  -48,
-      -48,  -48,  -48,  -48,  -48,  -48,  -48
+       11,  -48,   48,   49,  -48,  -48,  -48,  -48,  -48,  -48,
+      -48,  -48,  -48,  -48,  -48,  -48,  -48,  -48
     },
 
     {
-       11,   49,   49,   50,   49,  -49,   49,   49,  -49,   49,
-       49,   49,   49,   49,   49,  -49,   49
+       11,   50,  -49,  -49,   50,   50,   50,   50,   50,   50,
+       50,   50,   50,   50,   50,   50,   50,   50
 
     },
 
     {
        11,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50,
-      -50,  -50,  -50,  -50,  -50,  -50,  -50
+      -50,  -50,  -50,  -50,  -50,  -50,  -50,  -50
     },
 
     {
-       11,  -51,  -51,   52,  -51,  -51,  -51,  -51,  -51,  -51,
-      -51,  -51,  -51,  -51,  -51,  -51,  -51
+       11,   51,   51,   52,   51,  -51,   51,   51,  -51,   51,
+       51,   51,   51,   51,   51,   51,  -51,   51
     },
 
     {
        11,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52,
-      -52,  -52,  -52,  -52,  -52,  -52,  -52
+      -52,  -52,  -52,  -52,  -52,  -52,  -52,  -52
     },
 
     {
-       11,  -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53,
-      -53,  -53,  -53,  -53,  -53,  -53,  -53
+       11,  -53,  -53,   54,  -53,  -53,  -53,  -53,  -53,  -53,
+      -53,  -53,  -53,  -53,  -53,  -53,  -53,  -53
     },
 
     {
-       11,   54,   54,  -54,   54,   54,   54,   54,   54,   54,
-       54,   54,   54,   54,   54,   54,   54
+       11,  -54,  -54,  -54,  -54,  -54,  -54,  -54,  -54,  -54,
+      -54,  -54,  -54,  -54,  -54,  -54,  -54,  -54
 
     },
 
     {
-       11,  -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,
-      -55,  -55,  -55,  -55,  -55,  -55,  -55
+       11,  -55,   55,  -55,  -55,  -55,  -55,  -55,  -55,  -55,
+      -55,  -55,  -55,  -55,  -55,  -55,  -55,  -55
     },
 
     {
        11,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56,
-      -56,   60,   57,   57,  -56,  -56,  -56
+      -56,  -56,  -56,  -56,  -56,  -56,  -56,  -56
     },
 
     {
-       11,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,  -57,
-      -57,   57,   57,   57,  -57,  -57,  -57
+       11,   57,   57,  -57,   57,   57,   57,   57,   57,   57,
+       57,   57,   57,   57,   57,   57,   57,   57
     },
 
     {
        11,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
-      -58,  -58,  -58,  -58,  -58,  -58,  -58
+      -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58
     },
 
     {
        11,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,
-      -59,  -59,  -59,  -59,  -59,  -59,  -59
+      -59,   59,   59,  -59,  -59,  -59,  -59,  -59
 
     },
 
     {
        11,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,
-      -60,   57,   57,   57,  -60,  -60,  -60
+      -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60
+    },
+
+    {
+       11,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61,
+      -61,  -61,  -61,  -61,  -61,  -61,  -61,  -61
+    },
+
+    {
+       11,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62,
+      -62,  -62,  -62,  -62,  -62,  -62,  -62,  -62
+    },
+
+    {
+       11,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
+      -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63
     },
 
     } ;
 
-static yy_state_type yy_get_previous_state (void );
-static yy_state_type yy_try_NUL_trans (yy_state_type current_state  );
-static int yy_get_next_buffer (void );
-static void yy_fatal_error (yyconst char msg[]  );
+static yy_state_type yy_get_previous_state ( void );
+static yy_state_type yy_try_NUL_trans ( yy_state_type current_state  );
+static int yy_get_next_buffer ( void );
+static void yynoreturn yy_fatal_error ( const char* msg  );
 
 /* Done after the current pattern has been matched and before the
- * corresponding action - sets up zconftext.
+ * corresponding action - sets up yytext.
  */
 #define YY_DO_BEFORE_ACTION \
 	(yytext_ptr) = yy_bp; \
-	zconfleng = (size_t) (yy_cp - yy_bp); \
+	yyleng = (int) (yy_cp - yy_bp); \
 	(yy_hold_char) = *yy_cp; \
 	*yy_cp = '\0'; \
 	(yy_c_buf_p) = yy_cp;
-
-#define YY_NUM_RULES 33
-#define YY_END_OF_BUFFER 34
+#define YY_NUM_RULES 37
+#define YY_END_OF_BUFFER 38
 /* This struct is not used in this scanner,
    but its presence is necessary. */
 struct yy_trans_info
@@ -710,32 +716,33 @@ struct yy_trans_info
 	flex_int32_t yy_verify;
 	flex_int32_t yy_nxt;
 	};
-static yyconst flex_int16_t yy_accept[61] =
+static const flex_int16_t yy_accept[64] =
     {   0,
         0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
-       34,    5,    4,    2,    3,    7,    8,    6,   32,   29,
-       31,   24,   28,   27,   26,   22,   17,   13,   16,   20,
-       22,   11,   12,   19,   19,   14,   22,   22,    4,    2,
-        3,    3,    1,    6,   32,   29,   31,   30,   24,   23,
-       26,   25,   15,   20,    9,   19,   19,   21,   10,   18
+       38,    5,    4,    2,    3,    7,    8,    6,   36,   33,
+       35,   28,   32,   31,   30,   26,   25,   21,   13,   20,
+       23,   26,   11,   12,   22,   18,   14,   19,   26,   26,
+        4,    2,    3,    3,    1,    6,   36,   33,   35,   34,
+       28,   27,   30,   29,   25,   15,   23,    9,   22,   16,
+       17,   24,   10
     } ;
 
-static yyconst flex_int32_t yy_ec[256] =
+static const YY_CHAR yy_ec[256] =
     {   0,
         1,    1,    1,    1,    1,    1,    1,    1,    2,    3,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    2,    4,    5,    6,    1,    1,    7,    8,    9,
-       10,    1,    1,    1,   11,   12,   12,   13,   13,   13,
-       13,   13,   13,   13,   13,   13,   13,    1,    1,    1,
-       14,    1,    1,    1,   13,   13,   13,   13,   13,   13,
-       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-        1,   15,    1,    1,   13,    1,   13,   13,   13,   13,
-
-       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-       13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
-       13,   13,    1,   16,    1,    1,    1,    1,    1,    1,
+       10,    1,    1,    1,   11,   12,   12,   11,   11,   11,
+       11,   11,   11,   11,   11,   11,   11,    1,    1,   13,
+       14,   15,    1,    1,   11,   11,   11,   11,   11,   11,
+       11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
+       11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
+        1,   16,    1,    1,   11,    1,   11,   11,   11,   11,
+
+       11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
+       11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
+       11,   11,    1,   17,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
         1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
@@ -752,8 +759,14 @@ static yyconst flex_int32_t yy_ec[256] =
         1,    1,    1,    1,    1
     } ;
 
-extern int zconf_flex_debug;
-int zconf_flex_debug = 0;
+/* Table of booleans, true if rule could match eol. */
+static const flex_int32_t yy_rule_can_match_eol[38] =
+    {   0,
+1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
+    0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0,     };
+
+extern int yy_flex_debug;
+int yy_flex_debug = 0;
 
 /* The intent behind this definition is that it'll catch
  * any uses of REJECT which flex missed.
@@ -762,7 +775,7 @@ int zconf_flex_debug = 0;
 #define yymore() yymore_used_but_not_detected
 #define YY_MORE_ADJ 0
 #define YY_RESTORE_YY_MORE_OFFSET
-char *zconftext;
+char *yytext;
 #define YY_NO_INPUT 1
 
 /*
@@ -789,8 +802,8 @@ static char *text;
 static int text_size, text_asize;
 
 struct buffer {
-        struct buffer *parent;
-        YY_BUFFER_STATE state;
+	struct buffer *parent;
+	YY_BUFFER_STATE state;
 };
 
 struct buffer *current_buf;
@@ -814,7 +827,7 @@ static void append_string(const char *str, int size)
 	if (new_size > text_asize) {
 		new_size += START_STRSIZE - 1;
 		new_size &= -START_STRSIZE;
-		text = realloc(text, new_size);
+		text = xrealloc(text, new_size);
 		text_asize = new_size;
 	}
 	memcpy(text + text_size, str, size);
@@ -829,6 +842,13 @@ static void alloc_string(const char *str, int size)
 	text[size] = 0;
 }
 
+static void warn_ignored_character(char chr)
+{
+	fprintf(stderr,
+	        "%s:%d:warning: ignoring unsupported character '%c'\n",
+	        zconf_curname(), zconf_lineno(), chr);
+}
+
 #define INITIAL 0
 #define COMMAND 1
 #define HELP 2
@@ -847,36 +867,36 @@ static void alloc_string(const char *str, int size)
 #define YY_EXTRA_TYPE void *
 #endif
 
-static int yy_init_globals (void );
+static int yy_init_globals ( void );
 
 /* Accessor methods to globals.
    These are made visible to non-reentrant scanners for convenience. */
 
-int zconflex_destroy (void );
+int yylex_destroy ( void );
 
-int zconfget_debug (void );
+int yyget_debug ( void );
 
-void zconfset_debug (int debug_flag  );
+void yyset_debug ( int debug_flag  );
 
-YY_EXTRA_TYPE zconfget_extra (void );
+YY_EXTRA_TYPE yyget_extra ( void );
 
-void zconfset_extra (YY_EXTRA_TYPE user_defined  );
+void yyset_extra ( YY_EXTRA_TYPE user_defined  );
 
-FILE *zconfget_in (void );
+FILE *yyget_in ( void );
 
-void zconfset_in  (FILE * in_str  );
+void yyset_in  ( FILE * _in_str  );
 
-FILE *zconfget_out (void );
+FILE *yyget_out ( void );
 
-void zconfset_out  (FILE * out_str  );
+void yyset_out  ( FILE * _out_str  );
 
-int zconfget_leng (void );
+			int yyget_leng ( void );
 
-char *zconfget_text (void );
+char *yyget_text ( void );
 
-int zconfget_lineno (void );
+int yyget_lineno ( void );
 
-void zconfset_lineno (int line_number  );
+void yyset_lineno ( int _line_number  );
 
 /* Macros after this point can all be overridden by user definitions in
  * section 1.
@@ -884,35 +904,43 @@ void zconfset_lineno (int line_number  );
 
 #ifndef YY_SKIP_YYWRAP
 #ifdef __cplusplus
-extern "C" int zconfwrap (void );
+extern "C" int yywrap ( void );
 #else
-extern int zconfwrap (void );
+extern int yywrap ( void );
 #endif
 #endif
 
-    static void yyunput (int c,char *buf_ptr  );
+#ifndef YY_NO_UNPUT
     
+    static void yyunput ( int c, char *buf_ptr  );
+    
+#endif
+
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char *,yyconst char *,int );
+static void yy_flex_strncpy ( char *, const char *, int );
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * );
+static int yy_flex_strlen ( const char * );
 #endif
 
 #ifndef YY_NO_INPUT
-
 #ifdef __cplusplus
-static int yyinput (void );
+static int yyinput ( void );
 #else
-static int input (void );
+static int input ( void );
 #endif
 
 #endif
 
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
@@ -920,7 +948,7 @@ static int input (void );
 /* This used to be an fputs(), but since the string might contain NUL's,
  * we now use fwrite().
  */
-#define ECHO do { if (fwrite( zconftext, zconfleng, 1, zconfout )) {} } while (0)
+#define ECHO do { if (fwrite( yytext, (size_t) yyleng, 1, yyout )) {} } while (0)
 #endif
 
 /* Gets input and stuffs it into "buf".  number of characters read, or YY_NULL,
@@ -929,7 +957,7 @@ static int input (void );
 #ifndef YY_INPUT
 #define YY_INPUT(buf,result,max_size) \
 	errno=0; \
-	while ( (result = read( fileno(zconfin), (char *) buf, max_size )) < 0 ) \
+	while ( (result = (int) read( fileno(yyin), buf, (yy_size_t) max_size )) < 0 ) \
 	{ \
 		if( errno != EINTR) \
 		{ \
@@ -937,7 +965,7 @@ static int input (void );
 			break; \
 		} \
 		errno=0; \
-		clearerr(zconfin); \
+		clearerr(yyin); \
 	}\
 \
 
@@ -969,12 +997,12 @@ static int input (void );
 #ifndef YY_DECL
 #define YY_DECL_IS_OURS 1
 
-extern int zconflex (void);
+extern int yylex (void);
 
-#define YY_DECL int zconflex (void)
+#define YY_DECL int yylex (void)
 #endif /* !YY_DECL */
 
-/* Code executed at the beginning of each rule, after zconftext and zconfleng
+/* Code executed at the beginning of each rule, after yytext and yyleng
  * have been set up.
  */
 #ifndef YY_USER_ACTION
@@ -983,7 +1011,7 @@ extern int zconflex (void);
 
 /* Code executed@the end of each rule. */
 #ifndef YY_BREAK
-#define YY_BREAK break;
+#define YY_BREAK /*LINTED*/break;
 #endif
 
 #define YY_RULE_SETUP \
@@ -993,13 +1021,10 @@ extern int zconflex (void);
  */
 YY_DECL
 {
-	register yy_state_type yy_current_state;
-	register char *yy_cp, *yy_bp;
-	register int yy_act;
+	yy_state_type yy_current_state;
+	char *yy_cp, *yy_bp;
+	int yy_act;
     
-	int str = 0;
-	int ts, i;
-
 	if ( !(yy_init) )
 		{
 		(yy_init) = 1;
@@ -1011,26 +1036,31 @@ YY_DECL
 		if ( ! (yy_start) )
 			(yy_start) = 1;	/* first start state */
 
-		if ( ! zconfin )
-			zconfin = stdin;
+		if ( ! yyin )
+			yyin = stdin;
 
-		if ( ! zconfout )
-			zconfout = stdout;
+		if ( ! yyout )
+			yyout = stdout;
 
 		if ( ! YY_CURRENT_BUFFER ) {
-			zconfensure_buffer_stack ();
+			yyensure_buffer_stack ();
 			YY_CURRENT_BUFFER_LVALUE =
-				zconf_create_buffer(zconfin,YY_BUF_SIZE );
+				yy_create_buffer( yyin, YY_BUF_SIZE );
 		}
 
-		zconf_load_buffer_state( );
+		yy_load_buffer_state(  );
 		}
 
-	while ( 1 )		/* loops until end-of-file is reached */
+	{
+
+	int str = 0;
+	int ts, i;
+
+	while ( /*CONSTCOND*/1 )		/* loops until end-of-file is reached */
 		{
 		yy_cp = (yy_c_buf_p);
 
-		/* Support of zconftext. */
+		/* Support of yytext. */
 		*yy_cp = (yy_hold_char);
 
 		/* yy_bp points to the position in yy_ch_buf of the start of
@@ -1050,6 +1080,16 @@ yy_find_action:
 
 		YY_DO_BEFORE_ACTION;
 
+		if ( yy_act != YY_END_OF_BUFFER && yy_rule_can_match_eol[yy_act] )
+			{
+			int yyl;
+			for ( yyl = 0; yyl < yyleng; ++yyl )
+				if ( yytext[yyl] == '\n' )
+					
+    yylineno++;
+;
+			}
+
 do_action:	/* This label is used only to access EOF actions. */
 
 		switch ( yy_act )
@@ -1060,7 +1100,6 @@ case 2:
 /* rule 2 can match eol */
 YY_RULE_SETUP
 {
-	current_file->lineno++;
 	return T_EOL;
 }
 	YY_BREAK
@@ -1077,7 +1116,7 @@ YY_RULE_SETUP
 case 5:
 YY_RULE_SETUP
 {
-	unput(zconftext[0]);
+	unput(yytext[0]);
 	BEGIN(COMMAND);
 }
 	YY_BREAK
@@ -1085,29 +1124,28 @@ YY_RULE_SETUP
 case 6:
 YY_RULE_SETUP
 {
-		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		BEGIN(PARAM);
 		current_pos.file = current_file;
-		current_pos.lineno = current_file->lineno;
+		current_pos.lineno = yylineno;
 		if (id && id->flags & TF_COMMAND) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
-		alloc_string(zconftext, zconfleng);
-		zconflval.string = text;
+		alloc_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD;
 	}
 	YY_BREAK
 case 7:
 YY_RULE_SETUP
-
+warn_ignored_character(*yytext);
 	YY_BREAK
 case 8:
 /* rule 8 can match eol */
 YY_RULE_SETUP
 {
 		BEGIN(INITIAL);
-		current_file->lineno++;
 		return T_EOL;
 	}
 	YY_BREAK
@@ -1142,46 +1180,62 @@ return T_UNEQUAL;
 	YY_BREAK
 case 16:
 YY_RULE_SETUP
-{
-		str = zconftext[0];
-		new_string();
-		BEGIN(STRING);
-	}
+return T_LESS_EQUAL;
 	YY_BREAK
 case 17:
-/* rule 17 can match eol */
 YY_RULE_SETUP
-BEGIN(INITIAL); current_file->lineno++; return T_EOL;
+return T_GREATER_EQUAL;
 	YY_BREAK
 case 18:
 YY_RULE_SETUP
-/* ignore */
+return T_LESS;
 	YY_BREAK
 case 19:
 YY_RULE_SETUP
+return T_GREATER;
+	YY_BREAK
+case 20:
+YY_RULE_SETUP
+{
+		str = yytext[0];
+		new_string();
+		BEGIN(STRING);
+	}
+	YY_BREAK
+case 21:
+/* rule 21 can match eol */
+YY_RULE_SETUP
+BEGIN(INITIAL); return T_EOL;
+	YY_BREAK
+case 22:
+YY_RULE_SETUP
 {
-		const struct kconf_id *id = kconf_id_lookup(zconftext, zconfleng);
+		const struct kconf_id *id = kconf_id_lookup(yytext, yyleng);
 		if (id && id->flags & TF_PARAM) {
-			zconflval.id = id;
+			yylval.id = id;
 			return id->token;
 		}
-		alloc_string(zconftext, zconfleng);
-		zconflval.string = text;
+		alloc_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD;
 	}
 	YY_BREAK
-case 20:
+case 23:
 YY_RULE_SETUP
 /* comment */
 	YY_BREAK
-case 21:
-/* rule 21 can match eol */
+case 24:
+/* rule 24 can match eol */
 YY_RULE_SETUP
-current_file->lineno++;
+;
 	YY_BREAK
-case 22:
+case 25:
 YY_RULE_SETUP
 
+	YY_BREAK
+case 26:
+YY_RULE_SETUP
+warn_ignored_character(*yytext);
 	YY_BREAK
 case YY_STATE_EOF(PARAM):
 {
@@ -1189,59 +1243,62 @@ case YY_STATE_EOF(PARAM):
 	}
 	YY_BREAK
 
-case 23:
-/* rule 23 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+case 27:
+/* rule 27 can match eol */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
+YY_LINENO_REWIND_TO(yy_cp - 1);
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
-		append_string(zconftext, zconfleng);
-		zconflval.string = text;
+		append_string(yytext, yyleng);
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 24:
+case 28:
 YY_RULE_SETUP
 {
-		append_string(zconftext, zconfleng);
+		append_string(yytext, yyleng);
 	}
 	YY_BREAK
-case 25:
-/* rule 25 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+case 29:
+/* rule 29 can match eol */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
+YY_LINENO_REWIND_TO(yy_cp - 1);
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
-		append_string(zconftext + 1, zconfleng - 1);
-		zconflval.string = text;
+		append_string(yytext + 1, yyleng - 1);
+		yylval.string = text;
 		return T_WORD_QUOTE;
 	}
 	YY_BREAK
-case 26:
+case 30:
 YY_RULE_SETUP
 {
-		append_string(zconftext + 1, zconfleng - 1);
+		append_string(yytext + 1, yyleng - 1);
 	}
 	YY_BREAK
-case 27:
+case 31:
 YY_RULE_SETUP
 {
-		if (str == zconftext[0]) {
+		if (str == yytext[0]) {
 			BEGIN(PARAM);
-			zconflval.string = text;
+			yylval.string = text;
 			return T_WORD_QUOTE;
 		} else
-			append_string(zconftext, 1);
+			append_string(yytext, 1);
 	}
 	YY_BREAK
-case 28:
-/* rule 28 can match eol */
+case 32:
+/* rule 32 can match eol */
 YY_RULE_SETUP
 {
-		printf("%s:%d:warning: multi-line strings not supported\n", zconf_curname(), zconf_lineno());
-		current_file->lineno++;
+		fprintf(stderr,
+			"%s:%d:warning: multi-line strings not supported\n",
+			zconf_curname(), zconf_lineno());
 		BEGIN(INITIAL);
 		return T_EOL;
 	}
@@ -1252,12 +1309,12 @@ case YY_STATE_EOF(STRING):
 	}
 	YY_BREAK
 
-case 29:
+case 33:
 YY_RULE_SETUP
 {
 		ts = 0;
-		for (i = 0; i < zconfleng; i++) {
-			if (zconftext[i] == '\t')
+		for (i = 0; i < yyleng; i++) {
+			if (yytext[i] == '\t')
 				ts = (ts & ~7) + 8;
 			else
 				ts++;
@@ -1277,35 +1334,34 @@ YY_RULE_SETUP
 		}
 	}
 	YY_BREAK
-case 30:
-/* rule 30 can match eol */
-*yy_cp = (yy_hold_char); /* undo effects of setting up zconftext */
+case 34:
+/* rule 34 can match eol */
+*yy_cp = (yy_hold_char); /* undo effects of setting up yytext */
+YY_LINENO_REWIND_TO(yy_cp - 1);
 (yy_c_buf_p) = yy_cp -= 1;
-YY_DO_BEFORE_ACTION; /* set up zconftext again */
+YY_DO_BEFORE_ACTION; /* set up yytext again */
 YY_RULE_SETUP
 {
-		current_file->lineno++;
 		zconf_endhelp();
 		return T_HELPTEXT;
 	}
 	YY_BREAK
-case 31:
-/* rule 31 can match eol */
+case 35:
+/* rule 35 can match eol */
 YY_RULE_SETUP
 {
-		current_file->lineno++;
 		append_string("\n", 1);
 	}
 	YY_BREAK
-case 32:
+case 36:
 YY_RULE_SETUP
 {
-		while (zconfleng) {
-			if ((zconftext[zconfleng-1] != ' ') && (zconftext[zconfleng-1] != '\t'))
+		while (yyleng) {
+			if ((yytext[yyleng-1] != ' ') && (yytext[yyleng-1] != '\t'))
 				break;
-			zconfleng--;
+			yyleng--;
 		}
-		append_string(zconftext, zconfleng);
+		append_string(yytext, yyleng);
 		if (!first_ts)
 			first_ts = last_ts;
 	}
@@ -1324,11 +1380,11 @@ case YY_STATE_EOF(COMMAND):
 		zconf_endfile();
 		return T_EOL;
 	}
-	fclose(zconfin);
+	fclose(yyin);
 	yyterminate();
 }
 	YY_BREAK
-case 33:
+case 37:
 YY_RULE_SETUP
 YY_FATAL_ERROR( "flex scanner jammed" );
 	YY_BREAK
@@ -1346,15 +1402,15 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 			{
 			/* We're scanning a new file or input source.  It's
 			 * possible that this happened because the user
-			 * just pointed zconfin at a new source and called
-			 * zconflex().  If so, then we have to assure
+			 * just pointed yyin at a new source and called
+			 * yylex().  If so, then we have to assure
 			 * consistency between YY_CURRENT_BUFFER and our
 			 * globals.  Here is the right place to do so, because
 			 * this is the first action (other than possibly a
 			 * back-up) that will match for the new input source.
 			 */
 			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
-			YY_CURRENT_BUFFER_LVALUE->yy_input_file = zconfin;
+			YY_CURRENT_BUFFER_LVALUE->yy_input_file = yyin;
 			YY_CURRENT_BUFFER_LVALUE->yy_buffer_status = YY_BUFFER_NORMAL;
 			}
 
@@ -1407,11 +1463,11 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 				{
 				(yy_did_buffer_switch_on_eof) = 0;
 
-				if ( zconfwrap( ) )
+				if ( yywrap(  ) )
 					{
 					/* Note: because we've taken care in
 					 * yy_get_next_buffer() to have set up
-					 * zconftext, we can now set up
+					 * yytext, we can now set up
 					 * yy_c_buf_p so that if some total
 					 * hoser (like flex itself) wants to
 					 * call the scanner after we return the
@@ -1460,7 +1516,8 @@ YY_FATAL_ERROR( "flex scanner jammed" );
 			"fatal flex scanner internal error--no action found" );
 	} /* end of action switch */
 		} /* end of scanning one token */
-} /* end of zconflex */
+	} /* end of user's declarations */
+} /* end of yylex */
 
 /* yy_get_next_buffer - try to read in a new buffer
  *
@@ -1471,9 +1528,9 @@ YY_FATAL_ERROR( "flex scanner jammed" );
  */
 static int yy_get_next_buffer (void)
 {
-    	register char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
-	register char *source = (yytext_ptr);
-	register int number_to_move, i;
+    	char *dest = YY_CURRENT_BUFFER_LVALUE->yy_ch_buf;
+	char *source = (yytext_ptr);
+	int number_to_move, i;
 	int ret_val;
 
 	if ( (yy_c_buf_p) > &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[(yy_n_chars) + 1] )
@@ -1502,7 +1559,7 @@ static int yy_get_next_buffer (void)
 	/* Try to read more data. */
 
 	/* First move last chars to start of buffer. */
-	number_to_move = (int) ((yy_c_buf_p) - (yytext_ptr)) - 1;
+	number_to_move = (int) ((yy_c_buf_p) - (yytext_ptr) - 1);
 
 	for ( i = 0; i < number_to_move; ++i )
 		*(dest++) = *(source++);
@@ -1522,7 +1579,7 @@ static int yy_get_next_buffer (void)
 			{ /* Not enough room in the buffer - grow it. */
 
 			/* just a shorter name for the current buffer */
-			YY_BUFFER_STATE b = YY_CURRENT_BUFFER;
+			YY_BUFFER_STATE b = YY_CURRENT_BUFFER_LVALUE;
 
 			int yy_c_buf_p_offset =
 				(int) ((yy_c_buf_p) - b->yy_ch_buf);
@@ -1538,11 +1595,12 @@ static int yy_get_next_buffer (void)
 
 				b->yy_ch_buf = (char *)
 					/* Include room in for 2 EOB chars. */
-					zconfrealloc((void *) b->yy_ch_buf,b->yy_buf_size + 2  );
+					yyrealloc( (void *) b->yy_ch_buf,
+							 (yy_size_t) (b->yy_buf_size + 2)  );
 				}
 			else
 				/* Can't grow it, we don't own it. */
-				b->yy_ch_buf = 0;
+				b->yy_ch_buf = NULL;
 
 			if ( ! b->yy_ch_buf )
 				YY_FATAL_ERROR(
@@ -1560,7 +1618,7 @@ static int yy_get_next_buffer (void)
 
 		/* Read in more data. */
 		YY_INPUT( (&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move]),
-			(yy_n_chars), (size_t) num_to_read );
+			(yy_n_chars), num_to_read );
 
 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars = (yy_n_chars);
 		}
@@ -1570,7 +1628,7 @@ static int yy_get_next_buffer (void)
 		if ( number_to_move == YY_MORE_ADJ )
 			{
 			ret_val = EOB_ACT_END_OF_FILE;
-			zconfrestart(zconfin  );
+			yyrestart( yyin  );
 			}
 
 		else
@@ -1584,12 +1642,15 @@ static int yy_get_next_buffer (void)
 	else
 		ret_val = EOB_ACT_CONTINUE_SCAN;
 
-	if ((yy_size_t) ((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
+	if (((yy_n_chars) + number_to_move) > YY_CURRENT_BUFFER_LVALUE->yy_buf_size) {
 		/* Extend the array by 50%, plus the number we really need. */
-		yy_size_t new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
-		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) zconfrealloc((void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf,new_size  );
+		int new_size = (yy_n_chars) + number_to_move + ((yy_n_chars) >> 1);
+		YY_CURRENT_BUFFER_LVALUE->yy_ch_buf = (char *) yyrealloc(
+			(void *) YY_CURRENT_BUFFER_LVALUE->yy_ch_buf, (yy_size_t) new_size  );
 		if ( ! YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
 			YY_FATAL_ERROR( "out of dynamic memory in yy_get_next_buffer()" );
+		/* "- 2" to take care of EOB's */
+		YY_CURRENT_BUFFER_LVALUE->yy_buf_size = (int) (new_size - 2);
 	}
 
 	(yy_n_chars) += number_to_move;
@@ -1605,8 +1666,8 @@ static int yy_get_next_buffer (void)
 
     static yy_state_type yy_get_previous_state (void)
 {
-	register yy_state_type yy_current_state;
-	register char *yy_cp;
+	yy_state_type yy_current_state;
+	char *yy_cp;
     
 	yy_current_state = (yy_start);
 
@@ -1625,30 +1686,32 @@ static int yy_get_next_buffer (void)
  */
     static yy_state_type yy_try_NUL_trans  (yy_state_type yy_current_state )
 {
-	register int yy_is_jam;
+	int yy_is_jam;
     
 	yy_current_state = yy_nxt[yy_current_state][1];
 	yy_is_jam = (yy_current_state <= 0);
 
-	return yy_is_jam ? 0 : yy_current_state;
+		return yy_is_jam ? 0 : yy_current_state;
 }
 
-    static void yyunput (int c, register char * yy_bp )
+#ifndef YY_NO_UNPUT
+
+    static void yyunput (int c, char * yy_bp )
 {
-	register char *yy_cp;
+	char *yy_cp;
     
     yy_cp = (yy_c_buf_p);
 
-	/* undo effects of setting up zconftext */
+	/* undo effects of setting up yytext */
 	*yy_cp = (yy_hold_char);
 
 	if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
 		{ /* need to shift things up to make room */
 		/* +2 for EOB chars. */
-		register int number_to_move = (yy_n_chars) + 2;
-		register char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
+		int number_to_move = (yy_n_chars) + 2;
+		char *dest = &YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[
 					YY_CURRENT_BUFFER_LVALUE->yy_buf_size + 2];
-		register char *source =
+		char *source =
 				&YY_CURRENT_BUFFER_LVALUE->yy_ch_buf[number_to_move];
 
 		while ( source > YY_CURRENT_BUFFER_LVALUE->yy_ch_buf )
@@ -1657,7 +1720,7 @@ static int yy_get_next_buffer (void)
 		yy_cp += (int) (dest - source);
 		yy_bp += (int) (dest - source);
 		YY_CURRENT_BUFFER_LVALUE->yy_n_chars =
-			(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
+			(yy_n_chars) = (int) YY_CURRENT_BUFFER_LVALUE->yy_buf_size;
 
 		if ( yy_cp < YY_CURRENT_BUFFER_LVALUE->yy_ch_buf + 2 )
 			YY_FATAL_ERROR( "flex scanner push-back overflow" );
@@ -1665,11 +1728,17 @@ static int yy_get_next_buffer (void)
 
 	*--yy_cp = (char) c;
 
+    if ( c == '\n' ){
+        --yylineno;
+    }
+
 	(yytext_ptr) = yy_bp;
 	(yy_hold_char) = *yy_cp;
 	(yy_c_buf_p) = yy_cp;
 }
 
+#endif
+
 #ifndef YY_NO_INPUT
 #ifdef __cplusplus
     static int yyinput (void)
@@ -1694,7 +1763,7 @@ static int yy_get_next_buffer (void)
 
 		else
 			{ /* need more input */
-			int offset = (yy_c_buf_p) - (yytext_ptr);
+			int offset = (int) ((yy_c_buf_p) - (yytext_ptr));
 			++(yy_c_buf_p);
 
 			switch ( yy_get_next_buffer(  ) )
@@ -1711,14 +1780,14 @@ static int yy_get_next_buffer (void)
 					 */
 
 					/* Reset buffer status. */
-					zconfrestart(zconfin );
+					yyrestart( yyin );
 
 					/*FALLTHROUGH*/
 
 				case EOB_ACT_END_OF_FILE:
 					{
-					if ( zconfwrap( ) )
-						return EOF;
+					if ( yywrap(  ) )
+						return 0;
 
 					if ( ! (yy_did_buffer_switch_on_eof) )
 						YY_NEW_FILE;
@@ -1737,9 +1806,14 @@ static int yy_get_next_buffer (void)
 		}
 
 	c = *(unsigned char *) (yy_c_buf_p);	/* cast for 8-bit char's */
-	*(yy_c_buf_p) = '\0';	/* preserve zconftext */
+	*(yy_c_buf_p) = '\0';	/* preserve yytext */
 	(yy_hold_char) = *++(yy_c_buf_p);
 
+	if ( c == '\n' )
+		
+    yylineno++;
+;
+
 	return c;
 }
 #endif	/* ifndef YY_NO_INPUT */
@@ -1749,32 +1823,32 @@ static int yy_get_next_buffer (void)
  * 
  * @note This function does not reset the start condition to @c INITIAL .
  */
-    void zconfrestart  (FILE * input_file )
+    void yyrestart  (FILE * input_file )
 {
     
 	if ( ! YY_CURRENT_BUFFER ){
-        zconfensure_buffer_stack ();
+        yyensure_buffer_stack ();
 		YY_CURRENT_BUFFER_LVALUE =
-            zconf_create_buffer(zconfin,YY_BUF_SIZE );
+            yy_create_buffer( yyin, YY_BUF_SIZE );
 	}
 
-	zconf_init_buffer(YY_CURRENT_BUFFER,input_file );
-	zconf_load_buffer_state( );
+	yy_init_buffer( YY_CURRENT_BUFFER, input_file );
+	yy_load_buffer_state(  );
 }
 
 /** Switch to a different input buffer.
  * @param new_buffer The new input buffer.
  * 
  */
-    void zconf_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
+    void yy_switch_to_buffer  (YY_BUFFER_STATE  new_buffer )
 {
     
 	/* TODO. We should be able to replace this entire function body
 	 * with
-	 *		zconfpop_buffer_state();
-	 *		zconfpush_buffer_state(new_buffer);
+	 *		yypop_buffer_state();
+	 *		yypush_buffer_state(new_buffer);
      */
-	zconfensure_buffer_stack ();
+	yyensure_buffer_stack ();
 	if ( YY_CURRENT_BUFFER == new_buffer )
 		return;
 
@@ -1787,21 +1861,21 @@ static int yy_get_next_buffer (void)
 		}
 
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
-	zconf_load_buffer_state( );
+	yy_load_buffer_state(  );
 
 	/* We don't actually know whether we did this switch during
-	 * EOF (zconfwrap()) processing, but the only time this flag
-	 * is looked at is after zconfwrap() is called, so it's safe
+	 * EOF (yywrap()) processing, but the only time this flag
+	 * is looked at is after yywrap() is called, so it's safe
 	 * to go ahead and always set it.
 	 */
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
-static void zconf_load_buffer_state  (void)
+static void yy_load_buffer_state  (void)
 {
     	(yy_n_chars) = YY_CURRENT_BUFFER_LVALUE->yy_n_chars;
 	(yytext_ptr) = (yy_c_buf_p) = YY_CURRENT_BUFFER_LVALUE->yy_buf_pos;
-	zconfin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
+	yyin = YY_CURRENT_BUFFER_LVALUE->yy_input_file;
 	(yy_hold_char) = *(yy_c_buf_p);
 }
 
@@ -1811,35 +1885,35 @@ static void zconf_load_buffer_state  (void)
  * 
  * @return the allocated buffer state.
  */
-    YY_BUFFER_STATE zconf_create_buffer  (FILE * file, int  size )
+    YY_BUFFER_STATE yy_create_buffer  (FILE * file, int  size )
 {
 	YY_BUFFER_STATE b;
     
-	b = (YY_BUFFER_STATE) zconfalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_buf_size = size;
 
 	/* yy_ch_buf has to be 2 characters longer than the size given because
 	 * we need to put in 2 end-of-buffer characters.
 	 */
-	b->yy_ch_buf = (char *) zconfalloc(b->yy_buf_size + 2  );
+	b->yy_ch_buf = (char *) yyalloc( (yy_size_t) (b->yy_buf_size + 2)  );
 	if ( ! b->yy_ch_buf )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_create_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_create_buffer()" );
 
 	b->yy_is_our_buffer = 1;
 
-	zconf_init_buffer(b,file );
+	yy_init_buffer( b, file );
 
 	return b;
 }
 
 /** Destroy the buffer.
- * @param b a buffer created with zconf_create_buffer()
+ * @param b a buffer created with yy_create_buffer()
  * 
  */
-    void zconf_delete_buffer (YY_BUFFER_STATE  b )
+    void yy_delete_buffer (YY_BUFFER_STATE  b )
 {
     
 	if ( ! b )
@@ -1849,27 +1923,27 @@ static void zconf_load_buffer_state  (void)
 		YY_CURRENT_BUFFER_LVALUE = (YY_BUFFER_STATE) 0;
 
 	if ( b->yy_is_our_buffer )
-		zconffree((void *) b->yy_ch_buf  );
+		yyfree( (void *) b->yy_ch_buf  );
 
-	zconffree((void *) b  );
+	yyfree( (void *) b  );
 }
 
 /* Initializes or reinitializes a buffer.
  * This function is sometimes called more than once on the same buffer,
- * such as during a zconfrestart() or at EOF.
+ * such as during a yyrestart() or at EOF.
  */
-    static void zconf_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
+    static void yy_init_buffer  (YY_BUFFER_STATE  b, FILE * file )
 
 {
 	int oerrno = errno;
     
-	zconf_flush_buffer(b );
+	yy_flush_buffer( b );
 
 	b->yy_input_file = file;
 	b->yy_fill_buffer = 1;
 
-    /* If b is the current buffer, then zconf_init_buffer was _probably_
-     * called from zconfrestart() or through yy_get_next_buffer.
+    /* If b is the current buffer, then yy_init_buffer was _probably_
+     * called from yyrestart() or through yy_get_next_buffer.
      * In that case, we don't want to reset the lineno or column.
      */
     if (b != YY_CURRENT_BUFFER){
@@ -1886,7 +1960,7 @@ static void zconf_load_buffer_state  (void)
  * @param b the buffer state to be flushed, usually @c YY_CURRENT_BUFFER.
  * 
  */
-    void zconf_flush_buffer (YY_BUFFER_STATE  b )
+    void yy_flush_buffer (YY_BUFFER_STATE  b )
 {
     	if ( ! b )
 		return;
@@ -1906,7 +1980,7 @@ static void zconf_load_buffer_state  (void)
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
 	if ( b == YY_CURRENT_BUFFER )
-		zconf_load_buffer_state( );
+		yy_load_buffer_state(  );
 }
 
 /** Pushes the new state onto the stack. The new state becomes
@@ -1915,14 +1989,14 @@ static void zconf_load_buffer_state  (void)
  *  @param new_buffer The new state.
  *  
  */
-void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
+void yypush_buffer_state (YY_BUFFER_STATE new_buffer )
 {
     	if (new_buffer == NULL)
 		return;
 
-	zconfensure_buffer_stack();
+	yyensure_buffer_stack();
 
-	/* This block is copied from zconf_switch_to_buffer. */
+	/* This block is copied from yy_switch_to_buffer. */
 	if ( YY_CURRENT_BUFFER )
 		{
 		/* Flush out information for old buffer. */
@@ -1936,8 +2010,8 @@ void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
 		(yy_buffer_stack_top)++;
 	YY_CURRENT_BUFFER_LVALUE = new_buffer;
 
-	/* copied from zconf_switch_to_buffer. */
-	zconf_load_buffer_state( );
+	/* copied from yy_switch_to_buffer. */
+	yy_load_buffer_state(  );
 	(yy_did_buffer_switch_on_eof) = 1;
 }
 
@@ -1945,18 +2019,18 @@ void zconfpush_buffer_state (YY_BUFFER_STATE new_buffer )
  *  The next element becomes the new top.
  *  
  */
-void zconfpop_buffer_state (void)
+void yypop_buffer_state (void)
 {
     	if (!YY_CURRENT_BUFFER)
 		return;
 
-	zconf_delete_buffer(YY_CURRENT_BUFFER );
+	yy_delete_buffer(YY_CURRENT_BUFFER );
 	YY_CURRENT_BUFFER_LVALUE = NULL;
 	if ((yy_buffer_stack_top) > 0)
 		--(yy_buffer_stack_top);
 
 	if (YY_CURRENT_BUFFER) {
-		zconf_load_buffer_state( );
+		yy_load_buffer_state(  );
 		(yy_did_buffer_switch_on_eof) = 1;
 	}
 }
@@ -1964,9 +2038,9 @@ void zconfpop_buffer_state (void)
 /* Allocates the stack if it does not exist.
  *  Guarantees space for at least one push.
  */
-static void zconfensure_buffer_stack (void)
+static void yyensure_buffer_stack (void)
 {
-	int num_to_alloc;
+	yy_size_t num_to_alloc;
     
 	if (!(yy_buffer_stack)) {
 
@@ -1974,15 +2048,15 @@ static void zconfensure_buffer_stack (void)
 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
 		 * immediate realloc on the next call.
          */
-		num_to_alloc = 1;
-		(yy_buffer_stack) = (struct yy_buffer_state**)zconfalloc
+      num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
+		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
 								(num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
-								  
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
+
 		memset((yy_buffer_stack), 0, num_to_alloc * sizeof(struct yy_buffer_state*));
-				
+
 		(yy_buffer_stack_max) = num_to_alloc;
 		(yy_buffer_stack_top) = 0;
 		return;
@@ -1991,15 +2065,15 @@ static void zconfensure_buffer_stack (void)
 	if ((yy_buffer_stack_top) >= ((yy_buffer_stack_max)) - 1){
 
 		/* Increase the buffer to prepare for a possible push. */
-		int grow_size = 8 /* arbitrary grow size */;
+		yy_size_t grow_size = 8 /* arbitrary grow size */;
 
 		num_to_alloc = (yy_buffer_stack_max) + grow_size;
-		(yy_buffer_stack) = (struct yy_buffer_state**)zconfrealloc
+		(yy_buffer_stack) = (struct yy_buffer_state**)yyrealloc
 								((yy_buffer_stack),
 								num_to_alloc * sizeof(struct yy_buffer_state*)
 								);
 		if ( ! (yy_buffer_stack) )
-			YY_FATAL_ERROR( "out of dynamic memory in zconfensure_buffer_stack()" );
+			YY_FATAL_ERROR( "out of dynamic memory in yyensure_buffer_stack()" );
 
 		/* zero only the new slots.*/
 		memset((yy_buffer_stack) + (yy_buffer_stack_max), 0, grow_size * sizeof(struct yy_buffer_state*));
@@ -2011,9 +2085,9 @@ static void zconfensure_buffer_stack (void)
  * @param base the character buffer
  * @param size the size in bytes of the character buffer
  * 
- * @return the newly allocated buffer state object. 
+ * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
+YY_BUFFER_STATE yy_scan_buffer  (char * base, yy_size_t  size )
 {
 	YY_BUFFER_STATE b;
     
@@ -2021,49 +2095,49 @@ YY_BUFFER_STATE zconf_scan_buffer  (char * base, yy_size_t  size )
 	     base[size-2] != YY_END_OF_BUFFER_CHAR ||
 	     base[size-1] != YY_END_OF_BUFFER_CHAR )
 		/* They forgot to leave room for the EOB's. */
-		return 0;
+		return NULL;
 
-	b = (YY_BUFFER_STATE) zconfalloc(sizeof( struct yy_buffer_state )  );
+	b = (YY_BUFFER_STATE) yyalloc( sizeof( struct yy_buffer_state )  );
 	if ( ! b )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_scan_buffer()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_buffer()" );
 
-	b->yy_buf_size = size - 2;	/* "- 2" to take care of EOB's */
+	b->yy_buf_size = (int) (size - 2);	/* "- 2" to take care of EOB's */
 	b->yy_buf_pos = b->yy_ch_buf = base;
 	b->yy_is_our_buffer = 0;
-	b->yy_input_file = 0;
+	b->yy_input_file = NULL;
 	b->yy_n_chars = b->yy_buf_size;
 	b->yy_is_interactive = 0;
 	b->yy_at_bol = 1;
 	b->yy_fill_buffer = 0;
 	b->yy_buffer_status = YY_BUFFER_NEW;
 
-	zconf_switch_to_buffer(b  );
+	yy_switch_to_buffer( b  );
 
 	return b;
 }
 
-/** Setup the input buffer state to scan a string. The next call to zconflex() will
+/** Setup the input buffer state to scan a string. The next call to yylex() will
  * scan from a @e copy of @a str.
  * @param yystr a NUL-terminated string to scan
  * 
  * @return the newly allocated buffer state object.
  * @note If you want to scan bytes that may contain NUL values, then use
- *       zconf_scan_bytes() instead.
+ *       yy_scan_bytes() instead.
  */
-YY_BUFFER_STATE zconf_scan_string (yyconst char * yystr )
+YY_BUFFER_STATE yy_scan_string (const char * yystr )
 {
     
-	return zconf_scan_bytes(yystr,strlen(yystr) );
+	return yy_scan_bytes( yystr, (int) strlen(yystr) );
 }
 
-/** Setup the input buffer state to scan the given bytes. The next call to zconflex() will
+/** Setup the input buffer state to scan the given bytes. The next call to yylex() will
  * scan from a @e copy of @a bytes.
- * @param bytes the byte buffer to scan
- * @param len the number of bytes in the buffer pointed to by @a bytes.
+ * @param yybytes the byte buffer to scan
+ * @param _yybytes_len the number of bytes in the buffer pointed to by @a bytes.
  * 
  * @return the newly allocated buffer state object.
  */
-YY_BUFFER_STATE zconf_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
+YY_BUFFER_STATE yy_scan_bytes  (const char * yybytes, int  _yybytes_len )
 {
 	YY_BUFFER_STATE b;
 	char *buf;
@@ -2071,19 +2145,19 @@ YY_BUFFER_STATE zconf_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 	int i;
     
 	/* Get memory for full buffer, including space for trailing EOB's. */
-	n = _yybytes_len + 2;
-	buf = (char *) zconfalloc(n  );
+	n = (yy_size_t) (_yybytes_len + 2);
+	buf = (char *) yyalloc( n  );
 	if ( ! buf )
-		YY_FATAL_ERROR( "out of dynamic memory in zconf_scan_bytes()" );
+		YY_FATAL_ERROR( "out of dynamic memory in yy_scan_bytes()" );
 
 	for ( i = 0; i < _yybytes_len; ++i )
 		buf[i] = yybytes[i];
 
 	buf[_yybytes_len] = buf[_yybytes_len+1] = YY_END_OF_BUFFER_CHAR;
 
-	b = zconf_scan_buffer(buf,n );
+	b = yy_scan_buffer( buf, n );
 	if ( ! b )
-		YY_FATAL_ERROR( "bad buffer in zconf_scan_bytes()" );
+		YY_FATAL_ERROR( "bad buffer in yy_scan_bytes()" );
 
 	/* It's okay to grow etc. this buffer, and we should throw it
 	 * away when we're done.
@@ -2097,9 +2171,9 @@ YY_BUFFER_STATE zconf_scan_bytes  (yyconst char * yybytes, int  _yybytes_len )
 #define YY_EXIT_FAILURE 2
 #endif
 
-static void yy_fatal_error (yyconst char* msg )
+static void yynoreturn yy_fatal_error (const char* msg )
 {
-    	(void) fprintf( stderr, "%s\n", msg );
+			fprintf( stderr, "%s\n", msg );
 	exit( YY_EXIT_FAILURE );
 }
 
@@ -2109,14 +2183,14 @@ static void yy_fatal_error (yyconst char* msg )
 #define yyless(n) \
 	do \
 		{ \
-		/* Undo effects of setting up zconftext. */ \
+		/* Undo effects of setting up yytext. */ \
         int yyless_macro_arg = (n); \
         YY_LESS_LINENO(yyless_macro_arg);\
-		zconftext[zconfleng] = (yy_hold_char); \
-		(yy_c_buf_p) = zconftext + yyless_macro_arg; \
+		yytext[yyleng] = (yy_hold_char); \
+		(yy_c_buf_p) = yytext + yyless_macro_arg; \
 		(yy_hold_char) = *(yy_c_buf_p); \
 		*(yy_c_buf_p) = '\0'; \
-		zconfleng = yyless_macro_arg; \
+		yyleng = yyless_macro_arg; \
 		} \
 	while ( 0 )
 
@@ -2125,126 +2199,129 @@ static void yy_fatal_error (yyconst char* msg )
 /** Get the current line number.
  * 
  */
-int zconfget_lineno  (void)
+int yyget_lineno  (void)
 {
-        
-    return zconflineno;
+    
+    return yylineno;
 }
 
 /** Get the input stream.
  * 
  */
-FILE *zconfget_in  (void)
+FILE *yyget_in  (void)
 {
-        return zconfin;
+        return yyin;
 }
 
 /** Get the output stream.
  * 
  */
-FILE *zconfget_out  (void)
+FILE *yyget_out  (void)
 {
-        return zconfout;
+        return yyout;
 }
 
 /** Get the length of the current token.
  * 
  */
-int zconfget_leng  (void)
+int yyget_leng  (void)
 {
-        return zconfleng;
+        return yyleng;
 }
 
 /** Get the current token.
  * 
  */
 
-char *zconfget_text  (void)
+char *yyget_text  (void)
 {
-        return zconftext;
+        return yytext;
 }
 
 /** Set the current line number.
- * @param line_number
+ * @param _line_number line number
  * 
  */
-void zconfset_lineno (int  line_number )
+void yyset_lineno (int  _line_number )
 {
     
-    zconflineno = line_number;
+    yylineno = _line_number;
 }
 
 /** Set the input stream. This does not discard the current
  * input buffer.
- * @param in_str A readable stream.
+ * @param _in_str A readable stream.
  * 
- * @see zconf_switch_to_buffer
+ * @see yy_switch_to_buffer
  */
-void zconfset_in (FILE *  in_str )
+void yyset_in (FILE *  _in_str )
 {
-        zconfin = in_str ;
+        yyin = _in_str ;
 }
 
-void zconfset_out (FILE *  out_str )
+void yyset_out (FILE *  _out_str )
 {
-        zconfout = out_str ;
+        yyout = _out_str ;
 }
 
-int zconfget_debug  (void)
+int yyget_debug  (void)
 {
-        return zconf_flex_debug;
+        return yy_flex_debug;
 }
 
-void zconfset_debug (int  bdebug )
+void yyset_debug (int  _bdebug )
 {
-        zconf_flex_debug = bdebug ;
+        yy_flex_debug = _bdebug ;
 }
 
 static int yy_init_globals (void)
 {
         /* Initialization is the same as for the non-reentrant scanner.
-     * This function is called from zconflex_destroy(), so don't allocate here.
+     * This function is called from yylex_destroy(), so don't allocate here.
      */
 
-    (yy_buffer_stack) = 0;
+    /* We do not touch yylineno unless the option is enabled. */
+    yylineno =  1;
+    
+    (yy_buffer_stack) = NULL;
     (yy_buffer_stack_top) = 0;
     (yy_buffer_stack_max) = 0;
-    (yy_c_buf_p) = (char *) 0;
+    (yy_c_buf_p) = NULL;
     (yy_init) = 0;
     (yy_start) = 0;
 
 /* Defined in main.c */
 #ifdef YY_STDINIT
-    zconfin = stdin;
-    zconfout = stdout;
+    yyin = stdin;
+    yyout = stdout;
 #else
-    zconfin = (FILE *) 0;
-    zconfout = (FILE *) 0;
+    yyin = NULL;
+    yyout = NULL;
 #endif
 
     /* For future reference: Set errno on error, since we are called by
-     * zconflex_init()
+     * yylex_init()
      */
     return 0;
 }
 
-/* zconflex_destroy is for both reentrant and non-reentrant scanners. */
-int zconflex_destroy  (void)
+/* yylex_destroy is for both reentrant and non-reentrant scanners. */
+int yylex_destroy  (void)
 {
     
     /* Pop the buffer stack, destroying each element. */
 	while(YY_CURRENT_BUFFER){
-		zconf_delete_buffer(YY_CURRENT_BUFFER  );
+		yy_delete_buffer( YY_CURRENT_BUFFER  );
 		YY_CURRENT_BUFFER_LVALUE = NULL;
-		zconfpop_buffer_state();
+		yypop_buffer_state();
 	}
 
 	/* Destroy the stack itself. */
-	zconffree((yy_buffer_stack) );
+	yyfree((yy_buffer_stack) );
 	(yy_buffer_stack) = NULL;
 
     /* Reset the globals. This is important in a non-reentrant scanner so the next time
-     * zconflex() is called, initialization will occur. */
+     * yylex() is called, initialization will occur. */
     yy_init_globals( );
 
     return 0;
@@ -2255,18 +2332,19 @@ int zconflex_destroy  (void)
  */
 
 #ifndef yytext_ptr
-static void yy_flex_strncpy (char* s1, yyconst char * s2, int n )
+static void yy_flex_strncpy (char* s1, const char * s2, int n )
 {
-	register int i;
+		
+	int i;
 	for ( i = 0; i < n; ++i )
 		s1[i] = s2[i];
 }
 #endif
 
 #ifdef YY_NEED_STRLEN
-static int yy_flex_strlen (yyconst char * s )
+static int yy_flex_strlen (const char * s )
 {
-	register int n;
+	int n;
 	for ( n = 0; s[n]; ++n )
 		;
 
@@ -2274,13 +2352,14 @@ static int yy_flex_strlen (yyconst char * s )
 }
 #endif
 
-void *zconfalloc (yy_size_t  size )
+void *yyalloc (yy_size_t  size )
 {
-	return (void *) malloc( size );
+			return malloc(size);
 }
 
-void *zconfrealloc  (void * ptr, yy_size_t  size )
+void *yyrealloc  (void * ptr, yy_size_t  size )
 {
+		
 	/* The cast to (char *) in the following accommodates both
 	 * implementations that use char* generic pointers, and those
 	 * that use void* generic pointers.  It works with the latter
@@ -2288,12 +2367,12 @@ void *zconfrealloc  (void * ptr, yy_size_t  size )
 	 * any pointer type to void*, and deal with argument conversions
 	 * as though doing an assignment.
 	 */
-	return (void *) realloc( (char *) ptr, size );
+	return realloc(ptr, size);
 }
 
-void zconffree (void * ptr )
+void yyfree (void * ptr )
 {
-	free( (char *) ptr );	/* see zconfrealloc() for (char *) cast */
+			free( (char *) ptr );	/* see yyrealloc() for (char *) cast */
 }
 
 #define YYTABLES_NAME "yytables"
@@ -2307,7 +2386,7 @@ void zconf_starthelp(void)
 
 static void zconf_endhelp(void)
 {
-	zconflval.string = text;
+	yylval.string = text;
 	BEGIN(INITIAL);
 }
 
@@ -2337,9 +2416,9 @@ FILE *zconf_fopen(const char *name)
 
 void zconf_initscan(const char *name)
 {
-	zconfin = zconf_fopen(name);
-	if (!zconfin) {
-		printf("can't find file %s\n", name);
+	yyin = zconf_fopen(name);
+	if (!yyin) {
+		fprintf(stderr, "can't find file %s\n", name);
 		exit(1);
 	}
 
@@ -2347,7 +2426,7 @@ void zconf_initscan(const char *name)
 	memset(current_buf, 0, sizeof(*current_buf));
 
 	current_file = file_lookup(name);
-	current_file->lineno = 1;
+	yylineno = 1;
 }
 
 void zconf_nextfile(const char *name)
@@ -2358,37 +2437,36 @@ void zconf_nextfile(const char *name)
 	memset(buf, 0, sizeof(*buf));
 
 	current_buf->state = YY_CURRENT_BUFFER;
-	zconfin = zconf_fopen(file->name);
-	if (!zconfin) {
-		printf("%s:%d: can't open file \"%s\"\n",
-		    zconf_curname(), zconf_lineno(), file->name);
+	yyin = zconf_fopen(file->name);
+	if (!yyin) {
+		fprintf(stderr, "%s:%d: can't open file \"%s\"\n",
+			zconf_curname(), zconf_lineno(), file->name);
 		exit(1);
 	}
-	zconf_switch_to_buffer(zconf_create_buffer(zconfin,YY_BUF_SIZE));
+	yy_switch_to_buffer(yy_create_buffer(yyin, YY_BUF_SIZE));
 	buf->parent = current_buf;
 	current_buf = buf;
 
-	for (iter = current_file->parent; iter; iter = iter->parent ) {
-		if (!strcmp(current_file->name,iter->name) ) {
-			printf("%s:%d: recursive inclusion detected. "
-			       "Inclusion path:\n  current file : '%s'\n",
-			       zconf_curname(), zconf_lineno(),
-			       zconf_curname());
-			iter = current_file->parent;
-			while (iter && \
-			       strcmp(iter->name,current_file->name)) {
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno-1);
+	current_file->lineno = yylineno;
+	file->parent = current_file;
+
+	for (iter = current_file; iter; iter = iter->parent) {
+		if (!strcmp(iter->name, file->name)) {
+			fprintf(stderr,
+				"Recursive inclusion detected.\n"
+				"Inclusion path:\n"
+				"  current file : %s\n", file->name);
+			iter = file;
+			do {
 				iter = iter->parent;
-			}
-			if (iter)
-				printf("  included from: '%s:%d'\n",
-				       iter->name, iter->lineno+1);
+				fprintf(stderr, "  included from: %s:%d\n",
+					iter->name, iter->lineno - 1);
+			} while (strcmp(iter->name, file->name));
 			exit(1);
 		}
 	}
-	file->lineno = 1;
-	file->parent = current_file;
+
+	yylineno = 1;
 	current_file = file;
 }
 
@@ -2397,12 +2475,14 @@ static void zconf_endfile(void)
 	struct buffer *parent;
 
 	current_file = current_file->parent;
+	if (current_file)
+		yylineno = current_file->lineno;
 
 	parent = current_buf->parent;
 	if (parent) {
-		fclose(zconfin);
-		zconf_delete_buffer(YY_CURRENT_BUFFER);
-		zconf_switch_to_buffer(parent->state);
+		fclose(yyin);
+		yy_delete_buffer(YY_CURRENT_BUFFER);
+		yy_switch_to_buffer(parent->state);
 	}
 	free(current_buf);
 	current_buf = parent;
diff --git a/support/kconfig/zconf.tab.c_shipped b/support/kconfig/zconf.tab.c_shipped
index f3430308a9..4eca5b3135 100644
--- a/support/kconfig/zconf.tab.c_shipped
+++ b/support/kconfig/zconf.tab.c_shipped
@@ -1,19 +1,19 @@
-/* A Bison parser, made by GNU Bison 2.5.  */
+/* A Bison parser, made by GNU Bison 3.0.4.  */
 
 /* Bison implementation for Yacc-like parsers in C
-   
-      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
-   
+
+   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.
+
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
-   
+
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
-   
+
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.  */
 
@@ -26,7 +26,7 @@
    special exception, which will cause the skeleton and the resulting
    Bison output files to be licensed under the GNU General Public
    License without this special exception.
-   
+
    This special exception was added by the Free Software Foundation in
    version 2.2 of Bison.  */
 
@@ -44,7 +44,7 @@
 #define YYBISON 1
 
 /* Bison version.  */
-#define YYBISON_VERSION "2.5"
+#define YYBISON_VERSION "3.0.4"
 
 /* Skeleton name.  */
 #define YYSKELETON_NAME "yacc.c"
@@ -58,17 +58,7 @@
 /* Pull parsers.  */
 #define YYPULL 1
 
-/* Using locations.  */
-#define YYLSP_NEEDED 0
 
-/* Substitute the variable and function names.  */
-#define yyparse         zconfparse
-#define yylex           zconflex
-#define yyerror         zconferror
-#define yylval          zconflval
-#define yychar          zconfchar
-#define yydebug         zconfdebug
-#define yynerrs         zconfnerrs
 
 
 /* Copy the first part of user declarations.  */
@@ -95,10 +85,10 @@
 
 int cdebug = PRINTD;
 
-extern int zconflex(void);
+int yylex(void);
+static void yyerror(const char *err);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
-static void zconferror(const char *err);
 static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
@@ -108,10 +98,13 @@ static struct menu *current_menu, *current_entry;
 
 
 
-/* Enabling traces.  */
-#ifndef YYDEBUG
-# define YYDEBUG 1
-#endif
+# ifndef YY_NULLPTR
+#  if defined __cplusplus && 201103L <= __cplusplus
+#   define YY_NULLPTR nullptr
+#  else
+#   define YY_NULLPTR 0
+#  endif
+# endif
 
 /* Enabling verbose error messages.  */
 #ifdef YYERROR_VERBOSE
@@ -121,58 +114,65 @@ static struct menu *current_menu, *current_entry;
 # define YYERROR_VERBOSE 0
 #endif
 
-/* Enabling the token table.  */
-#ifndef YYTOKEN_TABLE
-# define YYTOKEN_TABLE 0
-#endif
 
+/* Debug traces.  */
+#ifndef YYDEBUG
+# define YYDEBUG 1
+#endif
+#if YYDEBUG
+extern int yydebug;
+#endif
 
-/* Tokens.  */
+/* Token type.  */
 #ifndef YYTOKENTYPE
 # define YYTOKENTYPE
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
-     T_VISIBLE = 278,
-     T_OPTION = 279,
-     T_ON = 280,
-     T_WORD = 281,
-     T_WORD_QUOTE = 282,
-     T_UNEQUAL = 283,
-     T_CLOSE_PAREN = 284,
-     T_OPEN_PAREN = 285,
-     T_EOL = 286,
-     T_OR = 287,
-     T_AND = 288,
-     T_EQUAL = 289,
-     T_NOT = 290
-   };
+  enum yytokentype
+  {
+    T_MAINMENU = 258,
+    T_MENU = 259,
+    T_ENDMENU = 260,
+    T_SOURCE = 261,
+    T_CHOICE = 262,
+    T_ENDCHOICE = 263,
+    T_COMMENT = 264,
+    T_CONFIG = 265,
+    T_MENUCONFIG = 266,
+    T_HELP = 267,
+    T_HELPTEXT = 268,
+    T_IF = 269,
+    T_ENDIF = 270,
+    T_DEPENDS = 271,
+    T_OPTIONAL = 272,
+    T_PROMPT = 273,
+    T_TYPE = 274,
+    T_DEFAULT = 275,
+    T_SELECT = 276,
+    T_IMPLY = 277,
+    T_RANGE = 278,
+    T_VISIBLE = 279,
+    T_OPTION = 280,
+    T_ON = 281,
+    T_WORD = 282,
+    T_WORD_QUOTE = 283,
+    T_UNEQUAL = 284,
+    T_LESS = 285,
+    T_LESS_EQUAL = 286,
+    T_GREATER = 287,
+    T_GREATER_EQUAL = 288,
+    T_CLOSE_PAREN = 289,
+    T_OPEN_PAREN = 290,
+    T_EOL = 291,
+    T_OR = 292,
+    T_AND = 293,
+    T_EQUAL = 294,
+    T_NOT = 295
+  };
 #endif
 
-
-
+/* Value type.  */
 #if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
-typedef union YYSTYPE
+
+union YYSTYPE
 {
 
 
@@ -184,19 +184,25 @@ typedef union YYSTYPE
 	const struct kconf_id *id;
 
 
+};
 
-} YYSTYPE;
+typedef union YYSTYPE YYSTYPE;
 # define YYSTYPE_IS_TRIVIAL 1
-# define yystype YYSTYPE /* obsolescent; will be withdrawn */
 # define YYSTYPE_IS_DECLARED 1
 #endif
 
 
+extern YYSTYPE yylval;
+
+int yyparse (void);
+
+
+
 /* Copy the second part of user declarations.  */
 
 
-/* Include zconf.hash.c here so it can see the token constants. */
-#include "zconf.hash.c"
+/* Include kconf_id.c here so it can see the token constants. */
+#include "kconf_id.c"
 
 
 
@@ -212,11 +218,8 @@ typedef unsigned char yytype_uint8;
 
 #ifdef YYTYPE_INT8
 typedef YYTYPE_INT8 yytype_int8;
-#elif (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
-typedef signed char yytype_int8;
 #else
-typedef short int yytype_int8;
+typedef signed char yytype_int8;
 #endif
 
 #ifdef YYTYPE_UINT16
@@ -236,8 +239,7 @@ typedef short int yytype_int16;
 #  define YYSIZE_T __SIZE_TYPE__
 # elif defined size_t
 #  define YYSIZE_T size_t
-# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
+# elif ! defined YYSIZE_T
 #  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
 #  define YYSIZE_T size_t
 # else
@@ -251,39 +253,68 @@ typedef short int yytype_int16;
 # if defined YYENABLE_NLS && YYENABLE_NLS
 #  if ENABLE_NLS
 #   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
-#   define YY_(msgid) dgettext ("bison-runtime", msgid)
+#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
 #  endif
 # endif
 # ifndef YY_
-#  define YY_(msgid) msgid
+#  define YY_(Msgid) Msgid
+# endif
+#endif
+
+#ifndef YY_ATTRIBUTE
+# if (defined __GNUC__                                               \
+      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
+     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
+#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
+# else
+#  define YY_ATTRIBUTE(Spec) /* empty */
+# endif
+#endif
+
+#ifndef YY_ATTRIBUTE_PURE
+# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
+#endif
+
+#ifndef YY_ATTRIBUTE_UNUSED
+# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
+#endif
+
+#if !defined _Noreturn \
+     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
+# if defined _MSC_VER && 1200 <= _MSC_VER
+#  define _Noreturn __declspec (noreturn)
+# else
+#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
 # endif
 #endif
 
 /* Suppress unused-variable warnings by "using" E.  */
 #if ! defined lint || defined __GNUC__
-# define YYUSE(e) ((void) (e))
+# define YYUSE(E) ((void) (E))
 #else
-# define YYUSE(e) /* empty */
+# define YYUSE(E) /* empty */
 #endif
 
-/* Identity function, used to suppress warnings about constant conditions.  */
-#ifndef lint
-# define YYID(n) (n)
+#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
+/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
+# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
+    _Pragma ("GCC diagnostic push") \
+    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
+    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
+# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
+    _Pragma ("GCC diagnostic pop")
 #else
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
-static int
-YYID (int yyi)
-#else
-static int
-YYID (yyi)
-    int yyi;
+# define YY_INITIAL_VALUE(Value) Value
 #endif
-{
-  return yyi;
-}
+#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
+# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
+# define YY_IGNORE_MAYBE_UNINITIALIZED_END
+#endif
+#ifndef YY_INITIAL_VALUE
+# define YY_INITIAL_VALUE(Value) /* Nothing. */
 #endif
 
+
 #if ! defined yyoverflow || YYERROR_VERBOSE
 
 /* The parser invokes alloca or malloc; define the necessary symbols.  */
@@ -301,9 +332,9 @@ YYID (yyi)
 #    define alloca _alloca
 #   else
 #    define YYSTACK_ALLOC alloca
-#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
+#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
 #     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
+      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
 #     ifndef EXIT_SUCCESS
 #      define EXIT_SUCCESS 0
 #     endif
@@ -313,8 +344,8 @@ YYID (yyi)
 # endif
 
 # ifdef YYSTACK_ALLOC
-   /* Pacify GCC's `empty if-body' warning.  */
-#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
+   /* Pacify GCC's 'empty if-body' warning.  */
+#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
 #  ifndef YYSTACK_ALLOC_MAXIMUM
     /* The OS might guarantee only one guard page at the bottom of the stack,
        and a page size can be as small as 4096 bytes.  So we cannot safely
@@ -330,7 +361,7 @@ YYID (yyi)
 #  endif
 #  if (defined __cplusplus && ! defined EXIT_SUCCESS \
        && ! ((defined YYMALLOC || defined malloc) \
-	     && (defined YYFREE || defined free)))
+             && (defined YYFREE || defined free)))
 #   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
 #   ifndef EXIT_SUCCESS
 #    define EXIT_SUCCESS 0
@@ -338,15 +369,13 @@ YYID (yyi)
 #  endif
 #  ifndef YYMALLOC
 #   define YYMALLOC malloc
-#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
+#   if ! defined malloc && ! defined EXIT_SUCCESS
 void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
 #   endif
 #  endif
 #  ifndef YYFREE
 #   define YYFREE free
-#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
+#   if ! defined free && ! defined EXIT_SUCCESS
 void free (void *); /* INFRINGES ON USER NAME SPACE */
 #   endif
 #  endif
@@ -356,7 +385,7 @@ void free (void *); /* INFRINGES ON USER NAME SPACE */
 
 #if (! defined yyoverflow \
      && (! defined __cplusplus \
-	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))
+         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))
 
 /* A type that is properly aligned for any stack member.  */
 union yyalloc
@@ -381,35 +410,35 @@ union yyalloc
    elements in the stack, and YYPTR gives the new location of the
    stack.  Advance YYPTR to a properly aligned location for the next
    stack.  */
-# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
-    do									\
-      {									\
-	YYSIZE_T yynewbytes;						\
-	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
-	Stack = &yyptr->Stack_alloc;					\
-	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
-	yyptr += yynewbytes / sizeof (*yyptr);				\
-      }									\
-    while (YYID (0))
+# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
+    do                                                                  \
+      {                                                                 \
+        YYSIZE_T yynewbytes;                                            \
+        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
+        Stack = &yyptr->Stack_alloc;                                    \
+        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
+        yyptr += yynewbytes / sizeof (*yyptr);                          \
+      }                                                                 \
+    while (0)
 
 #endif
 
 #if defined YYCOPY_NEEDED && YYCOPY_NEEDED
-/* Copy COUNT objects from FROM to TO.  The source and destination do
+/* Copy COUNT objects from SRC to DST.  The source and destination do
    not overlap.  */
 # ifndef YYCOPY
 #  if defined __GNUC__ && 1 < __GNUC__
-#   define YYCOPY(To, From, Count) \
-      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
+#   define YYCOPY(Dst, Src, Count) \
+      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
 #  else
-#   define YYCOPY(To, From, Count)		\
-      do					\
-	{					\
-	  YYSIZE_T yyi;				\
-	  for (yyi = 0; yyi < (Count); yyi++)	\
-	    (To)[yyi] = (From)[yyi];		\
-	}					\
-      while (YYID (0))
+#   define YYCOPY(Dst, Src, Count)              \
+      do                                        \
+        {                                       \
+          YYSIZE_T yyi;                         \
+          for (yyi = 0; yyi < (Count); yyi++)   \
+            (Dst)[yyi] = (Src)[yyi];            \
+        }                                       \
+      while (0)
 #  endif
 # endif
 #endif /* !YYCOPY_NEEDED */
@@ -417,25 +446,27 @@ union yyalloc
 /* YYFINAL -- State number of the termination state.  */
 #define YYFINAL  11
 /* YYLAST -- Last index in YYTABLE.  */
-#define YYLAST   290
+#define YYLAST   325
 
 /* YYNTOKENS -- Number of terminals.  */
-#define YYNTOKENS  36
+#define YYNTOKENS  41
 /* YYNNTS -- Number of nonterminals.  */
-#define YYNNTS  50
+#define YYNNTS  52
 /* YYNRULES -- Number of rules.  */
-#define YYNRULES  118
-/* YYNRULES -- Number of states.  */
-#define YYNSTATES  191
+#define YYNRULES  126
+/* YYNSTATES -- Number of states.  */
+#define YYNSTATES  206
 
-/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
+/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
+   by yylex, with out-of-bounds checking.  */
 #define YYUNDEFTOK  2
-#define YYMAXUTOK   290
+#define YYMAXUTOK   295
 
-#define YYTRANSLATE(YYX)						\
+#define YYTRANSLATE(YYX)                                                \
   ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)
 
-/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
+/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
+   as returned by yylex, without out-of-bounds checking.  */
 static const yytype_uint8 yytranslate[] =
 {
        0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
@@ -467,87 +498,30 @@ static const yytype_uint8 yytranslate[] =
        5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
       15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
       25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
-      35
+      35,    36,    37,    38,    39,    40
 };
 
 #if YYDEBUG
-/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
-   YYRHS.  */
-static const yytype_uint16 yyprhs[] =
-{
-       0,     0,     3,     6,     8,    11,    13,    14,    17,    20,
-      23,    26,    31,    36,    40,    42,    44,    46,    48,    50,
-      52,    54,    56,    58,    60,    62,    64,    66,    68,    72,
-      75,    79,    82,    86,    89,    90,    93,    96,    99,   102,
-     105,   108,   112,   117,   122,   127,   133,   137,   138,   142,
-     143,   146,   150,   153,   155,   159,   160,   163,   166,   169,
-     172,   175,   180,   184,   187,   192,   193,   196,   200,   202,
-     206,   207,   210,   213,   216,   220,   224,   228,   230,   234,
-     235,   238,   241,   244,   248,   252,   255,   258,   261,   262,
-     265,   268,   271,   276,   277,   280,   283,   286,   287,   290,
-     292,   294,   297,   300,   303,   305,   308,   309,   312,   314,
-     318,   322,   326,   329,   333,   337,   339,   341,   342
-};
-
-/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
-static const yytype_int8 yyrhs[] =
-{
-      37,     0,    -1,    81,    38,    -1,    38,    -1,    63,    39,
-      -1,    39,    -1,    -1,    39,    41,    -1,    39,    55,    -1,
-      39,    67,    -1,    39,    80,    -1,    39,    26,     1,    31,
-      -1,    39,    40,     1,    31,    -1,    39,     1,    31,    -1,
-      16,    -1,    18,    -1,    19,    -1,    21,    -1,    17,    -1,
-      22,    -1,    20,    -1,    23,    -1,    31,    -1,    61,    -1,
-      71,    -1,    44,    -1,    46,    -1,    69,    -1,    26,     1,
-      31,    -1,     1,    31,    -1,    10,    26,    31,    -1,    43,
-      47,    -1,    11,    26,    31,    -1,    45,    47,    -1,    -1,
-      47,    48,    -1,    47,    49,    -1,    47,    75,    -1,    47,
-      73,    -1,    47,    42,    -1,    47,    31,    -1,    19,    78,
-      31,    -1,    18,    79,    82,    31,    -1,    20,    83,    82,
-      31,    -1,    21,    26,    82,    31,    -1,    22,    84,    84,
-      82,    31,    -1,    24,    50,    31,    -1,    -1,    50,    26,
-      51,    -1,    -1,    34,    79,    -1,     7,    85,    31,    -1,
-      52,    56,    -1,    80,    -1,    53,    58,    54,    -1,    -1,
-      56,    57,    -1,    56,    75,    -1,    56,    73,    -1,    56,
-      31,    -1,    56,    42,    -1,    18,    79,    82,    31,    -1,
-      19,    78,    31,    -1,    17,    31,    -1,    20,    26,    82,
-      31,    -1,    -1,    58,    41,    -1,    14,    83,    81,    -1,
-      80,    -1,    59,    62,    60,    -1,    -1,    62,    41,    -1,
-      62,    67,    -1,    62,    55,    -1,     3,    79,    81,    -1,
-       4,    79,    31,    -1,    64,    76,    74,    -1,    80,    -1,
-      65,    68,    66,    -1,    -1,    68,    41,    -1,    68,    67,
-      -1,    68,    55,    -1,     6,    79,    31,    -1,     9,    79,
-      31,    -1,    70,    74,    -1,    12,    31,    -1,    72,    13,
-      -1,    -1,    74,    75,    -1,    74,    31,    -1,    74,    42,
-      -1,    16,    25,    83,    31,    -1,    -1,    76,    77,    -1,
-      76,    31,    -1,    23,    82,    -1,    -1,    79,    82,    -1,
-      26,    -1,    27,    -1,     5,    31,    -1,     8,    31,    -1,
-      15,    31,    -1,    31,    -1,    81,    31,    -1,    -1,    14,
-      83,    -1,    84,    -1,    84,    34,    84,    -1,    84,    28,
-      84,    -1,    30,    83,    29,    -1,    35,    83,    -1,    83,
-      32,    83,    -1,    83,    33,    83,    -1,    26,    -1,    27,
-      -1,    -1,    26,    -1
-};
-
-/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
+  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
 static const yytype_uint16 yyrline[] =
 {
-       0,   103,   103,   103,   105,   105,   107,   109,   110,   111,
-     112,   113,   114,   118,   122,   122,   122,   122,   122,   122,
-     122,   122,   126,   127,   128,   129,   130,   131,   135,   136,
-     142,   150,   156,   164,   174,   176,   177,   178,   179,   180,
-     181,   184,   192,   198,   208,   214,   220,   223,   225,   236,
-     237,   242,   251,   256,   264,   267,   269,   270,   271,   272,
-     273,   276,   282,   293,   299,   309,   311,   316,   324,   332,
-     335,   337,   338,   339,   344,   351,   358,   363,   371,   374,
-     376,   377,   378,   381,   389,   396,   403,   409,   416,   418,
-     419,   420,   423,   431,   433,   434,   437,   444,   446,   451,
-     452,   455,   456,   457,   461,   462,   465,   466,   469,   470,
-     471,   472,   473,   474,   475,   478,   479,   482,   483
+       0,   110,   110,   110,   112,   112,   116,   124,   134,   136,
+     137,   138,   139,   140,   141,   145,   149,   149,   149,   149,
+     149,   149,   149,   149,   149,   153,   154,   155,   156,   157,
+     158,   162,   163,   169,   176,   181,   188,   197,   199,   200,
+     201,   202,   203,   204,   207,   215,   221,   231,   237,   243,
+     249,   252,   254,   267,   268,   273,   283,   288,   296,   299,
+     301,   302,   303,   304,   305,   308,   314,   325,   331,   341,
+     343,   348,   356,   364,   367,   369,   370,   371,   376,   383,
+     388,   396,   399,   401,   402,   403,   406,   415,   422,   427,
+     433,   451,   453,   454,   455,   458,   466,   468,   469,   472,
+     479,   481,   486,   487,   490,   491,   492,   496,   497,   500,
+     501,   504,   505,   506,   507,   508,   509,   510,   511,   512,
+     513,   514,   518,   520,   521,   524,   525
 };
 #endif
 
-#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
+#if YYDEBUG || YYERROR_VERBOSE || 0
 /* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
    First, the terminals, then, starting@YYNTOKENS, nonterminals.  */
 static const char *const yytname[] =
@@ -555,335 +529,300 @@ static const char *const yytname[] =
   "$end", "error", "$undefined", "T_MAINMENU", "T_MENU", "T_ENDMENU",
   "T_SOURCE", "T_CHOICE", "T_ENDCHOICE", "T_COMMENT", "T_CONFIG",
   "T_MENUCONFIG", "T_HELP", "T_HELPTEXT", "T_IF", "T_ENDIF", "T_DEPENDS",
-  "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_RANGE",
-  "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE", "T_UNEQUAL",
+  "T_OPTIONAL", "T_PROMPT", "T_TYPE", "T_DEFAULT", "T_SELECT", "T_IMPLY",
+  "T_RANGE", "T_VISIBLE", "T_OPTION", "T_ON", "T_WORD", "T_WORD_QUOTE",
+  "T_UNEQUAL", "T_LESS", "T_LESS_EQUAL", "T_GREATER", "T_GREATER_EQUAL",
   "T_CLOSE_PAREN", "T_OPEN_PAREN", "T_EOL", "T_OR", "T_AND", "T_EQUAL",
-  "T_NOT", "$accept", "input", "start", "stmt_list", "option_name",
-  "common_stmt", "option_error", "config_entry_start", "config_stmt",
+  "T_NOT", "$accept", "input", "start", "mainmenu_stmt",
+  "no_mainmenu_stmt", "stmt_list", "option_name", "common_stmt",
+  "option_error", "config_entry_start", "config_stmt",
   "menuconfig_entry_start", "menuconfig_stmt", "config_option_list",
   "config_option", "symbol_option", "symbol_option_list",
   "symbol_option_arg", "choice", "choice_entry", "choice_end",
   "choice_stmt", "choice_option_list", "choice_option", "choice_block",
-  "if_entry", "if_end", "if_stmt", "if_block", "mainmenu_stmt", "menu",
-  "menu_entry", "menu_end", "menu_stmt", "menu_block", "source_stmt",
-  "comment", "comment_stmt", "help_start", "help", "depends_list",
-  "depends", "visibility_list", "visible", "prompt_stmt_opt", "prompt",
-  "end", "nl", "if_expr", "expr", "symbol", "word_opt", 0
+  "if_entry", "if_end", "if_stmt", "if_block", "menu", "menu_entry",
+  "menu_end", "menu_stmt", "menu_block", "source_stmt", "comment",
+  "comment_stmt", "help_start", "help", "depends_list", "depends",
+  "visibility_list", "visible", "prompt_stmt_opt", "prompt", "end", "nl",
+  "if_expr", "expr", "nonconst_symbol", "symbol", "word_opt", YY_NULLPTR
 };
 #endif
 
 # ifdef YYPRINT
-/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
-   token YYLEX-NUM.  */
+/* YYTOKNUM[NUM] -- (External) token number corresponding to the
+   (internal) symbol number NUM (which must be that of a token).  */
 static const yytype_uint16 yytoknum[] =
 {
        0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
      265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
      275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
-     285,   286,   287,   288,   289,   290
+     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
+     295
 };
 # endif
 
-/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
-static const yytype_uint8 yyr1[] =
+#define YYPACT_NINF -92
+
+#define yypact_value_is_default(Yystate) \
+  (!!((Yystate) == (-92)))
+
+#define YYTABLE_NINF -89
+
+#define yytable_value_is_error(Yytable_value) \
+  0
+
+  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
+     STATE-NUM.  */
+static const yytype_int16 yypact[] =
 {
-       0,    36,    37,    37,    38,    38,    39,    39,    39,    39,
-      39,    39,    39,    39,    40,    40,    40,    40,    40,    40,
-      40,    40,    41,    41,    41,    41,    41,    41,    42,    42,
-      43,    44,    45,    46,    47,    47,    47,    47,    47,    47,
-      47,    48,    48,    48,    48,    48,    49,    50,    50,    51,
-      51,    52,    53,    54,    55,    56,    56,    56,    56,    56,
-      56,    57,    57,    57,    57,    58,    58,    59,    60,    61,
-      62,    62,    62,    62,    63,    64,    65,    66,    67,    68,
-      68,    68,    68,    69,    70,    71,    72,    73,    74,    74,
-      74,    74,    75,    76,    76,    76,    77,    78,    78,    79,
-      79,    80,    80,    80,    81,    81,    82,    82,    83,    83,
-      83,    83,    83,    83,    83,    84,    84,    85,    85
+      20,    33,   -92,    16,   -92,   -92,   -92,    21,   -92,   -92,
+      29,   -92,   152,   186,   -92,   -92,    40,    67,    33,    71,
+      33,    42,    80,    33,    78,    78,    31,    82,   -92,   -92,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   120,   -92,   131,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   109,   -92,
+     118,   -92,   128,   -92,   129,   -92,   141,   142,   -92,    31,
+      31,    74,   -92,    69,   -92,   144,   145,    28,   119,   248,
+     286,    77,    38,    77,   219,   -92,   -92,   -92,   -92,   -92,
+     -92,    -7,   -92,    31,    31,    40,    52,    52,    52,    52,
+      52,    52,   -92,   -92,   146,   147,   158,    33,    33,    31,
+      78,    78,    52,   -92,   184,   -92,   -92,   -92,   -92,   176,
+     -92,   -92,   162,    33,    33,    78,   -92,   -92,   -92,   -92,
+     -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   197,
+     -92,   272,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,   174,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,    31,   197,   178,   197,    59,   197,   197,    52,
+      27,   179,   -92,   -92,   197,   180,   197,    31,   -92,   111,
+     181,   -92,   -92,   182,   185,   195,   197,   193,   -92,   -92,
+     208,   -92,   209,   113,   -92,   -92,   -92,   -92,   -92,   211,
+      33,   -92,   -92,   -92,   -92,   -92
 };
 
-/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
-static const yytype_uint8 yyr2[] =
+  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
+     Performed when YYTABLE does not specify something else to do.  Zero
+     means the default is an error.  */
+static const yytype_uint8 yydefact[] =
 {
-       0,     2,     2,     1,     2,     1,     0,     2,     2,     2,
-       2,     4,     4,     3,     1,     1,     1,     1,     1,     1,
-       1,     1,     1,     1,     1,     1,     1,     1,     3,     2,
-       3,     2,     3,     2,     0,     2,     2,     2,     2,     2,
-       2,     3,     4,     4,     4,     5,     3,     0,     3,     0,
-       2,     3,     2,     1,     3,     0,     2,     2,     2,     2,
-       2,     4,     3,     2,     4,     0,     2,     3,     1,     3,
-       0,     2,     2,     2,     3,     3,     3,     1,     3,     0,
-       2,     2,     2,     3,     3,     2,     2,     2,     0,     2,
-       2,     2,     4,     0,     2,     2,     2,     0,     2,     1,
-       1,     2,     2,     2,     1,     2,     0,     2,     1,     3,
-       3,     3,     2,     3,     3,     1,     1,     0,     1
+       7,     0,   107,     0,     3,     8,     8,     7,   102,   103,
+       0,     1,     0,     0,   108,     2,     6,     0,     0,     0,
+       0,   125,     0,     0,     0,     0,     0,     0,    16,    21,
+      17,    18,    23,    19,    20,    22,    24,     0,    25,     0,
+       9,    37,    28,    37,    29,    59,    69,    10,    74,    26,
+      96,    82,    11,    30,    91,    27,    12,    15,     0,   104,
+       0,   126,     0,   105,     0,   122,     0,     0,   124,     0,
+       0,     0,   123,   111,   106,     0,     0,     0,     0,     0,
+       0,     0,    91,     0,     0,    78,    86,    55,    87,    33,
+      35,     0,   119,     0,     0,    71,     0,     0,     0,     0,
+       0,     0,    13,    14,     0,     0,     0,     0,   100,     0,
+       0,     0,     0,    51,     0,    43,    42,    38,    39,     0,
+      41,    40,     0,     0,   100,     0,    63,    64,    60,    62,
+      61,    70,    58,    57,    75,    77,    73,    76,    72,   109,
+      98,     0,    97,    83,    85,    81,    84,    80,    93,    94,
+      92,   118,   120,   121,   117,   112,   113,   114,   115,   116,
+      32,    89,     0,   109,     0,   109,   109,   109,   109,     0,
+       0,     0,    90,    67,   109,     0,   109,     0,    99,     0,
+       0,    44,   101,     0,     0,     0,   109,    53,    50,    31,
+       0,    66,     0,   110,    95,    45,    46,    47,    48,     0,
+       0,    52,    65,    68,    49,    54
 };
 
-/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
-   Performed when YYTABLE doesn't specify something else to do.  Zero
-   means the default is an error.  */
-static const yytype_uint8 yydefact[] =
+  /* YYPGOTO[NTERM-NUM].  */
+static const yytype_int16 yypgoto[] =
 {
-       6,     0,   104,     0,     3,     0,     6,     6,    99,   100,
-       0,     1,     0,     0,     0,     0,   117,     0,     0,     0,
-       0,     0,     0,    14,    18,    15,    16,    20,    17,    19,
-      21,     0,    22,     0,     7,    34,    25,    34,    26,    55,
-      65,     8,    70,    23,    93,    79,     9,    27,    88,    24,
-      10,     0,   105,     2,    74,    13,     0,   101,     0,   118,
-       0,   102,     0,     0,     0,   115,   116,     0,     0,     0,
-     108,   103,     0,     0,     0,     0,     0,     0,     0,    88,
-       0,     0,    75,    83,    51,    84,    30,    32,     0,   112,
-       0,     0,    67,     0,     0,    11,    12,     0,     0,     0,
-       0,    97,     0,     0,     0,    47,     0,    40,    39,    35,
-      36,     0,    38,    37,     0,     0,    97,     0,    59,    60,
-      56,    58,    57,    66,    54,    53,    71,    73,    69,    72,
-      68,   106,    95,     0,    94,    80,    82,    78,    81,    77,
-      90,    91,    89,   111,   113,   114,   110,   109,    29,    86,
-       0,   106,     0,   106,   106,   106,     0,     0,     0,    87,
-      63,   106,     0,   106,     0,    96,     0,     0,    41,    98,
-       0,     0,   106,    49,    46,    28,     0,    62,     0,   107,
-      92,    42,    43,    44,     0,     0,    48,    61,    64,    45,
-      50
+     -92,   -92,   241,   -92,   -92,   244,   -92,   -13,   -66,   -92,
+     -92,   -92,   -92,   218,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -69,   -92,   -92,   -92,   -92,   -92,   -92,   -92,   -92,
+     -92,   -92,    12,   -92,   -92,   -92,   -92,   -92,   172,   170,
+     -64,   -92,   -92,   148,    -1,    34,     1,   139,   -68,   -21,
+     -91,   -92
 };
 
-/* YYDEFGOTO[NTERM-NUM].  */
+  /* YYDEFGOTO[NTERM-NUM].  */
 static const yytype_int16 yydefgoto[] =
 {
-      -1,     3,     4,     5,    33,    34,   108,    35,    36,    37,
-      38,    74,   109,   110,   157,   186,    39,    40,   124,    41,
-      76,   120,    77,    42,   128,    43,    78,     6,    44,    45,
-     137,    46,    80,    47,    48,    49,   111,   112,    81,   113,
-      79,   134,   152,   153,    50,     7,   165,    69,    70,    60
+      -1,     3,     4,     5,     6,    12,    39,    40,   116,    41,
+      42,    43,    44,    77,   117,   118,   170,   201,    45,    46,
+     132,    47,    79,   128,    80,    48,   136,    49,    81,    50,
+      51,   145,    52,    83,    53,    54,    55,   119,   120,    84,
+     121,    82,   142,   164,   165,    56,     7,   178,    71,    72,
+      73,    62
 };
 
-/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
-   STATE-NUM.  */
-#define YYPACT_NINF -90
-static const yytype_int16 yypact[] =
+  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
+     positive, shift that token.  If negative, reduce the rule whose
+     number is the opposite.  If YYTABLE_NINF, syntax error.  */
+static const yytype_int16 yytable[] =
 {
-       4,    42,   -90,    96,   -90,   111,   -90,    15,   -90,   -90,
-      75,   -90,    82,    42,   104,    42,   110,   107,    42,   115,
-     125,    -4,   121,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   162,   -90,   163,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   139,   -90,   -90,   138,   -90,   142,   -90,   143,   -90,
-     152,   -90,   164,   167,   168,   -90,   -90,    -4,    -4,    77,
-     -18,   -90,   177,   185,    33,    71,   195,   247,   236,    -2,
-     236,   171,   -90,   -90,   -90,   -90,   -90,   -90,    41,   -90,
-      -4,    -4,   138,    97,    97,   -90,   -90,   186,   187,   194,
-      42,    42,    -4,   196,    97,   -90,   219,   -90,   -90,   -90,
-     -90,   210,   -90,   -90,   204,    42,    42,   199,   -90,   -90,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   222,   -90,   223,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -90,   -90,   -90,   215,   -90,   -90,   -90,   -90,   -90,
-      -4,   222,   228,   222,    -5,   222,    97,    35,   229,   -90,
-     -90,   222,   232,   222,    -4,   -90,   135,   233,   -90,   -90,
-     234,   235,   222,   240,   -90,   -90,   237,   -90,   239,   -13,
-     -90,   -90,   -90,   -90,   244,    42,   -90,   -90,   -90,   -90,
-     -90
+      10,    91,    92,    66,    67,   154,   155,   156,   157,   158,
+     159,    16,   135,   127,   144,   130,    11,    58,   149,    60,
+     150,   169,    64,     1,     1,   152,   153,   151,   -34,   104,
+      93,    94,   -34,   -34,   -34,   -34,   -34,   -34,   -34,   -34,
+     105,   166,   -34,   -34,   106,   -34,   107,   108,   109,   110,
+     111,   112,   -34,   113,   187,   114,     2,    14,    65,    68,
+       8,     9,   139,   188,   115,     2,    69,   131,   134,    61,
+     143,    70,    95,   177,   140,   149,    14,   150,   186,    65,
+      68,    18,    19,    20,    21,    22,    23,    24,    25,   167,
+     168,    26,    27,   137,   179,   146,    93,    94,    96,    97,
+      98,    99,   100,    57,   176,    65,   163,    59,   101,   193,
+       2,    93,    94,    38,   133,   138,    63,   147,    74,   -36,
+     104,    75,   174,   -36,   -36,   -36,   -36,   -36,   -36,   -36,
+     -36,   105,    76,   -36,   -36,   106,   -36,   107,   108,   109,
+     110,   111,   112,   -36,   113,    85,   114,   194,    93,    94,
+      93,    94,    -4,    17,    86,   115,    18,    19,    20,    21,
+      22,    23,    24,    25,    87,    88,    26,    27,    28,    29,
+      30,    31,    32,    33,    34,    35,    36,    89,    90,    37,
+     102,   103,   160,   161,   162,   171,    -5,    17,    38,   172,
+      18,    19,    20,    21,    22,    23,    24,    25,   173,   205,
+      26,    27,    28,    29,    30,    31,    32,    33,    34,    35,
+      36,   177,    94,    37,   181,   189,   191,   195,   196,   -88,
+     104,   197,    38,   -88,   -88,   -88,   -88,   -88,   -88,   -88,
+     -88,   198,   200,   -88,   -88,   106,   -88,   -88,   -88,   -88,
+     -88,   -88,   -88,   -88,   202,   203,   114,   204,    15,   104,
+      13,   129,   141,   -56,   -56,   148,   -56,   -56,   -56,   -56,
+     105,    78,   -56,   -56,   106,   122,   123,   124,   125,     0,
+       0,     0,   175,   104,     0,   114,   -79,   -79,   -79,   -79,
+     -79,   -79,   -79,   -79,   126,     0,   -79,   -79,   106,     0,
+       0,    19,    20,     0,    22,    23,    24,    25,     0,   114,
+      26,    27,   180,     0,   182,   183,   184,   185,   148,     0,
+       0,     0,     0,   190,     0,   192,     0,     0,     0,     0,
+       0,     0,    38,     0,     0,   199
 };
 
-/* YYPGOTO[NTERM-NUM].  */
-static const yytype_int16 yypgoto[] =
+static const yytype_int16 yycheck[] =
 {
-     -90,   -90,   269,   271,   -90,    23,   -70,   -90,   -90,   -90,
-     -90,   243,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -48,
-     -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,   -90,
-     -90,   -20,   -90,   -90,   -90,   -90,   -90,   206,   205,   -68,
-     -90,   -90,   169,    -1,    27,    -7,   118,   -66,   -89,   -90
+       1,    69,    70,    24,    25,    96,    97,    98,    99,   100,
+     101,    10,    81,    79,    83,    79,     0,    18,    84,    20,
+      84,   112,    23,     3,     3,    93,    94,    34,     0,     1,
+      37,    38,     4,     5,     6,     7,     8,     9,    10,    11,
+      12,   109,    14,    15,    16,    17,    18,    19,    20,    21,
+      22,    23,    24,    25,    27,    27,    36,    36,    27,    28,
+      27,    28,    24,    36,    36,    36,    35,    80,    81,    27,
+      83,    40,    71,    14,    36,   141,    36,   141,   169,    27,
+      28,     4,     5,     6,     7,     8,     9,    10,    11,   110,
+     111,    14,    15,    81,   162,    83,    37,    38,    29,    30,
+      31,    32,    33,    36,   125,    27,   107,    36,    39,   177,
+      36,    37,    38,    36,    80,    81,    36,    83,    36,     0,
+       1,     1,   123,     4,     5,     6,     7,     8,     9,    10,
+      11,    12,     1,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    25,    36,    27,    36,    37,    38,
+      37,    38,     0,     1,    36,    36,     4,     5,     6,     7,
+       8,     9,    10,    11,    36,    36,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,    23,    24,    36,    36,    27,
+      36,    36,    36,    36,    26,     1,     0,     1,    36,    13,
+       4,     5,     6,     7,     8,     9,    10,    11,    36,   200,
+      14,    15,    16,    17,    18,    19,    20,    21,    22,    23,
+      24,    14,    38,    27,    36,    36,    36,    36,    36,     0,
+       1,    36,    36,     4,     5,     6,     7,     8,     9,    10,
+      11,    36,    39,    14,    15,    16,    17,    18,    19,    20,
+      21,    22,    23,    24,    36,    36,    27,    36,     7,     1,
+       6,    79,    82,     5,     6,    36,     8,     9,    10,    11,
+      12,    43,    14,    15,    16,    17,    18,    19,    20,    -1,
+      -1,    -1,   124,     1,    -1,    27,     4,     5,     6,     7,
+       8,     9,    10,    11,    36,    -1,    14,    15,    16,    -1,
+      -1,     5,     6,    -1,     8,     9,    10,    11,    -1,    27,
+      14,    15,   163,    -1,   165,   166,   167,   168,    36,    -1,
+      -1,    -1,    -1,   174,    -1,   176,    -1,    -1,    -1,    -1,
+      -1,    -1,    36,    -1,    -1,   186
 };
 
-/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
-   positive, shift that token.  If negative, reduce the rule which
-   number is the opposite.  If YYTABLE_NINF, syntax error.  */
-#define YYTABLE_NINF -86
-static const yytype_int16 yytable[] =
+  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
+     symbol of state STATE-NUM.  */
+static const yytype_uint8 yystos[] =
 {
-      10,    88,    89,    54,   146,   147,   119,     1,   122,   164,
-      93,   141,    56,   142,    58,   156,    94,    62,     1,    90,
-      91,   131,    65,    66,   144,   145,    67,    90,    91,   132,
-     127,    68,   136,   -31,    97,     2,   154,   -31,   -31,   -31,
-     -31,   -31,   -31,   -31,   -31,    98,    52,   -31,   -31,    99,
-     -31,   100,   101,   102,   103,   104,   -31,   105,   129,   106,
-     138,   173,    92,   141,   107,   142,   174,   172,     8,     9,
-     143,   -33,    97,    90,    91,   -33,   -33,   -33,   -33,   -33,
-     -33,   -33,   -33,    98,   166,   -33,   -33,    99,   -33,   100,
-     101,   102,   103,   104,   -33,   105,    11,   106,   179,   151,
-     123,   126,   107,   135,   125,   130,     2,   139,     2,    90,
-      91,    -5,    12,    55,   161,    13,    14,    15,    16,    17,
-      18,    19,    20,    65,    66,    21,    22,    23,    24,    25,
-      26,    27,    28,    29,    30,    57,    59,    31,    61,    -4,
-      12,    63,    32,    13,    14,    15,    16,    17,    18,    19,
-      20,    64,    71,    21,    22,    23,    24,    25,    26,    27,
-      28,    29,    30,    72,    73,    31,   180,    90,    91,    52,
-      32,   -85,    97,    82,    83,   -85,   -85,   -85,   -85,   -85,
-     -85,   -85,   -85,    84,   190,   -85,   -85,    99,   -85,   -85,
-     -85,   -85,   -85,   -85,   -85,    85,    97,   106,    86,    87,
-     -52,   -52,   140,   -52,   -52,   -52,   -52,    98,    95,   -52,
-     -52,    99,   114,   115,   116,   117,    96,   148,   149,   150,
-     158,   106,   155,   159,    97,   163,   118,   -76,   -76,   -76,
-     -76,   -76,   -76,   -76,   -76,   160,   164,   -76,   -76,    99,
-      13,    14,    15,    16,    17,    18,    19,    20,    91,   106,
-      21,    22,    14,    15,   140,    17,    18,    19,    20,   168,
-     175,    21,    22,   177,   181,   182,   183,    32,   187,   167,
-     188,   169,   170,   171,   185,   189,    53,    51,    32,   176,
-      75,   178,   121,     0,   133,   162,     0,     0,     0,     0,
-     184
+       0,     3,    36,    42,    43,    44,    45,    87,    27,    28,
+      85,     0,    46,    46,    36,    43,    87,     1,     4,     5,
+       6,     7,     8,     9,    10,    11,    14,    15,    16,    17,
+      18,    19,    20,    21,    22,    23,    24,    27,    36,    47,
+      48,    50,    51,    52,    53,    59,    60,    62,    66,    68,
+      70,    71,    73,    75,    76,    77,    86,    36,    85,    36,
+      85,    27,    92,    36,    85,    27,    90,    90,    28,    35,
+      40,    89,    90,    91,    36,     1,     1,    54,    54,    63,
+      65,    69,    82,    74,    80,    36,    36,    36,    36,    36,
+      36,    89,    89,    37,    38,    87,    29,    30,    31,    32,
+      33,    39,    36,    36,     1,    12,    16,    18,    19,    20,
+      21,    22,    23,    25,    27,    36,    49,    55,    56,    78,
+      79,    81,    17,    18,    19,    20,    36,    49,    64,    79,
+      81,    48,    61,    86,    48,    62,    67,    73,    86,    24,
+      36,    80,    83,    48,    62,    72,    73,    86,    36,    49,
+      81,    34,    89,    89,    91,    91,    91,    91,    91,    91,
+      36,    36,    26,    85,    84,    85,    89,    90,    90,    91,
+      57,     1,    13,    36,    85,    84,    90,    14,    88,    89,
+      88,    36,    88,    88,    88,    88,    91,    27,    36,    36,
+      88,    36,    88,    89,    36,    36,    36,    36,    36,    88,
+      39,    58,    36,    36,    36,    85
 };
 
-#define yypact_value_is_default(yystate) \
-  ((yystate) == (-90))
-
-#define yytable_value_is_error(yytable_value) \
-  YYID (0)
-
-static const yytype_int16 yycheck[] =
+  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
+static const yytype_uint8 yyr1[] =
 {
-       1,    67,    68,    10,    93,    94,    76,     3,    76,    14,
-      28,    81,    13,    81,    15,   104,    34,    18,     3,    32,
-      33,    23,    26,    27,    90,    91,    30,    32,    33,    31,
-      78,    35,    80,     0,     1,    31,   102,     4,     5,     6,
-       7,     8,     9,    10,    11,    12,    31,    14,    15,    16,
-      17,    18,    19,    20,    21,    22,    23,    24,    78,    26,
-      80,    26,    69,   133,    31,   133,    31,   156,    26,    27,
-      29,     0,     1,    32,    33,     4,     5,     6,     7,     8,
-       9,    10,    11,    12,   150,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    24,     0,    26,   164,   100,
-      77,    78,    31,    80,    77,    78,    31,    80,    31,    32,
-      33,     0,     1,    31,   115,     4,     5,     6,     7,     8,
-       9,    10,    11,    26,    27,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,    26,    26,    31,     0,
-       1,    26,    31,     4,     5,     6,     7,     8,     9,    10,
-      11,    26,    31,    14,    15,    16,    17,    18,    19,    20,
-      21,    22,    23,     1,     1,    26,    31,    32,    33,    31,
-      31,     0,     1,    31,    31,     4,     5,     6,     7,     8,
-       9,    10,    11,    31,   185,    14,    15,    16,    17,    18,
-      19,    20,    21,    22,    23,    31,     1,    26,    31,    31,
-       5,     6,    31,     8,     9,    10,    11,    12,    31,    14,
-      15,    16,    17,    18,    19,    20,    31,    31,    31,    25,
-       1,    26,    26,    13,     1,    26,    31,     4,     5,     6,
-       7,     8,     9,    10,    11,    31,    14,    14,    15,    16,
-       4,     5,     6,     7,     8,     9,    10,    11,    33,    26,
-      14,    15,     5,     6,    31,     8,     9,    10,    11,    31,
-      31,    14,    15,    31,    31,    31,    31,    31,    31,   151,
-      31,   153,   154,   155,    34,    31,     7,     6,    31,   161,
-      37,   163,    76,    -1,    79,   116,    -1,    -1,    -1,    -1,
-     172
+       0,    41,    42,    42,    43,    43,    44,    45,    46,    46,
+      46,    46,    46,    46,    46,    46,    47,    47,    47,    47,
+      47,    47,    47,    47,    47,    48,    48,    48,    48,    48,
+      48,    49,    49,    50,    51,    52,    53,    54,    54,    54,
+      54,    54,    54,    54,    55,    55,    55,    55,    55,    55,
+      56,    57,    57,    58,    58,    59,    60,    61,    62,    63,
+      63,    63,    63,    63,    63,    64,    64,    64,    64,    65,
+      65,    66,    67,    68,    69,    69,    69,    69,    70,    71,
+      72,    73,    74,    74,    74,    74,    75,    76,    77,    78,
+      79,    80,    80,    80,    80,    81,    82,    82,    82,    83,
+      84,    84,    85,    85,    86,    86,    86,    87,    87,    88,
+      88,    89,    89,    89,    89,    89,    89,    89,    89,    89,
+      89,    89,    90,    91,    91,    92,    92
 };
 
-/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
-   symbol of state STATE-NUM.  */
-static const yytype_uint8 yystos[] =
+  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
+static const yytype_uint8 yyr2[] =
 {
-       0,     3,    31,    37,    38,    39,    63,    81,    26,    27,
-      79,     0,     1,     4,     5,     6,     7,     8,     9,    10,
-      11,    14,    15,    16,    17,    18,    19,    20,    21,    22,
-      23,    26,    31,    40,    41,    43,    44,    45,    46,    52,
-      53,    55,    59,    61,    64,    65,    67,    69,    70,    71,
-      80,    39,    31,    38,    81,    31,    79,    31,    79,    26,
-      85,    31,    79,    26,    26,    26,    27,    30,    35,    83,
-      84,    31,     1,     1,    47,    47,    56,    58,    62,    76,
-      68,    74,    31,    31,    31,    31,    31,    31,    83,    83,
-      32,    33,    81,    28,    34,    31,    31,     1,    12,    16,
-      18,    19,    20,    21,    22,    24,    26,    31,    42,    48,
-      49,    72,    73,    75,    17,    18,    19,    20,    31,    42,
-      57,    73,    75,    41,    54,    80,    41,    55,    60,    67,
-      80,    23,    31,    74,    77,    41,    55,    66,    67,    80,
-      31,    42,    75,    29,    83,    83,    84,    84,    31,    31,
-      25,    79,    78,    79,    83,    26,    84,    50,     1,    13,
-      31,    79,    78,    26,    14,    82,    83,    82,    31,    82,
-      82,    82,    84,    26,    31,    31,    82,    31,    82,    83,
-      31,    31,    31,    31,    82,    34,    51,    31,    31,    31,
-      79
+       0,     2,     2,     1,     2,     2,     3,     0,     0,     2,
+       2,     2,     2,     4,     4,     3,     1,     1,     1,     1,
+       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
+       1,     3,     2,     3,     2,     3,     2,     0,     2,     2,
+       2,     2,     2,     2,     3,     4,     4,     4,     4,     5,
+       3,     0,     3,     0,     2,     3,     2,     1,     3,     0,
+       2,     2,     2,     2,     2,     4,     3,     2,     4,     0,
+       2,     3,     1,     3,     0,     2,     2,     2,     3,     3,
+       1,     3,     0,     2,     2,     2,     3,     3,     2,     2,
+       2,     0,     2,     2,     2,     4,     0,     2,     2,     2,
+       0,     2,     1,     1,     2,     2,     2,     1,     2,     0,
+       2,     1,     3,     3,     3,     3,     3,     3,     3,     2,
+       3,     3,     1,     1,     1,     0,     1
 };
 
-#define yyerrok		(yyerrstatus = 0)
-#define yyclearin	(yychar = YYEMPTY)
-#define YYEMPTY		(-2)
-#define YYEOF		0
-
-#define YYACCEPT	goto yyacceptlab
-#define YYABORT		goto yyabortlab
-#define YYERROR		goto yyerrorlab
-
-
-/* Like YYERROR except do call yyerror.  This remains here temporarily
-   to ease the transition to the new meaning of YYERROR, for GCC.
-   Once GCC version 2 has supplanted version 1, this can go.  However,
-   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
-   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
-   discussed.  */
-
-#define YYFAIL		goto yyerrlab
-#if defined YYFAIL
-  /* This is here to suppress warnings from the GCC cpp's
-     -Wunused-macros.  Normally we don't worry about that warning, but
-     some users do, and we want to make it easy for users to remove
-     YYFAIL uses, which will produce warnings from Bison 2.5.  */
-#endif
 
-#define YYRECOVERING()  (!!yyerrstatus)
+#define yyerrok         (yyerrstatus = 0)
+#define yyclearin       (yychar = YYEMPTY)
+#define YYEMPTY         (-2)
+#define YYEOF           0
 
-#define YYBACKUP(Token, Value)					\
-do								\
-  if (yychar == YYEMPTY && yylen == 1)				\
-    {								\
-      yychar = (Token);						\
-      yylval = (Value);						\
-      YYPOPSTACK (1);						\
-      goto yybackup;						\
-    }								\
-  else								\
-    {								\
-      yyerror (YY_("syntax error: cannot back up")); \
-      YYERROR;							\
-    }								\
-while (YYID (0))
-
-
-#define YYTERROR	1
-#define YYERRCODE	256
-
-
-/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
-   If N is 0, then set CURRENT to the empty location which ends
-   the previous symbol: RHS[0] (always defined).  */
-
-#define YYRHSLOC(Rhs, K) ((Rhs)[K])
-#ifndef YYLLOC_DEFAULT
-# define YYLLOC_DEFAULT(Current, Rhs, N)				\
-    do									\
-      if (YYID (N))                                                    \
-	{								\
-	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
-	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
-	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
-	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
-	}								\
-      else								\
-	{								\
-	  (Current).first_line   = (Current).last_line   =		\
-	    YYRHSLOC (Rhs, 0).last_line;				\
-	  (Current).first_column = (Current).last_column =		\
-	    YYRHSLOC (Rhs, 0).last_column;				\
-	}								\
-    while (YYID (0))
-#endif
+#define YYACCEPT        goto yyacceptlab
+#define YYABORT         goto yyabortlab
+#define YYERROR         goto yyerrorlab
 
 
-/* This macro is provided for backward compatibility. */
+#define YYRECOVERING()  (!!yyerrstatus)
 
-#ifndef YY_LOCATION_PRINT
-# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
-#endif
+#define YYBACKUP(Token, Value)                                  \
+do                                                              \
+  if (yychar == YYEMPTY)                                        \
+    {                                                           \
+      yychar = (Token);                                         \
+      yylval = (Value);                                         \
+      YYPOPSTACK (yylen);                                       \
+      yystate = *yyssp;                                         \
+      goto yybackup;                                            \
+    }                                                           \
+  else                                                          \
+    {                                                           \
+      yyerror (YY_("syntax error: cannot back up")); \
+      YYERROR;                                                  \
+    }                                                           \
+while (0)
 
+/* Error token number */
+#define YYTERROR        1
+#define YYERRCODE       256
 
-/* YYLEX -- calling `yylex' with the right arguments.  */
 
-#ifdef YYLEX_PARAM
-# define YYLEX yylex (YYLEX_PARAM)
-#else
-# define YYLEX yylex ()
-#endif
 
 /* Enable debugging if requested.  */
 #if YYDEBUG
@@ -893,54 +832,46 @@ while (YYID (0))
 #  define YYFPRINTF fprintf
 # endif
 
-# define YYDPRINTF(Args)			\
-do {						\
-  if (yydebug)					\
-    YYFPRINTF Args;				\
-} while (YYID (0))
+# define YYDPRINTF(Args)                        \
+do {                                            \
+  if (yydebug)                                  \
+    YYFPRINTF Args;                             \
+} while (0)
 
-# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
-do {									  \
-  if (yydebug)								  \
-    {									  \
-      YYFPRINTF (stderr, "%s ", Title);					  \
-      yy_symbol_print (stderr,						  \
-		  Type, Value); \
-      YYFPRINTF (stderr, "\n");						  \
-    }									  \
-} while (YYID (0))
+/* This macro is provided for backward compatibility. */
+#ifndef YY_LOCATION_PRINT
+# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
+#endif
 
 
-/*--------------------------------.
-| Print this symbol on YYOUTPUT.  |
-`--------------------------------*/
+# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
+do {                                                                      \
+  if (yydebug)                                                            \
+    {                                                                     \
+      YYFPRINTF (stderr, "%s ", Title);                                   \
+      yy_symbol_print (stderr,                                            \
+                  Type, Value); \
+      YYFPRINTF (stderr, "\n");                                           \
+    }                                                                     \
+} while (0)
+
+
+/*----------------------------------------.
+| Print this symbol's value on YYOUTPUT.  |
+`----------------------------------------*/
 
-/*ARGSUSED*/
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static void
 yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
-#else
-static void
-yy_symbol_value_print (yyoutput, yytype, yyvaluep)
-    FILE *yyoutput;
-    int yytype;
-    YYSTYPE const * const yyvaluep;
-#endif
 {
+  FILE *yyo = yyoutput;
+  YYUSE (yyo);
   if (!yyvaluep)
     return;
 # ifdef YYPRINT
   if (yytype < YYNTOKENS)
     YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
-# else
-  YYUSE (yyoutput);
 # endif
-  switch (yytype)
-    {
-      default:
-	break;
-    }
+  YYUSE (yytype);
 }
 
 
@@ -948,22 +879,11 @@ yy_symbol_value_print (yyoutput, yytype, yyvaluep)
 | Print this symbol on YYOUTPUT.  |
 `--------------------------------*/
 
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static void
 yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
-#else
-static void
-yy_symbol_print (yyoutput, yytype, yyvaluep)
-    FILE *yyoutput;
-    int yytype;
-    YYSTYPE const * const yyvaluep;
-#endif
 {
-  if (yytype < YYNTOKENS)
-    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
-  else
-    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);
+  YYFPRINTF (yyoutput, "%s %s (",
+             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);
 
   yy_symbol_value_print (yyoutput, yytype, yyvaluep);
   YYFPRINTF (yyoutput, ")");
@@ -974,16 +894,8 @@ yy_symbol_print (yyoutput, yytype, yyvaluep)
 | TOP (included).                                                   |
 `------------------------------------------------------------------*/
 
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static void
 yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
-#else
-static void
-yy_stack_print (yybottom, yytop)
-    yytype_int16 *yybottom;
-    yytype_int16 *yytop;
-#endif
 {
   YYFPRINTF (stderr, "Stack now");
   for (; yybottom <= yytop; yybottom++)
@@ -994,49 +906,42 @@ yy_stack_print (yybottom, yytop)
   YYFPRINTF (stderr, "\n");
 }
 
-# define YY_STACK_PRINT(Bottom, Top)				\
-do {								\
-  if (yydebug)							\
-    yy_stack_print ((Bottom), (Top));				\
-} while (YYID (0))
+# define YY_STACK_PRINT(Bottom, Top)                            \
+do {                                                            \
+  if (yydebug)                                                  \
+    yy_stack_print ((Bottom), (Top));                           \
+} while (0)
 
 
 /*------------------------------------------------.
 | Report that the YYRULE is going to be reduced.  |
 `------------------------------------------------*/
 
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static void
-yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
-#else
-static void
-yy_reduce_print (yyvsp, yyrule)
-    YYSTYPE *yyvsp;
-    int yyrule;
-#endif
+yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
 {
+  unsigned long int yylno = yyrline[yyrule];
   int yynrhs = yyr2[yyrule];
   int yyi;
-  unsigned long int yylno = yyrline[yyrule];
   YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
-	     yyrule - 1, yylno);
+             yyrule - 1, yylno);
   /* The symbols being reduced.  */
   for (yyi = 0; yyi < yynrhs; yyi++)
     {
       YYFPRINTF (stderr, "   $%d = ", yyi + 1);
-      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
-		       &(yyvsp[(yyi + 1) - (yynrhs)])
-		       		       );
+      yy_symbol_print (stderr,
+                       yystos[yyssp[yyi + 1 - yynrhs]],
+                       &(yyvsp[(yyi + 1) - (yynrhs)])
+                                              );
       YYFPRINTF (stderr, "\n");
     }
 }
 
-# define YY_REDUCE_PRINT(Rule)		\
-do {					\
-  if (yydebug)				\
-    yy_reduce_print (yyvsp, Rule); \
-} while (YYID (0))
+# define YY_REDUCE_PRINT(Rule)          \
+do {                                    \
+  if (yydebug)                          \
+    yy_reduce_print (yyssp, yyvsp, Rule); \
+} while (0)
 
 /* Nonzero means print parse trace.  It is left uninitialized so that
    multiple parsers can coexist.  */
@@ -1050,7 +955,7 @@ int yydebug;
 
 
 /* YYINITDEPTH -- initial size of the parser's stacks.  */
-#ifndef	YYINITDEPTH
+#ifndef YYINITDEPTH
 # define YYINITDEPTH 200
 #endif
 
@@ -1073,15 +978,8 @@ int yydebug;
 #   define yystrlen strlen
 #  else
 /* Return the length of YYSTR.  */
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static YYSIZE_T
 yystrlen (const char *yystr)
-#else
-static YYSIZE_T
-yystrlen (yystr)
-    const char *yystr;
-#endif
 {
   YYSIZE_T yylen;
   for (yylen = 0; yystr[yylen]; yylen++)
@@ -1097,16 +995,8 @@ yystrlen (yystr)
 #  else
 /* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
    YYDEST.  */
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static char *
 yystpcpy (char *yydest, const char *yysrc)
-#else
-static char *
-yystpcpy (yydest, yysrc)
-    char *yydest;
-    const char *yysrc;
-#endif
 {
   char *yyd = yydest;
   const char *yys = yysrc;
@@ -1136,27 +1026,27 @@ yytnamerr (char *yyres, const char *yystr)
       char const *yyp = yystr;
 
       for (;;)
-	switch (*++yyp)
-	  {
-	  case '\'':
-	  case ',':
-	    goto do_not_strip_quotes;
-
-	  case '\\':
-	    if (*++yyp != '\\')
-	      goto do_not_strip_quotes;
-	    /* Fall through.  */
-	  default:
-	    if (yyres)
-	      yyres[yyn] = *yyp;
-	    yyn++;
-	    break;
-
-	  case '"':
-	    if (yyres)
-	      yyres[yyn] = '\0';
-	    return yyn;
-	  }
+        switch (*++yyp)
+          {
+          case '\'':
+          case ',':
+            goto do_not_strip_quotes;
+
+          case '\\':
+            if (*++yyp != '\\')
+              goto do_not_strip_quotes;
+            /* Fall through.  */
+          default:
+            if (yyres)
+              yyres[yyn] = *yyp;
+            yyn++;
+            break;
+
+          case '"':
+            if (yyres)
+              yyres[yyn] = '\0';
+            return yyn;
+          }
     do_not_strip_quotes: ;
     }
 
@@ -1179,12 +1069,11 @@ static int
 yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                 yytype_int16 *yyssp, int yytoken)
 {
-  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
+  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
   YYSIZE_T yysize = yysize0;
-  YYSIZE_T yysize1;
   enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
   /* Internationalized format string. */
-  const char *yyformat = 0;
+  const char *yyformat = YY_NULLPTR;
   /* Arguments of yyformat. */
   char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
   /* Number of reported tokens (one for the "unexpected", one per
@@ -1192,10 +1081,6 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
   int yycount = 0;
 
   /* There are many possibilities here to consider:
-     - Assume YYFAIL is not used.  It's too flawed to consider.  See
-       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
-       for details.  YYERROR is fine as it does not invoke this
-       function.
      - If this state is a consistent state with a default action, then
        the only way this function was invoked is if the default action
        is an error action.  In that case, don't check for expected
@@ -1244,11 +1129,13 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                     break;
                   }
                 yyarg[yycount++] = yytname[yyx];
-                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
-                if (! (yysize <= yysize1
-                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
-                  return 2;
-                yysize = yysize1;
+                {
+                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
+                  if (! (yysize <= yysize1
+                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+                    return 2;
+                  yysize = yysize1;
+                }
               }
         }
     }
@@ -1268,10 +1155,12 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
 # undef YYCASE_
     }
 
-  yysize1 = yysize + yystrlen (yyformat);
-  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
-    return 2;
-  yysize = yysize1;
+  {
+    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
+    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
+      return 2;
+    yysize = yysize1;
+  }
 
   if (*yymsg_alloc < yysize)
     {
@@ -1308,78 +1197,58 @@ yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
 | Release the memory associated to this symbol.  |
 `-----------------------------------------------*/
 
-/*ARGSUSED*/
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 static void
 yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
-#else
-static void
-yydestruct (yymsg, yytype, yyvaluep)
-    const char *yymsg;
-    int yytype;
-    YYSTYPE *yyvaluep;
-#endif
 {
   YYUSE (yyvaluep);
-
   if (!yymsg)
     yymsg = "Deleting";
   YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);
 
+  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   switch (yytype)
     {
-      case 53: /* "choice_entry" */
+          case 60: /* choice_entry  */
 
-	{
+      {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
-		(yyvaluep->menu)->file->name, (yyvaluep->menu)->lineno);
-	if (current_menu == (yyvaluep->menu))
+		((*yyvaluep).menu)->file->name, ((*yyvaluep).menu)->lineno);
+	if (current_menu == ((*yyvaluep).menu))
 		menu_end_menu();
-};
+}
+
+        break;
 
-	break;
-      case 59: /* "if_entry" */
+    case 66: /* if_entry  */
 
-	{
+      {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
-		(yyvaluep->menu)->file->name, (yyvaluep->menu)->lineno);
-	if (current_menu == (yyvaluep->menu))
+		((*yyvaluep).menu)->file->name, ((*yyvaluep).menu)->lineno);
+	if (current_menu == ((*yyvaluep).menu))
 		menu_end_menu();
-};
+}
+
+        break;
 
-	break;
-      case 65: /* "menu_entry" */
+    case 71: /* menu_entry  */
 
-	{
+      {
 	fprintf(stderr, "%s:%d: missing end statement for this entry\n",
-		(yyvaluep->menu)->file->name, (yyvaluep->menu)->lineno);
-	if (current_menu == (yyvaluep->menu))
+		((*yyvaluep).menu)->file->name, ((*yyvaluep).menu)->lineno);
+	if (current_menu == ((*yyvaluep).menu))
 		menu_end_menu();
-};
+}
+
+        break;
 
-	break;
 
       default:
-	break;
+        break;
     }
+  YY_IGNORE_MAYBE_UNINITIALIZED_END
 }
 
 
-/* Prevent warnings from -Wmissing-prototypes.  */
-#ifdef YYPARSE_PARAM
-#if defined __STDC__ || defined __cplusplus
-int yyparse (void *YYPARSE_PARAM);
-#else
-int yyparse ();
-#endif
-#else /* ! YYPARSE_PARAM */
-#if defined __STDC__ || defined __cplusplus
-int yyparse (void);
-#else
-int yyparse ();
-#endif
-#endif /* ! YYPARSE_PARAM */
 
 
 /* The lookahead symbol.  */
@@ -1387,7 +1256,6 @@ int yychar;
 
 /* The semantic value of the lookahead symbol.  */
 YYSTYPE yylval;
-
 /* Number of syntax errors so far.  */
 int yynerrs;
 
@@ -1396,37 +1264,18 @@ int yynerrs;
 | yyparse.  |
 `----------*/
 
-#ifdef YYPARSE_PARAM
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
-int
-yyparse (void *YYPARSE_PARAM)
-#else
-int
-yyparse (YYPARSE_PARAM)
-    void *YYPARSE_PARAM;
-#endif
-#else /* ! YYPARSE_PARAM */
-#if (defined __STDC__ || defined __C99__FUNC__ \
-     || defined __cplusplus || defined _MSC_VER)
 int
 yyparse (void)
-#else
-int
-yyparse ()
-
-#endif
-#endif
 {
     int yystate;
     /* Number of tokens to shift before error messages enabled.  */
     int yyerrstatus;
 
     /* The stacks and their tools:
-       `yyss': related to states.
-       `yyvs': related to semantic values.
+       'yyss': related to states.
+       'yyvs': related to semantic values.
 
-       Refer to the stacks thru separate pointers, to allow yyoverflow
+       Refer to the stacks through separate pointers, to allow yyoverflow
        to reallocate them elsewhere.  */
 
     /* The state stack.  */
@@ -1444,7 +1293,7 @@ yyparse ()
   int yyn;
   int yyresult;
   /* Lookahead token as an internal (translated) token number.  */
-  int yytoken;
+  int yytoken = 0;
   /* The variables used to return semantic value and location from the
      action routines.  */
   YYSTYPE yyval;
@@ -1462,9 +1311,8 @@ yyparse ()
      Keep to zero when no symbol should be popped.  */
   int yylen = 0;
 
-  yytoken = 0;
-  yyss = yyssa;
-  yyvs = yyvsa;
+  yyssp = yyss = yyssa;
+  yyvsp = yyvs = yyvsa;
   yystacksize = YYINITDEPTH;
 
   YYDPRINTF ((stderr, "Starting parse\n"));
@@ -1473,14 +1321,6 @@ yyparse ()
   yyerrstatus = 0;
   yynerrs = 0;
   yychar = YYEMPTY; /* Cause a token to be read.  */
-
-  /* Initialize stack pointers.
-     Waste one element of value and location stack
-     so that they stay on the same level as the state stack.
-     The wasted elements are never initialized.  */
-  yyssp = yyss;
-  yyvsp = yyvs;
-
   goto yysetstate;
 
 /*------------------------------------------------------------.
@@ -1501,23 +1341,23 @@ yyparse ()
 
 #ifdef yyoverflow
       {
-	/* Give user a chance to reallocate the stack.  Use copies of
-	   these so that the &'s don't force the real ones into
-	   memory.  */
-	YYSTYPE *yyvs1 = yyvs;
-	yytype_int16 *yyss1 = yyss;
-
-	/* Each stack pointer address is followed by the size of the
-	   data in use in that stack, in bytes.  This used to be a
-	   conditional around just the two extra args, but that might
-	   be undefined if yyoverflow is a macro.  */
-	yyoverflow (YY_("memory exhausted"),
-		    &yyss1, yysize * sizeof (*yyssp),
-		    &yyvs1, yysize * sizeof (*yyvsp),
-		    &yystacksize);
-
-	yyss = yyss1;
-	yyvs = yyvs1;
+        /* Give user a chance to reallocate the stack.  Use copies of
+           these so that the &'s don't force the real ones into
+           memory.  */
+        YYSTYPE *yyvs1 = yyvs;
+        yytype_int16 *yyss1 = yyss;
+
+        /* Each stack pointer address is followed by the size of the
+           data in use in that stack, in bytes.  This used to be a
+           conditional around just the two extra args, but that might
+           be undefined if yyoverflow is a macro.  */
+        yyoverflow (YY_("memory exhausted"),
+                    &yyss1, yysize * sizeof (*yyssp),
+                    &yyvs1, yysize * sizeof (*yyvsp),
+                    &yystacksize);
+
+        yyss = yyss1;
+        yyvs = yyvs1;
       }
 #else /* no yyoverflow */
 # ifndef YYSTACK_RELOCATE
@@ -1525,22 +1365,22 @@ yyparse ()
 # else
       /* Extend the stack our own way.  */
       if (YYMAXDEPTH <= yystacksize)
-	goto yyexhaustedlab;
+        goto yyexhaustedlab;
       yystacksize *= 2;
       if (YYMAXDEPTH < yystacksize)
-	yystacksize = YYMAXDEPTH;
+        yystacksize = YYMAXDEPTH;
 
       {
-	yytype_int16 *yyss1 = yyss;
-	union yyalloc *yyptr =
-	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
-	if (! yyptr)
-	  goto yyexhaustedlab;
-	YYSTACK_RELOCATE (yyss_alloc, yyss);
-	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
+        yytype_int16 *yyss1 = yyss;
+        union yyalloc *yyptr =
+          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
+        if (! yyptr)
+          goto yyexhaustedlab;
+        YYSTACK_RELOCATE (yyss_alloc, yyss);
+        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
 #  undef YYSTACK_RELOCATE
-	if (yyss1 != yyssa)
-	  YYSTACK_FREE (yyss1);
+        if (yyss1 != yyssa)
+          YYSTACK_FREE (yyss1);
       }
 # endif
 #endif /* no yyoverflow */
@@ -1549,10 +1389,10 @@ yyparse ()
       yyvsp = yyvs + yysize - 1;
 
       YYDPRINTF ((stderr, "Stack size increased to %lu\n",
-		  (unsigned long int) yystacksize));
+                  (unsigned long int) yystacksize));
 
       if (yyss + yystacksize - 1 <= yyssp)
-	YYABORT;
+        YYABORT;
     }
 
   YYDPRINTF ((stderr, "Entering state %d\n", yystate));
@@ -1581,7 +1421,7 @@ yybackup:
   if (yychar == YYEMPTY)
     {
       YYDPRINTF ((stderr, "Reading a token: "));
-      yychar = YYLEX;
+      yychar = yylex ();
     }
 
   if (yychar <= YYEOF)
@@ -1621,7 +1461,9 @@ yybackup:
   yychar = YYEMPTY;
 
   yystate = yyn;
+  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   *++yyvsp = yylval;
+  YY_IGNORE_MAYBE_UNINITIALIZED_END
 
   goto yynewstate;
 
@@ -1644,7 +1486,7 @@ yyreduce:
   yylen = yyr2[yyn];
 
   /* If YYLEN is nonzero, implement the default value of the action:
-     `$$ = $1'.
+     '$$ = $1'.
 
      Otherwise, the following line sets YYVAL to garbage.
      This behavior is undocumented and Bison
@@ -1657,402 +1499,505 @@ yyreduce:
   YY_REDUCE_PRINT (yyn);
   switch (yyn)
     {
-        case 10:
+        case 6:
+
+    {
+	menu_add_prompt(P_MENU, (yyvsp[-1].string), NULL);
+}
 
-    { zconf_error("unexpected end statement"); }
     break;
 
-  case 11:
+  case 7:
+
+    {
+	/*
+	 * Hack: Keep the main menu title on the heap so we can safely free it
+	 * later regardless of whether it comes from the 'prompt' in
+	 * mainmenu_stmt or here
+	 */
+	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
+}
 
-    { zconf_error("unknown statement \"%s\"", (yyvsp[(2) - (4)].string)); }
     break;
 
   case 12:
 
+    { zconf_error("unexpected end statement"); }
+
+    break;
+
+  case 13:
+
+    { zconf_error("unknown statement \"%s\"", (yyvsp[-2].string)); }
+
+    break;
+
+  case 14:
+
     {
-	zconf_error("unexpected option \"%s\"", kconf_id_strings + (yyvsp[(2) - (4)].id)->name);
+	zconf_error("unexpected option \"%s\"", (yyvsp[-2].id)->name);
 }
+
     break;
 
-  case 13:
+  case 15:
 
     { zconf_error("invalid statement"); }
+
     break;
 
-  case 28:
+  case 31:
+
+    { zconf_error("unknown option \"%s\"", (yyvsp[-2].string)); }
 
-    { zconf_error("unknown option \"%s\"", (yyvsp[(1) - (3)].string)); }
     break;
 
-  case 29:
+  case 32:
 
     { zconf_error("invalid option"); }
+
     break;
 
-  case 30:
+  case 33:
 
     {
-	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
+	(yyvsp[-1].symbol)->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry((yyvsp[-1].symbol));
+	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].symbol)->name);
 }
+
     break;
 
-  case 31:
+  case 34:
 
     {
-	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 32:
+  case 35:
 
     {
-	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
+	(yyvsp[-1].symbol)->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry((yyvsp[-1].symbol));
+	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].symbol)->name);
 }
+
     break;
 
-  case 33:
+  case 36:
 
     {
 	if (current_entry->prompt)
 		current_entry->prompt->type = P_MENU;
 	else
 		zconfprint("warning: menuconfig statement without prompt");
-	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 41:
+  case 44:
 
     {
-	menu_set_type((yyvsp[(1) - (3)].id)->stype);
+	menu_set_type((yyvsp[-2].id)->stype);
 	printd(DEBUG_PARSE, "%s:%d:type(%u)\n",
 		zconf_curname(), zconf_lineno(),
-		(yyvsp[(1) - (3)].id)->stype);
+		(yyvsp[-2].id)->stype);
 }
+
     break;
 
-  case 42:
+  case 45:
 
     {
-	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
+	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 43:
+  case 46:
 
     {
-	menu_add_expr(P_DEFAULT, (yyvsp[(2) - (4)].expr), (yyvsp[(3) - (4)].expr));
-	if ((yyvsp[(1) - (4)].id)->stype != S_UNKNOWN)
-		menu_set_type((yyvsp[(1) - (4)].id)->stype);
+	menu_add_expr(P_DEFAULT, (yyvsp[-2].expr), (yyvsp[-1].expr));
+	if ((yyvsp[-3].id)->stype != S_UNKNOWN)
+		menu_set_type((yyvsp[-3].id)->stype);
 	printd(DEBUG_PARSE, "%s:%d:default(%u)\n",
 		zconf_curname(), zconf_lineno(),
-		(yyvsp[(1) - (4)].id)->stype);
+		(yyvsp[-3].id)->stype);
 }
+
     break;
 
-  case 44:
+  case 47:
 
     {
-	menu_add_symbol(P_SELECT, sym_lookup((yyvsp[(2) - (4)].string), 0), (yyvsp[(3) - (4)].expr));
+	menu_add_symbol(P_SELECT, (yyvsp[-2].symbol), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:select\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 45:
+  case 48:
 
     {
-	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[(2) - (5)].symbol), (yyvsp[(3) - (5)].symbol)), (yyvsp[(4) - (5)].expr));
+	menu_add_symbol(P_IMPLY, (yyvsp[-2].symbol), (yyvsp[-1].expr));
+	printd(DEBUG_PARSE, "%s:%d:imply\n", zconf_curname(), zconf_lineno());
+}
+
+    break;
+
+  case 49:
+
+    {
+	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,(yyvsp[-3].symbol), (yyvsp[-2].symbol)), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:range\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 48:
+  case 52:
 
     {
-	const struct kconf_id *id = kconf_id_lookup((yyvsp[(2) - (3)].string), strlen((yyvsp[(2) - (3)].string)));
-	if (id && id->flags & TF_OPTION)
-		menu_add_option(id->token, (yyvsp[(3) - (3)].string));
+	const struct kconf_id *id = kconf_id_lookup((yyvsp[-1].string), strlen((yyvsp[-1].string)));
+	if (id && id->flags & TF_OPTION) {
+		menu_add_option(id->token, (yyvsp[0].string));
+		free((yyvsp[0].string));
+	}
 	else
-		zconfprint("warning: ignoring unknown option %s", (yyvsp[(2) - (3)].string));
-	free((yyvsp[(2) - (3)].string));
+		zconfprint("warning: ignoring unknown option %s", (yyvsp[-1].string));
+	free((yyvsp[-1].string));
 }
+
     break;
 
-  case 49:
+  case 53:
 
     { (yyval.string) = NULL; }
+
     break;
 
-  case 50:
+  case 54:
+
+    { (yyval.string) = (yyvsp[0].string); }
 
-    { (yyval.string) = (yyvsp[(2) - (2)].string); }
     break;
 
-  case 51:
+  case 55:
 
     {
-	struct symbol *sym = sym_lookup((yyvsp[(2) - (3)].string), SYMBOL_CHOICE);
+	struct symbol *sym = sym_lookup((yyvsp[-1].string), SYMBOL_CHOICE);
 	sym->flags |= SYMBOL_AUTO;
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
+	free((yyvsp[-1].string));
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 52:
+  case 56:
 
     {
 	(yyval.menu) = menu_add_menu();
 }
+
     break;
 
-  case 53:
+  case 57:
 
     {
-	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_CHOICE, T_ENDCHOICE)) {
+	if (zconf_endtoken((yyvsp[0].id), T_CHOICE, T_ENDCHOICE)) {
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endchoice\n", zconf_curname(), zconf_lineno());
 	}
 }
+
     break;
 
-  case 61:
+  case 65:
 
     {
-	menu_add_prompt(P_PROMPT, (yyvsp[(2) - (4)].string), (yyvsp[(3) - (4)].expr));
+	menu_add_prompt(P_PROMPT, (yyvsp[-2].string), (yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:prompt\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 62:
+  case 66:
 
     {
-	if ((yyvsp[(1) - (3)].id)->stype == S_BOOLEAN || (yyvsp[(1) - (3)].id)->stype == S_TRISTATE) {
-		menu_set_type((yyvsp[(1) - (3)].id)->stype);
+	if ((yyvsp[-2].id)->stype == S_BOOLEAN || (yyvsp[-2].id)->stype == S_TRISTATE) {
+		menu_set_type((yyvsp[-2].id)->stype);
 		printd(DEBUG_PARSE, "%s:%d:type(%u)\n",
 			zconf_curname(), zconf_lineno(),
-			(yyvsp[(1) - (3)].id)->stype);
+			(yyvsp[-2].id)->stype);
 	} else
 		YYERROR;
 }
+
     break;
 
-  case 63:
+  case 67:
 
     {
 	current_entry->sym->flags |= SYMBOL_OPTIONAL;
 	printd(DEBUG_PARSE, "%s:%d:optional\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 64:
+  case 68:
 
     {
-	if ((yyvsp[(1) - (4)].id)->stype == S_UNKNOWN) {
-		menu_add_symbol(P_DEFAULT, sym_lookup((yyvsp[(2) - (4)].string), 0), (yyvsp[(3) - (4)].expr));
+	if ((yyvsp[-3].id)->stype == S_UNKNOWN) {
+		menu_add_symbol(P_DEFAULT, (yyvsp[-2].symbol), (yyvsp[-1].expr));
 		printd(DEBUG_PARSE, "%s:%d:default\n",
 			zconf_curname(), zconf_lineno());
 	} else
 		YYERROR;
 }
+
     break;
 
-  case 67:
+  case 71:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:if\n", zconf_curname(), zconf_lineno());
 	menu_add_entry(NULL);
-	menu_add_dep((yyvsp[(2) - (3)].expr));
+	menu_add_dep((yyvsp[-1].expr));
 	(yyval.menu) = menu_add_menu();
 }
+
     break;
 
-  case 68:
+  case 72:
 
     {
-	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_IF, T_ENDIF)) {
+	if (zconf_endtoken((yyvsp[0].id), T_IF, T_ENDIF)) {
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endif\n", zconf_curname(), zconf_lineno());
 	}
 }
-    break;
-
-  case 74:
 
-    {
-	menu_add_prompt(P_MENU, (yyvsp[(2) - (3)].string), NULL);
-}
     break;
 
-  case 75:
+  case 78:
 
     {
 	menu_add_entry(NULL);
-	menu_add_prompt(P_MENU, (yyvsp[(2) - (3)].string), NULL);
+	menu_add_prompt(P_MENU, (yyvsp[-1].string), NULL);
 	printd(DEBUG_PARSE, "%s:%d:menu\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 76:
+  case 79:
 
     {
 	(yyval.menu) = menu_add_menu();
 }
+
     break;
 
-  case 77:
+  case 80:
 
     {
-	if (zconf_endtoken((yyvsp[(1) - (1)].id), T_MENU, T_ENDMENU)) {
+	if (zconf_endtoken((yyvsp[0].id), T_MENU, T_ENDMENU)) {
 		menu_end_menu();
 		printd(DEBUG_PARSE, "%s:%d:endmenu\n", zconf_curname(), zconf_lineno());
 	}
 }
+
     break;
 
-  case 83:
+  case 86:
 
     {
-	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[(2) - (3)].string));
-	zconf_nextfile((yyvsp[(2) - (3)].string));
+	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), (yyvsp[-1].string));
+	zconf_nextfile((yyvsp[-1].string));
+	free((yyvsp[-1].string));
 }
+
     break;
 
-  case 84:
+  case 87:
 
     {
 	menu_add_entry(NULL);
-	menu_add_prompt(P_COMMENT, (yyvsp[(2) - (3)].string), NULL);
+	menu_add_prompt(P_COMMENT, (yyvsp[-1].string), NULL);
 	printd(DEBUG_PARSE, "%s:%d:comment\n", zconf_curname(), zconf_lineno());
 }
-    break;
-
-  case 85:
 
-    {
-	menu_end_entry();
-}
     break;
 
-  case 86:
+  case 89:
 
     {
 	printd(DEBUG_PARSE, "%s:%d:help\n", zconf_curname(), zconf_lineno());
 	zconf_starthelp();
 }
+
     break;
 
-  case 87:
+  case 90:
 
     {
-	current_entry->help = (yyvsp[(2) - (2)].string);
+	if (current_entry->help) {
+		free(current_entry->help);
+		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
+			   current_entry->sym->name ?: "<choice>");
+	}
+
+	/* Is the help text empty or all whitespace? */
+	if ((yyvsp[0].string)[strspn((yyvsp[0].string), " \f\n\r\t\v")] == '\0')
+		zconfprint("warning: '%s' defined with blank help text",
+			   current_entry->sym->name ?: "<choice>");
+
+	current_entry->help = (yyvsp[0].string);
 }
+
     break;
 
-  case 92:
+  case 95:
 
     {
-	menu_add_dep((yyvsp[(3) - (4)].expr));
+	menu_add_dep((yyvsp[-1].expr));
 	printd(DEBUG_PARSE, "%s:%d:depends on\n", zconf_curname(), zconf_lineno());
 }
+
     break;
 
-  case 96:
+  case 99:
 
     {
-	menu_add_visibility((yyvsp[(2) - (2)].expr));
+	menu_add_visibility((yyvsp[0].expr));
 }
+
     break;
 
-  case 98:
+  case 101:
 
     {
-	menu_add_prompt(P_PROMPT, (yyvsp[(1) - (2)].string), (yyvsp[(2) - (2)].expr));
+	menu_add_prompt(P_PROMPT, (yyvsp[-1].string), (yyvsp[0].expr));
 }
-    break;
-
-  case 101:
 
-    { (yyval.id) = (yyvsp[(1) - (2)].id); }
     break;
 
-  case 102:
-
-    { (yyval.id) = (yyvsp[(1) - (2)].id); }
-    break;
+  case 104:
 
-  case 103:
+    { (yyval.id) = (yyvsp[-1].id); }
 
-    { (yyval.id) = (yyvsp[(1) - (2)].id); }
     break;
 
-  case 106:
+  case 105:
 
-    { (yyval.expr) = NULL; }
-    break;
-
-  case 107:
+    { (yyval.id) = (yyvsp[-1].id); }
 
-    { (yyval.expr) = (yyvsp[(2) - (2)].expr); }
     break;
 
-  case 108:
+  case 106:
+
+    { (yyval.id) = (yyvsp[-1].id); }
 
-    { (yyval.expr) = expr_alloc_symbol((yyvsp[(1) - (1)].symbol)); }
     break;
 
   case 109:
 
-    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+    { (yyval.expr) = NULL; }
+
     break;
 
   case 110:
 
-    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[(1) - (3)].symbol), (yyvsp[(3) - (3)].symbol)); }
+    { (yyval.expr) = (yyvsp[0].expr); }
+
     break;
 
   case 111:
 
-    { (yyval.expr) = (yyvsp[(2) - (3)].expr); }
+    { (yyval.expr) = expr_alloc_symbol((yyvsp[0].symbol)); }
+
     break;
 
   case 112:
 
-    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[(2) - (2)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_LTH, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
     break;
 
   case 113:
 
-    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_LEQ, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
     break;
 
   case 114:
 
-    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[(1) - (3)].expr), (yyvsp[(3) - (3)].expr)); }
+    { (yyval.expr) = expr_alloc_comp(E_GTH, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
     break;
 
   case 115:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), 0); free((yyvsp[(1) - (1)].string)); }
+    { (yyval.expr) = expr_alloc_comp(E_GEQ, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
     break;
 
   case 116:
 
-    { (yyval.symbol) = sym_lookup((yyvsp[(1) - (1)].string), SYMBOL_CONST); free((yyvsp[(1) - (1)].string)); }
+    { (yyval.expr) = expr_alloc_comp(E_EQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
     break;
 
   case 117:
 
+    { (yyval.expr) = expr_alloc_comp(E_UNEQUAL, (yyvsp[-2].symbol), (yyvsp[0].symbol)); }
+
+    break;
+
+  case 118:
+
+    { (yyval.expr) = (yyvsp[-1].expr); }
+
+    break;
+
+  case 119:
+
+    { (yyval.expr) = expr_alloc_one(E_NOT, (yyvsp[0].expr)); }
+
+    break;
+
+  case 120:
+
+    { (yyval.expr) = expr_alloc_two(E_OR, (yyvsp[-2].expr), (yyvsp[0].expr)); }
+
+    break;
+
+  case 121:
+
+    { (yyval.expr) = expr_alloc_two(E_AND, (yyvsp[-2].expr), (yyvsp[0].expr)); }
+
+    break;
+
+  case 122:
+
+    { (yyval.symbol) = sym_lookup((yyvsp[0].string), 0); free((yyvsp[0].string)); }
+
+    break;
+
+  case 124:
+
+    { (yyval.symbol) = sym_lookup((yyvsp[0].string), SYMBOL_CONST); free((yyvsp[0].string)); }
+
+    break;
+
+  case 125:
+
     { (yyval.string) = NULL; }
+
     break;
 
 
@@ -2078,7 +2023,7 @@ yyreduce:
 
   *++yyvsp = yyval;
 
-  /* Now `shift' the result of the reduction.  Determine what state
+  /* Now 'shift' the result of the reduction.  Determine what state
      that goes to, based on the state we popped back to and the rule
      number reduced by.  */
 
@@ -2093,9 +2038,9 @@ yyreduce:
   goto yynewstate;
 
 
-/*------------------------------------.
-| yyerrlab -- here on detecting error |
-`------------------------------------*/
+/*--------------------------------------.
+| yyerrlab -- here on detecting error.  |
+`--------------------------------------*/
 yyerrlab:
   /* Make sure we have latest lookahead translation.  See comments at
      user semantic actions for why this is necessary.  */
@@ -2146,20 +2091,20 @@ yyerrlab:
   if (yyerrstatus == 3)
     {
       /* If just tried and failed to reuse lookahead token after an
-	 error, discard it.  */
+         error, discard it.  */
 
       if (yychar <= YYEOF)
-	{
-	  /* Return failure if at end of input.  */
-	  if (yychar == YYEOF)
-	    YYABORT;
-	}
+        {
+          /* Return failure if@end of input.  */
+          if (yychar == YYEOF)
+            YYABORT;
+        }
       else
-	{
-	  yydestruct ("Error: discarding",
-		      yytoken, &yylval);
-	  yychar = YYEMPTY;
-	}
+        {
+          yydestruct ("Error: discarding",
+                      yytoken, &yylval);
+          yychar = YYEMPTY;
+        }
     }
 
   /* Else will try to reuse lookahead token after shifting the error
@@ -2178,7 +2123,7 @@ yyerrorlab:
   if (/*CONSTCOND*/ 0)
      goto yyerrorlab;
 
-  /* Do not reclaim the symbols of the rule which action triggered
+  /* Do not reclaim the symbols of the rule whose action triggered
      this YYERROR.  */
   YYPOPSTACK (yylen);
   yylen = 0;
@@ -2191,35 +2136,37 @@ yyerrorlab:
 | yyerrlab1 -- common code for both syntax error and YYERROR.  |
 `-------------------------------------------------------------*/
 yyerrlab1:
-  yyerrstatus = 3;	/* Each real token shifted decrements this.  */
+  yyerrstatus = 3;      /* Each real token shifted decrements this.  */
 
   for (;;)
     {
       yyn = yypact[yystate];
       if (!yypact_value_is_default (yyn))
-	{
-	  yyn += YYTERROR;
-	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
-	    {
-	      yyn = yytable[yyn];
-	      if (0 < yyn)
-		break;
-	    }
-	}
+        {
+          yyn += YYTERROR;
+          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
+            {
+              yyn = yytable[yyn];
+              if (0 < yyn)
+                break;
+            }
+        }
 
       /* Pop the current state because it cannot handle the error token.  */
       if (yyssp == yyss)
-	YYABORT;
+        YYABORT;
 
 
       yydestruct ("Error: popping",
-		  yystos[yystate], yyvsp);
+                  yystos[yystate], yyvsp);
       YYPOPSTACK (1);
       yystate = *yyssp;
       YY_STACK_PRINT (yyss, yyssp);
     }
 
+  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
   *++yyvsp = yylval;
+  YY_IGNORE_MAYBE_UNINITIALIZED_END
 
 
   /* Shift the error token.  */
@@ -2243,7 +2190,7 @@ yyabortlab:
   yyresult = 1;
   goto yyreturn;
 
-#if !defined(yyoverflow) || YYERROR_VERBOSE
+#if !defined yyoverflow || YYERROR_VERBOSE
 /*-------------------------------------------------.
 | yyexhaustedlab -- memory exhaustion comes here.  |
 `-------------------------------------------------*/
@@ -2262,14 +2209,14 @@ yyreturn:
       yydestruct ("Cleanup: discarding lookahead",
                   yytoken, &yylval);
     }
-  /* Do not reclaim the symbols of the rule which action triggered
+  /* Do not reclaim the symbols of the rule whose action triggered
      this YYABORT or YYACCEPT.  */
   YYPOPSTACK (yylen);
   YY_STACK_PRINT (yyss, yyssp);
   while (yyssp != yyss)
     {
       yydestruct ("Cleanup: popping",
-		  yystos[*yyssp], yyvsp);
+                  yystos[*yyssp], yyvsp);
       YYPOPSTACK (1);
     }
 #ifndef yyoverflow
@@ -2280,16 +2227,14 @@ yyreturn:
   if (yymsg != yymsgbuf)
     YYSTACK_FREE (yymsg);
 #endif
-  /* Make sure YYID is used.  */
-  return YYID (yyresult);
+  return yyresult;
 }
 
 
 
-
-
 void conf_parse(const char *name)
 {
+	const char *tmp;
 	struct symbol *sym;
 	int i;
 
@@ -2297,25 +2242,26 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
-		zconfdebug = 1;
-	zconfparse();
-	if (zconfnerrs)
+		yydebug = 1;
+	yyparse();
+	if (yynerrs)
 		exit(1);
 	if (!modules_sym)
 		modules_sym = sym_find( "n" );
 
+	tmp = rootmenu.prompt->text;
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+	free((char*)tmp);
 
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-			zconfnerrs++;
-        }
-	if (zconfnerrs)
+			yynerrs++;
+	}
+	if (yynerrs)
 		exit(1);
 	sym_set_change_count(1);
 }
@@ -2339,17 +2285,17 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
-			kconf_id_strings + id->name, zconf_tokenname(starttoken));
-		zconfnerrs++;
+			id->name, zconf_tokenname(starttoken));
+		yynerrs++;
 		return false;
 	}
 	if (current_menu->file != current_file) {
 		zconf_error("'%s' in different file than '%s'",
-			kconf_id_strings + id->name, zconf_tokenname(starttoken));
+			id->name, zconf_tokenname(starttoken));
 		fprintf(stderr, "%s:%d: location of the '%s'\n",
 			current_menu->file->name, current_menu->lineno,
 			zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	return true;
@@ -2370,7 +2316,7 @@ static void zconf_error(const char *err, ...)
 {
 	va_list ap;
 
-	zconfnerrs++;
+	yynerrs++;
 	fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
 	va_start(ap, err);
 	vfprintf(stderr, err, ap);
@@ -2378,7 +2324,7 @@ static void zconf_error(const char *err, ...)
 	fprintf(stderr, "\n");
 }
 
-static void zconferror(const char *err)
+static void yyerror(const char *err)
 {
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
 }
@@ -2411,7 +2357,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 		fprintf(out, "\nconfig %s\n", sym->name);
 	switch (sym->type) {
 	case S_BOOLEAN:
-		fputs("  boolean\n", out);
+		fputs("  bool\n", out);
 		break;
 	case S_TRISTATE:
 		fputs("  tristate\n", out);
@@ -2459,6 +2405,11 @@ static void print_symbol(FILE *out, struct menu *menu)
 			expr_fprint(prop->expr, out);
 			fputc('\n', out);
 			break;
+		case P_IMPLY:
+			fputs( "  imply ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
 		case P_RANGE:
 			fputs( "  range ", out);
 			expr_fprint(prop->expr, out);
@@ -2535,4 +2486,3 @@ void zconfdump(FILE *out)
 #include "expr.c"
 #include "symbol.c"
 #include "menu.c"
-
diff --git a/support/kconfig/zconf.y b/support/kconfig/zconf.y
index 08ac041ff4..7b34de28a6 100644
--- a/support/kconfig/zconf.y
+++ b/support/kconfig/zconf.y
@@ -20,10 +20,10 @@
 
 int cdebug = PRINTD;
 
-extern int zconflex(void);
+int yylex(void);
+static void yyerror(const char *err);
 static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
-static void zconferror(const char *err);
 static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtoken);
 
 struct symbol *symbol_hash[SYMBOL_HASHSIZE];
@@ -31,7 +31,7 @@ struct symbol *symbol_hash[SYMBOL_HASHSIZE];
 static struct menu *current_menu, *current_entry;
 
 %}
-%expect 30
+%expect 32
 
 %union
 {
@@ -62,6 +62,7 @@ static struct menu *current_menu, *current_entry;
 %token <id>T_TYPE
 %token <id>T_DEFAULT
 %token <id>T_SELECT
+%token <id>T_IMPLY
 %token <id>T_RANGE
 %token <id>T_VISIBLE
 %token <id>T_OPTION
@@ -69,6 +70,10 @@ static struct menu *current_menu, *current_entry;
 %token <string> T_WORD
 %token <string> T_WORD_QUOTE
 %token T_UNEQUAL
+%token T_LESS
+%token T_LESS_EQUAL
+%token T_GREATER
+%token T_GREATER_EQUAL
 %token T_CLOSE_PAREN
 %token T_OPEN_PAREN
 %token T_EOL
@@ -76,9 +81,11 @@ static struct menu *current_menu, *current_entry;
 %left T_OR
 %left T_AND
 %left T_EQUAL T_UNEQUAL
+%left T_LESS T_LESS_EQUAL T_GREATER T_GREATER_EQUAL
 %nonassoc T_NOT
 
 %type <string> prompt
+%type <symbol> nonconst_symbol
 %type <symbol> symbol
 %type <expr> expr
 %type <expr> if_expr
@@ -95,14 +102,34 @@ static struct menu *current_menu, *current_entry;
 } if_entry menu_entry choice_entry
 
 %{
-/* Include zconf.hash.c here so it can see the token constants. */
-#include "zconf.hash.c"
+/* Include kconf_id.c here so it can see the token constants. */
+#include "kconf_id.c"
 %}
 
 %%
 input: nl start | start;
 
-start: mainmenu_stmt stmt_list | stmt_list;
+start: mainmenu_stmt stmt_list | no_mainmenu_stmt stmt_list;
+
+/* mainmenu entry */
+
+mainmenu_stmt: T_MAINMENU prompt nl
+{
+	menu_add_prompt(P_MENU, $2, NULL);
+};
+
+/* Default main menu, if there's no mainmenu entry */
+
+no_mainmenu_stmt: /* empty */
+{
+	/*
+	 * Hack: Keep the main menu title on the heap so we can safely free it
+	 * later regardless of whether it comes from the 'prompt' in
+	 * mainmenu_stmt or here
+	 */
+	menu_add_prompt(P_MENU, xstrdup("Buildroot Configuration"), NULL);
+};
+
 
 stmt_list:
 	  /* empty */
@@ -113,13 +140,13 @@ stmt_list:
 	| stmt_list T_WORD error T_EOL	{ zconf_error("unknown statement \"%s\"", $2); }
 	| stmt_list option_name error T_EOL
 {
-	zconf_error("unexpected option \"%s\"", kconf_id_strings + $2->name);
+	zconf_error("unexpected option \"%s\"", $2->name);
 }
 	| stmt_list error T_EOL		{ zconf_error("invalid statement"); }
 ;
 
 option_name:
-	T_DEPENDS | T_PROMPT | T_TYPE | T_SELECT | T_OPTIONAL | T_RANGE | T_DEFAULT | T_VISIBLE
+	T_DEPENDS | T_PROMPT | T_TYPE | T_SELECT | T_IMPLY | T_OPTIONAL | T_RANGE | T_DEFAULT | T_VISIBLE
 ;
 
 common_stmt:
@@ -139,26 +166,23 @@ option_error:
 
 /* config/menuconfig entry */
 
-config_entry_start: T_CONFIG T_WORD T_EOL
+config_entry_start: T_CONFIG nonconst_symbol T_EOL
 {
-	struct symbol *sym = sym_lookup($2, 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), $2);
+	$2->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry($2);
+	printd(DEBUG_PARSE, "%s:%d:config %s\n", zconf_curname(), zconf_lineno(), $2->name);
 };
 
 config_stmt: config_entry_start config_option_list
 {
-	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
 };
 
-menuconfig_entry_start: T_MENUCONFIG T_WORD T_EOL
+menuconfig_entry_start: T_MENUCONFIG nonconst_symbol T_EOL
 {
-	struct symbol *sym = sym_lookup($2, 0);
-	sym->flags |= SYMBOL_OPTIONAL;
-	menu_add_entry(sym);
-	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), $2);
+	$2->flags |= SYMBOL_OPTIONAL;
+	menu_add_entry($2);
+	printd(DEBUG_PARSE, "%s:%d:menuconfig %s\n", zconf_curname(), zconf_lineno(), $2->name);
 };
 
 menuconfig_stmt: menuconfig_entry_start config_option_list
@@ -167,7 +191,6 @@ menuconfig_stmt: menuconfig_entry_start config_option_list
 		current_entry->prompt->type = P_MENU;
 	else
 		zconfprint("warning: menuconfig statement without prompt");
-	menu_end_entry();
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", zconf_curname(), zconf_lineno());
 };
 
@@ -205,12 +228,18 @@ config_option: T_DEFAULT expr if_expr T_EOL
 		$1->stype);
 };
 
-config_option: T_SELECT T_WORD if_expr T_EOL
+config_option: T_SELECT nonconst_symbol if_expr T_EOL
 {
-	menu_add_symbol(P_SELECT, sym_lookup($2, 0), $3);
+	menu_add_symbol(P_SELECT, $2, $3);
 	printd(DEBUG_PARSE, "%s:%d:select\n", zconf_curname(), zconf_lineno());
 };
 
+config_option: T_IMPLY nonconst_symbol if_expr T_EOL
+{
+	menu_add_symbol(P_IMPLY, $2, $3);
+	printd(DEBUG_PARSE, "%s:%d:imply\n", zconf_curname(), zconf_lineno());
+};
+
 config_option: T_RANGE symbol symbol if_expr T_EOL
 {
 	menu_add_expr(P_RANGE, expr_alloc_comp(E_RANGE,$2, $3), $4);
@@ -225,8 +254,10 @@ symbol_option_list:
 	| symbol_option_list T_WORD symbol_option_arg
 {
 	const struct kconf_id *id = kconf_id_lookup($2, strlen($2));
-	if (id && id->flags & TF_OPTION)
+	if (id && id->flags & TF_OPTION) {
 		menu_add_option(id->token, $3);
+		free($3);
+	}
 	else
 		zconfprint("warning: ignoring unknown option %s", $2);
 	free($2);
@@ -245,6 +276,7 @@ choice: T_CHOICE word_opt T_EOL
 	sym->flags |= SYMBOL_AUTO;
 	menu_add_entry(sym);
 	menu_add_expr(P_CHOICE, NULL, NULL);
+	free($2);
 	printd(DEBUG_PARSE, "%s:%d:choice\n", zconf_curname(), zconf_lineno());
 };
 
@@ -296,10 +328,10 @@ choice_option: T_OPTIONAL T_EOL
 	printd(DEBUG_PARSE, "%s:%d:optional\n", zconf_curname(), zconf_lineno());
 };
 
-choice_option: T_DEFAULT T_WORD if_expr T_EOL
+choice_option: T_DEFAULT nonconst_symbol if_expr T_EOL
 {
 	if ($1->stype == S_UNKNOWN) {
-		menu_add_symbol(P_DEFAULT, sym_lookup($2, 0), $3);
+		menu_add_symbol(P_DEFAULT, $2, $3);
 		printd(DEBUG_PARSE, "%s:%d:default\n",
 			zconf_curname(), zconf_lineno());
 	} else
@@ -339,13 +371,6 @@ if_block:
 	| if_block choice_stmt
 ;
 
-/* mainmenu entry */
-
-mainmenu_stmt: T_MAINMENU prompt nl
-{
-	menu_add_prompt(P_MENU, $2, NULL);
-};
-
 /* menu entry */
 
 menu: T_MENU prompt T_EOL
@@ -382,6 +407,7 @@ source_stmt: T_SOURCE prompt T_EOL
 {
 	printd(DEBUG_PARSE, "%s:%d:source %s\n", zconf_curname(), zconf_lineno(), $2);
 	zconf_nextfile($2);
+	free($2);
 };
 
 /* comment entry */
@@ -394,9 +420,7 @@ comment: T_COMMENT prompt T_EOL
 };
 
 comment_stmt: comment depends_list
-{
-	menu_end_entry();
-};
+;
 
 /* help option */
 
@@ -408,6 +432,17 @@ help_start: T_HELP T_EOL
 
 help: help_start T_HELPTEXT
 {
+	if (current_entry->help) {
+		free(current_entry->help);
+		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
+			   current_entry->sym->name ?: "<choice>");
+	}
+
+	/* Is the help text empty or all whitespace? */
+	if ($2[strspn($2, " \f\n\r\t\v")] == '\0')
+		zconfprint("warning: '%s' defined with blank help text",
+			   current_entry->sym->name ?: "<choice>");
+
 	current_entry->help = $2;
 };
 
@@ -467,6 +502,10 @@ if_expr:  /* empty */			{ $$ = NULL; }
 ;
 
 expr:	  symbol				{ $$ = expr_alloc_symbol($1); }
+	| symbol T_LESS symbol			{ $$ = expr_alloc_comp(E_LTH, $1, $3); }
+	| symbol T_LESS_EQUAL symbol		{ $$ = expr_alloc_comp(E_LEQ, $1, $3); }
+	| symbol T_GREATER symbol		{ $$ = expr_alloc_comp(E_GTH, $1, $3); }
+	| symbol T_GREATER_EQUAL symbol		{ $$ = expr_alloc_comp(E_GEQ, $1, $3); }
 	| symbol T_EQUAL symbol			{ $$ = expr_alloc_comp(E_EQUAL, $1, $3); }
 	| symbol T_UNEQUAL symbol		{ $$ = expr_alloc_comp(E_UNEQUAL, $1, $3); }
 	| T_OPEN_PAREN expr T_CLOSE_PAREN	{ $$ = $2; }
@@ -475,7 +514,10 @@ expr:	  symbol				{ $$ = expr_alloc_symbol($1); }
 	| expr T_AND expr			{ $$ = expr_alloc_two(E_AND, $1, $3); }
 ;
 
-symbol:	  T_WORD	{ $$ = sym_lookup($1, 0); free($1); }
+/* For symbol definitions, selects, etc., where quotes are not accepted */
+nonconst_symbol: T_WORD { $$ = sym_lookup($1, 0); free($1); };
+
+symbol:	  nonconst_symbol
 	| T_WORD_QUOTE	{ $$ = sym_lookup($1, SYMBOL_CONST); free($1); }
 ;
 
@@ -486,6 +528,7 @@ word_opt: /* empty */			{ $$ = NULL; }
 
 void conf_parse(const char *name)
 {
+	const char *tmp;
 	struct symbol *sym;
 	int i;
 
@@ -493,25 +536,26 @@ void conf_parse(const char *name)
 
 	sym_init();
 	_menu_init();
-	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
 
 	if (getenv("ZCONF_DEBUG"))
-		zconfdebug = 1;
-	zconfparse();
-	if (zconfnerrs)
+		yydebug = 1;
+	yyparse();
+	if (yynerrs)
 		exit(1);
 	if (!modules_sym)
 		modules_sym = sym_find( "n" );
 
+	tmp = rootmenu.prompt->text;
 	rootmenu.prompt->text = _(rootmenu.prompt->text);
 	rootmenu.prompt->text = sym_expand_string_value(rootmenu.prompt->text);
+	free((char*)tmp);
 
 	menu_finalize(&rootmenu);
 	for_all_symbols(i, sym) {
 		if (sym_check_deps(sym))
-			zconfnerrs++;
-        }
-	if (zconfnerrs)
+			yynerrs++;
+	}
+	if (yynerrs)
 		exit(1);
 	sym_set_change_count(1);
 }
@@ -535,17 +579,17 @@ static bool zconf_endtoken(const struct kconf_id *id, int starttoken, int endtok
 {
 	if (id->token != endtoken) {
 		zconf_error("unexpected '%s' within %s block",
-			kconf_id_strings + id->name, zconf_tokenname(starttoken));
-		zconfnerrs++;
+			id->name, zconf_tokenname(starttoken));
+		yynerrs++;
 		return false;
 	}
 	if (current_menu->file != current_file) {
 		zconf_error("'%s' in different file than '%s'",
-			kconf_id_strings + id->name, zconf_tokenname(starttoken));
+			id->name, zconf_tokenname(starttoken));
 		fprintf(stderr, "%s:%d: location of the '%s'\n",
 			current_menu->file->name, current_menu->lineno,
 			zconf_tokenname(starttoken));
-		zconfnerrs++;
+		yynerrs++;
 		return false;
 	}
 	return true;
@@ -566,7 +610,7 @@ static void zconf_error(const char *err, ...)
 {
 	va_list ap;
 
-	zconfnerrs++;
+	yynerrs++;
 	fprintf(stderr, "%s:%d: ", zconf_curname(), zconf_lineno());
 	va_start(ap, err);
 	vfprintf(stderr, err, ap);
@@ -574,7 +618,7 @@ static void zconf_error(const char *err, ...)
 	fprintf(stderr, "\n");
 }
 
-static void zconferror(const char *err)
+static void yyerror(const char *err)
 {
 	fprintf(stderr, "%s:%d: %s\n", zconf_curname(), zconf_lineno() + 1, err);
 }
@@ -607,7 +651,7 @@ static void print_symbol(FILE *out, struct menu *menu)
 		fprintf(out, "\nconfig %s\n", sym->name);
 	switch (sym->type) {
 	case S_BOOLEAN:
-		fputs("  boolean\n", out);
+		fputs("  bool\n", out);
 		break;
 	case S_TRISTATE:
 		fputs("  tristate\n", out);
@@ -655,6 +699,11 @@ static void print_symbol(FILE *out, struct menu *menu)
 			expr_fprint(prop->expr, out);
 			fputc('\n', out);
 			break;
+		case P_IMPLY:
+			fputs( "  imply ", out);
+			expr_fprint(prop->expr, out);
+			fputc('\n', out);
+			break;
 		case P_RANGE:
 			fputs( "  range ", out);
 			expr_fprint(prop->expr, out);
-- 
2.16.3
