From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 15 Jun 2014 18:59:20 +0200
Subject: [Buildroot] [PATCH 1/2] support/script/scancpan: populates
	Config.in with homepage
Message-ID: <1402851561-23157-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index d8723f3..bf0aaa5 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -577,6 +577,7 @@ while (my ($distname, $dist) = each %dist) {
     mkdir $dirname unless -d $dirname;
     if ($need_target{$distname} && ($force || !-f $cfgname)) {
         my $abstract = $dist->{abstract};
+        my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
         say qq{write ${cfgname}} unless $quiet;
         open my $fh, q{>}, $cfgname;
         say {$fh} qq{config BR2_PACKAGE_${brname}};
@@ -585,8 +586,10 @@ while (my ($distname, $dist) = each %dist) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
         }
-        say {$fh} qq{\thelp} if $abstract;
+        say {$fh} qq{\thelp};
         say {$fh} qq{\t  ${abstract}} if $abstract;
+        say {$fh} qq{\t  } if $abstract;
+        say {$fh} qq{\t  ${homepage}};
         close $fh;
     }
     if ($force || !-f $mkname) {
-- 
1.9.1
