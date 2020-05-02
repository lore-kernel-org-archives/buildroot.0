From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2020 18:31:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: drop pkgconfig
 workaround
In-Reply-To: <20200502003254.28369-1-james.hilliard1@gmail.com>
References: <20200502003254.28369-1-james.hilliard1@gmail.com>
Message-ID: <20200502163114.GJ15673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-05-01 18:32 -0600, James Hilliard spake thusly:
> This workaround is not needed as of commit
> 5cff3a8bdfba92e9f61d0984df08f1ecd205c072 which properly sets the
> PKG_CONFIG_LIBDIR for native: true dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...onfig-to-find-wayland-scanner-when-c.patch | 45 -------------------
>  1 file changed, 45 deletions(-)
>  delete mode 100644 package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
> 
> diff --git a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch b/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
> deleted file mode 100644
> index 898506a0dc..0000000000
> --- a/package/wlroots/0001-Do-not-use-pkg-config-to-find-wayland-scanner-when-c.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 72138a67c8e6b0154aadc1b5fcb3d661033fbcd3 Mon Sep 17 00:00:00 2001
> -From: Adrian Perez de Castro <aperez@igalia.com>
> -Date: Thu, 13 Jun 2019 02:13:47 +0300
> -Subject: [PATCH] Do not use pkg-config to find wayland-scanner when cross
> - building
> -
> -When cross-compiling it is still needed to run a native wayland-scanner,
> -but many tools for the task will still have pkg-config return the
> -location of wayland-scanner for the target in some location which may
> -be the same as for some native installation of wayland-scanner; but
> -which is not the copy of the program that the compilation system wants
> -packages to use (which are typically in a "host tools" directory
> -elsewhere).
> -
> -This disables usage of pkg-config to find wayland-scanner when
> -cross-compiling because most tools for the job will set $PATH in a way
> -that the correct installation of the tool will be found first.
> -
> -Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> -[Upstream status: https://github.com/swaywm/wlroots/pull/1722]
> -
> ----
> - protocol/meson.build | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/protocol/meson.build b/protocol/meson.build
> -index 7cc10320..73c06b24 100644
> ---- a/protocol/meson.build
> -+++ b/protocol/meson.build
> -@@ -1,6 +1,11 @@
> - wl_protocol_dir = wayland_protos.get_pkgconfig_variable('pkgdatadir')
> - 
> --wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
> -+if meson.is_cross_build()
> -+	wayland_scanner_dep = disabler()
> -+else
> -+	wayland_scanner_dep = dependency('wayland-scanner', required: false, native: true)
> -+endif
> -+
> - if wayland_scanner_dep.found()
> - 	wayland_scanner = find_program(
> - 		wayland_scanner_dep.get_pkgconfig_variable('wayland_scanner'),
> --- 
> -2.22.0
> -
> -- 
> 2.20.1
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
