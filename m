From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Jun 2016 23:05:00 +0200
Subject: [Buildroot] [V2] scancpan: improve message when bad host perl
 version
In-Reply-To: <1466010670-22639-1-git-send-email-francois.perrad@gadz.org>
References: <1466010670-22639-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160615230500.3e3b1aae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Jun 2016 19:11:10 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for this new version. As usual, non-trivial patches should have
a non-empty commit log. But see some comments below.

> +die <<"MSG" if $] < 5.022;
> +This script needs a host perl with the same major version as Buildroot target perl.
> +
> +Your current host perl is:
> +    $^X
> +    version $]
> +
> +You may install a local one by running:
> +    perlbrew install perl-5.22.2

So here's you're explaining how to install perl-5.22 using perlbrew,
only when the host perl version is not sufficient. This looks good.

> +MSG
> +
>  my ($help, $man, $quiet, $force, $recommend, $test, $host);
>  my $target = 1;
>  GetOptions( 'help|?' => \$help,
> @@ -748,7 +759,7 @@ support/scripts/scancpan Try-Tiny Moo
>  
>  curl -kL http://install.perlbrew.pl | bash
>  
> -perlbrew install perl-5.18.2
> +perlbrew install perl-5.22.2

However, I don't understand why the help text has this information at
the beginning of it. It should IMO only be displayed when the host perl
version doesn't match the target perl version. I'm running a system
with host perl 5.22, and the help text of scancpan is somewhat
confusing. Why is it talking to be about using curl and perlbrew in the
"Usage:" section ?

Could you fix this and send an updated version? Thanks!

thomas at skate:~/projets/buildroot (master)$ ./support/scripts/scancpan 
Usage:
    curl -kL http://install.perlbrew.pl | bash

    perlbrew install perl-5.22.2

    supports/scripts/scancpan [options] [distname ...]

     Options:
       -help
       -man
       -quiet
       -force
       -target/-notarget
       -host/-nohost
       -recommend
       -test

Options:
    -help   Prints a brief help message and exits.

    -man    Prints the manual page and exits.

    -quiet  Executes without output

    -force  Forces the overwriting of existing files.

    -target/-notarget
            Switches package generation for the target variant (the default
            is "-target").

    -host/-nohost
            Switches package generation for the host variant (the default is
            "-nohost").

    -recommend
            Adds *recommended* dependencies.

    -test   Adds dependencies for test.



Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
