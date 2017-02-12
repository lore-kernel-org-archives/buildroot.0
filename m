From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Feb 2017 23:01:16 +0100
Subject: [Buildroot] [PATCH v3] support/download/git: Prioritize remote
 archive
In-Reply-To: <1472060848-14178-1-git-send-email-kamath.ben@gmail.com>
References: <1471469135-19009-1-git-send-email-kamath.ben@gmail.com>
 <1472060848-14178-1-git-send-email-kamath.ben@gmail.com>
Message-ID: <ae7956e3-a69e-ca48-9541-9bc0104118f3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Benjamin,


On 24-08-16 19:47, Benjamin Kamath wrote:
> Attempt to do a remote archive since it shortcuts us past a few steps when
> available. Additionally. if the git server has uploadArchive.allowUnreachable
> set to true, then this method can also work on arbitrary sha1s, offering a huge
> speed advantage over a full clone.
> 
> Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>

 After some discussion at the Buildroot developer meeting, we decided not to
accept this patch, for the following reasons.

* We want to keep the download/git script as simple as reasonably possible.

* Not many upstream sites support this option.

* We now have good support for shallow clones; in most cases, the shallow clone
handling will give equal benefits.


 So I've marked this patch as rejected in patchwork.

 If you feel it is important to include this feature in Buildroot after all,
feel free to argue your case.

 And finally, sorry that it took so long before we reacted to your patch.

 Regards,
 Arnout


> ---
> Changes v2 -> v3:
>     - Indicate to user if the remote archive fails (suggested by Yann)
>     - redirect all errors from git archive to /dev/null since this
>       operation fails on most public git servers
> Changes v1 -> v2:
>     - Skip remote archive for repositories with submodules (suggested by Yann)
> 
>  support/download/git | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 416cd1b..ec49057 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -36,6 +36,22 @@ _git() {
>      eval ${GIT} "${@}"
>  }
>  
> +# Try a remote archive, since it is as fast as a shallow clone and can give us
> +# an archive directly. Also, if uploadArchive.allowUnreachable is set to true
> +# on the remote, this will also work for arbitrary sha1s, and will offer a
> +# considerable speedup over a full clone. This will not work for submodules.
> +# Since this command fails on most public git servers, consign the output to 
> +# oblivion but still trace as a warning.
> +if [ ${recurse} -eq 0 ]; then
> +    printf "Doing remote archive\n"
> +    if _git archive --format=tar.gz --prefix=${basename}/ --remote=${repo} \
> +        -o ${output} ${cset} >/dev/null 2>&1; then
> +        exit 0
> +    else
> +        printf "Remote archive failed, falling back to cloning\n"
> +    fi
> +fi
> +
>  # Try a shallow clone, since it is faster than a full clone - but that only
>  # works if the version is a ref (tag or branch). Before trying to do a shallow
>  # clone we check if ${cset} is in the list provided by git ls-remote. If not
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
