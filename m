From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Feb 2014 09:14:28 +0100
Subject: [Buildroot] [pkg-perl infra V9 3/6] host-perl-xml-parser: rename
	and refactor with perl infrastructure
In-Reply-To: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1392192871-426-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though libxml-parser-perl had a Config.in file with an option to
enable it on the target, this option was hidden by a dependency on
BR2_HOST_ONLY. So in practice, it was not possible to enable
libxml-parser-perl on the target. This allows us to rename
libxml-parser-perl to perl-xml-parser to follow the new naming
convention of Perl packages, without having to introduce
Config.in.legacy material.

In addition to this rename, the package is converted to use the newly
introduced Perl package infrastructure.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/Config.in                                |    1 -
 package/intltool/intltool.mk                     |    2 +-
 package/libxml-parser-perl/Config.in             |   10 -------
 package/libxml-parser-perl/libxml-parser-perl.mk |   35 ----------------------
 package/metacity/metacity.mk                     |    2 +-
 package/perl-xml-parser/perl-xml-parser.mk       |   17 +++++++++++
 6 files changed, 19 insertions(+), 48 deletions(-)
 delete mode 100644 package/libxml-parser-perl/Config.in
 delete mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk

diff --git a/package/Config.in b/package/Config.in
index fca61d6..68b4870 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -616,7 +616,6 @@ source "package/json-c/Config.in"
 source "package/json-glib/Config.in"
 source "package/libjson/Config.in"
 source "package/libroxml/Config.in"
-source "package/libxml-parser-perl/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxmlpp/Config.in"
 source "package/libxslt/Config.in"
diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 58b46e6..6b2a704 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -9,7 +9,7 @@ INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+downlo
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
-HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
+HOST_INTLTOOL_DEPENDENCIES = host-gettext host-perl-xml-parser
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
deleted file mode 100644
index bdda236..0000000
--- a/package/libxml-parser-perl/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
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
index 9306b00..18f5c76 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -19,7 +19,7 @@ METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 METACITY_DEPENDENCIES = libgtk2 \
 	xlib_libX11 \
-	host-libxml-parser-perl \
+	host-perl-xml-parser \
 	xlib_libXcomposite \
 	xlib_libXfixes \
 	xlib_libXrender \
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
new file mode 100644
index 0000000..fb9bf0f
--- /dev/null
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# perl-xml-parser
+#
+################################################################################
+
+PERL_XML_PARSER_VERSION = 2.41
+PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
+PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR/
+PERL_XML_PARSER_DEPENDENCIES = expat
+PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
+
+HOST_LIBXML_PARSER_PERL_CONF_OPT = \
+	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
+	EXPATINCPATH=$(HOST_DIR)/usr/include
+
+$(eval $(host-perl-package))
-- 
1.7.9.5
