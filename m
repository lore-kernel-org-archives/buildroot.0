From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 17 Jul 2014 18:32:58 +0200
Subject: [Buildroot] [PATCH 1/5] support/script/scancpan: add support
	PREFER_STATIC_LIB
Message-ID: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perl extensions are loaded at runtime with dlopen(), so it does not
make sense to even build extensions that are written in C.

Perl module written in C or with a dependency on a module written in C
is not available when doing a static build.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 348b7cc..1bf04ea 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -480,6 +480,7 @@ use Getopt::Long;
 use Pod::Usage;
 use File::Basename;
 use Module::CoreList;
+use HTTP::Tiny;
 use MetaCPAN::API::Tiny;
 
 my ($help, $man, $quiet, $force, $recommend, $host);
@@ -499,9 +500,21 @@ pod2usage(-exitval => 1) if scalar @ARGV == 0;
 my %dist;               # name -> metacpan data
 my %need_target;        # name -> 1 if target package is needed
 my %need_host;          # name -> 1 if host package is needed
+my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
 my $mcpan = MetaCPAN::API::Tiny->new();
+my $ua = HTTP::Tiny->new();
+
+sub is_xs {
+    my ($author, $distname, $version) = @_;
+    # This heuristic determines if a module is a native extension, by searching
+    # some file extension types in the MANIFEST of the distribution.
+    # It was inspired by http://deps.cpantesters.org/static/purity.html
+    my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
+    my $response = $ua->get($url);
+    return $response->{content} =~ m/\.(swg|xs|c|h|i)\n/;
+}
 
 sub fetch {
     my ($name, $need_target, $need_host) = @_;
@@ -511,6 +524,7 @@ sub fetch {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
+        $need_dlopen{$name} = is_xs( $result->{author}, $name, $result->{version} );
         my @deps_build = ();
         my @deps_runtime = ();
         my $mb;
@@ -539,12 +553,13 @@ sub fetch {
         unshift @deps_build, q{Module-Build} if $mb;
         $deps_build{$name} = \@deps_build;
         $deps_runtime{$name} = \@deps_runtime;
-    }
-    foreach my $distname (@{$deps_build{$name}}) {
-        fetch( $distname, 0, 1 );
-    }
-    foreach my $distname (@{$deps_runtime{$name}}) {
-        fetch( $distname, $need_target, $need_host );
+        foreach my $distname (@deps_build) {
+            fetch( $distname, 0, 1 );
+        }
+        foreach my $distname (@deps_runtime) {
+            fetch( $distname, $need_target, $need_host );
+            $need_dlopen{$name} ||= $need_dlopen{$distname};
+        }
     }
     return;
 }
@@ -582,6 +597,7 @@ while (my ($distname, $dist) = each %dist) {
         open my $fh, q{>}, $cfgname;
         say {$fh} qq{config BR2_PACKAGE_${brname}};
         say {$fh} qq{\tbool "${fsname}"};
+        say {$fh} qq{\tdepends on !BR2_PREFER_STATIC_LIB} if $need_dlopen{$distname};
         foreach my $dep (sort @{$deps_runtime{$distname}}) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
@@ -589,6 +605,10 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{\thelp};
         say {$fh} qq{\t  ${abstract}\n} if $abstract;
         say {$fh} qq{\t  ${homepage}};
+        if ($need_dlopen{$distname}) {
+            say {$fh} qq{\ncomment "${fsname} needs a toolchain w/ dynamic library"};
+            say {$fh} qq{\tdepends on BR2_PREFER_STATIC_LIB};
+        }
         close $fh;
     }
     if ($force || !-f $mkname) {
-- 
1.9.1
