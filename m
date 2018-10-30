From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Oct 2018 22:14:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/opengl/libgbm: new virtual
 package
In-Reply-To: <20180913194410.24077-1-bernd.kuhls@t-online.de>
References: <20180913194410.24077-1-bernd.kuhls@t-online.de>
Message-ID: <20181030221420.65c7aed3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

+in Cc, Einar (for ti-sgx-libgbm), Maxime Ripard (for
sunxi-mali-mainline) and Paul Kocialkowski (general libgbm knowledge)

On Thu, 13 Sep 2018 21:44:09 +0200, Bernd Kuhls wrote:
> Kodi 18.0-Leia will implement stand-alone gbm support alongside x11 &
> wayland.  To enable building libgbm in mesa3d without x11 & wayland we
> need to create a virtual package for libgbm.
> 
> Also other packages besides mesa3d may provide libgbm.so, see
> http://patchwork.ozlabs.org/patch/647235/
> http://patchwork.ozlabs.org/patch/939703/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

During the Buildroot Developers meeting and last week, I worked on the
libgbm virtual package, in order to hopefully be able to merge the
patches from Bernd
(https://patchwork.ozlabs.org/project/buildroot/list/?series=65595)
and Einar
(https://patchwork.ozlabs.org/project/buildroot/list/?series=53824).

Unfortunately, it seems like the "libgbm" API is not very well
defined, and each OpenGL implementation has a different view of what
libgbm is. I am wondering how users of libgbm can work with such a
situation.

I have put together at
https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=gbm a
branch that gathers Bernd and Einar patches, plus some additional
fixes on top, and three demo defconfigs. My goal was to be able to:

 - build kmscube with Mesa3D as libgbm provider (this is already
   possible)
 - build kmscube with TI SGX as libgbm provider
 - build kmscube with Sunxi Mali as libgbm provider

It turns out that while kmscube with Mesa3D builds (obviously),
neither kmscube with TI SGX or Sunxi Mali build properly:

 - TI SGX libgbm is named libgbm.so.2, while other libgbm
   implementations, including the one in Mesa3D is named
   libgbm.so.1. Not a big issue by itself, but it hints at the two
   things being different.

   Anyway, it fails to build because the libgbm API is not what
   kmscube expects: http://code.bulix.org/cot991-494068

 - With Sunxi Mali, same issue, it fails to build with libgbm API
   issues: http://code.bulix.org/rulyvo-494069

So I'm really wondering if libgbm has a proper standardized API like
OpenGL has. Another hint is that the recent version of kmscube now
require gbm >= 13.0, and 13.0 is basically a Mesa3D version.

Anybody has some hints/ideas about this ?

How is the libgbm from TI SGX or Sunxi Mali being used ? What will
build against it ?

Best regards,

Thomas

-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
