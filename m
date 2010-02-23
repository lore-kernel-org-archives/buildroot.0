From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:06:41 +0100
Subject: [Buildroot] [PATCH 17/40] libxml-parser-perl: new package
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c13460f769bb4fe88e23a8070b00bab46005cbf2.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This Perl module is needed to build intltool, which in turn is needed
to build several of our packages. We assume that Perl is installed on
the host.

Only the host variant of this package has been tested and is used. The
code for the target variant (what to do at the configure, build and
install steps) isn't implemented, but the GENTARGETS call for the
target is mandatory, due to limitations of the Makefile.package.in
infrastructure (if one wants the host package to be implemented, then
the target package *must* exist). This limitation will be removed
after 2010.02.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/libxml-parser-perl/Config.in             |    8 +++++
 package/libxml-parser-perl/libxml-parser-perl.mk |   34 ++++++++++++++++++++++
 3 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/libxml-parser-perl/Config.in
 create mode 100644 package/libxml-parser-perl/libxml-parser-perl.mk

diff --git a/package/Config.in b/package/Config.in
index 5ddd63c..00f3401 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -412,6 +412,7 @@ source "package/ezxml/Config.in"
 source "package/libxml2/Config.in"
 source "package/libxslt/Config.in"
 source "package/xerces/Config.in"
+source "package/libxml-parser-perl/Config.in"
 endmenu
 
 # java support
diff --git a/package/libxml-parser-perl/Config.in b/package/libxml-parser-perl/Config.in
new file mode 100644
index 0000000..d20a401
--- /dev/null
+++ b/package/libxml-parser-perl/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBXML_PARSER_PERL
+       bool "libxml-parser-perl"
+       select BR2_PACKAGE_EXPAT
+       help
+         The Perl XML::Parser module.
+
+	 http://www.cpan.org/modules/by-module/XML/
+
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
new file mode 100644
index 0000000..52d89d5
--- /dev/null
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -0,0 +1,34 @@
+#############################################################
+#
+# libxml-parser-perl
+#
+#############################################################
+LIBXML_PARSER_PERL_VERSION:=2.36
+LIBXML_PARSER_PERL_SOURCE:=XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
+LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
+
+LIBXML_PARSER_PERL_DEPENDENCIES = expat
+HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
+
+define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
+ (cd $(@D) ; \
+   perl Makefile.PL \
+        PREFIX=$(HOST_DIR)/usr \
+        EXPATLIBPATH=$(HOST_DIR)/usr/lib \
+        EXPATINCPATH=$(HOST_DIR)/usr/include \
+        INSTALLDIRS=site \
+        INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
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
+$(eval $(call GENTARGETS,package,libxml-parser-perl))
+$(eval $(call GENTARGETS,package,libxml-parser-perl,host))
+
-- 
1.6.3.3
