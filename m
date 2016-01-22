From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Jan 2016 19:19:41 +0100
Subject: [Buildroot] [PATCH 2/2] Qwt package : added dependency to Qt5
 besides Qt.
In-Reply-To: <1453484674-8951-2-git-send-email-davepiq@yahoo.fr>
References: <1453484674-8951-1-git-send-email-davepiq@yahoo.fr>
 <1453484674-8951-2-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160122181941.GB3774@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

On 2016-01-22 18:44 +0100, David Picard spake thusly:
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

You may want to use the top-level Qt5 option;

    depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5

It will be more "symetric".

(Note that BR2_PACKAGE_QT5BASE is forcibly enabled when BR2_PACKAGE_QT5
is enabled.)

> +	depends on BR2_PACKAGE_QT_GUI_MODULE || BR2_PACKAGE_QT5BASE_GUI

I don't know why we had that as a depends, it probably should be a
select (the GUI modules, whether qt4 or Qt5) have no dependency (except
for rep. Qt and Qt5, of course), so we can select them:

    select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
    select BR2_PACKAGE_QT5BASE_GUI   if BR2_PACKAGE_QT5

> +	select BR2_PACKAGE_QT5BASE_CONCURRENT if BR2_PACKAGE_QT5BASE

OK.

>  	help
>  	  Qwt is a graphics extension to the Qt GUI application
>  	  framework. It provides a 2D plotting widget and more.
> @@ -12,7 +13,8 @@ if BR2_PACKAGE_QWT
>  
>  config BR2_PACKAGE_QWT_SVG
>  	bool "SVG support"
> -	select BR2_PACKAGE_QT_SVG
> +	depends on BR2_PACKAGE_QT_SVG || BR2_PACKAGE_QT5SVG

You could probably do something a bit better, usign a select like it was
done previously:

    select BR2_PACKAGE_QT_SVG if BR2_PACKAGE_QT
    select BR2_PACKAGE_QT5SVG if BR2_PACKAGE_QT5

(QT_SVG needs QT_GUI_MODULE, but it's already accounted for in the main
QWT symbol; QT5SVG had no dependency.)

>  config BR2_PACKAGE_QWT_MATHML
>  	bool "MathML support"
> @@ -21,10 +23,14 @@ config BR2_PACKAGE_QWT_OPENGL
>  	bool "OpenGL support"
>  	depends on BR2_PACKAGE_HAS_LIBGLES
>  	depends on BR2_PACKAGE_HAS_LIBEGL
> -	select BR2_PACKAGE_QT_OPENGL_ES
> +	select BR2_PACKAGE_QT_OPENGL_ES if BR2_PACKAGE_QT
> +	select BR2_PACKAGE_QT5BASE_OPENGL_LIB if BR2_PACKAGE_QT5BASE

BR2_PACKAGE_QT5BASE_OPENGL_LIB depends on BR2_PACKAGE_QT5BASE_OPENGL, so
it should have been selected too.

However, I'm a bit worried about the complexity here, and I'd rather
that we depend on such support rather than select it. So I'd prefer to
see:

    depends on BR2_PACKAGE_QT_OPENGL_ES || BR2_PACKAGE_QT5BASE_OPENGL_LIB

> +comment "SVG support depends on Qt or Qt5 SVG module"
> +	depends on !BR2_PACKAGE_QT_SVG && !BR2_PACKAGE_QT5SVG

This comment should be right below the SVG option. But if you use a
select, there's no longer any need for a comment.

>  endif
>  
> -comment "qwt depends on QT gui module"
> -	depends on BR2_PACKAGE_QT
> -	depends on !BR2_PACKAGE_QT_GUI_MODULE

Please leave a separating line between the two comments.

> +comment "qwt depends on Qt or Qt5 gui module"
> +	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5BASE
> +	depends on !BR2_PACKAGE_QT_GUI_MODULE && !BR2_PACKAGE_QT5BASE_GUI

Well, we normally do not add such comments, except:

    comment "qwt needs Qt or Qt5"
        depends on !BR2_PACKAGE_QT && !BR2_PACKAGE_QT5

> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
> index 8a46c25..cdb3008 100644
> --- a/package/qwt/qwt.mk
> +++ b/package/qwt/qwt.mk
> @@ -8,7 +8,14 @@ QWT_VERSION = 6.1.2
>  QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
>  QWT_SITE = http://downloads.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)
>  QWT_INSTALL_STAGING = YES
> -QWT_DEPENDENCIES = qt

Please add an empty line here, the conditional block will more clearly
stand-out and will be either to (re)view.

> +ifeq ($(BR2_PACKAGE_QT),y)
> +QWT_DEPENDENCIES += qt
> +endif
> +ifeq ($(BR2_PACKAGE_QT5BASE),y)
> +QWT_DEPENDENCIES += qt5base
> +QT5_MAKE = $(HOST_DIR)/usr/bin/qmake -spec $(HOST_DIR)/mkspecs/devices/linux-buildroot-g++

Do not override QT5_MAKE, it's already set in the main Qt5 .mk and can
be re-used as-is.

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

I know the Qt4 case use () around the second command, but that's not
necessary; pleas use:

        cd $(@D) && $(TARGET_MAKE_ENV) $(QT5_QMAKE)

(and please fix the Qt4 case similarly, will you? ;-) )

Otherwise, the overall idea is OK. For a first patch, this is pretty
good. :-)

Regards,
Yann E. MORIN.

> +endef
> +endif
>  
>  define QWT_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> -- 
> 1.9.1
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
