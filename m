From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 00:05:42 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090103000543.03D36769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 00:05:42 +0000 (Sat, 03 Jan 2009)
New Revision: 24657

Log:
Add facilities for installing u-boot in different locations

Added:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch


Changeset:
Added: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch	                        (rev 0)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-008-Makefile.patch	2009-01-03 00:05:42 UTC (rev 24657)
@@ -0,0 +1,64 @@
+diff -urN u-boot-2008.10-0rig//Makefile u-boot-2008.10/Makefile
+--- u-boot-2008.10-0rig//Makefile	2008-12-31 18:11:18.000000000 +0100
++++ u-boot-2008.10/Makefile	2008-12-31 18:39:58.000000000 +0100
+@@ -20,6 +20,7 @@
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston,
+ # MA 02111-1307 USA
+ #
++BUILD_DATE= $(shell date +%F)
+ 
+ VERSION = 2008
+ PATCHLEVEL = 10
+@@ -294,6 +295,22 @@
+ ALL += $(obj)u-boot.ldr
+ endif
+ 
++ifneq ($(BOARDNAME),)
++BINARY := $(BOARDNAME)-u-boot-$(U_BOOT_VERSION)-$(BUILD_DATE)
++BINARY_BIN := $(obj)$(BINARY).bin
++BINARY_GZ  := $(obj)$(BINARY).gz
++ALL += $(BINARY_BIN)
++ALL += $(BINARY_GZ)
++else
++BINARY := u-boot
++BINARY_BIN := $(obj)$(BINARY).bin
++BINARY_GZ  := $(obj)$(BINARY).gz
++endif
++
++ifeq ($(DESTDIR),)
++DESTDIR=binaries
++endif
++
+ all:		$(ALL)
+ 
+ $(obj)u-boot.hex:	$(obj)u-boot
+@@ -302,9 +319,20 @@
+ $(obj)u-boot.srec:	$(obj)u-boot
+ 		$(OBJCOPY) -O srec $< $@
+ 
+-$(obj)u-boot.bin:	$(obj)u-boot
++$(BINARY_BIN):	$(obj)u-boot
+ 		$(OBJCOPY) ${OBJCFLAGS} -O binary $< $@
+ 
++$(BINARY_GZ):	$(BINARY_BIN)
++		gzip -c $(BINARY_BIN) > $(BINARY_GZ)
++
++install:	all
++		-install -d	$(DESTDIR)
++		install		$(BINARY_BIN)	$(DESTDIR)
++
++tftp:		install
++		cp $(BINARY_GZ)				$(TFTPBOOT)/$(BINARY).gz
++		cp $(BINARY_BIN) 			$(TFTPBOOT)/$(BINARY).bin
++
+ $(obj)u-boot.ldr:	$(obj)u-boot
+ 		$(LDR) -T $(CONFIG_BFIN_CPU) -f -c $@ $< $(LDR_FLAGS)
+ 
+@@ -3295,6 +3324,7 @@
+ 		-o -name '*.srec' -o -name '*.bin' -o -name u-boot.img \) \
+ 		-print0 \
+ 		| xargs -0 rm -f
++	@rm -f $(obj)u-boot-*.gz
+ 	@rm -f $(OBJS) $(obj)*.bak $(obj)ctags $(obj)etags $(obj)TAGS \
+ 		$(obj)cscope.* $(obj)*.*~
+ 	@rm -f $(obj)u-boot $(obj)u-boot.map $(obj)u-boot.hex $(ALL)
