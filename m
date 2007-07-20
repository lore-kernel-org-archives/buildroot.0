From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 20 Jul 2007 14:30:49 +0200
Subject: [Buildroot] [RFC] Support for "distributions" in buildroot
Message-ID: <1184934649.6382.10.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is an inherent problem in buildroot, that things
are downloaded from a volatile Internet.
When packages disappear from Internet,
the build breaks for new users.
If we then update the package/<package>/<package>.mk
without testing too much, this might break someones
stable build, which is undesirable.

By introducing "distributions" defined in a separate
file containing lines like:


MYPKG_VERSION:=1.2.3
MYPKG_SITE:=http://www.old-site.org/

and then in the package/mypkg/mypkg.mk we have

ifeq ($(MYPKG_VERSION),)
MYPKG_VERSION:=1.2.4
endif
ifeq ($(MYPKG_SITE),)
MYPKG_SITE:=http://www.new-site.org/
endif

it will become possible for users to use whatever versions
they like, even if the mainstream buildroot changes.

It will become easier to update the package/<package>/<package>.mk
since other users will should not notice this.

The patch shoudl allow the user to create a new file
with the latest versions and then compare this with
his/her own version numbers.

The patch includes some example packages modified
to handle the patch (ruby, curl,portage)

Comments?



Index: project/config/uclibc.distrib
===================================================================
--- project/config/uclibc.distrib	(revision 0)
+++ project/config/uclibc.distrib	(revision 0)
@@ -0,0 +1,25 @@
+# This file contains overrides for 
+# package versions for the uclibc project.
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
+PORTAGE_VERSION:=2.0.51.22
+SANDBOX_VERSION:=1.2.13
Index: project/config/distrib_header
===================================================================
--- project/config/distrib_header	(revision 0)
+++ project/config/distrib_header	(revision 0)
@@ -0,0 +1,21 @@
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
Index: project/config/def_distrib
===================================================================
--- project/config/def_distrib	(revision 0)
+++ project/config/def_distrib	(revision 0)
@@ -0,0 +1,26 @@
+# This file contains the stable package versions
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
+CURL_VERSION:=7.13.1
+PORTAGE_VERSION:=2.0.51.22
+SANDBOX_VERSION:=1.2.13
+RUBY_VERSION:=1.8.2
Index: project/config/empty_distrib
===================================================================
--- project/config/empty_distrib	(revision 0)
+++ project/config/empty_distrib	(revision 0)
@@ -0,0 +1,3 @@
+# This file should be empty
+# This results in package versions inside
package/<package>/<package>.mk beeing used
+ 
Index: project/Config.in
===================================================================
--- project/Config.in	(revision 19171)
+++ project/Config.in	(arbetskopia)
@@ -23,4 +23,56 @@
 	help
 	  The banner string is stored in "/etc/issue"
 
+choice
+	prompt "Buildroot Distribution"
+	default BR2_DISTRIBUTION_STABLE
+	help
+	  The distribution file contains definitions of
+	  package version numbers, which overrides the
+	  default version number in package/<package>/<package>.mk
+	  The distribution file is stored in "project/config"
+	  If empty, a default distribution is used.
+
+config BR2_DISTRIBUTION_LATEST
+	bool "Use the latest package version"
+	help
+	  Use an empty distribution file,which
+	  results in using the versions defined in
+	  the package/<package>.mk
+
+config BR2_DISTRIBUTION_STABLE
+	bool "Use the latest stable package version"
+	help
+	  Use a distribution file containing tested
+          versions. Note that this may cause more problems
+	  when downloading the source, since the stable
+	  package tarballs may have been removed from
+	  their download site.
+
+config BR2_DISTRIBUTION_PROJECT
+	bool "Use $(PROJECT).distrib"
+	help
+	  Use package versions defined in the project distribution file
+	  It is located in "project/config"
+
+config BR2_DISTRIBUTION_CUSTOM
+	bool "Use your own distibution file"
+	help
+	  Use package versions defined in a custom distribution file
+	  Provide your own distribution file with full path
+
+endchoice
+
+config BR2_DISTRIBUTION_NAME
+	string	"Provide your own distribution file"
+	depends on BR2_DISTRIBUTION_CUSTOM
+	default ""
+
+config BR2_DISTRIBUTION
+	string
+	default "project/config/empty_distrib"		if BR2_DISTRIBUTION_LATEST
+	default "project/config/def_distrib"		if BR2_DISTRIBUTION_STABLE
+	default "project/config/$(PROJECT).distrib"	if
BR2_DISTRIBUTION_PROJECT
+	default "$(BR2_DISTRIBUTION_NAME)"		if BR2_DISTRIBUTION_CUSTOM
+
 endmenu
