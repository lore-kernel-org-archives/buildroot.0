From: Pieter Smith <pieter@boesman.nl>
Date: Mon, 29 Feb 2016 08:47:07 +0100
Subject: [Buildroot] [v3,
	1/4] barebox: prepare for secondary config build
In-Reply-To: <20160228081204.GB4297@smipidev>
References: <1453329821-3167-1-git-send-email-pieter@boesman.nl>
 <1453329821-3167-2-git-send-email-pieter@boesman.nl>
 <56D0DCFB.8060601@mind.be> <20160228081204.GB4297@smipidev>
Message-ID: <20160229074707.GA17808@smipidev>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 28, 2016 at 09:12:04AM +0100, Pieter Smith wrote:
> On Sat, Feb 27, 2016 at 12:17:15AM +0100, Arnout Vandecappelle wrote:
> > On 01/20/16 23:43, Pieter Smith wrote:
> [snip] 
> >  I wonder if it wouldn't be possible to keep barebox.mk unchanged, and just add
> > at the end (after the kconfig-package):
> > 
> > include boot/barebox/barebox-2/barebox-2.mk
> > 
> >  That's not entirely similar to gcc, but it's more consistent with what it
> > means. You always have the barebox package, and you have an optional extra
> > barebox-2 package which is a kind of submodule of barebox. Note however that we
> > currently don't have this pattern at all, so it could be controversial. But I
> > think it will simplify the patch a lot, and also simplify the logic.
> > 
> >  So in that case, you'd have a first patch that adds the required refactorings
> > in barebox.mk so the same variables are useable for barebox-2, and a second
> > patch that adds barebox-2 (and patches 3 and 4 stay the same of course).
> 
> Yes. Thanks. A lot less messy. I started looking into this. It seems doable. It
> might be neater to still split a barebox-common.mk to avoid a long list of
> variable copies. Give me a day on this.
 
Thanks for the suggestion. It is shaping up nicely. There is one aspect that I
would appreciate input on: To all but completely eliminate duplication in the
makefiles for the two packages, I am wrapping all the current functionality in
boot/barebox/barebox.mk in a parameterized barebox-package function. E.g.:

  define barebox-package
  $(1)_VERSION = $$(call qstrip,$$(BR2_TARGET_BAREBOX_VERSION))
  ...
  $$(eval $$(kconfig-package))
  endef
  $(eval $(call barebox-package,BAREBOX))

And the whole of boot/barebox/barebox-2/barebox-2.mk becomes:

  $(eval $(call barebox-package,BAREBOX_2))

This however cannot avoid Config.in duplication, but the barebox-2 makefile
inherits all future barebox makefile improvements. The catch is that existing
barebox patches will have merge conflicts.

I already tied up with Yegor on the embedded custom environment patch-set,
which he is willing to rebase + solve the merge conflicts. We can then submit
the series with Yegor's patch and a barebox defconfig for the Beaglebone Black
as per your suggestion.

Do you think this is acceptable?

> >  This is complicated stuff, thanks for working on this, and sorry that it's
> > taking so long!
> > 
> >  Regards,
> >  Arnout
> > 
> > [snip]
> > 
> > -- 
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> - Pieter
- Pieter
