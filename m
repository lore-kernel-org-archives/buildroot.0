From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 13 Aug 2018 18:15:52 +0200
Subject: [Buildroot] [PATCH 1/2] scancpan: warn on suspicious host
 dependencies
Message-ID: <20180813161553.17702-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index 3fcf3944d..a1be3dd80 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -526,6 +526,12 @@ my $mirror = 'http://cpan.metacpan.org';        # a CPAN mirror
 my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1');
 my $ua = HTTP::Tiny->new();
 
+my %white_list = (
+    'Module-Build' => 1,
+    'Module-Build-Tiny' => 1,
+);
+my @info = ();
+
 sub get_checksum {
     my ($url) = @_;
     my ($path) = $url =~ m|^[^:/?#]+://[^/?#]*([^?#]*)|;
@@ -607,6 +613,8 @@ sub fetch {
             }
             else { # configure, build
                 $build{$distname} = 1;
+                push @info, qq{[$name] suspicious dependency on $distname}
+                    unless exists $white_list{$distname};
             }
         }
         $deps_build{$name} = [keys %build];
@@ -765,6 +773,8 @@ foreach my $distname (keys %need_target) {
 say qq{${cfgname} must contain the following lines:};
 say join qq{\n}, sort keys %pkg;
 
+say join qq{\n}, @info;
+
 __END__
 
 =head1 NAME
-- 
2.17.1
