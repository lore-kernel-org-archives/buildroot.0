From: lpdev at cordier.org <lpdev@cordier.org>
Date: Tue,  5 Nov 2019 14:12:52 +0100 (CET)
Subject: [Buildroot] systemd: /var/tmp missing from skeleton
In-Reply-To: <CAJ4jsaccj5DTJvDXTKLE_FPr-j+kG_UXQYx=k-i7nm1PUh9gDQ@mail.gmail.com>
Message-ID: <ea-mime-5dc17554-3735-477991d4@www-1.mailo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


De : Carlos Santos <unixmania@gmail.com>
? : lpdev at cordier.org
Sujet : Re: [Buildroot] systemd: /var/tmp missing from skeleton
Date : 31/10/2019 18:07:08 Europe/Paris
Copie ? : buildroot <buildroot@buildroot.org>

On Thu, Oct 31, 2019 at 1:44 PM <lpdev@cordier.org> wrote:
>
>
>
>
> De : Carlos Santos <unixmania@gmail.com>
> ? : lpdev at cordier.org
> Sujet : Re: [Buildroot] systemd: /var/tmp missing from skeleton
> Date : 30/10/2019 23:14:07 Europe/Paris
> Copie ? : buildroot <buildroot@buildroot.org>
>
> On Wed, Oct 30, 2019 at 2:45 PM <lpdev@cordier.org> wrote:
> >
> >
> > Hello,
> >
> > Just spotted an issue with the systemd package (note: I'm currently working on buildroot 2019.08.1 tag). Some services on my build are not started properly such as systemd-hostnamed.service, systemd-resolved.service and systemd-timesyncd.service.
> >
> > Some debugging unveiled that all these services are depending on /var/tmp existence (they all have the "PrivateTmp=yes" in their unit). Without this folder on the target filesystem, services will return "Failed to run 'start' task: No such file or directory".
> >
> > In order to fix that issue and submit a patch, I would like to be sure I did not miss a config in buildroot. I think the fix should take place in SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS located in package/skeleton-init-systemd.mk. Am I right?
> >
> > Thanks,
> >
>
> /var/tmp should have been created by systemd-tmpfiles on startup. Did
> you remove the systemd-tmpfiles-setup symlinks from
> /usr/lib/systemd/system/sysinit.target.wants? You can check the ststus
> with systemctl, e.g.
>
>
> Nop, systemd-tmpfiles-setup is present in /usr/lib/systemd/system/sysinit.target.wants. However, "systemctl --all | grep tmp" shows that systemd-tmpfiles-setup.service is marked as inactive and dead. Also systemctl list-dependencies does not show the tmpfiles-setup unit. Do you have any idea of where I can search to solve this problem?

What is your defconfig? Do you have BR2_PACKAGE_SYSTEMD_TMPFILES=y?



BR2_PACKAGE_SYSTEMD_TMPFILES is not present in defconfig, but it is selected in menuconfig. It's very strange because sometimes the systemd-tmpfiles-setup seems to have properly been started, and sometimes it does not. I can see some services that are skipped at startup, ([SKIP] is appearing), but I cannot scroll in the log in my tty1 to get their names (I'm interested for any fix for that scroll issue).

Unfortunately I did not find how to list skipped systemd service at startup.



Defconfig:



BR2_x86_64=y
BR2_CCACHE=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_OPENMP=y
BR2_TARGET_GENERIC_HOSTNAME="PROJ-cstick"
BR2_TARGET_GENERIC_ISSUE="Welcome!"
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y
BR2_TARGET_GENERIC_GETTY_PORT="tty2"
BR2_ROOTFS_USERS_TABLES="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/user_table.txt"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/rootfs-overlay"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/post_build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/post_image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.80"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/linux-4.19.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
BR2_PACKAGE_LINUX_TOOLS_CPUPOWER=y
BR2_PACKAGE_FFMPEG_GPL=y
BR2_PACKAGE_FFMPEG_NONFREE=y
BR2_PACKAGE_FFMPEG_POSTPROC=y
BR2_PACKAGE_BZIP2=y
BR2_PACKAGE_MAKE=y
BR2_PACKAGE_SED=y
BR2_PACKAGE_TREE=y
BR2_PACKAGE_E2FSPROGS=y
BR2_PACKAGE_E2FSPROGS_RESIZE2FS=y
BR2_PACKAGE_EXFAT=y
BR2_PACKAGE_EXFAT_UTILS=y
BR2_PACKAGE_LIBVA_UTILS=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_SETXKBMAP=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XSET=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FLUXBOX=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_I915=y
BR2_PACKAGE_LINUX_FIRMWARE_IBT=y
BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_8000C=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_ACPITOOL=y
BR2_PACKAGE_GPTFDISK=y
BR2_PACKAGE_GPTFDISK_GDISK=y
BR2_PACKAGE_GPTFDISK_SGDISK=y
BR2_PACKAGE_KBD=y
BR2_PACKAGE_LSHW=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PORTAUDIO=y
BR2_PACKAGE_LIBSHA1=y
BR2_PACKAGE_INTEL_MEDIASDK=y
BR2_PACKAGE_JASPER=y
BR2_PACKAGE_TIFF=y
BR2_PACKAGE_GNU_EFI=y
BR2_PACKAGE_X264=y
BR2_PACKAGE_ZEROMQ_DRAFTS=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_NCURSES_TARGET_PROGS=y
BR2_PACKAGE_DHCP=y
BR2_PACKAGE_DHCP_CLIENT=y
BR2_PACKAGE_IPTABLES=y
BR2_PACKAGE_NETWORK_MANAGER=y
BR2_PACKAGE_NETWORK_MANAGER_TUI=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_PURE_FTPD=y
BR2_PACKAGE_WPA_SUPPLICANT=y
BR2_PACKAGE_WPA_SUPPLICANT_AUTOSCAN=y
BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG=y
BR2_PACKAGE_WPA_SUPPLICANT_WPS=y
BR2_PACKAGE_WPA_SUPPLICANT_CLI=y
BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO=y
BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW=y
BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION=y
BR2_PACKAGE_FILE=y
BR2_PACKAGE_TIME=y
BR2_PACKAGE_WHICH=y
BR2_PACKAGE_EFIBOOTMGR=y
BR2_PACKAGE_HTOP=y
BR2_PACKAGE_SWUPDATE=y
BR2_PACKAGE_SWUPDATE_CONFIG="$(BR2_EXTERNAL_PROJ_PATH)/board/proj-cstick/swupdate.config"
# BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE is not set
BR2_PACKAGE_SYSTEMD_HIBERNATE=y
BR2_PACKAGE_SYSTEMD_LOGIND=y
BR2_PACKAGE_TAR=y
BR2_PACKAGE_VIM=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_LABEL="proj-A"
BR2_TARGET_ROOTFS_EXT2_SIZE="750M"
BR2_TARGET_ROOTFS_EXT2_GZIP=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_GRUB2=y
BR2_TARGET_GRUB2_X86_64_EFI=y
BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop loadenv probe search search_fs_file search_fs_uuid search_label cat echo regexp file"
BR2_TARGET_GRUB2_INSTALL_TOOLS=y
BR2_PACKAGE_HOST_CMAKE=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENEXT2FS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_PKGCONF=y





-- 
Carlos Santos <unixmania@gmail.com>

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191105/40ba58b2/attachment.html>
