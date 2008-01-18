From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 18 Jan 2008 13:37:50 +0100
Subject: [Buildroot] [PATCH] more python enhancements
In-Reply-To: <20080118025745.GA30978@cloud.net.au>
References: <20080118025745.GA30978@cloud.net.au>
Message-ID: <20080118123750.GA14604@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 18, 2008 at 01:57:45PM +1100, Hamish Moffatt wrote:
>Here's another improvement to the Python package.
>
>1. Don't install the development headers, tools and static library into
>the target system unless new configuration item is enabled.
>
>2. Always install the development headers etc into the staging_dir, so
>they can be used to build extension modules.
>
>
>Hamish
>-- 
>Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

>Index: python.mk
>===================================================================
>--- python.mk	(.../mirror/buildroot/package/python)	(revision 3461)
>+++ python.mk	(.../beethoven/elara/trunk/buildroot/package/python)	(revision 3461)
>@@ -4,6 +4,7 @@
> #
> #############################################################
> PYTHON_VERSION=2.4.2
>+PYTHON_VERSION_SHORT=2.4
> PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
> PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
> PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
>@@ -136,16 +137,36 @@
> 	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
> 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
> 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
>-		$(TARGET_DIR)/usr/lib/python*/test
>+		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/test
>+	cp -a $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/

NO.
There is no portable "cp -a", either use $(INSTALL) which would be
preferred or if nothing else helps cp -dpf

>+	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)
>+	cp -a $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/

$(INSTALL) -D 

>+
> ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
> 	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
> endif
> ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
> 	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
> endif
>+ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
>+	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
>+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config
>+	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
>+endif
>+ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
>+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/bsddb
>+endif
>+ifneq ($(BR2_PACKAGE_PYTHON_CURSES),y)
>+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/curses
>+endif
>+ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
>+	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/lib-tk
>+endif
> 
> python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
> 
>+python-test:
>+	@echo Version = $(PYTHON_VERSION)

What's that supposed to do? remove this, please.

> python-clean:
> 	-$(MAKE) -C $(PYTHON_DIR) distclean
> 	rm $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
>Index: Config.in
>===================================================================
>--- Config.in	(.../mirror/buildroot/package/python)	(revision 3461)
>+++ Config.in	(.../beethoven/elara/trunk/buildroot/package/python)	(revision 3461)
>@@ -6,6 +6,14 @@
> 
> 	  http://www.python.org/
> 
>+config BR2_PACKAGE_PYTHON_DEV
>+	depends on BR2_PACKAGE_PYTHON
>+	bool "development files on target"
>+	default n
>+	help
>+	  If enabled, development files (headers and static libpython) will be
>+	  installed on the target.

It would be saner to have this as one central know like i did for
HAVE_{MAN,INFO}PAGES, fwiw (at least that's what i have in my tree).

regards,
