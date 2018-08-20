From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:12 -0700
Subject: [Buildroot] [PATCH 11/18] perl-xml-parser: new package
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-12-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-xml-parser/Config.in            | 12 +++++++++++
 package/perl-xml-parser/perl-xml-parser.hash |  6 ++++++
 package/perl-xml-parser/perl-xml-parser.mk   | 32 ++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)
 create mode 100644 package/perl-xml-parser/Config.in
 create mode 100644 package/perl-xml-parser/perl-xml-parser.hash
 create mode 100644 package/perl-xml-parser/perl-xml-parser.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b17ada11d..c2d097ce4d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -512,6 +512,7 @@ F:	package/perl-sys-mmap/
 F:	package/perl-template-toolkit/
 F:	package/perl-time-parsedate/
 F:	package/perl-x10/
+F:	package/perl-xml-parser/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 9ec5dd1007..dcdc032b65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -745,6 +745,7 @@ menu "Perl libraries/modules"
 	source "package/perl-x10/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
+	source "package/perl-xml-parser/Config.in"
 	source "package/perl-xml-sax/Config.in"
 	source "package/perl-xml-sax-base/Config.in"
 endmenu
diff --git a/package/perl-xml-parser/Config.in b/package/perl-xml-parser/Config.in
new file mode 100644
index 0000000000..9200f09ddb
--- /dev/null
+++ b/package/perl-xml-parser/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_XML_PARSER
+	bool "perl-xml-parser"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_LIBWWW_PERL
+	select BR2_PACKAGE_EXPAT
+	help
+	  A perl module for parsing XML documents
+
+	  https://metacpan.org/release/XML-Parser
+
+comment "perl-xml-parser needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-xml-parser/perl-xml-parser.hash b/package/perl-xml-parser/perl-xml-parser.hash
new file mode 100644
index 0000000000..6c8017764c
--- /dev/null
+++ b/package/perl-xml-parser/perl-xml-parser.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    af4813fe3952362451201ced6fbce379 XML-Parser-2.44.tar.gz
+sha256 1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216 XML-Parser-2.44.tar.gz
+
+# computed by scancpan
+sha256 a008c782e078102720266824c1e87875bafbf25ffae4b173dc135f9a4e1c672e README
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
new file mode 100644
index 0000000000..223c32a8a5
--- /dev/null
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# perl-xml-parser
+#
+################################################################################
+
+PERL_XML_PARSER_VERSION = 2.44
+PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
+PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
+PERL_XML_PARSER_DEPENDENCIES = perl-libwww-perl expat
+PERL_XML_PARSER_CONF_OPTS += EXPATLIBPATH=$(TARGET_DIR)/usr/lib EXPATINCPATH=$(TARGET_DIR)/usr/include
+PERL_XML_PARSER_LICENSE = Artistic or GPL-1.0+
+PERL_XML_PARSER_LICENSE_FILES = README
+
+# There has got to be a better way... :(
+# Some arguments to Makefile.PL do not get propagated to subdirectories
+# similar to:
+# https://rt.cpan.org/Public/Bug/Display.html?id=28632
+define PERL_XML_PARSER_POST_CONFIGURE_SED
+	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/Expat/Makefile
+	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(@D)/Expat/Makefile
+	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(@D)/Expat/Makefile
+	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(@D)/Expat/Makefile
+	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(@D)/Expat/Makefile
+	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(@D)/Expat/Makefile
+	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(@D)/Expat/Makefile
+	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(@D)/Expat/Makefile
+endef
+
+PERL_XML_PARSER_POST_CONFIGURE_HOOKS += PERL_XML_PARSER_POST_CONFIGURE_SED
+
+$(eval $(perl-package))
-- 
2.14.4
