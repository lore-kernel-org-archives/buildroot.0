From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Apr 2019 11:24:56 +0200
Subject: [Buildroot] [PATCH v2] Restrict tar transform to regular files
 Without this
In-Reply-To: <1249281217.2131518.1556354602146.JavaMail.zimbra@raptorengineeringinc.com>
References: <1249281217.2131518.1556354602146.JavaMail.zimbra@raptorengineeringinc.com>
Message-ID: <20190427092456.GF30214@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Timothy, All,

On 2019-04-27 03:43 -0500, Timothy Pearson spake thusly:
> restriction, symlinks are rewritten and corrupted.

Your commit message is still incorrectly formatted. It should be:

    support/download/git: don't ttransform target of symlinks

    Currently, the git download backend mangles the path of members, as
    well as the target of symlinks, for example:
        package-githash/link -> ./file1
    is transformed into:
        package-githash/link -> package-githash/file1

    Fix that by using so-called "transformation scope flags" to tell tar
    to not transform the target of symlinks.

    Signed-off-by: Your Name <your@mail>
    Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

Usually, I like to be Cc-ed on resend when I reviewed previous
iteatrions. Additionally, since this would be a v2 (and the next one
a v3), you'd put a changleog below the --- line, like so:

    ---
    Changes v2 -> v3:
      - fix ommit log and title  (Yann)
      - use flags at the end of expression rather than changing the
        defaults  (Yann)

    Changes v1 -> v2:
      - add missing SoB line  (Yann)


(The name between parenthesis is to identiofy who requested the change,
in case further reviewers wonder why it's done the way you di, and so
they can blame me not you. ;-) )

> Example without the restriction:
> 
> Input tree (valid):
> package-githash/file1
> package-githash/link -> ./file1
> 
> Output tree (broken):
> package-githash/file1
> package-githash/link -> package-githash/file1
> 
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 17ca04eb98..1acb795c81 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -190,7 +190,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
>  
>  # Create GNU-format tarballs, since that's the format of the tarballs on
>  # sources.buildroot.org and used in the *.hash files
> -tar cf - --transform="s#^\./#${basename}/#" \
> +tar cf - --transform="flags=r;s#^\./#${basename}/#" \

Since you did not apply my suggestion, I take it that it did not work?
If so, they they so in the post --- line.

By the way, we might need to do something similar for the SDK:

    https://git.buildroot.org/buildroot/tree/Makefile#n610

Care to handle it as well? (if so, in a separate patch, please.)

Regards,
Yann E. MORIN.

>           --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
>           -T "${output}.list.sorted" >"${output}.tar"
>  gzip -6 -n <"${output}.tar" >"${output}"
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
