From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 12:44:12 +0200
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
Message-ID: <20180519124412.5d533cf9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 18 May 2018 14:31:56 +0300, Baruch Siach wrote:
> We only need the host package for the rpcgen utility. glibc deprecated
> this utility in version 2.26. Fedora has recently removed rpcgen from
> its glibc package. So we need to build the rpcgen from the nfs-utils
> package.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I've done some testing. First, this package needs host-pkgconf in
HOST_NFS_UTILS_DEPENDENCIES, because the configure.ac script uses
autoconf macros from pkgconfig.m4. With this fixed, host-nfs-utils
builds fine on my system (Fedora 27).

However, it doesn't build on Fedora 28, because the <rpc/types.h>
header is not available. If this one gets fixed by using a local copy
of <rpc/types.h>, then the build fails for <rpc/rpc.h>, etc.

So in fact on Fedora 28, not only rpcgen is not provided, but also the
RPC headers are not provided.

Do you have an idea on how to address this ? Do we need to build
host-libtirpc ?

If you don't have a Fedora 28 system at hand, you can easily create a
Docker container with Fedora 28 installed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
