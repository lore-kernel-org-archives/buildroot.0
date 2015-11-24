From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Nov 2015 23:40:53 +0100
Subject: [Buildroot] [PATCH] qt5base: support OVERRIDE_SRCDIR
In-Reply-To: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
References: <1448400109-32767-1-git-send-email-peter@korsgaard.com>
Message-ID: <20151124224053.GC3904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-11-24 22:21 +0100, Peter Korsgaard spake thusly:
> With OVERRIDE_SRCDIR we don't apply any of the qt5base patches, but the
> custom specs files are needed to be able to build - So install these in the
> configure step instead of having them as a patch.

IMHO, it make more sense to install them at post-patch (or post-extract)
rather than at the beginning of the configure step.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qt5/qt5base/0002-mkspecs-files.patch | 41 ----------------------------
>  package/qt5/qt5base/qmake.conf               | 24 ++++++++++++++++
>  package/qt5/qt5base/qplatformdefs.h          |  1 +
>  package/qt5/qt5base/qt5base.mk               |  4 +++
>  4 files changed, 29 insertions(+), 41 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0002-mkspecs-files.patch
>  create mode 100644 package/qt5/qt5base/qmake.conf
>  create mode 100644 package/qt5/qt5base/qplatformdefs.h
> 
> diff --git a/package/qt5/qt5base/0002-mkspecs-files.patch b/package/qt5/qt5base/0002-mkspecs-files.patch
> deleted file mode 100644
> index adeabdf..0000000
> --- a/package/qt5/qt5base/0002-mkspecs-files.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -Add a Buildroot 'device' to ease cross-compilation
> -
> -Qt5 has a mechanism to support "device" profiles, so that people can
> -specify the compiler, compiler flags and so on for a specific device.
> -
> -We leverage this mechanism in the Buildroot packaging of qt5 to
> -simplify cross-compilation: we have our own "device" definition, which
> -allows us to easily pass the cross-compiler paths and flags from our
> -qt5.mk.
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -[Arnout: remove ccache support]
> -Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> -
> -Index: b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -===================================================================
> ---- /dev/null
> -+++ b/mkspecs/devices/linux-buildroot-g++/qmake.conf
> -@@ -0,0 +1,16 @@
> -+include(../common/linux_device_pre.conf)
> -+
> -+# modifications to g++-unix.conf
> -+QMAKE_CC                = $${CROSS_COMPILE}gcc
> -+QMAKE_CXX               = $${CROSS_COMPILE}g++
> -+
> -+#modifications to gcc-base.conf
> -+QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
> -+QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
> -+QMAKE_CXXFLAGS_RELEASE += -O3
> -+CONFIG                 += nostrip
> -+
> -+QMAKE_LIBS             += -lrt -lpthread -ldl
> -+
> -+include(../common/linux_device_post.conf)
> -+load(qt_config)
> -Index: b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> -===================================================================
> ---- /dev/null
> -+++ b/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
> -@@ -0,0 +1 @@
> -+#include "../../linux-g++/qplatformdefs.h"
> diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
> new file mode 100644
> index 0000000..2152d3c
> --- /dev/null
> +++ b/package/qt5/qt5base/qmake.conf
> @@ -0,0 +1,24 @@
> +# Qt5 has a mechanism to support "device" profiles, so that people can
> +# specify the compiler, compiler flags and so on for a specific device.
> +
> +# We leverage this mechanism in the Buildroot packaging of qt5 to
> +# simplify cross-compilation: we have our own "device" definition, which
> +# allows us to easily pass the cross-compiler paths and flags from our
> +# qt5.mk.
> +
> +include(../common/linux_device_pre.conf)
> +
> +# modifications to g++-unix.conf
> +QMAKE_CC                = $${CROSS_COMPILE}gcc
> +QMAKE_CXX               = $${CROSS_COMPILE}g++
> +
> +# modifications to gcc-base.conf
> +QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
> +QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
> +QMAKE_CXXFLAGS_RELEASE += -O3
> +CONFIG                 += nostrip
> +
> +QMAKE_LIBS             += -lrt -lpthread -ldl
> +
> +include(../common/linux_device_post.conf)
> +load(qt_config)
> diff --git a/package/qt5/qt5base/qplatformdefs.h b/package/qt5/qt5base/qplatformdefs.h
> new file mode 100644
> index 0000000..99e9a27
> --- /dev/null
> +++ b/package/qt5/qt5base/qplatformdefs.h
> @@ -0,0 +1 @@
> +#include "../../linux-g++/qplatformdefs.h"
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 827a85e..6eeb619 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -179,6 +179,10 @@ endef
>  endif
>  
>  define QT5BASE_CONFIGURE_CMDS
> +	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
> +	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
> +		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
>  	$(QT5BASE_CONFIGURE_CONFIG_FILE)
>  	(cd $(@D); \
>  		$(TARGET_MAKE_ENV) \
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
