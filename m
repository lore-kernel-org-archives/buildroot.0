From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Aug 2014 20:07:15 +0200
Subject: [Buildroot] [PATCH 3/6] pkg-perl: refactor with host-perl
In-Reply-To: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1408471638-4551-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Makefile.in |  3 ---
 package/pkg-perl.mk | 21 +++++++++------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7d9943c..2f26144 100644
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
index 51eaf52..2de9257 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -20,6 +20,7 @@
 ################################################################################
 
 PERL_ARCHNAME	= $(ARCH)-linux
+PERL_RUN	= $(HOST_DIR)/usr/bin/perl
 
 ################################################################################
 # inner-perl-package -- defines how the configuration, compilation and
@@ -51,7 +52,7 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
-		perl Build.PL \
+		$$(PERL_RUN) Build.PL \
 			--config ar="$$(TARGET_AR)" \
 			--config full_ar="$$(TARGET_AR)" \
 			--config cc="$$(TARGET_CC)" \
@@ -74,7 +75,7 @@ define $(2)_CONFIGURE_CMDS
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
-		perl Makefile.PL \
+		$$(PERL_RUN) Makefile.PL \
 			AR="$$(TARGET_AR)" \
 			FULL_AR="$$(TARGET_AR)" \
 			CC="$$(TARGET_CC)" \
@@ -101,17 +102,13 @@ define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
-		perl Build.PL \
-			--install_base $$(HOST_DIR)/usr \
-			--installdirs vendor \
+		$$(PERL_RUN) Build.PL \
 			$$($(2)_CONF_OPT); \
 	else \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
-		perl Makefile.PL \
-			INSTALL_BASE=$$(HOST_DIR)/usr \
-			INSTALLDIRS=vendor \
+		$$(PERL_RUN) Makefile.PL \
 			$$($(2)_CONF_OPT); \
 	fi
 endef
@@ -129,7 +126,7 @@ ifeq ($(4),target)
 # Build package for target
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_BUILD_OPT) build; \
+		$$(PERL_RUN) Build $$($(2)_BUILD_OPT) build; \
 	else \
 		$$(MAKE1) \
 			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE \
@@ -141,7 +138,7 @@ else
 # Build package for host
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_BUILD_OPT) build; \
+		$$(PERL_RUN) Build $$($(2)_BUILD_OPT) build; \
 	else \
 		$$(MAKE1) $$($(2)_BUILD_OPT) pure_all; \
 	fi
@@ -156,7 +153,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
+		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPT) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
 	fi
@@ -170,7 +167,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
-		perl Build $$($(2)_INSTALL_TARGET_OPT) install; \
+		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPT) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPT) pure_install; \
 	fi
-- 
1.9.1
