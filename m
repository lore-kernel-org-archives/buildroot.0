From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Nov 2018 06:26:55 +0200
Subject: [Buildroot] [PATCH/next 1/1] linuxptp: fix build with kernel
 headers >= 4.19
In-Reply-To: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
References: <20181129214730.7225-1-fontaine.fabrice@gmail.com>
Message-ID: <n87bm676vhs.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

[ Resending with the updated address of Richard ]

Adding Richard Cochran who introduced this net_tstamp.h change in kernel
commit 80b14dee2be.

Fabrice Fontaine writes:
> clockid_t has been added in net_tstamp.h since kernel 4.19 and
> https://github.com/torvalds/linux/commit/80b14dee2bea128928537d61c333f24cb8cbb62f
>
> As a result, build fails on:
> In file included from clock.c:20:
> /home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/net_tstamp.h:158:2: error: unknown type name 'clockid_t'
>   clockid_t clockid; /* reference clockid */
>
> To fix this error, add (or move) include on time.h before net_tstamp.h
> in clock.c, sk.c and timemaster.c

I think this is a bug in the net_tstamp.h header. UAPI headers should
not reference userspace types. It should use __kernel_clockid_t instead.

Richard, can you comment on that?

Thanks,
baruch

> Fixes:
>  - http://autobuild.buildroot.org/results/4f53c0b6f3395f4d1ec0aa58f9df36c8145b1066
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-fix-build-with-kernel-headers-4.19.patch  | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 package/linuxptp/0002-fix-build-with-kernel-headers-4.19.patch
>
> diff --git a/package/linuxptp/0002-fix-build-with-kernel-headers-4.19.patch b/package/linuxptp/0002-fix-build-with-kernel-headers-4.19.patch
> new file mode 100644
> index 0000000000..de7c964dad
> --- /dev/null
> +++ b/package/linuxptp/0002-fix-build-with-kernel-headers-4.19.patch
> @@ -0,0 +1,71 @@
> +From d378524e88f6228a3fbf58641f6e0002fa9d0724 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 29 Nov 2018 22:19:19 +0100
> +Subject: [PATCH] fix build with kernel headers >= 4.19
> +
> +clockid_t has been added in net_tstamp.h since kernel 4.19 and
> +https://github.com/torvalds/linux/commit/80b14dee2bea128928537d61c333f24cb8cbb62f
> +
> +As a result, build fails on:
> +In file included from clock.c:20:
> +/home/peko/autobuild/instance-0/output/host/arc-buildroot-linux-uclibc/sysroot/usr/include/linux/net_tstamp.h:158:2: error: unknown type name 'clockid_t'
> +  clockid_t clockid; /* reference clockid */
> +
> +To fix this error, add (or move) include on time.h before net_tstamp.h
> +in clock.c, sk.c and timemaster.c
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/4f53c0b6f3395f4d1ec0aa58f9df36c8145b1066
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://sourceforge.net/p/linuxptp/code/merge-requests/1]
> +---
> + clock.c      | 2 +-
> + sk.c         | 1 +
> + timemaster.c | 1 +
> + 3 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/clock.c b/clock.c
> +index 56bc79b..ef9a008 100644
> +--- a/clock.c
> ++++ b/clock.c
> +@@ -17,11 +17,11 @@
> +  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +  */
> + #include <errno.h>
> ++#include <time.h>
> + #include <linux/net_tstamp.h>
> + #include <poll.h>
> + #include <stdlib.h>
> + #include <string.h>
> +-#include <time.h>
> + #include <sys/queue.h>
> +
> + #include "address.h"
> +diff --git a/sk.c b/sk.c
> +index e2b1f28..30162eb 100644
> +--- a/sk.c
> ++++ b/sk.c
> +@@ -18,6 +18,7 @@
> +  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +  */
> + #include <errno.h>
> ++#include <time.h>
> + #include <linux/net_tstamp.h>
> + #include <linux/sockios.h>
> + #include <linux/ethtool.h>
> +diff --git a/timemaster.c b/timemaster.c
> +index 058678f..00db59f 100644
> +--- a/timemaster.c
> ++++ b/timemaster.c
> +@@ -22,6 +22,7 @@
> + #include <errno.h>
> + #include <libgen.h>
> + #include <limits.h>
> ++#include <time.h>
> + #include <linux/net_tstamp.h>
> + #include <net/if.h>
> + #include <signal.h>
> +--
> +2.14.1
> +

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
