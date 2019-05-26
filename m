From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2019 17:04:37 +0200
Subject: [Buildroot] [PATCH v2 02/15] linux: disable Werror for powerpc
 kernels
In-Reply-To: <e29e98bf-5dc1-2ef8-fe06-5d4570ae1faa@mind.be>
References: <20190508150720.27946-1-romain.naour@gmail.com>
 <20190508150720.27946-3-romain.naour@gmail.com>
 <e29e98bf-5dc1-2ef8-fe06-5d4570ae1faa@mind.be>
Message-ID: <20190526150437.GJ12162@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-05-26 16:51 +0200, Arnout Vandecappelle spake thusly:
> On 08/05/2019 17:07, Romain Naour wrote:
[--SNIP--]
> > Werror is set by default while building ppc kernel [2], but
> > some warning can be introduced while building current kernel with
> > newer compiler (for example building kernel 4.19 with gcc 9.1).
> > 
> > For the same reason why we remove Werror in packages's compiler
> > flags. Building with Werror is not bulletproof when we start
> > using a newer compiler that introduce new warnings.
> > This is the case here.
>  Since buildroot is *also* intended for kernel developers, I don't think this is
> a good idea.

As I said on IRC, I disagree with this reasonning. Buildroot may *also*
be used by package developpers, so by your reasoning, we should never
remove -Werror from packages.

Yes, yes, I get it that the kernel is special, but still, see below...

>  In fact, I don't like us forcing any options on the user. All this overriding
> of .config options in linux.mk (and busybox.mk as well) is IMO confusing and
> limiting user's freedom. So I don't like it if .config overrides get added.

How is that different, for *this* case of -Werror, from passing
--disable-werror (or simmilar) like we do in a bunch of packages?

Do you suggest that instead of setting a .config option, we introduce a
post-patch hook that removes -Werror from the kernel's Makefile instead?

Also, do you argue that we should remove all our $(call KCONFIG_SET_OPT,...)
that we have "to make things just work and not puzzle the user"?

Regards,
Yann E. MORIN.

>  Therefore, I prefer your v1 solution of just fixing the affected defconfigs.
> 
>  Regards,
>  Arnout
> 
> > 
> > Instead of backporting this patch [1] to kernel 4.19, select
> > unconditionally the Kconfig option CONFIG_PPC_DISABLE_WERROR
> > that allow to disable Werror.
> > 
> > Fixes:
> > https://gitlab.com/kubu93/toolchains-builder/-/jobs/205435741
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=a6e60d84989fa0e91db7f236eda40453b0e44afa
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=ba55bd74360ea4b8b95e73ed79474d37ff482b36
> > [3] https://gitlab.com/bootlin/toolchains-builder
> > 
> > Fix-suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > ---
> > v2: add a shared fragment in board/fragments/linux and update
> >     qemu ppc* defconfigs. (Arnout)
> > 
> > v3: commit log (Yann)
> >     enable the option from linux.mk instead of the defconfig.
> > ---
> >  linux/linux.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index 51fd41fa15..85364451a8 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -315,6 +315,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
> >  	$(LINUX_FIXUP_CONFIG_ENDIANNESS)
> >  	$(if $(BR2_arm)$(BR2_armeb),
> >  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config))
> > +	$(if $(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),
> > +		$(call KCONFIG_ENABLE_OPT,CONFIG_PPC_DISABLE_WERROR,$(@D)/.config))
> >  	$(if $(BR2_TARGET_ROOTFS_CPIO),
> >  		$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_INITRD,$(@D)/.config))
> >  	# As the kernel gets compiled before root filesystems are
> > 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