Index: package/ruby/ruby.mk
===================================================================
--- package/ruby/ruby.mk	(revision 19171)
+++ package/ruby/ruby.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # ruby
 #
 #############################################################
-RUBY_VERSION:=1.8.2
+ifeq ($(RUBY_VERSION),)
+RUBY_VERSION:=1.8.7
+endif
 RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
 RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.8
 RUBY_DIR:=$(BUILD_DIR)/ruby-$(RUBY_VERSION)
@@ -62,6 +64,9 @@
 ruby-dirclean:
 	rm -rf $(RUBY_DIR)
 
+ruby-version:
+	echo	RUBY_VERSION:=$(RUBY_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: package/curl/curl.mk
===================================================================
--- package/curl/curl.mk	(revision 19171)
+++ package/curl/curl.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.13.1
+ifeq ($(CURL_VERSION),)
+CURL_VERSION:=7.16.4
+endif
 CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
 CURL_SITE:=http://curl.haxx.se/download/
 CURL_CAT:=$(BZCAT)
@@ -69,6 +71,9 @@
 curl-dirclean:
 	rm -rf $(CURL_DIR)
 
+curl-version:
+	echo	CURL_VERSION:=$(CURL_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 19171)
+++ package/Makefile.in	(arbetskopia)
@@ -81,8 +81,8 @@
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_
$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
 BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
 TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
+DISTRIB:=.distrib
 
-
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))
 
Index: package/portage/portage.mk
===================================================================
--- package/portage/portage.mk	(revision 19171)
+++ package/portage/portage.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # portage
 #
 #############################################################
+ifeq ($(PORTAGE_VERSION),)
 PORTAGE_VERSION:=2.0.51.22
+endif
 PORTAGE_SOURCE:=portage-$(PORTAGE_VERSION).tar.bz2
 PORTAGE_SITE:=http://gentoo.osuosl.org/distfiles
 PORTAGE_CAT:=$(BZCAT)
@@ -11,7 +13,9 @@
 PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
 PORTAGE_TARGET_BINARY:=usr/bin/emerge
 
-SANDBOX_VERSION:=1.2.13
+ifeq ($(SANDBOX_VERSION),)
+SANDBOX_VERSION:=1.2.18.1
+endif
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
 SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
@@ -120,6 +124,13 @@
 	rm -rf $(PORTAGE_DIR)
 sandbox-dirclean:
 	rm -rf $(SANDBOX_DIR)
