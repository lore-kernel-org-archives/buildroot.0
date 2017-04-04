From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 22:02:54 +0200
Subject: [Buildroot] [PATCH v2 1/2] odroid-mali: fix broken headers.
In-Reply-To: <20170325123918.19055-1-daggs@gmx.com>
References: <20170325123918.19055-1-daggs@gmx.com>
Message-ID: <20170404220254.0ae579a7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 15:39:17 +0300, Dagg Stompler wrote:

> -ODROID_MALI_VERSION = 46fe49f37e3506c6205ad8c50980eca9bfff11e3
> +ODROID_MALI_VERSION = 4f8a541693fee5fdcaa162a7fd8922861a4ba0a9
>  ODROID_MALI_SITE = $(call github,mdrjr,c2_mali,$(ODROID_MALI_VERSION))
>  ODROID_MALI_LICENSE = Hardkernel EULA
>  ODROID_MALI_LICENSE_FILES = README.md
> @@ -44,4 +44,11 @@ define ODROID_MALI_INSTALL_TARGET_CMDS
>  	$(call ODROID_MALI_INSTALL_LIBS,$(TARGET_DIR))
>  endef
>  
> +ifneq ($(BR2_PACKAGE_XLIB_LIBX11),y)

Rather than this condition, I've used the existing
BR2_PACKAGE_ODROID_MALI_X11 condition in odroid-mali.mk.

> +define ODROID_MALI_FIX_EGL_PC
> +	$(SED) "s/: -I/: -DMESA_EGL_NO_X11_HEADERS -I/" $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
> +endef
> +ODROID_MALI_POST_INSTALL_TARGET_HOOKS += ODROID_MALI_FIX_EGL_PC

Using a post-install *target* hook to tweak things in the staging
directory is not very clean. Instead, I've changed your patch to call
ODROID_MALI_FIX_EGL_PC from ODROID_MALI_INSTALL_STAGING_CMDS.

Applied with those fixes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
