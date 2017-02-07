From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2017 17:48:15 +0100
Subject: [Buildroot] [PATCH v2 1/4] support/download/git: do not use git
 clone
In-Reply-To: <20161202152123.20399-2-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-2-ricardo.martincoski@datacom.ind.br>
Message-ID: <a52a04a3-2290-ea7c-1194-c863f03926e8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-12-16 16:21, Ricardo Martincoski wrote:
> Rewrite the script using git init and git fetch instead of git clone,
> based in some ideas discussed during the review of [1].
> 
> Always using git init + git fetch has these advantages:
> - git fetch works with all kinds of refs, while git clone supports only
>   branches and tags without the ref/heads/ and ref/tags/ prefixes;
> - a fetch can be done for the head of those refs (the same as git clone
>   -b but works for all refs);
> - the objects already downloaded by a call to git fetch are reused in
>   the next call.
> 
> First ask the remote for its references using git ls-remote and save the
> output to a file. Later on, inspect the saved file for the desired
> change set, determining if it is a named ref and so can be downloaded
> using a shallow fetch.
> Use an analytical solution to inspect the output of git ls-remote
> instead of a single awk line. It makes each line of code simple: 'grep'
> to check the entry is in the ls-remote output and 'cut' to actually get
> the reference to use.
> 
> A concern that arrives from this method is that the remote can change
> between the git ls-remote and the git fetch, but in this case, once the
> script creates the equivalent of a shallow clone, the fetch and the
> checkout do what is expected:
> - for a removed named reference (branch, tag or special ref), the fetch
>   fails, falling back to a possibly successful checkout after all
>   branches and tags are fetched (the checkout will only succeed in
>   specific cases, e.g. the remote removed a branch but created a tag
>   with the same name);
> - for a changed named reference (branch, tag or special ref), the fetch
>   and checkout are successful using the "new" sha1 from the remote.
> 
> Move the git checkout command together to each git fetch command since
> now the checkout can fail (if the change set is not yet fetched) falling
> back to the next method (that downloads more objects from the remote).
> 
> When doing a full fetch in a local shallow copy, use --unshallow to
> ensure the local copy is converted to a complete one.
> 
> If after the fetch of all branches and tags (equivalent to git clone)
> the desired change set cannot be checked out, do a fetch of all
> references (equivalent to git clone --mirror). This approach allows the
> use of any unambiguous partial sha1 as package version and also allows
> the use of sha1 of special refs, while keeping the usual bandwidth need
> unchanged by avoiding downloading special refs when not needed.
> 
> [1] http://patchwork.ozlabs.org/patch/681841/
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I tested getting hashes from a few different hard-to-reach branches, and it
works very well (with the full series applied), using shallow clones wherever
possible and falling back on full mirror when necessary.

[snip]
> +if [ ${git_done} -eq 0 ]; then
> +    printf "Doing mirror fetch\n"
> +    # Fetch all refs, including special refs. The same as git clone --mirror.
> +    _git fetch -u ${verbose} "${@}" ${unshallow} "'${repo}'" "'+refs/*:refs/*'"
> +    _git checkout -q "'${cset}'"
>  fi

 This bit is the only one which is still a little bit controversial. It really
should never be needed for any sane situation. Still, it feels safer to have
such a fallback so I'd keep it. The only disadvantage is that in case that a ref
really can't be fetched, it will take a long time before we discover that.

 Regards,
 Arnout

>  
> -# Checkout the required changeset, so that we can update the required
> -# submodules.
> -_git checkout -q "'${cset}'"
> -
>  # Get date of commit to generate a reproducible archive.
>  # %cD is RFC2822, so it's fully qualified, with TZ and all.
>  date="$( _git log -1 --pretty=format:%cD )"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
