From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:42:44 +0200
Subject: [Buildroot] [git commit] support/script/scancpan: add -test option
Message-ID: <20141004124351.469099D821@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1fd8d9e4dd04c63c17f13352e1c0f01e2bea7312
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Perl modules can have three different types of dependencies:

 - configure/build time dependency which becomes host dependency
 - runtime dependency which becomes target dependency
 - test time dependency which is useless in a cross-compiling context like BR

Before this patch, test time dependencies are handled like runtime
dependencies.

After this patch, test time dependencies are ignored by default. The
newly added -test option allows to add them anyway if needed.

[Thomas: reword commit log using Francois proposal.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index f5612e3..a049e2c 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -483,7 +483,7 @@ use Module::CoreList;
 use HTTP::Tiny;
 use MetaCPAN::API::Tiny;
 
-my ($help, $man, $quiet, $force, $recommend, $host);
+my ($help, $man, $quiet, $force, $recommend, $test, $host);
 my $target = 1;
 GetOptions( 'help|?' => \$help,
             'man' => \$man,
@@ -491,7 +491,8 @@ GetOptions( 'help|?' => \$help,
             'force|f' => \$force,
             'host!' => \$host,
             'target!' => \$target,
-            'recommend' => \$recommend
+            'recommend' => \$recommend,
+            'test' => \$test
 ) or pod2usage(-exitval => 1);
 pod2usage(-exitval => 0) if $help;
 pod2usage(-exitval => 0, -verbose => 2) if $man;
@@ -554,11 +555,12 @@ sub fetch {
             next if $modname eq q{perl};
             next if $modname =~ m|^Alien|;
             next if $modname =~ m|^Win32|;
+            next if !$test && $modname =~ m|^Test|; 
             next if Module::CoreList::first_release( $modname );
             # we could use the host Module::CoreList data, because host perl and
             # target perl have the same major version
             next if ${$dep}{phase} eq q{develop};
-            next if ${$dep}{phase} eq q{test};
+            next if !$test && ${$dep}{phase} eq q{test};
             next if !$recommend && ${$dep}{relationship} ne q{requires};
             my $distname = $mcpan->module( $modname )->{distribution};
             if (${$dep}{phase} eq q{runtime}) {
@@ -716,6 +718,7 @@ supports/scripts/scancpan [options] [distname ...]
    -target/-notarget
    -host/-nohost
    -recommend
+   -test
 
 =head1 OPTIONS
 
@@ -749,6 +752,10 @@ Switches package generation for the host variant (the default is C<-nohost>).
 
 Adds I<recommended> dependencies.
 
+=item B<-test>
+
+Adds dependencies for test.
+
 =back
 
 =head1 DESCRIPTION
