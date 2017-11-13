From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 13 Nov 2017 10:07:47 +0100
Subject: [Buildroot] [PATCH 1/1] add sunxi-mali mainline kernel
In-Reply-To: <fb2e4cfc-6320-5f99-b478-879502c7c0e2@mind.be>
References: <1509920353-23438-1-git-send-email-giulio.benetti@micronovasrl.com>
 <20171108102753.nisqsfaibybjul4x@flea.lan>
 <35a55788-8cf6-2f65-e110-dfc467fad8cd@mind.be>
 <20171109080524.irywhbolqtlowcxf@flea.lan>
 <fb2e4cfc-6320-5f99-b478-879502c7c0e2@mind.be>
Message-ID: <20171113090747.5nt4agzgv5bqtqyf@flea.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sat, Nov 11, 2017 at 11:03:53AM +0100, Arnout Vandecappelle wrote:
> On 09-11-17 09:05, Maxime Ripard wrote:
> > So, while I'm really not happy about the current code, I haven't found
> > better yet.
> > 
> > The idea is that we have various versions coming from ARM as
> > tarballs. On this various versions, the changes needed are the same
> > (but obviously the code to apply it on isn't), and maintaining two
> > sets of changes (through git commits or something else) would be very
> > inefficient and wouldn't scale.
> > 
> > So I went for the same set of patches that we apply on whatever
> > version is currently being built.
> 
>  But it's pretty unlikely that those patches will always apply unmodified on all
> versions, right?

It's been the case so far, so fingers crossed :)

> > Like I was saying, I'm not really
> > happy about it either so I'm definitely open to suggestions. We
> > discussed it with Thomas quite some time ago and it's the only
> > solution that stuck.
> 
> If I understand correctly, for a specific project you will always use a
> specific release (i.e. version coming from ARM), you never need to mix two
> releases, right?

Yes

>  How we solved this for a similar situation with drivers coming from the company
> I love so much is as follows. We have an "incoming" branch that just contains
> the unmodified code coming from the tarballs. Whenever a new tarball comes in,
> you check out that branch, remove everything, untar, git add -A, and commit.
> Then, for each release, a new branch is created, by rebasing the old release
> branch on top of the new release: git checkout -b r6p2 r6p0; git rebase
> incoming. And in the project configuration you check out the branch you need.
> If you create a new patch, it needs to be cherry-picked on each branch and this
> is indeed annoying. OTOH you need to separately test that new patch on each
> release anyway so it's not that much extra effort.
> 
>  So our history would look like this (time goes down, columns are branches)
> 
> incoming            r5p4           r6p0           r6p2
> import r5p4
>            -------> create
>                     add feat1
>                     add feat2
> import r6p0
>             --------rebase-------->add feat1
>                                   >add feat2
>                                    add feat3
>                      cherry feat3
> import r6p2
>             -----------------------rebase------->add feat1
>                                                 >add feat2
>                                                 >add feat3
>                                    add feat4
>                      (abandoned)                 cherry feat4
> 
> 
>  Note that rebasing does not hurt downstreams because you're always rebasing
> into a new branch, so there can't be a conflicting downstream checkout. Note
> that there is no master branch with the latest and greatest - you always have to
> explicitly check out a release.
> 
>  Maybe for an open source project there are other constraints that I didn't
> think about. But for us, this worked.

Right, so that's indeed something we talked about and I didn't like
very much because of the duplication of the efforts.

So far we've had mainly two types of changes:
  - The platform code itself that has a rather stable interface with
    the driver and is a new file, so there won't be any conflict.
  - The various fixes for the new kernel releases that so far have
    been able to apply on both, with some fuzz.

So it's not really features, it's mostly dealing with compilation
breakages, so the changes are less likely to conflict as they are
usually well isolated, and the testing effort is quite minimal too.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 801 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171113/038891d7/attachment.asc>
