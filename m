From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 15:06:30 +0200
Subject: [Buildroot] [PATCH v7 08/31] package/kodi: bump to
	version	17.1-Krypton
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <fe62a0d1-d466-2d4d-22c4-d5165882dc7b@t-online.de>
 <20170429144237.65dadbba@free-electrons.com>
Message-ID: <mnfetdxnoe.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 29 Apr 2017 14:42:37 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 29 Apr 2017 14:29:13 +0200, Bernd Kuhls wrote:
> 
>> > I don't understand why you have this !BR2_PACKAGE_RPI_USERLAND
>> > dependency here. Can you explain?
>> 
>> We need to rule out that a rbpi build is done with opengl/egl,
>> otherwise the build will fail like this:
>> http://forum.kodi.tv/showthread.php?tid=305752&pid=2569701#pid2569701
> 
> But rpi-userland doesn't provide OpenGL support, only OpenGLES, so how
> is it possible to get a RPi build with OpenGL support ?

Mesa3d can provide libgl at the same time rpi-userland provides egl/gles 
support:

$ grep _PROVIDES_ .config
BR2_PACKAGE_PROVIDES_LIBOPENMAX="rpi-userland"
BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
BR2_PACKAGE_PROVIDES_LIBOPENVG="rpi-userland"

With this defconfig I could reproduce the build error I mentioned today:

BR2_arm=y
BR2_cortex_a15=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_RPI_USERLAND=y

>> Because all these options do not exist in https://github.com/xbmc/xbmc/
>> blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake
> 
> OK. Good reason to add a comment in the .mk file.

Sent patch: http://patchwork.ozlabs.org/patch/756741/

Regards, Bernd
