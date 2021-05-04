From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:45:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/kexec: fix build on pre 4.4
 kernels
In-Reply-To: <20210203100939.17390-1-fede@evolware.org>
References: <20210203100939.17390-1-fede@evolware.org>
Message-ID: <20210504194540.GN2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Federico, All,

On 2021-02-03 11:09 +0100, Federico Pellegrin spake thusly:
> kexec build will fail on older kernels (pre 4.4) as the define VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
> 
> This patch adds it, as per linux/include/uapi/linux/screen_info.h, if not present.
> 
> Signed-off-by: Federico Pellegrin <fede@evolware.org>

This patch is no longer needed now that we updated kexec to 2.0.21, then
2.0.22.

Sorry it took so long to handle that... :-/

Regards,
Yann E. MORIN.

> ---
>  ...c-tools-fix-build-on-pre-4.4-kernels.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch
> 
> diff --git a/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch b/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch
> new file mode 100644
> index 0000000000..fcac604dfd
> --- /dev/null
> +++ b/package/kexec/0003-kexec-tools-fix-build-on-pre-4.4-kernels.patch
> @@ -0,0 +1,34 @@
> +From cbbe4c47cb2acae04083c510dbe0efc5f48f5bb6 Mon Sep 17 00:00:00 2001
> +From: Federico Pellegrin <fede@evolware.org>
> +Date: Wed, 3 Feb 2021 11:00:17 +0100
> +Subject: [PATCH] kexec-tools: fix build on pre 4.4 kernels
> +
> +kexec build will fail on older kernels (pre 4.4) as the define
> +VIDEO_CAPABILITY_64BIT_BASE was not present at that time.
> +
> +This patch adds it, as per linux/include/uapi/linux/screen_info.h,
> +if not present.
> +
> +Signed-off-by: Federico Pellegrin <fede@evolware.org>
> +---
> + kexec/arch/i386/x86-linux-setup.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/kexec/arch/i386/x86-linux-setup.c b/kexec/arch/i386/x86-linux-setup.c
> +index 76e1185..ab54a4a 100644
> +--- a/kexec/arch/i386/x86-linux-setup.c
> ++++ b/kexec/arch/i386/x86-linux-setup.c
> +@@ -37,6 +37,10 @@
> + #include "x86-linux-setup.h"
> + #include "../../kexec/kexec-syscall.h"
> + 
> ++#ifndef VIDEO_CAPABILITY_64BIT_BASE
> ++#define VIDEO_CAPABILITY_64BIT_BASE (1 << 1)	/* Frame buffer base is 64-bit */
> ++#endif
> ++
> + void init_linux_parameters(struct x86_linux_param_header *real_mode)
> + {
> + 	/* Fill in the values that are usually provided by the kernel. */
> +-- 
> +2.26.2
> +
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
