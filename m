From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Jul 2015 12:08:55 +0300
Subject: [Buildroot] [PATCHv2] core/pkg-generic: host variants inherits
 target's override-srcdir
In-Reply-To: <CAGduivw2ZpiUnn29WvTskPV9KD3YkjNu7+Nm5WCDcWwXgjLR_w@mail.gmail.com>
References: <1437311728-31289-1-git-send-email-yann.morin.1998@free.fr>
 <55AC0AD8.7040703@mind.be>
 <CAGduivw2ZpiUnn29WvTskPV9KD3YkjNu7+Nm5WCDcWwXgjLR_w@mail.gmail.com>
Message-ID: <20150720090854.GK13027@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Jul 20, 2015 at 10:48:33AM +0200, Maxime Hadjinlian wrote:
> Reviewed-and-tested-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

It seems patchwork doesn't recognize this combined tag. To make the patchwork 
R and T columns reflect your tag you'll have to add them in separate lines.

baruch

> On Sun, Jul 19, 2015 at 10:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> > On 07/19/15 15:15, Yann E. MORIN wrote:
> >> When a package has both a target and a host variants, and there is an
> >> override-srcdir set for the target variant, the host variant should
> >> inherit the target's override-srcdir, unless explicitly set, like we do
> >> for all other target-variant properties.
> >>
> >> However, do not override it if expressly set to empty (i.e. when the
> >> user wants to override only the target variant).
> >>
> >> Also, as we do for the other variables, the target variant never
> >> inherits from the host variant.
> >>
> >> Reported-by: Mike <mikez@OpenPlayer.org>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >> Cc: Arnout Vandecappelle <arnout@mind.be>
> >
> > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >
> >>
> >> ---
> >> Changes v1 -> v2:
> >>   - really do not override the host variant if expressly set to empty
> >>     (Arnout)
> >> ---
> >>  package/pkg-generic.mk | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> >> index 75dc8b7..6a7d97e 100644
> >> --- a/package/pkg-generic.mk
> >> +++ b/package/pkg-generic.mk
> >> @@ -340,6 +340,10 @@ else
> >>  endif
> >>  $(2)_VERSION := $$(call sanitize,$$($(2)_DL_VERSION))
> >>
> >> +ifdef $(3)_OVERRIDE_SRCDIR
> >> +  $(2)_OVERRIDE_SRCDIR ?= $$($(3)_OVERRIDE_SRCDIR)
> >> +endif
> >> +
> >>  $(2)_BASE_NAME       =  $(1)-$$($(2)_VERSION)
> >>  $(2)_DL_DIR  =  $$(DL_DIR)/$$($(2)_BASE_NAME)
> >>  $(2)_DIR     =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
