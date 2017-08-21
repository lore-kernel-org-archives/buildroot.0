From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:41:07 +0200
Subject: [Buildroot] [git commit branch/next] scancpan: catch exception when
	MANIFEST is missing
Message-ID: <20170821214003.7C4CE821F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c92612b4b55262dc5c39a7386e725b624f5e1f23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/scancpan | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 9ccbac5..20bd4c6 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -567,11 +567,17 @@ sub fetch {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
         $dist{$name} = $result;
-        my $manifest = $mcpan->source( author => $result->{author},
-                                       release => $name . q{-} . $result->{version},
-                                       path => 'MANIFEST' );
-        $need_dlopen{$name} = is_xs( $manifest );
-        $license_files{$name} = find_license_files( $manifest );
+        eval {
+            my $manifest = $mcpan->source( author => $result->{author},
+                                           release => $name . q{-} . $result->{version},
+                                           path => 'MANIFEST' );
+            $need_dlopen{$name} = is_xs( $manifest );
+            $license_files{$name} = find_license_files( $manifest );
+        };
+        if ($@) {
+            warn $@;
+            $license_files{$name} = [];
+        }
         my %build = ();
         my %runtime = ();
         my %optional = ();
