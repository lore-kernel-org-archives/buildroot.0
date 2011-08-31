From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2011 23:35:06 +0200
Subject: [Buildroot] [PATCH 7/7] support: move package/gnuconfig to
	support/gnuconfig
In-Reply-To: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
References: <cover.1314826483.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2072e42d074f370769f62ccaacf34b84900da8e3.1314826483.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CONFIG_UPDATE macro is no longer defined in
package/gnuconfig/gnuconfig.mk, but instead in
package/Makefile.autotools.in. It it also changed a little bit to take
the directory of the package sources as argument, and the AUTOTARGETS
infrastructure is updated to use this macro.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile                                           |    2 +-
 package/Makefile.autotools.in                      |   24 +++++++++++++++----
 package/cups/cups.mk                               |    2 +-
 package/gettext/gettext.mk                         |    3 +-
 package/gnuconfig/README.buildroot                 |   20 ----------------
 package/gnuconfig/gnuconfig.mk                     |    3 --
 package/lmbench/lmbench.mk                         |    2 +-
 {package => support}/gnuconfig/.cvsignore          |    0
 support/gnuconfig/README.buildroot                 |   25 ++++++++++++++++++++
 {package => support}/gnuconfig/config.guess        |    0
 {package => support}/gnuconfig/config.sub          |    0
 .../gnuconfig/patches/config.guess.uclibc.patch    |    0
 .../gnuconfig/patches/config.sub.ps2.patch         |    0
 support/scripts/pkg-stats                          |    1 -
 toolchain/elf2flt/elf2flt.mk                       |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    2 +-
 toolchain/gdb/gdb.mk                               |    2 +-
 17 files changed, 51 insertions(+), 37 deletions(-)
 delete mode 100644 package/gnuconfig/README.buildroot
 delete mode 100644 package/gnuconfig/gnuconfig.mk
 rename {package => support}/gnuconfig/.cvsignore (100%)
 create mode 100644 support/gnuconfig/README.buildroot
 rename {package => support}/gnuconfig/config.guess (100%)
 rename {package => support}/gnuconfig/config.sub (100%)
 rename {package => support}/gnuconfig/patches/config.guess.uclibc.patch (100%)
 rename {package => support}/gnuconfig/patches/config.sub.ps2.patch (100%)

diff --git a/Makefile b/Makefile
index 8dbee7c..b3e1986 100644
--- a/Makefile
+++ b/Makefile
@@ -193,7 +193,7 @@ unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
 
-GNU_HOST_NAME:=$(shell package/gnuconfig/config.guess)
+GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
 #############################################################
 #
diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 95e38ef..8efc129 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -22,6 +22,23 @@
 #
 ################################################################################
 
+
+#
+# Utility function to upgrade config.sub and config.guess files
+#
+# argument 1 : directory into which config.guess and config.sub need
+# to be updated. Note that config.sub and config.guess are searched
+# recursively in this directory.
+#
+define CONFIG_UPDATE
+       echo $(1)
+	for file in config.guess config.sub; do \
+		for i in $$(find $(1) -name $$file); do \
+			cp support/gnuconfig/$$file $$i; \
+		done; \
+	done
+endef
+
 ################################################################################
 # AUTOTARGETS_INNER -- defines how the configuration, compilation and
 # installation of an autotools package should be done, implements a
@@ -131,11 +148,8 @@ endif
 # Hook to update config.sub and config.guess if needed
 #
 define UPDATE_CONFIG_HOOK
