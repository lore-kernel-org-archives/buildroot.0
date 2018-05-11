From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 10 May 2018 23:59:12 -0300
Subject: [Buildroot] [PATCH] docs/manual: using a branch name as
 FPP_VERSION does not work
References: <20180510164337.14578-1-yann.morin.1998@free.fr>
Message-ID: <5af50700ef2bd_74473fa2980c3aa8143d@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

TL;DR: I agree with your change to the manual, but I have some nitpick for your
explanation.

On Thu, May 10, 2018 at 01:43 PM, Yann E. MORIN wrote:

> docs/manual: using a branch name as FPP_VERSION does not work

s/FPP/FOO/

> For various reasons, we've always suggested users to avoid using a
> branch as version string for their packages, because it does not work
> as a they would expect:

OK.

>   - it is not reproducible, because the branch may change between two
>     builds that are done at different times;

OK.

>   - it does not even follow the branch, as Buildroot anyway generates
>     a local tarball.

It does not follow the branch because:
1) Buildroot reuses any local tarball it already generated;
2) with the tarballs for the package removed, when a remote branch was once
   checked out by the git download infra (by chance, see below) it creates a
   local branch. When the remote adds a commit to the branch, the download infra
   fetches the new commits updating origin/branch but the local branch is not
   updated.

> Yet, until recently, using a branch name would just work (with the
> above limitations): the git tree was cloned, the branch checked out,
> and the tarball created.
> 
> But with the advent of the git caching, using a branch name does not
> work anymore.

It does not work ... in a reliable way.
Actually it works *by chance* due to fetch for the special ref. Yes, once again.

I just realized I have to update again my series adding automated tests for the
git download infra as it should not test named branches or named feature
branches anymore. BTW those tests pass because I did not used 'master'.

If you remove the code for named special refs then the behavior is consistent: a
named branch or named feature branch never works.
Well, unless someone is crazy enough to prepend the branch name with 'origin/'
in the _VERSION variable. I don't think we should add more complexity to the
script to prevent this.

> work anymore. Indeed, we now do a git-fetch, and that does not create
> local branches. So we can't check out a branch, because it does not
> exist locally.

Actually the local branch is created on checkout.
With an empty git cache the only branch that does not work is 'master'.

For example, if you first download dl-tools using its current version (a tag)
and then change _VERSION to 'master' and download again it works (by chance as
describe above).
Starting with an empty git cache and _VERSION set to 'master' does not work
because the 'git rev-parse' fails.
Also using an empty git cache and _VERSION set to 'topic/blockdev' does work
(again by chance).

> Update the manual to state that using a branch does not work. Remove

It does not work for git. CVS branch probably still works (I did not tested).
But maybe... we don't care: too much details for the manual. The end game is to
discourage the use of branches as it is not good practice, if some kinds of
branch works by chance, then OK IMO. But Buildroot does not guarantee that
branches work (for simplicity the manual will say it does not work), anyone can
still exploit the infra to download a named branch at its own risk, but not for
packages in the tree.

> the 'stable' example, as it looked like the name of a stable branch;
> instead, replace it with a version string that ressemble a tag.
> 
> Fix the layout of the manual by making the version examples an actual
> bulleted list.

By opening the output html in the web browser, I checked the layout is much
nicer after this patch.


After all the nitpicking above, I must still say: I am not against applying this
patch after fixing when applying only the typo in the title. Anyone can search
the mailing list for these details.


Regards,
Ricardo
