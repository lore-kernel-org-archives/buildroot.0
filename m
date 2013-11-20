From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Nov 2013 18:01:54 +0100
Subject: [Buildroot] [pkg-perl infra 06/12] libxml-parser-perl: move and
	refactor with perl infrastructure
In-Reply-To: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384966920-9454-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(used by host-intltool and metacity)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |    1 -
 package/Makefile.in                                |    8 ++---
 package/cpan/Config.in                             |    1 +
 package/cpan/libxml-parser-perl/Config.in          |    9 +++++
 .../cpan/libxml-parser-perl/libxml-parser-perl.mk  |   19 +++++++++++
 package/intltool/intltool.mk                       |    4 +--
 package/libxml-parser-perl/Config.in               |   11 ------
 package/libxml-parser-perl/libxml-parser-perl.mk   |   35 --------------------
 package/metacity/metacity.mk                       |    3 ++
 9 files changed, 36 insertions(+), 55 deletions(-)
 create mode 100644 package/cpan/libxml-parser-perl/Config.in
 create mode 100644 package/cpan/libxml-parser-perl/libxml-parser-perl.mk
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk

diff --git a/package/Config.in b/package/Config.in
index 8ae83f9..3af2783 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -586,7 +586,6 @@ source "package/json-c/Config.in"
 source "package/json-glib/Config.in"
 source "package/libjson/Config.in"
 source "package/libroxml/Config.in"
-source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxmlpp/Config.in"
 source "package/libxslt/Config.in"
diff --git a/package/Makefile.in b/package/Makefile.in
index cd0437c..3a3d9f7 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -241,11 +241,9 @@ TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		FCFLAGS="$(TARGET_FCFLAGS)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		STAGING_DIR="$(STAGING_DIR)"
 
-TARGET_MAKE_ENV=PATH=$(TARGET_PATH) \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+TARGET_MAKE_ENV=PATH=$(TARGET_PATH)
 
 HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		AR="$(HOSTAR)" \
@@ -265,15 +263,13 @@ HOST_CONFIGURE_OPTS=PATH=$(HOST_PATH) \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
 		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig:$(HOST_DIR)/usr/share/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl" \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)"
 
 HOST_MAKE_ENV=PATH=$(HOST_PATH) \
 		LD_LIBRARY_PATH="$(HOST_DIR)/usr/lib:$(LD_LIBRARY_PATH)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 		PKG_CONFIG_SYSROOT_DIR="/" \
-		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig" \
-		PERLLIB="$(HOST_DIR)/usr/lib/perl"
+		PKG_CONFIG_LIBDIR="$(HOST_DIR)/usr/lib/pkgconfig"
 
 
 ################################################################################
diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index e69de29..bb98dc3 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -0,0 +1 @@
+source "package/cpan/libxml-parser-perl/Config.in"
diff --git a/package/cpan/libxml-parser-perl/Config.in b/package/cpan/libxml-parser-perl/Config.in
new file mode 100644
index 0000000..a09861a
--- /dev/null
+++ b/package/cpan/libxml-parser-perl/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBXML_PARSER_PERL
+	bool "libxml-parser-perl"
+	select BR2_PACKAGE_EXPAT
+	# Hide from configuration as we only support the host package
+	# for the moment
+	depends on BR2_HOST_ONLY
+	help
+	  A perl module for parsing XML documents
+
diff --git a/package/cpan/libxml-parser-perl/libxml-parser-perl.mk b/package/cpan/libxml-parser-perl/libxml-parser-perl.mk
new file mode 100644
index 0000000..4d378ec
--- /dev/null
+++ b/package/cpan/libxml-parser-perl/libxml-parser-perl.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libxml-parser-perl
+#
+################################################################################
+
+LIBXML_PARSER_PERL_VERSION = 2.41
+LIBXML_PARSER_PERL_AUTHOR = TODDR
+LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
+LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR/
+#LIBXML_PARSER_PERL_DEPENDENCIES = perl libwww-perl expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
+LIBXML_PARSER_PERL_LICENSE = perl_5
+
+HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATLIBPATH=$(HOST_DIR)/usr/lib
+HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATINCPATH=$(HOST_DIR)/usr/include
+
+#$(eval $(perl-package))
+$(eval $(host-perl-package))
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index b2418fe..42e638e 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -10,8 +10,8 @@ INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
 HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
-HOST_INTLTOOL_CONF_OPT = \
-  PERLLIB=$(HOST_DIR)/usr/lib/perl
+HOST_INTLTOOL_CONF_ENV = \
+  PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(shell perl -MConfig -e "print Config->{archname}")
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
deleted file mode 100644
index 2a81086..0000000
--- a/package/libxml-parser-perl/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LIBXML_PARSER_PERL
-	bool "libxml-parser-perl"
-	select BR2_PACKAGE_EXPAT
-	# Hide from configuration as we only support the host package
-	# for the moment
-	depends on BR2_HOST_ONLY
-	help
-	  The Perl XML::Parser module.
-
-	  http://www.cpan.org/modules/by-module/XML/
-
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
deleted file mode 100644
index 53f3bcf..0000000
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# libxml-parser-perl
-#
-################################################################################
-
-LIBXML_PARSER_PERL_VERSION = 2.36
-LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
-LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML/
-
-LIBXML_PARSER_PERL_DEPENDENCIES = expat
-
-define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
- (cd $(@D) ; \
-   $(HOST_CONFIGURE_OPTS) perl Makefile.PL \
-        PREFIX=$(HOST_DIR)/usr \
-        EXPATLIBPATH=$(HOST_DIR)/usr/lib \
-        EXPATINCPATH=$(HOST_DIR)/usr/include \
-        INSTALLDIRS=site \
-        INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
-        INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
-        USE_MM_LD_RUN_PATH=1 \
- )
-endef
-
-define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 9306b00..5680a4a 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -11,6 +11,9 @@ METACITY_VERSION = $(METACITY_VERSION_MAJOR).$(METACITY_VERSION_MINOR)
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
 METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
 
+METACITY_CONF_ENV = \
+  PERL5LIB=$(HOST_DIR)/usr/lib/perl5/$(shell perl -MConfig -e "print Config->{archname}")
+
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
 		--disable-glibtest --disable-gconf \
-- 
1.7.9.5
