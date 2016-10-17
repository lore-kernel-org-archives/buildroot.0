From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 00:58:27 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <CA+fik53vbiSC1bO=6NhkZ=THeZwbGX4Nqh2dw_VHf3k7p+ku-g@mail.gmail.com>
References: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
 <580308adbc1c4_26773ff56a3c4b24498bb@ultri3.mail>
 <97a00115-1935-4e29-05b6-55d781f2c11b@mind.be>
 <CA+fik50Rmi9JKdTLq+JZVFQOh9MiznP0Bd3XDEb1_UCM94tYJA@mail.gmail.com>
 <dc9fb93d-9e0a-5ab7-4b9c-cfcafbe14038@mind.be>
 <CA+fik53vbiSC1bO=6NhkZ=THeZwbGX4Nqh2dw_VHf3k7p+ku-g@mail.gmail.com>
Message-ID: <316a0e80-b3bc-fc37-678b-62261b26cda8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 00:11, Brandon Maier wrote:
> On Mon, Oct 17, 2016 at 3:18 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
> 
> 
>     On 17-10-16 01:11, Brandon Maier wrote:
>     >
>     > That seems reasonable. As Ricardo and you mentioned, git fetch seems to work
>     > with any ref (including special refs), and is smart about searching for matching
>     > branches. We could simplify this down greatly and also cover the special refs
>     > scenario from Yann's patch. Something like...
>     >
>     > equivalent_ref="$(git ls-remote $repo | awk '/^$cset/{ print $2; exit}')"
> 
>      There are two boundary cases that we should also handle:
>     - an actual ref that could also be a commit sha, e.g. "added";
> 
>  
> I can move the 'git fetch $cset' before the 'git fetch $equivalent_ref' so that
> if cset matches a ref, it will be fetched first. Also has the bonus that we can
> skip the ls-remote call entirely if it's a ref or the server supports fetching
> sha-1s.

 Sounds good!

> 
>     - an incomplete commit sha that matches several refs. 
> 
> 
> As in a shortened sha that collides with multiple full shas? I could change the
> awk to '\$1 == $cset{ print \$2; exit}' so that we only match on a complete
> 40-byte sha. It looks like all the PKG_VERSIONS in buildroot use the full sha
> anyway.

 I indeed meant an avbreviated sha. Inside Buildroot we indeed require full
sha's, but in BR2_EXTERNAL packages that's not always the case.

 I'd just error out if there are multiple matches.


>     > git init $basename
>     > pushd $basename
>     > git remote add origin $repo
> 
>      I'm not a big fan of adding an explicit remote, just use $repo everywhere.
> 
> 
> Either way is fine by me
>  
> 
> 
>     > if [ -n $equivalent_ref ]; then
>     >     git fetch --depth=1 origin $equivalent_ref
>     >     # $cset must be a SHA-1 here, so checkout $cset so we know we got the
>     > correct commit
>     >     git checkout $cset
>     >     git_done=1
> 
>      Only if checkout was successful, I guess.
> 
> 
> Yep, I wrote this quick. But all the git fetches and checkouts should be wrapped
> in an 'if ...; then git_done=1; else printf "failed..."; fi'
>  
> 
> 
>     > fi
>     > if [ $git_done -ne 1 ]; then
> 
>      I think this could be an else. If the first case failed, the second one is very
>     unlikely to succeed.
> 
> 
> If cset is a ref, equivalent_ref will be empty and we'd want to fallback here.

 Exactly, so an else of the [ -n $equivalent_ref ].

>  
> 
> 
>     >     # Don't know if cset is a sha or ref, so don't try to add to local refs,
>     > instead checkout FETCH_HEAD
>     >     git fetch --depth=1 origin $cset
>     >     git checkout FETCH_HEAD
> 
>      I kind of prefer to specify the target ref explicitly instead of relying on
>     FETCH_HEAD. I.e., create a local special ref for it. Could be e.g.
>     refs/buildroot/$cset.
> 
> 
> Is it possible for FETCH_HEAD to be incorrect? Maybe if someone is messing
> around in the repo? Otherwise this could add an (albeit extremely unlikely)
> corner case where the repo has a special ref called refs/buildroot/xyz.

 We own the buildroot namespace :-P

>  
> 
> 
>     >     git_done=1
> 
>      Here checkout was always successful.
> 
>     > fi
>     > # Full fetch w/ special refs
>     > if [ $git_done -ne 1]; then
>     >     git fetch -u origin 'refs/*:refs/*'
> 
>      This could theoretically be a much larger clone than a simple "git fetch -u
>     origin", so it might be worthwhile to first try that one still. And it's a
>     pretty unusual situation that you specified a sha that is only reachable from a
>     special ref, not from a normal branch/tag.
> 
>      However, in practice I don't think the extra objects added by gerrit will
>     amount to much on a large repo. gerrit will die a thousand deads before it can
>     even approximate one "change" per e.g. kernel commit.
> 
> 
> We'd need to do a "git fetch -u origin 'refs/tags/*:refs/tags/*'
> 'refs/heads/*:refs/heads/*'" otherwise it wouldn't fetch the tags and branches,

 Euh, isn't this exactly equivalent to "git fetch -u origin" ?

> which I'm fine with adding. But if we agree that special refs probably won't
> make up a large portion of fetches, I'd rather keep it simple and just fetch
> everything.

 Good enough for me.

> 
> 
>     >     git checkout $cset
>     > fi
>     >
>     > The downside is we won't add refs to our local refs/ on a shallow clone. But it
>     > looks like we only needed them for checkout, which we can do via FETCH_HEAD instead.
> 
>      Except in the sha-gotten-through-shallow-clone-of-ref case, because in that
>     case the fetched ref may have already changed compared to what was there when we
>     did the ls-remote.
> 
> 
> Yes, but in that case we can do "git checkout $cset" because $cset must be a
> commit's sha, and we don't need to fetch refs to checkout shas.
> 
> 
> Otherwise, if we think switching to fetches is an acceptable solution, I'll
> create a new patchset to do the change-over.

 Do it in two patches: first convert the current situation to fetches, then add
the shallow download of tag SHAs.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
