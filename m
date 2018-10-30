From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 30 Oct 2018 08:05:11 -0500
Subject: [Buildroot] [PATCH 2/2] qemu: switch to sdl2
In-Reply-To: <20181030082755.13043-2-fontaine.fabrice@gmail.com>
References: <20181030082755.13043-1-fontaine.fabrice@gmail.com>
 <20181030082755.13043-2-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpaqUjBfpnwDaFbYS62XPeKZuXL3TrRPp9Tf8S9BfZAf7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Tue, Oct 30, 2018 at 3:28 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since version 2.12.0 and
> https://github.com/qemu/qemu/commit/e52c6ba34149b4f39c3fd60e59ee32b809db2bfa,
> SDL 1.2 is deprecated so switch to SDL 2.0 as SDL 1.2 will be removed in
> the last release of 2018
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qemu/Config.in | 8 +++++---
>  package/qemu/qemu.mk   | 4 ++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/package/qemu/Config.in b/package/qemu/Config.in
> index d7390141f9..33d4cccd7b 100644
> --- a/package/qemu/Config.in
> +++ b/package/qemu/Config.in
> @@ -118,13 +118,15 @@ comment "Frontends"
>
>  config BR2_PACKAGE_QEMU_SDL
>         bool "Enable SDL frontend"
> -       depends on BR2_PACKAGE_XORG7
> -       select BR2_PACKAGE_SDL
> -       select BR2_PACKAGE_SDL_X11

SDL2 has a X11 option (BR2_PACKAGE_SDL2_X11), any reason to drop that
select from your original first patch? If you do add it back, make
sure to keep the "depends on BR2_PACKAGE_XORG7" and add a "depends on
BR2_USE_MMU # fork()" from the "config BR2_PACKAGE_SDL2_X11".

> +       depends on !BR2_STATIC_LIBS # sdl2
> +       select BR2_PACKAGE_SDL2
>         help
>           Say 'y' to enable the SDL frontend, that is, a graphical
>           window presenting the VM's display.
>
> +comment "SDL frontend needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> +
>  comment "Misc. features"
>
>  config BR2_PACKAGE_QEMU_FDT
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 968c8073e4..5bdf390bc9 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -62,8 +62,8 @@ endif
>
>  ifeq ($(BR2_PACKAGE_QEMU_SDL),y)
>  QEMU_OPTS += --enable-sdl
> -QEMU_DEPENDENCIES += sdl
> -QEMU_VARS += SDL_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl-config
> +QEMU_DEPENDENCIES += sdl2
> +QEMU_VARS += SDL2_CONFIG=$(BR2_STAGING_DIR)/usr/bin/sdl2-config
>  else
>  QEMU_OPTS += --disable-sdl
>  endif
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Matt
