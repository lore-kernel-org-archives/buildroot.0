From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] pkg-perl: refactor with host-perl
Message-ID: <20141017121829.3840CB328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fad24172f111978f2664a6eaffe86ac690403e2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    3 ---
 package/pkg-perl.mk |   23 +++++++++++------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 28a5bfd..ab59b54 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -232,9 +232,6 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/
 HOSTCC_VERSION := $(shell $(HOSTCC_NOCCACHE) --version | \
 	sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$$/\1\2\3/p')
 
-HOST_PERL_ARCHNAME := $(shell perl -MConfig -e "print Config->{archname}")
-export PERL5LIB := $(HOST_DIR)/usr/lib/perl5/$(HOST_PERL_ARCHNAME):$(HOST_DIR)/usr/lib/perl5
-
 TARGET_CONFIGURE_OPTS = PATH=$(BR_PATH) \
 		AR="$(TARGET_AR)" \
 		AS="$(TARGET_AS)" \
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 808d2ce..f41a2f9 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,6 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME = $(ARCH)-linux
+PERL_RUN = $(HOST_DIR)/usr/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
@@ -38,6 +39,8 @@ PERL_ARCHNAME = $(ARCH)-linux
 
 define inner-perl-package
 
+$(2)_DEPENDENCIES += host-perl
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -51,7 +54,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
-		perl Build.PL \
+		$$(PERL_RUN) Build.PL \
 			--config ar="$$(TARGET_AR)" \
 			--config full_ar="$$(TARGET_AR)" \
 			--config cc="$$(TARGET_CC)" \
@@ -74,7 +77,7 @@ define $(2)_CONFIGURE_CMDS
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
-		perl Makefile.PL \
+		$$(PERL_RUN) Makefile.PL \
 			AR="$$(TARGET_AR)" \
 			FULL_AR="$$(TARGET_AR)" \
 			CC="$$(TARGET_CC)" \
@@ -101,17 +104,13 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
-		perl Build.PL \
-			--install_base $$(HOST_DIR)/usr \
-			--installdirs vendor \
+		$$(PERL_RUN) Build.PL \
 			$$($(2)_CONF_OPTS); \
 	else \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
-		perl Makefile.PL \
-			INSTALL_BASE=$$(HOST_DIR)/usr \
-			INSTALLDIRS=vendor \
+		$$(PERL_RUN) Makefile.PL \
 			$$($(2)_CONF_OPTS); \
 	fi
 endef
@@ -129,7 +128,7 @@ ifeq ($(4),target)
 # Build package for target
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_BUILD_OPTS) build; \
+		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) \
 			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
@@ -141,7 +140,7 @@ else
 # Build package for host
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_BUILD_OPTS) build; \
+		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) $$($(2)_BUILD_OPTS) pure_all; \
 	fi
@@ -156,7 +155,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_INSTALL_TARGET_OPTS) install; \
+		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
 	fi
@@ -170,7 +169,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_INSTALL_TARGET_OPTS) install; \
+		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
 	fi
