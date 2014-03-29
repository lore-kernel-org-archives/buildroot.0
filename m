From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 29 Mar 2014 16:17:04 +0100
Subject: [Buildroot] [PATCH] script/scancpan: add -host & -hostonly options
Message-ID: <1396106224-26505-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/scancpan |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 8d26795..2008356 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -482,11 +482,13 @@ use File::Basename;
 use Module::CoreList;
 use MetaCPAN::API::Tiny;
 
-my ($help, $man, $quiet, $force, $recommend);
+my ($help, $man, $quiet, $force, $recommend, $host, $hostonly);
 GetOptions( 'help|?' => \$help,
             'man' => \$man,
             'quiet|q' => \$quiet,
             'force|f' => \$force,
+            'host' => \$host,
+            'hostonly' => \$hostonly,
             'recommend' => \$recommend
 ) or pod2usage(-exitval => 1);
 pod2usage(-exitval => 0) if $help;
@@ -547,8 +549,8 @@ sub fetch {
 }
 
 foreach my $distname (@ARGV) {
-    # Command-line's distributions are needed for target, not host
-    fetch( $distname, 1, 0 );
+    # Command-line's distributions
+    fetch( $distname, !$hostonly, $host || $hostonly );
 }
 say scalar keys %dist, q{ packages fetched.} unless $quiet;
 
@@ -660,6 +662,8 @@ supports/scripts/scancpan [options] [distname ...]
    -man
    -quiet
    -force
+   -host
+   -hostonly
    -recommend
 
 =head1 OPTIONS
@@ -682,6 +686,14 @@ Executes without output
 
 Forces the overwriting of existing files.
 
+=item B<-host>
+
+Generates package for the target and host variants (the default is for target only).
+
+=item B<-hostonly>
+
+Generates package only for the host variant (the default is for target only).
+
 =item B<-recommend>
 
 Adds I<recommended> dependencies.
-- 
1.7.9.5
