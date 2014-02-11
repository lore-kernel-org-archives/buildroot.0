From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 11 Feb 2014 18:21:43 +0100
Subject: [Buildroot] [pkg-perl infra V8 2/6] scancpan: a new script
In-Reply-To: <1392139307-29635-1-git-send-email-francois.perrad@gadz.org>
References: <1392139307-29635-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1392139307-29635-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

which creates Perl/CPAN package files

The 2 dependencies will be installed by the Perl infrastructure.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-metacpan-api-tiny.mk                      |   12 +
 .../perl-module-corelist/perl-module-corelist.mk   |   13 ++
 support/scripts/scancpan                           |  229 ++++++++++++++++++++
 3 files changed, 254 insertions(+)
 create mode 100644 package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
 create mode 100644 package/perl-module-corelist/perl-module-corelist.mk
 create mode 100755 support/scripts/scancpan

diff --git a/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk b/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
new file mode 100644
index 0000000..c94835e
--- /dev/null
+++ b/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-metacpan-api-tiny
+#
+################################################################################
+
+PERL_METACPAN_API_TINY_VERSION = 1.131730
+PERL_METACPAN_API_TINY_SOURCE = MetaCPAN-API-Tiny-$(PERL_METACPAN_API_TINY_VERSION).tar.gz
+PERL_METACPAN_API_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NP/NPEREZ/
+PERL_METACPAN_API_TINY_LICENSE = Artistic or GPLv1+
+
+$(eval $(host-perl-package))
diff --git a/package/perl-module-corelist/perl-module-corelist.mk b/package/perl-module-corelist/perl-module-corelist.mk
new file mode 100644
index 0000000..0f979dd
--- /dev/null
+++ b/package/perl-module-corelist/perl-module-corelist.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-module-corelist
+#
+################################################################################
+
+# aligned with Perl 5.18.2
+PERL_MODULE_CORELIST_VERSION = 3.03
+PERL_MODULE_CORELIST_SOURCE = Module-CoreList-$(PERL_MODULE_CORELIST_VERSION).tar.gz
+PERL_MODULE_CORELIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BI/BINGOS/
+PERL_MODULE_CORELIST_LICENSE = Artistic or GPLv1+
+
+$(eval $(host-perl-package))
diff --git a/support/scripts/scancpan b/support/scripts/scancpan
new file mode 100755
index 0000000..acd2bea
--- /dev/null
+++ b/support/scripts/scancpan
@@ -0,0 +1,229 @@
+#!/usr/bin/env perl
+
+use 5.010;
+use strict;
+use warnings;
+use Fatal qw(open close);
+
+use Getopt::Long;
+use Pod::Usage;
+use File::Basename;
+use Module::CoreList;
+use MetaCPAN::API::Tiny;
+
+my ($help, $man, $quiet, $force, $recommend);
+GetOptions( 'help|?' => \$help,
+            'man' => \$man,
+            'quiet|q' => \$quiet,
+            'force|f' => \$force,
+            'recommend' => \$recommend
+) or pod2usage(-exitval => 1);
+pod2usage(-exitval => 0) if $help;
+pod2usage(-exitval => 0, -verbose => 2) if $man;
+pod2usage(-exitval => 1) if scalar @ARGV == 0;
+
+my %dist;
+my %deps_build;
+my %deps_runtime;
+my $mcpan = MetaCPAN::API::Tiny->new();
+
+sub fetch {
+    my $name = shift;
+    unless ($dist{$name}) {
+        say qq{fetch ${name}} unless $quiet;
+        my $result = $mcpan->release( distribution => $name );
+        $dist{$name} = $result;
+        my @deps_build = ();
+        my @deps_runtime = ();
+        my $mb;
+        foreach my $dep (@{$result->{dependency}}) {
+            my $modname = ${$dep}{module};
+            $mb = 1 if $modname eq q{Module::Build};
+            next if $modname eq q{perl};
+            next if $modname =~ m|^Alien|;
+            next if $modname =~ m|^Win32|;
+            next if Module::CoreList::is_core( $modname, undef, q{5.018002} );
+            next if ${$dep}{phase} eq q{develop};
+            next if ${$dep}{phase} eq q{test};
+            next if !$recommend && ${$dep}{relationship} ne q{requires};
+            my $distname = $mcpan->module( $modname )->{distribution};
+            if (${$dep}{phase} eq q{runtime}) {
+                push @deps_runtime, $distname;
+            }
+            else { # configure, build
+                push @deps_build, $distname;
+            }
+            fetch( $distname );
+        }
+        unshift @deps_build, q{Module-Build} if $mb;
+        $deps_build{$name} = \@deps_build;
+        $deps_runtime{$name} = \@deps_runtime;
+    }
+    return;
+}
+
+foreach my $distname (@ARGV) {
+    fetch( $distname );
+}
+say scalar keys %dist, q{ packages fetched.} unless $quiet;
+
+sub fsname {
+    my $name = shift;
+    return q{perl-} . lc $name;
+}
+
+sub brname {
+    my $name = shift;
+    $name =~ s|-|_|g;
+    return uc $name;
+}
+
+while (my ($distname, $dist) = each %dist) {
+    my $fsname = fsname( $distname );
+    my $dirname = q{package/} . $fsname;
+    my $cfgname = $dirname . q{/Config.in};
+    my $mkname = $dirname . q{/} . $fsname . q{.mk};
+    my $brname = brname( $fsname );
+    mkdir $dirname unless -d $dirname;
+    if ($force || !-f $cfgname) {
+        my $abstract = $dist->{abstract};
+        say qq{write ${cfgname}} unless $quiet;
+        open my $fh, q{>}, $cfgname;
+        say {$fh} qq{config BR2_PACKAGE_${brname}};
+        say {$fh} qq{\tbool "${fsname}"};
+        foreach my $dep (@{$deps_runtime{$distname}}) {
+            my $brdep = brname( fsname( $dep ) );
+            say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
+        }
+        say {$fh} qq{\thelp} if $abstract;
+        say {$fh} qq{\t  ${abstract}} if $abstract;
+        say {$fh} qq{};
+        close $fh;
+    }
+    if ($force || !-f $mkname) {
+        my $version = $dist->{version};
+        my $site = dirname( $dist->{download_url} );
+        my($scheme, $auth, $path) = $dist->{download_url} =~ m|(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*)|;
+        my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
+        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } @{$deps_build{$distname}} ),
+                                      map( { fsname( $_ ); } @{$deps_runtime{$distname}} );
+        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } @{$deps_build{$distname}},
+                                                                            @{$deps_runtime{$distname}};
+        my $license = ref $dist->{license} eq 'ARRAY'
+                    ? join q{ or }, @{$dist->{license}}
+                    : $dist->{license};
+        $license = q{Artistic or GPLv1+} if $license eq q{perl_5};
+        say qq{write ${mkname}} unless $quiet;
+        open my $fh, q{>}, $mkname;
+        say {$fh} qq{################################################################################};
+        say {$fh} qq{#};
+        say {$fh} qq{# ${fsname}};
+        say {$fh} qq{#};
+        say {$fh} qq{################################################################################};
+        say {$fh} qq{};
+        say {$fh} qq{${brname}_VERSION = ${version}};
+        say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
+        say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
+        say {$fh} qq{${brname}_DEPENDENCIES = perl ${dependencies}};
+        say {$fh} qq{#HOST_${brname}_DEPENDENCIES = ${host_dependencies}};
+        say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
+        say {$fh} qq{};
+        say {$fh} qq{\$(eval \$(perl-package))};
+        say {$fh} qq{#\$(eval \$(host-perl-package))};
+        close $fh;
+    }
+}
+
+my %pkg;
+my $cfgname = q{package/Config.in};
+if (-f $cfgname) {
+    open my $fh, q{<}, $cfgname;
+    while (<$fh>) {
+        chomp;
+        $pkg{$_} = 1 if m|package/perl-|;
+    }
+    close $fh;
+}
+
+foreach my $distname (sort keys %dist) {
+    my $fsname = fsname( $distname );
+    $pkg{qq{source "package/${fsname}/Config.in"}} = 1;
+}
+
+say qq{${cfgname} must contain the following lines:};
+say join qq{\n}, sort keys %pkg;
+
+__END__
+
+=head1 NAME
+
+support/scripts/scancpan Try-Tiny Moo
+
+=head1 SYNOPSIS
+
+make host-perl-metacpan-api-tiny host-perl-module-corelist # install dependencies
+
+export PERL5LIB=$(HOST_DIR)/usr/lib/perl5 # allows to find dependencies
+supports/scripts/scancpan [options] [distname ...]
+
+ Options:
+   -help
+   -man
+   -quiet
+   -force
+   -recommend
+
+=head1 OPTIONS
+
+=over 8
+
+=item B<-help>
+
+Prints a brief help message and exits.
+
+=item B<-man>
+
+Prints the manual page and exits.
+
+=item B<-quiet>
+
+Executes without output
+
+=item B<-force>
+
+Forces the overwriting of existing files.
+
+=item B<-recommend>
+
+Adds I<recommended> dependencies.
+
+=back
+
+=head1 DESCRIPTION
+
+This script creates the Buildroot package files for all Perl/CPAN
+distributions required by all specified distnames. These data are
+fetched from https://metacpan.org/.
+
+See the Buildroot documentation for details on the usage of the Perl
+infrastructure.
+
+=head1 LICENSE
+
+Copyright (C) 2013-2014 by Francois Perrad <francois.perrad@gadz.org>
+
+This program is free software; you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation; either version 2 of the License, or
+(at your option) any later version.
+
+This program is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+General Public License for more details.
+
+You should have received a copy of the GNU General Public License
+along with this program; if not, write to the Free Software
+Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+
+=cut
-- 
1.7.9.5
