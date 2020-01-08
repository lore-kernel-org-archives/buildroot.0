From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 18:16:54 +0100
Subject: [Buildroot] [git commit] utils/scancpan: warn when a module is a
 perl core module
Message-ID: <20200108171504.5BEFE8476D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bff3945afc4f0cf1a02fe1b35c4d733d67f9e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

we don't want create new BR package with perl core module,
because core modules are already included in perl distribution,
and built with the BR package perl.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/scancpan | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scancpan b/utils/scancpan
index ac5fd5159a..dbd8dab6d3 100755
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
