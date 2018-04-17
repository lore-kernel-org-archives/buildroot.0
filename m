From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Apr 2018 10:10:23 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <5ad59c9625d72_753f2b0dc7fbdab015b2@ultri4.mail>
References: <5ad57bf7f1951_56842aaddbffa1a01575b@ultri4.mail>
 <5ad59c9625d72_753f2b0dc7fbdab015b2@ultri4.mail>
Message-ID: <9a7630cb-2e57-c9a4-1002-92abc47d4472@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-04-18 09:04, Ricardo Martincoski wrote:
> Hello,
> 
> On Tue, Apr 17, 2018 at 01:45 AM, Ricardo Martincoski wrote:
> 
>>     _git() {
>>         eval ${GIT} --git-dir=.git "${@}"
>>     }
>>     _git init
>>     _git remote
>>     _git fetch
>>     _git fetch -t
>>     _git checkout -f ${ref}
>>     if failed
>>         if git log -1 ref
>>             ditch and restart
>>         else
>>             bail out
>>     _git clean -dX
>>     _git submodules update
> 
> But let's take a step back...
> 
> A dirty worktree is not so hard to find in practice. It happens when certain git
> commands are abruptly interrupted. As Thomas wrote in another thread, his
> autobuilder instance is sometimes restarted with the script running. Therefore
> the abrupt interruption will eventually occur during a checkout, possibly
> causing a dirty worktree.
> But the right commands (I believe they are checkout -f, git clean -ffdx) will
> fix it, assuming the repo is sane.
> 
> But a broken repo is usually associated either to hardware failures, especially
> those repos that cannot be recovered by 'git init' and/or 'git fetch', or to
> misuse, that from the git perspective is what the autobuilder script is
> currently doing by eventually removing random individual files from inside a
> .git dir.

 I was going to say exactly the same yesterday evening but didn't have the time
to think it through. All the fsck or status or whatever checks are only needed
to detect a broken .git directory, and this should never happen in normal git
operation.


> And the implementation of ditch+restart seems to be more complicated than it
> seemed to me before.
> 
> So, back to your proposal for a broken repo:
> either:
>  - ditch+restart
>  - bail out
> 
> I changed my mind and I think we should adopt bail out for now.
> It will keep the script simple, yet robust.
> ditch+restart can be implemented later if we want/need.

 Since a broken repo supposedly should never occur, I think we simply don't need
to handle that case.

> Thoughts?
> 
> 
>     _git() {
>         eval ${GIT} --git-dir=.git "${@}"

 I do indeed think that passing git-dir explicitly is a good idea. However, it
should be passed as GIT_DIR in the environment instead of --git-dir so it also
works with older versions of git. I've just checked git history, it seems that
GIT_DIR in the environment was supported since v0.99 (i.e. from before the first
tag in the repo).


>     }
>     _git init
>     _git remote
>     _git fetch
>     _git fetch -t
>     _git checkout -f ${ref}
>     _git clean -dX
>     _git submodules update
> 
> A simple improvement to the script to recover few broken repo scenarios is to
> make git init unconditional. From its help:
> "Running git init in an existing repository is safe. It will not overwrite
> things that are already there."
> For example, running 'git init' in a repo without .git/HEAD fixes it.

 That is a *great* idea.


> Here is a squashed, no commit log, no comments on the code, hackish preview:
> https://gitlab.com/RicardoMartincoski/buildroot/commit/f4e20bb62b761bb6c82a29acbd2f8d56d90e4e9c

 Looks good to me, with the following mods:

* use GIT_DIR
* add comment above git init explaining that it is safe
* explain why -ff is needed for git clean
* Removing the shallow fetch should be done in a separate patch (I'm not
entirely convinced yet that it is needed).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
