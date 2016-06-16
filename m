From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jun 2016 22:08:27 +0200
Subject: [Buildroot] [V3] scancpan: improve message when bad host perl
 version
In-Reply-To: <1466094384-24610-1-git-send-email-francois.perrad@gadz.org>
References: <1466094384-24610-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160616200827.GG3665@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

Thank you for this proposal! :-)

On 2016-06-16 18:26 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  support/scripts/scancpan | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
> index 6c70cfb..617ee71 100755
> --- a/support/scripts/scancpan
> +++ b/support/scripts/scancpan
> @@ -471,7 +471,7 @@ unshift @INC, sub {
>  } # END OF FATPACK CODE
>  
>  
> -use 5.022;      # same major version as target perl
> +use 5.010;

So, we now require perl >= 5.10 to run this script, right? (well, to at
least get the error message sanely!)

How old is this?
Can we be sure that viurtually everyone has a perl >= 5.010?

Can't we just drop the requirement?

Care to expand the commit log to explain this, please?

>  use strict;
>  use warnings;
>  use Fatal qw(open close);
> @@ -484,6 +484,17 @@ use HTTP::Tiny;
>  use Safe;
>  use MetaCPAN::API::Tiny;
>  

Maybe add a comment here:

   # PERL_VERSION #
   # Below, 5.022 should be aligned with the version of
   # perl actually bundled in Buildroot:
> +die <<"MSG" if $] < 5.022;
> +This script needs a host perl with the same major version as Buildroot target perl.
> +
> +Your current host perl is:
> +    $^X
> +    version $]
> +
> +You may install a local one by running:
> +    perlbrew install perl-5.22.2
> +MSG

Maybe you should also add a comment in package/perl/perl.mk, just above
the version string:

    # When updating the version here, also update
    # support/scripts/scancpan (search for "PERL_VERSION")
    PERL_VERSION_MAJOR = 22
    PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2

This will make it more difficult to get out of sync between the two. ;-)

Regards,
Yann E. MORIN.

>  my ($help, $man, $quiet, $force, $recommend, $test, $host);
>  my $target = 1;
>  GetOptions( 'help|?' => \$help,
> @@ -746,10 +757,6 @@ support/scripts/scancpan Try-Tiny Moo
>  
>  =head1 SYNOPSIS
>  
> -curl -kL http://install.perlbrew.pl | bash
> -
> -perlbrew install perl-5.18.2
> -
>  supports/scripts/scancpan [options] [distname ...]
>  
>   Options:
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
