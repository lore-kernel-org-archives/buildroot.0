From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 21:42:54 +0100
Subject: [Buildroot] [PATCH] Fix tar file from git repository generation
 issue
In-Reply-To: <ab08988d-5b66-2d3a-5290-ee47b5a12154@free.fr>
References: <ab08988d-5b66-2d3a-5290-ee47b5a12154@free.fr>
Message-ID: <20210316204254.GD3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jean-Pierre, All,

On 2021-03-16 14:26 +0100, jean-pierre cartal spake thusly:
> Please find attached patches from bug report
> https://bugs.busybox.net/show_bug.cgi?id=13616 regarding tar file generation
> issue from git or svn repositories.
> 
> The two attached patches are for master branch and branch 2020.02.x

Thanks for your patches.

However, we want them to have proper commit messages, and you need to
add your Signed-off-by tag. See the manual:
    https://buildroot.org/downloads/manual/manual.html#submitting-patches

For example:

    support/download: fix tarball generation with symlinks pointing to ./something

    When a --transform expression is provided, it is by default also applied
    to the target of a symlink.

    When we create tarballs (from git or svn checkouts), we use a --transform
    expression to replace the leading ./ with the package name and version.

    This causes issues when a package contains symlinks that points to
    ./something, as the leading './' is also replaced.

    Fix that by using the 'S' transformation scope flag, as described in the
    tar manual:
        https://www.gnu.org/software/tar/manual/html_node/transform.html#transform

        In addition, several transformation scope flags are supported, that
        control to what files transformations apply. These are:

        ?r? Apply transformation to regular archive members.
        ?R? Do not apply transformation to regular archive members.
        ?s? Apply transformation to symbolic link targets.
        ?S? Do not apply transformation to symbolic link targets.
        ?h? Apply transformation to hard link targets.
        ?H? Do not apply transformation to hard link targets. 

        Default is ?rsh? [...].

    Fixes: #13616

    Signed-off-by: Yur Real NAME <your@email>
    Cc: Vincent Fazio <vfazio@xes-inc.com>
    Cc: Yann E. MORIN <yann.morin.1998@free.fr>

I would have applied the patch to master with the above commit log, but
I can not add your Signed-off-by line as this is legaly-binding.

Could you resend each change in separate mails, with a commit log like
the above (feel free to use it and adapt as you see fit), please?

You can use git send-email to send patches to the list.

Thank you again for your report and your patches! :-)

Regards,
Yann E. MORIN.

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
