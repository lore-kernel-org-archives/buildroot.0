From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 16 Aug 2018 00:07:10 -0300
Subject: [Buildroot] [RFC PATCH 2/2] scancpan: wrap abstract if too long
References: <20180813131135.32651-3-chrismcc@gmail.com>
Message-ID: <5b74ea5e337d2_1cc13fb728614f8034368@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Aug 13, 2018 at 10:11 AM, Christopher McCrory wrote:

> +++ b/utils/scancpan
> @@ -484,6 +484,8 @@ use HTTP::Tiny;
>  use Safe;
>  use MetaCPAN::API::Tiny;
>  use Digest::SHA qw(sha256_hex);
> +use Text::Wrap;
> +$Text::Wrap::columns = 70;

Please use 62 instead of 70 here ...

>  
>  # Below, 5.026 should be aligned with the version of perl actually
>  # bundled in Buildroot:
> @@ -655,7 +657,7 @@ while (my ($distname, $dist) = each %dist) {
>      my $brname = brname( $fsname );
>      mkdir $dirname unless -d $dirname;
>      if ($need_target{$distname} && ($force || !-f $cfgname)) {
> -        my $abstract = $dist->{abstract};
> +        my $abstract = wrap("","\t  ",$dist->{abstract});

... so the help text generated here always fits in:
<tab><2 spaces><62 chars>
"tab counts for 8" as described in:
http://nightly.buildroot.org/#writing-rules-config-in

>          my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
>          say qq{write ${cfgname}} unless $quiet;
>          open my $fh, q{>}, $cfgname;
> -- 

Regards,
Ricardo
