From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 27 May 2018 16:34:50 +0200
Subject: [Buildroot] [PATCH 0/2] package/binutils+elf2flt: fix for noMMU
 targets
In-Reply-To: <cover.1527280948.git.yann.morin.1998@free.fr>
References: <cover.1527280948.git.yann.morin.1998@free.fr>
Message-ID: <db85fdbc-8767-4ada-bdab-872202ee5ce2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-05-18 22:42, Yann E. MORIN wrote:
> Hello All!
> 
> TL;DR: gcc gets confused by our symlinks trick that we use to fix the
> rpath handling. We replace symlinks with script wrappers instead.

 So maybe, instead of laying hacks upon hacks, we should go back to the drawing
board on the rpath handling? I would feel a lot more comfortable if we could
just fix fix-rpath instead of playing the whack-a-mole game of workarounds in
packages.

 I don't see a full solution yet, but basically I think that we should
- detect when an executable has multiple hardlinks;
- detect if it has already been "fixed" in this fix-rpath run;
- if so, clone the file before fixing it proper.

 The weak point is: if we clone, there may be some hardlinks that actually could
still be reused as hardlinks. So you'd have to detect them first.

 Alternatively we could consider that this is anyway only about the host tree,
which is normally the smallest of the three trees (when you exclude external
toolchain). So maybe we should just always clone for the host tree.


 I realize we're very close to the release, but I still think that always
cloning is probably the safest way to do it.

 Regards,
 Arnout

> 
> See the first commit for the whole story.
> 
> Fixes: #11031.
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit 2c57dc0469f7e32182932e5937f61f82b01a743a
> 
>   cjson: bump to version 1.7.7 (2018-05-25 16:22:11 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 59b3d35d7c805ebee29dc7185ea63e55aca768ca
> 
>   package/elf2flt: replace hard-links with script wrappers to fix rpath (2018-05-25 22:24:32 +0200)
> 
> 
> ----------------------------------------------------------------
> Yann E. MORIN (2):
>       package/binutils: switch from symlinks to script wrappers
>       package/elf2flt: replace hard-links with script wrappers to fix rpath
> 
>  package/binutils/binutils.mk |  9 ++++++---
>  package/elf2flt/elf2flt.mk   | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+), 3 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
