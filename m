From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Fri, 13 Nov 2015 10:35:59 -0500
Subject: [Buildroot] [PATCH] support/download: fetch all refs on full
 git clone
In-Reply-To: <5645880C.5040103@mind.be>
References: <1446871164-19229-1-git-send-email-vivien.didelot@savoirfairelinux.com>
 <CAGduivyHPkkG7f6K7h2KGBXHPS7h8hvn07B2bKJdrbwLsf2nFA@mail.gmail.com>
 <20151112161223.GA22361@ketchup.mtl.sfl>
 <CAGduivzemzRU0_1c+xh8=q+ZF1Tc5o+rwWsF50DtsPqd9Bf38w@mail.gmail.com>
 <20151112170726.GB11143@ketchup.mtl.sfl> <5645880C.5040103@mind.be>
Message-ID: <20151113153558.GA3658@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Nov. Friday 13 (46) 07:49 AM, Arnout Vandecappelle wrote:
> On 12-11-15 18:07, Vivien Didelot wrote:
> [snip]
> > This is orthogonal, but I'm wondering if it'd make sense to stamp a git
> > remote update, similary to the local kernel setup + rsync. That would
> > ease the build process of a team, when a parallel kernel development is
> > on going.
> 
>  I'm not sure what you mean with stamping a git remote update. What I think
> would make sense is that for distributed VCS downloads (i.e. git and hg) we keep
> a full (shallow) clone in DL_DIR in addition to the tarball. That makes handling
> updates a lot more efficient. We probably would want to expose that to PRIMARY
> and SECONDARY download sites as well. Especially the PRIMARY would be useful,
> since it would allow you to start from a local clone of e.g. linux.git (which
> may not have the ref you need), and then just fetch the missing refs from upstream.
> 
>  This will not be easy to implement, though, since we'd need to handle e.g.
> multiple remotes that end up in the same DL_DIR/foo.git repository.
> 
> 
>  Was this what you meant, Vivien?

What I meant is, when you use BR2_LINUX_KERNEL_CUSTOM_LOCAL, Buildroot will 
stamp a .stamp_rsynced file and re-sync on later `make linux-rebuild`. This is 
really handy.

I don't think pointing to a Git repository is much different from this 
(especially during the development phase). Similary to rsync, `git remote 
update` can be used to sync a mirror clone (says the git-clone man page).

I'm thinking that we may either rework a generic $(1)-sync target which handles 
both rsync and `git remote update`, or introduce a $(1)-update target?

Caching full mirror clones is indeed the way to go. Several defconfig use the 
same Git repository. (e.g. 7 use linux-at91 and 7 use linux-2.6-imx). We need 
a clone to have a non-git identifier. I'd suggest to hash 
BR2_LINUX_KERNEL_CUSTOM_REPO_URL. sha1sum would give us the following paths:

"git://git.freescale.com/imx/linux-2.6-imx.git" # => linux-36a3f7006936f66cbf83b1de5bd179b2e72ceb4b.git
"https://github.com/linux4sam/linux-at91.git" # => linux-75076bea97e59045a5cfc8d84078976952d751bf.git

We might not want to store the clones in the same directory as the 
ready-to-be-extracted sources, so maybe a DL_VCS_DIR can be introduced.

Thanks,
-v
