From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 4 Nov 2016 07:22:44 +0200
Subject: [Buildroot] musl with kernel headers (was: [PATCH] bridge-utils:
 fix build with musl)
In-Reply-To: <20161103224656.1e6466a6@free-electrons.com>
References: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
 <20161103224656.1e6466a6@free-electrons.com>
Message-ID: <20161104052244.c2qswgkglbwcod3a@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 03, 2016 at 10:46:56PM +0100, Thomas Petazzoni wrote:
> > In a discussion of this issue on the musl list last year Rich Felker
> > suggested[1] the following hack for fixing the widespread musl issue with
> > packages using kernel headers:
> > 
> >  --- usr/include/linux/libc-compat.h-orig	2016-11-03 07:25:09.853807823 +0200
> >  +++ usr/include/linux/libc-compat.h	2016-11-03 07:25:49.602834223 +0200
> >  @@ -49,7 +49,7 @@
> >   #define _LIBC_COMPAT_H
> > 
> >   /* We have included glibc headers... */
> >  -#if defined(__GLIBC__)
> >  +#if 1
> > 
> >   /* Coordinate with glibc net/if.h header. */
> >   #if defined(_NET_IF_H) && defined(__USE_MISC)
> > 
> > I verified that it fixes this build failure. What do you think of that as a
> > temporary measure until musl finds a better solution[2]?
> 
> Yes, we probably need to do something like that. I'm sick of all the
> patches we need to fix this structure redefinition mess, so if we have
> a global solution, it would be nice. I guess it needs to be applied in
> both the linux-headers package and the toolchain-external package.

I was thinking if a sed call in TOOLCHAIN_TARGET_FINALIZE_HOOKS to simplify 
the hack. Would that work?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
