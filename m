From: Norbert Lange <nolange79@gmail.com>
Date: Sun,  7 Jun 2020 00:23:38 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libxml-parser-perl: make host
 build use correct compiler
Message-ID: <20200606222339.6965-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package uses gcc filename without absolute path, which breaks
the host build if host and target compiler have the same filename.
(Can happen with an external toolchain).

This patch adds the variables for the host as overrides,
as they are otherwise not picked up from the environment.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index fcde5fc939..100c49633c 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -25,7 +25,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 endef
 
 define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
-- 
2.26.2
