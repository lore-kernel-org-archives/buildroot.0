From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Sat, 6 Jan 2018 21:30:39 +0100
Subject: [Buildroot] [PATCH 2/2] nilfs-utils: fix build with static
 toolchains
In-Reply-To: <20180106154746.06464750@windsurf>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <1515060652-22472-2-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180106154746.06464750@windsurf>
Message-ID: <20180106203039.GA10338@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hello,
> 
> On Thu,  4 Jan 2018 11:10:52 +0100, Kurt Van Dijck wrote:
> > This commit adds a patch to respect the dependency libmount->libblkid->libuuid
> > properly in autoconf. This becomes necessary for static builds.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> Thanks for working on this! It looks a lot better. I have a few
> minor/comments, see below.
> 
> Also, could you submit this patch upstream?

Yep, that was my intent.
But I'd rather wait for the patch to be complete, consistent, stable,
so I'd wait for all your comments, and the results of the build
server...

> 
> > + # Check for conditional libraries and headers.
> > + if test "${with_libmount}" = "yes"; then
> > +-   AC_CHECK_LIB(mount, mnt_context_do_mount, [LIB_MOUNT="-lmount"],
> > ++   PKG_CHECK_MODULES([MOUNT], [mount],,
> > +    	AC_MSG_ERROR([Mount library is enabled but libmount not found]))
> 
> I believe you could drop entirely the AC_MSG_ERROR() message here.
> PKG_CHECK_MODULES([MOUNT], [mount]) already aborts with an error
> message if the "mount" pkg-config description cannot be found.

I see. I wasn't aware of that.
I'll adapt.
> 
> > + if test "${with_selinux}" = "yes"; then
> > +    AC_CHECK_LIB(selinux, getprevcon,
> > +@@ -125,15 +123,12 @@ fi
> > + AC_SUBST([LIB_SELINUX])
> > + 
> > + if test "${with_blkid}" = "yes"; then
> > +-   AC_CHECK_LIB(blkid, blkid_new_probe_from_filename,
> > ++   PKG_CHECK_MODULES([BLKID], [blkid],
> > +    		[AC_DEFINE(HAVE_LIBBLKID, 1,
> > + 		    [Define to 1 if you have the 'blkid' library (-lblkid).])
> > +-		 LIB_BLKID="-lblkid"
> > + 		],
> > + 		AC_MSG_ERROR([BLKID library not found]))
> 
> Ditto here.
> 
> > +diff --git a/sbin/mount/mount_libmount.c b/sbin/mount/mount_libmount.c
> > +index ef40e68..a7fec00 100644
> > +--- a/sbin/mount/mount_libmount.c
> > ++++ b/sbin/mount/mount_libmount.c
> > +@@ -67,9 +67,7 @@
> > + #include <syslog.h>
> > + #endif	/* HAVE_SYSLOG_H */
> > + 
> > +-#if HAVE_LIBMOUNT_LIBMOUNT_H
> > +-#include <libmount/libmount.h>
> > +-#endif	/* HAVE_LIBMOUNT_H */
> > ++#include <libmount.h>
> 
> So you're dropping the HAVE_LIBMOUNT_LIBMOUNT_H condition because this
> file is anyway only built when libmount support is enabled. Correct ?

Yep, that's the idea. Makefile.am reveals this.

> 
> > +diff --git a/sbin/mount/umount_libmount.c b/sbin/mount/umount_libmount.c
> > +index ae5a337..2987f5d 100644
> > +--- a/sbin/mount/umount_libmount.c
> > ++++ b/sbin/mount/umount_libmount.c
> > +@@ -59,9 +59,7 @@
> > + #include <syslog.h>
> > + #endif	/* HAVE_SYSLOG_H */
> > + 
> > +-#if HAVE_LIBMOUNT_LIBMOUNT_H
> > + #include <libmount/libmount.h>
> > +-#endif	/* HAVE_LIBMOUNT_H */
> 
> In the previous file, you change <libmount/libmount.h> to <libmount.h>,
> but not here. Why?

I changed to <libmount.h> because pkgconfig add -I/path/to/libmount
anyway. I didn't repeat that here because ... I forgot.

> 
> Could you fix those minor issues and send an updated version?

Yep. on my todo list.
Kurt
