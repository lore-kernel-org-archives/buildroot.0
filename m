From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 14:04:55 +0200
Subject: [Buildroot] [PATCH 03/11] Clean up our patches against kconfig
In-Reply-To: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283342666.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7c524dd0b683e1e8fac4e4084ac7678576bfbe07.1283342666.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our kconfig-to-buildroot2.patch hasn't been kept up to date with all
the changes made into package/config, and a single patch wasn't very
practical to maintain all our changes. Therefore, this commit adds a
package/config/patches directory, which contains a Quilt series of
patches that correspond to our modifications to the kconfig mechanism.

The huge kconfig-to-buildroot2.patch has been split into 16 smaller
patches. The purpose of some of the modifications has been clearly
identified, while some others were not identified.

The 16 patches together do match exactly the old
kconfig-to-buildroot2.patch. We have been very careful in making sure
that we wouldn't loose any of our modifications.

The only modifications made are :

 * Instead of renaming the kernel Makefile to Makefile.kconfig and
   naming the Buildroot Makefile just 'Makefile', we instead keep the
   original package/config/Makefile from the kernel
   scripts/kconfig/Makefile and name the Buildroot Makefile
   package/config/Makefile.br. The main Buildroot Makefile is modified
   accordingly.

 * The documentation README.buildroot2 is updated to explain how to
   upgrade to a newer version of scripts/kconfig.

 * The kconfig-language.txt documentation is removed, as anybody can
   easily find it in the kernel sources so there's no need to
   duplicate it here.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |    2 +-
 package/config/Makefile                            |  356 +++++++--
 package/config/Makefile.br                         |   53 ++
 package/config/Makefile.kconfig                    |  303 -------
 package/config/README.buildroot2                   |   14 +-
 package/config/kconfig-language.txt                |  379 --------
 package/config/kconfig-to-buildroot2.patch         |  917 --------------------
 .../patches/01-kconfig-kernel-to-buildroot.patch   |  299 +++++++
 .../patches/02-cpp-comments-to-c-comments.patch    |  178 ++++
 .../patches/03-change-config-option-prefix.patch   |  176 ++++
 .../config/patches/04-fedora-13-build-fix.patch    |   17 +
 .../patches/05-really-clean-everything.patch       |   28 +
 .../patches/06-br-build-system-integration.patch   |   33 +
 .../config/patches/07-minor-makefile-fixes.patch   |   26 +
 package/config/patches/08-make-write-deps.patch    |  139 +++
 .../patches/09-implement-kconfig-probability.patch |   43 +
 package/config/patches/10-br-build-system.patch    |   80 ++
 .../patches/11-use-mktemp-for-lxdialog.patch       |   17 +
 .../config/patches/12-fix-glade-file-path.patch    |   17 +
 .../patches/13-use-conf-write-autoconf.patch       |   53 ++
 .../patches/14-support-out-of-tree-config.patch    |  253 ++++++
 package/config/patches/15-misc-qconf-changes.patch |  175 ++++
 .../config/patches/16-non-identified-changes.patch |   47 +
 package/config/patches/series                      |   16 +
 24 files changed, 1960 insertions(+), 1661 deletions(-)
 create mode 100644 package/config/Makefile.br
 delete mode 100644 package/config/Makefile.kconfig
 delete mode 100644 package/config/kconfig-language.txt
 delete mode 100644 package/config/kconfig-to-buildroot2.patch
 create mode 100644 package/config/patches/01-kconfig-kernel-to-buildroot.patch
 create mode 100644 package/config/patches/02-cpp-comments-to-c-comments.patch
 create mode 100644 package/config/patches/03-change-config-option-prefix.patch
 create mode 100644 package/config/patches/04-fedora-13-build-fix.patch
 create mode 100644 package/config/patches/05-really-clean-everything.patch
 create mode 100644 package/config/patches/06-br-build-system-integration.patch
 create mode 100644 package/config/patches/07-minor-makefile-fixes.patch
 create mode 100644 package/config/patches/08-make-write-deps.patch
 create mode 100644 package/config/patches/09-implement-kconfig-probability.patch
 create mode 100644 package/config/patches/10-br-build-system.patch
 create mode 100644 package/config/patches/11-use-mktemp-for-lxdialog.patch
 create mode 100644 package/config/patches/12-fix-glade-file-path.patch
 create mode 100644 package/config/patches/13-use-conf-write-autoconf.patch
 create mode 100644 package/config/patches/14-support-out-of-tree-config.patch
 create mode 100644 package/config/patches/15-misc-qconf-changes.patch
 create mode 100644 package/config/patches/16-non-identified-changes.patch
 create mode 100644 package/config/patches/series

diff --git a/Makefile b/Makefile
index 2b5780d..73d9335 100644
--- a/Makefile
+++ b/Makefile
@@ -463,7 +463,7 @@ export HOSTCFLAGS
 
 $(BUILD_DIR)/buildroot-config/%onf:
 	mkdir -p $(@D)/lxdialog
-	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) $(@F)
+	$(MAKE) CC="$(HOSTCC)" obj=$(@D) -C $(CONFIG) -f Makefile.br $(@F)
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf
 	@mkdir -p $(BUILD_DIR)/buildroot-config
