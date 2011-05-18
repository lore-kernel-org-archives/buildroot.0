From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:22:42 +0200
Subject: [Buildroot] [git commit] festival: remove packages
Message-ID: <20110518180429.A551283563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e3bf4de3298ec01cf6d91bc55758b4e605b52b88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Festival does not build, nobody cared since a long time, and they have
been marked deprecated since quite some time.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 -
 package/multimedia/festival/Config.in              |   27 ------
 package/multimedia/festival/festival.mk            |    4 -
 .../festival/festival/festival-1.96-beta-doc.patch |   23 -----
 .../festival/festival-1.96-beta-etcsiteinit.patch  |   55 -----------
 .../festival/festival-1.96-beta-libdir.patch       |   10 --
 .../festival-1.96-beta-speechtools-dir.patch       |   11 --
 package/multimedia/festival/festival/festival.mk   |   21 ----
 package/multimedia/festival/lexicons/Config.in     |   20 ----
 package/multimedia/festival/lexicons/festlex.mk    |   46 ---------
 package/multimedia/festival/speech-tools/Config.in |   10 --
 .../speech-tools-1.2.96-beta-install.patch         |   47 ---------
 .../festival/speech-tools/speech-tools.mk          |   31 ------
 package/multimedia/festival/voices/Config.in       |   63 -------------
 package/multimedia/festival/voices/festvox.mk      |   99 --------------------
 15 files changed, 0 insertions(+), 468 deletions(-)
 delete mode 100644 package/multimedia/festival/Config.in
 delete mode 100644 package/multimedia/festival/festival.mk
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-doc.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
 delete mode 100644 package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
 delete mode 100644 package/multimedia/festival/festival/festival.mk
 delete mode 100644 package/multimedia/festival/lexicons/Config.in
 delete mode 100644 package/multimedia/festival/lexicons/festlex.mk
 delete mode 100644 package/multimedia/festival/speech-tools/Config.in
 delete mode 100644 package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
 delete mode 100644 package/multimedia/festival/speech-tools/speech-tools.mk
 delete mode 100644 package/multimedia/festival/voices/Config.in
 delete mode 100644 package/multimedia/festival/voices/festvox.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index b8a0f21..b3d1e07 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -40,7 +40,6 @@ source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
