From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Aug 2011 09:36:41 +0200
Subject: [Buildroot] [PATCH v2] add QWT library: Qt Widgets for
	Technical Applications
In-Reply-To: <1312591577-30383-1-git-send-email-ivan.kuten@promwad.com> (Ivan
 Kuten's message of "Sat, 6 Aug 2011 03:46:17 +0300")
References: <4E3C283A.7070406@promwad.com>
 <1312591577-30383-1-git-send-email-ivan.kuten@promwad.com>
Message-ID: <8762m9n052.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ivan" == Ivan Kuten <ivan.kuten@promwad.com> writes:

Hi,

 Ivan> Signed-off-by: Ivan Kuten <ivan.kuten@promwad.com>
 Ivan> ---
 Ivan> :100644 100644 7112e05... e442e09... M	package/Config.in
 Ivan> :000000 100644 0000000... c927a7b... A	package/qwt/Config.in
 Ivan> :000000 100644 0000000... 2f25cc4... A	package/qwt/qwt.mk
 Ivan>  package/Config.in     |    1 +
 Ivan>  package/qwt/Config.in |   10 ++++++++++
 Ivan>  package/qwt/qwt.mk    |   44 ++++++++++++++++++++++++++++++++++++++++++++
 Ivan>  3 files changed, 55 insertions(+), 0 deletions(-)

 Ivan> diff --git a/package/Config.in b/package/Config.in
 Ivan> index 7112e05..e442e09 100644
 Ivan> --- a/package/Config.in
 Ivan> +++ b/package/Config.in
 Ivan> @@ -293,6 +293,7 @@ source "package/libsvgtiny/Config.in"
 Ivan>  source "package/libungif/Config.in"
 Ivan>  source "package/pango/Config.in"
 Ivan>  source "package/pixman/Config.in"
 Ivan> +source "package/qwt/Config.in"

Sorry, I didn't got to reply on Thomas' mail before you reposted, but I
prefer to keep this together with qt as it is very qt dependent (just
like we do for all the xorg stuff).

 Ivan>  source "package/tiff/Config.in"
 Ivan>  source "package/webkit/Config.in"
 Ivan>  endmenu
 Ivan> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
 Ivan> new file mode 100644
 Ivan> index 0000000..c927a7b
 Ivan> --- /dev/null
 Ivan> +++ b/package/qwt/Config.in
 Ivan> @@ -0,0 +1,10 @@
 Ivan> +comment "Qwt requires Qt to be installed"
 Ivan> +	depends on !BR2_PACKAGE_QT
 Ivan> +

If you put it right after qt you can drop this.


 Ivan> +menuconfig BR2_PACKAGE_QWT

should be config.

 Ivan> +	bool "qwt"
 Ivan> +	depends on BR2_PACKAGE_QT
 Ivan> +	help
 Ivan> +	  Qt Widgets for Technical Applications
 Ivan> +
 Ivan> +	  http://qwt.sourceforge.net/

I don't know anything about qwt, but a colleague of mine did a qwt
package some time ago, which I haven't had time to cleanup and commit
yet, but he had options plot, widgets, svgitem and mathml. Some of these
require specific qt options to be enabled (like QT_SVG).

 Ivan> diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
 Ivan> new file mode 100644
 Ivan> index 0000000..2f25cc4
 Ivan> --- /dev/null
 Ivan> +++ b/package/qwt/qwt.mk
 Ivan> @@ -0,0 +1,44 @@
 Ivan> +#############################################################
 Ivan> +#
 Ivan> +# QWT
 Ivan> +#
 Ivan> +#############################################################
 Ivan> +QWT_VERSION = 6.0.0
 Ivan> +QWT_SOURCE = qwt-$(QWT_VERSION).tar.bz2
 Ivan> +QWT_SITE = https://sourceforge.net/projects/qwt/files/qwt/$(QWT_VERSION)/
 Ivan> +QWT_INSTALL_STAGING = YES
 Ivan> +QWT_DEPENDENCIES = qt
 Ivan> +QWT_CONFIG_FILE = qwt.pro

It seems you only use this variable once, so just drop it.

 Ivan> +
 Ivan> +define QWT_CONFIGURE_CMDS
 Ivan> +     $(QT_QMAKE) $(@D)/$(QWT_CONFIG_FILE)
 Ivan> +     $(SED) 's/+= QwtSvg/-= QwtSvg/' $(@D)/qwtconfig.pri
 Ivan> +     $(SED) 's/+= QwtDesigner/-= QwtDesigner/' $(@D)/qwtconfig.pri
 Ivan> +     $(SED) 's/+= QwtMathML/-= QwtMathML/' $(@D)/qwtconfig.pri
 Ivan> +endef

The other patch would also use the debug/shared library options of Qt to
build with/without debug / shared library.

FYI, here's his patch:

diff -urpN buildroot/package/qwt/Config.in buildroot-work/package/qwt/Config.in
--- buildroot/package/qwt/Config.in	1970-01-01 01:00:00.000000000 +0100
+++ buildroot-work/package/qwt/Config.in	2010-08-23 16:34:18.000000000 +0200
@@ -0,0 +1,65 @@
+menuconfig BR2_PACKAGE_QWT
+	bool "Qwt"
+	depends on BR2_PACKAGE_QT
+	help
+	  Qt widgets for technical applications
+
+	  http://qwt.sourceforge.net/
+
+if BR2_PACKAGE_QWT
+
+config BR2_PACKAGE_QWT_DEBUG
+	bool "Compile with debug support"
+	help
+	  If unsure, say N.
+
+choice
+	prompt "Library type"
+	default BR2_PACKAGE_QWT_STATIC if BR2_PACKAGE_QT_STATIC
+	default BR2_PACKAGE_QWT_SHARED if BR2_PACKAGE_QT_SHARED
+	help
+	  Selects the library type: Shared or Static
+
+config BR2_PACKAGE_QWT_SHARED
+	bool "Shared library"
+	help
+	  Create and use shared Qwt libraries.
+	  If you have multiple programs that depend on Qwt or intend to use
+	  plugins, say Y.
+
+config BR2_PACKAGE_QWT_STATIC
+	bool "Static Library"
+	help
+	  Create and use static Qwt libraries.
+	  If you don't have multiple programs on the target that depends on
+	  Qt, then this will save you quite some of storage space.
+	  If unsure, say Y.
+
+endchoice
+
+config BR2_PACKAGE_QWT_PLOT
+	bool "Plots"
+	help
+	  Includes all kinds of graph and plotting widgets.
+
+config BR2_PACKAGE_QWT_WIDGETS
+	bool "Widgets"
+	help
+	  Includes all kinds of add-on widgets such as dials, compasses,
+	  knobs, wheels, sliders, thermos, ...
+
+config BR2_PACKAGE_QWT_SVGITEM
+	bool "SVG Item"
+	select BR2_PACKAGE_QWT_PLOT
+	select BR2_PACKAGE_QT_XML
+	select BR2_PACKAGE_QT_SVG
+	help
+	  Add support to display svg images on the plot canvas.
+
+config BR2_PACKAGE_QWT_MATHML
+	bool "Math ML support"
+	select BR2_PACKAGE_QWT_PLOT
+	help
+	  Add support for MathML in Qwt.
+
+endif # BR2_PACKAGE_QWT
diff -urpN buildroot/package/qwt/qwt.mk buildroot-work/package/qwt/qwt.mk
--- buildroot/package/qwt/qwt.mk	1970-01-01 01:00:00.000000000 +0100
+++ buildroot-work/package/qwt/qwt.mk	2010-08-23 12:01:23.000000000 +0200
@@ -0,0 +1,105 @@
+######################################################################
+#
+# Qwt - Qt Widgets for Technical Application
+# http://qwt.sourceforge.net/
+######################################################################
+
+QWT_VERSION:=5.2.1
+QWT_SOURCE:=qwt-$(QWT_VERSION).tar.bz2
+QWT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/qwt/qwt/$(QWT_VERSION)/
+QWT_CAT:=$(BZCAT)
+QWT_TARGET_DIR:=$(BUILD_DIR)/qwt-$(QWT_VERSION)/src
+
+QWT_CONFIGURE:=#empty
+
+
+# Configuration options
+ifeq ($(BR2_PACKAGE_QWT_DEBUG),y)
+QWT_CONFIGURE+= CONFIG+=debug
+endif
+
+ifeq ($(BR2_PACKAGE_QWT_SHARED),y)
+QWT_CONFIGURE+= CONFIG+=QwtDll
+endif
+
+ifeq ($(BR2_PACKAGE_QWT_PLOT),y)
+QWT_CONFIGURE += CONFIG+=QwtPlot
+endif
+
+ifeq ($(BR2_PACKAGE_QWT_WIDGETS),y)
+QWT_CONFIGURE += CONFIG+=QwtWidgets
+endif
+
+ifeq ($(BR2_PACKAGE_QWT_SVGITEM),y)
+QWT_CONFIGURE += CONFIG+=QwtSVGItem
+endif
+
+ifeq ($(BR2_PACKAGE_QWT_MATHML),y)
+QWT_CONFIGURE += CONFIG+=QwtMathML
+endif
+
+
+QWT_PROJECT_FILE:=$(QWT_TARGET_DIR)/src.pro
+QWT_QMAKE_SPEC:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++
+
+# Variable for other Qt applications to use
+QWT_QMAKE:=$(STAGING_DIR)/usr/bin/qmake
+
+
+$(DL_DIR)/$(QWT_SOURCE):
+	$(call DOWNLOAD,$(QWT_SITE),$(QWT_SOURCE))
+
+qwt-source: $(DL_DIR)/$(QWT_SOURCE)
+
+$(QWT_TARGET_DIR)/.unpacked: $(DL_DIR)/$(QWT_SOURCE)
+	$(QWT_CAT) $(DL_DIR)/$(QWT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(QWT_TARGET_DIR)/.configured: $(QWT_TARGET_DIR)/.unpacked
+	$(QWT_QMAKE) $(QWT_PROJECT_FILE) -spec $(QWT_QMAKE_SPEC) -r $(QWT_CONFIGURE) -o $(QWT_TARGET_DIR)/Makefile
+	touch $@
+
+$(QWT_TARGET_DIR)/.compiled: $(QWT_TARGET_DIR)/.configured
+	$(MAKE) -C $(QWT_TARGET_DIR)
+	touch $@
+
+$(QWT_TARGET_DIR)/.installed: $(QWT_TARGET_DIR)/.compiled
+	mkdir -p $(STAGING_DIR)/usr/include/qwt
+	cp -dpf $(QWT_TARGET_DIR)/*.h $(STAGING_DIR)/usr/include/qwt
+	touch $@
+
+$(STAGING_DIR)/usr/lib/libqwt.a: $(QWT_TARGET_DIR)/.installed
+	cp -dpf $(QWT_TARGET_DIR)/../lib/libqwt.a $(STAGING_DIR)/usr/lib
+
+$(TARGET_DIR)/usr/lib/libqwt.so: $(QWT_TARGET_DIR)/.installed
+	cp -dpf $(QWT_TARGET_DIR)/../lib/libqwt.so* $(STAGING_DIR)/usr/lib/
+	cp -dpf $(QWT_TARGET_DIR)/../lib/libqwt.so* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libqwt.so.*
+
+
+ifeq ($(BR2_PACKAGE_QWT_SHARED),y)
+qwt: $(TARGET_DIR)/usr/lib/libqwt.so
+else
+qwt: $(STAGING_DIR)/usr/lib/libqwt.a
+endif
+
+
+qwt-clean:
+	-$(MAKE) -C $(QWT_TARGET_DIR) clean
+	-rm -rf $(STAGING_DIR)/usr/include/qwt
+	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
+ifeq ($(BR2_PACKAGE_QWT_SHARED),y)
+	-rm $(TARGET_DIR)/usr/lib/libqwt.so.*
+endif
+
+qwt-dirclean:
+	rm -rf $(QWT_TARGET_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(BR2_PACKAGE_QWT),y)
+TARGETS+=qwt
+endif

-- 
Bye, Peter Korsgaard
