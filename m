From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 22 Mar 2020 22:28:01 +0100
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix musl related compile
 failures
In-Reply-To: <20200322121520.5898-1-ps.report@gmx.net>
References: <20200322121520.5898-1-ps.report@gmx.net>
Message-ID: <20200322222801.20b17503@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 13:15:20 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   http://autobuild.buildroot.net/results/1881daae69992e30a9c1fff1f639d57f82e6ee19
> 
>   ../src/gallium/drivers/vc4/vc4_bufmgr.c:110:57: error: format '%ld' expects argument of type 'long int', but argument 3 has type 'time_t' {aka 'long long int'} [-Werror=format=]
> 
>   ../src/gallium/drivers/panfrost/pan_bo.h:93:9: error: unknown type name ?time_t?
> 
>   ../src/gallium/drivers/v3d/v3d_bufmgr.c:83:57: error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?} [-Werror=format=]
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0005-vc4_bufmgr-fix-time_t-printf.patch   | 33 +++++++++++++++++++
>  ...n_bo.h-add-time.h-include-for-time_t.patch | 32 ++++++++++++++++++
>  .../0007-v3d_bufmgr-fix-time_t-printf.patch   | 33 +++++++++++++++++++
>  3 files changed, 98 insertions(+)
>  create mode 100644 package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
>  create mode 100644 package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
>  create mode 100644 package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> 
> diff --git a/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch b/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
> new file mode 100644
> index 0000000000..56357e1f3a
> --- /dev/null
> +++ b/package/mesa3d/0005-vc4_bufmgr-fix-time_t-printf.patch
> @@ -0,0 +1,33 @@
> +From 4ed48324b032857c95e6803409d5def9660d5b46 Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 22 Mar 2020 11:42:35 +0100
> +Subject: [PATCH] vc4_bufmgr: fix time_t printf
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?}
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/gallium/drivers/vc4/vc4_bufmgr.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/vc4/vc4_bufmgr.c b/src/gallium/drivers/vc4/vc4_bufmgr.c
> +index f7ac1698ee3..a786e8ee939 100644
> +--- a/src/gallium/drivers/vc4/vc4_bufmgr.c
> ++++ b/src/gallium/drivers/vc4/vc4_bufmgr.c
> +@@ -100,7 +100,7 @@ vc4_bo_dump_stats(struct vc4_screen *screen)
> +                 struct timespec time;
> +                 clock_gettime(CLOCK_MONOTONIC, &time);
> +                 fprintf(stderr, "  now:               %ld\n",
> +-                        time.tv_sec);
> ++                        (long)time.tv_sec);
> +         }
> + }
> + 
> +-- 
> +2.25.1
> +
> diff --git a/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> new file mode 100644
> index 0000000000..1586b26bba
> --- /dev/null
> +++ b/package/mesa3d/0006-pan_bo.h-add-time.h-include-for-time_t.patch
> @@ -0,0 +1,32 @@
> +From fc93d357efd207525a4ddaac609ab5a6bf469bcd Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 22 Mar 2020 11:48:31 +0100
> +Subject: [PATCH] pan_bo.h: add time.h include for time_t
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  ../src/gallium/drivers/panfrost/pan_bo.h:93:9: error: unknown type name ?time_t?
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/gallium/drivers/panfrost/pan_bo.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/gallium/drivers/panfrost/pan_bo.h b/src/gallium/drivers/panfrost/pan_bo.h
> +index 414c356b95c..6dda393095d 100644
> +--- a/src/gallium/drivers/panfrost/pan_bo.h
> ++++ b/src/gallium/drivers/panfrost/pan_bo.h
> +@@ -29,6 +29,7 @@
> + #include <panfrost-misc.h>
> + #include "pipe/p_state.h"
> + #include "util/list.h"
> ++#include <time.h>
> + 
> + struct panfrost_screen;
> + 
> +-- 
> +2.25.1
> +
> diff --git a/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch b/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> new file mode 100644
> index 0000000000..f8031c2847
> --- /dev/null
> +++ b/package/mesa3d/0007-v3d_bufmgr-fix-time_t-printf.patch
> @@ -0,0 +1,33 @@
> +From c4984ce2b7d3bd7129ddb02e4e423bf00498607a Mon Sep 17 00:00:00 2001
> +From: Peter Seiderer <ps.report@gmx.net>
> +Date: Sun, 22 Mar 2020 13:03:00 +0100
> +Subject: [PATCH] v3d_bufmgr: fix time_t printf
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes:
> +
> +  error: format ?%ld? expects argument of type ?long int?, but argument 3 has type ?time_t? {aka ?long long int?}
> +
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + src/gallium/drivers/v3d/v3d_bufmgr.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/gallium/drivers/v3d/v3d_bufmgr.c b/src/gallium/drivers/v3d/v3d_bufmgr.c
> +index 50e4081dafd..31a08036b38 100644
> +--- a/src/gallium/drivers/v3d/v3d_bufmgr.c
> ++++ b/src/gallium/drivers/v3d/v3d_bufmgr.c
> +@@ -81,7 +81,7 @@ v3d_bo_dump_stats(struct v3d_screen *screen)
> +                 struct timespec time;
> +                 clock_gettime(CLOCK_MONOTONIC, &time);
> +                 fprintf(stderr, "  now:               %ld\n",
> +-                        time.tv_sec);
> ++                        (long)time.tv_sec);
> +         }
> + }
> + 
> +-- 
> +2.25.1
> +

Patches upstream suggested:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4279

Regards,
Peter
