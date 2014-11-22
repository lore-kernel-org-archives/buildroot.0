From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:43:00 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/scancpan:
	generate hash file
Message-ID: <20141122184611.7BE7E7FE27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6199f0f8239dc69aaec0111d4d9e8f9bfc1272cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

retrieve MD5 and SHA256 from metacpan.org, and store them in the hash
file for each package.

[Thomas: remove the odd indentation of the filename for the md5 hash
lines in the hash file.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index a049e2c..7ff647d 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -481,6 +481,7 @@ use Pod::Usage;
 use File::Basename;
 use Module::CoreList;
 use HTTP::Tiny;
+use Safe;
 use MetaCPAN::API::Tiny;
 
 my ($help, $man, $quiet, $force, $recommend, $test, $host);
@@ -505,9 +506,22 @@ my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
 my %license_files;      # name -> list of license files
+my %checksum;           # author -> list of checksum
 my $mcpan = MetaCPAN::API::Tiny->new();
 my $ua = HTTP::Tiny->new();
 
+sub get_checksum {
+    my ($url) = @_;
+    my($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
+    my($basename, $dirname) = fileparse( $path );
+    unless ($checksum{$dirname}) {
+        my $response = $ua->get(qq{http://cpan.metacpan.org${dirname}CHECKSUMS});
+        $checksum{$dirname} = $response->{content};
+    }
+    my $chksum = Safe->new->reval($checksum{$dirname});
+    return $chksum->{$basename}, $basename;
+}
+
 sub get_manifest {
     my ($author, $distname, $version) = @_;
     my $url = qq{http://api.metacpan.org/source/${author}/${distname}-${version}/MANIFEST};
@@ -608,6 +622,7 @@ while (my ($distname, $dist) = each %dist) {
     my $dirname = q{package/} . $fsname;
     my $cfgname = $dirname . q{/Config.in};
     my $mkname = $dirname . q{/} . $fsname . q{.mk};
+    my $hashname = $dirname . q{/} . $fsname . q{.hash};
     my $brname = brname( $fsname );
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
@@ -675,6 +690,17 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
         close $fh;
     }
+    if ($force || !-f $hashname) {
+        my($checksum, $filename) = get_checksum($dist->{download_url});
+        my $md5 = $checksum->{md5};
+        my $sha256 = $checksum->{sha256};
+        say qq{write ${hashname}} unless $quiet;
+        open my $fh, q{>}, $hashname;
+        say {$fh} qq{# retrieved by scancpan from http://cpan.metacpan.org/};
+        say {$fh} qq{md5    ${md5} ${filename}};
+        say {$fh} qq{sha256 ${sha256} ${filename}};
+        close $fh;
+    }
 }
 
 my %pkg;
