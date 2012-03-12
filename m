From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 11 Mar 2012 22:58:50 -0300
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
	drop wrong paths
In-Reply-To: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop incorrect INSTALL* paths, host-microperl knows better.
Also need host-microperl dependency before building.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |   18 +++++++-----------
 1 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 9e6f2ec..0bcda5d 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -3,32 +3,28 @@
 # libxml-parser-perl
 #
 #############################################################
-LIBXML_PARSER_PERL_VERSION:=2.36
-LIBXML_PARSER_PERL_SOURCE:=XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
-LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
 
-LIBXML_PARSER_PERL_DEPENDENCIES = expat
+LIBXML_PARSER_PERL_VERSION = 2.36
+LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
+LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML/
+LIBXML_PARSER_PERL_DEPENDENCIES = expat host-microperl
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
  (cd $(@D) ; \
-   perl Makefile.PL \
+   $(HOST_DIR)/usr/bin/perl Makefile.PL \
         PREFIX=$(HOST_DIR)/usr \
         EXPATLIBPATH=$(HOST_DIR)/usr/lib \
         EXPATINCPATH=$(HOST_DIR)/usr/include \
-        INSTALLDIRS=site \
-        INSTALLSITELIB=$(HOST_DIR)/usr/lib/perl \
-        INSTALLSITEARCH=$(HOST_DIR)/usr/lib/perl \
  )
 endef
 
 define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
 $(eval $(call GENTARGETS))
 $(eval $(call GENTARGETS,host))
-
-- 
1.7.3.4
