From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 6 Dec 2013 17:56:14 +0100
Subject: [Buildroot] [PATCH 3/3] package/parted: add a host variant
In-Reply-To: <20131206104811.49d81180@skate>
References: <cover.1386023329.git.yann.morin.1998@free.fr>
 <1891fdbc7ad11ce084f2be315871eb10573953b7.1386023329.git.yann.morin.1998@free.fr>
 <20131206104811.49d81180@skate>
Message-ID: <20131206165614.GB3364@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-06 10:48 +0100, Thomas Petazzoni spake thusly:
> On Mon,  2 Dec 2013 23:29:57 +0100, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Usefull for for-build scripts to call parted, eg. to generate
> 
> Useful. See http://en.wiktionary.org/wiki/usefull.
> 
> > partition tables and such automatically.
> > 
> > Since the primary gaool is to use parted within scripts, we
> 
> goal
> 
> > do not need readline, so it is forcibly disabled.
> > 
> 
> >  PARTED_DEPENDENCIES = readline util-linux lvm2
> > +HOST_PARTED_DEPENDENCIES = host-util-linux host-lvm2
> 
> Do we really want the lvm2 dependency? It can be avoided by passing
> --disable-device-mapper.

I think we want the same dependency the target parted has. If the target
parted can handle lvm2 volumes, then we may have to generate them in the
first place.

So, what about:

# If target-parted can handle lvm volumes, then host-parted
# should be, too, so as to be able to generate them.
# If target-parted can't handle lvm volumes, there is no reason
# for host-aprted to handle them.
ifeq ($(BR2_PACKAGE_LVM2),y)
PARTED_DEPENDENCIES += lvm2
HOST_PARTED_DEPENDENCIES += lvm2
PARTED_CONF_OPT += --enable-device-mapper
HOST_PARTED_CONF_OPT += --enable-device-mapper
else
PARTED_CONF_OPT += --disable-device-mapper
HOST_PARTED_CONF_OPT += --disable-device-mapper
endif

But see further thoughts below...

> >  PARTED_INSTALL_STAGING = YES
> >  PARTED_LICENSE = GPLv3+
> >  PARTED_LICENSE_FILES = COPYING
> >  
> > +HOST_PARTED_CONF_OPT += --without-readline
> > +
> >  $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> 
> So maybe something like:
> 
> PARTED_DEPENDENCIES = util-linux
> 
> ifeq ($(BR2_PACKAGE_READLINE),y)
> PARTED_DEPENDENCIES += readline
> PARTED_CONF_OPT += --with-readline
> else
> PARTED_CONF_OPT += --without-readline
> endif
> 
> ifeq ($(BR2_PACKAGE_LVM2),y)
> PARTED_DEPENDENCIES += lvm2
> PARTED_CONF_OPT += --enable-device-mapper
> else
> PARTED_CONF_OPT += --disable-device-mapper
> endif
> 
> HOST_PARTED_DEPENDENCIES = host-util-linux
> HOST_PARTED_CONF_OPT = \
> 	--without-readline \
> 	--disable-device-mapper
> 
> In the host variant of parted, lvm2 support is never enabled, as I
> believe it's pretty unlikely that lvm2 support will be needed to
> generate disk images. This would make PATCH 2/3 of your series
> unnecessary, of course.

I don't think we should not be able to generate lvm volumes. I can see
at least a few cases where it would be needed.

Of course, we may just add host-parted without lvm support right now,
and add it later when the need really arises.

Thanks for the review; v2 on its way later tonight.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
