From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Sep 2018 22:51:58 +0200
Subject: [Buildroot] [PATCH v1 2/4] qt5virtualkeyboard: fix target
 install issue with 5.6
In-Reply-To: <20180903123747.5234-3-gael.portay@savoirfairelinux.com>
References: <20180903123747.5234-1-gael.portay@savoirfairelinux.com>
 <20180903123747.5234-3-gael.portay@savoirfairelinux.com>
Message-ID: <20180905225158.19fb21c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon,  3 Sep 2018 08:37:45 -0400, Ga?l PORTAY wrote:
> qt5virtualkeyboard 2.0 (shipped with Qt 5.6) installs the QML plugin
> under the directory Enterprise while the later versions install it
> without that directory.
> 
> Differentiate installation to target of the QML plugin according to the
> Qt major version in use.
> 
> Fixes:
> 
> 	>>> qt5virtualkeyboard 2.0 Installing to target  
> 	mkdir -p /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
> 	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib/qt/plugins/platforminputcontexts/libqtvirtualkeyboardplugin.so /home/gportay/src/buildroot/output/target/usr/lib/qt/plugins/platforminputcontexts
> 	cp -dpfr /home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard /home/gportay/src/buildroot/output/target/usr/qml/QtQuick
> 	cp: cannot stat '/home/gportay/src/buildroot/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/qml/QtQuick/VirtualKeyboard': No such file or directory
> 	package/pkg-generic.mk:310: recipe for target '/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed' failed
> 	make: *** [/home/gportay/src/buildroot/output/build/qt5virtualkeyboard-2.0/.stamp_target_installed] Error 1
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> index cbe24d27dc..a4c9492a91 100644
> --- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> +++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
> @@ -65,6 +65,16 @@ define QT5VIRTUALKEYBOARD_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>  endef
>  
> +ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Entreprise/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> +endef
> +else
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> +endef
> +endif

Here you are doing exactly the opposite of what your commit log says:
you are installing from /usr/qml/QtQuick/Entreprise/VirtualKeyboard for
the latest Qt 5.11 version, and from /usr/qml/QtQuick/VirtualKeyboard
for the older Qt 5.6 version.

This also doesn't match the build failure: the build failure happens
with qt5virtualkeyboard 2.0, which is used with Qt 5.6, and your patch
proposes to use exactly the same command for the old Qt as the one that
is unconditionally used today.

I.e:

> +else
> +define QT5VIRTUALKEYBOARD_INSTALL_TARGET_QML
> +	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick
> +endef

is exactly the same as:

> -	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/VirtualKeyboard $(TARGET_DIR)/usr/qml/QtQuick

So I guess your condition is inverted, and the patch was not
sufficiently tested ? :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
