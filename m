From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 16:57:51 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <20150606090148.GA3581@free.fr>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605205841.GB3641@free.fr>
 <20150606024203.6651cc1a@free-electrons.com>
 <20150606090148.GA3581@free.fr>
Message-ID: <20150606165751.6397dc6e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Jun 2015 11:01:48 +0200, Yann E. MORIN wrote:

> Well, sorry, I was not completely explicit. What I meant was:
> 
>     ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
>     define ROOTFS_ISO9660_SPLASHSCREEN
>         $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
>             $(ISO9660_TARGET_DIR)/splash.xpm.gz
>     endef
>     else
>     define ROOTFS_ISO9660_SPLASHSCREEN
>         $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
>     endef
>     endif

Yes, but no.

The $(SED) '/^splashimage/d' case needs to be done in all cases if
BR2_TARGET_GRUB_SPLASH is disabled (regardless whether we're using
initrd/initramfs or a real iso9660 for the rootfs).

However, the $(INSTALL) needs to be done only if
BR2_TARGET_GRUB_SPLASH=y *and* we are using an initrd/initramfs, not if
we are using directly the rootfs in the iso9660 filesystem. So this
part only needs to be done if BR2_TARGET_GRUB_SPLASH=y *and*
ROOTFS_ISO9660_USE_INITRD=YES.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
