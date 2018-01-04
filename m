From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Thu, 4 Jan 2018 09:14:00 +0100
Subject: [Buildroot] [PATCH] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <20180103213359.10611a4e@windsurf.lan>
References: <1515010544-28357-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180103213359.10611a4e@windsurf.lan>
Message-ID: <20180104081400.GA18339@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hello,
> 
> On Wed,  3 Jan 2018 21:15:44 +0100, Kurt Van Dijck wrote:
> > This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> > properly in autoconf. This becomes necessary for static builds.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > ---
> >  ...nt-libblkid-fix-order-of-autoconf-probing.patch | 62 ++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch
> > 
> > diff --git a/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch b/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch
> > new file mode 100644
> > index 0000000..78b6902
> > --- /dev/null
> > +++ b/package/nilfs-utils/0004-libmount-libblkid-fix-order-of-autoconf-probing.patch
> > @@ -0,0 +1,62 @@
> > +From 94732d03c5361a9f8f9d0f018e0fd9850a2c7d29 Mon Sep 17 00:00:00 2001
> > +From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > +Date: Wed, 3 Jan 2018 20:38:15 +0100
> > +Subject: [PATCH] libmount, libblkid: fix order of autoconf probing
> > +
> > +make sure that libuuid is linked during probes.
> > +Since libmount depends on libblkid, probe libblkid first.
> > +This fixes autoprobing on systems that use static libraries exclusively
> > +
> > +Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > +---
> > + configure.ac | 26 +++++++++++++-------------
> > + 1 file changed, 13 insertions(+), 13 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 6fa8c41..50250d9 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -103,9 +103,20 @@ AC_CHECK_HEADERS([ctype.h err.h fcntl.h grp.h libintl.h limits.h \
> > + 		  time.h unistd.h])
> > + 
> > + # Check for conditional libraries and headers.
> > ++if test "${with_blkid}" = "yes"; then
> > ++   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
> > ++   		[AC_DEFINE(HAVE_LIBBLKID, 1,
> > ++		    [Define to 1 if you have the 'blkid' library (-lblkid).])
> > ++		 LIB_BLKID="-lblkid -luuid"
> > ++		],
> > ++		AC_MSG_ERROR([BLKID library not found]), [-luuid])
> > ++   AC_CHECK_HEADERS([blkid/blkid.h])
> > ++fi
> > ++AC_SUBST(LIB_BLKID)
> 
> Thanks for this patch. Unfortunately, this really isn't the most
> appropriate solution. The good solution for this is to use pkg-config,
> through the PKG_CHECK_MODULES() autoconf macro.
> 
> if test "${with_blkid}" = "yes"; then
> 	PKG_CHECK_MODULES([BLKID], [blkid])
> fi
> 
> and then use BLKID_LIBS in Makefile.am to link against libblkid.
> pkg-config automatically takes care of indirect dependencies when
> static linking:
> 
> $ ./output/host/bin/pkg-config --libs blkid
> -L./output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -lblkid -L./output/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib -luuid
> 
> Could you rework your patch accordingly ?

Ok, I'll rework.
Thanks for the feedback.

Kurt
