From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Feb 2014 22:30:53 +0100
Subject: [Buildroot] [V10 6/6] scancpan: a new script
In-Reply-To: <1392310269-21027-7-git-send-email-francois.perrad@gadz.org>
References: <1392310269-21027-1-git-send-email-francois.perrad@gadz.org>
 <1392310269-21027-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <5306740D.7030005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/14 17:51, Francois Perrad wrote:
> which creates Perl/CPAN package files
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

 Looks good to me. I haven't tested it this time, but I assume that you have.

 I have a few small suggestions for improvements still, but for me it's
OK to go in, so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> ---
>  support/scripts/scancpan |  732 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 732 insertions(+)
>  create mode 100755 support/scripts/scancpan
> 
> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
> new file mode 100755
> index 0000000..28c8f5b
> --- /dev/null
> +++ b/support/scripts/scancpan
[snip]
> +my %dist;
> +my %need_target;
> +my %need_host;
> +my %deps_build;
> +my %deps_runtime;

 Even though I find the code quite readable and easy to follow
(especially for a perl script and given that I don't actually know perl),
I think it would help if the contents of these variables would be
explained. E.g.:

my %dist;         # name -> metacpan data
my %need_target;  # name -> 1 if target package is needed
my %need_host;    # name -> 1 if host package is needed
my %deps_build;   # name -> list of host dependencies
my %deps_runtime; # name -> list of target dependencies

> +my $mcpan = MetaCPAN::API::Tiny->new();
> +
> +sub fetch {
> +    my ($name, $need_target, $need_host) = @_;
> +    $need_target{$name} = $need_target if $need_target;
> +    $need_host{$name} = $need_host if $need_host;
> +    unless ($dist{$name}) {
> +        say qq{fetch ${name}} unless $quiet;
> +        my $result = $mcpan->release( distribution => $name );
> +        $dist{$name} = $result;
> +        my @deps_build = ();
> +        my @deps_runtime = ();
> +        my $mb;
> +        foreach my $dep (@{$result->{dependency}}) {
> +            my $modname = ${$dep}{module};
> +            $mb = 1 if $modname eq q{Module::Build};

 I don't understand this one: why is Module-Build treated specially? Ah,
now I know: because we need the most recent one, even if Module::Build is
in CoreList. Can you add a comment for that?

> +            next if $modname eq q{perl};
> +            next if $modname =~ m|^Alien|;
> +            next if $modname =~ m|^Win32|;
> +            next if Module::CoreList::first_release( $modname );

 Also here, add a comment that since this script has 'use 5.018;' which
is equal to the target-perl, we can skip modules that are core in this
release.

> +            next if ${$dep}{phase} eq q{develop};
> +            next if ${$dep}{phase} eq q{test};
> +            next if !$recommend && ${$dep}{relationship} ne q{requires};
> +            my $distname = $mcpan->module( $modname )->{distribution};
> +            if (${$dep}{phase} eq q{runtime}) {
> +                push @deps_runtime, $distname;
> +            }
> +            else { # configure, build
> +                push @deps_build, $distname;
> +            }
> +        }
> +        unshift @deps_build, q{Module-Build} if $mb;
> +        $deps_build{$name} = \@deps_build;
> +        $deps_runtime{$name} = \@deps_runtime;
> +    }
> +    foreach my $distname (@{$deps_build{$name}}) {
> +        fetch( $distname, 0, 1 );
> +    }
> +    foreach my $distname (@{$deps_runtime{$name}}) {
> +        fetch( $distname, $need_target, $need_host );
> +    }
> +    return;
> +}
> +
> +foreach my $distname (@ARGV) {

    # Command-line's distributions are needed for target, not host
> +    fetch( $distname, 1, 0 );
> +}
> +say scalar keys %dist, q{ packages fetched.} unless $quiet;
> +

# Buildroot package name: lowercase
> +sub fsname {
> +    my $name = shift;
> +    return q{perl-} . lc $name;
> +}
> +

# Buildroot variable name: uppercase
> +sub brname {
> +    my $name = shift;
> +    $name =~ s|-|_|g;
> +    return uc $name;
> +}
> +
> +while (my ($distname, $dist) = each %dist) {
> +    my $fsname = fsname( $distname );
> +    my $dirname = q{package/} . $fsname;
> +    my $cfgname = $dirname . q{/Config.in};
> +    my $mkname = $dirname . q{/} . $fsname . q{.mk};
> +    my $brname = brname( $fsname );
> +    mkdir $dirname unless -d $dirname;
> +    if ($need_target{$distname} && ($force || !-f $cfgname)) {
> +        my $abstract = $dist->{abstract};
> +        say qq{write ${cfgname}} unless $quiet;
> +        open my $fh, q{>}, $cfgname;
> +        say {$fh} qq{config BR2_PACKAGE_${brname}};
> +        say {$fh} qq{\tbool "${fsname}"};
> +        foreach my $dep (@{$deps_runtime{$distname}}) {
> +            my $brdep = brname( fsname( $dep ) );
> +            say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
> +        }
> +        say {$fh} qq{\thelp} if $abstract;
> +        say {$fh} qq{\t  ${abstract}} if $abstract;
> +        close $fh;
> +    }
> +    if ($force || !-f $mkname) {
> +        my $version = $dist->{version};
> +        my $site = dirname( $dist->{download_url} );
> +        my($scheme, $auth, $path) = $dist->{download_url} =~ m|(?:([^:/?#]+):)?(?://([^/?#]*))?([^?#]*)|;

 This regexp cuts off any #-anchor or ?-arguments. This is OK because
buildroot doesn't support that kind of stuff anyway, but it would be good
to add a comment to make that explicit.

> +        my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
> +        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } @{$deps_build{$distname}} ),
> +                                      map( { fsname( $_ ); } @{$deps_runtime{$distname}} );
> +        my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } @{$deps_build{$distname}},
> +                                                                            @{$deps_runtime{$distname}};
> +        my $license = ref $dist->{license} eq 'ARRAY'
> +                    ? join q{ or }, @{$dist->{license}}
> +                    : $dist->{license};
> +        $license = q{Artistic or GPLv1+} if $license eq q{perl_5};
> +        say qq{write ${mkname}} unless $quiet;
> +        open my $fh, q{>}, $mkname;
> +        say {$fh} qq{################################################################################};
> +        say {$fh} qq{#};
> +        say {$fh} qq{# ${fsname}};
> +        say {$fh} qq{#};
> +        say {$fh} qq{################################################################################};
> +        say {$fh} qq{};
> +        say {$fh} qq{${brname}_VERSION = ${version}};
> +        say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};

 Maybe there should be a check that ${filename} is
${distname}-${version}, otherwise the above is incorrect.


 Regards,
 Arnout

> +        say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
> +        say {$fh} qq{${brname}_DEPENDENCIES = perl ${dependencies}} if $need_target{$distname};
> +        say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
> +        say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
> +        say {$fh} qq{};
> +        say {$fh} qq{\$(eval \$(perl-package))} if $need_target{$distname};
> +        say {$fh} qq{\$(eval \$(host-perl-package))} if $need_host{$distname};
> +        close $fh;
> +    }
> +}
> +
> +my %pkg;
> +my $cfgname = q{package/Config.in};
> +if (-f $cfgname) {
> +    open my $fh, q{<}, $cfgname;
> +    while (<$fh>) {
> +        chomp;
> +        $pkg{$_} = 1 if m|package/perl-|;
> +    }
> +    close $fh;
> +}
> +
> +foreach my $distname (keys %need_target) {
> +    my $fsname = fsname( $distname );
> +    $pkg{qq{source "package/${fsname}/Config.in"}} = 1;
> +}
> +
> +say qq{${cfgname} must contain the following lines:};
> +say join qq{\n}, sort keys %pkg;
> +
> +__END__

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
