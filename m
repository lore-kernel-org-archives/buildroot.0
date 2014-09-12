From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 09:32:53 +0200
Subject: [Buildroot] [PATCH] rpi-userland: Add patches to fix
 compilation with musl libc
In-Reply-To: <1410486339-2001-1-git-send-email-maarten@treewalker.org>
References: <1410486339-2001-1-git-send-email-maarten@treewalker.org>
Message-ID: <20140912093253.6ef35267@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Fri, 12 Sep 2014 03:45:39 +0200, Maarten ter Huurne wrote:
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
> ---
>  .../rpi-userland-003-disable-timer_t-typedef.patch | 22 ++++++++++++++++++++++
>  .../rpi-userland-004-include-for-HZ.patch          | 19 +++++++++++++++++++
>  ...land-005-do-not-check-__USE_FILE_OFFSET64.patch | 16 ++++++++++++++++
>  package/rpi-userland/rpi-userland-006-mode_t.patch | 13 +++++++++++++
>  4 files changed, 70 insertions(+)
>  create mode 100644 package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
>  create mode 100644 package/rpi-userland/rpi-userland-004-include-for-HZ.patch
>  create mode 100644 package/rpi-userland/rpi-userland-005-do-not-check-__USE_FILE_OFFSET64.patch
>  create mode 100644 package/rpi-userland/rpi-userland-006-mode_t.patch

Thanks. The naming of the patch files as well as the descriptions are
good, but each patch is missing a SoB line, which we require. See
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches.

> diff --git a/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
> new file mode 100644
> index 0000000..e51a93f
> --- /dev/null
> +++ b/package/rpi-userland/rpi-userland-003-disable-timer_t-typedef.patch
> @@ -0,0 +1,22 @@
> +I don't know which platform is missing the timer_t definition, but it would
> +be better to check for that platform specifically instead of explicitly
> +excluding platforms that do have it.
> +
> +This fixes compilation with musl libc, which does define timer_t but does
> +not define __timer_t.
> +
> +Note that _HAVE_TIMER_T suggests it would prevent breakage, but it is
> +unrealistic to expect every application to set that macro. Not even all CMake
> +files in the userland package itself set it...
> +
> +--- userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe.org/interface/vcos/pthreads/vcos_platform.h	2014-08-05 19:43:53.000000000 +0200
> ++++ rpi-userland-f9e6f9f3def8dc18dc0092cd695ccf53b8ba3efe/interface/vcos/pthreads/vcos_platform.h	2014-09-11 21:04:36.418943953 +0200
> +@@ -120,7 +120,7 @@
> + 
> + #define VCOS_ONCE_INIT        PTHREAD_ONCE_INIT
> + 
> +-#if defined(__arm__) && !defined(_HAVE_TIMER_T) && !defined(ANDROID)
> ++#if 0
> + typedef __timer_t timer_t;
> + #endif
> + typedef struct VCOS_TIMER_T

I'm just not entirely convinced by this one: it should be the job of
the rpi-userland build system to check for timer_t, and define
HAVE_TIMER_T accordingly. It's definitely not the job of each and every
application to set that macro, but really rpi-userland's build system.

Also, could you submit those patches upstream? We don't like much to
carry a lot of patches in Buildroot, so the more patches can be merged
upstream, the better.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
