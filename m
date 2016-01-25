From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:48:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/mjpg-streamer: Fix musl build
In-Reply-To: <1453644779-7961-2-git-send-email-bernd.kuhls@t-online.de>
References: <1453644779-7961-1-git-send-email-bernd.kuhls@t-online.de>
 <1453644779-7961-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160125234855.382214f8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 24 Jan 2016 15:12:59 +0100, Bernd Kuhls wrote:

> diff --git a/package/mjpg-streamer/0001-musl_compatibility.patch b/package/mjpg-streamer/0001-musl_compatibility.patch
> new file mode 100644
> index 0000000..faebd58
> --- /dev/null
> +++ b/package/mjpg-streamer/0001-musl_compatibility.patch
> @@ -0,0 +1,20 @@
> +Fix musl build
> +
> +Patch downloaded from
> +https://github.com/openwrt/packages/blob/master/multimedia/mjpg-streamer/patches/005-musl_compatibility.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- a/mjpg_streamer.h
> ++++ b/mjpg_streamer.h
> +@@ -29,6 +29,10 @@
> + #define MAX_OUTPUT_PLUGINS 10
> + #define MAX_PLUGIN_ARGUMENTS 32
> + 
> ++#define __NEED_pthread_t
> ++#define __NEED_pthread_mutex_t
> ++#define __NEED_pthread_cond_t

This is not the proper fix. This is an ugly hack. Instead, just add:

#include <pthread.h> in plugins/input.h

and things will magically build fine.

One suggestion: do *not* take the patches found in OpenWRT for granted.
No offense for the OpenWRT developers, but I have already found
numerous horrible hacks in OpenWRT patches, and dubious solutions to
build issues.

So whenever you take a patch from OpenWRT, take a step back, and always
check if it's the right solution, and whether the solution is
upstreamable.

What prompted me to check more precisely here is that the OpenWRT
solution is clearly not upstreamable, while including <pthread.h> when
the file uses pthread_* types definitely is.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
