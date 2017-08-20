From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:31 +0200
Subject: [Buildroot] [PATCH 18/18] scancpan: catch exception when MANIFEST
	is missing
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-18-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/utils/scancpan b/utils/scancpan
index 9ccbac5a4..20bd4c693 100755
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
-- 
2.11.0
