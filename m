From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:55 -0000
Subject: [Buildroot] [git commit] scancpan: warn on suspicious host
 dependencies
Message-ID: <20180907111502.6C96A7FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a96680891a7c23c31d07e5a32896f808c20e453c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index da8e7b91ac..fa31dfdeab 100755
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
