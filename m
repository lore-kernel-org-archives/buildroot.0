From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Aug 2015 10:17:40 +0200
Subject: [Buildroot] [PATCH 1/1] Fix Image name not configurable (issue
 #28).
In-Reply-To: <20150831093214.6ae89b8a@free-electrons.com>
References: <1440842823-1283-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-2-git-send-email-mc5686@mclink.it>
 <20150829115935.GC4857@free.fr> <55E1DDB9.6040101@mclink.it>
 <20150831093214.6ae89b8a@free-electrons.com>
Message-ID: <20150831081740.GA3596@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mauro, Thomas, All,

On 2015-08-31 09:32 +0200, Thomas Petazzoni spake thusly:
> On Sat, 29 Aug 2015 18:28:41 +0200, Mauro Condarelli wrote:
> > After the previous discussion on IRC I came up with this very different patch which does not touch the upstream package at all (even though I still think allowing user to chose isn't evil).
> > Before I try to submit it I would like a comment.
> > The aim is to force the booted image name according to requested kernel target if (and only if) user contextually requests the image to be installed.
> > Obvious downside is user has no feedback of the change (and I don't know how to provide this feedback).
> > Would this be more acceptable?
> > 
> > diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
> > index fa67ea6..ccb5e95 100644
> > --- a/boot/at91bootstrap3/at91bootstrap3.mk
> > +++ b/boot/at91bootstrap3/at91bootstrap3.mk
> > @@ -40,6 +40,23 @@ define AT91BOOTSTRAP3_INSTALL_IMAGES_CMDS
> >          cp $(@D)/binaries/*.bin $(BINARIES_DIR)
> >   endef
> > +ifeq ($(BR2_LINUX_KERNEL_INSTALL_TARGET),y)
> > +define AT91BOOTSTRAP3_KCONFIG_FIXUP_CMDS
> > +       $(if $(BR2_LINUX_KERNEL_UIMAGE),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,"uImage",$(@D)/.config))
> > +       $(if $(BR2_LINUX_KERNEL_APPENDED_UIMAGE),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,"uImage",$(@D)/.config))
> > +       $(if $(BR2_LINUX_KERNEL_ZIMAGE),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,"zImage",$(@D)/.config))
> > +       $(if $(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,"zImage",$(@D)/.config))
> > +       $(if $(BR2_LINUX_KERNEL_VMLINUX),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,"vmlinux",$(@D)/.config))
> > +       $(if $(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),
> > +               $(call KCONFIG_SET_OPT,CONFIG_IMAGE_NAME,$(BR2_LINUX_KERNEL_IMAGE_NAME),$(@D)/.config))
> > +endef
> > +endif
> 
> I think this is not correct because it assumes you want to boot the
> Linux kernel directly from ATBootstrap, while many people usually do
> AT91Bootstrap -> another bootloader (U-Boot or Barebox) -> Linux kernel.

Besides, this is changing an option that is not user-configurable, so
its lifetime in the .config is not guaranteed. I.e. if the buildsystem
of at01bootstrap3 would do an "oldconfig" on it, it would get lost
(well, at least that's the case on their master branch).

Please, get the matter with upstream and see what they think.

When upstream has agreed on a "fix", *then* we can see at backporting it
until they do a new release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
