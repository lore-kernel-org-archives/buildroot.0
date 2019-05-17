From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 May 2019 11:21:07 +0200
Subject: [Buildroot] [RFC PATCH/next 2/2] package/cage: new package
In-Reply-To: <20190516220836.24543-3-aperez@igalia.com>
References: <20190516220836.24543-1-aperez@igalia.com>
 <20190516220836.24543-3-aperez@igalia.com>
Message-ID: <20190517112107.50d4ab47@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian,

On Fri, 17 May 2019 01:08:36 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> diff --git a/package/cage/0001-Updates-for-wlroots-0.6.0.patch b/package/cage/0001-Updates-for-wlroots-0.6.0.patch
> new file mode 100644
> index 0000000000..57e5a1289a
> --- /dev/null
> +++ b/package/cage/0001-Updates-for-wlroots-0.6.0.patch
> @@ -0,0 +1,264 @@
> +From 86b9d6719e52cbddda4fb6d055e60e9caf9a57ff Mon Sep 17 00:00:00 2001
> +From: Jente Hidskes <hjdskes@gmail.com>
> +Date: Fri, 3 May 2019 19:39:19 +0200
> +Subject: [PATCH 1/3] CI: use wlroots 0.6.0
> +
> +Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> +[Upstream status: https://github.com/Hjdskes/cage/pull/65]
> +
> +---
> + .builds/alpine.yml    | 4 ++--
> + .builds/archlinux.yml | 4 ++--
> + .builds/freebsd.yml   | 4 ++--
> + 3 files changed, 6 insertions(+), 6 deletions(-)

These CI related changes are really not relevant in the context of
Buildroot.

> +From 08ecd52a3313d00d06cc4e12d4d3243865af5dd0 Mon Sep 17 00:00:00 2001
> +From: Drew DeVault <sir@cmpwn.com>
> +Date: Thu, 25 Apr 2019 11:40:25 -0400
> +Subject: [PATCH 2/3] Update to wlroots 0.6.0

Please use one .patch file for each patch.

Your SoB is missing.


> +From 711aebb4d20848d2d9052e0483cd301c7022b844 Mon Sep 17 00:00:00 2001
> +From: Jente Hidskes <hjdskes@gmail.com>
> +Date: Fri, 3 May 2019 20:53:19 +0200
> +Subject: [PATCH 3/3] output: don't submit too much damage
> +
> +See https://github.com/swaywm/wlroots/issues/1666#issue-436967396 and
> +the linked changes
> +https://github.com/swaywm/wlroots/pull/1668/files#diff-95fe5e5b411cc64a5dc31e2b72669a0d

Ditto.


> + 		view_for_each_surface(view, send_frame_done, &now);
> diff --git a/package/cage/Config.in b/package/cage/Config.in
> new file mode 100644
> index 0000000000..07dc4c9da3
> --- /dev/null
> +++ b/package/cage/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_PACKAGE_CAGE
> +	bool "cage"
> +	depends on !BR2_STATIC_LIBS # wlroots
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots

wlroots (in your submission) has plenty of other depends on you need to
replicate:

+	depends on !BR2_STATIC_LIBS # mesa3d, wayland
+	depends on BR2_INSTALL_LIBSTDCPP # freedrp, mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm, wayland
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # mesa3d
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mesa3d
+	depends on BR2_ENABLE_LOCALE # libinput
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGLES

> +	select BR2_PACKAGE_WLROOTS
> +	help
> +	  Kiosk compositor for Wayland, which displays a single
> +	  maximized application at a time.
> +
> +	  https://www.hjdskes.nl/projects/cage/
> +
> +if BR2_PACKAGE_CAGE
> +
> +config BR2_PACKAGE_CAGE_XWAYLAND
> +	bool "XWayland support"
> +	depends on BR2_PACKAGE_XORG7 # wlroots

Not necessary, because you have a "depends on
BR2_PACKAGE_WLROOTS_XWAYLAND" below.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
