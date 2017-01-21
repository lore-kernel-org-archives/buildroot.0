From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 21 Jan 2017 12:51:16 +0100
Subject: [Buildroot] [PATCH 1/3] pkg-perl: add PREFER_INSTALLER variable
Message-ID: <20170121115118.17938-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-perl.txt |  6 +++++-
 package/pkg-perl.mk                  | 20 ++++++++++++++------
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 4f5a6a4..b4b81c9 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -69,7 +69,7 @@ named +perl-<something>+ in Buildroot.
 
 This infrastructure handles various Perl build systems :
 +ExtUtils-MakeMaker+, +Module-Build+ and +Module-Build-Tiny+.
-+Build.PL+ is always preferred when a package provides a +Makefile.PL+
++Build.PL+ is preferred by default when a package provides a +Makefile.PL+
 and a +Build.PL+.
 
 The main macro of the Perl/CPAN package infrastructure is
@@ -97,6 +97,10 @@ A few additional variables, specific to the Perl/CPAN infrastructure,
 can also be defined. Many of them are only useful in very specific
 cases, typical packages will therefore only use a few of them.
 
+* +PERL_FOO_PREFER_INSTALLER+/+HOST_PERL_FOO_PREFER_INSTALLER+, with the
+  value 'EUMM', the use of +Makefile.PL+ is prefered at +Build.pl+.
+  By default, 'MB'.
+
 * +PERL_FOO_CONF_ENV+/+HOST_PERL_FOO_CONF_ENV+, to specify additional
   environment variables to pass to the +perl Makefile.PL+ or +perl Build.PL+.
   By default, empty.
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 4b20598..489b8ff 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -49,6 +49,14 @@ else
 $(2)_DEPENDENCIES += host-perl
 endif
 
+# equivalent at $CPAN::Config{prefer_installer}
+# legal values are MB and EUMM: if a module comes
+# with both a Makefile.PL and a Build.PL, use the
+# former (EUMM) or the latter (MB); if the module
+# comes with only one of the two, that one will be
+# used no matter the setting
+$(2)_PREFER_INSTALLER ?= MB
+
 #
 # Configure step. Only define it if not already defined by the package
 # .mk file. And take care of the differences between host and target
@@ -59,7 +67,7 @@ ifeq ($(4),target)
 
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		$$(PERL_RUN) Build.PL \
@@ -109,7 +117,7 @@ else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		$$(PERL_RUN) Build.PL \
@@ -135,7 +143,7 @@ ifeq ($(4),target)
 
 # Build package for target
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) \
@@ -148,7 +156,7 @@ else
 
 # Build package for host
 define $(2)_BUILD_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_BUILD_OPTS) build; \
 	else \
 		$$(MAKE1) $$($(2)_BUILD_OPTS) pure_all; \
@@ -163,7 +171,7 @@ endif
 #
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
@@ -177,7 +185,7 @@ endif
 #
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
-	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] && [ $$($(2)_PREFER_INSTALLER) != "EUMM" ] ; then \
 		$$(PERL_RUN) Build $$($(2)_INSTALL_TARGET_OPTS) install; \
 	else \
 		$$(MAKE1) $$($(2)_INSTALL_TARGET_OPTS) pure_install; \
-- 
2.9.3
