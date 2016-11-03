From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:46:56 +0100
Subject: [Buildroot] [PATCH] bridge-utils: fix build with musl
In-Reply-To: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
References: <0b4d1e33355f00f915768a2bc3f5c4d997206731.1478152430.git.baruch@tkos.co.il>
Message-ID: <20161103224656.1e6466a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 07:53:50 +0200, Baruch Siach wrote:
> Apply a patch that removes direct include of kernel headers to avoid conflict
> of definitions.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4aa/4aaeca4f1fca1794b039d7255a1828ff724f2234/
> http://autobuild.buildroot.net/results/b48/b48a70137a4a568b31337f899fd21d05552db5e2/
> http://autobuild.buildroot.net/results/bff/bff5767fc7e821a7674ee022111db84e4a9449d0/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied, thanks!

> In a discussion of this issue on the musl list last year Rich Felker
> suggested[1] the following hack for fixing the widespread musl issue with
> packages using kernel headers:
> 
>  --- usr/include/linux/libc-compat.h-orig	2016-11-03 07:25:09.853807823 +0200
>  +++ usr/include/linux/libc-compat.h	2016-11-03 07:25:49.602834223 +0200
>  @@ -49,7 +49,7 @@
>   #define _LIBC_COMPAT_H
> 
>   /* We have included glibc headers... */
>  -#if defined(__GLIBC__)
>  +#if 1
> 
>   /* Coordinate with glibc net/if.h header. */
>   #if defined(_NET_IF_H) && defined(__USE_MISC)
> 
> I verified that it fixes this build failure. What do you think of that as a
> temporary measure until musl finds a better solution[2]?

Yes, we probably need to do something like that. I'm sick of all the
patches we need to fix this structure redefinition mess, so if we have
a global solution, it would be nice. I guess it needs to be applied in
both the linux-headers package and the toolchain-external package.

I'm glad to see that musl is trying to find a better solution for this
problem. So far, every time I raised this issue, the answer was that:
"the kernel headers are broken", and apparently they can't easily be
fixed without breaking the user-space exposed definitions (and
therefore potentially break the build of userspace libs/apps).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
