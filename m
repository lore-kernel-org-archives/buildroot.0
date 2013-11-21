From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 21 Nov 2013 13:35:14 +0100
Subject: [Buildroot] [pkg-perl infra V2 07/12] host-libxml-parser-perl: move
	and refactor with perl infrastructure
In-Reply-To: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
References: <1385037319-2456-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1385037319-2456-7-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |    1 -
 .../cpan/libxml-parser-perl/libxml-parser-perl.mk  |   17 ++++++++++
 package/libxml-parser-perl/Config.in               |   11 ------
 package/libxml-parser-perl/libxml-parser-perl.mk   |   35 --------------------
 4 files changed, 17 insertions(+), 47 deletions(-)
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
diff --git a/package/cpan/libxml-parser-perl/libxml-parser-perl.mk b/package/cpan/libxml-parser-perl/libxml-parser-perl.mk
new file mode 100644
index 0000000..32c99ce
--- /dev/null
+++ b/package/cpan/libxml-parser-perl/libxml-parser-perl.mk
@@ -0,0 +1,17 @@
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
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
+LIBXML_PARSER_PERL_LICENSE = perl_5
+
+HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATLIBPATH=$(HOST_DIR)/usr/lib
+HOST_LIBXML_PARSER_PERL_CONF_OPT += EXPATINCPATH=$(HOST_DIR)/usr/include
+
+$(eval $(host-perl-package))
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
-- 
1.7.9.5
