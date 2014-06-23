From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 23 Jun 2014 20:14:44 +0200
Subject: [Buildroot] [PATCH 1/3] support/script/cpan: improve Makefile
	generation
Message-ID: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- remove trailing space after perl when it's the only dependency
- license: substitution of perl name by BR name
- add a tabulation before source

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 4be4754..348b7cc 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -598,14 +598,17 @@ while (my ($distname, $dist) = each %dist) {
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
-        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
+        my $dependencies = join q{ }, qw( perl ),
+                                      map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
         my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
                                                                                   @{$deps_runtime{$distname}} );
         my $license = ref $dist->{license} eq 'ARRAY'
                     ? join q{ or }, @{$dist->{license}}
                     : $dist->{license};
-        $license = q{Artistic or GPLv1+} if $license eq q{perl_5};
+        $license =~ s|artistic_2|Artistic-2.0|;
+        $license =~ s|openssl|OpenSSL|;
+        $license =~ s|perl_5|Artistic or GPLv1+|;
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
         say {$fh} qq{################################################################################};
@@ -617,7 +620,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_VERSION = ${version}};
         say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
         say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
-        say {$fh} qq{${brname}_DEPENDENCIES = perl ${dependencies}} if $need_target{$distname};
+        say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname};
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
         say {$fh} qq{};
@@ -640,7 +643,7 @@ if (-f $cfgname) {
 
 foreach my $distname (keys %need_target) {
     my $fsname = fsname( $distname );
-    $pkg{qq{source "package/${fsname}/Config.in"}} = 1;
+    $pkg{qq{\tsource "package/${fsname}/Config.in"}} = 1;
 }
 
 say qq{${cfgname} must contain the following lines:};
-- 
1.9.1
