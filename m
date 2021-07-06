From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 6 Jul 2021 22:35:12 +0300
Subject: [Buildroot] [PATCH 1/1] package/libsoup: fix build with gcc 4.8
In-Reply-To: <20210701202147.466600-1-fontaine.fabrice@gmail.com>
References: <20210701202147.466600-1-fontaine.fabrice@gmail.com>
Message-ID: <20210706223512.GB7470@momiji>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <20210706193512.LyMEfO6xYtmYEHz31aRpmkA-eoovyn_kPBOdhE4c17w@z>

On Thu, 01 Jul 2021 22:21:47 +0200 Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> Fix build failure with gcc 4.8 which is raised since bump to version
> 2.72.0 in commit 8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da:
> 
> In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
>                  from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
>                  from ../libsoup/soup-address.c:14:
> /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
>   const u_char *_msg, *_eom;
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>

> ---
>  .../0001-meson.build-set-c_std-to-gnu99.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> 
> diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> new file mode 100644
> index 0000000000..5a85e05de7
> --- /dev/null
> +++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> @@ -0,0 +1,40 @@
> +From 5c3d431bdb094c59997f2a23e31e83f815ab667c Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 1 Jul 2021 22:09:23 +0200
> +Subject: [PATCH] meson.build: set c_std to gnu99
> +
> +Set c_std to gnu99 to avoid the following build failure with gcc 4.8:
> +
> +In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/resolv.h:65:0,
> +                 from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/glib-2.0/gio/gnetworking.h:40,
> +                 from ../libsoup/soup-address.c:14:
> +/tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/arpa/nameser.h:115:2: error: unknown type name 'u_char'
> +  const u_char *_msg, *_eom;
> +  ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 4dfd8c15..a5ebc63a 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -3,7 +3,7 @@ project('libsoup', 'c',
> +         version: '2.72.0',
> +         meson_version : '>= 0.50',
> +         license : 'LGPL2',
> +-        default_options : 'c_std=c99')
> ++        default_options : 'c_std=gnu99')
> + 
> + gnome = import('gnome')
> + 
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210706/434acd00/attachment-0002.asc>
