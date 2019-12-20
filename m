From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 20 Dec 2019 12:29:41 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-pyqt5: manage qt optional dependencies
In-Reply-To: <20190822220638.7304-1-fontaine.fabrice@gmail.com>
References: <20190822220638.7304-1-fontaine.fabrice@gmail.com>
Message-ID: <e3dbcc72-1431-ebe9-faa2-d9d9302a311e@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 8/23/19 12:06 AM, Fabrice Fontaine wrote:
> Explictly enable the needed pyqt5 modules depending on Qt5 options or
> packages
> 
> QtQuick moodule can't be built without opengl support so enable only
> when OpenGL is available
> 
> Fixes:
>   - https://bugs.buildroot.org/show_bug.cgi?id=12121
>   - http://autobuild.buildroot.org/results/cb69c5daa564aa9f3250faa395399cb00a445e85

I've tested building in every case, including qt5webengine adding the 
patch contained in this br patch:
https://patchwork.ozlabs.org/patch/1138934/

So:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni and Arnout
> Vandecappelle):
>   - Explicitly enable modules through --enable=module in addition to
>     managing dependencies. As this is bypassing current autodetection
>     mechanism, I would advise to apply it for next and not for master
> 
>   package/python-pyqt5/python-pyqt5.mk | 108 ++++++++++++++++++++++++++-
>   1 file changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
> index 4955936ae3..b6d559cd5b 100644
> --- a/package/python-pyqt5/python-pyqt5.mk
> +++ b/package/python-pyqt5/python-pyqt5.mk
> @@ -11,6 +11,14 @@ PYTHON_PYQT5_LICENSE = GPL-3.0
>   PYTHON_PYQT5_LICENSE_FILES = LICENSE
>   
>   PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
> +PYTHON_PYQT5_MODULES = \
> +	QtCore \
> +	$(if $(BR2_PACKAGE_QT5BASE_DBUS),QtDBus) \
> +	$(if $(BR2_PACKAGE_QT5BASE_GUI),QtGui) \
> +	$(if $(BR2_PACKAGE_QT5BASE_NETWORK),QtNetwork) \
> +	$(if $(BR2_PACKAGE_QT5BASE_OPENGL_LIB),QtOpenGL) \
> +	$(if $(BR2_PACKAGE_QT5BASE_PRINTSUPPORT),QtPrintSupport) \
> +	$(if $(BR2_PACKAGE_QT5BASE_XML),QtXml)
>   
>   ifeq ($(BR2_PACKAGE_PYTHON),y)
>   PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
> @@ -20,6 +28,103 @@ PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
>   PYTHON_PYQT5_RM_PORT_BASE = port_v2
>   endif
>   
> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
> +PYTHON_PYQT5_MODULES += QtWidgets
> +
> +# QtSql needs QtWidgets
> +ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
> +PYTHON_PYQT5_MODULES += QtSql
> +endif
> +
> +# QtTest needs QtWidgets
> +ifeq ($(BR2_PACKAGE_QT5BASE_TEST),y)
> +PYTHON_PYQT5_MODULES += QtTest
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5CONNECTIVITY),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5connectivity
> +PYTHON_PYQT5_MODULES += QtBluetooth QtNfc
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5declarative
> +PYTHON_PYQT5_MODULES += QtQml
> +
> +# QtQuick module needs opengl
> +ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_OPENGL_LIB),yy)
> +PYTHON_PYQT5_MODULES += \
> +	QtQuick \
> +	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtQuickWidgets)
> +endif
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5ENGINIO),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5enginio
> +PYTHON_PYQT5_MODULES += Enginio
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5LOCATION),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5location
> +PYTHON_PYQT5_MODULES += QtLocation QtPositioning
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5multimedia
> +PYTHON_PYQT5_MODULES += \
> +	QtMultimedia \
> +	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtMultimediaWidgets)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5SENSORS),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5sensors
> +PYTHON_PYQT5_MODULES += QtSensors
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5serialport
> +PYTHON_PYQT5_MODULES += QtSerialPort
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5SVG),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5svg
> +PYTHON_PYQT5_MODULES += QtSvg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBCHANNEL),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
> +PYTHON_PYQT5_MODULES += QtWebChannel
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBENGINE),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5webengine
> +PYTHON_PYQT5_MODULES += \
> +	QtWebEngineCore \
> +	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebEngineWidgets)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5webkit
> +PYTHON_PYQT5_MODULES += \
> +	QtWebKit \
> +	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebKitWidgets)
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5WEBSOCKETS),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5websockets
> +PYTHON_PYQT5_MODULES += QtWebSockets
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5X11EXTRAS),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5x11extras
> +PYTHON_PYQT5_MODULES += QtX11Extras
> +endif
> +
> +ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
> +PYTHON_PYQT5_DEPENDENCIES += qt5xmlpatterns
> +PYTHON_PYQT5_MODULES += QtXmlPatterns
> +endif
> +
>   PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
>   
>   PYTHON_PYQT5_QTDETAIL_TYPE = shared
> @@ -52,7 +157,8 @@ PYTHON_PYQT5_CONF_OPTS = \
>   	-w --confirm-license \
>   	--no-designer-plugin \
>   	--no-docstrings \
> -	--no-sip-files
> +	--no-sip-files \
> +	$(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
>   
>   define PYTHON_PYQT5_CONFIGURE_CMDS
>   	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
> 
