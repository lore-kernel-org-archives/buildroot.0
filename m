From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 5 Jan 2018 20:56:07 +0100
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: need NPTL threads
In-Reply-To: <20180104101927.oexxtwusya3wppyk@tarshish>
References: <1515060652-22472-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 <20180104101927.oexxtwusya3wppyk@tarshish>
Message-ID: <20180105195607.GC24055@airbook.vandijck-laurijssen.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

> On Thu, Jan 04, 2018 at 11:10:51AM +0100, Kurt Van Dijck wrote:
> > nilfs-utils use clock_nanosleep(), which comes with NPTL threads
> 
> What is your indication that this is the case? In the uClibc-ng config 
> UCLIBC_HAS_REALTIME is selected by both linuxthreads and NPTL. When 
> UCLIBC_HAS_REALTIME is enabled, UCLIBC_HAS_ADVANCED_REALTIME is also enabled 
> by default. UCLIBC_HAS_ADVANCED_REALTIME provides clock_nanosleep().
> 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> > ---
> >  package/nilfs-utils/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
> > index 0c6b7a0..9dda27c 100644
> > --- a/package/nilfs-utils/Config.in
> > +++ b/package/nilfs-utils/Config.in
> > @@ -1,6 +1,7 @@
> >  config BR2_PACKAGE_NILFS_UTILS
> >  	bool "nilfs-utils"
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
> > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
> 
> NPTL implies threads support, so the NPTL dependency alone is enough.
> 
> You also need to update the comment.
> 

IMHO, appending the comment 'sem_open()' to BR2_..._NPTL would only
cause confusion, since sem_open() does not depend on BR2_..._NPTL.

Given the recent discussion about clock_nanosleep not really depending
on BR2_..._NPTL, I suspect a change in the near future, so I hesitate to
remove the BR2_..._THREADS dependency.

How exactly is the current patch wrong?
KConfig resolves this, better than any of us would, so I see no
advantage in modifying the patch.

> >  	depends on BR2_USE_MMU # util-linux libmount, libblkid
> >  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> >  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID

Kind regards,
Kurt
