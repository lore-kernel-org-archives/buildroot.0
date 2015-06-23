From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Jun 2015 09:58:08 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: add patches
 to build with kernel headers 3.2
In-Reply-To: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
References: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
Message-ID: <55891190.7080800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/15 12:43, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> + lower kernel headers dependency
> 
> According to upstream [1], there is no known minimal kernel-version, nor
> minimal required feature-set.
> 
> Experimentally tested, that 1.0.2 is works with 3.2 kernel headers, even
> some features will be missing [2].

 "works" as in run-time tested?

> 
> [1] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00039.html
> [2] https://mail.gnome.org/archives/networkmanager-list/2015-April/msg00041.html
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Some questions below though.

> ---
> Changes v3:
>  - Lower kernel headers dependency to 3.2
>  - Preserved original author of
>    0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
>  - Added Signed-off-by inside both patches.
> Changes v2: rewrited patch 0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
> ---
>  ...anager-fix-build-with-Linux-3.2.0-headers.patch | 30 ++++++++++++++++++
>  ...d-dhcp-fix-build-with-Linux-3.2.0-headers.patch | 37 ++++++++++++++++++++++
>  package/network-manager/Config.in                  |  2 +-
>  3 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
>  create mode 100644 package/network-manager/0002-systemd-dhcp-fix-build-with-Linux-3.2.0-headers.patch
> 
> diff --git a/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
> new file mode 100644
> index 0000000..49c1996
> --- /dev/null
> +++ b/package/network-manager/0001-ppp-manager-fix-build-with-Linux-3.2.0-headers.patch
> @@ -0,0 +1,30 @@
> +From 22b99e3bbb2ca33963e839f12ab95314ab8d9ba9 Mon Sep 17 00:00:00 2001
> +From: Lubomir Rintel <lkundrak@v3.sk>
> +Date: Fri, 15 May 2015 16:37:20 +0200
> +Subject: [PATCH] ppp-manager: fix build with Linux 3.2.0 headers
> +
> +Fixes build with Ubuntu 12.04.
> +
> +In file included from ppp-manager/nm-ppp-manager.c:42:0:
> +/usr/include/linux/if_ppp.h:103:16: error: field 'b' has incomplete type
> +/usr/include/linux/if_ppp.h:108:21: error: field 'b' has incomplete type
> +
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Upstream status?

> +---
> + src/ppp-manager/nm-ppp-manager.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
> +index e27c82b..d410ebf 100644
> +--- a/src/ppp-manager/nm-ppp-manager.c
> ++++ b/src/ppp-manager/nm-ppp-manager.c
> +@@ -39,6 +39,7 @@
> + #ifndef aligned_u64
> + #define aligned_u64 unsigned long long __attribute__((aligned(8)))
> + #endif
> ++#include <linux/if.h>
> + #include <linux/if_ppp.h>
> +
> + #include "NetworkManagerUtils.h"
> +--
> +2.1.4
[snip]
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index f6d8564..ae0eb70 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_NETWORK_MANAGER
>  	bool "networkmanager"
>  	depends on BR2_USE_MMU # dbus
>  	depends on BR2_PACKAGE_HAS_UDEV
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2

 Basically it _may_ also work with lower kernel headers but hasn't been tested,
right? Ideally, it would be nice to do a (build-)test with 2.6.34-ish. Or else,
you could add a comment saying that it could work with lower headers. The
minimal headers version was anyway only introduced to fix an autobuild failure.

 Regards,
 Arnout


>  	depends on BR2_TOOLCHAIN_USES_GLIBC # CLOCK_BOOTTIME, IPTOS_CLASS_*
>  	select BR2_PACKAGE_DHCPCD if !BR2_PACKAGE_DHCP_CLIENT
>  	select BR2_PACKAGE_DBUS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
