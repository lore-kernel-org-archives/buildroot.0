From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 14:54:08 +0100
Subject: [Buildroot] [git commit] pkg-perl: add PREFER_INSTALLER variable
Message-ID: <20170129135833.D817A817F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f102d8284acf6619a1e8119dc76dc48957a4bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: tweak documentation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-perl.txt | 11 +++++++++--
 package/pkg-perl.mk                  | 20 ++++++++++++++------
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 4f5a6a4..3476b62 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -68,8 +68,8 @@ As a policy, packages that provide Perl/CPAN modules should all be
 named +perl-<something>+ in Buildroot.
 
 This infrastructure handles various Perl build systems :
-+ExtUtils-MakeMaker+, +Module-Build+ and +Module-Build-Tiny+.
-+Build.PL+ is always preferred when a package provides a +Makefile.PL+
++ExtUtils-MakeMaker+ (EUMM), +Module-Build+ (MB) and +Module-Build-Tiny+.
++Build.PL+ is preferred by default when a package provides a +Makefile.PL+
 and a +Build.PL+.
 
 The main macro of the Perl/CPAN package infrastructure is
@@ -97,6 +97,13 @@ A few additional variables, specific to the Perl/CPAN infrastructure,
 can also be defined. Many of them are only useful in very specific
 cases, typical packages will therefore only use a few of them.
 
+* +PERL_FOO_PREFER_INSTALLER+/+HOST_PERL_FOO_PREFER_INSTALLER+,
+  specifies the preferred installation method. Possible values are
+  +EUMM+ (for +Makefile.PL+ based installation using
+  +ExtUtils-MakeMaker+) and +MB+ (for +Build.PL+ based installation
+  using +Module-Build+). This variable is only used when the package
+  provides both installation methods.
+
 * +PERL_FOO_CONF_ENV+/+HOST_PERL_FOO_CONF_ENV+, to specify additional
   environment variables to pass to the +perl Makefile.PL+ or +perl Build.PL+.
   By default, empty.
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 4b20598..cc94cd9 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -49,6 +49,14 @@ else
 $(2)_DEPENDENCIES += host-perl
 endif
 
+# From http://perldoc.perl.org/CPAN.html#Config-Variables - prefer_installer
+#       legal values are MB and EUMM: if a module comes
+#       with both a Makefile.PL and a Build.PL, use the
+#       former (EUMM) or the latter (MB); if the module
+#       comes with only one of the two, that one will be
+#       used no matter the setting
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
