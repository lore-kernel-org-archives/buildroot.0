From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 20:33:13 +0200
Subject: [Buildroot] [PATCH v1] Fix EGL support in qt5base
In-Reply-To: <1379411589-8935-1-git-send-email-jezz@sysmic.org>
References: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
 <1379411589-8935-1-git-send-email-jezz@sysmic.org>
Message-ID: <20130917203313.0da278a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 17 Sep 2013 11:53:09 +0200, J?r?me Pouiller wrote:
> For many EGL libraries, Qt5 need special instructions to compile correctly. 
> This patch implement a more generic way to customize Qt5 compilation.
> 
> In add, it fix support for Rasberry Pi and Vivante GPUs.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

I'm sorry, but this really looks ugly, and doesn't seem needed at all.
We already have a working solution for this problem (which we already
had for the RPi, and we solved in a much nicer way I believe) :

 (1) The OpenGL implementation should install proper pkg-config files
     to allow Qt5 to get the right compilation flags/libraries. See the
     "gpu-viv-bin-mx6q: add pkgconfig files for EGL and OpenGLESv2"
     patch that Fatih has sent today.

 (2) We already have a mechanism in qt5.mk to customize the EGL
     platform hook implementation. It just need to be extended to cover
     the i.MX6 case. I.e, next to:

ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
        $(@D)/mkspecs/devices/linux-rasp-pi-g++/qeglfshooks_pi.cpp
endif

     one should add:

ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q),y)
QT5BASE_EGLFS_PLATFORM_HOOKS_SOURCES = \
	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp
endif

If someone makes a patch with both of these changes, then it'll have my
Acked-by.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
