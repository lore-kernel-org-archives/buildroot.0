From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 14:17:48 +0200
Subject: [Buildroot] [git commit] libxml-parser-perl: restore it like before
	perl infra
Message-ID: <20141017121829.24008B328C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8e716d659b08635bba703d9ae0867d8590f6b083
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

intltool uses this package,
and we don't want that it depends on host-perl,
but on system perl

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intltool/intltool.mk                     |    5 ++-
 package/libxml-parser-perl/libxml-parser-perl.mk |   34 ++++++++++++++++++++++
 package/metacity/metacity.mk                     |    2 +-
 package/perl-xml-parser/perl-xml-parser.mk       |   17 -----------
 4 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/package/intltool/intltool.mk b/package/intltool/intltool.mk
index 5c2dca8..a7afe0d 100644
--- a/package/intltool/intltool.mk
+++ b/package/intltool/intltool.mk
@@ -9,7 +9,10 @@ INTLTOOL_SITE = https://launchpad.net/intltool/trunk/$(INTLTOOL_VERSION)/+downlo
 INTLTOOL_LICENSE = GPLv2+
 INTLTOOL_LICENSE_FILES = COPYING
 
-HOST_INTLTOOL_DEPENDENCIES = host-gettext host-perl-xml-parser
+HOST_INTLTOOL_DEPENDENCIES = host-gettext host-libxml-parser-perl
+HOST_INTLTOOL_CONF_OPTS = \
+	PERL=`which perl` \
+	PERL5LIB=$(HOST_DIR)/usr/lib/perl
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
new file mode 100644
index 0000000..a07f0a0
--- /dev/null
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# libxml-parser-perl
+#
+################################################################################
+
+LIBXML_PARSER_PERL_VERSION = 2.41
+LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
+LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
+LIBXML_PARSER_PERL_DEPENDENCIES = expat
+LIBXML_PARSER_PERL_LICENSE = Artistic or GPLv1+
+LIBXML_PARSER_PERL_RUN_PERL = `which perl`
+
+define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
+ (cd $(@D) ; \
+   $(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
+        PREFIX=$(HOST_DIR)/usr \
+        EXPATLIBPATH=$(HOST_DIR)/usr/lib \
+        EXPATINCPATH=$(HOST_DIR)/usr/include \
+        INSTALLDIRS=site \
+        INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
+        INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
+ )
+endef
+
+define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index f7e8b92..1d3e143 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -19,7 +19,7 @@ METACITY_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 
 METACITY_DEPENDENCIES = libgtk2 \
 	xlib_libX11 \
-	host-perl-xml-parser \
+	host-libxml-parser-perl \
 	xlib_libXcomposite \
 	xlib_libXfixes \
 	xlib_libXrender \
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
deleted file mode 100644
index 21c9162..0000000
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ /dev/null
@@ -1,17 +0,0 @@
-################################################################################
-#
-# perl-xml-parser
-#
-################################################################################
-
-PERL_XML_PARSER_VERSION = 2.41
-PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
-PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-PERL_XML_PARSER_DEPENDENCIES = expat
-PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
-
-HOST_PERL_XML_PARSER_CONF_OPTS = \
-	EXPATLIBPATH=$(HOST_DIR)/usr/lib \
-	EXPATINCPATH=$(HOST_DIR)/usr/include
-
-$(eval $(host-perl-package))
