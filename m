From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 24 Jan 2008 09:48:57 +1100
Subject: [Buildroot] [PATCH] more python enhancements
In-Reply-To: <20080121001030.GA19176@cloud.net.au>
References: <20080118025745.GA30978@cloud.net.au>
	<20080118123750.GA14604@aon.at>
	<20080121001030.GA19176@cloud.net.au>
Message-ID: <20080123224857.GB12013@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 21, 2008 at 11:10:30AM +1100, Hamish Moffatt wrote:
> New patch attached.

Could somebody apply this please? Bernard?

thanks,
Hamish

> Index: python.mk
> ===================================================================
> --- ./package/python/python.mk.orig
> +++ ./package/python/python.mk
> @@ -4,6 +4,7 @@
>  #
>  #############################################################
>  PYTHON_VERSION=2.4.2
> +PYTHON_VERSION_SHORT=2.4
>  PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
>  PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
>  PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
> @@ -136,13 +137,31 @@
>  	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
>  	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
>  		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
> -		$(TARGET_DIR)/usr/lib/python*/test
> +		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/test
> +	cp -dpr $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT) $(STAGING_DIR)/usr/include/
> +	mkdir -p $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)
> +	cp -dpr $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/
> +
>  ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
>  	find $(TARGET_DIR)/usr/lib/ -name '*.pyc' -exec rm {} \;
>  endif
>  ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
>  	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
>  endif
> +ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
> +	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_SHORT)
> +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/config
> +	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
> +endif
> +ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
> +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/bsddb
> +endif
> +ifneq ($(BR2_PACKAGE_PYTHON_CURSES),y)
> +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/curses
> +endif
> +ifneq ($(BR2_PACKAGE_PYTHON_TKINTER),y)
> +	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/lib-tk
> +endif
>  
>  python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
>  
> Index: Config.in
> ===================================================================
> --- ./package/python/Config.in.orig
> +++ ./package/python/Config.in
> @@ -6,6 +6,14 @@
>  
>  	  http://www.python.org/
>  
> +config BR2_PACKAGE_PYTHON_DEV
> +	depends on BR2_PACKAGE_PYTHON
> +	bool "development files on target"
> +	default n
> +	help
> +	  If enabled, development files (headers and static libpython) will be
> +	  installed on the target.
> +
>  choice
>  	prompt "Module format to install"
>  	depends on BR2_PACKAGE_PYTHON


-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-python3.patch
Type: text/x-diff
Size: 2389 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080124/b53fca3b/attachment.bin 
