From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 08 May 2008 02:31:26 +0200
Subject: [Buildroot] buildroot - python problem
In-Reply-To: <20080508002716.GB5014@cloud.net.au>
References: <223E6519BDCAC74695BEE9D163F8E6592218AB@oakleaf10.oakleafconsultancy.com>
	<c166aa9f0805070734h10591bf3sbdf6c6b5bc696c04@mail.gmail.com>
	<079f01c8b054$166a3620$060514ac@atmel.com>
	<20080508002716.GB5014@cloud.net.au>
Message-ID: <1210206686.29431.8.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2008-05-08 klockan 10:27 +1000 skrev Hamish Moffatt:
> On Wed, May 07, 2008 at 05:07:18PM +0200, Ulf Samuelsson wrote:
> > The python.mk looks pretty unclean to me.
> > Should not the host python be built in the toolchain directory,
> > and the result moved to STAGING_DIR?
> > Then it could be easily be used for other stuff as well.
> 
> I'm using the python package here and never saw the problem reported in
> this thread. Your suggestion of installing properly into $STAGING_DIR
> seems reasonable though.
> 
> I am planning to update the package for Python 2.5 soon so I will fix
> that up at the same time. Next week hopefully.
> 
> Changing versions might break some people's code, so it may be necessary
> to support multiple versions and allow the user to choose. Do you other
> Python users have any comments on this?
> 
> Hamish

Here is a start, not tested yet...
Index: package/python/python.mk
===================================================================
--- package/python/python.mk	(revision 21945)
+++ package/python/python.mk	(arbetskopia)
@@ -8,6 +8,10 @@
 PYTHON_SOURCE:=Python-$(PYTHON_VERSION).tar.bz2
 PYTHON_SITE:=http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_DIR:=$(BUILD_DIR)/Python-$(PYTHON_VERSION)
+HOST_PYTHON_DIR:=$(TOOL_BUILD_DIR)/Python-$(PYTHON_VERSION)
+HOST_PYTHON:=$(STAGING_DIR)/bin/python
+HOST_PYTHON_PGEN:=$(HOST_PYTHON_DIR)/Parser/pgen
+
 PYTHON_CAT:=$(BZCAT)
 PYTHON_BINARY:=python
 PYTHON_TARGET_BINARY:=usr/bin/python
@@ -70,30 +74,39 @@
 $(DL_DIR)/$(PYTHON_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(PYTHON_SITE)/$(PYTHON_SOURCE)
 
-python-source: $(DL_DIR)/$(PYTHON_SOURCE)
-
-$(PYTHON_DIR)/.unpacked: $(DL_DIR)/$(PYTHON_SOURCE)
-	$(PYTHON_CAT) $(DL_DIR)/$(PYTHON_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
+$(HOST_PYTHON_DIR)/.unpacked: $(DL_DIR)/$(PYTHON_SOURCE)
+	$(PYTHON_CAT) $(DL_DIR)/$(PYTHON_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
 	touch $@
 
-$(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python\*.patch
+$(HOST_PYTHON_DIR)/.patched: $(HOST_PYTHON_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(HOST_PYTHON_DIR) package/python/ python
\*.patch
 	touch $@
 
-$(PYTHON_DIR)/.hostpython: $(PYTHON_DIR)/.patched
+$(HOST_PYTHON_DIR)/.configured: $(HOST_PYTHON_DIR)/.patched
 	(cd $(PYTHON_DIR); rm -rf config.cache; \
 		CC="$(HOSTCC)" OPT="-O2" \
 		./configure \
 		--with-cxx=no \
-		$(DISABLE_NLS) && \
-		$(MAKE) python Parser/pgen && \
-		mv python hostpython && \
-		mv Parser/pgen Parser/hostpgen && \
-		-$(MAKE) distclean \
-	) && \
+		$(DISABLE_NLS)
+	)
 	touch $@
 
-$(PYTHON_DIR)/.configured: $(PYTHON_DIR)/.hostpython
+$(HOST_PYTHON_DIR)/python: $(HOST_PYTHON_DIR)/.configured
+	$(MAKE) -C $(HOST_PYTHON_DIR) python Parser/pgen
+
+$(HOST_PYTHON): $(HOST_PYTHON_DIR)/python
+	cp $(HOST_PYTHON_DIR)/python $(HOST_PYTHON)
+# ---------------------------
+
+$(PYTHON_DIR)/.unpacked: $(DL_DIR)/$(PYTHON_SOURCE)
+	$(PYTHON_CAT) $(DL_DIR)/$(PYTHON_SOURCE) | tar -C $(BUILD_DIR)
$(TAR_OPTIONS) -
+	touch $@
+
+$(PYTHON_DIR)/.patched: $(PYTHON_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(PYTHON_DIR) package/python/ python\*.patch
+	touch $@
+
+$(PYTHON_DIR)/.configured: $(PYTHON_DIR)/.patched
 	(cd $(PYTHON_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
@@ -118,7 +131,7 @@
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
-		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen
+		HOSTPYTHON=$(HOST_PYTHON) HOSTPGEN=$(HOST_PYTHON_PGEN)
 
 $(TARGET_DIR)/$(PYTHON_TARGET_BINARY): $(PYTHON_DIR)/$(PYTHON_BINARY)
 ifneq ($(BR2_PACKAGE_PYTHON_SSL),y)
@@ -130,11 +143,13 @@
 		PYTHON_MODULES_INCLUDE=$(STAGING_DIR)/usr/include \
 		PYTHON_MODULES_LIB=$(STAGING_DIR)/lib \
 		PYTHON_DISABLE_MODULES="$(BR2_PYTHON_DISABLED_MODULES)" \
-		HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen && \
-	rm $(TARGET_DIR)/usr/bin/python?.? && \
-	rm $(TARGET_DIR)/usr/bin/idle && \
-	rm $(TARGET_DIR)/usr/bin/pydoc && \
-	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \; && \
+		HOSTPYTHON=$(HOST_PYTHON) HOSTPGEN=$(HOST_PYTHON_PGEN)
+
+python_cleanup: $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+	rm $(TARGET_DIR)/usr/bin/python?.?
+	rm $(TARGET_DIR)/usr/bin/idle
+	rm $(TARGET_DIR)/usr/bin/pydoc
+	find $(TARGET_DIR)/usr/lib/ -name '*.pyo' -exec rm {} \;
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/test
@@ -163,8 +178,10 @@
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_SHORT)/lib-tk
 endif
 
-python: uclibc $(PYTHON_DEPS) $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+python-source: $(DL_DIR)/$(PYTHON_SOURCE)
 
+python: uclibc $(PYTHON_DEPS) $(HOST_PYTHON)
$(TARGET_DIR)/$(PYTHON_TARGET_BINARY) python-cleanup
+
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
 	rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)


-- 
Best Regards
Ulf Samuelsson
Atmel Nordic AB
Mail: Box 2033, 174 50 Sundbyberg
Visit:Kavalleriv?gen 24, 174 58 Sundbyberg
Phone: +46 8 441 54 22, GSM: +46 706 22 44 57
eMail: ulf at atmel.com

-------------- next part --------------
A non-text attachment was scrubbed...
Name: python.patch
Type: text/x-patch
Size: 4174 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080508/9d0d01f0/attachment-0001.bin 
