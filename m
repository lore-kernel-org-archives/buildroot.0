From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 23:03:14 +0200
Subject: [Buildroot] [PATCH 1/1] support/download/git: Prioritize remote
 archive
In-Reply-To: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
References: <1471461016-9660-1-git-send-email-kamath.ben@gmail.com>
Message-ID: <20160817210314.GG5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benjamin, All,

On 2016-08-17 12:10 -0700, Benjamin Kamath spake thusly:
> Attempt to do a remote archive since it shortcuts us past a few steps when
> available. Additionally. if the git server has uploadArchive.allowUnreachable
> set to true, then this method can also work on arbitrary sha1s, offering a huge
> speed advantage over a full clone.
> 
> Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
> ---
>  support/download/git | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 416cd1b..043a6de 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -36,6 +36,15 @@ _git() {
>      eval ${GIT} "${@}"
>  }
>  
> +# Try a remote archive, since it is as fast as a shallow clone and can give us
> +# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
> +# on the remote, this will also work for arbitrary sha1s, and will offer a
> +# considerable speedup over a full clone.
> +printf "Doing remote archive\n"
> +if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} -o ${output} ${cset} 2>&1; then
> +    exit 0
> +fi

NAK in the state.

If the package needs submodules, we can't ask the remote to generate
the archive for us, because git-archive does not know how to include
submodules.

So, maybe this would work:

    if [ ${recurse} -eq 0 ]; then
        if _git blabla remote archive; then
            exit 0
        fi
    fi

Also, as stated by Thomas, we want to generate reproducible archives, so
that we can check the hashes of archives. We go at great length to
generate such archives locally, but I don't see a guarantee that the
remote archive would be reproducible.

Regards,
Yann E. MORIN.

>  # Try a shallow clone, since it is faster than a full clone - but that only
>  # works if the version is a ref (tag or branch). Before trying to do a shallow
>  # clone we check if ${cset} is in the list provided by git ls-remote. If not
> -- 
> 2.7.4
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
