From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 16:15:52 +0100
Subject: [Buildroot] [PATCH/next 30/31] package/vsxu: new package
In-Reply-To: <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
References: <1456006176-21308-1-git-send-email-bernd.kuhls@t-online.de>
 <1456006176-21308-31-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160305161552.36cc6677@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, 20 Feb 2016 23:09:35 +0100, Bernd Kuhls wrote:

> +diff --git a/engine/include/debug/vsx_backtrace.h b/engine/include/debug/vsx_backtrace.h
> +index 0fbcf86..a83fdc4 100644
> +--- a/engine/include/debug/vsx_backtrace.h
> ++++ b/engine/include/debug/vsx_backtrace.h
> +@@ -7,7 +7,9 @@
> + 
> + #include <stdio.h>
> + #include <errno.h>
> ++#ifdef HAVE_EXECINFO
> + #include <execinfo.h>
> ++#endif
> + #include <unistd.h>
> + #include <string.h>
> + #include <malloc.h>
> +@@ -18,7 +20,7 @@ namespace vsx_backtrace
> + 
> + inline void full_write(int fd, const char *buf, size_t len)
> + {
> +-#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS)
> ++#if !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) && defined(HAVE_EXECINFO)

I believ the !(PLATFORM_FAMILY == PLATFORM_FAMILY_WINDOWS) part of the
condition could be removed, since Windows won't have HAVE_EXECINFO
defined.


> +# instead of using master branch we use branch glfw3

Can you expand the comment to explain why we use the glfw3 branch ?

> +VSXU_VERSION = 4a34b08ec9e51605ca55d1a833f23e9601b2aa88
> +VSXU_SITE = $(call github,vovoid,vsxu,$(VSXU_VERSION))
> +VSXU_CAL3D_VERSION = 0f640189eec913973c64db3bc1c1685554cb7202
> +VSXU_CAL3D_SOURCE = cal3d-$(VSXU_CAL3D_VERSION).tar.gz
> +VSXU_EXTRA_DOWNLOADS = $(call github,vovoid,cal3d,$(VSXU_CAL3D_VERSION))/$(VSXU_CAL3D_SOURCE)

cal3d is a project of its own, available on its own website
(http://home.gna.org/cal3d/). I would very much prefer to create
package/cal3d/ with the upstream cal3d version rather than using this
submodule solution.

> +VSXU_LICENSE = GPLv3+, LGPLv2.1+
> +VSXU_LICENSE_FILES = COPYING COPYING.LESSER

COPYING.LESSER is actually the text of LGPLv3, so are you sure it's
under LGPLv2.1+ ?

Also, it would be good if you could specify which parts of the software
are under GPLv3, which parts are under LGPLv3. Of course, it's this is
reasonably possible.

> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
> +VSXU_DEPENDENCIES += alsa-lib
> +endif
> +
> +ifeq ($(BR2_PACKAGE_JACK2),y)
> +VSXU_DEPENDENCIES += jack2
> +endif
> +
> +ifeq ($(BR2_PACKAGE_OPENCV),y)
> +VSXU_DEPENDENCIES += opencv
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
> +VSXU_DEPENDENCIES += pulseaudio
> +endif

No options to explicitly enable/disable?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
