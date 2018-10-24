From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Oct 2018 09:10:56 +0200
Subject: [Buildroot] [PATCH] scancpan: print package/Config.in only when
 useful
Message-ID: <20181024071056.23683-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ie. when a new Perl package is added

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 7c1e4236f..f9589a4ff 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -526,6 +526,7 @@ my %checksum;           # author -> list of checksum
 my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
+my $new_pkgs;
 
 my %white_list = (
     'ExtUtils-Config' => 1,
@@ -684,7 +685,10 @@ while (my ($distname, $dist) = each %dist) {
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
         my $abstract = wrap( q{}, qq{\t  }, $dist->{abstract} );
@@ -773,24 +777,26 @@ while (my ($distname, $dist) = each %dist) {
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
 
-- 
2.17.1
