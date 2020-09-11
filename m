From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 23:18:11 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 package/libxml-parser-perl: use the compiler as "LD"
Message-ID: <20200911211225.5B1E48863C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=979fa9778401db925f419a2f731e0e647642ba8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Since commit efa95b19aeab6bdcd7d5a620e199c2c32cf2516b
("package/libxml-parser-perl: make host build use correct compiler"),
we pass $(HOST_CONFIGURE_OPTS) when building host-libxml-parser-perl,
in order to use the correct host compiler.

However, this means that LD="$(HOSTLD)" is passed. However, the
host-libxml-parser-perl passes compiler arguments to LD, so it really
assumes that LD is gcc, not ld. For example, it tries to pass
-mtune=generic.

So, let's tell host-libxml-parser-perl that LD is "$(HOSTCC)".

Fixes:

  http://autobuild.buildroot.net/results/2ed2e5ccefe9047c597f84d5880de2e8de2bdd94/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 43a26d7fe420625da93ec93543f1610dbc2f43c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml-parser-perl/libxml-parser-perl.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 100c49633c..37cef2e418 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -12,9 +12,14 @@ LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
 LIBXML_PARSER_PERL_LICENSE_FILES = README
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
+HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	LD="$(HOSTCC)"
+
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 	(cd $(@D) ; \
-		$(HOST_CONFIGURE_OPTS) $(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
+		$(HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS) \
+			$(LIBXML_PARSER_PERL_RUN_PERL) Makefile.PL \
 			PREFIX=$(HOST_DIR) \
 			EXPATLIBPATH=$(HOST_DIR)/lib \
 			EXPATINCPATH=$(HOST_DIR)/include \
@@ -25,7 +30,7 @@ define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
 endef
 
 define HOST_LIBXML_PARSER_PERL_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_LIBXML_PARSER_PERL_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define HOST_LIBXML_PARSER_PERL_INSTALL_CMDS
