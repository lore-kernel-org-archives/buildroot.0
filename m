From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 22:21:30 +0100
Subject: [Buildroot] [git commit] utils/scancpan: print package/Config.in
 only when useful
Message-ID: <20181101212029.EAB51870F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f95d44d3f365c01dd5fa6e6bb46406d903407776
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, utils/scancpan always outputs what should be placed in
package/Config.in to include all Perl packages Config.in
files. However, in practice, this is only useful when a new package is
added. This commit adjusts this behavior so that what should be place
in package/Config for Perl packages is only displayed when scancpan
has produced a new Buildroot package for a Perl module.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 5465ff4304..78ea08c6ec 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -526,6 +526,7 @@ my %checksum;           # author -> list of checksum
 my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
+my $new_pkgs;
 
 my %white_list = (
     'ExtUtils-Config' => 1,
@@ -687,7 +688,10 @@ while (my ($distname, $dist) = each %dist) {
     my $mkname = $dirname . q{/} . $fsname . q{.mk};
     my $hashname = $dirname . q{/} . $fsname . q{.hash};
     my $brname = brname( $fsname );
-    mkdir $dirname unless -d $dirname;
+    unless (-d $dirname) {
+        mkdir $dirname;
+        $new_pkgs = 1;
+    }
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
         $dist->{abstract} =~ s|\s+$||;
         $dist->{abstract} .= q{.} unless $dist->{abstract} =~ m|\.$|;
@@ -777,24 +781,26 @@ while (my ($distname, $dist) = each %dist) {
     }
 }
 
-my %pkg;
-my $cfgname = q{package/Config.in};
-if (-f $cfgname) {
-    open my $fh, q{<}, $cfgname;
-    while (<$fh>) {
-        chomp;
-        $pkg{$_} = 1 if m|package/perl-|;
+if ($new_pkgs) {
+    my %pkg;
+    my $cfgname = q{package/Config.in};
+    if (-f $cfgname) {
+        open my $fh, q{<}, $cfgname;
+        while (<$fh>) {
+            chomp;
+            $pkg{$_} = 1 if m|package/perl-|;
+        }
+        close $fh;
     }
-    close $fh;
-}
 
-foreach my $distname (keys %need_target) {
-    my $fsname = fsname( $distname );
-    $pkg{qq{\tsource "package/${fsname}/Config.in"}} = 1;
-}
+    foreach my $distname (keys %need_target) {
+        my $fsname = fsname( $distname );
+        $pkg{qq{\tsource "package/${fsname}/Config.in"}} = 1;
+    }
 
-say qq{${cfgname} must contain the following lines:};
-say join qq{\n}, sort keys %pkg;
+    say qq{${cfgname} must contain the following lines:};
+    say join qq{\n}, sort keys %pkg;
+}
 
 say join qq{\n}, @info;
 
