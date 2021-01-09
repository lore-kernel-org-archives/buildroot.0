From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 9 Jan 2021 23:51:11 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/casync: new package
In-Reply-To: <n6VbI4j9Y5f6LOECnjTyiq5_T7Z6HLi9MqC2RzalYw5LnZaE3N1MYSl1KOxoRaAr_iF6idqMaAZdUXtFajUAsonz3wbK72B6hW4-L6Fu2So=@protonmail.com>
References: <-L4OoHbI_s2GypxkG9mFgazGU5zBSrAAbDJZ8-Z4fV4jx0pA4UFDZgnIAi8Jjovzv_ody4LtOlfNmnZ8evA-5BlsbQoa5goxcwgc3zOALIU=@protonmail.com>
 <20210107111303.17d64eec@windsurf.home>
 <n6VbI4j9Y5f6LOECnjTyiq5_T7Z6HLi9MqC2RzalYw5LnZaE3N1MYSl1KOxoRaAr_iF6idqMaAZdUXtFajUAsonz3wbK72B6hW4-L6Fu2So=@protonmail.com>
Message-ID: <20210109225111.GJ3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yair, All,

On 2021-01-07 14:23 +0000, Yair Ben-Avraham via buildroot spake thusly:
> I tried without xz, build failed, details below:
> 
> ./casync.config:
> BR2_PACKAGE_ACL=y
> BR2_PACKAGE_LIBCURL=y
> BR2_PACKAGE_OPENSSL=y
> 
> ./package/casync/casync.mk:
> CASYNC_DEPENDENCIES = acl libcurl openssl
> ...
> ifeq ($(BR2_PACKAGE_XZ),y)
> CASYNC_DEPENDENCIES += xz
> CASYNC_CONF_OPTS += -Dliblzma=enabled
> else
> CASYNC_CONF_OPTS += -Dliblzma=disabled
> endif
> ...
> 
> br-arm-cortex-a9-glibc/logfile:
> ../src/castore.c:5:10: fatal error: lzma.h: No such file or directory
>     5 | #include <lzma.h>
>       |          ^~~~~~~~
> compilation terminated.
> 
> In addition, in file ./src/castore.c , include <lzma.h> is not under if HAVE_LIBLZMA block, see counterexample inside ./src/compressor.h
> 
> So it's either adding xz to the dependencies or include <lzma.h> under if condition and try to build. What is better?

The proper solution, IMHO, would be to fix ./src/castore.c. AFAICS,
lzma.h is not needed from src/castore.c.

If that is indeed true, then patch it out, and send the patch upstream.

Afterall, upstream has an option to enable/disable use of liblzma, so
they do expect the build to succeed without it, I would wager.

Regards,
Yann E. MORIN.

> Yair
> --
> Yair Ben-Avraham
> yairba at protonmail.com
> +31.6.1316.5535
> 
> ??????? Original Message ???????
> On Thursday, January 7, 2021 11:13 AM, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > Hello,
> >
> > Thanks for the new iteration!
> >
> > On Thu, 07 Jan 2021 07:12:57 +0000
> > Yair Ben-Avraham via buildroot buildroot at busybox.net wrote:
> >
> > > -   depends on BR2_PACKAGE_HAS_UDEV
> >
> > udev is not a mandatory dependency.
> >
> > > +CASYNC_VERSION = 4ad9bcb94bc83ff36cfc65515107ea06a88c2dfc
> > > +CASYNC_SITE = $(call github,systemd,casync,$(CASYNC_VERSION))
> > > +CASYNC_LICENSE = LGPL-2.1+
> > > +CASYNC_LICENSE_FILES = LICENSE.LGPL2.1
> > > +# xz is mandatory because of ./src/castore.c:5:10: #include <lzma.h>
> > > +CASYNC_DEPENDENCIES = acl libcurl openssl xz
> >
> > This seems odd, Ithink I got it to build without xz. Did you pass
> > the right -D option ?
> >
> > Other than those two questions, looks good to me!
> >
> > Thomas
> >
> > -----------------------------------------------------------------------------------------------------------------------------------------------------
> >
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> 
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
