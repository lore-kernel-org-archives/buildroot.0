From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Mar 2012 17:28:34 +0200
Subject: [Buildroot] [git commit] libxml-parser-perl: fix host-intltool
	breakage when microperl is enabled
Message-ID: <20120328065359.6DB7696998@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Microperl will build host-microperl and install it into HOST_DIR/usr/bin,
where other packages will pick it up as _CONFIGURE_OPTS / _MAKE_ENV
prepends that to the path.

libxml-parser-perl didn't though, so it would still be built against
the system perl, causing host-intltool to fail when it would use
host-microperl together with libxml-parser-perl if the system perl
isn't compatible with host-microperl.

Fix it by using HOST_CONFIGURE_OPTS and ensuring it is built after
(host-)microperl if enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml-parser-perl/libxml-parser-perl.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index 9e6f2ec..1022302 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -9,9 +9,15 @@ LIBXML_PARSER_PERL_SITE:=http://www.cpan.org/modules/by-module/XML/
 
 LIBXML_PARSER_PERL_DEPENDENCIES = expat
 
+ifeq ($(BR2_PACKAGE_MICROPERL),y)
+# microperl builds host-microperl, so ensure we build after that to build
+# against host-microperl instead of the system perl
+LIBXML_PARSER_PERL_DEPENDENCIES += microperl
+endif
+
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
  (cd $(@D) ; \
-   perl Makefile.PL \
+   $(HOST_CONFIGURE_OPTS) perl Makefile.PL \
         PREFIX=$(HOST_DIR)/usr \
         EXPATLIBPATH=$(HOST_DIR)/usr/lib \
         EXPATINCPATH=$(HOST_DIR)/usr/include \
