From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 12 Nov 2019 20:05:22 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
Message-ID: <20191112200522.79c7db5b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

can confirm the build failure with your given defconfig (rpi3/glibc [5])...

On Mon, 11 Nov 2019 12:48:07 +0000, Thomas Preston <thomas.preston@codethink.co.uk> wrote:

Add the following to your commit message:

Fixes:

  In file included from lnx_init.c:33:
  ../../../../hw/xfree86/common/compiler.h:767:10: fatal error: sys/io.h: No such file or directory
   #include <sys/io.h>
          ^~~~~~~~~~
  compilation terminated.

> The ARM sys/io.h has been removed from upstream glibc, which is in
> buildroot. This causes the xorg-server build to fail on ARM when using
> the glibc toolchain.

See [1], [2].

>
> The following patches ([3], [4]) from upstream xserver fix this, but have not yet
> been released.

[1] https://sourceware.org/glibc/wiki/Release/2.30#A.3Csys.2BAC8-io.h.3E_removed_on_32-bit_Arm
[2] https://gitlab.freedesktop.org/xorg/xserver/issues/840
[3] https://gitlab.freedesktop.org/xorg/xserver/commit/6a2ce6c5da9456b97683db6224f38ef3b02cce4b
[4] https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba

>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> ---
>  ...-only-use-inx-outx-on-ARM-with-glibc.patch | 32 ++++++++++
>  ...t-include-sys-io.h-on-ARM-with-glibc.patch | 60 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
>  create mode 100644 package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
>
> diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch b/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
> new file mode 100644
> index 0000000000..f1b27d7484
> --- /dev/null
> +++ b/package/x11r7/xserver_xorg-server/1.20.5/0006-compiler.h-only-use-inx-outx-on-ARM-with-glibc.patch
> @@ -0,0 +1,32 @@
> +From 6a2ce6c5da9456b97683db6224f38ef3b02cce4b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Thu, 20 Sep 2018 13:21:34 +0100
> +Subject: [PATCH 1/2] compiler.h: only use inx/outx on ARM with glibc
> +
> +musl only implements inx/outx on x86, so check for __GLIBC__ instead of
> +__linux__.
> +
> +Signed-off-by: Ross Burton <ross.burton@intel.com>

Your Signed-off-by needed here, e.g.:

[Upstream: https://gitlab.freedesktop.org/xorg/xserver/commit/6a2ce6c5da9456b97683db6224f38ef3b02cce4b.patch]
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

> +---
> + hw/xfree86/common/compiler.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
> +index 7144c6a27..fb53ced80 100644
> +--- a/hw/xfree86/common/compiler.h
> ++++ b/hw/xfree86/common/compiler.h
> +@@ -758,9 +758,9 @@ inl(unsigned short port)
> +     return xf86ReadMmio32Le((void *) ioBase, port);
> + }
> +
> +-#elif defined(__arm__) && defined(__linux__)
> ++#elif defined(__arm__) && defined(__GLIBC__)
> +
> +-/* for Linux on ARM, we use the LIBC inx/outx routines */
> ++/* for glibc on ARM, we use the LIBC inx/outx routines */
> + /* note that the appropriate setup via "ioperm" needs to be done */
> + /*  *before* any inx/outx is done. */
> +
> +--
> +2.23.0
> +
> diff --git a/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch b/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
> new file mode 100644
> index 0000000000..e589147fd5
> --- /dev/null
> +++ b/package/x11r7/xserver_xorg-server/1.20.5/0007-compiler.h-Do-not-include-sys-io.h-on-ARM-with-glibc.patch
> @@ -0,0 +1,60 @@
> +From fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba Mon Sep 17 00:00:00 2001
> +From: Olivier Fourdan <ofourdan@redhat.com>
> +Date: Mon, 1 Jul 2019 13:20:39 +0200
> +Subject: [PATCH 2/2] compiler.h: Do not include sys/io.h on ARM with glibc
> +
> +<sys/io.h> on ARM hasn't worked for a long, long time, so it was removed
> +it from glibc upstream.
> +
> +Remove the include to avoid a compilation failure on ARM with glibc.
> +
> +Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
> +Closes: https://gitlab.freedesktop.org/xorg/xserver/issues/840

Same here:

[Upstream: https://gitlab.freedesktop.org/xorg/xserver/commit/fe4cd0e7f5c58fa94db36326aadc1bd4e6d73eba.patch]
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

> +---
> + hw/xfree86/common/compiler.h | 30 ------------------------------
> + 1 file changed, 30 deletions(-)
> +
> +diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
> +index fb53ced80..2b2008b3f 100644
> +--- a/hw/xfree86/common/compiler.h
> ++++ b/hw/xfree86/common/compiler.h
> +@@ -758,36 +758,6 @@ inl(unsigned short port)
> +     return xf86ReadMmio32Le((void *) ioBase, port);
> + }
> +
> +-#elif defined(__arm__) && defined(__GLIBC__)
> +-
> +-/* for glibc on ARM, we use the LIBC inx/outx routines */
> +-/* note that the appropriate setup via "ioperm" needs to be done */
> +-/*  *before* any inx/outx is done. */
> +-
> +-#include <sys/io.h>
> +-
> +-static __inline__ void
> +-xf_outb(unsigned short port, unsigned char val)
> +-{
> +-    outb(val, port);
> +-}
> +-
> +-static __inline__ void
> +-xf_outw(unsigned short port, unsigned short val)
> +-{
> +-    outw(val, port);
> +-}
> +-
> +-static __inline__ void
> +-xf_outl(unsigned short port, unsigned int val)
> +-{
> +-    outl(val, port);
> +-}
> +-
> +-#define outb xf_outb
> +-#define outw xf_outw
> +-#define outl xf_outl
> +-
> + #elif defined(__nds32__)
> +
> + /*
> +--
> +2.23.0
> +

And I can confirm your patch/the two upstream patches fixes the compile failure...

Regards,
Peter

[5] http://lists.busybox.net/pipermail/buildroot/2019-November/265972.html
