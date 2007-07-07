From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 07 Jul 2007 21:33:26 +0200
Subject: [Buildroot] <package>_VER vs <package>_VERSION
In-Reply-To: <468FB5F5.1070205@realitydiluted.com>
References: <004201c7c0a2$9420c900$dcc4af0a@atmel.com>
	<468FB5F5.1070205@realitydiluted.com>
Message-ID: <1183836807.19912.12.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-07-07 klockan 10:49 -0500 skrev Steven J. Hill:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Ulf Samuelsson wrote:
> > Some packages use <package>_VER  and some use  <package>_VERSION
> > and some does not use this at all and hardcodes the version.
> > 
> > Suggest we clean this up so we use a single template.
> > 
> > Suggest we do it using the following template, allowing user to override.
> > 
> > ifeq    ($(<package>_VERSION),)
> > <package>_VERSION:=X.Y.Z
> > endif
> > 
> That's an interesting idea. I agree on the _VER and _VERSION clean-up. How
> about you submit a patch for that first? Thanks.
> 
> - -Steve

Some packages do not have a version:
customize
gnuconfig
hostap		Always use a snapshot
microcom	This is not clean, version = 1.02, 
		package is m102.tar.gz
jpeg	   	6b vs v6b
mtd		Configurable from menuconfig or snapshot
sfdisk		No version, this is located on www.uclibc.org so we 
		should change to sfdisk-1.00.tar.bz2
tinylogin	Makefile force use of snapshot,
		Configure using menuconfig?
ttcp		No version

Index: package/l2tp/l2tp.mk
===================================================================
--- package/l2tp/l2tp.mk	(revision 19021)
+++ package/l2tp/l2tp.mk	(arbetskopia)
@@ -33,7 +33,7 @@
 	touch $(L2TP_DIR)/.unpacked
 
 $(L2TP_DIR)/$(L2TP_BINARY): $(L2TP_DIR)/.unpacked
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(L2TP_DIR) CC=$(TARGET_CC) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(L2TP_DIR) \
 		DFLAGS= \
 		OSFLAGS="-DLINUX -UUSE_KERNEL $(TARGET_CFLAGS) -USANITY"
 
Index: package/mtd/mtd.mk
===================================================================
--- package/mtd/mtd.mk	(revision 19021)
+++ package/mtd/mtd.mk	(arbetskopia)
@@ -115,7 +115,10 @@
 MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/util/, $(MTD_TARGETS_y))
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
-	$(TARGET_CONFIGURE_OPTS) $(MAKE)	CFLAGS="-I$(MTD_DIR)/include -I
$(LINUX_HEADERS_DIR)/include" LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
+	$(MAKE)	$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="-I$(MTD_DIR)/include \
+		-I$(LINUX_HEADERS_DIR)/include" \
+		LINUXDIR=$(LINUX_DIR) -C $(MTD_DIR)/util
 
 MTD_TARGETS := $(addprefix $(TARGET_DIR)/usr/sbin/, $(MTD_TARGETS_y))
 
Index: package/qte/qte.mk
===================================================================
--- package/qte/qte.mk	(revision 19021)
+++ package/qte/qte.mk	(arbetskopia)
@@ -222,18 +222,18 @@
 
 $(QTE_QTE_LIB): $(QTE_QTE_DIR)/src-mt.mk
 	export QTDIR=$(QTE_QTE_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) $(TARGET_CC) DESTDIR=
$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) -C $(QTE_QTE_DIR) src-mt
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) $(TARGET_CC) DESTDIR=
$(TARGET_DIR)/lib -C $(QTE_QTE_DIR) src-mt
 	# ... and make sure it actually built... grrr... make deep-deep-deep
makefile recursion for this habit
 	test -f $@
 
 $(QTE_QTOPIA_FILE): $(QTE_QTOPIA_DIR)/.configured
 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QTE_QTOPIA_DIR)
 
 $(QTE_QTOPIA_IFILE): $(QTE_QTOPIA_FILE)
 	export QTDIR=$(QTE_QT3_DIR); export QPEDIR=$(QTE_QTOPIA_DIR); export
