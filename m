From: aurelien coulaud <aurelien.coulaud@thalesgroup.com>
Date: Fri, 8 Apr 2016 08:49:27 +0000 (UTC)
Subject: [Buildroot] migrating manual makefile to autotools-based
	packages
References: <loom.20160406T145801-819@post.gmane.org>
 <loom.20160406T191601-706@post.gmane.org>
 <20160408043143.3da6fc7e@free-electrons.com>
Message-ID: <loom.20160408T102819-442@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> Using hand-written Makefiles is bad, as you lose many features of the
> package infrastructure: legal-info, source, source-check, etc. Please
> don't use hand-written Makefiles, use one of the available package
> infrastructures. Doing the conversion is generally very easy. If you
> don't know how to do it, please post your current .mk file and we'll
> give you some hints.
> 
> Best regards,
> 
> Thomas

Hello Thomas, thank in advance.

Here is my file: codebase.mk

#############################################################
#
# codebase
#
#############################################################

CODEBASE_SOURCE=codebase__20061027.tgz
CODEBASE_DIR:=$(BUILD_DIR)/codebase


$(CODEBASE_DIR)/.source: $(DL_DIR)/$(CODEBASE_SOURCE)
	$(ZCAT) $(DL_DIR)/$(CODEBASE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(CODEBASE_DIR) package/codebase/ patch*
	touch $(CODEBASE_DIR)/.source

$(CODEBASE_DIR)/.configured: $(CODEBASE_DIR)/.source
	(cd $(CODEBASE_DIR); \
	export PATH="/usr/local/bin:$(PATH)" ; \
	./bootstrap ; \
        $(TARGET_CONFIGURE_OPTS) \
	CPPFLAGS=-DS4NO_FCVT \
        CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
        LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
	./configure \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=/usr );
	touch $(CODEBASE_DIR)/.configured
	
$(CODEBASE_DIR)/.compiled: $(CODEBASE_DIR)/.configured
	        $(MAKE) -C $(CODEBASE_DIR)
	        touch $(CODEBASE_DIR)/.compiled

$(STAGING_DIR)/usr/lib/libcb.so: $(CODEBASE_DIR)/.compiled
	$(MAKE) -C $(CODEBASE_DIR) install prefix=$(STAGING_DIR)/usr
exec_prefix=$(STAGING_DIR)/usr
	touch -c $(STAGING_DIR)/usr/lib/libcb.so

$(TARGET_DIR)/usr/lib/libcb.so: $(STAGING_DIR)/usr/lib/libcb.so
	cp -dpf $(STAGING_DIR)/usr/lib/libcb* $(STAGING_DIR)/usr/lib/libcbx*
$(TARGET_DIR)/usr/lib/
	-$(STRIP) --strip-unneeded \
		$(TARGET_DIR)/usr/lib/libcb.so \
		$(TARGET_DIR)/usr/lib/libcbx.so \
	

codebase: $(TARGET_DIR)/usr/lib/libcb.so


#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_CODEBASE)),y)
TARGETS+=codebase
endif
