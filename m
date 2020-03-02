From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 2 Mar 2020 21:53:39 +0100
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix linux/kcmp.h related
 compile failure
In-Reply-To: <20200302110826.31166-1-ps.report@gmx.net>
References: <20200302110826.31166-1-ps.report@gmx.net>
Message-ID: <e655a87e-f571-bc43-cc31-26de29100209@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 02/03/2020 ? 12:08, Peter Seiderer a ?crit?:
> Add upstream patch [1].
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/df5bcb8e4f6e98c4de347abbbe91e10a98047422
> 
>   ../src/util/os_file.c:37:24: fatal error: linux/kcmp.h: No such file or directory
> 
> [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988

The problem is trigged by the old codesourcery toolchain using kernel headers
3.13 that doesn't provide the kcmp.h header.

kcmp.h is present uapi since kernel 3.19 [1]. Otherwise it would require to add
a new kernel header dependecy to mesa3d...

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3f4994cfc15f38a3159c6e3a4b3ab2e1481a6b02


Reviewed-by: Romain Naour <romain.naour@gmail.com>


Best regards,
Romain


> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...util-remove-the-dependency-on-kcmp.h.patch | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> 
> diff --git a/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> new file mode 100644
> index 0000000000..27ae021e08
> --- /dev/null
> +++ b/package/mesa3d/0006-util-remove-the-dependency-on-kcmp.h.patch
> @@ -0,0 +1,42 @@
> +From 63ad4535df6a0a938e7391d73adcada05e730c89 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>
> +Date: Tue, 18 Feb 2020 16:12:23 -0500
> +Subject: [PATCH] util: remove the dependency on kcmp.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes: f76cbc7901f7 "util: Add os_same_file_description helper"
> +
> +Acked-by: Eric Engestrom <eric@engestrom.ch>
> +Reviewed-by: Michel D?nzer <mdaenzer@redhat.com>
> +Tested-by: Marge Bot <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
> +Part-of: <https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3860>
> +
> +[ Upstream: https://cgit.freedesktop.org/mesa/mesa/commit/?id=f7bfb10c69dfe48a91e35523cb5ee641bdbf6988 ]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/util/os_file.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/util/os_file.c b/src/util/os_file.c
> +index b502ff4..128fe87 100644
> +--- a/src/util/os_file.c
> ++++ b/src/util/os_file.c
> +@@ -34,11 +34,12 @@ os_file_create_unique(const char *filename, int filemode)
> + #if defined(__linux__)
> + 
> + #include <fcntl.h>
> +-#include <linux/kcmp.h>
> + #include <sys/stat.h>
> + #include <sys/syscall.h>
> + #include <unistd.h>
> + 
> ++/* copied from <linux/kcmp.h> */
> ++#define KCMP_FILE 0
> + 
> + static ssize_t
> + readN(int fd, char *buf, size_t len)
> +-- 
> +2.25.1
> +
> 
