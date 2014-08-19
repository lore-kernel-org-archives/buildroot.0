From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 19 Aug 2014 20:07:16 +0200
Subject: [Buildroot] [PATCH 4/6] pkg-perl: add host-perl dependency
In-Reply-To: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
References: <1408471638-4551-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1408471638-4551-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.mk | 1 +
 package/perl-xml-parser/perl-xml-parser.mk     | 2 +-
 support/scripts/scancpan                       | 8 ++++----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 1eabe61..4f24c2e 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -7,6 +7,7 @@
 PERL_MODULE_BUILD_VERSION = 0.4206
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+HOST_PERL_MODULE_BUILD_DEPENDENCIES = host-perl
 PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
 
 $(eval $(host-perl-package))
diff --git a/package/perl-xml-parser/perl-xml-parser.mk b/package/perl-xml-parser/perl-xml-parser.mk
index 16dc6fb..1b90f2e 100644
--- a/package/perl-xml-parser/perl-xml-parser.mk
+++ b/package/perl-xml-parser/perl-xml-parser.mk
@@ -7,7 +7,7 @@
 PERL_XML_PARSER_VERSION = 2.41
 PERL_XML_PARSER_SOURCE = XML-Parser-$(PERL_XML_PARSER_VERSION).tar.gz
 PERL_XML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
-PERL_XML_PARSER_DEPENDENCIES = expat
+HOST_PERL_XML_PARSER_DEPENDENCIES = host-perl host-expat
 PERL_XML_PARSER_LICENSE = Artistic or GPLv1+
 
 HOST_PERL_XML_PARSER_CONF_OPT = \
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 50d9bab..f6661d3 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -636,10 +636,10 @@ while (my ($distname, $dist) = each %dist) {
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
-        my $dependencies = join q{ }, qw( = perl ),
+        my $dependencies = join q{ }, qw( perl ),
                                       map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
-        my $host_dependencies = join q{ }, qw( = ),
+        my $host_dependencies = join q{ }, qw( host-perl ),
                                            map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
                                                                                   @{$deps_runtime{$distname}} );
         my $license = ref $dist->{license} eq 'ARRAY'
@@ -663,8 +663,8 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_VERSION = ${version}};
         say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
         say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
-        say {$fh} qq{${brname}_DEPENDENCIES ${dependencies}} if $need_target{$distname};
-        say {$fh} qq{HOST_${brname}_DEPENDENCIES ${host_dependencies}} if $need_host{$distname};
+        say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname};
+        say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
-- 
1.9.1
