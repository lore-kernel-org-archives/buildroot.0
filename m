From: Steven Noonan <steven@uplinklabs.net>
Date: Thu, 19 Mar 2015 20:05:41 -0700
Subject: [Buildroot] [PATCH] package/gdb: fix build with glibc 2.20 (2)
In-Reply-To: <1426807365-22372-1-git-send-email-romain.naour@openwide.fr>
References: <1426807365-22372-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAKbGBLjsd_VxqO3U-VnPiyc9dPVHCDM4Fe3Zmj1B-dC0BC2_pA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 19, 2015 at 4:22 PM, Romain Naour <romain.naour@openwide.fr> wrote:
> Backport a second patch from gdb 7.8 for aarch64.
>
> Fixes:
> http://autobuild.buildroot.net/results/2fc/2fcf1a40a08baf881fdbccd070b1a1a6c89127e1/
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Just ran into this myself and made the same patch.

Tested-by: Steven Noonan <steven@uplinklabs.net>

> ---
>  ...clude-asm-ptrace.h-in-aarch64-linux-nat.c.patch | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
>
> diff --git a/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch b/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
> new file mode 100644
> index 0000000..ccca8cb
> --- /dev/null
> +++ b/package/gdb/7.7.1/0002-Include-asm-ptrace.h-in-aarch64-linux-nat.c.patch
> @@ -0,0 +1,37 @@
> +From 9c45794265a9dc9aebfbdc520d378dfc8fb7b694 Mon Sep 17 00:00:00 2001
> +From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
> +Date: Thu, 22 May 2014 16:07:20 +0100
> +Subject: [PATCH] Include asm/ptrace.h in aarch64-linux-nat.c
> +
> +A recent change to glibc removed asm/ptrace.h from user.h for
> +AArch64. This meant that cross-native builds of gdb using trunk
> +glibc broke because aarch64-linux-nat.c because user_hwdebug_state
> +couldn't be found.
> +
> +Fixed by including asm/ptrace.h like other ports.
> +
> +2014-05-22  Ramana Radhakrishnan  <ramana.radhakrishnan@arm.com>
> +
> +       * aarch64-linux-nat.c (asm/ptrace.h): Include.
> +
> +[Romain: rebase on top of 7.7.1]
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + gdb/aarch64-linux-nat.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/gdb/aarch64-linux-nat.c b/gdb/aarch64-linux-nat.c
> +index 31c26c6..710aa9b 100644
> +--- a/gdb/aarch64-linux-nat.c
> ++++ b/gdb/aarch64-linux-nat.c
> +@@ -33,6 +33,7 @@
> +
> + #include <sys/ptrace.h>
> + #include <sys/utsname.h>
> ++#include <asm/ptrace.h>
> +
> + #include "gregset.h"
> +
> +--
> +1.9.3
> +
> --
> 1.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
