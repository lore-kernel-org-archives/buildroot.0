From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 16 Jun 2014 21:35:56 +0200
Subject: [Buildroot] [v2 1/2] support/script/scancpan: populates Config.in
	with homepage
In-Reply-To: <1402947357-6359-1-git-send-email-francois.perrad@gadz.org>
References: <1402947357-6359-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1402947357-6359-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/scancpan | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index d8723f3..4be4754 100755
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
@@ -585,8 +586,9 @@ while (my ($distname, $dist) = each %dist) {
             my $brdep = brname( fsname( $dep ) );
             say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
         }
-        say {$fh} qq{\thelp} if $abstract;
-        say {$fh} qq{\t  ${abstract}} if $abstract;
+        say {$fh} qq{\thelp};
+        say {$fh} qq{\t  ${abstract}\n} if $abstract;
+        say {$fh} qq{\t  ${homepage}};
         close $fh;
     }
     if ($force || !-f $mkname) {
-- 
1.9.1
