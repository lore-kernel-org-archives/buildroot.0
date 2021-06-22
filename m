From: Herve Codina <herve.codina@bootlin.com>
Date: Tue, 22 Jun 2021 11:31:24 +0200
Subject: [Buildroot] [PATCH 04/15] package/pkg-generic.mk: Fix .la files
 overwrite detection
In-Reply-To: <20210621214223.GC44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-5-herve.codina@bootlin.com>
 <20210621214223.GC44262@scaer>
Message-ID: <20210622113124.7cf2dde1@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, 21 Jun 2021 23:42:23 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> On 2021-06-21 16:11 +0200, Herve Codina spake thusly:
> > During per-package build, original .la files are modified by
> > fixup-libtool-files calls.
> > But since fixup-libtool-files modifies files using sed --in-place,
> > these modification are done using a temporary file and a call to
> > rename. Rename breaks the hardlink to the original file and leave the
> > temporary file in per-package TARGET dir.
> > As the original file is not modified, this is no longer considered as
> > an overwrite.
> > 
> > To fix this detection, this patch simply considers the what is done
> > by fixup-libtool-files is part of the original snapshot used to
> > detect overwrites. And so, the original snapshot is taken after
> > fixup-libtool-files call.  
> 
> Then this should be squashed together with the first patch, to avoid
> introducing the issue just to fix it a few patches down the series.
> 
> You should however add a note about that in the commit log of the first
> patch, of course, to explain why the overwrite ifnra is inserted after
> the .la tweaks.
> 
> So, I agree with the explanations, which make sense, but I disagree that
> it should be a separate patch...
> 

Well, I have seen this when I created the patches.
I kept them separate because on the first patch, I introduced the tool
to check the overwrites and i would like it to take its snapshot as soon
as possible in the build sequence (ie right after collecting dependencies
files and taking snapshots for current package statistics).
Then I fixed the issue seen by the overwrites detection and I put at the
same level fixing host-e2fsprogs, fixing .la files or a bit later fixing
python with one patch per fix to detail (or try to detail) the issue and
the way I fixed it.

Squashing the 2 patches leads to one patch that introduces the tool and
fixes one of the issues detected by the tool. What about the others issues
detected ? Squash also together with the first patch ? I think it will
produce a huge patch quite complicate to understand even with all individual
commit message squashed.

However, that being said, I can squash this patch (Fix .la files overwrite
detection) with the 1st one (detect files overwritten in TARGET_DIR and
HOST_DIR) if you still think it will be better.

Regards,
Herv? Codina

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
