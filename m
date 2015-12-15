From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Dec 2015 18:31:17 +0100
Subject: [Buildroot] [PATCH] linux: Build and install kernel selftests
In-Reply-To: <20151215063752.GK2318@tarshish>
References: <1448409222-4510-1-git-send-email-cyrilbur@gmail.com>
 <1448409222-4510-2-git-send-email-cyrilbur@gmail.com>
 <20151214221846.GD4152@free.fr> <20151215063752.GK2318@tarshish>
Message-ID: <20151215173117.GA3596@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, Cyril, All,

On 2015-12-15 08:37 +0200, Baruch Siach spake thusly:
> On Mon, Dec 14, 2015 at 11:18:46PM +0100, Yann E. MORIN wrote:
> > On 2015-11-25 10:53 +1100, Cyril Bur spake thusly:
> > > +config BR2_LINUX_KERNEL_TOOL_SELFTESTS
> > > +	bool "selftests"
> > 
> > Since the .mk has:
> >     SELFTESTS_DEPENDENCIES = bash
> > 
> > then you must either depend on bash or select it here. I think a select
> > is better, so:
> > 
> >     depends on BR2_USE_MMU  # bash
> >     select BR2_PACKAGE_BASH
> 
> But BR2_PACKAGE_BASH depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.

Gah... I missed that... Thanks for spotting! :-)

> Should 
> BR2_LINUX_KERNEL_TOOL_SELFTESTS also depend on 
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS?

Yes. With a comment stating so, like:

    config BR2_LINUX_KERNEL_TOOL_SELFTESTS
        bool "selftests"
        depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
        depends on BR2_USE_MMU  # bash
        select BR2_PACKAGE_BASH

    comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
        depends on !BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

(not so nice, but we already have it for openvmtools.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
