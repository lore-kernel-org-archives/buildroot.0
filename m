From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:47:08 +0100
Subject: [Buildroot] [PATCH 09/16 v5] core/apply-patches: store full
 path of applied patches
In-Reply-To: <20160319223746.GG3426@free.fr>
References: <cover.1457718289.git.yann.morin.1998@free.fr>
 <4752967e7f254170efc08e77530029c90f663d85.1457718289.git.yann.morin.1998@free.fr>
 <20160319160346.50b52b19@free-electrons.com>
 <20160319185108.GE3426@free.fr> <20160319223746.GG3426@free.fr>
Message-ID: <20160320144708.14352ff8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 23:37:46 +0100, Yann E. MORIN wrote:

> > >  * The package infra already knows which patches should be applied
> > >    (bundled patches, global patch dir, etc.), so it is technically able
> > >    to get the list of patches. Yes it's a bit annoying because the
> > >    logic to derive the list of patches is already inside the
> > >    apply-patches script. But maybe it's because too much smart stuff is
> > >    done in the apply-patch script without the package infrastructure
> > >    being aware.
> 
> e-reading this, I don;t see a proposal in there. Did I miss something,
> or did you forget to add something? ;-)

Well, the proposal is to make the infrastructure aware of patches that
are applied.

> > >  * Alternatively, add an option to apply-patch.sh that will not apply
> > >    the patches, but show the list of patches that would be applied.
> > >    Like "apply-patch -l" for example. Then, when doing the legal-info,
> > >    you simply call "apply-patch -l" to retrieve the list of patches
> > >    that you need to copy.
> 
> Well, it is in fact a bit more complex than just running apply-patches
> to get the list of patches.
> 
> First, some package do call apply-patches manually; there are 15 such
> packages, some cal.ling apply-patches more than once (gcc, linux, linux
> headers, uboot).
> 
> Second, in that case, some patches are applied conditionally. We do not
> want to duplicate that logic for legal-info.
> 
> So, I stand that the best solution is my proposal, to store the list of
> applied patches at the tiem they are applied, and use that later on for
> the legal-info output.

As suggested above, one way of doing this is to extend the
infrastructure so that no package does a manual APPLY_PATCHES call. I
haven't looked at the 15 different places where we call APPLY_PATCHES
manually, so I have no idea what is the complexity of handling that at
the infrastructure level, but it looks like some extension to the
infrastructure would allow to radically simplify the logic to apply
patches in U-Boot, Barebox, Linux, AT91Bootstrap, etc. Indeed, the only
reason why they have special logic is because the infrastructure
doesn't allow you passing a local directory in <pkg>_PATCH.

Then, for packages like cvs, input-tools, mii-diag, netcat-openbsd,
setserial, sysvinit and thttpd, the only reason why they call
APPLY_PATCHES is to apply Debian patches, which are already part of the
sources. So in fact, for those packages, your proposed logic would be
somewhat incorrect, as it would store patches which are already in the
source tarball.

To me, your proposal of having apply-patches.sh fill in a file goes
completely backward compared to what we've done with _EXTRA_DOWNLOADS.
We've added _EXTRA_DOWNLOADS precisely to make sure that the
infrastructure is aware of every file we download, instead of having
random packages do their own downloading.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
