From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 12:19:14 +0100
Subject: [Buildroot] [PATCH] alsa-lib: dlmisc: Add a fake dl lib head
 file when dl lib is not supported by the toolchain
In-Reply-To: <1385364193-23750-1-git-send-email-Sonic.adi@gmail.com>
References: <1385364193-23750-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <CAAXf6LVPjWAwoNunTzEsR3KE4WO1UnA201dvn7Du-Z_de-72og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 25, 2013 at 8:23 AM,  <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> The FLAT GNU toolchain doesn't include the dlfcn.h header file.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/alsa-lib/alsa-lib-003-dlmisc.patch |   59 ++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/alsa-lib/alsa-lib-003-dlmisc.patch
>
> diff --git a/package/alsa-lib/alsa-lib-003-dlmisc.patch b/package/alsa-lib/alsa-lib-003-dlmisc.patch
> new file mode 100644
> index 0000000..612fa5a
> --- /dev/null
> +++ b/package/alsa-lib/alsa-lib-003-dlmisc.patch
> @@ -0,0 +1,59 @@
> +alsa-lib: dlmisc: Add a fake dl lib head file when dl lib is not supported by the toolchain.
> +
> +The FLAT GNU toolchain doesn't include the dlfcn.h header file.
> +
> +--- alsa-lib-1.0.26/src/mixer/simple_abst.c    2012-09-06 16:55:14.000000000 +0800
> ++++ alsa-lib-1.0.26.bak/src/mixer/simple_abst.c        2013-11-25 14:53:07.739275843 +0800
> +@@ -34,7 +34,11 @@
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> + #include <math.h>
> ++#ifdef HAVE_LIBDL
> + #include <dlfcn.h>
> ++#else
> ++#include <dlmisc.h>
> ++#endif
> + #include "config.h"
> + #include "asoundlib.h"
> + #include "mixer_simple.h"
> +--- alsa-lib-1.0.26/modules/mixer/simple/sbasedl.c     2012-09-06 16:55:14.000000000 +0800
> ++++ alsa-lib-1.0.26.bak/modules/mixer/simple/sbasedl.c 2013-11-25 14:53:40.871279553 +0800
> +@@ -27,7 +27,11 @@
> + #include <fcntl.h>
> + #include <sys/ioctl.h>
> + #include <math.h>
> ++#ifdef HAVE_LIBDL
> + #include <dlfcn.h>
> ++#else
> ++#include <dlmisc.h>
> ++#endif
> + #include "config.h"
> + #include "asoundlib.h"
> + #include "mixer_abst.h"
> +--- /dev/null  2013-11-25 21:32:41.194714253 +0800
> ++++ alsa-lib-1.0.26.bak/include/dlmisc.h       2013-11-25 15:03:11.031307047 +0800
> +@@ -0,0 +1,24 @@
> ++/*
> ++ *   This library is free software; you can redistribute it and/or modify
> ++ *   it under the terms of the GNU Lesser General Public License as
> ++ *   published by the Free Software Foundation; either version 2.1 of
> ++ *   the License, or (at your option) any later version.
> ++ *
> ++ *   This program is distributed in the hope that it will be useful,
> ++ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ *   GNU Lesser General Public License for more details.
> ++ *
> ++ *   You should have received a copy of the GNU Lesser General Public
> ++ *   License along with this library; if not, write to the Free Software
> ++ *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
> ++ *
> ++ */
> ++
> ++#ifndef __ALSA_DLMISC_H
> ++#define __ALSA_DLMISC_H
> ++
> ++#define RTLD_NOW      0x00002
> ++#define RTLD_GLOBAL   0x00100
> ++
> ++#endif
> --
> 1.7.9.5

Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile-tested on a Blackfin FLAT configuration)

This patch fixes
http://autobuild.buildroot.net/results/706/7069e1f43cbed745d65f7dd9904a3fff034530ac.
(Peter: maybe you should add this link to the commit message)

Best regards,
Thomas
