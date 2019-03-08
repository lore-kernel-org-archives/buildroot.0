From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 Mar 2019 19:07:50 +0100
Subject: [Buildroot] [PATCH] qt5virtualkeyboard: Install new library
In-Reply-To: <0bc4e8bf-5b7a-69e2-4443-6936700a132f@starleaf.com>
References: <0bc4e8bf-5b7a-69e2-4443-6936700a132f@starleaf.com>
Message-ID: <20190308180750.GW2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2019-03-08 17:09 +0000, Mark Thompson spake thusly:
> Between Qt 5.11 and 5.12 the virtual keyboard package gained a new top-level
> library, libQt5VirtualKeyboard.so, which is then used by all of the plugins
> it installs.  This change makes Buildroot aware of the new library so that
> we install it to the target filesystem.
> 
> Signed-off-by: Mark Thompson <mark.thompson@starleaf.com>
> ---
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index 8ce3169774..6c255c98da 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -75,6 +75,12 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>  endef
>  
> +ifeq ($(BR2_STATIC_LIBS),)
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS
> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5VirtualKeyboard*.so.* $(TARGET_DIR)/usr/lib
> +endef
> +endif

You said that this new library was introduced with qt-5.12, but here you
define it unconditionally...

>  ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>  define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
>  	mkdir -p $(TARGET_DIR)/usr/qml/QtQuick/Enterprise
> @@ -97,6 +103,7 @@ define QT5VIRTUALKEYBOARD_INSTALL_TARGET_CMDS
>  	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
>  	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so \
>  		$(TARGET_DIR)/usr/lib/qt/plugins/platforminputcontexts
> +	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_LIBS)

... and here you use it unconditionally, which means that, when qt-5.6
is enabled, this code will still be used, and thus the copy will be
attempted, but will fail as the library does not exist in before
qt-5.12.

Regards,
Yann E. MORIN.

>  	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML)
>  	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_3RDPARTY_PARTS)
>  	$(QT5VIRTUALKEYBOARD_INSTALL_TARGET_EXAMPLES)
> -- 
> 2.17.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
