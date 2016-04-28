From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Apr 2016 10:24:12 +0200
Subject: [Buildroot] migrating manual makefile to autotools-based
	packages
In-Reply-To: <loom.20160408T102819-442@post.gmane.org> (aurelien coulaud's
 message of "Fri, 8 Apr 2016 08:49:27 +0000 (UTC)")
References: <loom.20160406T145801-819@post.gmane.org>
 <loom.20160406T191601-706@post.gmane.org>
 <20160408043143.3da6fc7e@free-electrons.com>
 <loom.20160408T102819-442@post.gmane.org>
Message-ID: <8737q6ywcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aurelien" == aurelien coulaud <aurelien.coulaud@thalesgroup.com> writes:

 > Hello Thomas, thank in advance.

 > Here is my file: codebase.mk

This looks like a pretty normal autotools based package. Look at
E.G. package/libdaemon/libdaemon.mk for an example.

 > #############################################################
 > #
 > # codebase
 > #
 > #############################################################

 > CODEBASE_SOURCE=codebase__20061027.tgz
 > CODEBASE_DIR:=$(BUILD_DIR)/codebase


 > $(CODEBASE_DIR)/.source: $(DL_DIR)/$(CODEBASE_SOURCE)
 > 	$(ZCAT) $(DL_DIR)/$(CODEBASE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 > 	toolchain/patch-kernel.sh $(CODEBASE_DIR) package/codebase/ patch*
 > 	touch $(CODEBASE_DIR)/.source

This is all handled by the infrastructure if you define something like:

CODEBASE_VERSION = 20061027
CODEBASE_SOURCE = codebase__$(CODEBASE_VERSION).tgz


 > $(CODEBASE_DIR)/.configured: $(CODEBASE_DIR)/.source
 > 	(cd $(CODEBASE_DIR); \
 > 	export PATH="/usr/local/bin:$(PATH)" ; \
 > 	./bootstrap ; \

I take it that bootstrap runs autoreconf - If so, you can tell buildroot
to do so with:

CODEBASE_AUTORECONF = YES

>         $(TARGET_CONFIGURE_OPTS) \
 > 	CPPFLAGS=-DS4NO_FCVT \
 >         CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include" \
 >         LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \

STAGING_DIR should already be in CFLAGS/LDFLAGS.

> 	./configure \
 > 	--target=$(GNU_TARGET_NAME) \
 > 	--host=$(GNU_TARGET_NAME) \
 > 	--build=$(GNU_HOST_NAME) \
 > 	--prefix=/usr );
 > 	touch $(CODEBASE_DIR)/.configured
	
 > $(CODEBASE_DIR)/.compiled: $(CODEBASE_DIR)/.configured
 > 	        $(MAKE) -C $(CODEBASE_DIR)
 > 	        touch $(CODEBASE_DIR)/.compiled

 > $(STAGING_DIR)/usr/lib/libcb.so: $(CODEBASE_DIR)/.compiled
 > 	$(MAKE) -C $(CODEBASE_DIR) install prefix=$(STAGING_DIR)/usr
 > exec_prefix=$(STAGING_DIR)/usr
 > 	touch -c $(STAGING_DIR)/usr/lib/libcb.so

This looks odd. Are you sure you don't just want to do:

make -C $(CODEBASE_DIR) DESTDIR=$(STAGING_DIR) install

If so, that's what buildroot does by default.


 > $(TARGET_DIR)/usr/lib/libcb.so: $(STAGING_DIR)/usr/lib/libcb.so
 > 	cp -dpf $(STAGING_DIR)/usr/lib/libcb* $(STAGING_DIR)/usr/lib/libcbx*
 > $(TARGET_DIR)/usr/lib/
 > 	-$(STRIP) --strip-unneeded \
 > 		$(TARGET_DIR)/usr/lib/libcb.so \
 > 		$(TARGET_DIR)/usr/lib/libcbx.so \
	

And here it does the same except it passes DESTDIR=$(TARGET_DIR)

-- 
Bye, Peter Korsgaard