-source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
diff --git a/package/multimedia/festival/Config.in b/package/multimedia/festival/Config.in
deleted file mode 100644
index e05fde9..0000000
--- a/package/multimedia/festival/Config.in
+++ /dev/null
@@ -1,27 +0,0 @@
-menuconfig BR2_PACKAGE_FESTIVAL
-	bool "festival text-to-speech system"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BROKEN # doesn't build
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_SPEECH_TOOLS
-	help
-	  Text to speech system for Linux
-
-if BR2_PACKAGE_FESTIVAL
-
-	menu "speech tools"
-		source "package/multimedia/festival/speech-tools/Config.in"
-	endmenu
-
-	menu "festival lexicons"
-		source "package/multimedia/festival/lexicons/Config.in"
-	endmenu
-
-	menu "festival voices"
-		source "package/multimedia/festival/voices/Config.in"
-	endmenu
-
-endif
-
-comment "festival requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/festival/festival.mk b/package/multimedia/festival/festival.mk
deleted file mode 100644
index 445dbc7..0000000
--- a/package/multimedia/festival/festival.mk
+++ /dev/null
@@ -1,4 +0,0 @@
-include package/multimedia/festival/speech-tools/speech-tools.mk
-include package/multimedia/festival/festival/festival.mk
-include package/multimedia/festival/voices/festvox.mk
-include package/multimedia/festival/lexicons/festlex.mk
diff --git a/package/multimedia/festival/festival/festival-1.96-beta-doc.patch b/package/multimedia/festival/festival/festival-1.96-beta-doc.patch
deleted file mode 100644
index 583cf6e..0000000
--- a/package/multimedia/festival/festival/festival-1.96-beta-doc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
---- a/doc/Makefile	2008-04-02 15:13:28.000000000 -0400
-+++ b/doc/Makefile	2008-04-02 15:13:09.000000000 -0400
-@@ -64,7 +64,7 @@ MANPAGES = festival.head festival.tail \
- FILES=Makefile $(MANPAGES) festival.texi $(SGMLFILES) refcard.tex  $(DOCXXFILES)
- LOCAL_CLEAN = *.aux *.cp *.fn *.ky *.log *.pg *.toc *.tp *.vr
- 
--ALL = festival.1 festival_client.1
-+#ALL = festival.1 festival_client.1
- 
- include $(TOP)/config/common_make_rules
- include $(EST)/config/rules/doc.mak
-@@ -72,9 +72,9 @@ include $(EST)/config/rules/doc.mak
- %.1 : %.head %.options %.tail 
- 	cat $^ >$@
- %.options : $(TOP)/src/main/%
--	$(TOP)/bin/$* -man_options >$@
-+#	$(TOP)/bin/$* -man_options >$@
- %.options : $(TOP)/src/main/%.exe
--	$(TOP)/bin/$* -man_options >$@
-+#	$(TOP)/bin/$* -man_options >$@
- 
- festival.info: festival.texi festfunc.texi festvars.texi festfeat.texi
- 	@ if [ ! -d info ] ; \
diff --git a/package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch b/package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
deleted file mode 100644
index 8e21ace..0000000
--- a/package/multimedia/festival/festival/festival-1.96-beta-etcsiteinit.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-diff -ur festival.orig/lib/init.scm festival/lib/init.scm
---- festival.orig/lib/init.scm	2004-07-15 19:03:04.000000000 -0400
-+++ festival/lib/init.scm	2007-03-15 11:58:09.000000000 -0400
-@@ -55,6 +55,10 @@
- (if (probe_file (path-append libdir "sitevars.scm"))
-     (load (path-append libdir "sitevars.scm")))
- 
-+(if (probe_file "/etc/festival/sitevars.scm")
-+    (load "/etc/festival/sitevars.scm"))
-+
-+
- ;;; CSTR siod extensions
- (require 'cstr)
- 
-@@ -98,7 +102,7 @@
-  (t  ;; can't find direct support so guess that /dev/audio for 8k ulaw exists
-   (Parameter.def 'Audio_Method 'sunaudio)))
- ;;;  If you have an external program to play audio add its definition
--;;;  in siteinit.scm
-+;;;  in ~/.festivalrc or /etc/festival/siteinit.scm
- 
- ;;; The audio spooler doesn't work under Windows so redefine audio_mode
- (if (member 'mplayeraudio *modules*)
-@@ -135,9 +139,13 @@
- ;;;
- ;;;  Local site initialization, if the file exists load it
- ;;;
-+
- (if (probe_file (path-append libdir "siteinit.scm"))
-     (load (path-append libdir "siteinit.scm")))
- 
-+(if (probe_file "/etc/festival/siteinit.scm")
-+    (load "/etc/festival/siteinit.scm"))
-+
- ;;;  User initialization, if a user has a personal customization
- ;;;  file loaded it
- (if (probe_file (path-append home-directory ".siodrc"))
-diff -ur festival.orig/lib/voices.scm festival/lib/voices.scm
---- festival.orig/lib/voices.scm	2005-05-02 10:20:37.000000000 -0400
-+++ festival/lib/voices.scm	2007-03-15 12:00:19.000000000 -0400
-@@ -45,12 +45,12 @@
- (defvar system-voice-path '( )
-   "system-voice-path
-    Additional directory not near the load path where voices can be
--   found, this can be redefined in lib/sitevars.scm if desired.")
-+   found, this can be redefined in /etc/festival/sitevars.scm if desired.")
- 
- (defvar system-voice-path-multisyn '( )
-   "system-voice-path-multisyn
-    Additional directory not near the load path where multisyn voices can be
--   found, this can be redefined in lib/sitevars.scm if desired.")
-+   found, this can be redefined in /etc/festival/sitevars.scm if desired.")
- 
- (defvar voice-path 
-   (remove-duplicates
diff --git a/package/multimedia/festival/festival/festival-1.96-beta-libdir.patch b/package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
deleted file mode 100644
index b076ad9..0000000
--- a/package/multimedia/festival/festival/festival-1.96-beta-libdir.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- a/config/project.mak	2005-05-02 10:21:29.000000000 -0400
-+++ b/config/project.mak	2008-04-01 14:22:01.000000000 -0400
-@@ -113,6 +113,6 @@ PROJECT_JAVA_ROOT=$(TOP)/src/modules/jav
- DOCXX_DIRS = $(TOP)/src 
- MODULE_TO_DOCXX = perl $(TOP)/src/modules/utilities/extract_module_doc++.prl
- 
--FTLIBDIR = $(FESTIVAL_HOME)/lib 
-+FTLIBDIR = /usr/share/festival/lib 
- 
- 
diff --git a/package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch b/package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
deleted file mode 100644
index 874d1f6..0000000
--- a/package/multimedia/festival/festival/festival-1.96-beta-speechtools-dir.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/config/config.in	2008-03-31 15:20:02.000000000 -0400
-+++ b/config/config.in	2008-03-31 15:26:09.000000000 -0400
-@@ -10,7 +10,7 @@
- ###########################################################################
- ## Which speech tools to use
- 
--EST=$(TOP)/../speech_tools
-+EST=$(TOP)/../speech-tools-1.2.96-beta
- 
- ###########################################################################
- ## Where the festival tree will be installed.
diff --git a/package/multimedia/festival/festival/festival.mk b/package/multimedia/festival/festival/festival.mk
deleted file mode 100644
index 4c270d4..0000000
--- a/package/multimedia/festival/festival/festival.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-#############################################################
-#
-# festival
-#
-#############################################################
-FESTIVAL_VERSION = 1.96-beta
-FESTIVAL_SOURCE = festival-$(FESTIVAL_VERSION).tar.gz
-FESTIVAL_SITE = http://festvox.org/packed/festival/1.96
-FESTIVAL_AUTORECONF = NO
-FESTIVAL_INSTALL_STAGING = NO
-FESTIVAL_INSTALL_TARGET = YES
-FESTIVAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
-
-FESTIVAL_CONF_OPT = --prefix=/usr --libdir=/usr/share/festival/lib
-
-FESTIVAL_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"
-
-FESTIVAL_DEPENDENCIES = alsa-lib speech-tools
-
-$(eval $(call AUTOTARGETS,package/multimedia/festival,festival))
-
diff --git a/package/multimedia/festival/lexicons/Config.in b/package/multimedia/festival/lexicons/Config.in
deleted file mode 100644
index 6d92883..0000000
--- a/package/multimedia/festival/lexicons/Config.in
+++ /dev/null
@@ -1,20 +0,0 @@
-config BR2_PACKAGE_FESTLEX_CMU
-	bool "Carnegie Mellon University"
-	help
-	  Lexicon for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTLEX_OALD
-	bool "Oxford Advanced Learners dictionary"
-	help
-	  Lexicon for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTLEX_POS
-	bool "POSLEX"
-	help
-	  Lexicon for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
diff --git a/package/multimedia/festival/lexicons/festlex.mk b/package/multimedia/festival/lexicons/festlex.mk
deleted file mode 100644
index 80d37d5..0000000
--- a/package/multimedia/festival/lexicons/festlex.mk
+++ /dev/null
@@ -1,46 +0,0 @@
-#############################################################
-#
-# festival lexicons
-#
-#############################################################
-LEX1 = festlex_CMU.tar.gz
-LEX2 = festlex_OALD.tar.gz
-LEX3 = festlex_POSLEX.tar.gz
-FESTLEX_STATUS_DIR = $(BUILD_DIR)/festival_lexicons
-FESTLEX_INSTALL_DIR = $(TARGET_DIR)/usr/share
-
-$(FESTLEX_STATUS_DIR)/.downloaded:
-	mkdir -p $(FESTLEX_STATUS_DIR)
-ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(LEX1))
-endif
-ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(LEX2))
-endif
-ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(LEX3))
-endif
-	touch $@
-
-$(FESTLEX_STATUS_DIR)/.installed: $(FESTLEX_STATUS_DIR)/.downloaded
-ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
-	tar -xvf $(DL_DIR)/$(LEX1) --directory $(FESTLEX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
-	tar -xvf $(DL_DIR)/$(LEX2) --directory $(FESTLEX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
-	tar -xvf $(DL_DIR)/$(LEX3) --directory $(FESTLEX_INSTALL_DIR)
-endif
-	touch $@
-
-festlex: $(FESTLEX_STATUS_DIR)/.installed
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FESTIVAL),y)
-TARGETS+=festlex
-endif
diff --git a/package/multimedia/festival/speech-tools/Config.in b/package/multimedia/festival/speech-tools/Config.in
deleted file mode 100644
index e82ea1e..0000000
--- a/package/multimedia/festival/speech-tools/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_SPEECH_TOOLS
-	bool "speech tools for festival"
-	depends on BR2_INSTALL_LIBSTDCPP
-	help
-	  Speech tools for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-comment "speech tools requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch b/package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
deleted file mode 100644
index 3cc47d3..0000000
--- a/package/multimedia/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
+++ /dev/null
@@ -1,47 +0,0 @@
---- a/config/rules/install.mak	2001-04-04 07:55:32.000000000 -0400
-+++ b/config/rules/install.mak	2008-04-03 12:37:45.000000000 -0400
-@@ -50,9 +50,9 @@ ifneq ($(SHARED),0)
- endif
- endif
- 
--ifeq ($(PROJECT_HOME_PATH), $(PROJECT_TOP_PATH))
--    TO_INSTALL=make_bin
--else
-+#ifeq ($(PROJECT_HOME_PATH), $(PROJECT_TOP_PATH))
-+#    TO_INSTALL=make_bin
-+#else
- 
-     TO_INSTALL= \
- 	make_installed_exec$(S) \
-@@ -62,7 +62,7 @@ else
-     INSTALLED_LIB=$(shell (cd $($(PROJECT_PREFIX)_HOME); pwd))/lib
-     INSTALLED_PRIVATE_LIB=$(INSTALLED_LIB)/$(shell echo $(PROJECT_PREFIX)| tr A-Z a-z)
-     INSTALLED_BIN=$(shell (cd $($(PROJECT_PREFIX)_HOME); pwd))/bin
--endif
-+#endif
- 
- install: $(TO_INSTALL)
- 
---- a/config/rules/bin_process.mak	2004-01-27 18:56:39.000000000 -0500
-+++ b/config/rules/bin_process.mak	2008-04-03 12:37:31.000000000 -0400
-@@ -69,10 +69,17 @@ endif
- 	    do \
- 	    b=`basename "$$i"`;\
- 	    $(ECHO_N) " $$b";\
--	    $(INSTALL_PROG) -s "$$main/$$i" "$(subst TOP,$(TOP),$(BIN))/$$b";\
-+	    $(INSTALL_PROG) "$$main/$$i" "$(DESTDIR)/usr/bin/$$b";\
-+		$(STRIP) "$(DESTDIR)/usr/bin/$$b";\
- 	done
--	@echo
--
-+	@$(ECHO_N) "Install Scheme Libraries:"
-+	@main=`pwd` ;\
-+	mkdir -p "$(DESTDIR)/usr/share/festival"; cp -a "$$main/../../lib" "$(DESTDIR)/usr/share/festival";\
-+	for i in `find "$(DESTDIR)/usr/share/festival/lib" -name Makefile`;\
-+		do \
-+		rm "$$i"; \
-+	done
-+ 
- .link_main: 
- 	@$(MAKE) MADE_FROM_ABOVE=1 --no-print-directory -C '$(PROJECT_MAIN_DIR)' BIN=TOP/$(DIRNAME) LIBDIR=MAIN/TOP/$(PROJECT_LIBRARY_DIR) MAIN='$($(PROJECT_PREFIX)_HOME)' .link_main$(S)
- 
diff --git a/package/multimedia/festival/speech-tools/speech-tools.mk b/package/multimedia/festival/speech-tools/speech-tools.mk
deleted file mode 100644
index 66bd308..0000000
--- a/package/multimedia/festival/speech-tools/speech-tools.mk
+++ /dev/null
@@ -1,31 +0,0 @@
-#############################################################
-#
-# speech-tools
-#
-#############################################################
-
-SPEECH_TOOLS_VERSION = 1.2.96~beta
-SPEECH_TOOLS_SOURCE = speech-tools_$(SPEECH_TOOLS_VERSION).orig.tar.gz
-SPEECH_TOOLS_PATCH = speech-tools_$(SPEECH_TOOLS_VERSION)-6.diff.gz
-SPEECH_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/speech-tools/
-SPEECH_TOOLS_AUTORECONF = NO
-SPEECH_TOOLS_INSTALL_STAGING = NO
-SPEECH_TOOLS_INSTALL_TARGET = YES
-SPEECH_TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
-
-SPEECH_TOOLS_CONF_OPT =
-SPEECH_TOOLS_MAKE_OPT = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"
-
-define SPEECH_TOOLS_DEBIAN_PATCH_APPLY
-	# Use the order of the quilt patch series to apply the patches
-	for p in $$(cat $(@D)/debian/patches/series) ; do \
-                toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches $$p; \
-        done
-endef
-
-SPEECH_TOOLS_POST_PATCH_HOOKS += SPEECH_TOOLS_DEBIAN_PATCH_APPLY
-
-SPEECH_TOOLS_DEPENDENCIES = ncurses
-
-$(eval $(call AUTOTARGETS,package/multimedia/festival,speech-tools))
-
diff --git a/package/multimedia/festival/voices/Config.in b/package/multimedia/festival/voices/Config.in
deleted file mode 100644
index b0a1cc0..0000000
--- a/package/multimedia/festival/voices/Config.in
+++ /dev/null
@@ -1,63 +0,0 @@
-config BR2_PACKAGE_FESTVOX_AWB
-	bool "Alan Scottish English"
-	help
-	  Scottish English voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_BDL
-	bool "Brian US English"
-	help
-	  US English male voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_JMK
-	bool "John Canadian English"
-	help
-	  Canadian English voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_SLT
-	bool "Stephanie US English"
-	help
-	  US English female voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_AWB_MULTISYN
-	bool "Alan multisyn (big file)"
-	help
-	  voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_JMK_MULTISYN
-	bool "John multisyn (big file)"
-	help
-	  voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_KAL_SIXTEENK
-	bool "Kevin diphone US English 16k"
-	help
-	  diphone voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_KED_EIGHTK
-	bool "Kurt diphone American English 8k"
-	help
-	  diphone voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
-config BR2_PACKAGE_FESTVOX_KED_SIXTEENK
-	bool "Kurt diphone American English 16k"
-	help
-	  diphone voice for the festival text to speech system
-
-	  http://festvox.org/packed/festival/latest
-
diff --git a/package/multimedia/festival/voices/festvox.mk b/package/multimedia/festival/voices/festvox.mk
deleted file mode 100644
index a2ee169..0000000
--- a/package/multimedia/festival/voices/festvox.mk
+++ /dev/null
@@ -1,99 +0,0 @@
-#############################################################
-#
-# festival voices
-#
-#############################################################
-VOICE1 = festvox_cmu_us_awb_arctic_hts.tar.gz
-VOICE2 = festvox_cmu_us_bdl_arctic_hts.tar.gz
-VOICE3 = festvox_cmu_us_jmk_arctic_hts.tar.gz
-VOICE4 = festvox_cmu_us_slt_arctic_hts.tar.gz
-VOICE5 = festvox_cstr_us_awb_arctic_multisyn-1.0.tar.gz
-VOICE6 = festvox_cstr_us_jmk_arctic_multisyn-1.0.tar.gz
-VOICE7 = festvox_kallpc16k.tar.gz
-VOICE8 = festvox_kedlpc8k.tar.gz
-VOICE9 = festvox_kedlpc16k.tar.gz
-FRONTEND1 = festvox_us1.tar.gz
-FRONTEND2 = festvox_us2.tar.gz
-FRONTEND3 = festvox_us3.tar.gz
-FESTVOX_STATUS_DIR = $(BUILD_DIR)/festival_voices
-FESTVOX_INSTALL_DIR = $(TARGET_DIR)/usr/share
-
-$(FESTVOX_STATUS_DIR)/.downloaded:
-	mkdir -p $(FESTVOX_STATUS_DIR)
-ifeq ($(BR2_PACKAGE_FESTVOX_AWB),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE1))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_BDL),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE2))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_JMK),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE3))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_SLT),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE4))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_AWB_MULTISYN),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE5))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_JMK_MULTISYN),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE6))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KAL_SIXTEENK),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE7))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KED_EIGHTK),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE8))
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KED_SIXTEENK),y)
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(VOICE9))
-endif
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(FRONTEND1))
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(FRONTEND2))
-	$(call DOWNLOAD,$(FESTIVAL_SITE),$(FRONTEND3))
-
-	touch $@
-
-$(FESTVOX_STATUS_DIR)/.installed: $(FESTVOX_STATUS_DIR)/.downloaded
-ifeq ($(BR2_PACKAGE_FESTVOX_AWB),y)
-	tar -xvf $(DL_DIR)/$(VOICE1) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_BDL),y)
-	tar -xvf $(DL_DIR)/$(VOICE2) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_JMK),y)
-	tar -xvf $(DL_DIR)/$(VOICE3) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_SLT),y)
-	tar -xvf $(DL_DIR)/$(VOICE4) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_AWB_MULTISYN),y)
-	tar -xvf $(DL_DIR)/$(VOICE5) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_JMK_MULTISYN),y)
-	tar -xvf $(DL_DIR)/$(VOICE6) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KAL_SIXTEENK),y)
-	tar -xvf $(DL_DIR)/$(VOICE7) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KED_EIGHTK),y)
-	tar -xvf $(DL_DIR)/$(VOICE8) --directory $(FESTVOX_INSTALL_DIR)
-endif
-ifeq ($(BR2_PACKAGE_FESTVOX_KED_SIXTEENK),y)
-	tar -xvf $(DL_DIR)/$(VOICE9) --directory $(FESTVOX_INSTALL_DIR)
-endif
-	tar -xvf $(DL_DIR)/$(FRONTEND1) --directory $(FESTVOX_INSTALL_DIR)
-	tar -xvf $(DL_DIR)/$(FRONTEND2) --directory $(FESTVOX_INSTALL_DIR)
-	tar -xvf $(DL_DIR)/$(FRONTEND3) --directory $(FESTVOX_INSTALL_DIR)
-
-	touch $@
-
-festvox: $(FESTVOX_STATUS_DIR)/.installed
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_FESTIVAL),y)
-TARGETS+=festvox
-endif
-- 
1.7.3.4
