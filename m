From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 17 Jul 2019 08:52:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/can-utils: fix build with
 kernel >= 5.2
In-Reply-To: <20190714201920.15718-1-fontaine.fabrice@gmail.com>
References: <20190714201920.15718-1-fontaine.fabrice@gmail.com>
Message-ID: <CAGm1_kt0z_2jJ_pzn=DHdr3iez4hDO5P1iVOAQEx=DcyaG=2sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 14, 2019 at 10:19 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This change was already merged upstream but no new release yet.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  ...o-find-SIOCGSTAMP-with-latest-kernel.patch | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
>
> diff --git a/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch b/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
> new file mode 100644
> index 0000000000..3cde5b42af
> --- /dev/null
> +++ b/package/can-utils/0001-fix-include-to-find-SIOCGSTAMP-with-latest-kernel.patch
> @@ -0,0 +1,109 @@
> +From e9590b1ca75d360eaf3211bebd86058214d48064 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 14 Jul 2019 21:50:43 +0200
> +Subject: [PATCH] fix include to find SIOCGSTAMP with latest kernel
> +
> +In linux kernel commit 0768e17073dc527ccd18ed5f96ce85f9985e9115
> +the asm-generic/sockios.h header no longer defines SIOCGSTAMP.
> +Instead it provides only SIOCGSTAMP_OLD.
> +
> +The linux/sockios.h header now defines SIOCGSTAMP using either
> +SIOCGSTAMP_OLD or SIOCGSTAMP_NEW as appropriate. This linux only
> +header file is not pulled so we get a build failure.
> +
> +canlogserver.c: In function 'main':
> +canlogserver.c:404:21: error: 'SIOCGSTAMP' undeclared (first use in this function); did you mean 'SIOCGRARP'?
> +     if (ioctl(s[i], SIOCGSTAMP, &tv) < 0)
> +                     ^~~~~~~~~~
> +                     SIOCGRARP
> +canlogserver.c:404:21: note: each undeclared identifier is reported only once for each function it appears in
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/363de7d9bf433be8bc47ba4ee52ae0bb80fa9021
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/linux-can/can-utils/pull/147]
> +---
> + canlogserver.c | 1 +
> + cansniffer.c   | 1 +
> + isotpdump.c    | 1 +
> + isotpperf.c    | 1 +
> + isotpsniffer.c | 1 +
> + slcanpty.c     | 1 +
> + 6 files changed, 6 insertions(+)
> +
> +diff --git a/canlogserver.c b/canlogserver.c
> +index f9ae159..4429ccd 100644
> +--- a/canlogserver.c
> ++++ b/canlogserver.c
> +@@ -62,6 +62,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/raw.h>
> ++#include <linux/sockios.h>
> + #include <signal.h>
> + #include <errno.h>
> +
> +diff --git a/cansniffer.c b/cansniffer.c
> +index b710058..0ff29b4 100644
> +--- a/cansniffer.c
> ++++ b/cansniffer.c
> +@@ -62,6 +62,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/bcm.h>
> ++#include <linux/sockios.h>
> +
> + #include "terminal.h"
> +
> +diff --git a/isotpdump.c b/isotpdump.c
> +index 1ab9416..97baeca 100644
> +--- a/isotpdump.c
> ++++ b/isotpdump.c
> +@@ -57,6 +57,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/raw.h>
> ++#include <linux/sockios.h>
> + #include "terminal.h"
> +
> + #define NO_CAN_ID 0xFFFFFFFFU
> +diff --git a/isotpperf.c b/isotpperf.c
> +index 6ee6ede..5ad302a 100644
> +--- a/isotpperf.c
> ++++ b/isotpperf.c
> +@@ -57,6 +57,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/raw.h>
> ++#include <linux/sockios.h>
> +
> + #define NO_CAN_ID 0xFFFFFFFFU
> + #define PERCENTRES 2 /* resolution in percent for bargraph */
> +diff --git a/isotpsniffer.c b/isotpsniffer.c
> +index 6c19c8b..5d61872 100644
> +--- a/isotpsniffer.c
> ++++ b/isotpsniffer.c
> +@@ -56,6 +56,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/isotp.h>
> ++#include <linux/sockios.h>
> + #include "terminal.h"
> +
> + #define NO_CAN_ID 0xFFFFFFFFU
> +diff --git a/slcanpty.c b/slcanpty.c
> +index e90b32a..5fdfa55 100644
> +--- a/slcanpty.c
> ++++ b/slcanpty.c
> +@@ -37,6 +37,7 @@
> +
> + #include <linux/can.h>
> + #include <linux/can/raw.h>
> ++#include <linux/sockios.h>
> +
> + /* maximum rx buffer len: extended CAN frame with timestamp */
> + #define SLC_MTU (sizeof("T1111222281122334455667788EA5F\r")+1)
> +--
> +2.20.1
> +
> --
> 2.20.1
>
