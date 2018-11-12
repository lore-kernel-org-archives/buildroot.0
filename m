From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 18:44:58 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Add common rootfs dependencies to
 PACKAGES
In-Reply-To: <aedf0524-07eb-5e4d-8309-a97eea515058@mind.be>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-2-anaumann@ultratronik.de>
 <f91c9608-9c78-222a-fc88-232e7a4b639a@mind.be>
 <7c555849-2594-6776-4a40-2a4e416ab914@andin.de>
 <20181112164610.GE10271@scaer>
 <aedf0524-07eb-5e4d-8309-a97eea515058@mind.be>
Message-ID: <20181112174458.GF10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-11-12 18:32 +0100, Arnout Vandecappelle spake thusly:
> On 12/11/2018 17:46, Yann E. MORIN wrote:
> > Andreas, All,
> > 
> > On 2018-11-12 13:53 +0100, Andreas Naumann spake thusly:
> >> Am 09.11.18 um 23:11 schrieb Arnout Vandecappelle:
> >>> On 08/11/2018 14:04, Andreas Naumann wrote:
> >> ...
> >>>> +PACKAGES += $(ROOTFS_COMMON_DEPENDENCIES)
> >>>
> >>>  I don't really like this, for the simple reason that it will enable the
> >>> dependencies even if they are not needed because we're not building any rootfs.
> >>
> >> good point, I dont like that either. I'd propose to change/move the patch
> >> into something like
> >>   PACKAGES += $$(filter-out $$(PACKAGES),$$(ROOTFS_COMMON_DEPENDENCIES))
> >> inside the rootfs-conditional clause at the bottom of fs/common.mk. Actually
> >> I'm not sure the filter-out stuff is really needed since duplicate targets
> >> may accumulate in PACKAGES anyway.
> > 
> > Yes, that would be OK to moce them to the per-filesystem macro, but we
> > already have:
> > 
> >     ROOTFS_$(2)_DEPENDENCIES += rootfs-common
> > 
> > So maybe just do:
> > 
> >     ROOTFS_$(2)_DEPENDENCIES += \
> >         rootfs-common \
> >         $$(ROOTFS_COMMON_DEPENDENCIES)
> 
>  It's about adding to PACKAGES, not _DEPENDENCIES.

Yeah, but _DEPENDENCIES are added to PACKAGES.

And I think with the series I just posted [0]. there is no reason to
have dependencies in the common step anymore, since there are now only
calls to 'cat' and 'printf' in there. So it makes sense to make those
dependencies, dependencies of each individual filesystem now.

Regards,
Yann E. MORIN.

> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>>
> >>>  It's a small thing though, and working around it is a lot more complicated (you
> >>> could e.g. select a new Config.in symbol that is selected by all the rootfses).
> >>> And when we ever get the Config.in.host for all host packages, it's solved
> >>> already. So
> >>>
> >>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >>>
> >>>  Regards,
> >>>  Arnout
> >>>
> >>>>  $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
> >>>>  $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
> >>>>
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot at busybox.net
> >>> http://lists.busybox.net/mailman/listinfo/buildroot
> >>>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> > 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
