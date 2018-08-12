From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 22:41:39 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <20180812202543.GB29650@scaer>
References: <20180806183647.GC2427@scaer>
 <5b68ea47f2a6f_79bb3fe8c00774a0328a9@ultri5.mail>
 <20180812202543.GB29650@scaer>
Message-ID: <20180812224139.2b81b839@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Ricardo,

On Sun, 12 Aug 2018 22:25:43 +0200, Yann E. MORIN wrote:

> > Commit 'refs/pull/1014/head' is a branch name.
> > Using a branch name is not supported.  
> 
> But then, the special refs also suffer from the same problems as
> branches do: they can't work for the very same reasons as explained in
> the previous patch.
> 
> So, I would be of the opinion that we should just drop support for those
> special refs altogether, based on the same explanations.
> 
> Now, I do understand that one will want to be able to test github MRs,
> or gerrit reviews or whatnots... But in that case, we already civer this
> by way of local.mk and overide-srcdir.
> 
> So, I would argue (as I always had since we introduced this special refs
> support) that this should better be handled by an upper layer.
> 
> Sure, you'd argue that an automated build job could do the build. But
> you anyway have to write some scripting for that automated job anyway.
> Just have it prepare a git clone of the affected package, checkout the
> correct commit, and prepare a local.mk with the correct override-srcdir
> befor attempting the buildroot build.

I don't remember all the discussion about special refs, but if I
understand correctly, it's for example a Github pull request. And if I
understood how Github works, you can push a new version of a pull
request as the same pull request number. This means that what you fetch
from a pull request is not stable. So it suffers from the same
reproducibility issue as regular branches.

Therefore, if we decide to officially not support branches, then we
should also not support special refs. Unless of course I misunderstood
the use case of special refs.

> > The other way is by using this series:
> > http://patchwork.ozlabs.org/project/buildroot/list/?series=44009
> > current master:
> > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301317
> > current master + this patch:
> > https://gitlab.com/RicardoMartincoski/buildroot/pipelines/27301358
> > It doesn't get to show that special-ref is broken because the tests run
> > sequentially (to avoid overpopulate the gitlab CI), but it shows (in the
> > -build.log) that also the download of a sha1 tip of a branch (search for
> > "git-sha1-branch-head" in the log) would be broken with this patch.
> > This can be reproduced locally:
> > $ make defconfig
> > $ ./utils/config --set-str BR2_BACKUP_SITE ""
> > $ BR2_DL_DIR=$(mktemp -d) make tremor-dirclean tremor-source
> > ...
> > Commit '7c30a66346199f3f09017a09567c6c8a3a0eedc8' is a branch name.
> > Using a branch name is not supported.

Yann: this one I don't understand.
7c30a66346199f3f09017a09567c6c8a3a0eedc8 is a regular commit SHA1, so
it should not be considered as a branch. Why do we have this failure
for a commit SHA1 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
