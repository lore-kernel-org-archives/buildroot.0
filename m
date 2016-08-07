From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2016 07:31:43 -0700
Subject: [Buildroot] [PATCH] procps-ng: fix BR2_STATIC_LIBS=y build
In-Reply-To: <1470561551-22910-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470561551-22910-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <29A57947-77D1-4AF2-9327-D2B27C7C5EF7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 7, 2016, at 2:19 AM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> The procps-ng package currently fails to build on BR2_STATIC_LIBS=y
> configurations. Indeed, by default NUMA support is enabled, and it
> requires dlopen(). As hinted by the configure script, passing
> --disable-numa allows to disable NUMA support.
> 
> However, once this is done, another issue pops up: dlopen() is also used
> by the SELinux support. But even when SELinux support is disabled, the
> procps-ng code incorrectly includes <dlfcn.h>. This is addressed by the
> addition of a patch.
> 
> Fixes:
> 
>  http://autobuild.buildroot.net/results/b385bf435085728aece6323a5006ba9fa6631744/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> ...put.c-include-dlfcn.h-only-when-necessary.patch | 32 ++++++++++++++++++++++
> package/procps-ng/procps-ng.mk                     |  6 ++++
> 2 files changed, 38 insertions(+)
> create mode 100644 package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch
> 
> diff --git a/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch b/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch
> new file mode 100644
> index 0000000..dca28fa
> --- /dev/null
> +++ b/package/procps-ng/0003-ps-output.c-include-dlfcn.h-only-when-necessary.patch
> @@ -0,0 +1,32 @@
> +From 4fc9a348026a945aec8eddffc7613de9cb10b10c Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +Date: Sun, 7 Aug 2016 11:08:26 +0200
> +Subject: [PATCH] ps/output.c: include <dlfcn.h> only when necessary
> +
> +dlopen() functionality is only used when SELinux support is enabled, so
> +<dlfcn.h> only needs to be included when ENABLE_LIBSELINUX is
> +defined. This fixes the build in configurations where <dlfcn.h> is not
> +available.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + ps/output.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ps/output.c b/ps/output.c
> +index 42c04cf..f540832 100644
> +--- a/ps/output.c
> ++++ b/ps/output.c
> +@@ -46,7 +46,9 @@
> +  */
> + 
> + #include <ctype.h>
> ++#if ENABLE_LIBSELINUX

Should this check be numa | selinux

> + #include <dlfcn.h>
> ++#endif
> + #include <fcntl.h>
> + #include <grp.h>
> + #include <limits.h>
> +-- 
> +2.7.4
> +
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 51a70a5..ce0f68a 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -47,4 +47,10 @@ PROCPS_NG_CONF_OPTS += \
>    --enable-watch8bit
> endif
> 
> +# numa support requires libdl, so explicitly disable it when
> +# BR2_STATIC_LIBS=y
> +ifeq ($(BR2_STATIC_LIBS),y)
> +PROCPS_NG_CONF_OPTS += --disable-numa
> +endif
> +
> $(eval $(autotools-package))
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
