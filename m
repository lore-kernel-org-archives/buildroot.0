From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2020 16:10:37 +0100
Subject: [Buildroot] [PATCH v2 1/5] utils/scancpan: warn when a module is a
 perl core module
Message-ID: <20200108151041.12757-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

we don't want create new BR package with perl core module,
because core modules are already included in perl distribution,
and built with the BR package perl.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 utils/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index ac5fd5159..dbd8dab6d 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -611,6 +611,9 @@ sub fetch {
     unless ($dist{$name} && !$top) {
         say qq{fetch ${name}} unless $quiet;
         my $result = $mcpan->release( distribution => $name );
+        my $main_module = $result->{main_module};
+        push @info, qq{[$name] $main_module is a core module}
+            if $top && Module::CoreList::is_core( $main_module, undef, $] );
         $dist{$name} = $result;
         $license_files{$name} = {};
         eval {
-- 
2.20.1
