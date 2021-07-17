From: Petr Vorel <petr.vorel@gmail.com>
Date: Sat, 17 Jul 2021 20:38:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: needs uuid
In-Reply-To: <CAPi7W8374pd7M0yWznR3iFSDbnGseaMND3Yg91djd0dgVyjJkw@mail.gmail.com>
References: <20210716210106.342232-1-fontaine.fabrice@gmail.com>
 <20210716230617.135b52e1@windsurf>
 <CAPi7W8374pd7M0yWznR3iFSDbnGseaMND3Yg91djd0dgVyjJkw@mail.gmail.com>
Message-ID: <YPMjv1WxI7zjUgMN@pevik>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

[Cc Steve and Neil]

> Le ven. 16 juil. 2021 ? 23:06, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> a ?crit :

> > On Fri, 16 Jul 2021 23:01:06 +0200
> > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > > Build of nfs-utils without uuid is broken since bump to version 2.5.4 in
> > > commit 0ce30de72fb303768c5865949b8ce9260d0c43f5 because of
> > > http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=c5528f40f9db5061e06dcf1f9b7fce5185b376c6

> > A bug should be reported upstream: the configure script should be
> > checking for the existence of libuuid, and not hardcode -luuid.

> > > -ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
> > > +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
> > >  NFS_UTILS_CONF_OPTS += --enable-uuid

> > Why do they still have a --enable-uuid / --disable-uuid option if uuid
> > is now mandatory anyway ?
> Despite its name, the "uuid" flag enables or disable blkid support:
>  168 AC_ARG_ENABLE(uuid,
>  169         [AC_HELP_STRING([--disable-uuid],
>  170                 [Exclude uuid support to avoid buggy libblkid.
> @<:@default=no@:>@])],
>  171         if test "$enableval" = "yes" ; then choose_blkid=yes;
> else choose_blkid=no; fi,
>  172         choose_blkid=default)
Yes I got confused by this as well. IMHO it'd be good to rename
--{enable,disable}-uuid to --{enable,disable}-blkid.

>  403 if test "$choose_blkid" != no; then
>  404    AC_CHECK_LIB(blkid, blkid_get_library_version,
> [LIBBLKID="-lblkid"], AC_MSG_ERROR([libblkid needed]))
>  405    AC_CHECK_HEADER(blkid/blkid.h, , AC_MSG_ERROR([Cannot find
> libblkid header file blkid/blkid.h]))
>  406    AC_BLKID_VERS
>  407    if test $choose_blkid = yes; then
>  408       use_blkid=1
>  409       test $libblkid_cv_is_recent = no && AC_MSG_WARN([libblkid
> is old and may cause mountd to leak memory])
>  410    else
>  411       if test $libblkid_cv_is_recent = yes
>  412       then use_blkid=1
>  413       else use_blkid=0
>  414            AC_MSG_WARN([uuid support disabled as libblkid is too old])
>  415       fi
>  416     fi
>  417     AC_DEFINE_UNQUOTED(USE_BLKID, $use_blkid, [Define if you want
> to use blkid to find uuid of filesystems])
>  418 fi

> > It feels like the change from upstream is not quite complete :-/
> I'm not an expert of nfs-utils so I have no strong opinion but they
> decided to hardcode -luuid for exportd and mountd and the commit
> message seems to indicate that this change is intentional.

That's how I understood it. IMHO buildroot should accept this fix.
@Steve: it might be worth next time to mention new dependency in release notes.

Kind regards,
Petr

> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> Best Regards,

> Fabrice
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
