From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 16:08:34 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/pcmcia
In-Reply-To: <20070724141004.AA690A6079@busybox.net>
References: <20070724141004.AA690A6079@busybox.net>
Message-ID: <20070724140834.GB19688@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 24, 2007 at 07:10:04AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-24 07:10:03 -0700 (Tue, 24 Jul 2007)
>New Revision: 19248
>
>Log:
>Use known Buildroot symbols for linux in pcmcia
>
>Modified:
>   trunk/buildroot/package/pcmcia/pcmcia.mk
>
>
>Changeset:
>Modified: trunk/buildroot/package/pcmcia/pcmcia.mk
>===================================================================
>--- trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-24 14:08:02 UTC (rev 19247)
>+++ trunk/buildroot/package/pcmcia/pcmcia.mk	2007-07-24 14:10:03 UTC (rev 19248)
>@@ -40,7 +40,7 @@
> 	touch $(PCMCIA_DIR)/.patched
> 
> $(PCMCIA_DIR)/.configured: $(PCMCIA_DIR)/.patched
>-	( cd $(PCMCIA_DIR) ; ./Configure --kernel=$(LINUX_SOURCE_DIR) --noprompt \
>+	( cd $(PCMCIA_DIR) ; ./Configure --kernel=$(LINUX26_DIR) --noprompt \
> 		--rcdir=/etc --arch=$(ARCH) --trust --srctree --nocardbus \
> 		--sysv --kcc=$(KERNEL_CROSS)gcc --ucc=$(TARGET_CC) --ld=$(TARGET_CROSS)ld \
> 		--target=$(TARGET_DIR))
>@@ -88,11 +88,11 @@
> 
> # use busybox depmod.pl so we need the sources unpacked
> $(PCMCIA_DIR)/.modules.dep: $(BUSYBOX_DIR)/.configured $(TARGET_DIR)/lib/modules
>-	[ -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION) ] && \
>+	[ -d $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION) ] && \

Shouldn't LINUX_VERSION point to either LINUX26_VERSION (for a 2.6
kernel) or come from a 2.4 kernel? Using LINUX26_VERSION here sounds
wrong to me..

> 	$(BUSYBOX_DIR)/examples/depmod.pl \
>-		-b $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/ \
>-		-F $(LINUX_DIR)/System.map \
>-		> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
>+		-b $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/ \
>+		-F $(LINUX26_DIR)/System.map \
>+		> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep

likewise.

-> 	touch $(PCMCIA_DIR)/.modules.dep
+ 	touch $@
