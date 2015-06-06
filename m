From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2015 11:01:48 +0200
Subject: [Buildroot] [PATCH 02/12] fs/iso9660: convert to the filesystem
 infrastructure
In-Reply-To: <20150606024203.6651cc1a@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605205841.GB3641@free.fr>
 <20150606024203.6651cc1a@free-electrons.com>
Message-ID: <20150606090148.GA3581@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-06 02:42 +0200, Thomas Petazzoni spake thusly:
> On Fri, 5 Jun 2015 22:58:41 +0200, Yann E. MORIN wrote:
> 
> > >  ifeq ($(BR2_TARGET_GRUB_SPLASH),)
> > 
> > I know this was pre-existing code, but we usually prefer positive logic.
> > Do you think you might arrange to fix the logic in this test with
> > anotehr patch? ;-)
> 
> Isn't that already positive logic?
> 
> "if BR2_TARGET_GRUB_SPLASH is disabled"
> 
> The other solution is:
> 
> ifneq ($(BR2_TARGET_GRUB_SPLASH),y)
> 
> which is "if not BR2_TARGET_GRUB_SPLASH is enabled"
> 
> which looks worse.
> 
> Am I missing something?

Well, sorry, I was not completely explicit. What I meant was:

    ifeq ($(BR2_TARGET_GRUB_SPLASH),y)
    define ROOTFS_ISO9660_SPLASHSCREEN
        $(INSTALL) -D -m 0644 boot/grub/splash.xpm.gz \
            $(ISO9660_TARGET_DIR)/splash.xpm.gz
    endef
    else
    define ROOTFS_ISO9660_SPLASHSCREEN
        $(SED) '/^splashimage/d' $(ISO9660_TARGET_DIR)/boot/grub/menu.lst
    endef
    endif

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
