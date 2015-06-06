From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 18:03:10 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <20150606165751.6397dc6e@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605205841.GB3641@free.fr>
 <20150606024203.6651cc1a@free-electrons.com>
 <20150606090148.GA3581@free.fr>
 <20150606165751.6397dc6e@free-electrons.com>
Message-ID: <20150606160310.GF3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-06 16:57 +0200, Thomas Petazzoni spake thusly:
> On Sat, 6 Jun 2015 11:01:48 +0200, Yann E. MORIN wrote:
> > Well, sorry, I was not completely explicit. What I meant was:
> > 
> >     ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
> >     define ROOTFS_ISO9660_SPLASHSCREEN
> >         $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
> >             $(ISO9660_TARGET_DIR)/splash.xpm.gz
> >     endef
> >     else
> >     define ROOTFS_ISO9660_SPLASHSCREEN
> >         $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
> >     endef
> >     endif
> 
> Yes, but no.
> 
> The $(SED) '/^splashimage/d' case needs to be done in all cases if
> BR2_TARGET_GRUB_SPLASH is disabled (regardless whether we're using
> initrd/initramfs or a real iso9660 for the rootfs).
> 
> However, the $(INSTALL) needs to be done only if
> BR2_TARGET_GRUB_SPLASH=y *and* we are using an initrd/initramfs, not if
> we are using directly the rootfs in the iso9660 filesystem. So this
> part only needs to be done if BR2_TARGET_GRUB_SPLASH=y *and*
> ROOTFS_ISO9660_USE_INITRD=YES.

Sorry, but we're speaking patch 2 here, so there is yet absolutely no
reference to the initrd/initramfs/direct rootfs stuff, which you're only
introducing much later in the series.

This patch is changing this code:

   21 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
   22     $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
   23 else
   24     $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
   25         $(ISO9660_TARGET_DIR)/splash.xpm.gz
   26 endif

into:

   12 ifeq ($(BR2_TARGET_GRUB_SPLASH),)
   13 define ROOTFS_ISO9660_SPLASHSCREEN
   14     $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
   15 endef
   16 else
   17 define ROOTFS_ISO9660_SPLASHSCREEN
   18     $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
   19         $(ISO9660_TARGET_DIR)/splash.xpm.gz
   20 endef
   21 endif

So, what I suggested above is exactly the *same* condition, but with the
'if' and 'else' clauses reversed:

   12 ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
   13 define ROOTFS_ISO9660_SPLASHSCREEN
   14     $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
   15         $(ISO9660_TARGET_DIR)/splash.xpm.gz
   16 endef
   17 else
   18 define ROOTFS_ISO9660_SPLASHSCREEN
   19     $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
   20 endef
   21 endif

See?

Now, what you said is true further in the series, and indeed does not
warrant changing the ordering of the 'if' and 'else' clauses, as that
would need to be switched again later.

And I maintain my ACK on this patch! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
