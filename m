From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 22:56:19 +0200
Subject: [Buildroot] [PATCH 1/8] package/mesa3d: introduce new Kconfig
 option to indicate full OpenGL support
In-Reply-To: <XnsA5F7E7BF5206DID313208userindividu@bernd-kuhls.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
 <20160427213040.327325f8@free-electrons.com>
 <XnsA5F7E7BF5206DID313208userindividu@bernd-kuhls.de>
Message-ID: <20160427225619.39a3c7e7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Apr 2016 22:46:54 +0200, Bernd Kuhls wrote:

> the goal of my patch series was to make the presence of OpenGL support in
> mesa3d visible to the user, your proposal is technically also fine with me
> but it needs more technical experience by users to enable the correct
> options to enable OpenGL support because the OpenGL option is a blind one.

Right, but your implementation is really weird. Due to:

+	select BR2_PACKAGE_MESA3D_OPENGL_GL if BR2_PACKAGE_XORG7

even if the user does *NOT* enable BR2_PACKAGE_MESA3D_OPENGL_GL, it
will get forcefully selected as soon as the dependencies
(BR2_PACKAGE_XORG7 && BR2_PACKAGE_MESA3D_DRI_DRIVER) are enabled.

In the end, you're creating an option that is not an option!

If you really want, you can improve my proposal by doing:

config BR2_PACKAGE_MESA3D_OPENGL_GL
	bool
	default y
	depends on BR2_PACKAGE_XORG7
	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER

comment "full OpenGL supports needs X.org and a DRI driver"
	depends on !BR2_PACKAGE_MESA3D_OPENGL_GL

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
