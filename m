From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:38:31 +0200
Subject: [Buildroot] [git commit] support/script/scanpcan: small fix
Message-ID: <20140719094040.3663D9D286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed8ab0ce3d8e43a028b1e6568688f7e2122af6e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- typo in comment
- remove trailing space in _HOST_DEPENCENCIES when no dependency

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scancpan |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/support/scripts/scancpan b/support/scripts/scancpan
index 1280e75..de11ef1 100755
--- a/support/scripts/scancpan
+++ b/support/scripts/scancpan
@@ -503,7 +503,7 @@ my %need_host;          # name -> 1 if host package is needed
 my %need_dlopen;        # name -> 1 if requires dynamic library
 my %deps_build;         # name -> list of host dependencies
 my %deps_runtime;       # name -> list of target dependencies
-my %license_files;      # neam -> list of license files
+my %license_files;      # name -> list of license files
 my $mcpan = MetaCPAN::API::Tiny->new();
 my $ua = HTTP::Tiny->new();
 
@@ -636,10 +636,11 @@ while (my ($distname, $dist) = each %dist) {
         # the scheme is not used, because the job is done by the BR download infrastructure
         # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
         my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
-        my $dependencies = join q{ }, qw( perl ),
+        my $dependencies = join q{ }, qw( = perl ),
                                       map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
                                       map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
-        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
+        my $host_dependencies = join q{ }, qw( = ),
+                                           map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
                                                                                   @{$deps_runtime{$distname}} );
         my $license = ref $dist->{license} eq 'ARRAY'
                     ? join q{ or }, @{$dist->{license}}
@@ -659,8 +660,8 @@ while (my ($distname, $dist) = each %dist) {
         say {$fh} qq{${brname}_VERSION = ${version}};
         say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
         say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
-        say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname};
-        say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
+        say {$fh} qq{${brname}_DEPENDENCIES ${dependencies}} if $need_target{$distname};
+        say {$fh} qq{HOST_${brname}_DEPENDENCIES ${host_dependencies}} if $need_host{$distname};
         say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
         say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
         say {$fh} qq{};
