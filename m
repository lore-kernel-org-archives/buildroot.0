From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 08:52:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822155201.E5041A45BB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 08:52:01 -0700 (Wed, 22 Aug 2007)
New Revision: 19649

Log:
- fix typo
- Start to add infrastructure to be able to download a patch.


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 15:51:00 UTC (rev 19648)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 15:52:01 UTC (rev 19649)
@@ -26,7 +26,7 @@
 #	file name of the package source
 # FOO_SITE [default sourceforge project "foo"]
 #	URL under wich $(FOO_SOURCE) can be found
-# FOO_DEPENDANCIES [default empty]
+# FOO_DEPENDENCIES [default empty]
 #	list of (package) targets that must be built before foo
 # FOO_AUTORECONF [YES/NO, default NO]
 #	run <autoreconf> before <configure>
@@ -98,7 +98,7 @@
 
 # UPPERCASE Macro -- transform its argument to uppercase and replace dots and 
 # hyphens to underscores
-UPPERCASE = $(shell echo $(1) | tr "a-z.-" "A-Z__")
+UPPERCASE = echo $(1) | tr "a-z.-" "A-Z__"
 
 # Define extrators for different archive suffixes
 INFLATE.bz2 = $(BZCAT)
@@ -109,10 +109,10 @@
 
 # MESSAGE Macro -- display a message in bold type
 MESSAGE = @echo $(TERM_BOLD) ; \
-	echo ">>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(shell tput rmso)" ; \
+	echo ">>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)"; \
 	echo $(TERM_RESET)
-TERM_BOLD = $(shell tput bold)
-TERM_RESET = $(shell tput rmso)
+TERM_BOLD = #$(shell tput bold)
+TERM_RESET = #$(shell tput rmso)
 
 # Utility programs used to build packages
 TAR ?= tar
@@ -130,6 +130,7 @@
 $(BUILD_DIR)/%/.stamp_downloaded:
 	$(call MESSAGE,"Downloading")
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	$(if $($(PKG)_PATCH),test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 	mkdir -p $(@D)
 	touch $@
 
@@ -255,7 +256,7 @@
 $(2)_SOURCE			?= $(1)-$$($(2)_VERSION).tar.gz
 $(2)_SITE			?= \
 	http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/$(1)
-$(2)_DEPENDANCIES		?=
+$(2)_DEPENDENCIES		?=
 $(2)_AUTORECONF			?= NO
 $(2)_CONF_ENV			?=
 $(2)_CONF_OPT			?=
@@ -311,7 +312,7 @@
 
 ifeq ($$($(2)_AUTORECONF),YES)
 $(1)-autoreconf:	$(1)-patch $$($(2)_TARGET_AUTORECONF)
-$(2)_DEPENDANCIES += host-automake host-autoconf host-libtool
+$(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 else
 $(1)-autoreconf:	$(1)-patch
 endif
@@ -320,7 +321,7 @@
 
 $(1)-extract:		$(1)-depends $$($(2)_TARGET_EXTRACT)
 
-$(1)-depends:		$(1)-source $$($(2)_DEPENDANCIES)
+$(1)-depends:		$(1)-source $$($(2)_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 
