From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 10:54:56 +0200
Subject: [Buildroot] [PATCH] package/sdl2: disable OpenGL ES 1.1 with
 sunxi-mali as libgles provider
In-Reply-To: <20170604215932.3102-1-romain.naour@gmail.com>
References: <20170604215932.3102-1-romain.naour@gmail.com>
Message-ID: <20170605105456.099785f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Jun 2017 23:59:32 +0200, Romain Naour wrote:

> +# OpenGL ES 1.1 and OpenGL ES 2.0 can't be enabled at the same time
> +# with sunxi-mali as libgles provider due to conflicting types for
> +# 'GLintptr' in GLES2/gl2.h and GLES/gl.h
> +ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
> +SDL2_CONF_OPTS += --disable-video-opengles1
> +endif

This doesn't feel like the right fix:

 - We had a somewhat similar problem (though not exactly the same) with
   odroid-mali, and it was fixed in odroid-mali.

 - You're fixing the problem with sdl2, but fundamentally the real
   problem is in sunxi-mali headers. Which means the exact same problem
   can happen with other users of sunxi-mali than sdl2.

So, it should be fixed in sunxi-mali. To me, it looks like GLES/gl.h is
bogus and needs to be updated. Of course, you need to be careful and
make sure that the change of type definition doesn't affect the width
of the types: sunxi-mali is binary only, so you cannot change its ABI.

But for example, GLES/gl.h contains:

typedef int * GLintptr;

while GLES2/gl2.h contains:

typedef khronos_intptr_t GLintptr;

with:

typedef signed   long  int     khronos_intptr_t;

So, changing GLES/gl.h to define GLintptr to be khronos_intptr_t should
be fine. Of course, the same change needs to be done for the other
types.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
