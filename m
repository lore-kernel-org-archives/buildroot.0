From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 21 May 2018 09:07:56 +0300
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <20180519124412.5d533cf9@windsurf>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 <20180519124412.5d533cf9@windsurf>
Message-ID: <20180521060756.3r5e7zspbpvxfjjn@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, May 19, 2018 at 12:44:12PM +0200, Thomas Petazzoni wrote:
> On Fri, 18 May 2018 14:31:56 +0300, Baruch Siach wrote:
> > We only need the host package for the rpcgen utility. glibc deprecated
> > this utility in version 2.26. Fedora has recently removed rpcgen from
> > its glibc package. So we need to build the rpcgen from the nfs-utils
> > package.
> > 
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> I've done some testing. First, this package needs host-pkgconf in
> HOST_NFS_UTILS_DEPENDENCIES, because the configure.ac script uses
> autoconf macros from pkgconfig.m4. With this fixed, host-nfs-utils
> builds fine on my system (Fedora 27).
> 
> However, it doesn't build on Fedora 28, because the <rpc/types.h>
> header is not available. If this one gets fixed by using a local copy
> of <rpc/types.h>, then the build fails for <rpc/rpc.h>, etc.
> 
> So in fact on Fedora 28, not only rpcgen is not provided, but also the
> RPC headers are not provided.
> 
> Do you have an idea on how to address this ? Do we need to build
> host-libtirpc ?

I'll take a look.

If we need host-libtirpc we would not be able to remove the rpcgen patch since 
that would create a circular dependency.

Why do we actually need rpcgen in libtirpc?

> If you don't have a Fedora 28 system at hand, you can easily create a
> Docker container with Fedora 28 installed.

Thanks for the tip.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
