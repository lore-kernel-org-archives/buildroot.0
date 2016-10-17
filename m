From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 22:18:03 +0200
Subject: [Buildroot] [PATCH 1/1] support/download: Add git download
 method for SHAs
In-Reply-To: <CA+fik50Rmi9JKdTLq+JZVFQOh9MiznP0Bd3XDEb1_UCM94tYJA@mail.gmail.com>
References: <54fbe894-b6c0-574f-7b52-7eb8c09525f5@mind.be>
 <580308adbc1c4_26773ff56a3c4b24498bb@ultri3.mail>
 <97a00115-1935-4e29-05b6-55d781f2c11b@mind.be>
 <CA+fik50Rmi9JKdTLq+JZVFQOh9MiznP0Bd3XDEb1_UCM94tYJA@mail.gmail.com>
Message-ID: <dc9fb93d-9e0a-5ab7-4b9c-cfcafbe14038@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 01:11, Brandon Maier wrote:
> On Sun, Oct 16, 2016 at 2:25 AM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
> 
>>      Actually, it is better to use the whole ref, includes refs/*/ because there may
>>     be a branch and tag with the same name. And incidentally this simplifies the awk
>>     expression :-)
>> 
>>      Grmbl, git clone doesn't support refs/.../... style of refs. git clone sucks.
>>     Why don't we do
>> 
>>     git init
>>     git fetch
>> 
>>     all the time? We're anyway doing a git fetch down there... Could just as well be
>>     done always. Oh, and git fetch does support --depth so no issue there.
> 
> 
> That seems reasonable. As Ricardo and you mentioned, git fetch seems to work
> with any ref (including special refs), and is smart about searching for matching
> branches. We could simplify this down greatly and also cover the special refs
> scenario from Yann's patch. Something like...
> 
> equivalent_ref="$(git ls-remote $repo | awk '/^$cset/{ print $2; exit}')"

 There are two boundary cases that we should also handle:
- an actual ref that could also be a commit sha, e.g. "added";
- an incomplete commit sha that matches several refs.

> git init $basename
> pushd $basename
> git remote add origin $repo

 I'm not a big fan of adding an explicit remote, just use $repo everywhere.

> if [ -n $equivalent_ref ]; then
>     git fetch --depth=1 origin $equivalent_ref
>     # $cset must be a SHA-1 here, so checkout $cset so we know we got the
> correct commit
>     git checkout $cset
>     git_done=1

 Only if checkout was successful, I guess.

> fi
> if [ $git_done -ne 1 ]; then

 I think this could be an else. If the first case failed, the second one is very
unlikely to succeed.

>     # Don't know if cset is a sha or ref, so don't try to add to local refs,
> instead checkout FETCH_HEAD
>     git fetch --depth=1 origin $cset
>     git checkout FETCH_HEAD

 I kind of prefer to specify the target ref explicitly instead of relying on
FETCH_HEAD. I.e., create a local special ref for it. Could be e.g.
refs/buildroot/$cset.

>     git_done=1

 Here checkout was always successful.

> fi
> # Full fetch w/ special refs
> if [ $git_done -ne 1]; then
>     git fetch -u origin 'refs/*:refs/*'

 This could theoretically be a much larger clone than a simple "git fetch -u
origin", so it might be worthwhile to first try that one still. And it's a
pretty unusual situation that you specified a sha that is only reachable from a
special ref, not from a normal branch/tag.

 However, in practice I don't think the extra objects added by gerrit will
amount to much on a large repo. gerrit will die a thousand deads before it can
even approximate one "change" per e.g. kernel commit.

>     git checkout $cset
> fi
>  
> The downside is we won't add refs to our local refs/ on a shallow clone. But it
> looks like we only needed them for checkout, which we can do via FETCH_HEAD instead.

 Except in the sha-gotten-through-shallow-clone-of-ref case, because in that
case the fetched ref may have already changed compared to what was there when we
did the ls-remote.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
