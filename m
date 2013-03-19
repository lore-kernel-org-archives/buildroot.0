From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 20 Mar 2013 00:29:57 +0400
Subject: [Buildroot] target /etc/inittab
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F0020980106DF3@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F0020980106B97@AUSP01VMBX24.collaborationhost.net>
 <20130316195112.67246764@skate>
 <ADE657CA350FB648AAC2C43247A983F0020980106DF3@AUSP01VMBX24.collaborationhost.net>
Message-ID: <5148CAC5.8020101@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/18/2013 09:10 PM, H Hartley Sweeten wrote:
> On Saturday, March 16, 2013 11:51 AM, Thomas Petazzoni wrote:
>> On Fri, 15 Mar 2013 12:34:02 -0500, H Hartley Sweeten wrote:
>>> I'm using buildroot to create a rootfs for an ep93xx board. This
>>> board has 3 serial ports ttyAM0-3. When the rootfs is created I
>>> get this in the /etc/inittab:
>>>
>>> # Set up a couple of getty's
>>> tty1::respawn:/sbin/getty 38400 tty1
>>> tty2::respawn:/sbin/getty 38400 tty2
>>
>> This is strange, we have removed these since
>> 7d9d09db673abbedc1cc865c213b742e0450268d, which appeared in 2011.05 it
>> seems. Those lines are no longer part of the default skeleton.
>>
>>> # Put a getty on the serial port
>>> ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100 # GENERIC_SERIAL
>>> #ttyAM1::respawn:/sbin/getty -L ttyAM1 57600 vt100 # GENERIC_SERIAL
>>> #ttyAM2::respawn:/sbin/getty -L ttyAM2 57600 vt100 # GENERIC_SERIAL
>>
>> These are not coming from Buildroot default skeleton. Maybe you're
>> using a modified Buildroot version and not the upstream version?

I've just tried to rebuild target's rootfs with your .config and only 
see 1 instance of ttyAMx:
===
# Put a getty on the serial port
ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100 # GENERIC_SERIAL
===

So I have no ideas on where another 2 got from in your case.

Also below is configuration I used (got it with "make savedefconfig" 
from your .config):
===
BR2_arm=y
BR2_arm920t=y
BR2_JLEVEL=2
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_GENERIC_HOSTNAME="EP9307"
BR2_TARGET_GENERIC_ISSUE="Welcome to Vision EP9307"
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyAM0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
BR2_PACKAGE_SDL=y
BR2_PACKAGE_SDL_IMAGE=y
BR2_PACKAGE_SDL_IMAGE_PNG=y
BR2_PACKAGE_SDL_NET=y
BR2_PACKAGE_SDL_GFX=y
BR2_PACKAGE_MTD=y
# BR2_PACKAGE_MTD_UBIATTACH is not set
# BR2_PACKAGE_MTD_UBICRC32 is not set
# BR2_PACKAGE_MTD_UBIDETACH is not set
# BR2_PACKAGE_MTD_UBIFORMAT is not set
# BR2_PACKAGE_MTD_UBIMKVOL is not set
# BR2_PACKAGE_MTD_UBINFO is not set
# BR2_PACKAGE_MTD_UBINIZE is not set
# BR2_PACKAGE_MTD_UBIRENAME is not set
# BR2_PACKAGE_MTD_UBIRMVOL is not set
# BR2_PACKAGE_MTD_UBIRSVOL is not set
# BR2_PACKAGE_MTD_UBIUPDATEVOL is not set
BR2_PACKAGE_NCURSES_TARGET_PANEL=y
BR2_PACKAGE_NCURSES_TARGET_FORM=y
BR2_PACKAGE_NCURSES_TARGET_MENU=y
BR2_PACKAGE_ETHTOOL=y
BR2_PACKAGE_PORTMAP=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_GZIP=y
# BR2_TARGET_ROOTFS_TAR is not set
===

-Alexey
