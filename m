From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 13:05:26 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/apply-patches.sh:
 handle tar and mkdir failures
In-Reply-To: <1464178439-3333-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1464178439-3333-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <a6707437-fd76-c538-3e21-eceaff76976e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

Le 25/05/2016 ? 14:13, S?bastien Szymanski a ?crit :
> With several archives in a space-separated list of patches, if one archive
> cannot be untar (i.e because it is not readable), Buildroot keeps going instead
> of aborting. Fix this by checking the tar return code.
> While at it, check if the unpack archive directory creation is successful.

As discussed with other Buildroot developers, we prefer to use "set -e" in
apply-patches.sh

See:
http://patchwork.ozlabs.org/patch/644705

I'll mark you patch rejected in patchwork.

Thanks!

Best regards,
Romain


> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  support/scripts/apply-patches.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 201278d..b0a8ad4 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -132,7 +132,11 @@ function scan_patchdir {
>                  unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
>                  rm -rf "$unpackedarchivedir" 2> /dev/null
>                  mkdir "$unpackedarchivedir"
> -                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
> +                if [ $? != 0 ] ; then
> +                    echo "Error: cannot create $unpackedarchivedir directory."
> +                    exit 1
> +                fi
> +                tar -C "$unpackedarchivedir" -xaf "${path}/$i" || exit 1
>                  scan_patchdir "$unpackedarchivedir"
>              else
>                  apply_patch "$path" "$i"
> 