-	for file in config.guess config.sub; do \
-		for i in $$$$(find $$(@D) -name $$$$file); do \
-			cp package/gnuconfig/$$$$file $$$$i; \
-		done; \
-	done
+       @$$(call MESSAGE, "Updating config.sub and config.guess")
+       $$(call CONFIG_UPDATE,$$(@D))
 endef
 
 $(2)_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 3b9f2e0..4e8db71 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -70,7 +70,7 @@ $(DL_DIR)/$(CUPS_SOURCE):
 $(CUPS_DIR)/.unpacked: $(DL_DIR)/$(CUPS_SOURCE)
 	$(CUPS_CAT) $(DL_DIR)/$(CUPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	support/scripts/apply-patches.sh $(CUPS_DIR) package/cups/ \*.patch
-	$(CONFIG_UPDATE) $(CUPS_DIR)
+	$(call CONFIG_UPDATE,$(CUPS_DIR))
 	touch $@
 
 $(CUPS_DIR)/.configured: $(CUPS_DIR)/.unpacked
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 332a2ca..f4c8c76 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -25,8 +25,7 @@ gettext-source: $(DL_DIR)/$(GETTEXT_SOURCE)
 $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	support/scripts/apply-patches.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
-	$(CONFIG_UPDATE) $(@D)
-	$(CONFIG_UPDATE) $(GETTEXT_DIR)/build-aux
+	$(call CONFIG_UPDATE,$(@D))
 	touch $@
 
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
diff --git a/package/gnuconfig/README.buildroot b/package/gnuconfig/README.buildroot
deleted file mode 100644
index fd43a68..0000000
--- a/package/gnuconfig/README.buildroot
+++ /dev/null
@@ -1,20 +0,0 @@
---- ABOUT ---
-This isnt a real package, it just exists to easily update the
-config.sub / config.guess files in packages to the latest version
-(since many bundled ones don't support the latest possible targets)
-
---- HOWTO ---
-To use, just add this to your unpack rule in the package.mk:
-$(CONFIG_UPDATE) $(PACKAGE_DIR)/
-
---- UPDATE ---
-GNU config is now managed in git, so to update:
-
-# git clone git://git.savannah.gnu.org/config.git
-# cp config/config.* .
-# for p in $(ls patches/*.patch); do patch -p0 < $p; done
-# rm -rf config
-
-A few local customizations are used to support uClibc so you may
-have to make sure they're still needed.  The patches are broken 
-out in the patches/ dir to keep things simple.
diff --git a/package/gnuconfig/gnuconfig.mk b/package/gnuconfig/gnuconfig.mk
deleted file mode 100644
index b6aa5fc..0000000
--- a/package/gnuconfig/gnuconfig.mk
+++ /dev/null
@@ -1,3 +0,0 @@
-# See README.buildroot
-gnuconfig-source:
-CONFIG_UPDATE = cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index fefb34f..535fc8c 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -8,7 +8,7 @@ LMBENCH_SOURCE:=lmbench-$(LMBENCH_VERSION).tgz
 LMBENCH_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lmbench/development/lmbench-3.0-a9/
 
 define LMBENCH_CONFIGURE_CMDS
-	$(CONFIG_UPDATE) $(@D)
+	$(call CONFIG_UPDATE,$(@D))
 	sed -i 's/CFLAGS=/CFLAGS+=/g' $(@D)/src/Makefile
 	sed -i '/cd .*doc/d' $(@D)/src/Makefile
 	sed -i '/include/d' $(@D)/src/Makefile
diff --git a/package/gnuconfig/.cvsignore b/support/gnuconfig/.cvsignore
similarity index 100%
rename from package/gnuconfig/.cvsignore
rename to support/gnuconfig/.cvsignore
diff --git a/support/gnuconfig/README.buildroot b/support/gnuconfig/README.buildroot
new file mode 100644
index 0000000..fe54354
--- /dev/null
+++ b/support/gnuconfig/README.buildroot
@@ -0,0 +1,25 @@
+--- HOWTO ---
+If your package uses config.guess and/or config.sub, then it probably
+relies on the autotools as its build system. In this case, you should
+use the AUTOTARGETS infrastructure, which will take care of updating
+the config.guess and/or config.sub files appropriately. See the
+Buildroot documentation for details about the AUTOTARGETS
+infrastructure.
+
+If for some reason your package does not use the AUTOTARGETS
+infrastructure, you can request the config.guess and/or config.sub
+files of your package to be updated by using:
+
+      $(call CONFIG_UPDATE,directory-of-your-package-sources)
+
+--- UPDATE ---
+GNU config is now managed in git, so to update:
+
+# git clone git://git.savannah.gnu.org/config.git
+# cp config/config.* .
+# for p in $(ls patches/*.patch); do patch -p0 < $p; done
+# rm -rf config
+
+A few local customizations are used to support uClibc so you may
+have to make sure they're still needed.  The patches are broken 
+out in the patches/ dir to keep things simple.
diff --git a/package/gnuconfig/config.guess b/support/gnuconfig/config.guess
similarity index 100%
rename from package/gnuconfig/config.guess
rename to support/gnuconfig/config.guess
diff --git a/package/gnuconfig/config.sub b/support/gnuconfig/config.sub
similarity index 100%
rename from package/gnuconfig/config.sub
rename to support/gnuconfig/config.sub
diff --git a/package/gnuconfig/patches/config.guess.uclibc.patch b/support/gnuconfig/patches/config.guess.uclibc.patch
similarity index 100%
rename from package/gnuconfig/patches/config.guess.uclibc.patch
rename to support/gnuconfig/patches/config.guess.uclibc.patch
diff --git a/package/gnuconfig/patches/config.sub.ps2.patch b/support/gnuconfig/patches/config.sub.ps2.patch
similarity index 100%
rename from package/gnuconfig/patches/config.sub.ps2.patch
rename to support/gnuconfig/patches/config.sub.ps2.patch
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 7bb2928..bb1c27d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -81,7 +81,6 @@ for i in $(find package/ -name '*.mk') ; do
 	$i = "package/games/games.mk" -o \
 	$i = "package/multimedia/multimedia.mk" -o \
 	$i = "package/customize/customize.mk" -o \
-	$i = "package/gnuconfig/gnuconfig.mk" -o \
 	$i = "package/matchbox/matchbox.mk" -o \
 	$i = "package/x11r7/x11r7.mk" ; then
 	echo "skipping $i" 1>&2
diff --git a/toolchain/elf2flt/elf2flt.mk b/toolchain/elf2flt/elf2flt.mk
index 7fecf3e..e74a655 100644
--- a/toolchain/elf2flt/elf2flt.mk
+++ b/toolchain/elf2flt/elf2flt.mk
@@ -14,7 +14,7 @@ $(ELF2FLT_DIR)/.unpacked:
 	touch $@
 
 $(ELF2FLT_DIR)/.patched: $(ELF2FLT_DIR)/.unpacked
-	$(CONFIG_UPDATE) $(@D)
+	$(call CONFIG_UPDATE,$(@D))
 	touch $@
 
 $(ELF2FLT_DIR)/.configured: $(ELF2FLT_DIR)/.patched
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 9232290..a2253c9 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -200,7 +200,7 @@ $(GCC_DIR)/.unpacked: $(DL_DIR)/$(GCC_SOURCE)
 	mkdir -p $(TOOLCHAIN_DIR)
 	rm -rf $(GCC_DIR)
 	$(GCC_CAT) $(DL_DIR)/$(GCC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	$(CONFIG_UPDATE) $(@D)
+	$(call CONFIG_UPDATE,$(@D))
 	touch $@
 
 gcc-patched: $(GCC_DIR)/.patched
diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index db46b12..4622616 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -38,7 +38,7 @@ endif
 ifneq ($(wildcard $(GDB_PATCH_DIR)),)
 	support/scripts/apply-patches.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch $(GDB_PATCH_EXTRA)
 endif
-	$(CONFIG_UPDATE) $(@D)
+	$(call CONFIG_UPDATE,$(@D))
 	touch $@
 
 gdb-patched: $(GDB_DIR)/.unpacked
-- 
1.7.4.1
