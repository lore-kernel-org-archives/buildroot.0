From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 22:36:06 +0100
Subject: [Buildroot] [PATCH 1/2] Qwt package : added dependency to Qt5
 besides Qt.
In-Reply-To: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
References: <1453799061-7131-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160306223606.28f57abb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

Thanks for your patch, and sorry for the slow answer. Your patch came
right before we started closing things for 2016.02. Now that 2016.02 is
released, I'm looking at some older patches.

On Tue, 26 Jan 2016 10:04:20 +0100, David Picard wrote:
> Replaced the original select by depends on, due to recursive dependencies
> involving qt5base. Qwt optional modules not tested.
> 
> Signed-off-by: David Picard <davepiq@yahoo.fr>
> ---
>  package/qwt/Config.in | 20 +++++++++++++-------
>  package/qwt/qwt.mk    | 16 +++++++++++++++-
>  2 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index 8c7bc56..40b382b 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -1,7 +1,8 @@
>  config BR2_PACKAGE_QWT
>  	bool "qwt"
> -	depends on BR2_PACKAGE_QT
> -	depends on BR2_PACKAGE_QT_GUI_MODULE
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
> +	depends on BR2_PACKAGE_QT_GUI_MODULE || BR2_PACKAGE_QT5BASE_GUI
> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5BASE

I know this is what you're doing in your second patch, but I would
prefer to use:

	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
	select .... if BR2_PACKAGE_QT
	select .... if BR2_PACKAGE_QT5

So, could you rework your patch series to have a first patch that does
*not* introduce qt5 support, but simply switches the qwt package to:

	depends on BR2_PACKAGE_QT
	select .... if BR2_PACKAGE_QT

and then a second patch that introduces the qt5 support ?

>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
> -	select BR2_PACKAGE_QT_SVG
> +	depends on BR2_PACKAGE_QT_SVG || BR2_PACKAGE_QT5SVG

Please stay with the select model, as suggested above, so:

	select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
	select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5BASE
> +

Useless newline added.

>  
>  config BR2_PACKAGE_QWT_MATHML
>  	bool "MathML support"
> @@ -21,10 +23,14 @@ config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_QT_OPENGL_ES
> +	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE

I think this should rather be:

	select BR2_PACKAGE_QT_OPENGL_ES if \
		BR2_PACKAGE_QT && BR2_PACKAGE_HAS_LIBGLES && BR2_PACKAGE_HAS_LIBEGL
	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if \
		BR2_PACKAGE_QT5BASE && BR2_PACKAGE_QT5_GL_AVAILABLE

The differences with your approach are:

 * We really replicate the dependency of
   BR2_PACKAGE_QT5BASE_OPENGL_LIB, which is BR2_PACKAGE_QT5_GL_AVAILABLE

 * Thanks to using BR2_PACKAGE_QT5_GL_AVAILABLE, we potentially enable
   support on full OpenGL, and not only OpenGL ES.

> +comment "SVG support depends on Qt or Qt5 SVG module"
> +	depends on !BR2_PACKAGE_QT_SVG && !BR2_PACKAGE_QT5SVG

Comment was misplaced (should have been next to the SVG option) and is
no longer needed if you do a select, like suggested above.

> -comment "qwt depends on QT gui module"
> -	depends on BR2_PACKAGE_QT
> -	depends on !BR2_PACKAGE_QT_GUI_MODULE
> +comment "qwt depends on Qt or Qt5 gui module"
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
> +	depends on !BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5BASE_GUI

If you do the select above, this comment is no longer needed (so it can
be removed in the first preparation patch, as suggested above).

> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 8a46c25..cdb3008 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -8,7 +8,14 @@ QWT_VERSION = 6.1.2
>  QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
>  QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
>  QWT_INSTALL_STAGING = YES
> -QWT_DEPENDENCIES = qt
> +ifeq ($(BR2_PACKAGE_QT),y)
> +QWT_DEPENDENCIES += qt
> +endif
> +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> +QWT_DEPENDENCIES += qt5base
> +QT5_MAKE = $(HOST_DIR)/usr/bin/qmake -spec $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++

In package FOO, you should only define variables that start with "FOO",
so defining QT5_MAKE here is wrong. And you're not even using this
variable!

> +endif
> +
>  
>  QWT_LICENSE = LGPLv2.1 with exceptions
>  QWT_LICENSE_FILES = COPYING
> @@ -35,10 +42,17 @@ else
>  QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtOpenGL.*$$/\# QWT_CONFIG += QwtOpenGL/'
>  endif
>  
> +ifeq ($(BR2_PACKAGE_QT),y)
>  define QWT_CONFIGURE_CMDS
>  	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
>  	(cd $(@D); $(TARGET_MAKE_ENV) $(QT_QMAKE))
>  endef
> +else
> +define QWT_CONFIGURE_CMDS
> +	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
> +	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
> +endef
> +endif

Somewhat sad to duplicate the SED call, and the rest. What about:

ifeq ($(BR2_PACKAGE_QT),y)
QWT_QMAKE = $(QT_QMAKE)
else
QWT_QMAKE = $(QT5_QMAKE)
endif

define QWT_CONFIGURE_CMDS
	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
	(cd $(@D); $(TARGET_MAKE_ENV) $(QWT_QMAKE))
endef

Could you rework this patch to take into account those comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
