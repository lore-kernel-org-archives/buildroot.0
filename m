From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Jun 2014 18:54:35 +0200
Subject: [Buildroot] [PATCH 1/1] WIP: libudev: New package
In-Reply-To: <XnsA349BBF97D340berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
 <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
 <20140526211909.GA13529@free.fr>
 <1uhd5bxpm4.ln2@ID-313208.user.individual.net>
 <20140527171915.GB3503@free.fr>
 <XnsA349BBF97D340berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140611165435.GB3472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-11 18:28 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140527171915.GB3503 at free.fr: 
> 
> > Bernd, All,
> > 
> > On 2014-05-27 06:46 +0200, Bernd Kuhls spake thusly:
> >> I think we need to distinguish between the need for a daemon managing
> >> /dev and libudev. Currently a lot of packages depend on
> >> BR2_PACKAGE_HAS_UDEV although libudev should be enough for them. For
> >> libcec & xbmc I can confirm this for sure, I suppose this is also valid
> >> for mesa3d, maybe others. 
> > 
> > Well, the concept behind this single "depends on !HAS_UDEV" is that
> > udev-providing packages surely install a libudev.so, no?
> > 
> > Thus, there is no point in building libudev if we already have a
> > udev-providing package. Unless I'm misled.
> 
> Hi,
> 
> ok, so we stick to "depends on BR2_PACKAGE_HAS_UDEV", even if the eudev 

No, it's the opposite: depends on ! BR2_PACKAGE_HAS_UDEV

I.e., do not present libudev in the menuconfig if we already have either
systemd or eudev.

But since we want your libudev package to be merged with the eudev
package, we'll have to come with some tricks...

> package only builds libudev, this is something I am working on atm. Mesa3d 
> already links to this libudev, I have yet to conduct runtime testing.
> 
> My current approach is to create a new option BR2_PACKAGE_EUDEV_DAEMON, 
> default y for backward-compatability, which builds the eudev package like it 
> is possible now. Having this option disabled will only build libudev. I am 
> not sure if this is the right way Kconfig-wise, any suggestions?

I'll have a look at it tonight (UTC+2).

> Also I would like to propose changing the comment "xy needs udev /dev 
> management" to something more correct because libudev does not manage /dev, 
> it only reads it.
> 
> If a package really needs an udev daemon its dependency should then be 
> changed.

Not sure. I think we should keep _HAS_UDEV as-is, to mean "has a udev
daemon", and had a new virtual package _HAS_LIBUDEV which means "has a
libudev, but maybe not a daemon", and have the virtual package udev be a
provider of libudev.

I'll see what I can come up with.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