PATH=$(STAGING_DIR)/bin:$$QTDIR/bin:$$PATH; \
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QTE_QTOPIA_DIR)
install PREFIX=$(TARGET_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QTE_QTOPIA_DIR) install PREFIX=
$(TARGET_DIR)
 
 
 qte:: $(QTE_QTE_LIB)
Index: package/kexec/kexec.mk
===================================================================
--- package/kexec/kexec.mk	(revision 19021)
+++ package/kexec/kexec.mk	(arbetskopia)
@@ -53,7 +53,7 @@
 	touch $@
 
 $(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY):
$(KEXEC_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(KEXEC_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(KEXEC_DIR)
 	touch -c $@
 
 $(TARGET_DIR)/$(KEXEC_TARGET_BINARY):
$(KEXEC_DIR)/objdir-$(GNU_TARGET_NAME)/build/sbin/$(KEXEC_BINARY)
Index: package/usbutils/usbutils.mk
===================================================================
--- package/usbutils/usbutils.mk	(revision 19021)
+++ package/usbutils/usbutils.mk	(arbetskopia)
@@ -35,7 +35,7 @@
 	touch $(USBUTILS_DIR)/.configured
 
 $(USBUTILS_DIR)/$(USBUTILS_BINARY): $(USBUTILS_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(USBUTILS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(USBUTILS_DIR)
 
 $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY):
$(USBUTILS_DIR)/$(USBUTILS_BINARY)
 	$(MAKE) -C $(USBUTILS_DIR) DESTDIR=$(TARGET_DIR) install
Index: package/netcat/netcat.mk
===================================================================
--- package/netcat/netcat.mk	(revision 19021)
+++ package/netcat/netcat.mk	(arbetskopia)
@@ -35,7 +35,7 @@
 
 
 $(NETCAT_DIR)/$(NETCAT_BINARY): $(NETCAT_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(NETCAT_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NETCAT_DIR)
 
 $(TARGET_DIR)/$(NETCAT_TARGET_BINARY): $(NETCAT_DIR)/$(NETCAT_BINARY)
 	install -D $(NETCAT_DIR)/$(NETCAT_BINARY)
$(TARGET_DIR)/$(NETCAT_TARGET_BINARY)
Index: package/tinyx/tinyx.mk
===================================================================
--- package/tinyx/tinyx.mk	(revision 19021)
+++ package/tinyx/tinyx.mk	(arbetskopia)
@@ -85,7 +85,7 @@
 	rm -f $(TINYX_BINX)/Xfbdev
 	#make World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=<cross compiler dir>";
 	#( cd $(TINYX_DIR) ; $(MAKE) World CROSSCOMPILEFLAGS="CROSSCOMPILEDIR=
$(STAGING_DIR)/bin" )
-	#( cd $(TINYX_DIR) ; $(TARGET_CONFIGURE_OPTS) $(MAKE) World )
+	#( cd $(TINYX_DIR) ; $(MAKE) $(TARGET_CONFIGURE_OPTS) World )
 	#
 	#mv $(TINYX_DIR)/Makefile $(TINYX_DIR)/Makefile.xxxx
 	#echo "AS=$(TARGET_CROSS)as" > $(TINYX_DIR)/Makefile
Index: package/rsync/rsync.mk
===================================================================
--- package/rsync/rsync.mk	(revision 19021)
+++ package/rsync/rsync.mk	(arbetskopia)
@@ -35,7 +35,7 @@
 	touch $(RSYNC_DIR)/.configured
 
 $(RSYNC_DIR)/$(RSYNC_BINARY): $(RSYNC_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(RSYNC_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(RSYNC_DIR)
 
 $(TARGET_DIR)/$(RSYNC_TARGET_BINARY): $(RSYNC_DIR)/$(RSYNC_BINARY)
 	install -D $(RSYNC_DIR)/$(RSYNC_BINARY)
$(TARGET_DIR)/$(RSYNC_TARGET_BINARY)
Index: package/samba/samba.mk
===================================================================
--- package/samba/samba.mk	(revision 19021)
+++ package/samba/samba.mk	(arbetskopia)
@@ -46,7 +46,7 @@
 	touch $(SAMBA_DIR)/.configured
 
 $(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(SAMBA_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SAMBA_DIR)
 
 SAMBA_TARGETS_ :=
 SAMBA_TARGETS_y :=
@@ -79,7 +79,7 @@
 SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WBINFO)	+= usr/bin/wbinfo
 
 $(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC)	\
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) 	\
 		prefix="${TARGET_DIR}/usr" \
 		BASEDIR="${TARGET_DIR}/usr" \
 		SBINDIR="${TARGET_DIR}/usr/sbin" \
Index: package/flex/flex.mk
===================================================================
--- package/flex/flex.mk	(revision 19021)
+++ package/flex/flex.mk	(arbetskopia)
@@ -58,7 +58,7 @@
 	touch $@
 
 $(FLEX_DIR)/$(FLEX_BINARY): $(FLEX_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(FLEX_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(FLEX_DIR)
 
 $(TARGET_DIR)/$(FLEX_TARGET_BINARY): $(FLEX_DIR)/$(FLEX_BINARY)
 	$(MAKE1) \
Index: package/quagga/quagga.mk
===================================================================
--- package/quagga/quagga.mk	(revision 19021)
+++ package/quagga/quagga.mk	(arbetskopia)
@@ -152,7 +152,7 @@
 	touch $@
 
 $(QUAGGA_BINARY): $(QUAGGA_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(QUAGGA_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(QUAGGA_DIR)
 
 $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(QUAGGA_DIR) install
Index: package/thttpd/thttpd.mk
===================================================================
--- package/thttpd/thttpd.mk	(revision 19021)
+++ package/thttpd/thttpd.mk	(arbetskopia)
@@ -35,7 +35,7 @@
 	touch $(THTTPD_DIR)/.configured
 
 $(THTTPD_DIR)/$(THTTPD_BINARY): $(THTTPD_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(THTTPD_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(THTTPD_DIR)
 
 $(TARGET_DIR)/$(THTTPD_TARGET_BINARY): $(THTTPD_DIR)/$(THTTPD_BINARY)
 	install -D $(THTTPD_DIR)/$(THTTPD_BINARY)
$(TARGET_DIR)/$(THTTPD_TARGET_BINARY)
Index: package/libevent/libevent.mk
===================================================================
--- package/libevent/libevent.mk	(revision 19021)
+++ package/libevent/libevent.mk	(arbetskopia)
@@ -37,7 +37,7 @@
 	touch $@
 
 $(LIBEVENT_DIR)/$(LIBEVENT_BINARY): $(LIBEVENT_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBEVENT_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEVENT_DIR)
 
 $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY):
$(LIBEVENT_DIR)/$(LIBEVENT_BINARY)
 	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install
Index: package/microcom/microcom.mk
===================================================================
--- package/microcom/microcom.mk	(revision 19021)
+++ package/microcom/microcom.mk	(arbetskopia)
@@ -51,7 +51,7 @@
 	 	$(CFLAGS_WHOLE_PROGRAM) -o $@ $(wildcard $(MICROCOM_DIR)/*.c); \
 	)
 else
-	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -C
$(MICROCOM_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" -C
$(MICROCOM_DIR)
 endif
 	$(STRIP) -s $@
 
Index: package/wget/wget.mk
===================================================================
--- package/wget/wget.mk	(revision 19021)
+++ package/wget/wget.mk	(arbetskopia)
@@ -36,7 +36,7 @@
 	touch $(WGET_DIR)/.configured
 
 $(WGET_DIR)/$(WGET_BINARY): $(WGET_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(WGET_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(WGET_DIR)
 
 $(TARGET_DIR)/$(WGET_TARGET_BINARY): $(WGET_DIR)/$(WGET_BINARY)
 	install -D $(WGET_DIR)/$(WGET_BINARY)
$(TARGET_DIR)/$(WGET_TARGET_BINARY)
Index: package/argus/argus.mk
===================================================================
--- package/argus/argus.mk	(revision 19021)
+++ package/argus/argus.mk	(arbetskopia)
@@ -45,7 +45,7 @@
 	touch $@
 
 $(ARGUS_DIR)/$(ARGUS_BINARY): $(ARGUS_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(ARGUS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(ARGUS_DIR)
 
 $(TARGET_DIR)/$(ARGUS_TARGET_BINARY): $(ARGUS_DIR)/$(ARGUS_BINARY)
 	cp -dpf $(ARGUS_DIR)/$(ARGUS_BINARY) $@
Index: package/libusb/libusb.mk
===================================================================
--- package/libusb/libusb.mk	(revision 19021)
+++ package/libusb/libusb.mk	(arbetskopia)
@@ -36,7 +36,7 @@
 	touch $(LIBUSB_DIR)/.configured
 
 $(STAGING_DIR)/$(LIBUSB_BINARY): $(LIBUSB_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(LIBUSB_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBUSB_DIR)
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/$(LIBUSB_BINARY)
Index: package/qtopia4/qtopia4.mk
===================================================================
--- package/qtopia4/qtopia4.mk	(revision 19021)
+++ package/qtopia4/qtopia4.mk	(arbetskopia)
@@ -161,7 +161,7 @@
 	touch $(QTOPIA4_TARGET_DIR)/.configured
 
 $(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VER):
$(QTOPIA4_TARGET_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		-C $(QTOPIA4_TARGET_DIR) sub-src
 
 $(STAGING_DIR)/usr/lib/libQtCore.so.$(QTOPIA4_VER):
$(QTOPIA4_TARGET_DIR)/lib/libQtCore.so.$(QTOPIA4_VER)
Index: package/nano/nano.mk
===================================================================
--- package/nano/nano.mk	(revision 19021)
+++ package/nano/nano.mk	(arbetskopia)
@@ -35,7 +35,7 @@
 	touch $(NANO_DIR)/.configured
 
 $(NANO_DIR)/$(NANO_BINARY): $(NANO_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(NANO_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(NANO_DIR)
 
 $(TARGET_DIR)/$(NANO_TARGET_BINARY): $(NANO_DIR)/$(NANO_BINARY)
 	install -D $(NANO_DIR)/$(NANO_BINARY)
$(TARGET_DIR)/$(NANO_TARGET_BINARY)
Index: package/procps/procps.mk
===================================================================
--- package/procps/procps.mk	(revision 19021)
+++ package/procps/procps.mk	(arbetskopia)
@@ -22,7 +22,7 @@
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PROCPS_DIR)
 
 $(TARGET_DIR)/$(PROCPS_TARGET_BINARY): $(PROCPS_DIR)/$(PROCPS_BINARY)
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
 		install='install -D' -C $(PROCPS_DIR) lib64=/lib \
 		ldconfig='/bin/true' install
 	rm -Rf $(TARGET_DIR)/usr/share/man
Index: package/distcc/distcc.mk
===================================================================
--- package/distcc/distcc.mk	(revision 19021)
+++ package/distcc/distcc.mk	(arbetskopia)
@@ -45,7 +45,7 @@
 	touch $(DISTCC_DIR)/.configured
 
 $(DISTCC_DIR)/$(DISTCC_BINARY): $(DISTCC_DIR)/.configured
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC=$(TARGET_CC) -C $(DISTCC_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(DISTCC_DIR)
 
 $(TARGET_DIR)/$(DISTCC_TARGET_BINARY): $(DISTCC_DIR)/$(DISTCC_BINARY)
 	install -D $(DISTCC_DIR)/$(DISTCC_BINARY)d
$(TARGET_DIR)/$(DISTCC_TARGET_BINARY)d



Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: TARGET_CONFIGURE_OPTS-2.patch
Type: text/x-patch
Size: 12722 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070707/34deedea/attachment-0001.bin 
