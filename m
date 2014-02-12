From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 18:29:04 +0100
Subject: [Buildroot] [pkg-perl infra V9 2/6] scancpan: a new script
In-Reply-To: <1392192871-426-3-git-send-email-francois.perrad@gadz.org>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
 <1392192871-426-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <52FBAF60.20604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Francois,

 Sorry to keep on iterating on this...

On 12/02/14 09:14, Francois Perrad wrote:
> which creates Perl/CPAN package files
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
[snip]
> +
> +
> +use 5.018;      # same major version as target perl

 I'm not really a perl expert, but doesn't this mean that the script will
not run if your system's perl is older than 5.018? That probably excludes
most LTS distros... Not that I have a big issue with that because not
many users will actually run this script. And if you have only tested it
with 5.018 (like I did), then it's probably best to keep it at that version.

 I am certain that this clause does not solve the issue I tried to point
out in my previous review. We want the generated packages to include all
the host-packages that are needed for building on a system that can use
buildroot.

 Bottom line: what I'm saying here is for follow-up patches, it is OK to
go in as is. Except for the next remark:


[snip]
> +    if ($force || !-f $cfgname) {
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
> +        say {$fh} qq{};

 Doesn't this create a spurious empty line at the end of the file? Or is
it needed to add a newline after the abstract?


[snip]
> +=head1 NAME
> +
> +support/scripts/scancpan Try-Tiny Moo
> +
> +=head1 SYNOPSIS
> +
> +curl -kL http://install.perlbrew.pl | bash
> +
> +perlbrew install perl-5.18.2

 This is not correct I think...

> +
> +supports/scripts/scancpan [options] [distname ...]
> +
> + Options:
> +   -help
> +   -man
> +   -quiet
> +   -force
> +   -recommend
> +
[snip]
> +=head1 DESCRIPTION
> +
> +This script creates the Buildroot package files for all Perl/CPAN
> +distributions required by all specified distnames. These data are
> +fetched from https://metacpan.org/.

 Hm, not very clear I think. How about:

---
This script creates templates of the Buildroot package files for all the
Perl/CPAN distributions required by the specified distnames. The
dependencies and metadata are fetched from https://metacpan.org/.

After running this script, it is necessary to check the generated files.
You have to manually enable the host- version if you need it. You have to
manually add the license files (FOO_LICENSE_FILES variable). For
distributions that link against a target library, you have to add the
buildroot package name for that library to the DEPENDENCIES variable.
---

> +
> +See the Buildroot documentation for details on the usage of the Perl
> +infrastructure.
> +
> +The major version of the host perl must be aligned on the target one,
> +in order to work with the right CoreList data.

 Right! I didn't think of that.

 So to overcome the 'use 5.018;' limitation, we should fatpack in the
CoreList module. However, it's 467K so maybe it should be downloaded
instead...

 Anyway, for sure this issue is for a follow-up patch.


 Regards,
 Arnout


> +
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
> +
> +This script is a part of Buildroot.
> +
> +This script requires the module C<MetaCPAN::API::Tiny> (version 1.131730)
> +which was included at the beginning of this file by the tool C<fatpack>.
> +
> +See L<http://search.cpan.org/~nperez/MetaCPAN-API-Tiny-1.131730/>.
> +
> +See L<http://search.cpan.org/search?query=App-FatPacker&mode=dist>.
> +
> +These both libraries are free software and may be distributed under the same
> +terms as perl itself.
> +
> +And perl may be distributed under the terms of Artistic v1 or GPL v1 license.
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
