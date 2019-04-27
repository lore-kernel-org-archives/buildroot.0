From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Apr 2019 10:25:58 +0200
Subject: [Buildroot] [PATCH] Restrict tar transform to regular files
 Without this
In-Reply-To: <1939146889.2013926.1556297354423.JavaMail.zimbra@raptorengineeringinc.com>
References: <1939146889.2013926.1556297354423.JavaMail.zimbra@raptorengineeringinc.com>
Message-ID: <20190427082558.GD30214@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Timothy, All,

On 2019-04-26 11:49 -0500, Timothy Pearson spake thusly:
>  restriction, symlinks are rewritten and corrupted.

Something is amiss in your commit log. It shoul;d be:

    titile on a single line

    Some text on
    multiple lines.

    Signed-off-by: Your NAME <your@email>

> Example without the restriction:
> 
> Input tree (valid):
> package-githash/file1
> package-githash/link -> ./file1
> 
> Output tree (broken):
> package-githash/file1
> package-githash/link -> package-githash/file1
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

OK, so this is a nice trick and all, but I can't find any reference to
it in the man page. But I see it's in the git tree in doc/tar.texi...

Your proposal would exclude hardlinks too, which is not correct I think.
In fact, we would need to use 'S' (upper-case 'S') here, because we want
it to apply to anything but symlinks.

Also, the texi file states that "Default scope flags can also be changed
using flags= statement in the transform expression." However, they are
standard flags too, quoting:

    Supported flags are:
        g [...]
        i [...]
        x [...]
        <number> [...]

    [...]

    In addition, several transformation scope flags are supported, that
    control to what files transformations apply.  These are:
        r   Apply transformation to regular archive members.
        R   Do not apply transformation to regular archive members.
        s   Apply transformation to symbolic link targets.
        S   Do not apply transformation to symbolic link targets.
        h   Apply transformation to hard link targets.
        H   Do not apply transformation to hard link targets.

So I think we could simply write:

    --transform="s#^\./#${basename}/#S'

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
