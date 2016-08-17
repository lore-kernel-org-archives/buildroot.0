From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 23:53:01 +0200
Subject: [Buildroot] [PATCH v2] support/download/git: Prioritize remote
 archive
In-Reply-To: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
References: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
Message-ID: <20160817215301.GJ5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Benjmin, All,

On 2016-08-17 14:25 -0700, Benjamin Kamath spake thusly:
> From: Benjamin Kamath <bkamath@spaceflight.com>
> 
> Attempt to do a remote archive since it shortcuts us past a few steps when
> available. Additionally. if the git server has uploadArchive.allowUnreachable
> set to true, then this method can also work on arbitrary sha1s, offering a huge
> speed advantage over a full clone.

Do you know of a publicly-accessible server that allows remote archives?

I've tried with a github-hosted package, but githib won;t allow remote
archives, it seems...

Regards,
Yann E. MORIN.

> Signed-off-by: Benjamin Kamath <bkamath@spaceflight.com>
> ---
> Changes v1 -> v2:
>     - Skip remote archive for repositories with submodules (suggested by Yann)
> 
>  support/download/git | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 416cd1b..d060cbd 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -36,6 +36,17 @@ _git() {
>      eval ${GIT} "${@}"
>  }
>  
> +# Try a remote archive, since it is as fast as a shallow clone and can give us
> +# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
> +# on the remote, this will also work for arbitrary sha1s, and will offer a
> +# considerable speedup over a full clone. This will not work for submodules.
> +if [ ${recurse} -eq 0 ]; then
> +    printf "Doing remote archive\n"
> +    if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} -o ${output} ${cset} 2>&1; then
> +        exit 0
> +    fi
> +fi
> +
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
