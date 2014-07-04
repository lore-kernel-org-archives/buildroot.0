From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  4 Jul 2014 15:31:48 +0200
Subject: [Buildroot] [v3 1/2] pkg-perl: add PERL_FOO_CONF_ENV
Message-ID: <1404480709-16878-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

in some case PERL_FOO_CONF_OPT is not enough

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 docs/manual/adding-packages-perl.txt | 4 ++++
 package/pkg-perl.mk                  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index 4062646..d1a1616 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -100,6 +100,10 @@ A few additional variables, specific to the Perl/CPAN infrastructure,
 can also be defined. Many of them are only useful in very specific
 cases, typical packages will therefore only use a few of them.
 
+* +PERL_FOO_CONF_ENV+/+HOST_PERL_FOO_CONF_ENV+, to specify additional
+  environment variables to pass to the +perl Makefile.PL+ or +perl Build.PL+.
+  By default, empty.
+
 * +PERL_FOO_CONF_OPT+/+HOST_PERL_FOO_CONF_OPT+, to specify additional
   configure options to pass to the +perl Makefile.PL+ or +perl Build.PL+.
   By default, empty.
diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk
index 5cfdc77..8c45001 100644
--- a/package/pkg-perl.mk
+++ b/package/pkg-perl.mk
@@ -49,6 +49,7 @@ ifeq ($(4),target)
 # Configure package for target
 define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		perl Build.PL \
 			--config ar="$$(TARGET_AR)" \
@@ -69,6 +70,7 @@ define $(2)_CONFIGURE_CMDS
 			--install_path libdoc=/usr/share/man/man3 \
 			$$($(2)_CONF_OPT); \
 	else \
+		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
 		perl Makefile.PL \
@@ -95,12 +97,14 @@ else
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
 	cd $$($$(PKG)_SRCDIR) && if [ -f Build.PL ] ; then \
+		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		perl Build.PL \
 			--install_base $$(HOST_DIR)/usr \
 			--installdirs vendor \
 			$$($(2)_CONF_OPT); \
 	else \
+		$$($(2)_CONF_ENV) \
 		PERL_MM_USE_DEFAULT=1 \
 		PERL_AUTOINSTALL=--skipdeps \
 		perl Makefile.PL \
-- 
1.9.1
