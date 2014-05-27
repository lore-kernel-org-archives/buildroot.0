From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 May 2014 19:19:15 +0200
Subject: [Buildroot] [PATCH 1/1] WIP: libudev: New package
In-Reply-To: <1uhd5bxpm4.ln2@ID-313208.user.individual.net>
References: <1401129061-25216-1-git-send-email-bernd.kuhls@t-online.de>
 <1401129061-25216-2-git-send-email-bernd.kuhls@t-online.de>
 <20140526211909.GA13529@free.fr>
 <1uhd5bxpm4.ln2@ID-313208.user.individual.net>
Message-ID: <20140527171915.GB3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-27 06:46 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:20140526211909.GA13529 at free.fr: 
> 
> >> +     depends on !BR2_INIT_SYSTEMD
> >> +     depends on !BR2_PACKAGE_EUDEV
> > 
> > Maybe replace those two 'depends on' with simply:
> > 
> >     depends on !BR2_PACKAGE_HAS_UDEV
> 
> I think we need to distinguish between the need for a daemon managing /dev 
> and libudev. Currently a lot of packages depend on BR2_PACKAGE_HAS_UDEV 
> although libudev should be enough for them. For libcec & xbmc I can confirm 
> this for sure, I suppose this is also valid for mesa3d, maybe others.

Well, the concept behind this single "depends on !HAS_UDEV" is that
udev-providing packages surely install a libudev.so, no?

Thus, there is no point in building libudev if we already have a
udev-providing package. Unless I'm misled.

> Libcec, for example, needs a patch like this for configure.ac though:
> 
> -    REQUIRES="$REQUIRES udev"
> +    REQUIRES="$REQUIRES libudev"
> 
> As several packages (systemd, eudev, libudev) can provide libudev we should 
> add a new provider BR2_PACKAGE_HAS_LIBUDEV and let xbmc, libcec, mesa, ... 
> depend on it instead of BR2_PACKAGE_HAS_UDEV. With this change in place 
> adding your suggestion makes sense.
> 
> What do you think?

I'm not sure about adding a new virtual package 'HAS_LIBUDEV'...
Further thinking is needed...

> >> +LIBUDEV_VERSION = v1.6
> >> +LIBUDEV_SITE = $(call github,gentoo,eudev,$(LIBUDEV_VERSION))
> >> +LIBUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
> >> +LIBUDEV_LICENSE_FILES = COPYING
> > 
> > I was wondering if we could somehow keep this in sync with the eudev
> > package, to avoid duplicating the versions, so we can bump both in a
> > single change.
> 
> My plan is to merge libudev to the eudev package, a bump patch for eudev 
> v1.6 was already posted by sagaert.

Yes, that would be nice.

> >> +     --disable-introspection \
> > 
> > Would it be possible to build the library with introspection?
> > That would require adding gobject-introspection, though...
> > But I'm not too fluent in udev itself, so I won;t complain! ;-)
> 
> I?ll have a look.

Just a random thought, no worry! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
