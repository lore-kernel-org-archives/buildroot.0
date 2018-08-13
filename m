From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 13 Aug 2018 18:29:21 +0200
Subject: [Buildroot] [RFC PATCH 2/2] scancpan: wrap abstract if too long
In-Reply-To: <20180813131135.32651-3-chrismcc@gmail.com>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-3-chrismcc@gmail.com>
Message-ID: <CAB0FRssNmZLLzQyVn9LXdoineANjPC1zXaOJSXoteCrAMqW5yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-13 15:11 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  utils/scancpan | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/utils/scancpan b/utils/scancpan
> index 2070e2a233..f8411079e1 100755
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -484,6 +484,8 @@ use HTTP::Tiny;
>  use Safe;
>  use MetaCPAN::API::Tiny;
>  use Digest::SHA qw(sha256_hex);
> +use Text::Wrap;
>

Ok, Text::Wrap is a core module, so the script scancpan stays self-depend.

>
> +$Text::Wrap::columns = 70;
>
>  # Below, 5.026 should be aligned with the version of perl actually
>  # bundled in Buildroot:
> @@ -655,7 +657,7 @@ while (my ($distname, $dist) = each %dist) {
>      my $brname = brname( $fsname );
>      mkdir $dirname unless -d $dirname;
>      if ($need_target{$distname} && ($force || !-f $cfgname)) {
> -        my $abstract = $dist->{abstract};
> +        my $abstract = wrap("","\t  ",$dist->{abstract});
>

In this script, I don't use quote but q{} and qq{}.
And I put one space after comma.

Fran?ois


>          my $homepage = $dist->{resources}->{homepage} || qq{
> https://metacpan.org/release/${distname}};
>          say qq{write ${cfgname}} unless $quiet;
>          open my $fh, q{>}, $cfgname;
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180813/7dfe8759/attachment.html>
