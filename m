From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Feb 2014 18:49:00 +0100
Subject: [Buildroot] [pkg-perl infra V7 2/6] scancpan: a new script
In-Reply-To: <1392116205-12810-3-git-send-email-francois.perrad@gadz.org>
References: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
 <1392116205-12810-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FA628C.8030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 11:56, Francois Perrad wrote:
> which creates Perl/CPAN package files
> 
> The 2 dependencies will be installed by the Perl infrastructure.
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .../perl-metacpan-api-tiny.mk                      |   12 +
>  .../perl-module-corelist/perl-module-corelist.mk   |   13 ++
>  support/scripts/scancpan                           |  229 ++++++++++++++++++++
>  3 files changed, 254 insertions(+)
>  create mode 100644 package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
>  create mode 100644 package/perl-module-corelist/perl-module-corelist.mk
>  create mode 100755 support/scripts/scancpan
> 
> diff --git a/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk b/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
> new file mode 100644
> index 0000000..c94835e
> --- /dev/null
> +++ b/package/perl-metacpan-api-tiny/perl-metacpan-api-tiny.mk
> @@ -0,0 +1,12 @@
> +################################################################################
> +#
> +# perl-metacpan-api-tiny
> +#
> +################################################################################
> +
> +PERL_METACPAN_API_TINY_VERSION = 1.131730
> +PERL_METACPAN_API_TINY_SOURCE = MetaCPAN-API-Tiny-$(PERL_METACPAN_API_TINY_VERSION).tar.gz
> +PERL_METACPAN_API_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NP/NPEREZ/
> +PERL_METACPAN_API_TINY_LICENSE = Artistic or GPLv1+
> +
> +$(eval $(host-perl-package))

 Wow, that's not what I meant when I said it was a pity that the metacpan
source was in the same file... This way, it is very difficult to run the
scancpan script because you first have to explicitly build this
host-package, and then you have to run scancpan with the PERL5LIB
pointing to the host dir.

 So please revert to the fatpacked version.


[snip]
> +sub fetch {
> +    my $name = shift;
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
> +            next if $modname eq q{perl};
> +            next if $modname =~ m|^Alien|;
> +            next if $modname =~ m|^Win32|;
> +            next if Module::CoreList::is_core( $modname, undef, q{5.018002} );

 This is good for the target packages, but for host packages the problem
still remains: if the host perl is older than this, some of the modules
we depend on may not exist on the host.

 That's why I propose to:

- add a check for a minimum perl version in dependencies.sh;

- in scancpan, make a distinction between host and target packages to be
generated, and generate the host packages if it is not core in the older
perl version.

 However, scancpan is already useful as it is, so I think it can be
committed as is (with the fatpacking and Thomas's typo corrections) and
this host support can be added later.

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
> +            fetch( $distname );
> +        }
> +        unshift @deps_build, q{Module-Build} if $mb;
> +        $deps_build{$name} = \@deps_build;
> +        $deps_runtime{$name} = \@deps_runtime;
> +    }
> +    return;
> +}
[snip]
> +=head1 LICENSE
> +
> +Copyright (C) 2013-2014 by Francois Perrad <francois.perrad@gadz.org>
> +
> +This program is free software; you can redistribute it and/or modify
> +it under the terms of the GNU General Public License as published by
> +the Free Software Foundation; either version 2 of the License, or
> +(at your option) any later version.
> +
> +This program is distributed in the hope that it will be useful,
> +but WITHOUT ANY WARRANTY; without even the implied warranty of
> +MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +General Public License for more details.
> +
> +You should have received a copy of the GNU General Public License
> +along with this program; if not, write to the Free Software
> +Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

 When fatpacking, the fatpacked licenses should be mentioned again of course.

 Regards,
 Arnout

> +
> +=cut
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
