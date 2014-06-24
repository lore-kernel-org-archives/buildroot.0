From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Jun 2014 07:21:13 +0200
Subject: [Buildroot] [PATCH 1/3] support/script/cpan: improve Makefile
 generation
In-Reply-To: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
References: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <53A90AC9.5060403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 20:14, Francois Perrad wrote:
> - remove trailing space after perl when it's the only dependency
> - license: substitution of perl name by BR name
> - add a tabulation before source
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  support/scripts/scancpan | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
> index 4be4754..348b7cc 100755
> --- a/support/scripts/scancpan
> +++ b/support/scripts/scancpan
> @@ -598,14 +598,17 @@ while (my ($distname, $dist) = each %dist) {
>          # the scheme is not used, because the job is done by the BR download infrastructure
>          # the auth part is not used, because we use $(BR2_CPAN_MIRROR)
>          my($filename, $directories, $suffix) = fileparse( $path, q{tar.gz}, q{tgz} );
> -        my $dependencies = join q{ }, map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
> +        my $dependencies = join q{ }, qw( perl ),
> +                                      map( { q{host-} . fsname( $_ ); } sort @{$deps_build{$distname}} ),
>                                        map( { fsname( $_ ); } sort @{$deps_runtime{$distname}} );
>          my $host_dependencies = join q{ }, map { q{host-} . fsname( $_ ); } sort( @{$deps_build{$distname}},
>                                                                                    @{$deps_runtime{$distname}} );
>          my $license = ref $dist->{license} eq 'ARRAY'
>                      ? join q{ or }, @{$dist->{license}}
>                      : $dist->{license};
> -        $license = q{Artistic or GPLv1+} if $license eq q{perl_5};
> +        $license =~ s|artistic_2|Artistic-2.0|;
> +        $license =~ s|openssl|OpenSSL|;
> +        $license =~ s|perl_5|Artistic or GPLv1+|;
>          say qq{write ${mkname}} unless $quiet;
>          open my $fh, q{>}, $mkname;
>          say {$fh} qq{################################################################################};
> @@ -617,7 +620,7 @@ while (my ($distname, $dist) = each %dist) {
>          say {$fh} qq{${brname}_VERSION = ${version}};
>          say {$fh} qq{${brname}_SOURCE = ${distname}-\$(${brname}_VERSION).${suffix}};
>          say {$fh} qq{${brname}_SITE = \$(BR2_CPAN_MIRROR)${directories}};
> -        say {$fh} qq{${brname}_DEPENDENCIES = perl ${dependencies}} if $need_target{$distname};
> +        say {$fh} qq{${brname}_DEPENDENCIES = ${dependencies}} if $need_target{$distname};
>          say {$fh} qq{HOST_${brname}_DEPENDENCIES = ${host_dependencies}} if $need_host{$distname};
>          say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
>          say {$fh} qq{};
> @@ -640,7 +643,7 @@ if (-f $cfgname) {
>  
>  foreach my $distname (keys %need_target) {
>      my $fsname = fsname( $distname );
> -    $pkg{qq{source "package/${fsname}/Config.in"}} = 1;
> +    $pkg{qq{\tsource "package/${fsname}/Config.in"}} = 1;
>  }
>  
>  say qq{${cfgname} must contain the following lines:};
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
