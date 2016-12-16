From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 16 Dec 2016 21:47:54 +0100
Subject: [Buildroot] [PATCH v3 5/7] Revert "qt5base: install bundled
 fonts to target"
In-Reply-To: <1481641171-10407-6-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-6-git-send-email-anaumann@ultratronik.de>
Message-ID: <20161216214754.0acb270a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Tue, 13 Dec 2016 15:59:29 +0100, Andreas Naumann <anaumann@ultratronik.de> wrote:

> From: Julien Corjon <corjon.j@ecagroup.com>
> 
> qtbase carries nor more fonts since c5ceabb9a1caf6b9b7615a28c3097f221772f645
> 
> This reverts commit cdfa21b06041eb601e0bea79f2c8f50e9d637384.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 79ad868..fffadad 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -230,14 +230,6 @@ define QT5BASE_INSTALL_TARGET_PLUGINS
>  	done
>  endef
>  
> -define QT5BASE_INSTALL_TARGET_FONTS
> -	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
> -		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
> -		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
> -	fi
> -endef
> -
> -
>  define QT5BASE_INSTALL_TARGET_EXAMPLES
>  	example_dirs=$$(cd $(@D)/examples; find . -mindepth 1 -maxdepth 1 -type d); \
>  	for example in $${example_dirs}; do \

The revert is not complete, there are two occurrence of QT5BASE_INSTALL_TARGET_FONTS left:

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index d240a0a58..5ae0b016e 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -235,14 +235,12 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),y)
 define QT5BASE_INSTALL_TARGET_CMDS
-       $(QT5BASE_INSTALL_TARGET_FONTS)
        $(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 else
 define QT5BASE_INSTALL_TARGET_CMDS
        $(QT5BASE_INSTALL_TARGET_LIBS)
        $(QT5BASE_INSTALL_TARGET_PLUGINS)
-       $(QT5BASE_INSTALL_TARGET_FONTS)
        $(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 endif


Regards,
Peter