+
+portage-version:
+	echo	PORTAGE_VERSION:=$(PORTAGE_VERSION)	>> $(DISTRIB)
+
+sandbox-version:
+	echo	SANDBOX_VERSION:=$(SANDBOX_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: Makefile
===================================================================
--- Makefile	(revision 19171)
+++ Makefile	(arbetskopia)
@@ -166,8 +166,17 @@
 #"))
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
+DISTRIBUTION:=$(strip $(subst ",,$(BR2_DISTRIBUTION)))
+#"))
 
+DISTRIBUTION_EXISTS:=$(strip $(subst ",,$(shell ls $(DISTRIBUTION) |
grep -FzZ $(DISTRIBUTION))))
+#))
 
+ifneq ($(DISTRIBUTION_EXISTS),)
+include	$(DISTRIBUTION)
+
+endif
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -198,6 +207,7 @@
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
+TARGETS_VERSION:=$(patsubst %,%-version,$(TARGETS))
 
 world: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
 	$(BINARIES_DIR) $(STAGING_DIR) $(TARGET_DIR) bsp $(TARGETS)
@@ -205,6 +215,7 @@
 
 .PHONY: all world dirs clean dirclean distclean source bsp $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_VERSION) \
 	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
 	$(PROJECT_BUILD_DIR) $(BINARIES_DIR)
 
@@ -257,6 +268,40 @@
 
 #############################################################
 #
+# Support "distributions"
+#
+#############################################################
+
+project/config/$(PROJECT).distrib:
+	touch project/config/$(PROJECT).distrib
+	echo	"# This file contains overrides for "		>  $(DISTRIB)
+	echo	"# package versions for the $(PROJECT) project.">> $(DISTRIB)
+	cat  	project/config/distrib_header			>> $(DISTRIB)
+
+distrib-core:	$(TARGETS_VERSION)
+
+distrib:	distrib-clean project/config/$(PROJECT).distrib
+	cp	.config		$(PROJECT).config.tmp
+	make	allyesconfig
+	make	distrib-core
+	mv	$(DISTRIB)	project/config/$(PROJECT).distrib
+	mv $(PROJECT).config.tmp .config
+
+stable:
+	echo	"# This file contains the stable package versions"	>  $(DISTRIB)
+	cat  	project/config/distrib_header				>> $(DISTRIB)
+	make	allyesconfig
+	make	distrib-core
+	mv	.distrib	project/config/def_distrib
+
+distrib-clean:
+	rm -f project/config/$(PROJECT).distrib
+	rm -f .distrib
+	
+.PHONY:	distrib-core distrib stable distrib-clean
+
+#############################################################
+#
 # Cleanup and misc junk
 #
 #############################################################
@@ -368,7 +413,7 @@
 	rm -rf sources/*
 
 endif # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
-
+#############################################################
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
 	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)
Index: project/config/uclibc.distrib
===================================================================
--- project/config/uclibc.distrib	(revision 0)
+++ project/config/uclibc.distrib	(revision 0)
@@ -0,0 +1,27 @@
+gedit # This file contains overrides for 
+# package versions for the uclibc project.
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
+CURL_VERSION:=7.13.1
+PORTAGE_VERSION:=2.0.51.22
+SANDBOX_VERSION:=1.2.13
+RUBY_VERSION:=1.8.2
Index: project/config/distrib_header
===================================================================
--- project/config/distrib_header	(revision 0)
+++ project/config/distrib_header	(revision 0)
@@ -0,0 +1,21 @@
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
Index: project/config/def_distrib
===================================================================
--- project/config/def_distrib	(revision 0)
+++ project/config/def_distrib	(revision 0)
@@ -0,0 +1,26 @@
+# This file contains the stable package versions
+#
+# If you want to lock a package version for the package "mypkg"
+# you could write it in the following way in this file:
+#
+# MYPKG_VERSION:=2.6-stable
+# MYPKG_SITE:= http://www.new-site.org/
+#
+# If the SITE has not changed, then it is enough to define the VERSION.
+#
+# The package makefile fragment must contain the following code:
+#
+# -----------------------------------------------------
+# ifeq ($(MYPKG_VERSION),)
+# MYPKG_VERSION:=2.7-latest
+# endif
+# ifeq ($(MYPKG_SITE),)
+# MYPKG_VERSION:=http://www.old-site.org/
+# endif
+# -----------------------------------------------------
+#
+# for the distribution support to work
+CURL_VERSION:=7.13.1
+PORTAGE_VERSION:=2.0.51.22
+SANDBOX_VERSION:=1.2.13
+RUBY_VERSION:=1.8.2
Index: project/config/empty_distrib
===================================================================
--- project/config/empty_distrib	(revision 0)
+++ project/config/empty_distrib	(revision 0)
@@ -0,0 +1,3 @@
+# This file should be empty
+# This results in package versions inside
package/<package>/<package>.mk beeing used
+ 
Index: project/Config.in
===================================================================
--- project/Config.in	(revision 19171)
+++ project/Config.in	(arbetskopia)
@@ -23,4 +23,56 @@
 	help
 	  The banner string is stored in "/etc/issue"
 
+choice
+	prompt "Buildroot Distribution"
+	default BR2_DISTRIBUTION_STABLE
+	help
+	  The distribution file contains definitions of
+	  package version numbers, which overrides the
+	  default version number in package/<package>/<package>.mk
+	  The distribution file is stored in "project/config"
+	  If empty, a default distribution is used.
+
+config BR2_DISTRIBUTION_LATEST
+	bool "Use the latest package version"
+	help
+	  Use an empty distribution file,which
+	  results in using the versions defined in
+	  the package/<package>.mk
+
+config BR2_DISTRIBUTION_STABLE
+	bool "Use the latest stable package version"
+	help
+	  Use a distribution file containing tested
+          versions. Note that this may cause more problems
+	  when downloading the source, since the stable
+	  package tarballs may have been removed from
+	  their download site.
+
+config BR2_DISTRIBUTION_PROJECT
+	bool "Use $(PROJECT).distrib"
+	help
+	  Use package versions defined in the project distribution file
+	  It is located in "project/config"
+
+config BR2_DISTRIBUTION_CUSTOM
+	bool "Use your own distibution file"
+	help
+	  Use package versions defined in a custom distribution file
+	  Provide your own distribution file with full path
+
+endchoice
+
+config BR2_DISTRIBUTION_NAME
+	string	"Provide your own distribution file"
+	depends on BR2_DISTRIBUTION_CUSTOM
+	default ""
+
+config BR2_DISTRIBUTION
+	string
+	default "project/config/empty_distrib"		if BR2_DISTRIBUTION_LATEST
+	default "project/config/def_distrib"		if BR2_DISTRIBUTION_STABLE
+	default "project/config/$(PROJECT).distrib"	if
BR2_DISTRIBUTION_PROJECT
+	default "$(BR2_DISTRIBUTION_NAME)"		if BR2_DISTRIBUTION_CUSTOM
+
 endmenu
Index: package/ruby/ruby.mk
===================================================================
--- package/ruby/ruby.mk	(revision 19171)
+++ package/ruby/ruby.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # ruby
 #
 #############################################################
-RUBY_VERSION:=1.8.2
+ifeq ($(RUBY_VERSION),)
+RUBY_VERSION:=1.8.7
+endif
 RUBY_SOURCE:=ruby-$(RUBY_VERSION).tar.gz
 RUBY_SITE:=ftp://ftp.ruby-lang.org/pub/ruby/1.8
 RUBY_DIR:=$(BUILD_DIR)/ruby-$(RUBY_VERSION)
@@ -62,6 +64,9 @@
 ruby-dirclean:
 	rm -rf $(RUBY_DIR)
 
+ruby-version:
+	echo	RUBY_VERSION:=$(RUBY_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: package/curl/curl.mk
===================================================================
--- package/curl/curl.mk	(revision 19171)
+++ package/curl/curl.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # curl
 #
 #############################################################
-CURL_VERSION:=7.13.1
+ifeq ($(CURL_VERSION),)
+CURL_VERSION:=7.16.4
+endif
 CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
 CURL_SITE:=http://curl.haxx.se/download/
 CURL_CAT:=$(BZCAT)
@@ -69,6 +71,9 @@
 curl-dirclean:
 	rm -rf $(CURL_DIR)
 
+curl-version:
+	echo	CURL_VERSION:=$(CURL_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: package/Makefile.in
===================================================================
--- package/Makefile.in	(revision 19171)
+++ package/Makefile.in	(arbetskopia)
@@ -81,8 +81,8 @@
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_
$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
 BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
 TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
+DISTRIB:=.distrib
 
-
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))
 
Index: package/portage/portage.mk
===================================================================
--- package/portage/portage.mk	(revision 19171)
+++ package/portage/portage.mk	(arbetskopia)
@@ -3,7 +3,9 @@
 # portage
 #
 #############################################################
+ifeq ($(PORTAGE_VERSION),)
 PORTAGE_VERSION:=2.0.51.22
+endif
 PORTAGE_SOURCE:=portage-$(PORTAGE_VERSION).tar.bz2
 PORTAGE_SITE:=http://gentoo.osuosl.org/distfiles
 PORTAGE_CAT:=$(BZCAT)
@@ -11,7 +13,9 @@
 PORTAGE_TARGET_DIR:=$(TARGET_DIR)/usr/lib/portage
 PORTAGE_TARGET_BINARY:=usr/bin/emerge
 
-SANDBOX_VERSION:=1.2.13
+ifeq ($(SANDBOX_VERSION),)
+SANDBOX_VERSION:=1.2.18.1
+endif
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
 SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
@@ -120,6 +124,13 @@
 	rm -rf $(PORTAGE_DIR)
 sandbox-dirclean:
 	rm -rf $(SANDBOX_DIR)
+
+portage-version:
+	echo	PORTAGE_VERSION:=$(PORTAGE_VERSION)	>> $(DISTRIB)
+
+sandbox-version:
+	echo	SANDBOX_VERSION:=$(SANDBOX_VERSION)	>> $(DISTRIB)
+
 #############################################################
 #
 # Toplevel Makefile options
Index: Makefile
===================================================================
--- Makefile	(revision 19171)
+++ Makefile	(arbetskopia)
@@ -166,8 +166,17 @@
 #"))
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
+DISTRIBUTION:=$(strip $(subst ",,$(BR2_DISTRIBUTION)))
+#"))
 
+DISTRIBUTION_EXISTS:=$(strip $(subst ",,$(shell ls $(DISTRIBUTION) |
grep -FzZ $(DISTRIBUTION))))
+#))
 
+ifneq ($(DISTRIBUTION_EXISTS),)
+include	$(DISTRIBUTION)
+
+endif
+
 include toolchain/Makefile.in
 include package/Makefile.in
 
@@ -198,6 +207,7 @@
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
+TARGETS_VERSION:=$(patsubst %,%-version,$(TARGETS))
 
 world: $(DL_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) \
 	$(BINARIES_DIR) $(STAGING_DIR) $(TARGET_DIR) bsp $(TARGETS)
@@ -205,6 +215,7 @@
 
 .PHONY: all world dirs clean dirclean distclean source bsp $(TARGETS) \
 	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_VERSION) \
 	$(DL_DIR) $(BUILD_DIR) $(TOOL_BUILD_DIR) $(STAGING_DIR) \
 	$(PROJECT_BUILD_DIR) $(BINARIES_DIR)
 
@@ -257,6 +268,40 @@
 
 #############################################################
 #
+# Support "distributions"
+#
+#############################################################
+
+project/config/$(PROJECT).distrib:
+	touch project/config/$(PROJECT).distrib
+	echo	"# This file contains overrides for "		>  $(DISTRIB)
+	echo	"# package versions for the $(PROJECT) project.">> $(DISTRIB)
+	cat  	project/config/distrib_header			>> $(DISTRIB)
+
+distrib-core:	$(TARGETS_VERSION)
+
+distrib:	distrib-clean project/config/$(PROJECT).distrib
+	cp	.config		$(PROJECT).config.tmp
+	make	allyesconfig
+	make	distrib-core
+	mv	$(DISTRIB)	project/config/$(PROJECT).distrib
+	mv $(PROJECT).config.tmp .config
+
+stable:
+	echo	"# This file contains the stable package versions"	>  $(DISTRIB)
+	cat  	project/config/distrib_header				>> $(DISTRIB)
+	make	allyesconfig
+	make	distrib-core
+	mv	.distrib	project/config/def_distrib
+
+distrib-clean:
+	rm -f project/config/$(PROJECT).distrib
+	rm -f .distrib
+	
+.PHONY:	distrib-core distrib stable distrib-clean
+
+#############################################################
+#
 # Cleanup and misc junk
 #
 #############################################################
@@ -368,7 +413,7 @@
 	rm -rf sources/*
 
 endif # ifeq ($(strip $(BR2_HAVE_DOT_CONFIG)),y)
-
+#############################################################
 %_defconfig: $(CONFIG)/conf
 	cp $(shell find ./target/ -name $@) .config
 	@$(CONFIG)/conf -o $(CONFIG_CONFIG_IN)


Best Regards
