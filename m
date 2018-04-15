From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Apr 2018 14:08:04 +0200
Subject: [Buildroot] [RFC PATCH 3/3] download/git: unshallow when
 fetching all refs
In-Reply-To: <5ad0f7a9dc541_19073fa45f48c644591ea@ultri4.mail>
References: <20180412173326.GD4221@scaer>
 <5ad0f7a9dc541_19073fa45f48c644591ea@ultri4.mail>
Message-ID: <20180415120804.GB21958@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-13 15:32 -0300, Ricardo Martincoski spake thusly:
> On Thu, Apr 12, 2018 at 02:33 PM, Yann E. MORIN wrote:
> > On 2018-04-12 13:28 +0200, Thomas Petazzoni spake thusly:
> 
> >> > One scenario in buildroot development that would trigger this sequence
> >> > is for example when a package is bumped on master branch, some users
> >> > create the git cache at this time, then the bump is reverted.
> >> > 
> >> > Another scenario is when giving maintenance to a product version that
> >> > uses one version of buildroot using the same build farm that uses a
> >> > newer version of buildroot.
> >> 
> >> In the light of this, wouldn't it be simpler to stop doing shallow
> >> clones at all ? A shallow clone did make a lot of sense back when we
> >> didn't cache the Git repositories. But now that we are caching the
> >> results, does it make sense to keep the complexity of the code to use
> >> shallow clones ?
> >> 
> >> Note that this is really an open question, there are possibly some
> >> convincing argument for us to keep a shallow clone strategy.
> > 
> > Indeed, I don't think it makes sense anymore...
> > 
> > So, intead of fixing it, let's just do full clones now.
> 
> I agree it is less needed now than before.

OK.

> The worst scenario (linux trees) is covered by:
> - the use of tarballs from GitHub in the defconfigs, for newcomers who sometimes
>   just want to use a defconfig, add few packages and use the image in a new
>   board;
> - in the long run, due to the git cache feature.
> 
> But I think people will miss this feature. At least I will.

Except for the linux git tree and a very few other packages we get from
git, most git tree are reasonably sized, so that the overhead of doign a
full clone is not much as comp[ared to the shallow clone.

And since it also makes our code much simpler and more maintaineable,
that's still a win for me...

> In the case of someone always using tags from a linux repo, this person
> would never need to download the full repo if the shallow fetch remains.
> 
> When someone wants just to try a package, for example, a debug tool, which
> maybe will never be used again, this person would need to do a full clone,
> instead of potentially do a shallow fetch.
> 
> The repo for some packages can be located on slow servers (not necessarily a
> package in the tree, it can be on a br2-external).
> 
> And the least appealing argument: I was willing to recreate
> http://patchwork.ozlabs.org/patch/702006/ on top of the new infra.

I'm still not convinced any more than I previously was. I.e. I still think
we should go with full clone.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
