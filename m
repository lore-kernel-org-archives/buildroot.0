From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:15:54 -0000
Subject: [Buildroot] [git commit] scancpan: warn on undefined LICENSE
Message-ID: <20180907111502.90E648019E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd87d05f7792647d49694087f14e0307ba5b1be6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scancpan | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/scancpan b/utils/scancpan
index fa31dfdeab..8f47521692 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -705,6 +705,10 @@ while (my ($distname, $dist) = each %dist) {
         $license =~ s|openssl|OpenSSL|;
         $license =~ s|perl_5|Artistic or GPL-1.0+|;
         my $license_files = join q{ }, keys %{$license_files{$distname}};
+        if ($license_files && (!$license || $license eq q{unknown})) {
+            push @info, qq{[$distname] undefined LICENSE, see $license_files};
+            $license = q{???};
+        }
         say qq{write ${mkname}} unless $quiet;
         open my $fh, q{>}, $mkname;
         say {$fh} qq{################################################################################};
@@ -718,7 +722,7 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
         say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname} && $dependencies;
         say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname} && $host_dependencies;
-        say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
+        say {$fh} qq{${brname}_LICENSE = ${license}} if $license;
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
         foreach (sort @{$deps_optional{$distname}}) {