diff --git a/package/config/Makefile b/package/config/Makefile
index 2b266b8..f269348 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -1,53 +1,303 @@
-src := .
-top_srcdir=../../
-top_builddir=../../
-srctree := .
-obj ?= .
-
-include Makefile.kconfig
-#HOSTCFLAGS+=-Dinline="" -include foo.h
--include $(obj)/.depend
-$(obj)/.depend: $(wildcard *.h *.c)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > $@ 2>/dev/null || :
-
-__hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
-host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
-host-cmulti := $(foreach m,$(__hostprogs),\
-           $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
-host-cxxmulti := $(foreach m,$(__hostprogs),\
-           $(if $($(m)-cxxobjs),$(m),$(if $($(m)-objs),)))
-host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
-host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
-
-HOST_EXTRACFLAGS += -I$(obj)
-
-$(host-csingle): %: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
-
-$(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
-
-$(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
-	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
-
-$(obj)/%.o: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
-
-$(obj)/%.o: $(obj)/%.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
-
-$(obj)/%.o: %.cc
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$(@F)) -c $< -o $@
-
-$(obj)/%:: $(src)/%_shipped
-	$(Q)cat $< > $@
-
-clean:
-	$(Q)rm -f $(addprefix $(obj)/,$(clean-files))
-distclean: clean
-	$(Q)rm -f $(addprefix $(obj)/,$(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
-		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
-		mconf .depend)
-
-FORCE:
-.PHONY: FORCE clean distclean
+# ===========================================================================
+# Kernel configuration targets
+# These targets are used from top-level makefile
+
+PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config
+
+ifdef KBUILD_KCONFIG
+Kconfig := $(KBUILD_KCONFIG)
+else
+Kconfig := arch/$(SRCARCH)/Kconfig
+endif
+
+xconfig: $(obj)/qconf
+	$< $(Kconfig)
+
+gconfig: $(obj)/gconf
+	$< $(Kconfig)
+
+menuconfig: $(obj)/mconf
+	$< $(Kconfig)
+
+config: $(obj)/conf
+	$< $(Kconfig)
+
+oldconfig: $(obj)/conf
+	$< -o $(Kconfig)
+
+silentoldconfig: $(obj)/conf
+	$< -s $(Kconfig)
+
+# Create new linux.pot file
+# Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
+# The symlink is used to repair a deficiency in arch/um
+update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
+	$(Q)echo "  GEN config"
+	$(Q)xgettext --default-domain=linux              \
+	    --add-comments --keyword=_ --keyword=N_      \
+	    --from-code=UTF-8                            \
+	    --files-from=scripts/kconfig/POTFILES.in     \
+	    --output $(obj)/config.pot
+	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
+	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
+	$(Q)(for i in `ls arch/*/Kconfig`;               \
+	    do                                           \
+		echo "  GEN $$i";                        \
+		$(obj)/kxgettext $$i                     \
+		     >> $(obj)/config.pot;               \
+	    done )
+	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
+	    --output $(obj)/linux.pot
+	$(Q)rm -f arch/um/Kconfig.arch
+	$(Q)rm -f $(obj)/config.pot
+
+PHONY += randconfig allyesconfig allnoconfig allmodconfig defconfig
+
+randconfig: $(obj)/conf
+	$< -r $(Kconfig)
+
+allyesconfig: $(obj)/conf
+	$< -y $(Kconfig)
+
+allnoconfig: $(obj)/conf
+	$< -n $(Kconfig)
+
+allmodconfig: $(obj)/conf
+	$< -m $(Kconfig)
+
+defconfig: $(obj)/conf
+ifeq ($(KBUILD_DEFCONFIG),)
+	$< -d $(Kconfig)
+else
+	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
+	$(Q)$< -D arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+endif
+
+%_defconfig: $(obj)/conf
+	$(Q)$< -D arch/$(SRCARCH)/configs/$@ $(Kconfig)
+
+# Help text used by make help
+help:
+	@echo  '  config	  - Update current config utilising a line-oriented program'
+	@echo  '  menuconfig	  - Update current config utilising a menu based program'
+	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
+	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
+	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
+	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
+	@echo  '  randconfig	  - New config with random answer to all options'
+	@echo  '  defconfig	  - New config with default answer to all options'
+	@echo  '  allmodconfig	  - New config selecting modules when possible'
+	@echo  '  allyesconfig	  - New config where all options are accepted with yes'
+	@echo  '  allnoconfig	  - New config where all options are answered with no'
+
+# lxdialog stuff
+check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
+
+# Use recursively expanded variables so we do not call gcc unless
+# we really need to do so. (Do not call gcc as part of make mrproper)
+HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
+HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+
+HOST_EXTRACFLAGS += -DLOCALE
+
+
+# ===========================================================================
+# Shared Makefile for the various kconfig executables:
+# conf:	  Used for defconfig, oldconfig and related targets
+# mconf:  Used for the menuconfig target
+#         Utilizes the lxdialog package
+# qconf:  Used for the xconfig target
+#         Based on QT which needs to be installed to compile it
+# gconf:  Used for the gconfig target
+#         Based on GTK which needs to be installed to compile it
+# object files used by all kconfig flavours
+
+lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
+lxdialog += lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
+
+conf-objs	:= conf.o  zconf.tab.o
+mconf-objs	:= mconf.o zconf.tab.o $(lxdialog)
+kxgettext-objs	:= kxgettext.o zconf.tab.o
+
+hostprogs-y := conf qconf gconf kxgettext
+
+ifeq ($(MAKECMDGOALS),menuconfig)
+	hostprogs-y += mconf
+endif
+ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
+       hostprogs-y += mconf
+endif
+
+ifeq ($(MAKECMDGOALS),xconfig)
+	qconf-target := 1
+endif
+ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
+	qconf-target := 1
+endif
+
+ifeq ($(MAKECMDGOALS),gconfig)
+	gconf-target := 1
+endif
+ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
+	gconf-target := 1
+endif
+
+ifeq ($(qconf-target),1)
+qconf-cxxobjs	:= qconf.o
+qconf-objs	:= kconfig_load.o zconf.tab.o
+endif
+
+ifeq ($(gconf-target),1)
+gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
+endif
+
+clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
+               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+clean-files += config.pot linux.pot
+clean-files += conf $(conf-objs)
+clean-files += mconf $(mconf-objs)
+clean-files += qconf qconf.o
+clean-files += gconf gconf.o
+clean-files += kconfig_load.o zconf.tab.o
+clean-files += $(kxgettext-objs)
+
+# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
+PHONY += $(obj)/dochecklxdialog
+$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
+$(obj)/dochecklxdialog:
+	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOST_LOADLIBES)
+
+always := dochecklxdialog
+
+# Add environment specific flags
+HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
+
+# generated files seem to need this to find local include files
+HOSTCFLAGS_lex.zconf.o	:= -I$(src)
+HOSTCFLAGS_zconf.tab.o	:= -I$(src)
+
+HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
+HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
+
+HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
+HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
+                          -D LKC_DIRECT_LINK
+
+$(obj)/qconf.o: $(obj)/.tmp_qtcheck
+
+ifeq ($(qconf-target),1)
+$(obj)/.tmp_qtcheck: $(src)/Makefile
+-include $(obj)/.tmp_qtcheck
+
+# QT needs some extra effort...
+$(obj)/.tmp_qtcheck:
+	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
+	pkg-config --exists qt 2> /dev/null && pkg=qt; \
+	pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
+	if [ -n "$$pkg" ]; then \
+	  cflags="\$$(shell pkg-config $$pkg --cflags)"; \
+	  libs="\$$(shell pkg-config $$pkg --libs)"; \
+	  moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
+	  dir="$$(pkg-config $$pkg --variable=prefix)"; \
+	else \
+	  for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
+	    if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
+	  done; \
+	  if [ -z "$$dir" ]; then \
+	    echo "*"; \
+	    echo "* Unable to find the QT3 installation. Please make sure that"; \
+	    echo "* the QT3 development package is correctly installed and"; \
+	    echo "* either install pkg-config or set the QTDIR environment"; \
+	    echo "* variable to the correct location."; \
+	    echo "*"; \
+	    false; \
+	  fi; \
+	  libpath=$$dir/lib; lib=qt; osdir=""; \
+	  $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
+	    osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
+	  test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
+	  test -f $$libpath/libqt-mt.so && lib=qt-mt; \
+	  cflags="-I$$dir/include"; \
+	  libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
+	  moc="$$dir/bin/moc"; \
+	fi; \
+	if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
+	  echo "*"; \
+	  echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
+	  echo "*"; \
+	  moc="/usr/bin/moc"; \
+	fi; \
+	echo "KC_QT_CFLAGS=$$cflags" > $@; \
+	echo "KC_QT_LIBS=$$libs" >> $@; \
+	echo "KC_QT_MOC=$$moc" >> $@
+endif
+
+$(obj)/gconf.o: $(obj)/.tmp_gtkcheck
+
+ifeq ($(gconf-target),1)
+-include $(obj)/.tmp_gtkcheck
+
+# GTK needs some extra effort, too...
+$(obj)/.tmp_gtkcheck:
+	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
+		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
+			touch $@;								\
+		else									\
+			echo "*"; 							\
+			echo "* GTK+ is present but version >= 2.0.0 is required.";	\
+			echo "*";							\
+			false;								\
+		fi									\
+	else										\
+		echo "*"; 								\
+		echo "* Unable to find the GTK+ installation. Please make sure that"; 	\
+		echo "* the GTK+ 2.0 development package is correctly installed..."; 	\
+		echo "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
+		echo "*"; 								\
+		false;									\
+	fi
+endif
+
+$(obj)/zconf.tab.o: $(obj)/lex.zconf.c $(obj)/zconf.hash.c
+
+$(obj)/kconfig_load.o: $(obj)/lkc_defs.h
+
+$(obj)/qconf.o: $(obj)/qconf.moc $(obj)/lkc_defs.h
+
+$(obj)/gconf.o: $(obj)/lkc_defs.h
+
+$(obj)/%.moc: $(src)/%.h
+	$(KC_QT_MOC) -i $< -o $@
+
+$(obj)/lkc_defs.h: $(src)/lkc_proto.h
+	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
+
+# Extract gconf menu items for I18N support
+$(obj)/gconf.glade.h: $(obj)/gconf.glade
+	intltool-extract --type=gettext/glade $(obj)/gconf.glade
+
+###
+# The following requires flex/bison/gperf
+# By default we use the _shipped versions, uncomment the following line if
+# you are modifying the flex/bison src.
+# LKC_GENPARSER := 1
+
+ifdef LKC_GENPARSER
+
+$(obj)/zconf.tab.c: $(src)/zconf.y
+$(obj)/lex.zconf.c: $(src)/zconf.l
+$(obj)/zconf.hash.c: $(src)/zconf.gperf
+
+%.tab.c: %.y
+	bison -l -b $* -p $(notdir $*) $<
+	cp $@ $@_shipped
+
+lex.%.c: %.l
+	flex -L -P$(notdir $*) -o$@ $<
+	cp $@ $@_shipped
+
+%.hash.c: %.gperf
+	gperf < $< > $@
+	cp $@ $@_shipped
+
+endif
diff --git a/package/config/Makefile.br b/package/config/Makefile.br
new file mode 100644
index 0000000..c24b6b5
--- /dev/null
+++ b/package/config/Makefile.br
@@ -0,0 +1,53 @@
+src := .
+top_srcdir=../../
+top_builddir=../../
+srctree := .
+obj ?= .
+
+include Makefile
+#HOSTCFLAGS+=-Dinline="" -include foo.h
+-include $(obj)/.depend
+$(obj)/.depend: $(wildcard *.h *.c)
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > $@ 2>/dev/null || :
+
+__hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
+host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
+host-cmulti := $(foreach m,$(__hostprogs),\
+           $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
+host-cxxmulti := $(foreach m,$(__hostprogs),\
+           $(if $($(m)-cxxobjs),$(m),$(if $($(m)-objs),)))
+host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
+host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
+
+HOST_EXTRACFLAGS += -I$(obj)
+
+$(host-csingle): %: %.c
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
+
+$(host-cmulti): %: $(host-cobjs) $(host-cshlib)
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
+
+$(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
+	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
+
+$(obj)/%.o: %.c
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
+
+$(obj)/%.o: $(obj)/%.c
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
+
+$(obj)/%.o: %.cc
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$(@F)) -c $< -o $@
+
+$(obj)/%:: $(src)/%_shipped
+	$(Q)cat $< > $@
+
+clean:
+	$(Q)rm -f $(addprefix $(obj)/,$(clean-files))
+distclean: clean
+	$(Q)rm -f $(addprefix $(obj)/,$(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
+		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
+		mconf .depend)
+
+FORCE:
+.PHONY: FORCE clean distclean
diff --git a/package/config/Makefile.kconfig b/package/config/Makefile.kconfig
deleted file mode 100644
index f269348..0000000
--- a/package/config/Makefile.kconfig
+++ /dev/null
@@ -1,303 +0,0 @@
-# ===========================================================================
-# Kernel configuration targets
-# These targets are used from top-level makefile
-
-PHONY += oldconfig xconfig gconfig menuconfig config silentoldconfig update-po-config
-
-ifdef KBUILD_KCONFIG
-Kconfig := $(KBUILD_KCONFIG)
-else
-Kconfig := arch/$(SRCARCH)/Kconfig
-endif
-
-xconfig: $(obj)/qconf
-	$< $(Kconfig)
-
-gconfig: $(obj)/gconf
-	$< $(Kconfig)
-
-menuconfig: $(obj)/mconf
-	$< $(Kconfig)
-
-config: $(obj)/conf
-	$< $(Kconfig)
-
-oldconfig: $(obj)/conf
-	$< -o $(Kconfig)
-
-silentoldconfig: $(obj)/conf
-	$< -s $(Kconfig)
-
-# Create new linux.pot file
-# Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
-# The symlink is used to repair a deficiency in arch/um
-update-po-config: $(obj)/kxgettext $(obj)/gconf.glade.h
-	$(Q)echo "  GEN config"
-	$(Q)xgettext --default-domain=linux              \
-	    --add-comments --keyword=_ --keyword=N_      \
-	    --from-code=UTF-8                            \
-	    --files-from=scripts/kconfig/POTFILES.in     \
-	    --output $(obj)/config.pot
-	$(Q)sed -i s/CHARSET/UTF-8/ $(obj)/config.pot
-	$(Q)ln -fs Kconfig.i386 arch/um/Kconfig.arch
-	$(Q)(for i in `ls arch/*/Kconfig`;               \
-	    do                                           \
-		echo "  GEN $$i";                        \
-		$(obj)/kxgettext $$i                     \
-		     >> $(obj)/config.pot;               \
-	    done )
-	$(Q)msguniq --sort-by-file --to-code=UTF-8 $(obj)/config.pot \
-	    --output $(obj)/linux.pot
-	$(Q)rm -f arch/um/Kconfig.arch
-	$(Q)rm -f $(obj)/config.pot
-
-PHONY += randconfig allyesconfig allnoconfig allmodconfig defconfig
-
-randconfig: $(obj)/conf
-	$< -r $(Kconfig)
-
-allyesconfig: $(obj)/conf
-	$< -y $(Kconfig)
-
-allnoconfig: $(obj)/conf
-	$< -n $(Kconfig)
-
-allmodconfig: $(obj)/conf
-	$< -m $(Kconfig)
-
-defconfig: $(obj)/conf
-ifeq ($(KBUILD_DEFCONFIG),)
-	$< -d $(Kconfig)
-else
-	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
-	$(Q)$< -D arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
-endif
-
-%_defconfig: $(obj)/conf
-	$(Q)$< -D arch/$(SRCARCH)/configs/$@ $(Kconfig)
-
-# Help text used by make help
-help:
-	@echo  '  config	  - Update current config utilising a line-oriented program'
-	@echo  '  menuconfig	  - Update current config utilising a menu based program'
-	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
-	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
-	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
-	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
-	@echo  '  randconfig	  - New config with random answer to all options'
-	@echo  '  defconfig	  - New config with default answer to all options'
-	@echo  '  allmodconfig	  - New config selecting modules when possible'
-	@echo  '  allyesconfig	  - New config where all options are accepted with yes'
-	@echo  '  allnoconfig	  - New config where all options are answered with no'
-
-# lxdialog stuff
-check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
-
-# Use recursively expanded variables so we do not call gcc unless
-# we really need to do so. (Do not call gcc as part of make mrproper)
-HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
-HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
-
-HOST_EXTRACFLAGS += -DLOCALE
-
-
-# ===========================================================================
-# Shared Makefile for the various kconfig executables:
-# conf:	  Used for defconfig, oldconfig and related targets
-# mconf:  Used for the menuconfig target
-#         Utilizes the lxdialog package
-# qconf:  Used for the xconfig target
-#         Based on QT which needs to be installed to compile it
-# gconf:  Used for the gconfig target
-#         Based on GTK which needs to be installed to compile it
-# object files used by all kconfig flavours
-
-lxdialog := lxdialog/checklist.o lxdialog/util.o lxdialog/inputbox.o
-lxdialog += lxdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o
-
-conf-objs	:= conf.o  zconf.tab.o
-mconf-objs	:= mconf.o zconf.tab.o $(lxdialog)
-kxgettext-objs	:= kxgettext.o zconf.tab.o
-
-hostprogs-y := conf qconf gconf kxgettext
-
-ifeq ($(MAKECMDGOALS),menuconfig)
-	hostprogs-y += mconf
-endif
-ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-       hostprogs-y += mconf
-endif
-
-ifeq ($(MAKECMDGOALS),xconfig)
-	qconf-target := 1
-endif
-ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
-	qconf-target := 1
-endif
-
-ifeq ($(MAKECMDGOALS),gconfig)
-	gconf-target := 1
-endif
-ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
-	gconf-target := 1
-endif
-
-ifeq ($(qconf-target),1)
-qconf-cxxobjs	:= qconf.o
-qconf-objs	:= kconfig_load.o zconf.tab.o
-endif
-
-ifeq ($(gconf-target),1)
-gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
-endif
-
-clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
-               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
-clean-files += config.pot linux.pot
-clean-files += conf $(conf-objs)
-clean-files += mconf $(mconf-objs)
-clean-files += qconf qconf.o
-clean-files += gconf gconf.o
-clean-files += kconfig_load.o zconf.tab.o
-clean-files += $(kxgettext-objs)
-
-# Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
-PHONY += $(obj)/dochecklxdialog
-$(addprefix $(obj)/,$(lxdialog)): $(obj)/dochecklxdialog
-$(obj)/dochecklxdialog:
-	$(Q)$(CONFIG_SHELL) $(check-lxdialog) -check $(HOSTCC) $(HOST_EXTRACFLAGS) $(HOST_LOADLIBES)
-
-always := dochecklxdialog
-
-# Add environment specific flags
-HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/$(src)/check.sh $(HOSTCC) $(HOSTCFLAGS))
-
-# generated files seem to need this to find local include files
-HOSTCFLAGS_lex.zconf.o	:= -I$(src)
-HOSTCFLAGS_zconf.tab.o	:= -I$(src)
-
-HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
-HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
-
-HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
-HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
-                          -D LKC_DIRECT_LINK
-
-$(obj)/qconf.o: $(obj)/.tmp_qtcheck
-
-ifeq ($(qconf-target),1)
-$(obj)/.tmp_qtcheck: $(src)/Makefile
--include $(obj)/.tmp_qtcheck
-
-# QT needs some extra effort...
-$(obj)/.tmp_qtcheck:
-	@set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
-	pkg-config --exists qt 2> /dev/null && pkg=qt; \
-	pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
-	if [ -n "$$pkg" ]; then \
-	  cflags="\$$(shell pkg-config $$pkg --cflags)"; \
-	  libs="\$$(shell pkg-config $$pkg --libs)"; \
-	  moc="\$$(shell pkg-config $$pkg --variable=prefix)/bin/moc"; \
-	  dir="$$(pkg-config $$pkg --variable=prefix)"; \
-	else \
-	  for d in $$QTDIR /usr/share/qt* /usr/lib/qt*; do \
-	    if [ -f $$d/include/qconfig.h ]; then dir=$$d; break; fi; \
-	  done; \
-	  if [ -z "$$dir" ]; then \
-	    echo "*"; \
-	    echo "* Unable to find the QT3 installation. Please make sure that"; \
-	    echo "* the QT3 development package is correctly installed and"; \
-	    echo "* either install pkg-config or set the QTDIR environment"; \
-	    echo "* variable to the correct location."; \
-	    echo "*"; \
-	    false; \
-	  fi; \
-	  libpath=$$dir/lib; lib=qt; osdir=""; \
-	  $(HOSTCXX) -print-multi-os-directory > /dev/null 2>&1 && \
-	    osdir=x$$($(HOSTCXX) -print-multi-os-directory); \
-	  test -d $$libpath/$$osdir && libpath=$$libpath/$$osdir; \
-	  test -f $$libpath/libqt-mt.so && lib=qt-mt; \
-	  cflags="-I$$dir/include"; \
-	  libs="-L$$libpath -Wl,-rpath,$$libpath -l$$lib"; \
-	  moc="$$dir/bin/moc"; \
-	fi; \
-	if [ ! -x $$dir/bin/moc -a -x /usr/bin/moc ]; then \
-	  echo "*"; \
-	  echo "* Unable to find $$dir/bin/moc, using /usr/bin/moc instead."; \
-	  echo "*"; \
-	  moc="/usr/bin/moc"; \
-	fi; \
-	echo "KC_QT_CFLAGS=$$cflags" > $@; \
-	echo "KC_QT_LIBS=$$libs" >> $@; \
-	echo "KC_QT_MOC=$$moc" >> $@
-endif
-
-$(obj)/gconf.o: $(obj)/.tmp_gtkcheck
-
-ifeq ($(gconf-target),1)
--include $(obj)/.tmp_gtkcheck
-
-# GTK needs some extra effort, too...
-$(obj)/.tmp_gtkcheck:
-	@if `pkg-config --exists gtk+-2.0 gmodule-2.0 libglade-2.0`; then		\
-		if `pkg-config --atleast-version=2.0.0 gtk+-2.0`; then			\
-			touch $@;								\
-		else									\
-			echo "*"; 							\
-			echo "* GTK+ is present but version >= 2.0.0 is required.";	\
-			echo "*";							\
-			false;								\
-		fi									\
-	else										\
-		echo "*"; 								\
-		echo "* Unable to find the GTK+ installation. Please make sure that"; 	\
-		echo "* the GTK+ 2.0 development package is correctly installed..."; 	\
-		echo "* You need gtk+-2.0, glib-2.0 and libglade-2.0."; 		\
-		echo "*"; 								\
-		false;									\
-	fi
-endif
-
-$(obj)/zconf.tab.o: $(obj)/lex.zconf.c $(obj)/zconf.hash.c
-
-$(obj)/kconfig_load.o: $(obj)/lkc_defs.h
-
-$(obj)/qconf.o: $(obj)/qconf.moc $(obj)/lkc_defs.h
-
-$(obj)/gconf.o: $(obj)/lkc_defs.h
-
-$(obj)/%.moc: $(src)/%.h
-	$(KC_QT_MOC) -i $< -o $@
-
-$(obj)/lkc_defs.h: $(src)/lkc_proto.h
-	sed < $< > $@ 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
-
-# Extract gconf menu items for I18N support
-$(obj)/gconf.glade.h: $(obj)/gconf.glade
-	intltool-extract --type=gettext/glade $(obj)/gconf.glade
-
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
diff --git a/package/config/README.buildroot2 b/package/config/README.buildroot2
index bd44790..22c50fe 100644
--- a/package/config/README.buildroot2
+++ b/package/config/README.buildroot2
@@ -1,16 +1,12 @@
-This is a copy of the kconfig code in the kernel (currently 2.6.24.4) tweaked
+This is a copy of the kconfig code in the kernel (currently 2.6.30) tweaked
 to suit Buildroot.
 
 To update:
 	cp -r /usr/src/linux/scripts/kconfig package/config.new
 	cd package/config.new
-	cp /usr/src/linux/Documentation/kbuild/kconfig-language.txt .
-	patch -p1 < ../config/kconfig-to-buildroot2.patch
-	mv Makefile Makefile.kconfig
-	cp ../config/README.buildroot2 .
-	cp ../config/foo.h .
-	cp ../config/Makefile .
-	cp ../config/kconfig-to-buildroot2.patch .
+	cp -a ../config/patches ../config/README.buildroot2 .
+	quilt push -a
+	# Fix any conflict
 	cd ..
 	rm -rf config
 	mv config.new config
@@ -19,4 +15,6 @@ Then verify the toplevel targets work:
 	config
 	defconfig
 	menuconfig
+	xconfig
+	gconfig
 	oldconfig
diff --git a/package/config/kconfig-language.txt b/package/config/kconfig-language.txt
deleted file mode 100644
index c412c24..0000000
--- a/package/config/kconfig-language.txt
+++ /dev/null
@@ -1,379 +0,0 @@
-Introduction
-------------
-
-The configuration database is a collection of configuration options
-organized in a tree structure:
-
-	+- Code maturity level options
-	|  +- Prompt for development and/or incomplete code/drivers
-	+- General setup
-	|  +- Networking support
-	|  +- System V IPC
-	|  +- BSD Process Accounting
-	|  +- Sysctl support
-	+- Loadable module support
-	|  +- Enable loadable module support
-	|     +- Set version information on all module symbols
-	|     +- Kernel module loader
-	+- ...
-
-Every entry has its own dependencies. These dependencies are used
-to determine the visibility of an entry. Any child entry is only
-visible if its parent entry is also visible.
-
-Menu entries
-------------
-
-Most entries define a config option; all other entries help to organize
-them. A single configuration option is defined like this:
-
-config MODVERSIONS
-	bool "Set version information on all module symbols"
-	depends on MODULES
-	help
-	  Usually, modules have to be recompiled whenever you switch to a new
-	  kernel.  ...
-
-Every line starts with a key word and can be followed by multiple
-arguments.  "config" starts a new config entry. The following lines
-define attributes for this config option. Attributes can be the type of
-the config option, input prompt, dependencies, help text and default
-values. A config option can be defined multiple times with the same
-name, but every definition can have only a single input prompt and the
-type must not conflict.
-
-Menu attributes
----------------
-
-A menu entry can have a number of attributes. Not all of them are
-applicable everywhere (see syntax).
-
-- type definition: "bool"/"tristate"/"string"/"hex"/"int"
-  Every config option must have a type. There are only two basic types:
-  tristate and string; the other types are based on these two. The type
-  definition optionally accepts an input prompt, so these two examples
-  are equivalent:
-
-	bool "Networking support"
-  and
-	bool
-	prompt "Networking support"
-
-- input prompt: "prompt" <prompt> ["if" <expr>]
-  Every menu entry can have at most one prompt, which is used to display
-  to the user. Optionally dependencies only for this prompt can be added
-  with "if".
-
-- default value: "default" <expr> ["if" <expr>]
-  A config option can have any number of default values. If multiple
-  default values are visible, only the first defined one is active.
-  Default values are not limited to the menu entry where they are
-  defined. This means the default can be defined somewhere else or be
-  overridden by an earlier definition.
-  The default value is only assigned to the config symbol if no other
-  value was set by the user (via the input prompt above). If an input
-  prompt is visible the default value is presented to the user and can
-  be overridden by him.
-  Optionally, dependencies only for this default value can be added with
-  "if".
-
-- type definition + default value:
-	"def_bool"/"def_tristate" <expr> ["if" <expr>]
-  This is a shorthand notation for a type definition plus a value.
-  Optionally dependencies for this default value can be added with "if".
-
-- dependencies: "depends on" <expr>
-  This defines a dependency for this menu entry. If multiple
-  dependencies are defined, they are connected with '&&'. Dependencies
-  are applied to all other options within this menu entry (which also
-  accept an "if" expression), so these two examples are equivalent:
-
-	bool "foo" if BAR
-	default y if BAR
-  and
-	depends on BAR
-	bool "foo"
-	default y
-
-- reverse dependencies: "select" <symbol> ["if" <expr>]
-  While normal dependencies reduce the upper limit of a symbol (see
-  below), reverse dependencies can be used to force a lower limit of
-  another symbol. The value of the current menu symbol is used as the
-  minimal value <symbol> can be set to. If <symbol> is selected multiple
-  times, the limit is set to the largest selection.
-  Reverse dependencies can only be used with boolean or tristate
-  symbols.
-  Note:
-	select should be used with care. select will force
-	a symbol to a value without visiting the dependencies.
-	By abusing select you are able to select a symbol FOO even
-	if FOO depends on BAR that is not set.
-	In general use select only for non-visible symbols
-	(no prompts anywhere) and for symbols with no dependencies.
-	That will limit the usefulness but on the other hand avoid
-	the illegal configurations all over.
-	kconfig should one day warn about such things.
-
-- numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
-  This allows to limit the range of possible input values for int
-  and hex symbols. The user can only input a value which is larger than
-  or equal to the first symbol and smaller than or equal to the second
-  symbol.
-
-- help text: "help" or "---help---"
-  This defines a help text. The end of the help text is determined by
-  the indentation level, this means it ends at the first line which has
-  a smaller indentation than the first line of the help text.
-  "---help---" and "help" do not differ in behaviour, "---help---" is
-  used to help visually separate configuration logic from help within
-  the file as an aid to developers.
-
-- misc options: "option" <symbol>[=<value>]
-  Various less common options can be defined via this option syntax,
-  which can modify the behaviour of the menu entry and its config
-  symbol. These options are currently possible:
-
-  - "defconfig_list"
-    This declares a list of default entries which can be used when
-    looking for the default configuration (which is used when the main
-    .config doesn't exists yet.)
-
-  - "modules"
-    This declares the symbol to be used as the MODULES symbol, which
-    enables the third modular state for all config symbols.
-
-  - "env"=<value>
-    This imports the environment variable into Kconfig. It behaves like
-    a default, except that the value comes from the environment, this
-    also means that the behaviour when mixing it with normal defaults is
-    undefined at this point. The symbol is currently not exported back
-    to the build environment (if this is desired, it can be done via
-    another symbol).
-
-Menu dependencies
------------------
-
-Dependencies define the visibility of a menu entry and can also reduce
-the input range of tristate symbols. The tristate logic used in the
-expressions uses one more state than normal boolean logic to express the
-module state. Dependency expressions have the following syntax:
-
-<expr> ::= <symbol>                             (1)
-           <symbol> '=' <symbol>                (2)
-           <symbol> '!=' <symbol>               (3)
-           '(' <expr> ')'                       (4)
-           '!' <expr>                           (5)
-           <expr> '&&' <expr>                   (6)
-           <expr> '||' <expr>                   (7)
-
-Expressions are listed in decreasing order of precedence. 
-
-(1) Convert the symbol into an expression. Boolean and tristate symbols
-    are simply converted into the respective expression values. All
-    other symbol types result in 'n'.
-(2) If the values of both symbols are equal, it returns 'y',
-    otherwise 'n'.
-(3) If the values of both symbols are equal, it returns 'n',
-    otherwise 'y'.
-(4) Returns the value of the expression. Used to override precedence.
-(5) Returns the result of (2-/expr/).
-(6) Returns the result of min(/expr/, /expr/).
-(7) Returns the result of max(/expr/, /expr/).
-
-An expression can have a value of 'n', 'm' or 'y' (or 0, 1, 2
-respectively for calculations). A menu entry becomes visible when it's
-expression evaluates to 'm' or 'y'.
-
-There are two types of symbols: constant and non-constant symbols.
-Non-constant symbols are the most common ones and are defined with the
-'config' statement. Non-constant symbols consist entirely of alphanumeric
-characters or underscores.
-Constant symbols are only part of expressions. Constant symbols are
-always surrounded by single or double quotes. Within the quote, any
-other character is allowed and the quotes can be escaped using '\'.
-
-Menu structure
---------------
-
-The position of a menu entry in the tree is determined in two ways. First
-it can be specified explicitly:
-
-menu "Network device support"
-	depends on NET
-
-config NETDEVICES
-	...
-
-endmenu
-
-All entries within the "menu" ... "endmenu" block become a submenu of
-"Network device support". All subentries inherit the dependencies from
-the menu entry, e.g. this means the dependency "NET" is added to the
-dependency list of the config option NETDEVICES.
-
-The other way to generate the menu structure is done by analyzing the
-dependencies. If a menu entry somehow depends on the previous entry, it
-can be made a submenu of it. First, the previous (parent) symbol must
-be part of the dependency list and then one of these two conditions
-must be true:
-- the child entry must become invisible, if the parent is set to 'n'
-- the child entry must only be visible, if the parent is visible
-
-config MODULES
-	bool "Enable loadable module support"
-
-config MODVERSIONS
-	bool "Set version information on all module symbols"
-	depends on MODULES
-
-comment "module support disabled"
-	depends on !MODULES
-
-MODVERSIONS directly depends on MODULES, this means it's only visible if
-MODULES is different from 'n'. The comment on the other hand is always
-visible when MODULES is visible (the (empty) dependency of MODULES is
-also part of the comment dependencies).
-
-
-Kconfig syntax
---------------
-
-The configuration file describes a series of menu entries, where every
-line starts with a keyword (except help texts). The following keywords
-end a menu entry:
-- config
-- menuconfig
-- choice/endchoice
-- comment
-- menu/endmenu
-- if/endif
-- source
-The first five also start the definition of a menu entry.
-
-config:
-
-	"config" <symbol>
-	<config options>
-
-This defines a config symbol <symbol> and accepts any of above
-attributes as options.
-
-menuconfig:
-	"menuconfig" <symbol>
-	<config options>
-
-This is similar to the simple config entry above, but it also gives a
-hint to front ends, that all suboptions should be displayed as a
-separate list of options.
-
-choices:
-
-	"choice"
-	<choice options>
-	<choice block>
-	"endchoice"
-
-This defines a choice group and accepts any of the above attributes as
-options. A choice can only be of type bool or tristate, while a boolean
-choice only allows a single config entry to be selected, a tristate
-choice also allows any number of config entries to be set to 'm'. This
-can be used if multiple drivers for a single hardware exists and only a
-single driver can be compiled/loaded into the kernel, but all drivers
-can be compiled as modules.
-A choice accepts another option "optional", which allows to set the
-choice to 'n' and no entry needs to be selected.
-
-comment:
-
-	"comment" <prompt>
-	<comment options>
-
-This defines a comment which is displayed to the user during the
-configuration process and is also echoed to the output files. The only
-possible options are dependencies.
-
-menu:
-
-	"menu" <prompt>
-	<menu options>
-	<menu block>
-	"endmenu"
-
-This defines a menu block, see "Menu structure" above for more
-information. The only possible options are dependencies.
-
-if:
-
-	"if" <expr>
-	<if block>
-	"endif"
-
-This defines an if block. The dependency expression <expr> is appended
-to all enclosed menu entries.
-
-source:
-
-	"source" <prompt>
-
-This reads the specified configuration file. This file is always parsed.
-
-mainmenu:
-
-	"mainmenu" <prompt>
-
-This sets the config program's title bar if the config program chooses
-to use it.
-
-
-Kconfig hints
--------------
-This is a collection of Kconfig tips, most of which aren't obvious at
-first glance and most of which have become idioms in several Kconfig
-files.
-
-Adding common features and make the usage configurable
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-It is a common idiom to implement a feature/functionality that are
-relevant for some architectures but not all.
-The recommended way to do so is to use a config variable named HAVE_*
-that is defined in a common Kconfig file and selected by the relevant
-architectures.
-An example is the generic IOMAP functionality.
-
-We would in lib/Kconfig see:
-
-# Generic IOMAP is used to ...
-config HAVE_GENERIC_IOMAP
-
-config GENERIC_IOMAP
-	depends on HAVE_GENERIC_IOMAP && FOO
-
-And in lib/Makefile we would see:
-obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
-
-For each architecture using the generic IOMAP functionality we would see:
-
-config X86
-	select ...
-	select HAVE_GENERIC_IOMAP
-	select ...
-
-Note: we use the existing config option and avoid creating a new
-config variable to select HAVE_GENERIC_IOMAP.
-
-Note: the use of the internal config variable HAVE_GENERIC_IOMAP, it is
-introduced to overcome the limitation of select which will force a
-config option to 'y' no matter the dependencies.
-The dependencies are moved to the symbol GENERIC_IOMAP and we avoid the
-situation where select forces a symbol equals to 'y'.
-
-Build as module only
-~~~~~~~~~~~~~~~~~~~~
-To restrict a component build to module-only, qualify its config symbol
-with "depends on m".  E.g.:
-
-config FOO
-	depends on BAR && m
-
-limits FOO to module (=m) or disabled (=n).
-
diff --git a/package/config/kconfig-to-buildroot2.patch b/package/config/kconfig-to-buildroot2.patch
deleted file mode 100644
index db72ea8..0000000
--- a/package/config/kconfig-to-buildroot2.patch
+++ /dev/null
@@ -1,917 +0,0 @@
----
- Makefile            |    7 +++
- README.buildroot2   |   22 ++++++++++
- conf.c              |   17 ++++----
- confdata.c          |  101 ++++++++++++++++++++++++++------------------------
- expr.c              |   42 ++++++++++----------
- gconf.c             |    4 -
- gconf.glade         |    2 
- mconf.c             |   39 +++++++++----------
- qconf.cc            |    5 +-
- util.c              |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++-
- zconf.tab.c_shipped |    2 
- zconf.y             |    2 
- 12 files changed, 244 insertions(+), 104 deletions(-)
-
-Index: config/Makefile
-===================================================================
---- config.orig/Makefile
-+++ config/Makefile
-@@ -124,10 +124,21 @@
- ifeq ($(MAKECMDGOALS),menuconfig)
- 	hostprogs-y += mconf
- endif
-+ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
-+       hostprogs-y += mconf
-+endif
- 
- ifeq ($(MAKECMDGOALS),xconfig)
- 	qconf-target := 1
- endif
-+ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
-+	qconf-target := 1
-+endif
-+
- ifeq ($(MAKECMDGOALS),gconfig)
- 	gconf-target := 1
- endif
-+ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
-+	gconf-target := 1
-+endif
-+
-Index: config/README.buildroot2
-===================================================================
---- /dev/null
-+++ config/README.buildroot2
-@@ -0,0 +1,22 @@
-+This is a copy of the kconfig code in the kernel (currently 2.6.24.4) tweaked
-+to suit Buildroot.
-+
-+To update:
-+	cp -r /usr/src/linux/scripts/kconfig package/config.new
-+	cd package/config.new
-+	cp /usr/src/linux/Documentation/kbuild/kconfig-language.txt .
-+	patch -p1 < ../config/kconfig-to-buildroot2.patch
-+	mv Makefile Makefile.kconfig
-+	cp ../config/README.buildroot2 .
-+	cp ../config/foo.h .
-+	cp ../config/Makefile .
-+	cp ../config/kconfig-to-buildroot2.patch .
-+	cd ..
-+	rm -rf config
-+	mv config.new config
-+
-+Then verify the toplevel targets work:
-+	config
-+	defconfig
-+	menuconfig
-+	oldconfig
-Index: config/conf.c
-===================================================================
---- config.orig/conf.c
-+++ config/conf.c
-@@ -496,13 +496,12 @@
- 	}
- 	name = av[optind];
- 	conf_parse(name);
--	//zconfdump(stdout);
- 	if (sync_kconfig) {
- 		name = conf_get_configname();
- 		if (stat(name, &tmpstat)) {
- 			fprintf(stderr, _("***\n"
--				"*** You have not yet configured your kernel!\n"
--				"*** (missing kernel config file \"%s\")\n"
-+				"*** You have not yet configured Buildroot!\n"
-+				"*** (missing .config file \"%s\")\n"
- 				"***\n"
- 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
- 				"*** \"make menuconfig\" or \"make xconfig\").\n"
-@@ -557,7 +556,7 @@
- 			name = getenv("KCONFIG_NOSILENTUPDATE");
- 			if (name && *name) {
- 				fprintf(stderr,
--					_("\n*** Kernel configuration requires explicit update.\n\n"));
-+					_("\n*** Buildroot configuration requires explicit update.\n\n"));
- 				return 1;
- 			}
- 		}
-@@ -600,18 +599,22 @@
- 		 * All other commands are only used to generate a config.
- 		 */
- 		if (conf_get_changed() && conf_write(NULL)) {
--			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 			exit(1);
- 		}
- 		if (conf_write_autoconf()) {
--			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
- 			return 1;
- 		}
- 	} else {
- 		if (conf_write(NULL)) {
--			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
-+			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
- 			exit(1);
- 		}
-+		if (conf_write_autoconf()) {
-+			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
-+			return 1;
-+		}
- 	}
- 	return 0;
- }
-Index: config/confdata.c
-===================================================================
---- config.orig/confdata.c
-+++ config/confdata.c
-@@ -11,6 +11,7 @@
- #include <string.h>
- #include <time.h>
- #include <unistd.h>
-+#include <libgen.h>
- 
- #define LKC_DIRECT_LINK
- #include "lkc.h"
-@@ -21,7 +22,7 @@
- static const char *conf_filename;
- static int conf_lineno, conf_warnings, conf_unsaved;
- 
--const char conf_defname[] = "arch/$ARCH/defconfig";
-+const char conf_defname[] = ".defconfig";
- 
- static void conf_warning(const char *fmt, ...)
- {
-@@ -36,16 +37,14 @@
- 
- const char *conf_get_configname(void)
- {
--	char *name = getenv("KCONFIG_CONFIG");
-+	char *name = getenv("BUILDROOT_CONFIG");
- 
- 	return name ? name : ".config";
- }
- 
- const char *conf_get_autoconfig_name(void)
- {
--	char *name = getenv("KCONFIG_AUTOCONFIG");
--
--	return name ? name : "include/config/auto.conf";
-+	return getenv("KCONFIG_AUTOCONFIG");
- }
- 
- static char *conf_expand_value(const char *in)
-@@ -219,22 +218,22 @@
- 		sym = NULL;
- 		switch (line[0]) {
- 		case '#':
--			if (memcmp(line + 2, "CONFIG_", 7))
-+			if (line[1]!=' ')
- 				continue;
--			p = strchr(line + 9, ' ');
-+			p = strchr(line + 2, ' ');
- 			if (!p)
- 				continue;
- 			*p++ = 0;
- 			if (strncmp(p, "is not set", 10))
- 				continue;
- 			if (def == S_DEF_USER) {
--				sym = sym_find(line + 9);
-+				sym = sym_find(line + 2);
- 				if (!sym) {
- 					sym_add_change_count(1);
- 					break;
- 				}
- 			} else {
--				sym = sym_lookup(line + 9, 0);
-+				sym = sym_lookup(line + 2, 0);
- 				if (sym->type == S_UNKNOWN)
- 					sym->type = S_BOOLEAN;
- 			}
-@@ -251,12 +250,8 @@
- 				;
- 			}
- 			break;
--		case 'C':
--			if (memcmp(line, "CONFIG_", 7)) {
--				conf_warning("unexpected data");
--				continue;
--			}
--			p = strchr(line + 7, '=');
-+		case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
-+			p = strchr(line, '=');
- 			if (!p)
- 				continue;
- 			*p++ = 0;
-@@ -267,13 +262,13 @@
- 					*p2 = 0;
- 			}
- 			if (def == S_DEF_USER) {
--				sym = sym_find(line + 7);
-+				sym = sym_find(line);
- 				if (!sym) {
- 					sym_add_change_count(1);
- 					break;
- 				}
- 			} else {
--				sym = sym_lookup(line + 7, 0);
-+				sym = sym_lookup(line, 0);
- 				if (sym->type == S_UNKNOWN)
- 					sym->type = S_OTHER;
- 			}
-@@ -443,7 +438,7 @@
- 	if (!out)
- 		return 1;
- 
--	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("BR2_VERSION", 0);
- 	sym_calc_value(sym);
- 	time(&now);
- 	env = getenv("KCONFIG_NOTIMESTAMP");
-@@ -452,10 +447,8 @@
- 
- 	fprintf(out, _("#\n"
- 		       "# Automatically generated make config: don't edit\n"
--		       "# Linux kernel version: %s\n"
- 		       "%s%s"
- 		       "#\n"),
--		     sym_get_string_value(sym),
- 		     use_timestamp ? "# " : "",
- 		     use_timestamp ? ctime(&now) : "");
- 
-@@ -489,19 +482,19 @@
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
-@@ -517,12 +510,12 @@
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
- 		}
-@@ -564,6 +557,7 @@
- {
- 	const char *name;
- 	char path[128];
-+	char *opwd, *dir, *_name;
- 	char *s, *d, c;
- 	struct symbol *sym;
- 	struct stat sb;
-@@ -572,8 +566,20 @@
- 	name = conf_get_autoconfig_name();
- 	conf_read_simple(name, S_DEF_AUTO);
- 
--	if (chdir("include/config"))
-+	opwd = malloc(256);
-+	_name = strdup(name);
-+	if (opwd == NULL || _name == NULL)
- 		return 1;
-+	opwd = getcwd(opwd, 256);
-+	dir = dirname(_name);
-+	if (dir == NULL) {
-+		res = 1;
-+		goto err;
-+	}
-+	if (chdir(dir)) {
-+		res = 1;
-+		goto err;
-+	}
- 
- 	res = 0;
- 	for_all_symbols(i, sym) {
-@@ -666,9 +672,11 @@
- 		close(fd);
- 	}
- out:
--	if (chdir("../.."))
--		return 1;
--
-+	if (chdir(opwd))
-+		res = 1;
-+err:
-+	free(opwd);
-+	free(_name);
- 	return res;
- }
- 
-@@ -683,7 +691,7 @@
- 
- 	sym_clear_all_valid();
- 
--	file_write_dep("include/config/auto.conf.cmd");
-+	file_write_dep(".config.cmd");
- 
- 	if (conf_split_config())
- 		return 1;
-@@ -698,22 +706,19 @@
- 		return 1;
- 	}
- 
--	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("BR2_VERSION", 0);
- 	sym_calc_value(sym);
- 	time(&now);
- 	fprintf(out, "#\n"
- 		     "# Automatically generated make config: don't edit\n"
--		     "# Linux kernel version: %s\n"
- 		     "# %s"
- 		     "#\n",
--		     sym_get_string_value(sym), ctime(&now));
-+		     ctime(&now));
- 	fprintf(out_h, "/*\n"
- 		       " * Automatically generated C config: don't edit\n"
--		       " * Linux kernel version: %s\n"
- 		       " * %s"
--		       " */\n"
--		       "#define AUTOCONF_INCLUDED\n",
--		       sym_get_string_value(sym), ctime(&now));
-+		       " */\n",
-+		       ctime(&now));
- 
- 	for_all_symbols(i, sym) {
- 		sym_calc_value(sym);
-@@ -726,19 +731,19 @@
- 			case no:
- 				break;
- 			case mod:
--				fprintf(out, "CONFIG_%s=m\n", sym->name);
--				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
-+				fprintf(out, "%s=m\n", sym->name);
-+				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
- 				break;
- 			case yes:
--				fprintf(out, "CONFIG_%s=y\n", sym->name);
--				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
-+				fprintf(out, "%s=y\n", sym->name);
-+				fprintf(out_h, "#define %s 1\n", sym->name);
- 				break;
- 			}
- 			break;
- 		case S_STRING:
- 			str = sym_get_string_value(sym);
--			fprintf(out, "CONFIG_%s=\"", sym->name);
--			fprintf(out_h, "#define CONFIG_%s \"", sym->name);
-+			fprintf(out, "%s=\"", sym->name);
-+			fprintf(out_h, "#define %s \"", sym->name);
- 			while (1) {
- 				l = strcspn(str, "\"\\");
- 				if (l) {
-@@ -758,14 +763,14 @@
- 		case S_HEX:
- 			str = sym_get_string_value(sym);
- 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
--				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
--				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
-+				fprintf(out, "%s=%s\n", sym->name, str);
-+				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
- 				break;
- 			}
- 		case S_INT:
- 			str = sym_get_string_value(sym);
--			fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
--			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
-+			fprintf(out, "%s=%s\n", sym->name, str);
-+			fprintf(out_h, "#define %s %s\n", sym->name, str);
- 			break;
- 		default:
- 			break;
-Index: config/expr.c
-===================================================================
---- config.orig/expr.c
-+++ config/expr.c
-@@ -331,7 +331,7 @@
- 		e->right.expr = expr_trans_bool(e->right.expr);
- 		break;
- 	case E_UNEQUAL:
--		// FOO!=n -> FOO
-+		/* FOO!=n -> FOO */
- 		if (e->left.sym->type == S_TRISTATE) {
- 			if (e->right.sym == &symbol_no) {
- 				e->type = E_SYMBOL;
-@@ -380,19 +380,19 @@
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
- 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
--			// (a='y') || (a='m') -> (a!='n')
-+			/* (a='y') || (a='m') -> (a!='n') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
- 		}
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
- 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
--			// (a='y') || (a='n') -> (a!='m')
-+			/* (a='y') || (a='n') -> (a!='m') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
- 		}
- 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
- 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
- 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
--			// (a='m') || (a='n') -> (a!='y')
-+			/* (a='m') || (a='n') -> (a!='y') */
- 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
- 		}
- 	}
-@@ -443,29 +443,29 @@
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
--		// (a) && (a='y') -> (a='y')
-+		/* (a) && (a='y') -> (a='y') */
- 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
--		// (a) && (a!='n') -> (a)
-+		/* (a) && (a!='n') -> (a) */
- 		return expr_alloc_symbol(sym1);
- 
- 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
- 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
--		// (a) && (a!='m') -> (a='y')
-+		/* (a) && (a!='m') -> (a='y') */
- 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 	if (sym1->type == S_TRISTATE) {
- 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
--			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
- 			sym2 = e1->right.sym;
- 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
- 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
- 							     : expr_alloc_symbol(&symbol_no);
- 		}
- 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
--			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
-+			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
- 			sym2 = e2->right.sym;
- 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
- 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
-@@ -474,19 +474,19 @@
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
- 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
--			// (a!='y') && (a!='n') -> (a='m')
-+			/* (a!='y') && (a!='n') -> (a='m') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
- 
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
- 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
--			// (a!='y') && (a!='m') -> (a='n')
-+			/* (a!='y') && (a!='m') -> (a='n') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
- 
- 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
- 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
- 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
--			// (a!='m') && (a!='n') -> (a='m')
-+			/* (a!='m') && (a!='n') -> (a='m') */
- 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
- 
- 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
-@@ -579,7 +579,7 @@
- 	switch (e1->type) {
- 	case E_OR:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO || BAR) && (!FOO && !BAR) -> n
-+		/* (FOO || BAR) && (!FOO && !BAR) -> n */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
-@@ -594,7 +594,7 @@
- 		break;
- 	case E_AND:
- 		expr_eliminate_dups2(e1->type, &e1, &e1);
--		// (FOO && BAR) || (!FOO || !BAR) -> y
-+		/* (FOO && BAR) || (!FOO || !BAR) -> y */
- 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
- 		tmp2 = expr_copy(e2);
- 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
-@@ -703,7 +703,7 @@
- 	case E_NOT:
- 		switch (e->left.expr->type) {
- 		case E_NOT:
--			// !!a -> a
-+			/* !!a -> a */
- 			tmp = e->left.expr->left.expr;
- 			free(e->left.expr);
- 			free(e);
-@@ -712,14 +712,14 @@
- 			break;
- 		case E_EQUAL:
- 		case E_UNEQUAL:
--			// !a='x' -> a!='x'
-+			/* !a='x' -> a!='x' */
- 			tmp = e->left.expr;
- 			free(e);
- 			e = tmp;
- 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
- 			break;
- 		case E_OR:
--			// !(a || b) -> !a && !b
-+			/* !(a || b) -> !a && !b */
- 			tmp = e->left.expr;
- 			e->type = E_AND;
- 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -728,7 +728,7 @@
- 			e = expr_transform(e);
- 			break;
- 		case E_AND:
--			// !(a && b) -> !a || !b
-+			/* !(a && b) -> !a || !b */
- 			tmp = e->left.expr;
- 			e->type = E_OR;
- 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
-@@ -738,7 +738,7 @@
- 			break;
- 		case E_SYMBOL:
- 			if (e->left.expr->left.sym == &symbol_yes) {
--				// !'y' -> 'n'
-+				/* !'y' -> 'n' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -747,7 +747,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_mod) {
--				// !'m' -> 'm'
-+				/* !'m' -> 'm' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-@@ -756,7 +756,7 @@
- 				break;
- 			}
- 			if (e->left.expr->left.sym == &symbol_no) {
--				// !'n' -> 'y'
-+				/* !'n' -> 'y' */
- 				tmp = e->left.expr;
- 				free(e);
- 				e = tmp;
-Index: config/gconf.c
-===================================================================
---- config.orig/gconf.c
-+++ config/gconf.c
-@@ -266,8 +266,8 @@
- 					  /*"style", PANGO_STYLE_OBLIQUE, */
- 					  NULL);
- 
--	sprintf(title, _("Linux Kernel v%s Configuration"),
--		getenv("KERNELVERSION"));
-+	sprintf(title, _("Buildroot v%s Configuration"),
-+		getenv("BR2_VERSION"));
- 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
- 
- 	gtk_widget_show(main_wnd);
-Index: config/gconf.glade
-===================================================================
---- config.orig/gconf.glade
-+++ config/gconf.glade
-@@ -5,7 +5,7 @@
- 
- <widget class="GtkWindow" id="window1">
-   <property name="visible">True</property>
--  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
-+  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
-   <property name="type">GTK_WINDOW_TOPLEVEL</property>
-   <property name="window_position">GTK_WIN_POS_NONE</property>
-   <property name="modal">False</property>
-Index: config/mconf.c
-===================================================================
---- config.orig/mconf.c
-+++ config/mconf.c
-@@ -25,10 +25,9 @@
- static const char mconf_readme[] = N_(
- "Overview\n"
- "--------\n"
--"Some kernel features may be built directly into the kernel.\n"
--"Some may be made into loadable runtime modules.  Some features\n"
-+"Some features may be built directly into Buildroot. Some features\n"
- "may be completely removed altogether.  There are also certain\n"
--"kernel parameters which are not really features, but must be\n"
-+"parameters which are not really features, but must be\n"
- "entered in as decimal or hexadecimal numbers or possibly text.\n"
- "\n"
- "Menu items beginning with following braces represent features that\n"
-@@ -115,7 +114,7 @@
- "-----------------------------\n"
- "Menuconfig supports the use of alternate configuration files for\n"
- "those who, for various reasons, find it necessary to switch\n"
--"between different kernel configurations.\n"
-+"between different configurations.\n"
- "\n"
- "At the end of the main menu you will find two options.  One is\n"
- "for saving the current configuration to a file of your choosing.\n"
-@@ -148,7 +147,7 @@
- "\n"
- "Optional personality available\n"
- "------------------------------\n"
--"If you prefer to have all of the kernel options listed in a single\n"
-+"If you prefer to have all of the options listed in a single\n"
- "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
- "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
- "\n"
-@@ -178,9 +177,9 @@
- 	"Arrow keys navigate the menu.  "
- 	"<Enter> selects submenus --->.  "
- 	"Highlighted letters are hotkeys.  "
--	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
-+	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
- 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
--	"Legend: [*] built-in  [ ] excluded  <M> module  < > module capable"),
-+	"Legend: [*] feature is selected  [ ] feature is excluded"),
- radiolist_instructions[] = N_(
- 	"Use the arrow keys to navigate this window or "
- 	"press the hotkey of the item you wish to select "
-@@ -200,18 +199,18 @@
- 	"This feature depends on another which has been configured as a module.\n"
- 	"As a result, this feature will be built as a module."),
- nohelp_text[] = N_(
--	"There is no help available for this kernel option.\n"),
-+	"There is no help available for this option.\n"),
- load_config_text[] = N_(
- 	"Enter the name of the configuration file you wish to load.  "
- 	"Accept the name shown to restore the configuration you "
- 	"last retrieved.  Leave blank to abort."),
- load_config_help[] = N_(
- 	"\n"
--	"For various reasons, one may wish to keep several different kernel\n"
-+	"For various reasons, one may wish to keep several different Buildroot\n"
- 	"configurations available on a single machine.\n"
- 	"\n"
- 	"If you have saved a previous configuration in a file other than the\n"
--	"kernel's default, entering the name of the file here will allow you\n"
-+	"Buildroot's default, entering the name of the file here will allow you\n"
- 	"to modify that configuration.\n"
- 	"\n"
- 	"If you are uncertain, then you have probably never used alternate\n"
-@@ -221,7 +220,7 @@
- 	"as an alternate.  Leave blank to abort."),
- save_config_help[] = N_(
- 	"\n"
--	"For various reasons, one may wish to keep different kernel\n"
-+	"For various reasons, one may wish to keep different Buildroot\n"
- 	"configurations available on a single machine.\n"
- 	"\n"
- 	"Entering a file name here will allow you to later retrieve, modify\n"
-@@ -364,10 +363,10 @@
- 	int size;
- 	struct symbol *sym;
- 
--	sym = sym_lookup("KERNELVERSION", 0);
-+	sym = sym_lookup("BR2_VERSION", 0);
- 	sym_calc_value(sym);
- 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
--	                _("%s - Linux Kernel v%s Configuration"),
-+	                _("%s - buildroot v%s Configuration"),
- 		        config_filename, sym_get_string_value(sym));
- 	if (size >= sizeof(menu_backtitle))
- 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
-@@ -902,7 +901,7 @@
- 		if (conf_get_changed())
- 			res = dialog_yesno(NULL,
- 					   _("Do you wish to save your "
--					     "new kernel configuration?\n"
-+					     "new Buildroot configuration?\n"
- 					     "<ESC><ESC> to continue."),
- 					   6, 60);
- 		else
-@@ -914,23 +913,23 @@
- 	case 0:
- 		if (conf_write(filename)) {
- 			fprintf(stderr, _("\n\n"
--				"Error during writing of the kernel configuration.\n"
--				"Your kernel configuration changes were NOT saved."
-+				"Error during writing of the Buildroot configuration.\n"
-+				"Your Buildroot configuration changes were NOT saved."
- 				"\n\n"));
- 			return 1;
- 		}
- 	case -1:
- 		printf(_("\n\n"
--			"*** End of Linux kernel configuration.\n"
--			"*** Execute 'make' to build the kernel or try 'make help'."
-+			"*** End of Buildroot configuration.\n"
-+			"*** Execute 'make' to build Buildroot or try 'make help'."
- 			"\n\n"));
- 		break;
- 	default:
- 		fprintf(stderr, _("\n\n"
--			"Your kernel configuration changes were NOT saved."
-+			"Your Buildroot configuration changes were NOT saved."
- 			"\n\n"));
- 	}
- 
--	return 0;
-+	return conf_write_autoconf();
- }
- 
-Index: config/qconf.cc
-===================================================================
---- config.orig/qconf.cc
-+++ config/qconf.cc
-@@ -1277,8 +1277,7 @@
- 	char title[256];
- 
- 	QDesktopWidget *d = configApp->desktop();
--	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
--		getenv("KERNELVERSION"));
-+	snprintf(title, sizeof(title), _("Buildroot Configuration"));
- 	setCaption(title);
- 
- 	width = configSettings->readNumEntry("/window width", d->width() - 64);
-@@ -1612,6 +1611,7 @@
- {
- 	if (!conf_get_changed()) {
- 		e->accept();
-+		conf_write_autoconf();
- 		return;
- 	}
- 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
-@@ -1622,6 +1622,7 @@
- 	switch (mb.exec()) {
- 	case QMessageBox::Yes:
- 		conf_write(NULL);
-+		conf_write_autoconf();
- 	case QMessageBox::No:
- 		e->accept();
- 		break;
-Index: config/util.c
-===================================================================
---- config.orig/util.c
-+++ config/util.c
-@@ -26,6 +26,109 @@
- 	return file;
- }
- 
-+static char* br2_symbol_printer(const char * const in)
-+{
-+	ssize_t i, j, len = strlen(in);
-+	char *ret;
-+	if (len < 1)
-+		return NULL;
-+	ret = malloc(len);
-+	if (!ret) {
-+		printf("Out of memory!");
-+		exit(1);
-+	}
-+	memset(ret, 0, len);
-+	i = j = 0;
-+	if (strncmp("BR2_", in, 4) == 0)
-+		i += 4;
-+	if (strncmp("PACKAGE_", in + i, 8) == 0)
-+		i += 8;
-+	else if (strncmp("TARGET_", in + i, 7) == 0)
-+		i += 7;
-+	while (i <= len)
-+		ret[j++] = tolower(in[i++]);
-+	return ret;
-+}
-+
-+/* write dependencies of the infividual config-symbols */
-+static int write_make_deps(const char *name)
-+{
-+	struct menu *menu;
-+	struct symbol *sym;
-+	struct property *prop, *p;
-+	unsigned done;
-+	const char * const name_tmp = "..make.deps.tmp";
-+	FILE *out;
-+	if (!name)
-+		name = ".auto.deps";
-+	out = fopen(name_tmp, "w");
-+	if (!out)
-+		return 1;
-+	fprintf(out, "# ATTENTION! This does not handle 'depends', just 'select'! \n"
-+		"# See package/config/util.c write_make_deps()\n#\n");
-+	menu = &rootmenu;//rootmenu.list;
-+	while (menu) {
-+		sym = menu->sym;
-+		if (!sym) {
-+			if (!menu_is_visible(menu))
-+				goto next;
-+		} else if (!(sym->flags & SYMBOL_CHOICE)) {
-+			sym_calc_value(sym);
-+			if (sym->type == S_BOOLEAN
-+			    && sym_get_tristate_value(sym) != no) {
-+			    done = 0;
-+			    for_all_prompts(sym, prop) {
-+			        struct expr *e;
-+//printf("\nname=%s\n", sym->name);
-+			        for_all_properties(sym, p, P_SELECT) {
-+				    e = p->expr;
-+				    if (e && e->left.sym->name) {
-+				        if (!done) {
-+					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
-+					    done = 1;
-+					}
-+//printf("SELECTS %s\n",e->left.sym->name);
-+					fprintf(out, " %s",br2_symbol_printer(e->left.sym->name));
-+				    }
-+				}
-+				if (done)
-+				    fprintf(out, "\n");
-+#if 0
-+				e = sym->rev_dep.expr;
-+				if (e && e->type == E_SYMBOL
-+					&& e->left.sym->name) {
-+				    fprintf(out, "%s: %s", br2_symbol_printer(e->left.sym->name),
-+						br2_symbol_printer(sym->name));
-+printf("%s is Selected BY: %s", sym->name, e->left.sym->name);
-+				}
-+#endif
-+			    }
-+			}
-+		}
-+next:
-+		if (menu->list) {
-+			menu = menu->list;
-+			continue;
-+		}
-+		if (menu->next)
-+			menu = menu->next;
-+		else while ((menu = menu->parent)) {
-+			if (menu->next) {
-+				menu = menu->next;
-+				break;
-+			}
-+		}
-+	}
-+	fclose(out);
-+	rename(name_tmp, name);
-+	printf(_("#\n"
-+		 "# make dependencies written to %s\n"
-+		 "# ATTENTION buildroot devels!\n"
-+		 "# See top of this file before playing with this auto-preprequisites!\n"
-+		 "#\n"), name);
-+	return 0;
-+}
-+
- /* write a dependency file as used by kbuild to track dependencies */
- int file_write_dep(const char *name)
- {
-@@ -68,7 +171,7 @@
- 	fprintf(out, "\n$(deps_config): ;\n");
- 	fclose(out);
- 	rename("..config.tmp", name);
--	return 0;
-+	return write_make_deps(NULL);
- }
- 
- 
-Index: config/zconf.tab.c_shipped
-===================================================================
---- config.orig/zconf.tab.c_shipped
-+++ config/zconf.tab.c_shipped
-@@ -2259,7 +2259,7 @@
- 	modules_sym = sym_lookup(NULL, 0);
- 	modules_sym->type = S_BOOLEAN;
- 	modules_sym->flags |= SYMBOL_AUTO;
--	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
-+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
- 
- #if YYDEBUG
- 	if (getenv("ZCONF_DEBUG"))
-Index: config/zconf.y
-===================================================================
---- config.orig/zconf.y
-+++ config/zconf.y
-@@ -476,7 +476,7 @@
- 	modules_sym = sym_lookup(NULL, 0);
- 	modules_sym->type = S_BOOLEAN;
- 	modules_sym->flags |= SYMBOL_AUTO;
--	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
-+	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
- 
- #if YYDEBUG
- 	if (getenv("ZCONF_DEBUG"))
diff --git a/package/config/patches/01-kconfig-kernel-to-buildroot.patch b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
new file mode 100644
index 0000000..5fed731
--- /dev/null
+++ b/package/config/patches/01-kconfig-kernel-to-buildroot.patch
@@ -0,0 +1,299 @@
+---
+ conf.c              |   12 ++++++------
+ confdata.c          |   12 ++++--------
+ gconf.c             |    4 ++--
+ gconf.glade         |    2 +-
+ mconf.c             |   37 ++++++++++++++++++-------------------
+ qconf.cc            |    3 +--
+ zconf.tab.c_shipped |    2 +-
+ zconf.y             |    2 +-
+ 8 files changed, 34 insertions(+), 40 deletions(-)
+
+Index: config.clean/conf.c
+===================================================================
+--- config.clean.orig/conf.c
++++ config.clean/conf.c
+@@ -500,8 +500,8 @@
+ 	if (sync_kconfig) {
+ 		if (stat(".config", &tmpstat)) {
+ 			fprintf(stderr, _("***\n"
+-				"*** You have not yet configured your kernel!\n"
+-				"*** (missing kernel .config file)\n"
++				"*** You have not yet configured Buildroot!\n"
++				"*** (missing .config file)\n"
+ 				"***\n"
+ 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
+ 				"*** \"make menuconfig\" or \"make xconfig\").\n"
+@@ -556,7 +556,7 @@
+ 			name = getenv("KCONFIG_NOSILENTUPDATE");
+ 			if (name && *name) {
+ 				fprintf(stderr,
+-					_("\n*** Kernel configuration requires explicit update.\n\n"));
++					_("\n*** Buildroot configuration requires explicit update.\n\n"));
+ 				return 1;
+ 			}
+ 		}
+@@ -599,16 +599,16 @@
+ 		 * All other commands are only used to generate a config.
+ 		 */
+ 		if (conf_get_changed() && conf_write(NULL)) {
+-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+ 			exit(1);
+ 		}
+ 		if (conf_write_autoconf()) {
+-			fprintf(stderr, _("\n*** Error during update of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
+ 			return 1;
+ 		}
+ 	} else {
+ 		if (conf_write(NULL)) {
+-			fprintf(stderr, _("\n*** Error during writing of the kernel configuration.\n\n"));
++			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+ 			exit(1);
+ 		}
+ 	}
+Index: config.clean/confdata.c
+===================================================================
+--- config.clean.orig/confdata.c
++++ config.clean/confdata.c
+@@ -436,7 +436,7 @@
+ 	if (!out)
+ 		return 1;
+ 
+-	sym = sym_lookup("KERNELVERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
+ 	sym_calc_value(sym);
+ 	time(&now);
+ 	env = getenv("KCONFIG_NOTIMESTAMP");
+@@ -445,10 +445,8 @@
+ 
+ 	fprintf(out, _("#\n"
+ 		       "# Automatically generated make config: don't edit\n"
+-		       "# Linux kernel version: %s\n"
+ 		       "%s%s"
+ 		       "#\n"),
+-		     sym_get_string_value(sym),
+ 		     use_timestamp ? "# " : "",
+ 		     use_timestamp ? ctime(&now) : "");
+ 
+@@ -692,22 +690,20 @@
+ 		return 1;
+ 	}
+ 
+-	sym = sym_lookup("KERNELVERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
+ 	sym_calc_value(sym);
+ 	time(&now);
+ 	fprintf(out, "#\n"
+ 		     "# Automatically generated make config: don't edit\n"
+-		     "# Linux kernel version: %s\n"
+ 		     "# %s"
+ 		     "#\n",
+-		     sym_get_string_value(sym), ctime(&now));
++		     ctime(&now));
+ 	fprintf(out_h, "/*\n"
+ 		       " * Automatically generated C config: don't edit\n"
+-		       " * Linux kernel version: %s\n"
+ 		       " * %s"
+ 		       " */\n"
+ 		       "#define AUTOCONF_INCLUDED\n",
+-		       sym_get_string_value(sym), ctime(&now));
++		       ctime(&now));
+ 
+ 	for_all_symbols(i, sym) {
+ 		sym_calc_value(sym);
+Index: config.clean/gconf.c
+===================================================================
+--- config.clean.orig/gconf.c
++++ config.clean/gconf.c
+@@ -266,8 +266,8 @@
+ 					  /*"style", PANGO_STYLE_OBLIQUE, */
+ 					  NULL);
+ 
+-	sprintf(title, _("Linux Kernel v%s Configuration"),
+-		getenv("KERNELVERSION"));
++	sprintf(title, _("Buildroot v%s Configuration"),
++		getenv("BR2_VERSION"));
+ 	gtk_window_set_title(GTK_WINDOW(main_wnd), title);
+ 
+ 	gtk_widget_show(main_wnd);
+Index: config.clean/gconf.glade
+===================================================================
+--- config.clean.orig/gconf.glade
++++ config.clean/gconf.glade
+@@ -5,7 +5,7 @@
+ 
+ <widget class="GtkWindow" id="window1">
+   <property name="visible">True</property>
+-  <property name="title" translatable="yes">Gtk Kernel Configurator</property>
++  <property name="title" translatable="yes">Gtk Buildroot Configurator</property>
+   <property name="type">GTK_WINDOW_TOPLEVEL</property>
+   <property name="window_position">GTK_WIN_POS_NONE</property>
+   <property name="modal">False</property>
+Index: config.clean/mconf.c
+===================================================================
+--- config.clean.orig/mconf.c
++++ config.clean/mconf.c
+@@ -25,10 +25,9 @@
+ static const char mconf_readme[] = N_(
+ "Overview\n"
+ "--------\n"
+-"Some kernel features may be built directly into the kernel.\n"
+-"Some may be made into loadable runtime modules.  Some features\n"
++"Some features may be built directly into Buildroot. Some features\n"
+ "may be completely removed altogether.  There are also certain\n"
+-"kernel parameters which are not really features, but must be\n"
++"parameters which are not really features, but must be\n"
+ "entered in as decimal or hexadecimal numbers or possibly text.\n"
+ "\n"
+ "Menu items beginning with following braces represent features that\n"
+@@ -115,7 +114,7 @@
+ "-----------------------------\n"
+ "Menuconfig supports the use of alternate configuration files for\n"
+ "those who, for various reasons, find it necessary to switch\n"
+-"between different kernel configurations.\n"
++"between different configurations.\n"
+ "\n"
+ "At the end of the main menu you will find two options.  One is\n"
+ "for saving the current configuration to a file of your choosing.\n"
+@@ -148,7 +147,7 @@
+ "\n"
+ "Optional personality available\n"
+ "------------------------------\n"
+-"If you prefer to have all of the kernel options listed in a single\n"
++"If you prefer to have all of the options listed in a single\n"
+ "menu, rather than the default multimenu hierarchy, run the menuconfig\n"
+ "with MENUCONFIG_MODE environment variable set to single_menu. Example:\n"
+ "\n"
+@@ -178,9 +177,9 @@
+ 	"Arrow keys navigate the menu.  "
+ 	"<Enter> selects submenus --->.  "
+ 	"Highlighted letters are hotkeys.  "
+-	"Pressing <Y> includes, <N> excludes, <M> modularizes features.  "
++	"Pressing <Y> selectes a feature, while <N> will exclude a feature.  "
+ 	"Press <Esc><Esc> to exit, <?> for Help, </> for Search.  "
+-	"Legend: [*] built-in  [ ] excluded  <M> module  < > module capable"),
++	"Legend: [*] feature is selected  [ ] feature is excluded"),
+ radiolist_instructions[] = N_(
+ 	"Use the arrow keys to navigate this window or "
+ 	"press the hotkey of the item you wish to select "
+@@ -200,18 +199,18 @@
+ 	"This feature depends on another which has been configured as a module.\n"
+ 	"As a result, this feature will be built as a module."),
+ nohelp_text[] = N_(
+-	"There is no help available for this kernel option.\n"),
++	"There is no help available for this option.\n"),
+ load_config_text[] = N_(
+ 	"Enter the name of the configuration file you wish to load.  "
+ 	"Accept the name shown to restore the configuration you "
+ 	"last retrieved.  Leave blank to abort."),
+ load_config_help[] = N_(
+ 	"\n"
+-	"For various reasons, one may wish to keep several different kernel\n"
++	"For various reasons, one may wish to keep several different Buildroot\n"
+ 	"configurations available on a single machine.\n"
+ 	"\n"
+ 	"If you have saved a previous configuration in a file other than the\n"
+-	"kernel's default, entering the name of the file here will allow you\n"
++	"Buildroot's default, entering the name of the file here will allow you\n"
+ 	"to modify that configuration.\n"
+ 	"\n"
+ 	"If you are uncertain, then you have probably never used alternate\n"
+@@ -221,7 +220,7 @@
+ 	"as an alternate.  Leave blank to abort."),
+ save_config_help[] = N_(
+ 	"\n"
+-	"For various reasons, one may wish to keep different kernel\n"
++	"For various reasons, one may wish to keep different Buildroot\n"
+ 	"configurations available on a single machine.\n"
+ 	"\n"
+ 	"Entering a file name here will allow you to later retrieve, modify\n"
+@@ -364,10 +363,10 @@
+ 	int size;
+ 	struct symbol *sym;
+ 
+-	sym = sym_lookup("KERNELVERSION", 0);
++	sym = sym_lookup("BR2_VERSION", 0);
+ 	sym_calc_value(sym);
+ 	size = snprintf(menu_backtitle, sizeof(menu_backtitle),
+-	                _("%s - Linux Kernel v%s Configuration"),
++	                _("%s - buildroot v%s Configuration"),
+ 		        config_filename, sym_get_string_value(sym));
+ 	if (size >= sizeof(menu_backtitle))
+ 		menu_backtitle[sizeof(menu_backtitle)-1] = '\0';
+@@ -894,7 +893,7 @@
+ 		if (conf_get_changed())
+ 			res = dialog_yesno(NULL,
+ 					   _("Do you wish to save your "
+-					     "new kernel configuration?\n"
++					     "new Buildroot configuration?\n"
+ 					     "<ESC><ESC> to continue."),
+ 					   6, 60);
+ 		else
+@@ -906,20 +905,20 @@
+ 	case 0:
+ 		if (conf_write(filename)) {
+ 			fprintf(stderr, _("\n\n"
+-				"Error during writing of the kernel configuration.\n"
+-				"Your kernel configuration changes were NOT saved."
++				"Error during writing of the Buildroot configuration.\n"
++				"Your Buildroot configuration changes were NOT saved."
+ 				"\n\n"));
+ 			return 1;
+ 		}
+ 	case -1:
+ 		printf(_("\n\n"
+-			"*** End of Linux kernel configuration.\n"
+-			"*** Execute 'make' to build the kernel or try 'make help'."
++			"*** End of Buildroot configuration.\n"
++			"*** Execute 'make' to build Buildroot or try 'make help'."
+ 			"\n\n"));
+ 		break;
+ 	default:
+ 		fprintf(stderr, _("\n\n"
+-			"Your kernel configuration changes were NOT saved."
++			"Your Buildroot configuration changes were NOT saved."
+ 			"\n\n"));
+ 	}
+ 
+Index: config.clean/qconf.cc
+===================================================================
+--- config.clean.orig/qconf.cc
++++ config.clean/qconf.cc
+@@ -1276,8 +1276,7 @@
+ 	char title[256];
+ 
+ 	QWidget *d = configApp->desktop();
+-	snprintf(title, sizeof(title), _("Linux Kernel v%s Configuration"),
+-		getenv("KERNELVERSION"));
++	snprintf(title, sizeof(title), _("Buildroot Configuration"));
+ 	setCaption(title);
+ 
+ 	width = configSettings->readNumEntry("/window width", d->width() - 64);
+Index: config.clean/zconf.tab.c_shipped
+===================================================================
+--- config.clean.orig/zconf.tab.c_shipped
++++ config.clean/zconf.tab.c_shipped
+@@ -2259,7 +2259,7 @@
+ 	modules_sym = sym_lookup(NULL, 0);
+ 	modules_sym->type = S_BOOLEAN;
+ 	modules_sym->flags |= SYMBOL_AUTO;
+-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
++	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
+ 
+ #if YYDEBUG
+ 	if (getenv("ZCONF_DEBUG"))
+Index: config.clean/zconf.y
+===================================================================
+--- config.clean.orig/zconf.y
++++ config.clean/zconf.y
+@@ -476,7 +476,7 @@
+ 	modules_sym = sym_lookup(NULL, 0);
+ 	modules_sym->type = S_BOOLEAN;
+ 	modules_sym->flags |= SYMBOL_AUTO;
+-	rootmenu.prompt = menu_add_prompt(P_MENU, "Linux Kernel Configuration", NULL);
++	rootmenu.prompt = menu_add_prompt(P_MENU, "Buildroot Configuration", NULL);
+ 
+ #if YYDEBUG
+ 	if (getenv("ZCONF_DEBUG"))
diff --git a/package/config/patches/02-cpp-comments-to-c-comments.patch b/package/config/patches/02-cpp-comments-to-c-comments.patch
new file mode 100644
index 0000000..a801319
--- /dev/null
+++ b/package/config/patches/02-cpp-comments-to-c-comments.patch
@@ -0,0 +1,178 @@
+---
+ expr.c |   42 +++++++++++++++++++++---------------------
+ 1 file changed, 21 insertions(+), 21 deletions(-)
+
+Index: config.clean/expr.c
+===================================================================
+--- config.clean.orig/expr.c
++++ config.clean/expr.c
+@@ -331,7 +331,7 @@
+ 		e->right.expr = expr_trans_bool(e->right.expr);
+ 		break;
+ 	case E_UNEQUAL:
+-		// FOO!=n -> FOO
++		/* FOO!=n -> FOO */
+ 		if (e->left.sym->type == S_TRISTATE) {
+ 			if (e->right.sym == &symbol_no) {
+ 				e->type = E_SYMBOL;
+@@ -380,19 +380,19 @@
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
+ 		     (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes))) {
+-			// (a='y') || (a='m') -> (a!='n')
++			/* (a='y') || (a='m') -> (a!='n') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_no);
+ 		}
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes))) {
+-			// (a='y') || (a='n') -> (a!='m')
++			/* (a='y') || (a='n') -> (a!='m') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_mod);
+ 		}
+ 		if (e1->type == E_EQUAL && e2->type == E_EQUAL &&
+ 		    ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
+ 		     (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod))) {
+-			// (a='m') || (a='n') -> (a!='y')
++			/* (a='m') || (a='n') -> (a!='y') */
+ 			return expr_alloc_comp(E_UNEQUAL, sym1, &symbol_yes);
+ 		}
+ 	}
+@@ -443,29 +443,29 @@
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_yes) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_EQUAL && e1->right.sym == &symbol_yes))
+-		// (a) && (a='y') -> (a='y')
++		/* (a) && (a='y') -> (a='y') */
+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_no) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_no))
+-		// (a) && (a!='n') -> (a)
++		/* (a) && (a!='n') -> (a) */
+ 		return expr_alloc_symbol(sym1);
+ 
+ 	if ((e1->type == E_SYMBOL && e2->type == E_UNEQUAL && e2->right.sym == &symbol_mod) ||
+ 	    (e2->type == E_SYMBOL && e1->type == E_UNEQUAL && e1->right.sym == &symbol_mod))
+-		// (a) && (a!='m') -> (a='y')
++		/* (a) && (a!='m') -> (a='y') */
+ 		return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 	if (sym1->type == S_TRISTATE) {
+ 		if (e1->type == E_EQUAL && e2->type == E_UNEQUAL) {
+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+ 			sym2 = e1->right.sym;
+ 			if ((e2->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
+ 				return sym2 != e2->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
+ 							     : expr_alloc_symbol(&symbol_no);
+ 		}
+ 		if (e1->type == E_UNEQUAL && e2->type == E_EQUAL) {
+-			// (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b'
++			/* (a='b') && (a!='c') -> 'b'='c' ? 'n' : a='b' */
+ 			sym2 = e2->right.sym;
+ 			if ((e1->right.sym->flags & SYMBOL_CONST) && (sym2->flags & SYMBOL_CONST))
+ 				return sym2 != e1->right.sym ? expr_alloc_comp(E_EQUAL, sym1, sym2)
+@@ -474,19 +474,19 @@
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_no) ||
+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_yes)))
+-			// (a!='y') && (a!='n') -> (a='m')
++			/* (a!='y') && (a!='n') -> (a='m') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_mod);
+ 
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_yes && e2->right.sym == &symbol_mod) ||
+ 			    (e1->right.sym == &symbol_mod && e2->right.sym == &symbol_yes)))
+-			// (a!='y') && (a!='m') -> (a='n')
++			/* (a!='y') && (a!='m') -> (a='n') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_no);
+ 
+ 		if (e1->type == E_UNEQUAL && e2->type == E_UNEQUAL &&
+ 			   ((e1->right.sym == &symbol_mod && e2->right.sym == &symbol_no) ||
+ 			    (e1->right.sym == &symbol_no && e2->right.sym == &symbol_mod)))
+-			// (a!='m') && (a!='n') -> (a='m')
++			/* (a!='m') && (a!='n') -> (a='m') */
+ 			return expr_alloc_comp(E_EQUAL, sym1, &symbol_yes);
+ 
+ 		if ((e1->type == E_SYMBOL && e2->type == E_EQUAL && e2->right.sym == &symbol_mod) ||
+@@ -579,7 +579,7 @@
+ 	switch (e1->type) {
+ 	case E_OR:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO || BAR) && (!FOO && !BAR) -> n
++		/* (FOO || BAR) && (!FOO && !BAR) -> n */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_and(&tmp1, &tmp2);
+@@ -594,7 +594,7 @@
+ 		break;
+ 	case E_AND:
+ 		expr_eliminate_dups2(e1->type, &e1, &e1);
+-		// (FOO && BAR) || (!FOO || !BAR) -> y
++		/* (FOO && BAR) || (!FOO || !BAR) -> y */
+ 		tmp1 = expr_transform(expr_alloc_one(E_NOT, expr_copy(e1)));
+ 		tmp2 = expr_copy(e2);
+ 		tmp = expr_extract_eq_or(&tmp1, &tmp2);
+@@ -703,7 +703,7 @@
+ 	case E_NOT:
+ 		switch (e->left.expr->type) {
+ 		case E_NOT:
+-			// !!a -> a
++			/* !!a -> a */
+ 			tmp = e->left.expr->left.expr;
+ 			free(e->left.expr);
+ 			free(e);
+@@ -712,14 +712,14 @@
+ 			break;
+ 		case E_EQUAL:
+ 		case E_UNEQUAL:
+-			// !a='x' -> a!='x'
++			/* !a='x' -> a!='x' */
+ 			tmp = e->left.expr;
+ 			free(e);
+ 			e = tmp;
+ 			e->type = e->type == E_EQUAL ? E_UNEQUAL : E_EQUAL;
+ 			break;
+ 		case E_OR:
+-			// !(a || b) -> !a && !b
++			/* !(a || b) -> !a && !b */
+ 			tmp = e->left.expr;
+ 			e->type = E_AND;
+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
+@@ -728,7 +728,7 @@
+ 			e = expr_transform(e);
+ 			break;
+ 		case E_AND:
+-			// !(a && b) -> !a || !b
++			/* !(a && b) -> !a || !b */
+ 			tmp = e->left.expr;
+ 			e->type = E_OR;
+ 			e->right.expr = expr_alloc_one(E_NOT, tmp->right.expr);
+@@ -738,7 +738,7 @@
+ 			break;
+ 		case E_SYMBOL:
+ 			if (e->left.expr->left.sym == &symbol_yes) {
+-				// !'y' -> 'n'
++				/* !'y' -> 'n' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -747,7 +747,7 @@
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_mod) {
+-				// !'m' -> 'm'
++				/* !'m' -> 'm' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
+@@ -756,7 +756,7 @@
+ 				break;
+ 			}
+ 			if (e->left.expr->left.sym == &symbol_no) {
+-				// !'n' -> 'y'
++				/* !'n' -> 'y' */
+ 				tmp = e->left.expr;
+ 				free(e);
+ 				e = tmp;
diff --git a/package/config/patches/03-change-config-option-prefix.patch b/package/config/patches/03-change-config-option-prefix.patch
new file mode 100644
index 0000000..a786078
--- /dev/null
+++ b/package/config/patches/03-change-config-option-prefix.patch
@@ -0,0 +1,176 @@
+---
+ confdata.c |   57 +++++++++++++++++++++++++++------------------------------
+ 1 file changed, 27 insertions(+), 30 deletions(-)
+
+Index: config.clean/confdata.c
+===================================================================
+--- config.clean.orig/confdata.c
++++ config.clean/confdata.c
+@@ -11,6 +11,7 @@
+ #include <string.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <libgen.h>
+ 
+ #define LKC_DIRECT_LINK
+ #include "lkc.h"
+@@ -21,7 +22,7 @@
+ static const char *conf_filename;
+ static int conf_lineno, conf_warnings, conf_unsaved;
+ 
+-const char conf_defname[] = "arch/$ARCH/defconfig";
++const char conf_defname[] = ".defconfig";
+ 
+ static void conf_warning(const char *fmt, ...)
+ {
+@@ -36,7 +37,7 @@
+ 
+ const char *conf_get_configname(void)
+ {
+-	char *name = getenv("KCONFIG_CONFIG");
++	char *name = getenv("BUILDROOT_CONFIG");
+ 
+ 	return name ? name : ".config";
+ }
+@@ -212,22 +213,22 @@
+ 		sym = NULL;
+ 		switch (line[0]) {
+ 		case '#':
+-			if (memcmp(line + 2, "CONFIG_", 7))
++			if (line[1]!=' ')
+ 				continue;
+-			p = strchr(line + 9, ' ');
++			p = strchr(line + 2, ' ');
+ 			if (!p)
+ 				continue;
+ 			*p++ = 0;
+ 			if (strncmp(p, "is not set", 10))
+ 				continue;
+ 			if (def == S_DEF_USER) {
+-				sym = sym_find(line + 9);
++				sym = sym_find(line + 2);
+ 				if (!sym) {
+ 					sym_add_change_count(1);
+ 					break;
+ 				}
+ 			} else {
+-				sym = sym_lookup(line + 9, 0);
++				sym = sym_lookup(line + 2, 0);
+ 				if (sym->type == S_UNKNOWN)
+ 					sym->type = S_BOOLEAN;
+ 			}
+@@ -244,12 +245,8 @@
+ 				;
+ 			}
+ 			break;
+-		case 'C':
+-			if (memcmp(line, "CONFIG_", 7)) {
+-				conf_warning("unexpected data");
+-				continue;
+-			}
+-			p = strchr(line + 7, '=');
++		case 'A': case 'B': case 'C': case 'D': case 'E': case 'F': case 'G': case 'H': case 'I': case 'J': case 'K': case 'L': case 'M': case 'N': case 'O': case 'P': case 'Q': case 'R': case 'S': case 'T': case 'U': case 'V': case 'W': case 'X': case 'Y': case 'Z':
++			p = strchr(line, '=');
+ 			if (!p)
+ 				continue;
+ 			*p++ = 0;
+@@ -260,13 +257,13 @@
+ 					*p2 = 0;
+ 			}
+ 			if (def == S_DEF_USER) {
+-				sym = sym_find(line + 7);
++				sym = sym_find(line);
+ 				if (!sym) {
+ 					sym_add_change_count(1);
+ 					break;
+ 				}
+ 			} else {
+-				sym = sym_lookup(line + 7, 0);
++				sym = sym_lookup(line, 0);
+ 				if (sym->type == S_UNKNOWN)
+ 					sym->type = S_OTHER;
+ 			}
+@@ -480,19 +477,19 @@
+ 			case S_TRISTATE:
+ 				switch (sym_get_tristate_value(sym)) {
+ 				case no:
+-					fprintf(out, "# CONFIG_%s is not set\n", sym->name);
++					fprintf(out, "# %s is not set\n", sym->name);
+ 					break;
+ 				case mod:
+-					fprintf(out, "CONFIG_%s=m\n", sym->name);
++					fprintf(out, "%s=m\n", sym->name);
+ 					break;
+ 				case yes:
+-					fprintf(out, "CONFIG_%s=y\n", sym->name);
++					fprintf(out, "%s=y\n", sym->name);
+ 					break;
+ 				}
+ 				break;
+ 			case S_STRING:
+ 				str = sym_get_string_value(sym);
+-				fprintf(out, "CONFIG_%s=\"", sym->name);
++				fprintf(out, "%s=\"", sym->name);
+ 				while (1) {
+ 					l = strcspn(str, "\"\\");
+ 					if (l) {
+@@ -508,12 +505,12 @@
+ 			case S_HEX:
+ 				str = sym_get_string_value(sym);
+ 				if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
+-					fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
++					fprintf(out, "%s=%s\n", sym->name, str);
+ 					break;
+ 				}
+ 			case S_INT:
+ 				str = sym_get_string_value(sym);
+-				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
++				fprintf(out, "%s=%s\n", sym->name, str);
+ 				break;
+ 			}
+ 		}
+@@ -716,19 +713,19 @@
+ 			case no:
+ 				break;
+ 			case mod:
+-				fprintf(out, "CONFIG_%s=m\n", sym->name);
+-				fprintf(out_h, "#define CONFIG_%s_MODULE 1\n", sym->name);
++				fprintf(out, "%s=m\n", sym->name);
++				fprintf(out_h, "#define %s_MODULE 1\n", sym->name);
+ 				break;
+ 			case yes:
+-				fprintf(out, "CONFIG_%s=y\n", sym->name);
+-				fprintf(out_h, "#define CONFIG_%s 1\n", sym->name);
++				fprintf(out, "%s=y\n", sym->name);
++				fprintf(out_h, "#define %s 1\n", sym->name);
+ 				break;
+ 			}
+ 			break;
+ 		case S_STRING:
+ 			str = sym_get_string_value(sym);
+-			fprintf(out, "CONFIG_%s=\"", sym->name);
+-			fprintf(out_h, "#define CONFIG_%s \"", sym->name);
++			fprintf(out, "%s=\"", sym->name);
++			fprintf(out_h, "#define %s \"", sym->name);
+ 			while (1) {
+ 				l = strcspn(str, "\"\\");
+ 				if (l) {
+@@ -748,14 +745,14 @@
+ 		case S_HEX:
+ 			str = sym_get_string_value(sym);
+ 			if (str[0] != '0' || (str[1] != 'x' && str[1] != 'X')) {
+-				fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+-				fprintf(out_h, "#define CONFIG_%s 0x%s\n", sym->name, str);
++				fprintf(out, "%s=%s\n", sym->name, str);
++				fprintf(out_h, "#define %s 0x%s\n", sym->name, str);
+ 				break;
+ 			}
+ 		case S_INT:
+ 			str = sym_get_string_value(sym);
+-			fprintf(out, "CONFIG_%s=%s\n", sym->name, str);
+-			fprintf(out_h, "#define CONFIG_%s %s\n", sym->name, str);
++			fprintf(out, "%s=%s\n", sym->name, str);
++			fprintf(out_h, "#define %s %s\n", sym->name, str);
+ 			break;
+ 		default:
+ 			break;
diff --git a/package/config/patches/04-fedora-13-build-fix.patch b/package/config/patches/04-fedora-13-build-fix.patch
new file mode 100644
index 0000000..4fa72df
--- /dev/null
+++ b/package/config/patches/04-fedora-13-build-fix.patch
@@ -0,0 +1,17 @@
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: config.clean/Makefile
+===================================================================
+--- config.clean.orig/Makefile
++++ config.clean/Makefile
+@@ -165,7 +165,7 @@
+ HOSTLOADLIBES_qconf	= $(KC_QT_LIBS) -ldl
+ HOSTCXXFLAGS_qconf.o	= $(KC_QT_CFLAGS) -D LKC_DIRECT_LINK
+ 
+-HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0`
++HOSTLOADLIBES_gconf	= `pkg-config --libs gtk+-2.0 gmodule-2.0 libglade-2.0` -ldl
+ HOSTCFLAGS_gconf.o	= `pkg-config --cflags gtk+-2.0 gmodule-2.0 libglade-2.0` \
+                           -D LKC_DIRECT_LINK
+ 
diff --git a/package/config/patches/05-really-clean-everything.patch b/package/config/patches/05-really-clean-everything.patch
new file mode 100644
index 0000000..c206f55
--- /dev/null
+++ b/package/config/patches/05-really-clean-everything.patch
@@ -0,0 +1,28 @@
+---
+ Makefile |   13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+Index: config.clean/Makefile
+===================================================================
+--- config.clean.orig/Makefile
++++ config.clean/Makefile
+@@ -142,10 +142,15 @@
+ gconf-objs	:= gconf.o kconfig_load.o zconf.tab.o
+ endif
+ 
+-clean-files	:= lkc_defs.h qconf.moc .tmp_qtcheck \
+-		   .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
+-clean-files     += mconf qconf gconf
+-clean-files     += config.pot linux.pot
++clean-files := lkc_defs.h qconf.moc .tmp_qtcheck \
++               .tmp_gtkcheck zconf.tab.c lex.zconf.c zconf.hash.c gconf.glade.h
++clean-files += config.pot linux.pot
++clean-files += conf $(conf-objs)
++clean-files += mconf $(mconf-objs)
++clean-files += qconf qconf.o
++clean-files += gconf gconf.o
++clean-files += kconfig_load.o zconf.tab.o
++clean-files += $(kxgettext-objs)
+ 
+ # Check that we have the required ncurses stuff installed for lxdialog (menuconfig)
+ PHONY += $(obj)/dochecklxdialog
diff --git a/package/config/patches/06-br-build-system-integration.patch b/package/config/patches/06-br-build-system-integration.patch
new file mode 100644
index 0000000..1e340f3
--- /dev/null
+++ b/package/config/patches/06-br-build-system-integration.patch
@@ -0,0 +1,33 @@
+---
+ Makefile |   11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+Index: config.clean/Makefile
+===================================================================
+--- config.clean.orig/Makefile
++++ config.clean/Makefile
+@@ -124,14 +124,23 @@
+ ifeq ($(MAKECMDGOALS),menuconfig)
+ 	hostprogs-y += mconf
+ endif
++ifeq ($(findstring mconf,$(MAKECMDGOALS)),mconf)
++       hostprogs-y += mconf
++endif
+ 
+ ifeq ($(MAKECMDGOALS),xconfig)
+ 	qconf-target := 1
+ endif
++ifeq ($(findstring qconf,$(MAKECMDGOALS)),qconf)
++	qconf-target := 1
++endif
++
+ ifeq ($(MAKECMDGOALS),gconfig)
+ 	gconf-target := 1
+ endif
+-
++ifeq ($(findstring gconf,$(MAKECMDGOALS)),gconf)
++	gconf-target := 1
++endif
+ 
+ ifeq ($(qconf-target),1)
+ qconf-cxxobjs	:= qconf.o
diff --git a/package/config/patches/07-minor-makefile-fixes.patch b/package/config/patches/07-minor-makefile-fixes.patch
new file mode 100644
index 0000000..f0f68ee
--- /dev/null
+++ b/package/config/patches/07-minor-makefile-fixes.patch
@@ -0,0 +1,26 @@
+---
+ Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: config.clean/Makefile
+===================================================================
+--- config.clean.orig/Makefile
++++ config.clean/Makefile
+@@ -83,7 +83,7 @@
+ 	@echo  '  xconfig	  - Update current config utilising a QT based front-end'
+ 	@echo  '  gconfig	  - Update current config utilising a GTK based front-end'
+ 	@echo  '  oldconfig	  - Update current config utilising a provided .config as base'
+-	@echo  '  silentoldconfig - Same as oldconfig, but quietly'
++	@echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
+ 	@echo  '  randconfig	  - New config with random answer to all options'
+ 	@echo  '  defconfig	  - New config with default answer to all options'
+ 	@echo  '  allmodconfig	  - New config selecting modules when possible'
+@@ -104,7 +104,7 @@
+ # ===========================================================================
+ # Shared Makefile for the various kconfig executables:
+ # conf:	  Used for defconfig, oldconfig and related targets
+-# mconf:  Used for the mconfig target.
++# mconf:  Used for the menuconfig target
+ #         Utilizes the lxdialog package
+ # qconf:  Used for the xconfig target
+ #         Based on QT which needs to be installed to compile it
diff --git a/package/config/patches/08-make-write-deps.patch b/package/config/patches/08-make-write-deps.patch
new file mode 100644
index 0000000..b104134
--- /dev/null
+++ b/package/config/patches/08-make-write-deps.patch
@@ -0,0 +1,139 @@
+---
+ util.c |  117 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 116 insertions(+), 1 deletion(-)
+
+Index: config.clean/util.c
+===================================================================
+--- config.clean.orig/util.c
++++ config.clean/util.c
+@@ -26,6 +26,121 @@
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
++	char *str;
++	char dir[PATH_MAX+1], buf[PATH_MAX+1], buf2[PATH_MAX+1];
++	struct menu *menu;
++	struct symbol *sym;
++	struct property *prop, *p;
++	unsigned done;
++	const char * const name_tmp = "..make.deps.tmp";
++	FILE *out;
++	if (!name)
++		name = ".auto.deps";
++
++	strcpy(dir, conf_get_configname());
++	str = strrchr(dir, '/');
++	if (str)
++		str[1] = 0;
++	else
++		dir[0] = 0;
++
++	sprintf(buf, "%s%s", dir, name_tmp);
++	out = fopen(buf, "w");
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
++					    fprintf(out, "%s: $(BASE_TARGETS)", br2_symbol_printer(sym->name));
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
++	sprintf(buf2, "%s%s", dir, name);
++	rename(buf, buf2);
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
+@@ -68,7 +183,7 @@
+ 	fprintf(out, "\n$(deps_config): ;\n");
+ 	fclose(out);
+ 	rename("..config.tmp", name);
+-	return 0;
++	return write_make_deps(NULL);
+ }
+ 
+ 
diff --git a/package/config/patches/09-implement-kconfig-probability.patch b/package/config/patches/09-implement-kconfig-probability.patch
new file mode 100644
index 0000000..7adfc0b
--- /dev/null
+++ b/package/config/patches/09-implement-kconfig-probability.patch
@@ -0,0 +1,43 @@
+---
+ confdata.c |   21 +++++++++++++++++++--
+ 1 file changed, 19 insertions(+), 2 deletions(-)
+
+Index: config.clean/confdata.c
+===================================================================
+--- config.clean.orig/confdata.c
++++ config.clean/confdata.c
+@@ -812,7 +812,16 @@
+ 	struct symbol *sym, *csym;
+ 	struct property *prop;
+ 	struct expr *e;
+-	int i, cnt, def;
++	int i, cnt, def, prob = 50;
++
++	if (mode == def_random) {
++		char *endp, *env = getenv("KCONFIG_PROBABILITY");
++		if (env && *env) {
++			int tmp = (int)strtol(env, &endp, 10);
++			if (*endp == '\0' && tmp >= 0 && tmp <= 100)
++				prob = tmp;
++		}
++	}
+ 
+ 	for_all_symbols(i, sym) {
+ 		if (sym_has_value(sym))
+@@ -831,7 +840,15 @@
+ 				sym->def[S_DEF_USER].tri = no;
+ 				break;
+ 			case def_random:
+-				sym->def[S_DEF_USER].tri = (tristate)(rand() % 3);
++				cnt = (rand() % 100) - (100 - prob);
++				if (cnt < 0)
++					sym->def[S_DEF_USER].tri = no;
++				else
++					if ((sym_get_type(sym) == S_TRISTATE)
++					    && (cnt > prob/2))
++						sym->def[S_DEF_USER].tri = mod;
++					else
++						sym->def[S_DEF_USER].tri = yes;
+ 				break;
+ 			default:
+ 				continue;
diff --git a/package/config/patches/10-br-build-system.patch b/package/config/patches/10-br-build-system.patch
new file mode 100644
index 0000000..85125e5
--- /dev/null
+++ b/package/config/patches/10-br-build-system.patch
@@ -0,0 +1,80 @@
+---
+ Makefile.br |   53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ foo.h       |   12 ++++++++++++
+ 2 files changed, 65 insertions(+)
+
+Index: config/Makefile.br
+===================================================================
+--- /dev/null
++++ config/Makefile.br
+@@ -0,0 +1,53 @@
++src := .
++top_srcdir=../../
++top_builddir=../../
++srctree := .
++obj ?= .
++
++include Makefile
++#HOSTCFLAGS+=-Dinline="" -include foo.h
++-include $(obj)/.depend
++$(obj)/.depend: $(wildcard *.h *.c)
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) -MM *.c > $@ 2>/dev/null || :
++
++__hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
++host-csingle := $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
++host-cmulti := $(foreach m,$(__hostprogs),\
++           $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
++host-cxxmulti := $(foreach m,$(__hostprogs),\
++           $(if $($(m)-cxxobjs),$(m),$(if $($(m)-objs),)))
++host-cobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-objs))))
++host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxxobjs))))
++
++HOST_EXTRACFLAGS += -I$(obj)
++
++$(host-csingle): %: %.c
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
++
++$(host-cmulti): %: $(host-cobjs) $(host-cshlib)
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
++
++$(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
++	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
++
++$(obj)/%.o: %.c
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
++
++$(obj)/%.o: $(obj)/%.c
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$(@F)) -c $< -o $@
++
++$(obj)/%.o: %.cc
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$(@F)) -c $< -o $@
++
++$(obj)/%:: $(src)/%_shipped
++	$(Q)cat $< > $@
++
++clean:
++	$(Q)rm -f $(addprefix $(obj)/,$(clean-files))
++distclean: clean
++	$(Q)rm -f $(addprefix $(obj)/,$(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
++		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
++		mconf .depend)
++
++FORCE:
++.PHONY: FORCE clean distclean
+Index: config/foo.h
+===================================================================
+--- /dev/null
++++ config/foo.h
+@@ -0,0 +1,12 @@
++#ifndef __KCONFIG_FOO_H
++#define __KCONFIG_FOO_H
++
++#ifndef __APPLE__
++#include <features.h>
++#endif
++#include <limits.h>
++
++#ifndef PATH_MAX
++#define PATH_MAX 1024
++#endif
++#endif /* __KCONFIG_FOO_H */
diff --git a/package/config/patches/11-use-mktemp-for-lxdialog.patch b/package/config/patches/11-use-mktemp-for-lxdialog.patch
new file mode 100644
index 0000000..16fd8bf
--- /dev/null
+++ b/package/config/patches/11-use-mktemp-for-lxdialog.patch
@@ -0,0 +1,17 @@
+---
+ lxdialog/check-lxdialog.sh |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: config.clean/lxdialog/check-lxdialog.sh
+===================================================================
+--- config.clean.orig/lxdialog/check-lxdialog.sh
++++ config.clean/lxdialog/check-lxdialog.sh
+@@ -31,7 +31,7 @@
+ }
+ 
+ # Temp file, try to clean up after us
+-tmp=.lxdialog.tmp
++tmp=$(mktemp)
+ trap "rm -f $tmp" 0 1 2 3 15
+ 
+ # Check if we can link to ncurses
diff --git a/package/config/patches/12-fix-glade-file-path.patch b/package/config/patches/12-fix-glade-file-path.patch
new file mode 100644
index 0000000..233809a
--- /dev/null
+++ b/package/config/patches/12-fix-glade-file-path.patch
@@ -0,0 +1,17 @@
+---
+ gconf.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: config.clean/gconf.c
+===================================================================
+--- config.clean.orig/gconf.c
++++ config.clean/gconf.c
+@@ -1576,7 +1576,7 @@
+ 	/* Determine GUI path */
+ 	env = getenv(SRCTREE);
+ 	if (env)
+-		glade_file = g_strconcat(env, "/scripts/kconfig/gconf.glade", NULL);
++		glade_file = g_strconcat(env, "/package/config/gconf.glade", NULL);
+ 	else if (av[0][0] == '/')
+ 		glade_file = g_strconcat(av[0], ".glade", NULL);
+ 	else
diff --git a/package/config/patches/13-use-conf-write-autoconf.patch b/package/config/patches/13-use-conf-write-autoconf.patch
new file mode 100644
index 0000000..826852d
--- /dev/null
+++ b/package/config/patches/13-use-conf-write-autoconf.patch
@@ -0,0 +1,53 @@
+---
+ conf.c   |    4 ++++
+ mconf.c  |    2 +-
+ qconf.cc |    2 ++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: config.clean/conf.c
+===================================================================
+--- config.clean.orig/conf.c
++++ config.clean/conf.c
+@@ -611,6 +611,10 @@
+ 			fprintf(stderr, _("\n*** Error during writing of the Buildroot configuration.\n\n"));
+ 			exit(1);
+ 		}
++		if (conf_write_autoconf()) {
++			fprintf(stderr, _("\n*** Error during update of the Buildroot configuration.\n\n"));
++			return 1;
++		}
+ 	}
+ 	return 0;
+ }
+Index: config.clean/mconf.c
+===================================================================
+--- config.clean.orig/mconf.c
++++ config.clean/mconf.c
+@@ -922,6 +922,6 @@
+ 			"\n\n"));
+ 	}
+ 
+-	return 0;
++	return conf_write_autoconf();
+ }
+ 
+Index: config.clean/qconf.cc
+===================================================================
+--- config.clean.orig/qconf.cc
++++ config.clean/qconf.cc
+@@ -1608,6 +1608,7 @@
+ {
+ 	if (!conf_get_changed()) {
+ 		e->accept();
++		conf_write_autoconf();
+ 		return;
+ 	}
+ 	QMessageBox mb("qconf", _("Save configuration?"), QMessageBox::Warning,
+@@ -1618,6 +1619,7 @@
+ 	switch (mb.exec()) {
+ 	case QMessageBox::Yes:
+ 		conf_write(NULL);
++		conf_write_autoconf();
+ 	case QMessageBox::No:
+ 		e->accept();
+ 		break;
diff --git a/package/config/patches/14-support-out-of-tree-config.patch b/package/config/patches/14-support-out-of-tree-config.patch
new file mode 100644
index 0000000..4aae0c1
--- /dev/null
+++ b/package/config/patches/14-support-out-of-tree-config.patch
@@ -0,0 +1,253 @@
+---
+ conf.c     |    8 +++---
+ confdata.c |   71 ++++++++++++++++++++++++++++++++++++++++++++-----------------
+ lkc.h      |    1 
+ util.c     |   22 ++++++++++++++----
+ 4 files changed, 74 insertions(+), 28 deletions(-)
+
+Index: config.clean/conf.c
+===================================================================
+--- config.clean.orig/conf.c
++++ config.clean/conf.c
+@@ -496,16 +496,16 @@
+ 	}
+ 	name = av[optind];
+ 	conf_parse(name);
+-	//zconfdump(stdout);
+ 	if (sync_kconfig) {
+-		if (stat(".config", &tmpstat)) {
++		name = conf_get_configname();
++		if (stat(name, &tmpstat)) {
+ 			fprintf(stderr, _("***\n"
+ 				"*** You have not yet configured Buildroot!\n"
+-				"*** (missing .config file)\n"
++				"*** (missing .config file \"%s\")\n"
+ 				"***\n"
+ 				"*** Please run some configurator (e.g. \"make oldconfig\" or\n"
+ 				"*** \"make menuconfig\" or \"make xconfig\").\n"
+-				"***\n"));
++				"***\n"), name);
+ 			exit(1);
+ 		}
+ 	}
+Index: config.clean/confdata.c
+===================================================================
+--- config.clean.orig/confdata.c
++++ config.clean/confdata.c
+@@ -42,6 +42,11 @@
+ 	return name ? name : ".config";
+ }
+ 
++const char *conf_get_autoconfig_name(void)
++{
++	return getenv("KCONFIG_AUTOCONFIG");
++}
++
+ static char *conf_expand_value(const char *in)
+ {
+ 	struct symbol *sym;
+@@ -399,6 +404,9 @@
+ 	int use_timestamp = 1;
+ 	char *env;
+ 
++	if (!name)
++		name = conf_get_configname();
++
+ 	dirname[0] = 0;
+ 	if (name && name[0]) {
+ 		struct stat st;
+@@ -550,19 +558,31 @@
+ 
+ int conf_split_config(void)
+ {
+-	char *name, path[128];
++	const char *name;
++	char path[128];
++	char *opwd, *dir, *_name;
+ 	char *s, *d, c;
+ 	struct symbol *sym;
+ 	struct stat sb;
+ 	int res, i, fd;
+ 
+-	name = getenv("KCONFIG_AUTOCONFIG");
+-	if (!name)
+-		name = "include/config/auto.conf";
++	name = conf_get_autoconfig_name();
+ 	conf_read_simple(name, S_DEF_AUTO);
+ 
+-	if (chdir("include/config"))
++	opwd = malloc(256);
++	_name = strdup(name);
++	if (opwd == NULL || _name == NULL)
+ 		return 1;
++	opwd = getcwd(opwd, 256);
++	dir = dirname(_name);
++	if (dir == NULL) {
++		res = 1;
++		goto err;
++	}
++	if (chdir(dir)) {
++		res = 1;
++		goto err;
++	}
+ 
+ 	res = 0;
+ 	for_all_symbols(i, sym) {
+@@ -655,9 +675,11 @@
+ 		close(fd);
+ 	}
+ out:
+-	if (chdir("../.."))
+-		return 1;
+-
++	if (chdir(opwd))
++		res = 1;
++err:
++	free(opwd);
++	free(_name);
+ 	return res;
+ }
+ 
+@@ -665,23 +687,35 @@
+ {
+ 	struct symbol *sym;
+ 	const char *str;
+-	char *name;
++	const char *name;
+ 	FILE *out, *out_h;
+ 	time_t now;
+ 	int i, l;
++	char dir[PATH_MAX+1], buf[PATH_MAX+1];
++	char *s;
++
++	strcpy(dir, conf_get_configname());
++	s = strrchr(dir, '/');
++	if (s)
++		s[1] = 0;
++	else
++		dir[0] = 0;
+ 
+ 	sym_clear_all_valid();
+ 
+-	file_write_dep("include/config/auto.conf.cmd");
++	sprintf(buf, "%s.config.cmd", dir);
++	file_write_dep(buf);
+ 
+ 	if (conf_split_config())
+ 		return 1;
+ 
+-	out = fopen(".tmpconfig", "w");
++	sprintf(buf, "%s.tmpconfig", dir);
++	out = fopen(buf, "w");
+ 	if (!out)
+ 		return 1;
+ 
+-	out_h = fopen(".tmpconfig.h", "w");
++	sprintf(buf, "%s.tmpconfig.h", dir);
++	out_h = fopen(buf, "w");
+ 	if (!out_h) {
+ 		fclose(out);
+ 		return 1;
+@@ -698,8 +732,7 @@
+ 	fprintf(out_h, "/*\n"
+ 		       " * Automatically generated C config: don't edit\n"
+ 		       " * %s"
+-		       " */\n"
+-		       "#define AUTOCONF_INCLUDED\n",
++		       " */\n",
+ 		       ctime(&now));
+ 
+ 	for_all_symbols(i, sym) {
+@@ -764,16 +797,16 @@
+ 	name = getenv("KCONFIG_AUTOHEADER");
+ 	if (!name)
+ 		name = "include/linux/autoconf.h";
+-	if (rename(".tmpconfig.h", name))
++	sprintf(buf, "%s.tmpconfig.h", dir);
++	if (rename(buf, name))
+ 		return 1;
+-	name = getenv("KCONFIG_AUTOCONFIG");
+-	if (!name)
+-		name = "include/config/auto.conf";
++	name = conf_get_autoconfig_name();
+ 	/*
+ 	 * This must be the last step, kbuild has a dependency on auto.conf
+ 	 * and this marks the successful completion of the previous steps.
+ 	 */
+-	if (rename(".tmpconfig", name))
++	sprintf(buf, "%s.tmpconfig", dir);
++	if (rename(buf, name))
+ 		return 1;
+ 
+ 	return 0;
+Index: config.clean/lkc.h
+===================================================================
+--- config.clean.orig/lkc.h
++++ config.clean/lkc.h
+@@ -74,6 +74,7 @@
+ 
+ /* confdata.c */
+ const char *conf_get_configname(void);
++const char *conf_get_autoconfig_name(void);
+ char *conf_get_default_confname(void);
+ void sym_set_change_count(int count);
+ void sym_add_change_count(int count);
+Index: config.clean/util.c
+===================================================================
+--- config.clean.orig/util.c
++++ config.clean/util.c
+@@ -144,6 +144,8 @@
+ /* write a dependency file as used by kbuild to track dependencies */
+ int file_write_dep(const char *name)
+ {
++	char *str;
++	char buf[PATH_MAX+1], buf2[PATH_MAX+1], dir[PATH_MAX+1];
+ 	struct symbol *sym, *env_sym;
+ 	struct expr *e;
+ 	struct file *file;
+@@ -151,7 +153,16 @@
+ 
+ 	if (!name)
+ 		name = ".kconfig.d";
+-	out = fopen("..config.tmp", "w");
++
++	strcpy(dir, conf_get_configname());
++	str = strrchr(dir, '/');
++	if (str)
++		str[1] = 0;
++	else
++		dir[0] = 0;
++
++	sprintf(buf, "%s..config.tmp", dir);
++	out = fopen(buf, "w");
+ 	if (!out)
+ 		return 1;
+ 	fprintf(out, "deps_config := \\\n");
+@@ -161,8 +172,8 @@
+ 		else
+ 			fprintf(out, "\t%s\n", file->name);
+ 	}
+-	fprintf(out, "\ninclude/config/auto.conf: \\\n"
+-		     "\t$(deps_config)\n\n");
++	fprintf(out, "\n%s: \\\n"
++		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
+ 
+ 	expr_list_for_each_sym(sym_env_list, e, sym) {
+ 		struct property *prop;
+@@ -176,13 +187,14 @@
+ 		if (!value)
+ 			value = "";
+ 		fprintf(out, "ifneq \"$(%s)\" \"%s\"\n", env_sym->name, value);
+-		fprintf(out, "include/config/auto.conf: FORCE\n");
++		fprintf(out, "%s: FORCE\n", conf_get_autoconfig_name());
+ 		fprintf(out, "endif\n");
+ 	}
+ 
+ 	fprintf(out, "\n$(deps_config): ;\n");
+ 	fclose(out);
+-	rename("..config.tmp", name);
++	sprintf(buf2, "%s%s", dir, name);
++	rename(buf, buf2);
+ 	return write_make_deps(NULL);
+ }
+ 
diff --git a/package/config/patches/15-misc-qconf-changes.patch b/package/config/patches/15-misc-qconf-changes.patch
new file mode 100644
index 0000000..683d518
--- /dev/null
+++ b/package/config/patches/15-misc-qconf-changes.patch
@@ -0,0 +1,175 @@
+---
+ qconf.cc |   48 +++++++++++++++++++++++++++---------------------
+ 1 file changed, 27 insertions(+), 21 deletions(-)
+
+Index: config.clean/qconf.cc
+===================================================================
+--- config.clean.orig/qconf.cc
++++ config.clean/qconf.cc
+@@ -5,6 +5,7 @@
+ 
+ #include <qapplication.h>
+ #include <qmainwindow.h>
++#include <qdesktopwidget.h>
+ #include <qtoolbar.h>
+ #include <qlayout.h>
+ #include <qvbox.h>
+@@ -297,10 +298,10 @@
+ void ConfigLineEdit::keyPressEvent(QKeyEvent* e)
+ {
+ 	switch (e->key()) {
+-	case Key_Escape:
++	case Qt::Key_Escape:
+ 		break;
+-	case Key_Return:
+-	case Key_Enter:
++	case Qt::Key_Return:
++	case Qt::Key_Enter:
+ 		sym_set_string_value(item->menu->sym, text().latin1());
+ 		parent()->updateList(item);
+ 		break;
+@@ -639,7 +640,7 @@
+ 	struct menu *menu;
+ 	enum prop_type type;
+ 
+-	if (ev->key() == Key_Escape && mode != fullMode && mode != listMode) {
++	if (ev->key() == Qt::Key_Escape && mode != fullMode && mode != listMode) {
+ 		emit parentSelected();
+ 		ev->accept();
+ 		return;
+@@ -652,8 +653,8 @@
+ 	item = (ConfigItem*)i;
+ 
+ 	switch (ev->key()) {
+-	case Key_Return:
+-	case Key_Enter:
++	case Qt::Key_Return:
++	case Qt::Key_Enter:
+ 		if (item->goParent) {
+ 			emit parentSelected();
+ 			break;
+@@ -667,16 +668,16 @@
+ 			emit menuSelected(menu);
+ 			break;
+ 		}
+-	case Key_Space:
++	case Qt::Key_Space:
+ 		changeValue(item);
+ 		break;
+-	case Key_N:
++	case Qt::Key_N:
+ 		setValue(item, no);
+ 		break;
+-	case Key_M:
++	case Qt::Key_M:
+ 		setValue(item, mod);
+ 		break;
+-	case Key_Y:
++	case Qt::Key_Y:
+ 		setValue(item, yes);
+ 		break;
+ 	default:
+@@ -920,7 +921,7 @@
+ }
+ 
+ ConfigInfoView::ConfigInfoView(QWidget* parent, const char *name)
+-	: Parent(parent, name), menu(0), sym(0)
++	: Parent(parent, name), sym(0), menu(0)
+ {
+ 	if (name) {
+ 		configSettings->beginGroup(name);
+@@ -1199,7 +1200,7 @@
+ 	layout1->addLayout(layout2);
+ 
+ 	split = new QSplitter(this);
+-	split->setOrientation(QSplitter::Vertical);
++	split->setOrientation(Qt::Vertical);
+ 	list = new ConfigView(split, name);
+ 	list->list->mode = listMode;
+ 	info = new ConfigInfoView(split, name);
+@@ -1275,7 +1276,7 @@
+ 	int x, y, width, height;
+ 	char title[256];
+ 
+-	QWidget *d = configApp->desktop();
++	QDesktopWidget *d = configApp->desktop();
+ 	snprintf(title, sizeof(title), _("Buildroot Configuration"));
+ 	setCaption(title);
+ 
+@@ -1289,14 +1290,14 @@
+ 		move(x, y);
+ 
+ 	split1 = new QSplitter(this);
+-	split1->setOrientation(QSplitter::Horizontal);
++	split1->setOrientation(Qt::Horizontal);
+ 	setCentralWidget(split1);
+ 
+ 	menuView = new ConfigView(split1, "menu");
+ 	menuList = menuView->list;
+ 
+ 	split2 = new QSplitter(split1);
+-	split2->setOrientation(QSplitter::Vertical);
++	split2->setOrientation(Qt::Vertical);
+ 
+ 	// create config tree
+ 	configView = new ConfigView(split2, "config");
+@@ -1314,18 +1315,18 @@
+ 	backAction = new QAction("Back", QPixmap(xpm_back), _("Back"), 0, this);
+ 	  connect(backAction, SIGNAL(activated()), SLOT(goBack()));
+ 	  backAction->setEnabled(FALSE);
+-	QAction *quitAction = new QAction("Quit", _("&Quit"), CTRL+Key_Q, this);
++	QAction *quitAction = new QAction("Quit", _("&Quit"), Qt::CTRL + Qt::Key_Q, this);
+ 	  connect(quitAction, SIGNAL(activated()), SLOT(close()));
+-	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), _("&Load"), CTRL+Key_L, this);
++	QAction *loadAction = new QAction("Load", QPixmap(xpm_load), _("&Load"), Qt::CTRL + Qt::Key_L, this);
+ 	  connect(loadAction, SIGNAL(activated()), SLOT(loadConfig()));
+-	saveAction = new QAction("Save", QPixmap(xpm_save), _("&Save"), CTRL+Key_S, this);
++	saveAction = new QAction("Save", QPixmap(xpm_save), _("&Save"), Qt::CTRL + Qt::Key_S, this);
+ 	  connect(saveAction, SIGNAL(activated()), SLOT(saveConfig()));
+ 	conf_set_changed_callback(conf_changed);
+ 	// Set saveAction's initial state
+ 	conf_changed();
+ 	QAction *saveAsAction = new QAction("Save As...", _("Save &As..."), 0, this);
+ 	  connect(saveAsAction, SIGNAL(activated()), SLOT(saveConfigAs()));
+-	QAction *searchAction = new QAction("Find", _("&Find"), CTRL+Key_F, this);
++	QAction *searchAction = new QAction("Find", _("&Find"), Qt::CTRL + Qt::Key_F, this);
+ 	  connect(searchAction, SIGNAL(activated()), SLOT(searchConfig()));
+ 	QAction *singleViewAction = new QAction("Single View", QPixmap(xpm_single_view), _("Single View"), 0, this);
+ 	  connect(singleViewAction, SIGNAL(activated()), SLOT(showSingleView()));
+@@ -1446,7 +1447,7 @@
+ 
+ void ConfigMainWindow::loadConfig(void)
+ {
+-	QString s = QFileDialog::getOpenFileName(".config", NULL, this);
++	QString s = QFileDialog::getOpenFileName(conf_get_configname(), NULL, this);
+ 	if (s.isNull())
+ 		return;
+ 	if (conf_read(QFile::encodeName(s)))
+@@ -1462,7 +1463,7 @@
+ 
+ void ConfigMainWindow::saveConfigAs(void)
+ {
+-	QString s = QFileDialog::getSaveFileName(".config", NULL, this);
++	QString s = QFileDialog::getSaveFileName(conf_get_configname(), NULL, this);
+ 	if (s.isNull())
+ 		return;
+ 	if (conf_write(QFile::encodeName(s)))
+@@ -1523,6 +1524,8 @@
+ 	case fullMode:
+ 		list = configList;
+ 		break;
++	default:
++		break;
+ 	}
+ 
+ 	if (list) {
+@@ -1674,6 +1677,9 @@
+ 	case fullMode :
+ 		entry = "full";
+ 		break;
++
++	default:
++		break;
+ 	}
+ 	configSettings->writeEntry("/listMode", entry);
+ 
diff --git a/package/config/patches/16-non-identified-changes.patch b/package/config/patches/16-non-identified-changes.patch
new file mode 100644
index 0000000..3a4bae5
--- /dev/null
+++ b/package/config/patches/16-non-identified-changes.patch
@@ -0,0 +1,47 @@
+---
+ lxdialog/checklist.c |    3 ++-
+ mconf.c              |   10 +++++++++-
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+Index: config.clean/lxdialog/checklist.c
+===================================================================
+--- config.clean.orig/lxdialog/checklist.c
++++ config.clean/lxdialog/checklist.c
+@@ -41,7 +41,8 @@
+ 	wmove(win, choice, check_x);
+ 	wattrset(win, selected ? dlg.check_selected.atr
+ 		 : dlg.check.atr);
+-	wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
++	if (!item_is_tag(':'))
++		wprintw(win, "(%c)", item_is_tag('X') ? 'X' : ' ');
+ 
+ 	wattrset(win, selected ? dlg.tag_selected.atr : dlg.tag.atr);
+ 	mvwaddch(win, choice, item_x, item_str()[0]);
+Index: config.clean/mconf.c
+===================================================================
+--- config.clean.orig/mconf.c
++++ config.clean/mconf.c
+@@ -731,7 +731,12 @@
+ 		for (child = menu->list; child; child = child->next) {
+ 			if (!menu_is_visible(child))
+ 				continue;
+-			item_make("%s", _(menu_get_prompt(child)));
++			if (child->sym)
++				item_make("%s", _(menu_get_prompt(child)));
++			else {
++				item_make("*** %s ***", _(menu_get_prompt(child)));
++				item_set_tag(':');
++			}
+ 			item_set_data(child);
+ 			if (child->sym == active)
+ 				item_set_selected(1);
+@@ -747,6 +752,9 @@
+ 		case 0:
+ 			if (selected) {
+ 				child = item_data();
++				if (!child->sym)
++					break;
++
+ 				sym_set_tristate_value(child->sym, yes);
+ 			}
+ 			return;
diff --git a/package/config/patches/series b/package/config/patches/series
new file mode 100644
index 0000000..d5ab94c
--- /dev/null
+++ b/package/config/patches/series
@@ -0,0 +1,16 @@
+01-kconfig-kernel-to-buildroot.patch
+02-cpp-comments-to-c-comments.patch
+03-change-config-option-prefix.patch
+04-fedora-13-build-fix.patch
+05-really-clean-everything.patch
+06-br-build-system-integration.patch
+07-minor-makefile-fixes.patch
+08-make-write-deps.patch
+09-implement-kconfig-probability.patch
+10-br-build-system.patch
+11-use-mktemp-for-lxdialog.patch
+12-fix-glade-file-path.patch
+13-use-conf-write-autoconf.patch
+14-support-out-of-tree-config.patch
+15-misc-qconf-changes.patch
+16-non-identified-changes.patch
-- 
1.7.0.4
