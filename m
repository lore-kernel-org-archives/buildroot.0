From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 20:18:38 +0200
Subject: [Buildroot] [PATCH 2/3] package/systemd: do not force dbus if
 dbus-broker is available
In-Reply-To: <1a991eb7b9305597080a0506302667dfb10de018.1591551884.git.yann.morin.1998@free.fr>
References: <cover.1591551884.git.yann.morin.1998@free.fr>
 <1a991eb7b9305597080a0506302667dfb10de018.1591551884.git.yann.morin.1998@free.fr>
Message-ID: <CADYdroN2hTCZVdHJb3NVLd_diGk8F_EbMJr0-OrQtvz4qTGrUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 19:44 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> dbus-broker fits the bill as a message bus daemon, so only enable the
> original dbus if dbus-broker is not enabled.

Well, the core components of systemd run fine without dbus(-broker). I
have such a setup with systemd + journald + networkd (and most of util
linux removed) running since months.
Rule of the thumb is that you dont need dbus(-broker) unless you need
to interact with non-root (ie. logind) or non-local stuff
(containerd).

Changes are at (not rebased, kept that one for last)
https://github.com/nolange/buildroot/commits/improve_systemd_nodbus

This to me would be the minimal "buildroot approach" (at the cost of
messing up if eg. busybox doesn't provide a few tools), but I
obviously can't speak for the maintainers.

>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index dd3b8c534d..37f9d04850 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -25,7 +25,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
>         depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
>         select BR2_PACKAGE_HAS_UDEV
> -       select BR2_PACKAGE_DBUS # runtime dependency only
> +       select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
>         select BR2_PACKAGE_LIBCAP
>         select BR2_PACKAGE_UTIL_LINUX
>         select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> --
> 2.20.1
>

Norbert
