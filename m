From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 13 Apr 2018 15:32:09 -0300
Subject: [Buildroot] [RFC PATCH 3/3] download/git: unshallow when
 fetching all refs
References: <20180412173326.GD4221@scaer>
Message-ID: <5ad0f7a9dc541_19073fa45f48c644591ea@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Apr 12, 2018 at 02:33 PM, Yann E. MORIN wrote:

> On 2018-04-12 13:28 +0200, Thomas Petazzoni spake thusly:

>> > One scenario in buildroot development that would trigger this sequence
>> > is for example when a package is bumped on master branch, some users
>> > create the git cache at this time, then the bump is reverted.
>> > 
>> > Another scenario is when giving maintenance to a product version that
>> > uses one version of buildroot using the same build farm that uses a
>> > newer version of buildroot.
>> 
>> In the light of this, wouldn't it be simpler to stop doing shallow
>> clones at all ? A shallow clone did make a lot of sense back when we
>> didn't cache the Git repositories. But now that we are caching the
>> results, does it make sense to keep the complexity of the code to use
>> shallow clones ?
>> 
>> Note that this is really an open question, there are possibly some
>> convincing argument for us to keep a shallow clone strategy.
> 
> Indeed, I don't think it makes sense anymore...
> 
> So, intead of fixing it, let's just do full clones now.

I agree it is less needed now than before.

The worst scenario (linux trees) is covered by:
- the use of tarballs from GitHub in the defconfigs, for newcomers who sometimes
  just want to use a defconfig, add few packages and use the image in a new
  board;
- in the long run, due to the git cache feature.

But I think people will miss this feature. At least I will.

In the case of someone always using tags from a linux repo, this person
would never need to download the full repo if the shallow fetch remains.

When someone wants just to try a package, for example, a debug tool, which
maybe will never be used again, this person would need to do a full clone,
instead of potentially do a shallow fetch.

The repo for some packages can be located on slow servers (not necessarily a
package in the tree, it can be on a br2-external).

And the least appealing argument: I was willing to recreate
http://patchwork.ozlabs.org/patch/702006/ on top of the new infra.


Regards,
Ricardo
