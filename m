From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 00:50:31 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <1476373859-51202-1-git-send-email-bryce.ferguson@rockwellcollins.com>
References: <1476373859-51202-1-git-send-email-bryce.ferguson@rockwellcollins.com>
Message-ID: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-10-16 17:50, Bryce Ferguson wrote:
> From: Brandon Maier <brandon.maier@rockwellcollins.com>
> 
> Shallow clones don't work for downloading SHAs. However it's common to
> track a tag or branch by the commit SHA so that a branch or tag doesn't
> unexpectedly change.
> 
> We can take advantage of this scenario by searching the remote for a ref
> that it equivalent to our sha, then shallow cloning that ref instead.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
> ---
>  support/download/git | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/support/download/git b/support/download/git
> index 281db61..1c6548d 100755
> --- a/support/download/git
> +++ b/support/download/git
> @@ -55,6 +55,23 @@ if [ -n "$(_git ls-remote "'${repo}'" "'${cset}'" 2>&1)" ]; then
>      fi
>  fi
>  if [ ${git_done} -eq 0 ]; then
> +    # See if $cset is a sha that maps to a branch, then shallow clone that branch
> +    equivalent_ref="$(_git ls-remote --heads --tags "'${repo}'" | awk "/^${cset}/{ print \$2; exit }" | sed 's,refs/\(tags\|heads\)/,,')"

 There should be a redirect of stderr of ls-remote (we don't want to see any
errors from it, the relevant error is the one coming from git clone).

 This line is way too long.

 Also, you can get rid of the sed by including it in awk:

	{ split(\$2, a, \"/\"); print a[3]; exit }

 Also, wouldn't it be better to merge this into the first one? ls-remote takes a
relatively long time, and it seems to be independent of how much refs are
actually printed, so it seems a waste to do it twice. It does mean that the awk
program would become a little more complicated because it also has to match the
cset as a ref.

 Hm, actually, cset may be something like refs/tags/foo so the awk program would
get quite a bit more complicated... Still, I think it's worth it.

> +    if [ -n "$equivalent_ref" ]; then
> +        printf "Doing shallow clone with cset '%s' as '%s'\n" "$cset" "$equivalent_ref"
> +        if _git clone ${verbose} "${@}" --depth 1 -b "'${equivalent_ref}'" "'${repo}'" "'${basename}'"; then
> +            if (cd "${basename}" && _git show "'${cset}'" >/dev/null 2>&1); then

 Can you explain why this bit is still needed? Is there any way that the clone
could succeed but the cset not be present? It would mean that ls-remote was
lying to us, no?

 I can invent one scenario: the symbolic ref got updated between the ls-remote
and the clone, which means that the wrong commit got shallow-cloned, and the
actual cset is not reachable. Hm, ok, can you add a comment to explain that?


 Otherwise looks good :-)

 Regards,
 Arnout

> +                git_done=1
> +            else
> +                rm -rf "${basename}"
> +                printf "Shallow clone failed, checked out wrong revision, falling back to doing a full clone\n"
> +            fi
> +        else
> +            printf "Shallow clone failed, falling back to doing a full clone\n"
> +        fi
> +    fi
> +fi
> +if [ ${git_done} -eq 0 ]; then
>      printf "Doing full clone\n"
>      _git clone ${verbose} "${@}" "'${repo}'" "'${basename}'"
>  fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
