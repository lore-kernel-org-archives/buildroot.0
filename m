From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 16:11:47 +0200
Subject: [Buildroot] [PATCH v5 2/3] ti-gfx: add new package
In-Reply-To: <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-2-git-send-email-spenser@gillilanding.com>
Message-ID: <20130713161147.7ef19265@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 12 Jul 2013 09:34:37 -0500, Spenser Gilliland wrote:

> diff --git a/package/opengl/libegl/libegl.mk b/package/opengl/libegl/libegl.mk
> index bd8040d..00e1f19 100644
> --- a/package/opengl/libegl/libegl.mk
> +++ b/package/opengl/libegl/libegl.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
>  LIBEGL_DEPENDENCIES += rpi-userland
>  endif
>  
> +ifeq ($(BR2_PACKAGE_TI_GFX),y)
> +LIBEGL_DEPENDENCIES += ti-gfx
> +endif

No, if you have introduced the powervr virtual package, then libegl
should not directly depend on ti-gfx, but instead libegl should depend
on powervr, which itself will depend on ti-gfx.

Generally speaking, I think this introduction of the powervr virtual
package is a bit unfortunate for now. Your ti-gfx package was almost
ready for merging, and now it's no longer the case. We should stop
making further feature additions, and focus on getting ti-gfx merged.
Later on, *when* a second PowerVR package appears, it would have been
time to do the necessary work.

But well, now that you've starting doing it, I guess it doesn't make
sense to go backward and remove it again. But then please do it
cleanly:

 * PATCH 1: add the virtual powervr package, with the necessary changes
   to libegl.mk and libgles2.mk, to add the libegl -> powervr and
   libgles2 -> powervr dependencies.

 * PATCH 2: add the ti-gfx package, with the necessary change to
   powervr.mk to add the powervr -> ti-gfx dependency.

Other than that, I think the package is ready now.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
