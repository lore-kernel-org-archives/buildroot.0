From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 13:50:03 +0100
Subject: [Buildroot] [PATCHv5 1/1] qt: Add option to build and install
 tools on the target
In-Reply-To: <1330945827-17612-2-git-send-email-ismael.luceno@gmail.com>
References: <1330945827-17612-1-git-send-email-ismael.luceno@gmail.com>
 <1330945827-17612-2-git-send-email-ismael.luceno@gmail.com>
Message-ID: <20120305135003.71c080ed@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ismael,

I think you're going to get crazy, but...

Le Mon,  5 Mar 2012 09:10:27 -0200,
Ismael Luceno <ismael.luceno@gmail.com> a ?crit :

> @@ -583,6 +592,9 @@ define QT_INSTALL_STAGING_CMDS
>  	$(MAKE) -C $(@D) install
>  	mkdir -p $(HOST_DIR)/usr/bin
>  	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
> +ifneq ($(strip $(QT_TARGET_PROGRAMS-y)),)
> +	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS-y)) $(TARGET_DIR)/usr/bin
> +endif
>  	rm -rf $(HOST_DIR)/usr/mkspecs
>  	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
>  	$(QT_INSTALL_QT_CONF)

this will not work. You cannot do ifeq/ifneq tests within
define...endef blocks.

I have another question about:

+menuconfig BR2_PACKAGE_QT_TOOLS
+	bool "Compile and install tools"
+	depends on BR2_PACKAGE_QT_SQL_MODULE && BR2_PACKAGE_QT_GUI_MODULE
+	# SQL module is needed to build, but only required at run-time by a
+	# few tools (assistant, designer, qmlviewer).
+
+if BR2_PACKAGE_QT_TOOLS
+
+config BR2_PACKAGE_QT_TOOLS_QTCONFIG
+	bool "qtconfig"
+	depends on BR2_PACKAGE_QT_GUI_X11
+
+config BR2_PACKAGE_QT_TOOLS_QMLVIEWER
+	bool "qmlviewer"
+	depends on BR2_PACKAGE_QT_DECLARATIVE
+
+config BR2_PACKAGE_QT_TOOLS_QMLPLUGINDUMP
+	bool "qmlplugindump"
+	depends on BR2_PACKAGE_QT_DECLARATIVE
+
+endif # BR2_PACKAGE_QT_TOOLS
+
+comment "Tools need the SQL and GUI modules"
+	depends on !BR2_PACKAGE_QT_SQL_MODULE || !BR2_PACKAGE_QT_GUI_MODULE

So it means that *all* tools depend on the GUI module and SQL module,
and then qtconfig specifically needs X11 in addition to SQL and GUI,
and qmlviewer and qmlplugindump need the QtDeclarative module in
addition to SQL and GUI. I am a bit surprised that the qmlviewer and
qmlplugindump tools require the SQL module. Is this correct?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
