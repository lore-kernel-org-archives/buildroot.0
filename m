From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 May 2018 17:35:10 +0200
Subject: [Buildroot] [PATCH 0/2] package/binutils+elf2flt: fix for noMMU
 targets
In-Reply-To: <db85fdbc-8767-4ada-bdab-872202ee5ce2@mind.be>
References: <cover.1527280948.git.yann.morin.1998@free.fr>
 <db85fdbc-8767-4ada-bdab-872202ee5ce2@mind.be>
Message-ID: <20180527153510.GB2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-05-27 16:34 +0200, Arnout Vandecappelle spake thusly:
> On 25-05-18 22:42, Yann E. MORIN wrote:
> > Hello All!
> > 
> > TL;DR: gcc gets confused by our symlinks trick that we use to fix the
> > rpath handling. We replace symlinks with script wrappers instead.
> 
>  So maybe, instead of laying hacks upon hacks, we should go back to the drawing
> board on the rpath handling? I would feel a lot more comfortable if we could
> just fix fix-rpath instead of playing the whack-a-mole game of workarounds in
> packages.

Well, we're not really playing whack-a-mole, because the isue is only
about packages that install hardlinks in two locations, because of the
bin/TUPLE-foo and TUPLE/bin/foo "duplication".

The only ones doing such a thing AFAIK are binutils and elf2flt.

gcc installs hardlinks, but in the same directory. The tools it installs
in a TUPLE-named directory are not hardlinks.

>  I don't see a full solution yet, but basically I think that we should
> - detect when an executable has multiple hardlinks;
> - detect if it has already been "fixed" in this fix-rpath run;
> - if so, clone the file before fixing it proper.

What did you mean by "clone" in this context? Remove the hardlinks and
replace them by a copy of the file?

>  The weak point is: if we clone, there may be some hardlinks that actually could
> still be reused as hardlinks. So you'd have to detect them first.

Sorry, I don't follow you here. If we replaced hardlinks with actual
copies, how come we'd still have hardlinks?

>  Alternatively we could consider that this is anyway only about the host tree,
> which is normally the smallest of the three trees (when you exclude external
> toolchain). So maybe we should just always clone for the host tree.

I'm afraid that detecting hardlinks will not be cheap, even when we
exclude staging/ (which is a sub-dir of host/) from the search...

>  I realize we're very close to the release, but I still think that always
> cloning is probably the safest way to do it.

Do we envision other impacted packages? I don't think so. Really,
binutils and elf2flt really seem to be the only two packages impacted
by the problem.

That we missed the noMMU and elf2flt cases previously is just an
oversight on our part...

Then. if I am wrong, we're still talking about only two packages for
now, and they only break because of the ARC archtecture, for which we
use bleeding-edge tools that require we have libfl.so. Two. Single.
Packages. We've always refused to add infra when only very few packages
were impacted.

Or were you suggesting that we do not add infra, but we replace the
current two hacks (Thomas' symlinks or my script wrappers) by an actual
copy, still just for binutils and elf2flt? In which case we would not
loose time detecting hard-links in a generic way, obviously.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > See the first commit for the whole story.
> > 
> > Fixes: #11031.
> > 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > 
> > The following changes since commit 2c57dc0469f7e32182932e5937f61f82b01a743a
> > 
> >   cjson: bump to version 1.7.7 (2018-05-25 16:22:11 +0200)
> > 
> > 
> > are available in the git repository at:
> > 
> >   git://git.buildroot.org/~ymorin/git/buildroot.git
> > 
> > for you to fetch changes up to 59b3d35d7c805ebee29dc7185ea63e55aca768ca
> > 
> >   package/elf2flt: replace hard-links with script wrappers to fix rpath (2018-05-25 22:24:32 +0200)
> > 
> > 
> > ----------------------------------------------------------------
> > Yann E. MORIN (2):
> >       package/binutils: switch from symlinks to script wrappers
> >       package/elf2flt: replace hard-links with script wrappers to fix rpath
> > 
> >  package/binutils/binutils.mk |  9 ++++++---
> >  package/elf2flt/elf2flt.mk   | 17 +++++++++++++++++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
