From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 13 Apr 2018 15:28:28 -0300
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
References: <20180412174846.GF4221@scaer>
Message-ID: <5ad0f6ccb81f_19073fa45f41a968589e3@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 12, 2018 at 02:48 PM, Yann E. MORIN wrote:

> On 2018-04-12 06:28 -0300, Ricardo Martincoski spake thusly:
>> When performing the checkout, use -f to allow it to occur even if there
>> are untracked files that would be overwritten or removed.
>> 
>> Use git clean to remove any untracked files before generating the
>> tarball. Use the second -f to ensure the repo is pristine even if
>> previous checked out ref contained a submodule that is not present in
>> the ref just checked out.
[snip]
> 
> I'm not very happy of those tricks... If the repos is broken, it may be
> in a state that repairing it is not even possible at all, in case a
> critical git data is missing/damaged.

I created the series thinking only on git repos that are sane but have a dirty
worktree. I should have used "dirty worktree" in the commit log.

Rethinking now, taking into account a broken repo, and also the fact that the
default download directory is inside buildroot, this patch is a bit dangerous.

With a completely broken repo in the git cache, the commands called by the
download script end up executed in any repo that eventually contains that file
(parent \(of parent \)\+ directory), so:
$ cd buildroot
$ git init dl/package/git
$ cd dl/package/git
$ rm .git/HEAD # simulate a completely broken repo
$ git <command>
The git command would be executed in the buildroot tree.
A fetch to the wrong repo is bad, but not that bad.
A checkout would fail.
But checkout -f and git clean would succeed, potentially making the user to lose
changes.
I will change this patch to Changes Requested.

A way to avoid this, once the script entered the directory, is to force the
git-dir:
$ git --git-dir=.git <command>
This command would fail for a too-much-broken repo.

This is important also if we test the repo with git fsck before ditch+restart,
otherwise it would be possible to return OK based on the wrong repo.

> 
> If the repo is broken, either:
> 
>   - we ditch the repository and restart frm scratch,
> 
>   - or we just bail out and tell the user what hapened, so they can take
>     action (e.g. remove the broken repo manually).

When the repo is broken (detectable by git fsck) I agree this is the best
approach.

But I think a sane git repo (detectable by git fsck) that is in a dirty state
(in the sense of git clean) is a different case.
It can happen for example if a previous checkout operation was abruptly
interrupted during a git checkout. In this case it seems to me a bit extreme
(but not incorrect of course) to remove the repo and restart from scratch.

For the case a file from the worktree is missing the current 'git checkout'
succeeds and the problem shows up as a hash mismatch.
Using 'git checkout -f' the repo is recovered.
For the case a git object needed by the checkout is missing the current 'git
checkout' succeeds and the problem shows up as a hash mismatch.
Using 'git checkout -f' the checkout fails like this:
 error: invalid object

The git clean makes sure, among other things, that the worktree is clean even in
the case the previous checkout contained a submodule that is no longer present
in the new checkout. Maybe there is another command that ensures this, but I
don't know about yet.
Maybe I am missing something, but as I see, for a package with submodule, if
a submodule is removed from the upstream project, it would trigger a
ditch+restart too. Again, I think this is a bit extreme (more than git clean
-ffdx) but not wrong.

In order to detect broken repos (and trigger the ditch) we could start the
script by running fsck. Right?
Do you have a local patch for this ditch+restart? Or should I create one?


Regards,
Ricardo
