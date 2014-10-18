From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sat, 18 Oct 2014 14:15:54 +0200
Subject: [Buildroot] [PATCH v3] rpi-userland: bump revision for musl
	compile fixes
In-Reply-To: <20141018113446.GA31723@free.fr>
References: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
 <20141018110508.GC3858@free.fr> <20141018113446.GA31723@free.fr>
Message-ID: <1491715.MQnf8L3yFy@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 18 October 2014 13:34:46 Yann E. MORIN wrote:
> Maarten, All,
> 
> On 2014-10-18 13:05 +0200, Yann E. MORIN spake thusly:
> > On 2014-10-17 17:57 +0200, Maarten ter Huurne spake thusly:
> > > Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> > > ---
> > > The second version of this patch was missing the "v2" label; this is
> > > the third version.
> > > 
> > > The changes from v2, plus an additional change I made later were
> > > merged
> > > upstream. This patch bumps the git revision to the merge commit.
> > > 
> > > rpi-userland-002-remove-faulty-assert.patch had to be updated to match
> > > other changes in the code that are pulled in by the version bump.
> > > I checked that the updated patch compiles fine, but I have no idea
> > > whether it is still needed to fix or work around a runtime problem.
> > 
> > So, I have tested this bump: weston on the rpi no longer works, with or
> > without the asser patch.
> > 
> > So, I NAK this bump for now.
> > 
> > I'll see to bisect rpi-userland to see where it breaks.
> 
> The culprit is:
>     66338d3 vc_dispmanx: Fix vsync service use counting
> 
> Unfortunately, weston has yet no fix for that, and I could not spot any
> fix for rpi-userland either... :-/

That commit is less than a week old; rpi-userland might not be aware of the 
problem. Will you or the Weston devs file a bug for it or alert the author?

By the way, 66338d3 is the commit that gives a NULL handle a special 
meaning. If the assert no longer triggers, perhaps the assert used to 
trigger on the handle being NULL by accident?

> So, still NAK for this bump. We can still bump it up to ba753c1 as this
> still works, but is not enough to get the musl fixes.
> 
> Maybe we could just hide it for musl for now?

I think it would be a pity to hide it when we have a fix for the musl 
compile problem.

The only differences between the the proposed bump (4333d6d) and the last 
working version (ba753c1) are the commit that breaks Weston (66338d3) and 
the musl compile fixes. So I could create a v4 patch which bumps the version 
to 4333d6d and contains a patch to revert 66338d3.

Alternatively, I could create a v4 patch which bumps the version to ba753c1 
and adds the musl compile fixes as separate patches. While the number of 
patches would be greater (5 vs 1), the number of changed lines would be 
smaller, since most of the compile fixes change one line each.

Or I could create a v4 patch which bumps the version to ba753c1 and adds the 
musl compile fixes as a single patch. Since we know they have been accepted 
upstream in the same merge commit (4333d6d), we can drop all of them at the 
same time once we can safely bump beyond that merge commit.

At the moment I prefer bumping to ba753c1 + squashed musl compile fixes, but 
I'd like a second opinion.

Bye,
		Maarten
