From: Fatih =?UTF-8?Q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 17 Sep 2013 14:35:12 +0300
Subject: [Buildroot] [PATCH v1] Fix EGL support in qt5base
In-Reply-To: <1379411589-8935-1-git-send-email-jezz@sysmic.org>
References: <CA+csPL67CJSJHgfhgnJJfBcw+LUszPWT3VwFCEFw5n3Oy4jN1Q@mail.gmail.com>
 <1379411589-8935-1-git-send-email-jezz@sysmic.org>
Message-ID: <1379417712.13187.12.camel@viko>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 2013-09-17 at 11:53 +0200, J?r?me Pouiller wrote:
> +else ifeq ($(BR2_PACKAGE_GPU_VIV_BIN_MX6Q)x$(BR2_PACKAGE_XORG7),yx)
> +define QT5BASE_EXTRA_OPTIONS
> +EGLFS_PLATFORM_HOOKS_SOURCES = \
> +	$(@D)/mkspecs/devices/linux-imx6-g++/qeglfshooks_imx6.cpp   \n\
> +QMAKE_CFLAGS += -DEGL_API_FB=1                                      \n\
> +QMAKE_CXXFLAGS += -DEGL_API_FB=1                                    \n\
> +QMAKE_LIBS_OPENGL_ES2 += -lEGL -lGAL                                \n\
> +QMAKE_LIBS_OPENVG += -lEGL -lGAL                                    \n

Hardcoding device specific code in qt5base.mk is not nice; but it seems
impossible to get rid of them since qt needs a platform hook path.

I have sent a patch to the list which adds .pc files to gpu-viv-bin-mx6q
package. This helps qt5 to get needed flags; but for the platform
hook .mk file still needs to be modified.

I have also sent a bug report[1] to qt developers for another file with
hardcoded EGL flags.

[1] https://bugreports.qt-project.org/browse/QTBUG-33494
