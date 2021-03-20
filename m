From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Mar 2021 18:51:06 +0100
Subject: [Buildroot] [PATCH 1/1] support/download: Fix tarball
 generation - 2020.02.x branch patch
In-Reply-To: <20210318073240.404490-1-jpcartal@free.fr>
References: <20210318073240.404490-1-jpcartal@free.fr>
Message-ID: <20210320175106.GU3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

You will want to get that one for 2021.02, and also 2020.11 and 2020.02
if they are a still alive.

You may want to complement the commit log with the scriptlet I added in
c9f27fdc1b (and adding opkg-utils to the list of host-only packages):
I've tested locally that our current hashes are still valid.

Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

On 2021-03-18 08:32 +0100, Jean-pierre Cartal spake thusly:
> fix tarball generation with symlinks pointing to ./something
> 
> When a --transform expression is provided, it is by default also applied
> to the target of a symlink.
> 
> When we create tarballs (from git or svn checkouts), we use a --transform
> expression to replace the leading ./ with the package name and version.
> 
> This causes issues when a package contains symlinks that points to
> ./something, as the leading './' is also replaced.
> 
> Fix that by using the 'S' transformation scope flag, as described in the
> tar manual:
>   https://www.gnu.org/software/tar/manual/html_node/transform.html#transform
> 
>   In addition, several transformation scope flags are supported, that
>   control to what files transformations apply. These are:
> 
>   ?r? Apply transformation to regular archive members.
>   ?R? Do not apply transformation to regular archive members.
>   ?s? Apply transformation to symbolic link targets.
>   ?S? Do not apply transformation to symbolic link targets.
>   ?h? Apply transformation to hard link targets.
>   ?H? Do not apply transformation to hard link targets.
> 
>   Default is ?rsh? [...].
> 
> Fixes: #13616
> Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
> ---
>  support/download/git | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/git b/support/download/git
> index 15d8c66e05..1b0dc1b115 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -203,7 +203,7 @@ LC_ALL=C sort <"${output}.list" >"${output}.list.sorted"
>  
>  # Create GNU-format tarballs, since that's the format of the tarballs on
>  # sources.buildroot.org and used in the *.hash files
> -tar cf - --transform="s#^\./#${basename}/#" \
> +tar cf - --transform="s#^\./#${basename}/#S" \
>           --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
>           -T "${output}.list.sorted" >"${output}.tar"
>  gzip -6 -n <"${output}.tar" >"${output}"
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
