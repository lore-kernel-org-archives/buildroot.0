From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 13 Mar 2007 20:12:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: pkgconfig procps
	sdl sed setserial smart etc...
Message-ID: <20070314031223.641DD48084@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-03-13 20:12:22 -0700 (Tue, 13 Mar 2007)
New Revision: 18096

Log:
yet more LDFLAGS handling fixups

Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk
   trunk/buildroot/package/procps/procps.mk
   trunk/buildroot/package/sdl/sdl.mk
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/package/setserial/setserial.mk
   trunk/buildroot/package/smartmontools/smartmontools.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/sudo/sudo.mk
   trunk/buildroot/package/tar/tar.mk
   trunk/buildroot/package/tcl/tcl.mk
   trunk/buildroot/package/tcpdump/dhcpdump.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk
   trunk/buildroot/package/tftpd/tftpd.mk
   trunk/buildroot/package/thttpd/thttpd.mk
   trunk/buildroot/package/tiff/tiff.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/usbutils/usbutils.mk
   trunk/buildroot/package/util-linux/util-linux.mk
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/vtun/vtun.mk
   trunk/buildroot/package/wget/wget.mk
   trunk/buildroot/package/which/which.mk
   trunk/buildroot/package/xfsprogs/xfsprogs.mk
   trunk/buildroot/package/zlib/zlib.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -23,8 +23,6 @@
 
 $(PKGCONFIG_DIR)/.configured: $(PKGCONFIG_DIR)/.unpacked
 	(cd $(PKGCONFIG_DIR); rm -rf config.cache; \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--prefix=/usr \
 		--exec-prefix=/usr \

Modified: trunk/buildroot/package/procps/procps.mk
===================================================================
--- trunk/buildroot/package/procps/procps.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/procps/procps.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -17,6 +17,7 @@
 	$(ZCAT) $(DL_DIR)/$(PROCPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(PROCPS_DIR) package/procps/ procps\*.patch
 	$(SED) '/^CFLAGS/s:-O2:$(TARGET_CFLAGS):' $(PROCPS_DIR)/Makefile
+	$(SED) '/^LDFLAGS/s:$$:$(TARGET_LDFLAGS):' $(PROCPS_DIR)/Makefile
 	touch $(PROCPS_DIR)/.source
 
 $(PROCPS_DIR)/$(PROCPS_BINARY): $(PROCPS_DIR)/.source

Modified: trunk/buildroot/package/sdl/sdl.mk
===================================================================
--- trunk/buildroot/package/sdl/sdl.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/sdl/sdl.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -22,7 +22,7 @@
 	(cd $(SDL_DIR); \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)"
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/sed/sed.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -97,7 +97,7 @@
 	(cd $(SED_DIR2); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		CPPFLAGS="$(SED_CFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/setserial/setserial.mk
===================================================================
--- trunk/buildroot/package/setserial/setserial.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/setserial/setserial.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -34,7 +34,7 @@
 	(cd $(SETSERIAL_DIR); rm -rf config.cache ; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(SETSERIAL_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/smartmontools/smartmontools.mk
===================================================================
--- trunk/buildroot/package/smartmontools/smartmontools.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/smartmontools/smartmontools.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -27,7 +27,7 @@
 	(cd $(SMARTMONTOOLS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/socat/socat.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -30,7 +30,7 @@
 	(cd $(SOCAT_WORKDIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(SOCAT_DIR)/configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/strace/strace.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -30,7 +30,7 @@
 		$(if $(BR_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no) \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) $(BR2_STRACE_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		aaa_ac_cv_header_linux_if_packet_h=yes \
 		./configure \
 		--target=$(REAL_GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/stunnel/stunnel.mk
===================================================================
--- trunk/buildroot/package/stunnel/stunnel.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/stunnel/stunnel.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 	(cd $(STUNNEL_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		ac_cv_file___dev_ptmx_=yes \
 		ac_cv_file___dev_ptc_=no \
 		./configure \

Modified: trunk/buildroot/package/sudo/sudo.mk
===================================================================
--- trunk/buildroot/package/sudo/sudo.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/sudo/sudo.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		./configure \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \

Modified: trunk/buildroot/package/tar/tar.mk
===================================================================
--- trunk/buildroot/package/tar/tar.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tar/tar.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 	(cd $(GNUTAR_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		ac_cv_func_chown_works=yes \
 		gl_cv_func_chown_follows_symlink=yes \
 		./configure \

Modified: trunk/buildroot/package/tcl/tcl.mk
===================================================================
--- trunk/buildroot/package/tcl/tcl.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tcl/tcl.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -20,7 +20,7 @@
 	(cd $(TCL_DIR)/unix; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/tcpdump/dhcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tcpdump/dhcpdump.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -27,7 +27,7 @@
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -28,7 +28,7 @@
 		BUILD_CC=$(TARGET_CC) HOSTCC="$(HOSTCC)" \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/tftpd/tftpd.mk
===================================================================
--- trunk/buildroot/package/tftpd/tftpd.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tftpd/tftpd.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 	(cd $(TFTP_HPA_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/thttpd/thttpd.mk
===================================================================
--- trunk/buildroot/package/thttpd/thttpd.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/thttpd/thttpd.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -26,7 +26,7 @@
 	(cd $(THTTPD_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/tiff/tiff.mk
===================================================================
--- trunk/buildroot/package/tiff/tiff.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tiff/tiff.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -24,7 +24,7 @@
 	(cd $(TIFF_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/tn5250/tn5250.mk
===================================================================
--- trunk/buildroot/package/tn5250/tn5250.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/tn5250/tn5250.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -14,7 +14,7 @@
 	(cd $(TN5250_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/usbutils/usbutils.mk
===================================================================
--- trunk/buildroot/package/usbutils/usbutils.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/usbutils/usbutils.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 	(cd $(USBUTILS_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS) -I$(TARGET_DIR)/usr/include" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		ac_cv_func_malloc_0_nonnull=yes \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/util-linux/util-linux.mk
===================================================================
--- trunk/buildroot/package/util-linux/util-linux.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/util-linux/util-linux.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -26,7 +26,7 @@
 	(cd $(UTIL-LINUX_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--prefix=/usr \

Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -25,7 +25,7 @@
 	(cd $(VALGRIND_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/vtun/vtun.mk
===================================================================
--- trunk/buildroot/package/vtun/vtun.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/vtun/vtun.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -28,7 +28,7 @@
 	(cd $(VTUN_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/wget/wget.mk
===================================================================
--- trunk/buildroot/package/wget/wget.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/wget/wget.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -24,7 +24,7 @@
 	(cd $(WGET_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/which/which.mk
===================================================================
--- trunk/buildroot/package/which/which.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/which/which.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -24,7 +24,7 @@
 	(cd $(WHICH_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \

Modified: trunk/buildroot/package/xfsprogs/xfsprogs.mk
===================================================================
--- trunk/buildroot/package/xfsprogs/xfsprogs.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/xfsprogs/xfsprogs.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -53,7 +53,7 @@
 
 $(XFSPROGS_DIR)/$(XFSPROGS_BINARY): $(XFSPROGS_DIR)/.configured
 	$(MAKE1) PATH=$(TARGET_PATH) CPPFLAGS=-I$(E2FSPROGS_DIR)/lib \
-		LDFLAGS=-L$(E2FSPROGS_DIR)/lib -C $(XFSPROGS_DIR)
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(E2FSPROGS_DIR)/lib" -C $(XFSPROGS_DIR)
 ifeq ($(XFSPROGS_CONFIG_SHARED),--enable-shared)
 	( \
 		cd $(XFSPROGS_DIR) ; \

Modified: trunk/buildroot/package/zlib/zlib.mk
===================================================================
--- trunk/buildroot/package/zlib/zlib.mk	2007-03-14 03:10:29 UTC (rev 18095)
+++ trunk/buildroot/package/zlib/zlib.mk	2007-03-14 03:12:22 UTC (rev 18096)
@@ -24,8 +24,8 @@
 $(ZLIB_DIR)/.configured: $(ZLIB_DIR)/.source
 	(cd $(ZLIB_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
-		CFLAGS="$(ZLIB_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
+		CFLAGS="$(TARGET_CFLAGS) $(ZLIB_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		./configure \
 		--shared \
 		--prefix=/usr \
