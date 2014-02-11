From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 11 Feb 2014 12:56:43 +0100
Subject: [Buildroot] [pkg-perl infra V7 2/6] scancpan: a new script
In-Reply-To: <1392116205-12810-3-git-send-email-francois.perrad@gadz.org>
References: <1392116205-12810-1-git-send-email-francois.perrad@gadz.org>
 <1392116205-12810-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LXvBESQ8-50Wi2o_xcn712SZQUGvhyakq7ukYHJVuYAgA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Feb 11, 2014 at 11:56 AM, Francois Perrad <fperrad@gmail.com> wrote:
> which creates Perl/CPAN package files
>
> The 2 dependencies will be installed by the Perl infrastructure.
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
[..]
> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
> new file mode 100755
> index 0000000..63a8885
> --- /dev/null
> +++ b/support/scripts/scancpan
[..]
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
> +foreach my $distname (sort keys %dist) {
> +    my $fsname = fsname( $distname );
> +    $pkg{qq{source "package/${fsname}/Config.in"}} = 1;
> +}
> +
> +say qq{${cfgname} must contains the following lines:};

must contain

> +say join qq{\n}, sort keys %pkg;
> +
> +__END__
> +
> +=head1 NAME
> +
> +support/scripts/scancpan Try-Tiny Moo
> +
> +=head1 SYNOPSIS
> +
> +make host-perl-metacpan-api-tiny host-perl-module-corelist # install dependencies
> +
> +export PERL5LIB=$(HOST_DIR)/usr/lib/perl5 # allows to find dependencies
> +supports/scripts/scancpan [options] [distname ...]
> +
> + Options:
> +   -help
> +   -man
> +   -quiet
> +   -force
> +   -recommend
> +
> +=head1 OPTIONS
> +
> +=over 8
> +
> +=item B<-help>
> +
> +Print a brief help message and exits.

Prints

> +
> +=item B<-man>
> +
> +Prints the manual page and exits.
> +
> +=item B<-quiet>
> +
> +Executes without output
> +
> +=item B<-force>
> +
> +Forces the overwritting of existing files.

overwriting

> +
> +=item B<-recommend>
> +
> +Adds I<recommended> dependencies.
> +
> +=back
> +
> +=head1 DESCRIPTION
> +
> +This script creates the BR package files for all Perl/CPAN

I would write 'buildroot' instead of BR

> +distributions required by all distname. These data are fetched from

To me this sentence sounds odd: "This script creates the buildroot
package files for all Perl/CPAN distributions required by all
distname." The 'distname' is the package(s) that the user supplies as
argument to the script. But what are these 'distributions' you
mention?
Also, 'by all distname' should either be 'by all distnames' but maybe
better: 'by all specified packages'.

Best regards,
Thomas
