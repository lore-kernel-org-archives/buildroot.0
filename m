From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:18 -0700
Subject: [Buildroot] [PATCH 17/18] perl-xml-parser: use new
 patch_sub_makefile
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-18-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-xml-parser/perl-xml-parser.mk | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
index 223c32a8a5..59e2736cf7 100644
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# This is the target version. libxml-parser-perl is a host only version that
+# doesn't require building host-perl.
 PERL_XML_PARSER_VERSION = 2.44
 PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
 PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
@@ -12,21 +14,11 @@ PERL_XML_PARSER_CONF_OPTS += EXPATLIBPATH=$(TARGET_DIR)/usr/lib EXPATINCPATH=$(T
 PERL_XML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_XML_PARSER_LICENSE_FILES = README
 
-# There has got to be a better way... :(
-# Some arguments to Makefile.PL do not get propagated to subdirectories
-# similar to:
-# https://rt.cpan.org/Public/Bug/Display.html?id=28632
-define PERL_XML_PARSER_POST_CONFIGURE_SED
-	$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/Expat/Makefile
-	$(SED) "s:^FULL_AR = .*:FULL_AR = $(TARGET_AR):g" $(@D)/Expat/Makefile
-	$(SED) "s:^CC = .*:CC = $(TARGET_CC):g" $(@D)/Expat/Makefile
-	$(SED) "s:^CCFLAGS = .*:CCFLAGS = $(TARGET_CFLAGS):g" $(@D)/Expat/Makefile
-	$(SED) "s:^LD = .*:LD = $(TARGET_CC):g" $(@D)/Expat/Makefile
-	$(SED) "s:^LDDLFLAGS = .*:LDDLFLAGS = -shared $(TARGET_LDFLAGS):g" $(@D)/Expat/Makefile
-	$(SED) "s:^LDLFLAGS = .*:LDLFLAGS = $(TARGET_LDFLAGS):g" $(@D)/Expat/Makefile
-	$(SED) "s:^DESTDIR = .*:DESTDIR = $(TARGET_DIR):g" $(@D)/Expat/Makefile
+# Fix Expat/Makefile so it will cross-compile
+define PERL_XML_PARSER_POST_CONFIGURE_SUB_MAKEFILE
+	$(call patch_sub_makefile,$(@D)/Expat/Makefile)
 endef
 
-PERL_XML_PARSER_POST_CONFIGURE_HOOKS += PERL_XML_PARSER_POST_CONFIGURE_SED
+PERL_XML_PARSER_POST_CONFIGURE_HOOKS += PERL_XML_PARSER_POST_CONFIGURE_SUB_MAKEFILE
 
 $(eval $(perl-package))
-- 
2.14.4
