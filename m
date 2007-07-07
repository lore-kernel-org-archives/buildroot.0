From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 7 Jul 2007 19:29:25 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <1183824383.19912.5.camel@elrond.sweden.atmel.com>
References: <006201c7bfd9$de0f46a0$dcc4af0a@atmel.com>
	<20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
Message-ID: <20070707172925.GV4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 07, 2007 at 06:06:23PM +0200, Ulf Samuelsson wrote:
>> >I think someone got it wrong in the "package/mtd/mtd.mk" which says
>> >
>> >    $(TARGET_CONFIGURE_OPTS) $(MAKE) ...    - build using gcc
>> >    
>> >which should be:
>> >
>> >     $(MAKE) $(TARGET_CONFIGURE_OPTS) ...    - build using arm-linux-uclibc-gcc
>> 
>> yes, the latter is correct. Steven, please repair or elaborate.
>> 
>
>Here are a set of patches to change the position of
>TARGET_CONFIGURE_OPTS.
>Please review and apply if you agree.
>
>
>
>Index: package/l2tp/l2tp.mk
>===================================================================
>--- package/l2tp/l2tp.mk	(revision 19021)
>+++ package/l2tp/l2tp.mk	(arbetskopia)
>@@ -33,7 +33,7 @@
> 	touch $(L2TP_DIR)/.unpacked
> 
> $(L2TP_DIR)/$(L2TP_BINARY): $(L2TP_DIR)/.unpacked
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(L2TP_DIR) CC=$(TARGET_CC) \
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(L2TP_DIR) CC=$(TARGET_CC) \

passing CC is superfluous
> 		DFLAGS= \
> 		OSFLAGS="-DLINUX -UUSE_KERNEL $(TARGET_CFLAGS) -USANITY"
> 
>Index: package/mtd/mtd.mk
>===================================================================
>--- package/mtd/mtd.mk	(revision 19021)
>+++ package/mtd/mtd.mk	(arbetskopia)
>@@ -115,7 +115,10 @@
> MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
> 
> $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE)	CFLAGS="-I$(MTD_DIR)/include -I
>$(LINUX_HEADERS_DIR)/include" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
>+	$(MAKE)	$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="-I$(MTD_DIR)/include \
>+		-I$(LINUX_HEADERS_DIR)/include" \
>+		LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
> 
> MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
> 
>Index: package/qte/qte.mk
>===================================================================
>--- package/qte/qte.mk	(revision 19021)
>+++ package/qte/qte.mk	(arbetskopia)
>@@ -222,18 +222,18 @@
> 
> $(QTE_QTE_LIB): $(QTE_QTE_DIR)/src-mt.mk
> 	export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) DESTDIR=
>$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) DESTDIR=

passing TARGET_CC is superfluous

>$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
> 	# ... and make sure it actually built... grrr... make deep-deep-deep
>makefile recursion for this habit
> 	test -f $@
> 
> $(QTE_QTOPIA_FILE): $(QTE_QTOPIA_DIR)/.configured
> 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)

superfluous CC
> 
> $(QTE_QTOPIA_IFILE): $(QTE_QTOPIA_FILE)
> 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
>PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
>install PREFIX=$(TARGET_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
>install PREFIX=$(TARGET_DIR)

superfluous CC
> 
>
> qte:: $(QTE_QTE_LIB)
>Index: package/kexec/kexec.mk
>===================================================================
>--- package/kexec/kexec.mk	(revision 19021)
>+++ package/kexec/kexec.mk	(arbetskopia)
>@@ -53,7 +53,7 @@
> 	touch $@
> 
> $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY):
>$(KEXEC_DIR)/.configured
>-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(KEXEC_DIR)
>+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CC=$(TARGET_CC) -C $(KEXEC_DIR)

superfluous CC
[snip.. you get the idea]
