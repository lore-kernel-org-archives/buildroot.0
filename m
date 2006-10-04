From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 4 Oct 2006 18:20:28 +0200
Subject: [Buildroot] LZMA in Buldroot.
In-Reply-To: <20061004144046.GA32537@zelow.no>
References: <20061003173002.GA19937@zelow.no> <20061004084732.GA15165@aon.at>
	<20061004144046.GA32537@zelow.no>
Message-ID: <20061004162028.GA18682@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 04, 2006 at 04:40:46PM +0200, Thomas Lundquist wrote:
>On Wed, Oct 04, 2006 at 10:47:32AM +0200, Bernhard Fischer wrote:
>> 
>> I'm curious why you moved it around? This should not be necessary, just
>> depend on lzma-host for $(image).lzma, like so:
>
>I wasn't sure about that myself but sstrip was done like this, so I
>moved it.
>
>I have no problems with making a patch that does not move it but why was
>sstrip done this way? 
>
>the libraries are done from the package directory but they are the same
>in staging and target (except for stripping) but here we are talking
>about two sifferent binaries, one compiled for the host and one for the
>target.
>
>this was at least my guess on the reason behind putting sstrip in in the
>toolchain part.

We only have to make sure that we don't pickup the wrong objects, that
should be all. 
>
>(my sstrip, or rather elfkickers package, which was never included in
>buildroot was in the package directory but then sstrip showed up in
>toolchain.)
>
>I've kept building of lzma-host in toolchain since we have to build two
>different sets.

Yes, that's fine.
>
>patch attached.

See comment below.
>
>
>
>Thomas.
>
>> +$(EXT2_BASE).lzma: lzma-host $(EXT2_BASE)
>> +       $(STAGING_DIR)/bin/lzma -vc $(EXT2_BASE) > $(EXT2_BASE).lzma
>> +
>
>> Please send an updated patch.
>> TIA,
>> Bernhard
>> 
>> >
>> >about initrd kernel patches; I've attached one for 2.6.15.4 but if there
>> >are interest I'll maintain patches for newer versions aswell.
>> >
>> >I also have patches for lzma compressed kernel but only for i386 (I need it
>> >for ARM but have met some challenges.).
>> >
>> >Thanks to Ming-Ching Tiew for making the kernel patches.
>> >
>> >
>> >Thomas.

>Index: target/ext2/ext2root.mk
>===================================================================
>--- target/ext2/ext2root.mk	(revision 16306)
>+++ target/ext2/ext2root.mk	(working copy)
>@@ -66,6 +66,10 @@
> EXT2_TARGET := $(EXT2_BASE)
> endif
> 
>+ifeq ($(strip $(BR2_TARGET_ROOTFS_EXT2_LZMA)),y)
>+EXT2_TARGET := $(EXT2_BASE).lzma
>+endif
>+
> $(EXT2_BASE): host-fakeroot makedevs genext2fs
> 	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
> 	@rm -rf $(TARGET_DIR)/usr/man
>@@ -102,6 +106,9 @@
> $(EXT2_BASE).gz: $(EXT2_BASE)
> 	@gzip --best -fv $(EXT2_BASE)
> 
>+$(EXT2_BASE).lzma: lzma-host $(EXT2_BASE)
>+	@$(STAGING_DIR)/bin/lzma -vc $(EXT2_BASE) > $(EXT2_BASE).lzma
>+

reminds me that we may want to lzma the other filesystems too, later on.

