From: David Picard <dplamp@gmx.com>
Date: Tue, 19 Feb 2019 12:26:43 +0100
Subject: [Buildroot] minicom aborts
In-Reply-To: <20190218204417.5c943e3c@gmx.net>
References: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
 <20190218204417.5c943e3c@gmx.net>
Message-ID: <03499d6b-bd94-b080-f5a9-53e6e0422e78@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 18/02/2019 ? 20:44, Peter Seiderer a ?crit?:
> Hello David,
>
> On Mon, 18 Feb 2019 16:09:41 +0100, "David PICARD" <dplamp@gmx.com> wrote:
>
>> Hello,
>>   
>> When I try to start minicom, some test fails, and minicom quits straight away :
>>
>> # minicom
>> minicom: minicom.c: 1041: test_mbswidth: Assertion `mbswidth(e[i].s) == e[i]._mbswidth || mbswidth(e[i].s) == e[i]._mbswidth_kaputt' failed.
>> Aborted
>>   
>> The minicom.c file can be found here :
>> https://salsa.debian.org/minicom-team/minicom/blob/master/src/minicom.c
>>   
>> My only locale is "C".
>>   
>> I'm not sure if it's a bug in minicom or if something is missing on my system.
> Try to run with enabled printf debug output:
>
> 1038      if (0)
> 1039         printf("%d: mbswidth=%zd\n", i, mbswidth(e[i].s));
> 1040       assert(mbswidth(e[i].s) == e[i]._mbswidth
> 1041 	     || mbswidth(e[i].s) == e[i]._mbswidth_kaputt);
>
> And take a look which test fails with which value...
So I put "if (1)" in line 1038. The test that failed was the 1st. So I 
commented out the lines with Asian characters at the beginning of the 
function, but it still failed. Finally, I put a "return" statement at 
the beginning of the function, and now it works.

I attached my defconfig.
>
> And share your .config/defconfig file...
>
> Regards,
> Peter
>   
>>   
>> - David
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
BR2_x86_geode=y
BR2_DL_DIR="$(BASE_DIR)/../dl_scanotron"
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_HOST_GDB_TUI=y
BR2_PACKAGE_HOST_GDB_PYTHON=y
BR2_TARGET_GENERIC_HOSTNAME="scanotron"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_TARGET_GENERIC_ROOT_PASSWD="toor"
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL_SCANOTRON_PATH)/board/lx800/rootfs_overlay"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image.sh support/scripts/genimage.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL_SCANOTRON_PATH)/board/lx800/linux.config"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_GDB=y
BR2_PACKAGE_LIBERATION=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS="-no-sse2"
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="xcb"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5BASE_DBUS=y
BR2_PACKAGE_QT5BASE_TSLIB=y
BR2_PACKAGE_QT5SERIALBUS=y
BR2_PACKAGE_QEXTSERIALPORT=y
BR2_PACKAGE_QWT=y
BR2_PACKAGE_QWT_MATHML=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XLIB_LIBXTST=y
BR2_PACKAGE_XAPP_SESSREG=y
BR2_PACKAGE_XAPP_XCALC=y
BR2_PACKAGE_XAPP_XCLIPBOARD=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XCONSOLE=y
BR2_PACKAGE_XAPP_XEYES=y
BR2_PACKAGE_XAPP_XHOST=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XINPUT=y
BR2_PACKAGE_XAPP_XINPUT_CALIBRATOR=y
BR2_PACKAGE_XAPP_XMESSAGE=y
BR2_PACKAGE_XAPP_XRANDR=y
BR2_PACKAGE_XAPP_XRDB=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_CIRRUS=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_FLUXBOX=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100=y
BR2_PACKAGE_MINICOM=y
BR2_PACKAGE_MSR_TOOLS=y
BR2_PACKAGE_LIBSHA1=y
BR2_PACKAGE_LIBFM=y
BR2_PACKAGE_LIBUSB=y
BR2_PACKAGE_LIBXML2=y
BR2_PACKAGE_LIBNL=y
BR2_PACKAGE_DHCPCD=y
BR2_PACKAGE_LFTP=y
BR2_PACKAGE_LFTP_PROTO_SFTP=y
BR2_PACKAGE_OPENRESOLV=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_AT=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
BR2_TARGET_GRUB2=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_LIBRST=y
BR2_PACKAGE_LIBSZDIST=y
BR2_PACKAGE_PUSHDATA=y
