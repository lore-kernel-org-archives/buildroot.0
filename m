From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 01:41:26 +0200
Subject: [Buildroot] [PATCH 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <1460438965-28065-5-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460438965-28065-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <570D87A6.3030907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/12/16 07:29, Ezequiel Garcia wrote:
> This commit adds a new defconfig to build a X-based
> graphical system for the MinnowboardMax board.
>
>    * The 'openbox' windows manager is chosen because it's simple
>      and lightweigth.
>
>    * Basic X apps are enabled (such as xrandr, xterm), so we
>      can at least get a console and change video mode.
>
>    * ALSA default configuration is provided, so HDMI audio
>      works out-of-the-box.
>
>    * Systemd is chosen as the init system because... you know ;)

  I'm not sure I agree with this one. Even though I like systemd myself, I 
really don't think it belongs here.

>
>    * ... and finally, OpenGL support is provided.
>
> Tested on Minnoboard Turot (which is Minnowboard Max compatible).
>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>   board/minnowboard-max/asound.conf           |   2 +
>   board/minnowboard-max/post-build.sh         |  20 +++
>   board/minnowboard-max/startx                | 239 ++++++++++++++++++++++++++++
>   configs/minnowboard_max_graphical_defconfig |  78 +++++++++
>   4 files changed, 339 insertions(+)
>   create mode 100644 board/minnowboard-max/asound.conf
>   create mode 100755 board/minnowboard-max/startx
>   create mode 100644 configs/minnowboard_max_graphical_defconfig

  To distinguish between the minimal and the demo defconfigs, perhaps we can 
call it minnowboard_max-graphical_defconfig?

>
> diff --git a/board/minnowboard-max/asound.conf b/board/minnowboard-max/asound.conf
> new file mode 100644
> index 000000000000..8947748052e5
> --- /dev/null
> +++ b/board/minnowboard-max/asound.conf
> @@ -0,0 +1,2 @@
> +defaults.pcm.card 0
> +defaults.pcm.device 3

  This should be in an fs-overlay directory and use an fs-overlay.

> diff --git a/board/minnowboard-max/post-build.sh b/board/minnowboard-max/post-build.sh
> index 9f86d390f2ef..9156233404f8 100755
> --- a/board/minnowboard-max/post-build.sh
> +++ b/board/minnowboard-max/post-build.sh
> @@ -1,2 +1,22 @@
>   #!/bin/sh
> +
> +# Install grub config to the EFI part template
>   cp board/minnowboard-max/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
> +
> +# Tell systemd we want a login shell on tty0
> +ln -sf ${TARGET_DIR}/usr/lib/systemd/system/getty at .service ${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty at tty0.service

  This should also use fs-overlay. It's anyway wrong in its current incarnation, 
because you refer to ${TARGET_DIR} in the symlink itself... BTW I prefer 
relative symlinks.

  Also, this should only be done for the big build, not for the minimal build, 
so somehow you must distinguish between them. Same below. The fs-overlay is the 
simplest way to do that.

> +
> +# Setup xinitrc
> +echo "exec /usr/bin/openbox-session" > ${TARGET_DIR}/root/.xinitrc

  Put this in the fs-overlay.

> +
> +# Fixup startx so it doesn't start X on the controlling
> +# virtual console. Apparently, this is a bug and we are
> +# affected for our lack of a Display Manager.
> +# See https://bugs.freedesktop.org/show_bug.cgi?id=87762
> +#
> +# I haven't found a way to do this without hacking startx
> +# itself, so...

  This comment should be in the startx script itself.

> +cp board/minnowboard-max/startx ${TARGET_DIR}/usr/bin/startx
> +
> +# Customize ALSA: the HDMI PCM is at card=0, device=3 (i.e. hw:0,3)

  Same here.

> +cp board/minnowboard-max/asound.conf ${TARGET_DIR}/etc/asound.conf
> diff --git a/board/minnowboard-max/startx b/board/minnowboard-max/startx
> new file mode 100755
> index 000000000000..3ed32a494654
> --- /dev/null
> +++ b/board/minnowboard-max/startx
[snip]
> diff --git a/configs/minnowboard_max_graphical_defconfig b/configs/minnowboard_max_graphical_defconfig
> new file mode 100644
> index 000000000000..d66581d925b6
> --- /dev/null
> +++ b/configs/minnowboard_max_graphical_defconfig
> @@ -0,0 +1,78 @@
> +# Architecture
> +BR2_x86_64=y
> +BR2_x86_atom=y
> +
> +# Toolchain
> +BR2_OPTIMIZE_2=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> +BR2_GLIBC_VERSION_2_23=y
> +BR2_BINUTILS_VERSION_2_26_X=y
> +BR2_GCC_VERSION_5_X=y
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +BR2_ENABLE_LOCALE_PURGE=y
> +
> +# System config
> +BR2_INIT_SYSTEMD=y
> +BR2_SYSTEM_BIN_SH_BASH=y
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="enp2s0"
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
> +
> +# Linux
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux.config"
> +
> +# Packages
> +BR2_PACKAGE_ALSA_UTILS=y
> +BR2_PACKAGE_ALSA_UTILS_APLAY=y
> +BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
> +BR2_PACKAGE_GREP=y

  Not sure why we would want this. Doesn't it require BUSYBOX_SHOW_OTHERS?

> +BR2_PACKAGE_GLMARK2=y
> +BR2_PACKAGE_MESA3D_DEMOS=y
> +BR2_PACKAGE_FB_TEST_APP=y
> +BR2_PACKAGE_MESA3D=y
> +BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> +BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> +BR2_PACKAGE_XORG7=y
> +BR2_PACKAGE_XSERVER_XORG_SERVER=y
> +BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
> +BR2_PACKAGE_XAPP_XDM=y
> +BR2_PACKAGE_XAPP_XINIT=y
> +BR2_PACKAGE_XAPP_XRANDR=y
> +BR2_PACKAGE_XAPP_XSM=y

  Don't we need a terminal as well?

> +BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
> +BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK=y

  Not sure if joystick is that useful.

> +BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
> +BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
> +BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
> +BR2_PACKAGE_XTERM=y
> +BR2_PACKAGE_OPENBOX=y
> +BR2_PACKAGE_LINUX_FIRMWARE=y
> +BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
> +BR2_PACKAGE_IMLIB2=y
> +BR2_PACKAGE_IMLIB2_JPEG=y
> +BR2_PACKAGE_IMLIB2_PNG=y
> +BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
> +BR2_PACKAGE_STARTUP_NOTIFICATION=y
> +BR2_PACKAGE_COREUTILS=y
  Why?

> +BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
  Why?

> +BR2_PACKAGE_UTIL_LINUX_MORE=y
  Why?

> +BR2_PACKAGE_LESS=y


  I'd like to reorder the packages to put all the X stuff together with a 
comment above and, and then all the dev stuff (like bash and less) with a comment.


  Regards,
  Arnout

> +
> +# Filesystem image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +# BR2_TARGET_ROOTFS_TAR is not set
> +
> +# Bootloader
> +BR2_TARGET_GRUB2=y
> +BR2_TARGET_GRUB2_X86_64_EFI=y
> +
> +# Host packages
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
