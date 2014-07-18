From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 19:45:20 +0200
Subject: [Buildroot] [git commit] support/scripts/scancpan: automatically
	populate LICENSE_FILES
Message-ID: <20140718174559.89EE09D27A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d3962f0bd0e0f989299eae40f88ede9c5483644
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the scancpan script to automatically populate the
LICENSE_FILES variable using informations available in the Perl
package MANIFEST file.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-perl.txt |    3 ---
 support/scripts/scancpan             |   30 +++++++++++++++++++++++++-----
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-perl.txt b/docs/manual/adding-packages-perl.txt
index d1a1616..9a3df4d 100644
--- a/docs/manual/adding-packages-perl.txt
+++ b/docs/manual/adding-packages-perl.txt
@@ -53,9 +53,6 @@ requested package, and also recursively for all dependencies specified by
 CPAN. You should still manually edit the result. In particular, the
 following things should be checked.
 
-* The +PERL_FOO_BAR_LICENSE_FILES+ variable is not set, because metacpan
-  doesn't have this information. Also, the name of the license file(s)
-  varies between packages, and some don't even have a license file.
 * If the perl module links with a shared library that is provided by
   another (non-perl) package, this dependency is not added automatically.
   It has to be added manually to +PERL_FOO_BAR_DEPENDENCIES+.
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index d683f88..1280e75 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -503,17 +503,33 @@ my %need_host;          # name -> 1 if host package is needed
 my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
+my %license_files;      # neam -> list of license files
 my $mcpan = MetaCPAN::API::Tiny->new();
 my $ua = HTTP::Tiny->new();
 
-sub is_xs {
+sub get_manifest {
     my ($author, $distname, $version) = @_;
+    my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
+    my $response = $ua->get($url);
+    return $response->{content};
+}
+
+sub is_xs {
+    my ($manifest) = @_;
     # This heuristic determines if a module is a native extension, by searching
     # some file extension types in the MANIFEST of the distribution.
     # It was inspired by http://deps.cpantesters.org/static/purity.html
-    my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
-    my $response = $ua->get($url);
-    return $response->{content} =~ m/\.(swg|xs|c|h|i)\n/;
+    return $manifest =~ m/\.(swg|xs|c|h|i)\n/;
+}
+
+sub find_license_files {
+    my ($manifest) = @_;
+    my @license_files;
+    foreach (split /\n/, $manifest) {
+        next if m|/|;
+        push @license_files, $_ if m/(ARTISTIC|COPYING|COPYRIGHT|LICENSE)/i;
+    }
+    return \@license_files;
 }
 
 sub fetch {
@@ -524,7 +540,9 @@ sub fetch {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
-        $need_dlopen{$name} = is_xs( $result->{author}, $name, $result->{version} );
+        my $manifest = get_manifest( $result->{author}, $name, $result->{version} );
+        $need_dlopen{$name} = is_xs( $manifest );
+        $license_files{$name} = find_license_files( $manifest );
         my @deps_build = ();
         my @deps_runtime = ();
         my $mb;
@@ -629,6 +647,7 @@ while (my ($distname, $dist) = each %dist) {
         $license =~ s|artistic_2|Artistic-2.0|;
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPLv1+|;
+        my $license_files = join q{ }, @{$license_files{$distname}};
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
         say {$fh} qq{################################################################################};
@@ -643,6 +662,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname};
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
+        say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
         say {$fh} qq{\$(eval \$(perl-package))} if $need_target{$distname};
         say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
