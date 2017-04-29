From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 15:13:17 +0200
Subject: [Buildroot] [PATCH v7 08/31] package/kodi: bump to version
	17.1-Krypton
In-Reply-To: <5bfda10f-6383-2bf6-afa7-4fffcd2fc5cb@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
 <5bfda10f-6383-2bf6-afa7-4fffcd2fc5cb@t-online.de>
Message-ID: <20170429151317.703ce868@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Apr 2017 15:06:36 +0200, Bernd Kuhls wrote:

> Mesa3d can provide libgl at the same time rpi-userland provides egl/gles
> support:
> 
> $ grep _PROVIDES_ .config
> BR2_PACKAGE_PROVIDES_LIBOPENMAX="rpi-userland"
> BR2_PACKAGE_PROVIDES_LIBGL="mesa3d"
> BR2_PACKAGE_PROVIDES_LIBEGL="rpi-userland"
> BR2_PACKAGE_PROVIDES_LIBGLES="rpi-userland"
> BR2_PACKAGE_PROVIDES_LIBOPENVG="rpi-userland"
> 
> With this defconfig I could reproduce the build error I mentioned today:
> 
> BR2_arm=y
> BR2_cortex_a15=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_RPI_USERLAND=y

Then your fix doesn't work, because for example sunxi-mali, like
rpi-userland, also provides GLES but not full GL. So you can have a
random configuration where OpenGLES is provided by sunxi-mali, but
OpenGL is provided by Mesa.

I believe this should not be solved in the Kodi package itself, so
please send a patch to remove this line.

Instead, what we want is a mechanism to make sure that we don't have
conflicting OpenGL/OpenGLES providers, and Yann made a proposal on the
mailing list about that some time ago. See the thread "[PATCH]
package/opengl: ensure consistency between the various providers" on
the mailing list.

> > OK. Good reason to add a comment in the .mk file.  
> 
> Sent patch: http://patchwork.ozlabs.org/patch/756741/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
