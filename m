From: don <don_reid@comcast.net>
Date: Thu, 24 Aug 2006 15:22:35 -0700
Subject: [Buildroot] patch for pcmcia.mk
Message-ID: <20060824222235.GA12596@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


I got an error message while trying to build pcmia.

------------------------
.../buildroot/build_i486/busybox/examples/depmod.pl \
        -b .../buildroot/build_i486/root/lib/modules/2.6.11.5/ \
        -k .../buildroot/build_i486/linux-2.6.11.5/vmlinux \
        -F .../buildroot/build_i486/linux-2.6.11.5/System.map \
        > .../buildroot/build_i486/root/lib/modules/2.6.11.5/modules.dep
can't use both -k and -F
------------------------

It looks like the linux binary is just used if a system map file cannot
be found.  So I changed the make file to remove it.

--- package/pcmcia/pcmcia.mk.orig	2006-08-24 13:42:37.000000000 -0700
+++ package/pcmcia/pcmcia.mk	2006-08-24 13:42:43.000000000 -0700
@@ -91,7 +91,6 @@
 	[ -d $(TARGET_DIR)/lib/modules/$(LINUX_VERSION) ] && \
 	$(BUSYBOX_DIR)/examples/depmod.pl \
 		-b $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/ \
-		-k $(LINUX_DIR)/vmlinux \
 		-F $(LINUX_DIR)/System.map \
 		> $(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/modules.dep
 	touch $(PCMCIA_DIR)/.modules.dep

Don Reid
