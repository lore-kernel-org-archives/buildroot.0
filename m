From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  3 Apr 2008 10:13:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: festival
	festival/festival festival/lex etc...
Message-ID: <20080403171347.45CE63C347@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-03 10:13:46 -0700 (Thu, 03 Apr 2008)
New Revision: 21627

Log:
add festival speech synthesis package from University of Edinburgh

Added:
   trunk/buildroot/package/festival/
   trunk/buildroot/package/festival/Config.in
   trunk/buildroot/package/festival/festival.mk
   trunk/buildroot/package/festival/festival/
   trunk/buildroot/package/festival/festival/festival-1.96-beta-doc.patch
   trunk/buildroot/package/festival/festival/festival-1.96-beta-etcsiteinit.patch
   trunk/buildroot/package/festival/festival/festival-1.96-beta-libdir.patch
   trunk/buildroot/package/festival/festival/festival-1.96-beta-speechtools-dir.patch
   trunk/buildroot/package/festival/festival/festival.mk
   trunk/buildroot/package/festival/lexicons/
   trunk/buildroot/package/festival/lexicons/Config.in
   trunk/buildroot/package/festival/lexicons/festlex.mk
   trunk/buildroot/package/festival/speech-tools/
   trunk/buildroot/package/festival/speech-tools/Config.in
   trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
   trunk/buildroot/package/festival/speech-tools/speech-tools.mk
   trunk/buildroot/package/festival/voices/
   trunk/buildroot/package/festival/voices/Config.in
   trunk/buildroot/package/festival/voices/festvox.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-04-03 11:44:09 UTC (rev 21626)
+++ trunk/buildroot/package/Config.in	2008-04-03 17:13:46 UTC (rev 21627)
@@ -289,6 +289,7 @@
 source "package/madplay/Config.in"
 source "package/mpg123/Config.in"
 source "package/speex/Config.in"
+source "package/festival/Config.in"
 endif
 
 menuconfig BR2_GRAPHIC_SUPPORT

Added: trunk/buildroot/package/festival/Config.in
===================================================================
--- trunk/buildroot/package/festival/Config.in	                        (rev 0)
+++ trunk/buildroot/package/festival/Config.in	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,23 @@
+menuconfig BR2_PACKAGE_FESTIVAL
+bool "festival text-to-speech system"
+default n
+select BR2_PACKAGE_ALSA_LIB
+select BR2_PACKAGE_SPEECH_TOOLS
+help
+	Text to speech system for Linux
+
+if BR2_PACKAGE_FESTIVAL
+
+	menu "speech tools"
+		source "package/festival/speech-tools/Config.in"
+	endmenu
+
+	menu "festival lexicons"
+		source "package/festival/lexicons/Config.in"
+	endmenu
+
+	menu "festival voices"
+		source "package/festival/voices/Config.in"
+	endmenu
+
+endif

Added: trunk/buildroot/package/festival/festival/festival-1.96-beta-doc.patch
===================================================================
--- trunk/buildroot/package/festival/festival/festival-1.96-beta-doc.patch	                        (rev 0)
+++ trunk/buildroot/package/festival/festival/festival-1.96-beta-doc.patch	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,23 @@
+--- a/doc/Makefile	2008-04-02 15:13:28.000000000 -0400
++++ b/doc/Makefile	2008-04-02 15:13:09.000000000 -0400
+@@ -64,7 +64,7 @@ MANPAGES = festival.head festival.tail \
+ FILES=Makefile $(MANPAGES) festival.texi $(SGMLFILES) refcard.tex  $(DOCXXFILES)
+ LOCAL_CLEAN = *.aux *.cp *.fn *.ky *.log *.pg *.toc *.tp *.vr
+ 
+-ALL = festival.1 festival_client.1
++#ALL = festival.1 festival_client.1
+ 
+ include $(TOP)/config/common_make_rules
+ include $(EST)/config/rules/doc.mak
+@@ -72,9 +72,9 @@ include $(EST)/config/rules/doc.mak
+ %.1 : %.head %.options %.tail 
+ 	cat $^ >$@
+ %.options : $(TOP)/src/main/%
+-	$(TOP)/bin/$* -man_options >$@
++#	$(TOP)/bin/$* -man_options >$@
+ %.options : $(TOP)/src/main/%.exe
+-	$(TOP)/bin/$* -man_options >$@
++#	$(TOP)/bin/$* -man_options >$@
+ 
+ festival.info: festival.texi festfunc.texi festvars.texi festfeat.texi
+ 	@ if [ ! -d info ] ; \

