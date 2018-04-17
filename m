From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 17 Apr 2018 01:45:43 -0300
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
References: <20180416160124.GC2290@scaer>
Message-ID: <5ad57bf7f1951_56842aaddbffa1a01575b@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Apr 16, 2018 at 01:01 PM, Yann E. MORIN wrote:

> On 2018-04-15 23:54 -0300, Ricardo Martincoski spake thusly:
>> On Sun, Apr 15, 2018 at 09:02 AM, Yann E. MORIN wrote:
> [--SNIP--]
>> > Of course, that would require using appropriate options to fsck to bail
>> > out.
>> 
>> Yes. Some interesting ones I listed below:
>> --no-dangling: AFAIK they cause no harm;
>> --no-reflogs: not sure;
>> --full: this is for the case someone is abusing the git cache with alternates,
>>         should we care?
> 
> So I played with git-fsck in quite a few setups, and it irremediably
> exits with a non-zero status when something is wrong.
> 
> However, on my machine, it takes about 8min to fsck the Linux git tree,
> which is a huge amount of time (much more than it takes to do the build
> of said kernel).

Argh. Indeed it tests too much. And it takes too much time.
Sorry my bad suggestion.

> So, I am a bit reluctant at using git-fsck.
> 
> I'm trying to see if we can find a faster way to detect if the git tree
> is sane or not. After all, we only need a sanity check, not repairing.
> If it is not sane, we ditch it and reclone.

Agreed.

> So, maybe just running "git status" or any other fast action should
> probably be enough.

I think 'git status' tests too much too. It's more related to the worktree
status than to the repo (objects) status and we don't want to ditch the repo for
a dirty worktree, git checkout -f and git clean -ffdx fix it for us.

Maybe an even simpler command: 'git log -1' with the right options (to avoid
failing if a checkout did not occur yet) or even other command, like 'git
remote' or 'git tag'. But see below...

> 
> Thoughts?
> 

Maybe the solution is to use a reactive approach.

With your approach of using --git-dir (or the alternate GIT_DIR=) for every
command, we don't need a specific command to do the sanity check.

If the repo is totally broken (e.g. .git/HEAD missing) the 'git remote' fails.

If some object that the ref-to-be-checked-out needs is missing, 'git checkout
-f' fails. Git is smart, it only fails if there is not a checked out copy of the
file that matches the hash of the missing object.
If the fetch was successful but the ref we need was not download (i.e. the case
you described of someone using the wrong ref), the checkout also fails.
So when the checkout fails we could test if the ref we need is in the local
repo. If it is not present, we assume the repo is minimally sane and bail out.
If it is present (and the checkout failed) something really wrong is going on.
I guess 'git log -1 ref' will return the correct results for this test.

    _git() {
        eval ${GIT} --git-dir=.git "${@}"
    }
    _git init
    _git remote
    _git fetch
    _git fetch -t
    _git checkout -f ${ref}
    if failed
        if git log -1 ref
            ditch and restart
        else
            bail out
    _git clean -dX
    _git submodules update

Regards,
Ricardo
