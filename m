From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Nov 2013 13:35:08 +0100
Subject: [Buildroot] [pkg-perl infra V2 01/12] perl: new infrastructure
Message-ID: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Makefile.in          |   11 ++-
 package/intltool/intltool.mk |    4 +-
 package/pkg-perl.mk          |  220 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 229 insertions(+), 6 deletions(-)
 create mode 100644 package/pkg-perl.mk

diff --git a/package/Makefile.in b/package/Makefile.in
index 612f3c7..34ce1ec 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -206,6 +206,8 @@ HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
 HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
+HOST_PERL_ARCHNAME = $(shell perl -MConfig -e "print Config->{archname}")
+
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
@@ -241,11 +243,11 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5 \
 		STAGING_DIR="$(STAGING_DIR)"
 
 TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -265,7 +267,7 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
+		PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5 \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
@@ -273,7 +275,7 @@ HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
 
 ################################################################################
@@ -363,4 +365,5 @@ include package/pkg-utils.mk
 include package/pkg-download.mk
 include package/pkg-autotools.mk
 include package/pkg-cmake.mk
+include package/pkg-perl.mk
 include package/pkg-generic.mk
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index b2418fe..cbaca8c 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -10,8 +10,8 @@ INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
+HOST_INTLTOOL_CONF_ENV = \
+  PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
new file mode 100644
index 0000000..893501c
--- /dev/null
+++ b/package/pkg-perl.mk
@@ -0,0 +1,220 @@
+################################################################################
+# Perl package infrastructure
+#
+# This file implements an infrastructure that eases development of
+# package .mk files for Perl packages.
+#
+# See the Buildroot documentation for details on the usage of this
+# infrastructure
+#
+# In terms of implementation, this perl infrastructure requires
+# the .mk file to only specify metadata informations about the
+# package: name, version, download URL, etc.
+#
+# We still allow the package .mk file to override what the different
+# steps are doing, if needed. For example, if <PKG>_BUILD_CMDS is
+# already defined, it is used as the list of commands to perform to
+# build the package, instead of the default perl behaviour. The
+# package can also define some post operation hooks.
+#
+################################################################################
+
+_PERL_ARCHNAME	= $(ARCH)-linux
+
+_HOST_PERL_ARCHNAME	= $(shell perl -MConfig -e "print Config->{archname}")
+_HOST_PERL_INSTALL_BASE	= $$(HOST_DIR)/usr
+_HOST_PERL5LIB		= $(_HOST_PERL_INSTALL_BASE)/lib/perl5/$(_HOST_PERL_ARCHNAME):$(_HOST_PERL_INSTALL_BASE)/lib/perl5
+
+################################################################################
+# inner-perl-package -- defines how the configuration, compilation and
+# installation of an autotools package should be done, implements a
+# few hooks to tune the build process for autotools specifities and
+# calls the generic package infrastructure to generate the necessary
+# make targets
+#
+#  argument 1 is the lowercase package name
+#  argument 2 is the uppercase package name, including an HOST_ prefix
+#             for host packages
+#  argument 3 is the uppercase package name, without the HOST_ prefix
+#             for host packages
+#  argument 4 is the package directory prefix
+#  argument 5 is the type (target or host)
+################################################################################
+
+define inner-perl-package
+
+$(2)_CONF_OPT			?=
+$(2)_BUILD_OPT			?=
+$(2)_INSTALL_OPT		?=
+$(2)_INSTALL_TARGET_OPT		?=
+$(2)_CLEAN_OPT			?=
+
+#
+# Configure step. Only define it if not already defined by the package
+# .mk file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_CONFIGURE_CMDS
+ifeq ($(5),target)
+
+# Configure package for target
+define $(2)_CONFIGURE_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build.PL \
+			--config ar="$(TARGET_AR)" \
+			--config full_ar="$(TARGET_AR)" \
+			--config cc="$(TARGET_CC)" \
+			--config ccflags="$(TARGET_CFLAGS)" \
+			--config ld="$(TARGET_CC)" \
+			--config lddlflags="-shared $(TARGET_LDFLAGS)" \
+			--config ldflags="$(TARGET_LDFLAGS)" \
+			--include_dirs $$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(_PERL_ARCHNAME)/CORE \
+			--destdir $$(TARGET_DIR) \
+			--installdirs vendor \
+			--install_path lib=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
+			--install_path arch=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(_PERL_ARCHNAME) \
+			--install_path bin=/usr/bin \
+			--install_path script=/usr/bin \
+			--install_path bindoc=/usr/share/man/man1 \
+			--install_path libdoc=/usr/share/man/man3 \
+			$$($(2)_CONF_OPT); \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		PERL_AUTOINSTALL=--skipdeps \
+		perl Makefile.PL \
+			AR="$(TARGET_AR)" \
+			FULL_AR="$(TARGET_AR)" \
+			CC="$(TARGET_CC)" \
+			CCFLAGS="$(TARGET_CFLAGS)" \
+			LD="$(TARGET_CC)" \
+			LDDLFLAGS="-shared $(TARGET_LDFLAGS)" \
+			LDFLAGS="$(TARGET_LDFLAGS)" \
+			DESTDIR=$$(TARGET_DIR) \
+			INSTALLDIRS=vendor \
+			INSTALLVENDORLIB=/usr/lib/perl5/site_perl/$$(PERL_VERSION) \
+			INSTALLVENDORARCH=/usr/lib/perl5/site_perl/$$(PERL_VERSION)/$(_PERL_ARCHNAME) \
+			INSTALLVENDORBIN=/usr/bin \
+			INSTALLVENDORSCRIPT=/usr/bin \
+			INSTALLVENDORMAN1DIR=/usr/share/man/man1 \
+			INSTALLVENDORMAN3DIR=/usr/share/man/man3 \
+			$$($(2)_CONF_OPT); \
+	fi
+endef
+else
+
+# Configure package for host
+define $(2)_CONFIGURE_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build.PL \
+			--install_base $(_HOST_PERL_INSTALL_BASE) \
+			--installdirs vendor \
+			$$($(2)_CONF_OPT); \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		PERL_AUTOINSTALL=--skipdeps \
+		perl Makefile.PL \
+			INSTALL_BASE=$(_HOST_PERL_INSTALL_BASE) \
+			INSTALLDIRS=vendor \
+			$$($(2)_CONF_OPT); \
+	fi
+endef
+endif
+endif
+
+#
+# Build step. Only define it if not already defined by the package .mk
+# file. And take care of the differences between host and target
+# packages.
+#
+ifndef $(2)_BUILD_CMDS
+ifeq ($(5),target)
+
+# Build package for target
+define $(2)_BUILD_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build $$($(2)_BUILD_OPT) build; \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		$(MAKE1) \
+			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$(_PERL_ARCHNAME)/CORE \
+			$$($(2)_BUILD_OPT) pure_all; \
+	fi
+endef
+else
+
+# Build package for host
+define $(2)_BUILD_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build $$($(2)_BUILD_OPT) build; \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
+	fi
+endef
+endif
+endif
+
+#
+# Host installation step. Only define it if not already defined by the
+# package .mk file.
+#
+ifndef $(2)_INSTALL_CMDS
+define $(2)_INSTALL_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
+	fi
+endef
+endif
+
+#
+# Target installation step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_INSTALL_TARGET_CMDS
+define $(2)_INSTALL_TARGET_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
+	fi
+endef
+endif
+
+#
+# Clean step. Only define it if not already defined by
+# the package .mk file.
+#
+ifndef $(2)_CLEAN_CMDS
+define $(2)_CLEAN_CMDS
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		perl Build $$($(2)_CLEAN_OPT) clean; \
+	else \
+		PERL5LIB=$(_HOST_PERL5LIB) \
+		$(MAKE1) $$($(2)_CLEAN_OPT) clean; \
+	fi
+endef
+endif
+
+# Call the generic package infrastructure to generate the necessary
+# make targets
+$(call inner-generic-package,$(1),$(2),$(3),$(4),$(5))
+
+endef
+
+################################################################################
+# perl-package -- the target generator macro for Perl packages
+################################################################################
+
+perl-package = $(call inner-perl-package,$(call pkgname),$(call UPPERCASE,$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),target)
+host-perl-package = $(call inner-perl-package,host-$(call pkgname),$(call UPPERCASE,host-$(call pkgname)),$(call UPPERCASE,$(call pkgname)),$(call pkgparentdir),host)
-- 
1.7.9.5
