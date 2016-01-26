From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 22:43:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/socat: fix musl build
In-Reply-To: <1453636704-20771-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453636704-20771-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160126224340.14a8a5bc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 24 Jan 2016 12:58:24 +0100, Bernd Kuhls wrote:

> +--- socat-1.7.2.4.orig/sysincludes.h
> ++++ socat-1.7.2.4/sysincludes.h
> +@@ -134,7 +134,7 @@
> + #include <netpacket/packet.h>
> + #endif
> + #if HAVE_NETINET_IF_ETHER_H
> +-#include <netinet/if_ether.h>
> ++#include <linux/if_ether.h>

This looks wrong: the configure check now verifies if
<netinet/if_ether.h> exists, if that's the case,
HAVE_NETINET_IF_ETHER_H is defined, but the code includes
<linux/if_ether.h> ? Not good.

> diff --git a/package/socat/0003-netdb-internal.patch b/package/socat/0003-netdb-internal.patch
> new file mode 100644
> index 0000000..44bd65f
> --- /dev/null
> +++ b/package/socat/0003-netdb-internal.patch
> @@ -0,0 +1,20 @@
> +Fix musl build
> +
> +Downloaded from
> +http://git.alpinelinux.org/cgit/aports/tree/main/socat/netdb-internal.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +--- socat-1.7.2.4.orig/compat.h
> ++++ socat-1.7.2.4/compat.h
> +@@ -656,6 +656,10 @@
> + #  define NETDB_INTERNAL h_NETDB_INTERNAL
> + #endif
> + 
> ++#if !defined(NETDB_INTERNAL)
> ++#  define NETDB_INTERNAL (-1)
> ++#endif

This also looks suspicious, and at the very least needs some proper
patch description.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