> EXT2_COPYTO := $(strip $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_COPYTO)))
> # " stupid syntax highlighting does not like unmatched quote from above line
> 
>Index: package/lzma/lzma.mk
>===================================================================
>--- package/lzma/lzma.mk	(revision 16306)
>+++ package/lzma/lzma.mk	(working copy)
>@@ -6,7 +6,8 @@
> LZMA_VER:=4.32.0beta3
> LZMA_SOURCE:=lzma-$(LZMA_VER).tar.gz
> LZMA_SITE:=http://tukaani.org/lzma/
>-LZMA_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VER)
>+LZMA_HOST_DIR:=$(TOOL_BUILD_DIR)/lzma-$(LZMA_VER)
>+LZMA_TARGET_DIR:=$(BUILD_DIR)/lzma-$(LZMA_VER)
> LZMA_CFLAGS:=$(TARGET_CFLAGS)
> ifeq ($(BR2_LARGEFILE),y)
> LZMA_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
>@@ -18,13 +19,47 @@
> $(DL_DIR)/$(LZMA_SOURCE):
> 	$(WGET) -P $(DL_DIR) $(LZMA_SITE)/$(LZMA_SOURCE)
> 
>-$(LZMA_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
>-	$(ZCAT) $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>-	toolchain/patch-kernel.sh $(LZMA_DIR) package/lzma/ lzma\*.patch
>-	touch $(LZMA_DIR)/.source
>+######################################################################
>+#
>+# lzma host
>+#
>+######################################################################
> 
>-$(LZMA_DIR)/.configured: $(LZMA_DIR)/.source
>-	(cd $(LZMA_DIR); rm -f config.cache ;\
>+$(LZMA_HOST_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
>+	zcat $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(LZMA_HOST_DIR) toolchain/lzma/ lzma\*.patch
>+	touch $(LZMA_HOST_DIR)/.source
>+
>+$(LZMA_HOST_DIR)/.configured: $(LZMA_HOST_DIR)/.source
>+	(cd $(LZMA_HOST_DIR); rm -f config.cache ;\
>+		CC="$(HOSTCC)" \
>+		./configure \
>+		--prefix=/ \
>+	);
>+	touch $(LZMA_HOST_DIR)/.configured;
>+
>+$(LZMA_HOST_DIR)/src/lzma/lzma: $(LZMA_HOST_DIR)/.configured
>+	$(MAKE) -C $(LZMA_HOST_DIR) all
>+	touch -c $@
>+
>+$(STAGING_DIR)/bin/lzma: $(LZMA_HOST_DIR)/src/lzma/lzma
>+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LZMA_HOST_DIR) install
>+
>+lzma_host: uclibc $(STAGING_DIR)/bin/lzma
>+
>+######################################################################
>+#
>+# lzma target
>+#
>+######################################################################
>+
>+$(LZMA_TARGET_DIR)/.source: $(DL_DIR)/$(LZMA_SOURCE)
>+	zcat $(DL_DIR)/$(LZMA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(LZMA_TARGET_DIR) toolchain/lzma/ lzma\*.patch
>+	touch $(LZMA_TARGET_DIR)/.source
>+
>+$(LZMA_TARGET_DIR)/.configured: $(LZMA_TARGET_DIR)/.source
>+	(cd $(LZMA_TARGET_DIR); rm -f config.cache ;\
> 		$(TARGET_CONFIGURE_OPTS) \
> 		CFLAGS="$(TARGET_CFLAGS) $(LZMA_CFLAGS)" \
> 		ac_cv_func_malloc_0_nonnull=yes \
>@@ -33,37 +68,31 @@
> 		--host=$(GNU_TARGET_NAME) \
> 		--build=$(GNU_HOST_NAME) \
> 		--prefix=/usr \
>-		--exec-prefix=$(STAGING_DIR)/usr/bin \
>-		--libdir=$(STAGING_DIR)/lib \
>-		--includedir=$(STAGING_DIR)/include \
>+		--exec-prefix=$(TARGET_DIR)/usr/bin \
>+		--libdir=$(TARGET_DIR)/lib \
>+		--includedir=$(TARGET_DIR)/include \
> 		--disable-debug \
> 		$(DISABLE_NLS) \
> 		$(LZMA_LARGEFILE) \
> 	);
>-	touch $(LZMA_DIR)/.configured;
>+	touch $(LZMA_TARGET_DIR)/.configured;
> 
>-$(LZMA_DIR)/src/lzma/lzma: $(LZMA_DIR)/.configured
>-	$(MAKE) -C $(LZMA_DIR) all
>+$(LZMA_TARGET_DIR)/src/lzma/lzma: $(LZMA_TARGET_DIR)/.configured
>+	$(MAKE) -C $(LZMA_TARGET_DIR) all
> 	touch -c $@
> 
>-$(STAGING_DIR)/bin/lzma: $(LZMA_DIR)/src/lzma/lzma
>-	-cp -dpf $(LZMA_DIR)/src/lzma/lzma $(STAGING_DIR)/bin/;
>-	touch -c $(STAGING_DIR)/bin/lzma
>-
>-$(TARGET_DIR)/bin/lzma: $(STAGING_DIR)/bin/lzma
>-	cp -dpf $(STAGING_DIR)/bin/lzma $(TARGET_DIR)/bin/;
>+$(TARGET_DIR)/usr/bin/lzma: $(LZMA_TARGET_DIR)/src/lzma/lzma
>+	-cp -dpf $(LZMA_TARGET_DIR)/src/lzma/lzma $(TARGET_DIR)/bin/;
> 	-$(STRIP) --strip-unneeded $(TARGET_DIR)/bin/lzma
> 	touch -c $(TARGET_DIR)/bin/lzma
> 
>-#lzma-headers: $(TARGET_DIR)/bin/lzma
>+lzma_target: uclibc $(TARGET_DIR)/usr/bin/lzma
> 
>-lzma: uclibc $(TARGET_DIR)/bin/lzma
>-
> lzma-source: $(DL_DIR)/$(LZMA_SOURCE)
> 
> lzma-clean:
>-	rm -f $(TARGET_DIR)/bin/lzma
>-	-$(MAKE) -C $(LZMA_DIR) clean
>+	rm -f $(TARGET_DIR)/usr/bin/lzma
>+	-$(MAKE) -C $(LZMA_TARGET_DIR) clean
> 
> lzma-dirclean:
> 	rm -rf $(LZMA_DIR)
>@@ -73,9 +102,9 @@
> # Toplevel Makefile options
> #
> #############################################################
>-ifeq ($(strip $(BR2_PACKAGE_LZMA)),y)
>-TARGETS+=lzma
>+ifeq ($(strip $(BR2_PACKAGE_LZMA_HOST)),y)
>+TARGETS+=lzma_host
> endif
>-#ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET_HEADERS)),y)
>-#TARGETS+=lzma-headers
>-#endif

Should be added as an option rather than removed..
lzma-headers: $(TARGET_DIR)/usr/bin/lzma
	-cp -dpf the_lzma.h $(TARGET_DIR)/usr/include/

thanks,
>+ifeq ($(strip $(BR2_PACKAGE_LZMA_TARGET)),y)
>+TARGETS+=lzma_target
>+endif
>Index: package/lzma/Config.in
>===================================================================
>--- package/lzma/Config.in	(revision 16306)
>+++ package/lzma/Config.in	(working copy)
>@@ -1,14 +1,15 @@
>-config BR2_PACKAGE_LZMA
>-	bool "lzma"
>+config BR2_PACKAGE_LZMA_TARGET
>+	bool "Install lzma for the target system"
> 	default n
> 	help
>-	  Compression utility.
>+	  lzma utils on the target
> 
> 	  http://tukaani.org/lzma/
> 
>-config BR2_PACKAGE_LZMA_TARGET_HEADERS
>-	bool "lzma headers in target"
>+config BR2_PACKAGE_LZMA_HOST
>+	bool "Install lzma for the host/build system"
> 	default n
>-	depends on BR2_PACKAGE_LZMA
> 	help
>-	  Put headers files in the target.
>+	  lzma utils
>+
>+	  http://tukaani.org/lzma/

>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
