From: Will Newton <will.newton@gmail.com>
Date: Tue, 23 Oct 2012 15:14:21 +0100
Subject: [Buildroot] [PATCH] package/lttng-tools: Improve dependencies
	for lttng-tools.
In-Reply-To: <CAFbHwiQRgb_f14t+V+y=HFt9Xr9D7xLitkYkHo1h_EfLT_VYOA@mail.gmail.com>
References: <CAFbHwiQRgb_f14t+V+y=HFt9Xr9D7xLitkYkHo1h_EfLT_VYOA@mail.gmail.com>
Message-ID: <CAFbHwiTEaoQYetScU5VwARHfiufxmr5z06Ce_ZaeLCJXmAceSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ping?

On Mon, Oct 15, 2012 at 11:31 AM, Will Newton <will.newton@gmail.com> wrote:
> From 7702c9f7794aea86fc750ebac6c487ca73703897 Mon Sep 17 00:00:00 2001
> From: Will Newton <will.newton@imgtec.com>
> Date: Mon, 15 Oct 2012 11:27:01 +0100
> Subject: [PATCH] package/lttng-tools: Improve dependencies for lttng-tools.
>
> lttng-tools currently depends on the lttng-modules package which
> in turn depends on the buildroot linux kernel. If the user is
> building their kernel outside of buildroot then lttng-tools are
> not selectable. Remove that dependency and add a note to the
> Kconfig text to notify the user of the requirement.
>
> lttng-tools also require largefile support be enabled in the
> toolchain, so add a dependency for that.
>
> Signed-off-by: Will Newton <will.newton@imgtec.com>
> ---
>  package/lttng-tools/Config.in |    8 ++++++--
>  1 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
> index b854757..21056b5 100644
> --- a/package/lttng-tools/Config.in
> +++ b/package/lttng-tools/Config.in
> @@ -1,13 +1,14 @@
>  config BR2_PACKAGE_LTTNG_TOOLS
>         bool "lttng-tools"
> -       depends on BR2_PACKAGE_LTTNG_MODULES
>         select BR2_PACKAGE_LIBURCU
>         select BR2_PACKAGE_POPT
>         # liburcu only works on some architectures
>         depends on BR2_arm || BR2_armeb || BR2_i386 || BR2_powerpc || BR2_x86_64
> +       depends on BR2_LARGEFILE
>         help
>           Userspace utilities for the LTTng 2.0 tracing
> -         infrastructure.
> +         infrastructure. The LTTng kernel modules are required on the
> +         target to use these tools.
>
>           Those utilities are required on the target system to start
>           and stop tracing sessions. Analysis of the trace can be done
> @@ -22,3 +23,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
>           lttng-libust.
>
>           http://lttng.org
> +
> +comment "lttng-tools needs LARGEFILE support"
> +       depends on !BR2_LARGEFILE
> --
> 1.7.1
