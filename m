From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 22 Sep 2018 08:53:23 +0200
Subject: [Buildroot] [PATCH] scancpan: refactor license name adjustment
Message-ID: <20180922065323.14394-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index ee547c3e7..c460e1665 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -655,6 +655,24 @@ sub brname {
     return uc $name;
 }
 
+# Buildroot requires license name as in http://spdx.org/licenses/
+sub brlicense {
+    my $license = shift;
+    $license =~ s|apache_1_1|Apache-1.1|;
+    $license =~ s|apache_2_0|Apache-2.0|;
+    $license =~ s|artistic_2|Artistic-2.0|;
+    $license =~ s|artistic|Artistic-1.0|;
+    $license =~ s|lgpl_2_1|LGPL-2.1|;
+    $license =~ s|lgpl_3_0|LGPL-3.0|;
+    $license =~ s|gpl_2|GPL-2.0|;
+    $license =~ s|gpl_3|GPL-3.0|;
+    $license =~ s|mit|MIT|;
+    $license =~ s|mozilla_1_1|Mozilla-1.1|;
+    $license =~ s|openssl|OpenSSL|;
+    $license =~ s|perl_5|Artistic or GPL-1.0+|;
+    return $license;
+}
+
 while (my ($distname, $dist) = each %dist) {
     my $fsname = fsname( $distname );
     my $dirname = q{package/} . $fsname;
@@ -696,22 +714,9 @@ while (my ($distname, $dist) = each %dist) {
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
         my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
                                                                                   @{$deps_runtime{$distname}} );
-        my $license = ref $dist->{license} eq 'ARRAY'
-                    ? join q{ or }, @{$dist->{license}}
-                    : $dist->{license};
-        # BR requires license name as in http://spdx.org/licenses/
-        $license =~ s|apache_1_1|Apache-1.1|;
-        $license =~ s|apache_2_0|Apache-2.0|;
-        $license =~ s|artistic|Artistic-1.0|;
-        $license =~ s|artistic_2|Artistic-2.0|;
-        $license =~ s|lgpl_2_1|LGPL-2.1|;
-        $license =~ s|lgpl_3_0|LGPL-3.0|;
-        $license =~ s|gpl_2|GPL-2.0|;
-        $license =~ s|gpl_3|GPL-3.0|;
-        $license =~ s|mit|MIT|;
-        $license =~ s|mozilla_1_1|Mozilla-1.1|;
-        $license =~ s|openssl|OpenSSL|;
-        $license =~ s|perl_5|Artistic or GPL-1.0+|;
+        my $license = brlicense( ref $dist->{license} eq 'ARRAY'
+                               ? join q{ or }, @{$dist->{license}}
+                               : $dist->{license} );
         my $license_files = join q{ }, keys %{$license_files{$distname}};
         if ($license_files && (!$license || $license eq q{unknown})) {
             push @info, qq{[$distname] undefined LICENSE, see $license_files};
-- 
2.17.1
