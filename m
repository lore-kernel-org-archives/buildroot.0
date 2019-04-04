From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:45:39 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static build
 failure due to missing -latomic
In-Reply-To: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
References: <20190404153904.69693-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190404224539.2d79cf30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Thu,  4 Apr 2019 17:39:04 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> +# Uses __atomic_fetch_add_4. In adbd.mk Makefile there is no hunk to the end of
> +# linking command. So need to add -latomic to LIBS using sed to provide
> +# -latomic at the correct place in the linking command.
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +define ANDROID_TOOLS_FIX_MAKEFILE
> +	$(SED) 's/-lz -lcrypt/-lz -lcrypt -latomic/' $(@D)/debian/makefiles/adbd.mk
> +endef
> +ANDROID_TOOLS_POST_PATCH_HOOKS = ANDROID_TOOLS_FIX_MAKEFILE
> +endif

Instead of this, please do regular patch on adbd.mk that does this:

-LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
+LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt `pkg-config --libs glib-2.0 gio-2.0`

and that's it.

Also, adding host-pkgconf to ANDROID_TOOLS_DEPENDENCIES when adbd is
selected would be necessary (but it should already be needed anyway, as
pkg-config is already used to detect glib).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
