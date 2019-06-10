From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Jun 2019 12:41:02 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/weston: fix build with headers < 4.4
In-Reply-To: <20190610103326.30812-1-fontaine.fabrice@gmail.com>
References: <20190610103326.30812-1-fontaine.fabrice@gmail.com>
Message-ID: <20190610104102.GF13603@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-06-10 12:33 +0200, Fabrice Fontaine spake thusly:
> weston includes input-event-codes.h since version 5.0.91 and
> https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
> 
> input-event-codes.h is available only since kernel 4.4 and
> https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
> 
> To fix this build failure, check for the availability of this header
> before including it and fallback to linux/input.h (for EV_KEY) if needed
> 
> It should be noted that we could just drop linux/input.h as it is
> already pulled in from libevdev/libevdev.h
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Add a patch to drop include on input-event-codes.h instead of
>    requiring headers >= 4.4 
> 
>  .../0002-Fix-build-with-kernel-4.4.patch      | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/weston/0002-Fix-build-with-kernel-4.4.patch
> 
> diff --git a/package/weston/0002-Fix-build-with-kernel-4.4.patch b/package/weston/0002-Fix-build-with-kernel-4.4.patch
> new file mode 100644
> index 0000000000..05b499794e
> --- /dev/null
> +++ b/package/weston/0002-Fix-build-with-kernel-4.4.patch
> @@ -0,0 +1,59 @@
> +From f2459cdf188a720384099b82ec40cf1915299552 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 10 Jun 2019 12:02:03 +0200
> +Subject: [PATCH] Fix build with kernel < 4.4
> +
> +weston includes input-event-codes.h since version 5.0.91 and
> +https://github.com/wayland-project/weston/commit/6e229ca26381bc8191fd9af1e439c311da709aff
> +
> +input-event-codes.h is available only since kernel 4.4 and
> +https://github.com/torvalds/linux/commit/f902dd893427eade90f7eaf858e5ff8b150a5a12
> +
> +To fix this build failure, check for the availability of this header
> +before including it and fallback to linux/input.h (for EV_KEY) if needed
> +
> +It should be noted that we could just drop linux/input.h as it is
> +already pulled in from libevdev/libevdev.h
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/210c2759900f15ea0030d088f6f45cd8bb199b29
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/wayland/weston/merge_requests/184]
> +---
> + compositor/main.c | 4 ++++
> + meson.build       | 1 +
> + 2 files changed, 5 insertions(+)
> +
> +diff --git a/compositor/main.c b/compositor/main.c
> +index 945f99ae..dfac03f6 100644
> +--- a/compositor/main.c
> ++++ b/compositor/main.c
> +@@ -42,7 +42,11 @@
> + #include <sys/socket.h>
> + #include <libinput.h>
> + #include <libevdev/libevdev.h>
> ++#ifdef HAVE_LINUX_INPUT_EVENT_CODES_H
> + #include <linux/input-event-codes.h>
> ++#else
> ++#include <linux/input.h>
> ++#endif
> + #include <sys/time.h>
> + #include <linux/limits.h>
> + 
> +diff --git a/meson.build b/meson.build
> +index 55190028..a728d903 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -85,6 +85,7 @@ foreach func : optional_libc_funcs
> + endforeach
> + 
> + optional_system_headers = [
> ++	'linux/input-event-codes.h',
> + 	'linux/sync_file.h'
> + ]
> + foreach hdr : optional_system_headers
> +-- 
> +2.20.1
> +
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