Added: trunk/buildroot/package/festival/festival/festival-1.96-beta-etcsiteinit.patch
===================================================================
--- trunk/buildroot/package/festival/festival/festival-1.96-beta-etcsiteinit.patch	                        (rev 0)
+++ trunk/buildroot/package/festival/festival/festival-1.96-beta-etcsiteinit.patch	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,55 @@
+diff -ur festival.orig/lib/init.scm festival/lib/init.scm
+--- festival.orig/lib/init.scm	2004-07-15 19:03:04.000000000 -0400
++++ festival/lib/init.scm	2007-03-15 11:58:09.000000000 -0400
+@@ -55,6 +55,10 @@
+ (if (probe_file (path-append libdir "sitevars.scm"))
+     (load (path-append libdir "sitevars.scm")))
+ 
++(if (probe_file "/etc/festival/sitevars.scm")
++    (load "/etc/festival/sitevars.scm"))
++
++
+ ;;; CSTR siod extensions
+ (require 'cstr)
+ 
+@@ -98,7 +102,7 @@
+  (t  ;; can't find direct support so guess that /dev/audio for 8k ulaw exists
+   (Parameter.def 'Audio_Method 'sunaudio)))
+ ;;;  If you have an external program to play audio add its definition
+-;;;  in siteinit.scm
++;;;  in ~/.festivalrc or /etc/festival/siteinit.scm
+ 
+ ;;; The audio spooler doesn't work under Windows so redefine audio_mode
+ (if (member 'mplayeraudio *modules*)
+@@ -135,9 +139,13 @@
+ ;;;
+ ;;;  Local site initialization, if the file exists load it
+ ;;;
++
+ (if (probe_file (path-append libdir "siteinit.scm"))
+     (load (path-append libdir "siteinit.scm")))
+ 
++(if (probe_file "/etc/festival/siteinit.scm")
++    (load "/etc/festival/siteinit.scm"))
++
+ ;;;  User initialization, if a user has a personal customization
+ ;;;  file loaded it
+ (if (probe_file (path-append home-directory ".siodrc"))
+diff -ur festival.orig/lib/voices.scm festival/lib/voices.scm
+--- festival.orig/lib/voices.scm	2005-05-02 10:20:37.000000000 -0400
++++ festival/lib/voices.scm	2007-03-15 12:00:19.000000000 -0400
+@@ -45,12 +45,12 @@
+ (defvar system-voice-path '( )
+   "system-voice-path
+    Additional directory not near the load path where voices can be
+-   found, this can be redefined in lib/sitevars.scm if desired.")
++   found, this can be redefined in /etc/festival/sitevars.scm if desired.")
+ 
+ (defvar system-voice-path-multisyn '( )
+   "system-voice-path-multisyn
+    Additional directory not near the load path where multisyn voices can be
+-   found, this can be redefined in lib/sitevars.scm if desired.")
++   found, this can be redefined in /etc/festival/sitevars.scm if desired.")
+ 
+ (defvar voice-path 
+   (remove-duplicates

Added: trunk/buildroot/package/festival/festival/festival-1.96-beta-libdir.patch
===================================================================
--- trunk/buildroot/package/festival/festival/festival-1.96-beta-libdir.patch	                        (rev 0)
+++ trunk/buildroot/package/festival/festival/festival-1.96-beta-libdir.patch	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,10 @@
+--- a/config/project.mak	2005-05-02 10:21:29.000000000 -0400
++++ b/config/project.mak	2008-04-01 14:22:01.000000000 -0400
+@@ -113,6 +113,6 @@ PROJECT_JAVA_ROOT=$(TOP)/src/modules/jav
+ DOCXX_DIRS = $(TOP)/src 
+ MODULE_TO_DOCXX = perl $(TOP)/src/modules/utilities/extract_module_doc++.prl
+ 
+-FTLIBDIR = $(FESTIVAL_HOME)/lib 
++FTLIBDIR = /usr/share/festival/lib 
+ 
+ 

Added: trunk/buildroot/package/festival/festival/festival-1.96-beta-speechtools-dir.patch
===================================================================
--- trunk/buildroot/package/festival/festival/festival-1.96-beta-speechtools-dir.patch	                        (rev 0)
+++ trunk/buildroot/package/festival/festival/festival-1.96-beta-speechtools-dir.patch	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,11 @@
+--- a/config/config.in	2008-03-31 15:20:02.000000000 -0400
++++ b/config/config.in	2008-03-31 15:26:09.000000000 -0400
+@@ -10,7 +10,7 @@
+ ###########################################################################
+ ## Which speech tools to use
+ 
+-EST=$(TOP)/../speech_tools
++EST=$(TOP)/../speech-tools-1.2.96-beta
+ 
+ ###########################################################################
+ ## Where the festival tree will be installed.

Added: trunk/buildroot/package/festival/festival/festival.mk
===================================================================
--- trunk/buildroot/package/festival/festival/festival.mk	                        (rev 0)
+++ trunk/buildroot/package/festival/festival/festival.mk	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,21 @@
+#############################################################
+#
+# festival
+#
+#############################################################
+FESTIVAL_VERSION = 1.96-beta
+FESTIVAL_SOURCE = festival-$(FESTIVAL_VERSION).tar.gz
+FESTIVAL_SITE = http://festvox.org/packed/festival/latest
+FESTIVAL_AUTORECONF = NO
+FESTIVAL_INSTALL_STAGING = NO
+FESTIVAL_INSTALL_TARGET = YES
+FESTIVAL_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
+
+FESTIVAL_CONF_OPT = --prefix=/usr --libdir=/usr/share/festival/lib
+
+FESTIVAL_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
+
+FESTIVAL_DEPENDENCIES = uclibc alsa-lib speech-tools
+
+$(eval $(call AUTOTARGETS,package/festival,festival))
+

Added: trunk/buildroot/package/festival/festival.mk
===================================================================
--- trunk/buildroot/package/festival/festival.mk	                        (rev 0)
+++ trunk/buildroot/package/festival/festival.mk	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,4 @@
+include package/festival/speech-tools/speech-tools.mk
+include package/festival/festival/festival.mk
+include package/festival/voices/festvox.mk
+include package/festival/lexicons/festlex.mk

Added: trunk/buildroot/package/festival/lexicons/Config.in
===================================================================
--- trunk/buildroot/package/festival/lexicons/Config.in	                        (rev 0)
+++ trunk/buildroot/package/festival/lexicons/Config.in	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_FESTLEX_CMU
+	bool "Carnegie Mellon University"
+	default n
+	help
+	  Lexicon for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTLEX_OALD
+	bool "Oxford Advanced Learners dictionary"
+	default n
+	help
+	  Lexicon for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTLEX_POS
+	bool "POSLEX"
+	default n
+	help
+	  Lexicon for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
\ No newline at end of file

Added: trunk/buildroot/package/festival/lexicons/festlex.mk
===================================================================
--- trunk/buildroot/package/festival/lexicons/festlex.mk	                        (rev 0)
+++ trunk/buildroot/package/festival/lexicons/festlex.mk	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,46 @@
+#############################################################
+#
+# festival lexicons
+#
+#############################################################
+LEX1 = festlex_CMU.tar.gz
+LEX2 = festlex_OALD.tar.gz
+LEX3 = festlex_POSLEX.tar.gz
+FESTLEX_STATUS_DIR = $(BUILD_DIR)/festival_lexicons
+FESTLEX_INSTALL_DIR = $(TARGET_DIR)/usr/share
+
+$(FESTLEX_STATUS_DIR)/.downloaded:
+	mkdir -p $(FESTLEX_STATUS_DIR)
+ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
+endif
+ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
+endif
+ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)
+endif
+	touch $@
+
+$(FESTLEX_STATUS_DIR)/.installed: $(FESTLEX_STATUS_DIR)/.downloaded
+ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
+	tar -xvf $(DL_DIR)/$(LEX1) --directory $(FESTLEX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
+	tar -xvf $(DL_DIR)/$(LEX2) --directory $(FESTLEX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
+	tar -xvf $(DL_DIR)/$(LEX3) --directory $(FESTLEX_INSTALL_DIR)
+endif
+	touch $@
+
+festlex: $(FESTLEX_STATUS_DIR)/.installed
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_FESTIVAL)),y)
+TARGETS+=festlex
+endif

Added: trunk/buildroot/package/festival/speech-tools/Config.in
===================================================================
--- trunk/buildroot/package/festival/speech-tools/Config.in	                        (rev 0)
+++ trunk/buildroot/package/festival/speech-tools/Config.in	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,7 @@
+ config BR2_PACKAGE_SPEECH_TOOLS
+	bool "speech tools for festival"
+	default n
+	help
+	  Speech tools for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest

Added: trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
===================================================================
--- trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	                        (rev 0)
+++ trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,36 @@
+--- a/config/rules/install.mak	2001-04-04 07:55:32.000000000 -0400
++++ b/config/rules/install.mak	2008-04-03 12:37:45.000000000 -0400
+@@ -50,9 +50,9 @@ ifneq ($(SHARED),0)
+ endif
+ endif
+ 
+-ifeq ($(PROJECT_HOME_PATH), $(PROJECT_TOP_PATH))
+-    TO_INSTALL=make_bin
+-else
++#ifeq ($(PROJECT_HOME_PATH), $(PROJECT_TOP_PATH))
++#    TO_INSTALL=make_bin
++#else
+ 
+     TO_INSTALL= \
+ 	make_installed_exec$(S) \
+@@ -62,7 +62,7 @@ else
+     INSTALLED_LIB=$(shell (cd $($(PROJECT_PREFIX)_HOME); pwd))/lib
+     INSTALLED_PRIVATE_LIB=$(INSTALLED_LIB)/$(shell echo $(PROJECT_PREFIX)| tr A-Z a-z)
+     INSTALLED_BIN=$(shell (cd $($(PROJECT_PREFIX)_HOME); pwd))/bin
+-endif
++#endif
+ 
+ install: $(TO_INSTALL)
+ 
+--- a/config/rules/bin_process.mak	2004-01-27 18:56:39.000000000 -0500
++++ b/config/rules/bin_process.mak	2008-04-03 12:37:31.000000000 -0400
+@@ -69,7 +69,8 @@ endif
+ 	    do \
+ 	    b=`basename "$$i"`;\
+ 	    $(ECHO_N) " $$b";\
+-	    $(INSTALL_PROG) -s "$$main/$$i" "$(subst TOP,$(TOP),$(BIN))/$$b";\
++	    $(INSTALL_PROG) "$$main/$$i" "$(DESTDIR)/usr/bin/$$b";\
++		$(STRIP) "$(DESTDIR)/usr/bin/$$b";\
+ 	done
+ 	@echo
+ 

Added: trunk/buildroot/package/festival/speech-tools/speech-tools.mk
===================================================================
--- trunk/buildroot/package/festival/speech-tools/speech-tools.mk	                        (rev 0)
+++ trunk/buildroot/package/festival/speech-tools/speech-tools.mk	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# speech-tools
+#
+#############################################################
+SPEECH_TOOLS_VERSION = 1.2.96-beta
+SPEECH_TOOLS_SOURCE = speech_tools-$(SPEECH_TOOLS_VERSION).tar.gz
+SPEECH_TOOLS_SITE = http://festvox.org/packed/festival/latest
+SPEECH_TOOLS_AUTORECONF = NO
+SPEECH_TOOLS_INSTALL_STAGING = NO
+SPEECH_TOOLS_INSTALL_TARGET = YES
+SPEECH_TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) STRIP=$(TARGET_STRIP) install
+
+SPEECH_TOOLS_CONF_OPT = 
+SPEECH_TOOLS_MAKE_OPT = CC=$(TARGET_CC) CXX=$(TARGET_CXX)
+
+SPEECH_TOOLS_DEPENDENCIES = uclibc ncurses
+
+$(eval $(call AUTOTARGETS,package/festival,speech-tools))
+

Added: trunk/buildroot/package/festival/voices/Config.in
===================================================================
--- trunk/buildroot/package/festival/voices/Config.in	                        (rev 0)
+++ trunk/buildroot/package/festival/voices/Config.in	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,72 @@
+config BR2_PACKAGE_FESTVOX_AWB
+	bool "Alan Scottish English"
+	default n
+	help
+	  Scottish English voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_BDL
+	bool "Brian US English"
+	default n
+	help
+	  US English male voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_JMK
+	bool "John Canadian English"
+	default n
+	help
+	  Canadian English voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_SLT
+	bool "Stephanie US English"
+	default n
+	help
+	  US English female voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_AWB_MULTISYN
+	bool "Alan multisyn (big file)"
+	default n
+	help
+	  voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_JMK_MULTISYN
+	bool "John multisyn (big file)"
+	default n
+	help
+	  voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_KAL_SIXTEENK
+	bool "Kevin diphone US English 16k"
+	default n
+	help
+	  diphone voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_KED_EIGHTK
+	bool "Kurt diphone American English 8k"
+	default n
+	help
+	  diphone voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+
+config BR2_PACKAGE_FESTVOX_KED_SIXTEENK
+	bool "Kurt diphone American English 16k"
+	default n
+	help
+	  diphone voice for the festival text to speech system
+
+	  http://festvox.org/packed/festival/latest
+

Added: trunk/buildroot/package/festival/voices/festvox.mk
===================================================================
--- trunk/buildroot/package/festival/voices/festvox.mk	                        (rev 0)
+++ trunk/buildroot/package/festival/voices/festvox.mk	2008-04-03 17:13:46 UTC (rev 21627)
@@ -0,0 +1,99 @@
+#############################################################
+#
+# festival voices
+#
+#############################################################
+VOICE1 = festvox_cmu_us_awb_arctic_hts.tar.gz
+VOICE2 = festvox_cmu_us_bdl_arctic_hts.tar.gz
+VOICE3 = festvox_cmu_us_jmk_arctic_hts.tar.gz
+VOICE4 = festvox_cmu_us_slt_arctic_hts.tar.gz
+VOICE5 = festvox_cstr_us_awb_arctic_multisyn-1.0.tar.gz
+VOICE6 = festvox_cstr_us_jmk_arctic_multisyn-1.0.tar.gz
+VOICE7 = festvox_kallpc16k.tar.gz
+VOICE8 = festvox_kedlpc8k.tar.gz
+VOICE9 = festvox_kedlpc16k.tar.gz
+FRONTEND1 = festvox_us1.tar.gz
+FRONTEND2 = festvox_us2.tar.gz
+FRONTEND3 = festvox_us3.tar.gz
+FESTVOX_STATUS_DIR = $(BUILD_DIR)/festival_voices
+FESTVOX_INSTALL_DIR = $(TARGET_DIR)/usr/share
+
+$(FESTVOX_STATUS_DIR)/.downloaded:
+	mkdir -p $(FESTVOX_STATUS_DIR)
+ifeq ($(BR2_PACKAGE_FESTVOX_AWB),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE1)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_BDL),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE2)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_JMK),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE3)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_SLT),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE4)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_AWB_MULTISYN),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE5)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_JMK_MULTISYN),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE6)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KAL_SIXTEENK),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE7)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KED_EIGHTK),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE8)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KED_SIXTEENK),y)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(VOICE9)
+endif
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND1)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND2)
+	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(FRONTEND3)
+
+	touch $@
+
+$(FESTVOX_STATUS_DIR)/.installed: $(FESTVOX_STATUS_DIR)/.downloaded
+ifeq ($(BR2_PACKAGE_FESTVOX_AWB),y)
+	tar -xvf $(DL_DIR)/$(VOICE1) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_BDL),y)
+	tar -xvf $(DL_DIR)/$(VOICE2) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_JMK),y)
+	tar -xvf $(DL_DIR)/$(VOICE3) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_SLT),y)
+	tar -xvf $(DL_DIR)/$(VOICE4) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_AWB_MULTISYN),y)
+	tar -xvf $(DL_DIR)/$(VOICE5) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_JMK_MULTISYN),y)
+	tar -xvf $(DL_DIR)/$(VOICE6) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KAL_SIXTEENK),y)
+	tar -xvf $(DL_DIR)/$(VOICE7) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KED_EIGHTK),y)
+	tar -xvf $(DL_DIR)/$(VOICE8) --directory $(FESTVOX_INSTALL_DIR)
+endif
+ifeq ($(BR2_PACKAGE_FESTVOX_KED_SIXTEENK),y)
+	tar -xvf $(DL_DIR)/$(VOICE9) --directory $(FESTVOX_INSTALL_DIR)
+endif
+	tar -xvf $(DL_DIR)/$(FRONTEND1) --directory $(FESTVOX_INSTALL_DIR)
+	tar -xvf $(DL_DIR)/$(FRONTEND2) --directory $(FESTVOX_INSTALL_DIR)
+	tar -xvf $(DL_DIR)/$(FRONTEND3) --directory $(FESTVOX_INSTALL_DIR)
+
+	touch $@
+
+festvox: $(FESTVOX_STATUS_DIR)/.installed
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_FESTIVAL)),y)
+TARGETS+=festvox
+endif
