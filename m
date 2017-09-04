From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 4 Sep 2017 23:44:02 +0200
Subject: [Buildroot] [RFC PATCH] qt5tools: Install QDesignerExportWidget
	include
In-Reply-To: <1504073010-14243-1-git-send-email-alan@tkos.co.il>
References: <1504073010-14243-1-git-send-email-alan@tkos.co.il>
Message-ID: <20170904234402.35899509@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alan,

On Wed, 30 Aug 2017 09:03:30 +0300, Alan Yaniger <alan@tkos.co.il> wrote:

> To build a custom widget exposed to QtDesigner, the widget should 
> include the file QtUiPlugin/QDesignerExportWidget. Without this patch,
> the include file is not installed in ${STAGING_DIR}/usr/include/qt5. 
> 

Would have expected no dependency for the non-plugin-code, but even
the example from [1],[2] uses the QDesingerExportWidget include in the
non-plugin-code...

I would prefer some solution like:

diff --git a/analogclock.h b/analogclock.h
index b81a81e..1ac4b0f 100644
--- a/analogclock.h
+++ b/analogclock.h
@@ -52,7 +52,11 @@
 #define ANALOGCLOCK_H
 
 #include <QWidget>
+#if defined(COMPILE_FOR_DESINGER_PLUGIN)
 #include <QtUiPlugin/QDesignerExportWidget>
+#else
+#define QDESIGNER_WIDGET_EXPORT
+#endif

to use QDesignerExportWidget/QDESIGNER_WIDGET_EXPORT only for the plugin compile...

> The file QDesignerExportWidget in the qt5tools tarball is just an 
> include of the file qdesignerexportwidget.h, which itself includes the

Yes.

> file qdesignerexportwidget.h, identified by a relative path 
> "../../src/designer/src/uiplugin/qdesignerexportwidget.h". That 

No, you located the wrong file from build/qt5tools-5.9.1/include/QtUiPlugin/qdesignerexportwidget.h
the right one would be build/qt5tools-5.9.1/src/designer/src/uiplugin/qdesignerexportwidget.h
which is the one which would be installed from the build/qt5tools-5.9.1/src/designer/src/uiplugin/Makefile

> relative path will not work in the staging dir, so just copy 
> qdesignerexportwidget.h into staging, and give it the name 
> QtUiPlugin/QDesignerExportWidget.
> 
> If anyone has a better way to install this file, using the Qt build 
> system instead of "cp", I would be happy to revise the patch.

Use the install_targ_headers target in build/qt5tools-5.9.1/src/designer/src/uiplugin/Makefile
but this will install some more (unneeded) headers...

> 
> Signed-off-by: Alan Yaniger <alan@tkos.co.il>
> ---
>  package/qt5/qt5tools/qt5tools.mk | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
> index 3638b74..96a3c65 100644
> --- a/package/qt5/qt5tools/qt5tools.mk
> +++ b/package/qt5/qt5tools/qt5tools.mk
> @@ -31,7 +31,7 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
>  	linguist/lconvert linguist/lrelease linguist/lupdate
>  ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
>  # use install target to copy cmake module files
> -define QT5TOOLS_INSTALL_STAGING_CMDS
> +define QT5TOOLS_LINGUIST_TOOLS_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist install
>  endef
>  endif
> @@ -58,6 +58,19 @@ define QT5TOOLS_BUILD_CMDS
>  		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
>  endef
>  
> +ifeq ($(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO),y)

This has nothing to do with the qtplugininfo executable, add an
extra config option in the Config.in file, e.g.:

  config BR2_PACKAGE_QT5TOOLS_DESIGNER_HEADERS
         boot "qtdesigner minimal headers"
         help
           Install the qtdesigner minimal header files for
           the QtUiPlugin/QDesignerExportWidget include (does
           not compile/install the complete designer).

> +define QT5TOOLS_QTPLUGININFO_INSTALL_STAGING_CMDS
> +	$(INSTALL) -D -m0644 \
> +		$(@D)/src/designer/src/uiplugin/qdesignerexportwidget.h \
> +		$(STAGING_DIR)/usr/include/qt5/QtUiPlugin/QDesignerExportWidget
> +endef
> +endif

Change to install qt5tools-5.9.1/include/QtUiPlugin/QDesignerExportWidget
and qt5tools-5.9.1/src/designer/src/uiplugin/qdesignerexportwidget.h
into the $(STAGING_DIR)/usr/include/qt5/QtUiPlugin directory...

Regards,
Peter

[1] http://doc.qt.io/qt-5/qtdesigner-customwidgetplugin-example.html
[2] http://doc.qt.io/qt-5/qtdesigner-customwidgetplugin-analogclock-h.html

> +
> +define QT5TOOLS_INSTALL_STAGING_CMDS
> +	$(QT5TOOLS_LINGUIST_TOOLS_INSTALL_STAGING_CMDS)
> +	$(QT5TOOLS_QTPLUGININFO_INSTALL_STAGING_CMDS)
> +endef
> +
>  define QT5TOOLS_INSTALL_TARGET_CMDS
>  	$(foreach p,$(QT5TOOLS_INSTALL_TARGET_y), \
>  		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
