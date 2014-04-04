From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:31:06 +0200
Subject: [Buildroot] [git commit] script/scancpan: add -host & -target
	options
Message-ID: <20140404213202.E33EA9C552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f33003a546df77908c65516dde725d4601268c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |   24 ++++++++++++++++++------
 1 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 8d26795..dc62b47 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -482,11 +482,14 @@ use File::Basename;
 use Module::CoreList;
 use MetaCPAN::API::Tiny;
 
-my ($help, $man, $quiet, $force, $recommend);
+my ($help, $man, $quiet, $force, $recommend, $host);
+my $target = 1;
 GetOptions( 'help|?' => \$help,
             'man' => \$man,
             'quiet|q' => \$quiet,
             'force|f' => \$force,
+            'host!' => \$host,
+            'target!' => \$target,
             'recommend' => \$recommend
 ) or pod2usage(-exitval => 1);
 pod2usage(-exitval => 0) if $help;
@@ -547,8 +550,8 @@ sub fetch {
 }
 
 foreach my $distname (@ARGV) {
-    # Command-line's distributions are needed for target, not host
-    fetch( $distname, 1, 0 );
+    # Command-line's distributions
+    fetch( $distname, !!$target, !!$host );
 }
 say scalar keys %dist, q{ packages fetched.} unless $quiet;
 
@@ -660,6 +663,8 @@ supports/scripts/scancpan [options] [distname ...]
    -man
    -quiet
    -force
+   -target/-notarget
+   -host/-nohost
    -recommend
 
 =head1 OPTIONS
@@ -682,6 +687,14 @@ Executes without output
 
 Forces the overwriting of existing files.
 
+=item B<-target/-notarget>
+
+Switches package generation for the target variant (the default is C<-target>).
+
+=item B<-host/-nohost>
+
+Switches package generation for the host variant (the default is C<-nohost>).
+
 =item B<-recommend>
 
 Adds I<recommended> dependencies.
@@ -695,9 +708,8 @@ Perl/CPAN distributions required by the specified distnames. The
 dependencies and metadata are fetched from https://metacpan.org/.
 
 After running this script, it is necessary to check the generated files.
-You have to manually enable the host- version if you need it. You have to
-manually add the license files (PERL_FOO_LICENSE_FILES variable). For
-distributions that link against a target library, you have to add the
+You have to manually add the license files (PERL_FOO_LICENSE_FILES variable).
+For distributions that link against a target library, you have to add the
 buildroot package name for that library to the DEPENDENCIES variable.
 
 See the Buildroot documentation for details on the usage of the Perl
