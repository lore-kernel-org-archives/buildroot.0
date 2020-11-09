From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 Nov 2020 08:15:05 -0800
Subject: [Buildroot] [PATCH 2/2] package/xen: add slirp dependency for
 tools
In-Reply-To: <20201107185256.1175545-2-fontaine.fabrice@gmail.com>
References: <20201107185256.1175545-1-fontaine.fabrice@gmail.com>
 <20201107185256.1175545-2-fontaine.fabrice@gmail.com>
Message-ID: <CAKmqyKNTFt=4RmKkJgu_E3LKiS9-zr7bRpKH-o9FTwt5GdhkGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 7, 2020 at 10:53 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Build of xen tools fails if slirp is built before xen because xen is not
> compatible with spice slirp which does not provide libslirp.h:
>
> /home/buildroot/autobuild/instance-2/output-1/build/xen-4.13.0/tools/qemu-xen/net/slirp.c:40:10: fatal error: libslirp.h: No such file or directory
>  #include <libslirp.h>
>           ^~~~~~~~~~~~
>
> Indeed, xen prefers a system-provided slirp over its internal one
>
> So add slirp as a mandatory dependency (now that we switched to the up
> to date https://gitlab.freedesktop.org/slirp/libslirp)
>
> This build failure is raised since, at least, version 4.13.0
>
> Fixes:
>  - http://autobuild.buildroot.org/results/b80b33ed558518f7bbb0a3c8586bf2d0b8acc36f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/xen/Config.in | 1 +
>  package/xen/xen.mk    | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/xen/Config.in b/package/xen/Config.in
> index 57ab40eba8..af6acd3530 100644
> --- a/package/xen/Config.in
> +++ b/package/xen/Config.in
> @@ -28,6 +28,7 @@ config BR2_PACKAGE_XEN_TOOLS
>         select BR2_PACKAGE_NCURSES
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_PIXMAN
> +       select BR2_PACKAGE_SLIRP
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>         select BR2_PACKAGE_YAJL
> diff --git a/package/xen/xen.mk b/package/xen/xen.mk
> index 8f1fa7db76..8cbe532d2b 100644
> --- a/package/xen/xen.mk
> +++ b/package/xen/xen.mk
> @@ -41,7 +41,8 @@ XEN_CONF_OPTS += --disable-xen
>  endif
>
>  ifeq ($(BR2_PACKAGE_XEN_TOOLS),y)
> -XEN_DEPENDENCIES += dtc libaio libglib2 ncurses openssl pixman util-linux yajl
> +XEN_DEPENDENCIES += \
> +       dtc libaio libglib2 ncurses openssl pixman slirp util-linux yajl
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>  XEN_DEPENDENCIES += argp-standalone
>  endif
> --
> 2.28.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
