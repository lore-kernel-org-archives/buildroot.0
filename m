From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Mar 2021 18:24:00 +0100
Subject: [Buildroot] [PATCH 1/1] support/download: Fix tarball
 generation - master branch patch
In-Reply-To: <20210318072817.403558-1-jpcartal@free.fr>
References: <20210318072817.403558-1-jpcartal@free.fr>
Message-ID: <20210320172400.GT3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Pierre, All,

On 2021-03-18 08:28 +0100, Jean-pierre Cartal spake thusly:
> fix tarball generation with symlinks pointing to ./something
> 
>     When a --transform expression is provided, it is by default also applied
>     to the target of a symlink.
> 
>     When we create tarballs (from git or svn checkouts), we use a --transform
>     expression to replace the leading ./ with the package name and version.
> 
>     This causes issues when a package contains symlinks that points to
>     ./something, as the leading './' is also replaced.
> 
>     Fix that by using the 'S' transformation scope flag, as described in the
>     tar manual:
>         https://www.gnu.org/software/tar/manual/html_node/transform.html#transform
> 
>         In addition, several transformation scope flags are supported, that
>         control to what files transformations apply. These are:
> 
>         ?r? Apply transformation to regular archive members.
>         ?R? Do not apply transformation to regular archive members.
>         ?s? Apply transformation to symbolic link targets.
>         ?S? Do not apply transformation to symbolic link targets.
>         ?h? Apply transformation to hard link targets.
>         ?H? Do not apply transformation to hard link targets.
> 
>         Default is ?rsh? [...].
> 
>     Fixes: #13616

The commit log was needlessly indented, so I've redeuced the
indentation. I also added a scriptlet to test existing hashes have not
been impacted.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
> ---
>  support/download/helpers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/helpers b/support/download/helpers
> index 57cc9fef44..40d5eea591 100755
> --- a/support/download/helpers
> +++ b/support/download/helpers
> @@ -59,7 +59,7 @@ mk_tar_gz() {
>      LC_ALL=C sort <"${tmp}.list" >"${tmp}.sorted"
>  
>      # Create POSIX tarballs, since that's the format the most reproducible
> -    tar cf - --transform="s#^\./#${base_dir}/#" \
> +    tar cf - --transform="s#^\./#${base_dir}/#S" \
>               --numeric-owner --owner=0 --group=0 --mtime="${date}" \
>               --format=posix --pax-option="${pax_options}" \
>               -T "${tmp}.sorted" >"${tmp}.tar"
> -- 
> 2.30.2
> 
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
