From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2013 21:21:41 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	graph-depends-improvements
In-Reply-To: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357146432.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201301022121.42142.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 02 January 2013 Thomas Petazzoni wrote:
> Here are a few improvements to the graph-depends script. The most
> important improvements are:
> 
>  * Removal of useless dependencies for the meta "all" package to many
>    packages. This makes the dependency graphs a lot more readable.
> 
>  * Drastic optimization of the execution speed: on a given
>    configuration, it used to take 5 minutes 14 seconds to generate the
>    graph, now it takes 33 seconds.

It is indeed much faster now, but is broken here (with the attached
defconfig):
    $ ../br.package-create-users/support/scripts/graph-depends 
    Getting targets
    Getting dependencies for ['argp-standalone', 'avahi', 'busybox',
    'cifs-utils', 'connman', 'dbus', 'dropbear', 'expat', 'gmp', 'gnutls',
    'htop', 'hwdata', 'iptables', 'kexec', 'kmod', 'libdaemon', 'libffi',
    'libglib2', 'libusb-compat', 'libusb', 'lshw', 'ncurses', 'nettle',
    'ntfs-3g', 'ntp', 'openssl', 'readline', 'rng-tools', 'tcl', 'tvheadend',
    'udev', 'usb_modeswitch_data', 'usb_modeswitch', 'usbutils', 'util-linux',
    'wpa_supplicant', 'zlib', 'target-root-passwd', 'rootfs-ext2',
    'rootfs-tar']
    Error getting dependencies ['argp-standalone', 'avahi', 'busybox',
    'cifs-utils', 'connman', 'dbus', 'dropbear', 'expat', 'gmp', 'gnutls',
    'htop', 'hwdata', 'iptables', 'kexec', 'kmod', 'libdaemon', 'libffi',
    'libglib2', 'libusb-compat', 'libusb', 'lshw', 'ncurses', 'nettle',
    'ntfs-3g', 'ntp', 'openssl', 'readline', 'rng-tools', 'tcl', 'tvheadend',
    'udev', 'usb_modeswitch_data', 'usb_modeswitch', 'usbutils', 'util-linux',
    'wpa_supplicant', 'zlib', 'target-root-passwd', 'rootfs-ext2',
    'rootfs-tar']

Does it require a specific Python version? Mine is:
    $ python --version
    Python 2.6.6

git bisect gives as culprit:

Bisecting: 0 revisions left to test after this (roughly 0 steps)
[4359685e145798f06d88eb2e5ba5979ba5de882e] graph-depends: optimize execution
speed

I'll try to look at it tonight...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
BR2_arm=y
BR2_DL_DIR="$(HOME)/dev/src"
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/home/ymorin/x-tools/arm-hardrpi-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-hardrpi-linux-gnueabi"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_GENERIC_HOSTNAME="tvheadend"
BR2_TARGET_GENERIC_ROOT_PASSWD="root"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="tty1"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BASE_DIR)/../rpi-modules-install.sh"
BR2_PACKAGE_KEXEC=y
BR2_PACKAGE_KEXEC_ZLIB=y
BR2_PACKAGE_CIFS_UTILS=y
BR2_PACKAGE_NTFS_3G=y
BR2_PACKAGE_HWDATA=y
BR2_PACKAGE_LSHW=y
BR2_PACKAGE_RNG_TOOLS=y
BR2_PACKAGE_USB_MODESWITCH_DATA=y
BR2_PACKAGE_USBUTILS=y
BR2_PACKAGE_USBUTILS_ZLIB=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_CONNMAN=y
BR2_PACKAGE_CONNMAN_WIFI=y
BR2_PACKAGE_CONNMAN_LOOPBACK=y
BR2_PACKAGE_CONNMAN_NTPD=y
BR2_PACKAGE_CONNMAN_CLIENT=y
BR2_PACKAGE_DROPBEAR=y
# BR2_PACKAGE_DROPBEAR_SMALL is not set
BR2_PACKAGE_NTP=y
BR2_PACKAGE_NTP_NTPDATE=y
BR2_PACKAGE_NTP_NTPQ=y
BR2_PACKAGE_NTP_TICKADJ=y
BR2_PACKAGE_TVHEADEND=y
BR2_PACKAGE_HTOP=y
BR2_TARGET_ROOTFS_EXT2=y
