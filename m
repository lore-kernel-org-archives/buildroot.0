From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 27 Mar 2008 08:42:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: avahi berkeleydb
	boa dillo dm dmalloc dm etc...
Message-ID: <20080327154243.AA3893C355@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-27 08:42:42 -0700 (Thu, 27 Mar 2008)
New Revision: 21516

Log:
buildroot: cleanup <package>-clean targets.

Based on input from Arndt Kritzner & Bernhard Fischer.


Modified:
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/berkeleydb/berkeleydb.mk
   trunk/buildroot/package/boa/boa.mk
   trunk/buildroot/package/dillo/dillo.mk
   trunk/buildroot/package/dm/dm.mk
   trunk/buildroot/package/dmalloc/dmalloc.mk
   trunk/buildroot/package/dmraid/dmraid.mk
   trunk/buildroot/package/dropbear/dropbear.mk
   trunk/buildroot/package/fakeroot/fakeroot.mk
   trunk/buildroot/package/file/file.mk
   trunk/buildroot/package/iperf/iperf.mk
   trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
   trunk/buildroot/package/libeXosip2/libeXosip2.mk
   trunk/buildroot/package/libfloat/libfloat.mk
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/libmad/libmad.mk
   trunk/buildroot/package/libosip2/libosip2.mk
   trunk/buildroot/package/links/links.mk
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ltt/ltt.mk
   trunk/buildroot/package/lua/lua.mk
   trunk/buildroot/package/madplay/madplay.mk
   trunk/buildroot/package/nbd/nbd.mk
   trunk/buildroot/package/ncftp/ncftp.mk
   trunk/buildroot/package/netsnmp/netsnmp.mk
   trunk/buildroot/package/openssh/openssh.mk
   trunk/buildroot/package/openssl/openssl.mk
   trunk/buildroot/package/python/python.mk
   trunk/buildroot/package/rdesktop/rdesktop.mk
   trunk/buildroot/package/socat/socat.mk
   trunk/buildroot/package/speex/speex.mk
   trunk/buildroot/package/sqlite/sqlite.mk
   trunk/buildroot/package/strace/strace.mk
   trunk/buildroot/package/stunnel/stunnel.mk
   trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
   trunk/buildroot/package/tn5250/tn5250.mk
   trunk/buildroot/package/valgrind/valgrind.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/avahi/avahi.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -181,7 +181,7 @@
 avahi: uclibc busybox libdaemon $(AVAHI_TARGETS)
 
 avahi-clean:
-	$(MAKE) -C $(AVAHI_DIR) distclean
+	-$(MAKE) -C $(AVAHI_DIR) distclean
 	-rm -rf $(TARGET_DIR)/etc/avahi
 	-rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 	-rm -f $(TARGET_DIR)/etc/init.d/S*avahi*

Modified: trunk/buildroot/package/berkeleydb/berkeleydb.mk
===================================================================
--- trunk/buildroot/package/berkeleydb/berkeleydb.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/berkeleydb/berkeleydb.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -84,7 +84,7 @@
 berkeleydb-headers: $(TARGET_DIR)/usr/lib/libdb.a
 
 berkeleydb-clean:
-	$(MAKE) -C $(DB_DIR)/build_unix clean
+	-$(MAKE) -C $(DB_DIR)/build_unix clean
 
 berkeleydb-dirclean:
 	rm -rf $(DB_DIR)

Modified: trunk/buildroot/package/boa/boa.mk
===================================================================
--- trunk/buildroot/package/boa/boa.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/boa/boa.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -68,9 +68,10 @@
 boa-source: $(DL_DIR)/$(BOA_SOURCE)
 
 boa-clean:
-	@if [ -d $(BOA_WORKDIR)/Makefile ]; then \
-		$(MAKE) -C $(BOA_WORKDIR) clean; \
-	fi
+	-$(MAKE) -C $(BOA_WORKDIR) clean
+	rm -rf $(TARGET_DIR)/usr/sbin/boa \
+		$(TARGET_DIR)/usr/lib/boa/boa_indexer \
+		$(TARGET_DIR)/etc/mime.types $(TARGET_DIR)/etc/boa
 
 boa-dirclean:
 	rm -rf $(BOA_DIR) $(BOA_WORKDIR)

Modified: trunk/buildroot/package/dillo/dillo.mk
===================================================================
--- trunk/buildroot/package/dillo/dillo.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/dillo/dillo.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -44,9 +44,7 @@
 dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
 
 dillo-clean:
-	@if [ -d $(DILLO_DIR)/Makefile ]; then \
-		$(MAKE) -C $(DILLO_DIR) clean; \
-	fi
+	-$(MAKE) -C $(DILLO_DIR) clean
 
 dillo-dirclean:
 	rm -rf $(DILLO_DIR)

Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/dm/dm.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -114,9 +114,9 @@
 dm: uclibc $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) #$(DM_TARGET_HEADER)
 
 dm-clean:
-	rm $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) \
+	rm -f $(DM_TARGET_BINARY) $(DM_TARGET_LIBRARY) \
 		$(DM_TARGET_LIBRARY).$(DM_BASEVER) $(DM_TARGET_HEADER)
-	$(MAKE) -C $(DM_DIR) clean
+	-$(MAKE) -C $(DM_DIR) clean
 
 dm-dirclean:
 	rm -rf $(DM_DIR)

Modified: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -85,11 +85,11 @@
 dmalloc: uclibc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
 
 dmalloc-clean:
-	rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
-	rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
+	-rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
+	-rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
 	rm -f $(STAGING_DIR)/usr/include/dmalloc.h
 	rm -f $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
-	$(MAKE) -C $(DMALLOC_DIR) clean
+	-$(MAKE) -C $(DMALLOC_DIR) clean
 
 dmalloc-dirclean:
 	rm -rf $(DMALLOC_DIR)

Modified: trunk/buildroot/package/dmraid/dmraid.mk
===================================================================
--- trunk/buildroot/package/dmraid/dmraid.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/dmraid/dmraid.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -52,7 +52,7 @@
 
 dmraid-clean:
 	rm -f $(DMRAID_TARGET_BINARY) $(TARGET_DIR)/etc/init.d/dmraid
-	$(MAKE) -C $(DMRAID_DIR) clean
+	-$(MAKE) -C $(DMRAID_DIR) clean
 
 dmraid-dirclean:
 	rm -rf $(DMRAID_DIR)

Modified: trunk/buildroot/package/dropbear/dropbear.mk
===================================================================
--- trunk/buildroot/package/dropbear/dropbear.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/dropbear/dropbear.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -63,9 +63,10 @@
 dropbear: uclibc zlib $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
 
 dropbear-clean:
-	$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
-		LD=$(TARGET_CC) -C $(DROPBEAR_DIR) uninstall
 	-$(MAKE) -C $(DROPBEAR_DIR) clean
+	rm -f $(TARGET_DIR)/$(DROPBEAR_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/usr/bin/{scp,ssh,dbclient,dropbearkey,dropbearconvert}
+	rm -f $(TARGET_DIR)/etc/init.d/S50dropbear
 
 dropbear-dirclean:
 	rm -rf $(DROPBEAR_DIR)

Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -57,7 +57,7 @@
 host-fakeroot: uclibc $(STAGING_DIR)/usr/bin/fakeroot
 
 host-fakeroot-clean:
-	$(MAKE) -C $(FAKEROOT_DIR1) clean
+	-$(MAKE) -C $(FAKEROOT_DIR1) clean
 
 host-fakeroot-dirclean:
 	rm -rf $(FAKEROOT_DIR1)
@@ -115,7 +115,7 @@
 fakeroot: uclibc $(TARGET_DIR)/usr/bin/fakeroot
 
 fakeroot-clean:
-	$(MAKE) -C $(FAKEROOT_DIR2) clean
+	-$(MAKE) -C $(FAKEROOT_DIR2) clean
 	rm -f $(TARGET_DIR)/usr/bin/fake{d,root}
 
 fakeroot-dirclean:

Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/file/file.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -40,7 +40,7 @@
 host-file: $(TOOL_BUILD_DIR)/bin/file
 
 host-file-clean:
-	$(MAKE) -C $(FILE_DIR1) clean
+	-$(MAKE) -C $(FILE_DIR1) clean
 
 host-file-dirclean:
 	rm -rf $(FILE_DIR1)

Modified: trunk/buildroot/package/iperf/iperf.mk
===================================================================
--- trunk/buildroot/package/iperf/iperf.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/iperf/iperf.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -58,9 +58,8 @@
 iperf-source: $(DL_DIR)/$(IPERF_SOURCE)
 
 iperf-clean:
-	@if [ -d $(IPERF_KDIR)/Makefile ]; then \
-		$(MAKE) -C $(IPERF_DIR) clean; \
-	fi
+	rm -f $(TARGET_DIR)/usr/bin/iperf
+	-$(MAKE) -C $(IPERF_DIR) clean
 
 iperf-dirclean:
 	rm -rf $(IPERF_DIR)

Modified: trunk/buildroot/package/ipsec-tools/ipsec-tools.mk
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -142,8 +142,8 @@
 ipsec-tools-uninstall:
 
 ipsec-tools-clean:
-	$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) uninstall
-	$(MAKE) -C $(IPSEC_TOOLS_DIR) clean
+	-$(MAKE) -C $(IPSEC_TOOLS_DIR) DESTDIR=$(TARGET_DIR) uninstall
+	-$(MAKE) -C $(IPSEC_TOOLS_DIR) clean
 ifeq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS_LIBS)),y)
 	rm -f $(addprefix $(STAGING_DIR)/lib/, \
 		libipsec.a libipsec.la libracoon.a libracoon.la)
@@ -151,7 +151,6 @@
 	rm -f $(IPSEC_TOOLS_DIR)/.configured
 
 ipsec-tools-dirclean:
-	@echo $(LINUX_DIR)
 	rm -rf $(IPSEC_TOOLS_DIR)
 
 ifeq ($(strip $(BR2_PACKAGE_IPSEC_TOOLS)), y)

Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -89,11 +89,9 @@
 libeXosip2-source: $(DL_DIR)/$(LIBEXOSIP2_SOURCE)
 
 libeXosip2-clean:
-	@if [ -d $(LIBEXOSIP2_DIR)/Makefile ]; then \
-		$(MAKE) -C $(LIBEXOSIP2_DIR) clean; \
-	fi
-	rm -f $(STAGING_DIR)/usr/lib/libeXosip2.*
-	rm -f $(TARGET_DIR)/usr/lib/libeXosip2.*
+	-$(MAKE) -C $(LIBEXOSIP2_DIR) clean
+	-rm -f $(STAGING_DIR)/usr/lib/libeXosip2.*
+	-rm -f $(TARGET_DIR)/usr/lib/libeXosip2.*
 
 
 libeXosip2-dirclean:

Modified: trunk/buildroot/package/libfloat/libfloat.mk
===================================================================
--- trunk/buildroot/package/libfloat/libfloat.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/libfloat/libfloat.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -29,7 +29,7 @@
 $(LIBFLOAT_DIR)/.unpacked: $(DL_DIR)/$(LIBFLOAT_SOURCE) $(DL_DIR)/$(LIBFLOAT_PATCH)
 	$(LIBFLOAT_CAT) $(DL_DIR)/$(LIBFLOAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	# Remove the binary files distributed with the the package.
-	$(MAKE) -C $(LIBFLOAT_DIR) clean
+	-$(MAKE) -C $(LIBFLOAT_DIR) clean
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) $(DL_DIR) $(LIBFLOAT_PATCH)
 	toolchain/patch-kernel.sh $(LIBFLOAT_DIR) package/libfloat/ libfloat\*.patch
 	touch $@

Modified: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -60,7 +60,7 @@
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(STAGING_DIR)/usr/share/man
 endif
-	$(MAKE) -C $(LIBLOCKFILE_DIR) clean
+	-$(MAKE) -C $(LIBLOCKFILE_DIR) clean
 
 liblockfile-dirclean:
 	rm -rf $(LIBLOCKFILE_DIR)

Modified: trunk/buildroot/package/libmad/libmad.mk
===================================================================
--- trunk/buildroot/package/libmad/libmad.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/libmad/libmad.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -64,12 +64,10 @@
 libmad-source: $(DL_DIR)/$(LIBMAD_SOURCE)
 
 libmad-clean:
-	@if [ -d $(LIBMAD_DIR)/Makefile ]; then \
-		$(MAKE) -C $(LIBMAD_DIR) clean; \
-	fi
-	rm -f $(STAGING_DIR)/usr/lib/libmad.*
+	-$(MAKE) -C $(LIBMAD_DIR) clean
+	-rm -f $(STAGING_DIR)/usr/lib/libmad.*
 	rm -f $(STAGING_DIR)/usr/include/mad.h
-	rm -f $(TARGET_DIR)/usr/lib/libmad.*
+	-rm -f $(TARGET_DIR)/usr/lib/libmad.*
 	rm -f $(TARGET_DIR)/usr/include/mad.h
 
 

Modified: trunk/buildroot/package/libosip2/libosip2.mk
===================================================================
--- trunk/buildroot/package/libosip2/libosip2.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/libosip2/libosip2.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -67,13 +67,12 @@
 libosip2-source: $(DL_DIR)/$(LIBOSIP2_SOURCE)
 
 libosip2-clean:
-	@if [ -d $(LIBOSIP2_DIR)/Makefile ]; then \
-		$(MAKE) -C $(LIBOSIP2_DIR) clean; \
-	fi
-	rm -f $(STAGING_DIR)/usr/lib/libosip2.*
-	rm -f $(TARGET_DIR)/usr/lib/libosip2.*
+	-$(MAKE) -C $(LIBOSIP2_DIR) clean
+	-rm -f $(STAGING_DIR)/usr/lib/libosip2.*
+	-rm -f $(STAGING_DIR)/usr/lib/libosipparser2.*
+	-rm -f $(TARGET_DIR)/usr/lib/libosip2.*
+	-rm -f $(TARGET_DIR)/usr/lib/libosipparser2.*
 
-
 libosip2-dirclean:
 	rm -rf $(LIBOSIP2_DIR)
 

Modified: trunk/buildroot/package/links/links.mk
===================================================================
--- trunk/buildroot/package/links/links.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/links/links.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -48,7 +48,8 @@
 	install -c $(LINKS_DIR)/links $(TARGET_DIR)/usr/bin/links
 
 links-clean:
-	$(MAKE) -C $(LINKS_DIR) clean
+	-$(MAKE) -C $(LINKS_DIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/links
 
 links-dirclean:
 	rm -rf $(LINKS_DIR)

Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -29,8 +29,8 @@
 lockfile-progs: uclibc liblockfile $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
 
 lockfile-progs-clean:
-	rm -f $(TARGET_DIR)/usr/bin/lockfile-*
-	$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
+	-rm -f $(TARGET_DIR)/usr/bin/lockfile-*
+	-$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
 
 lockfile-progs-dirclean:
 	rm -rf $(LOCKFILE_PROGS_DIR)

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -53,7 +53,7 @@
 ltp-testsuite: uclibc host-fakeroot $(LTP_TESTSUITE_DIR)/.installed
 
 ltp-testsuite-clean:
-	$(MAKE) -C $(LTP_TESTSUITE_DIR) clean
+	-$(MAKE) -C $(LTP_TESTSUITE_DIR) clean
 
 ltp-testsuite-dirclean:
 	rm -rf $(LTP_TESTSUITE_DIR)

Modified: trunk/buildroot/package/ltt/ltt.mk
===================================================================
--- trunk/buildroot/package/ltt/ltt.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/ltt/ltt.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -50,7 +50,7 @@
 host-ltt-tracevisualizer: $(TOOL_BUILD_DIR)/bin/tracevisualizer
 
 host-ltt-clean:
-	$(MAKE) -C $(LTT_DIR1) clean
+	-$(MAKE) -C $(LTT_DIR1) clean
 
 host-ltt-dirclean:
 	rm -rf $(LTT_DIR1)

Modified: trunk/buildroot/package/lua/lua.mk
===================================================================
--- trunk/buildroot/package/lua/lua.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/lua/lua.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -12,7 +12,7 @@
 
 LUA_DIR=$(BUILD_DIR)/lua-$(LUA_VERSION)
 
-LUA_CFLAGS=-DLUA_USE_LINUX 
+LUA_CFLAGS=-DLUA_USE_LINUX
 LUA_MYLIBS="-Wl,-E -ldl -lreadline -lhistory -lncurses"
 
 $(DL_DIR)/$(LUA_SOURCE):
@@ -53,7 +53,7 @@
 	cp -dpf $(STAGING_DIR)/usr/bin/luac $(TARGET_DIR)/usr/bin/luac
 
 
-lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac 
+lua-bins:	$(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
 
 lua-libs:	$(TARGET_DIR)/usr/lib/liblua.a
 
@@ -62,9 +62,11 @@
 lua-source: $(DL_DIR)/$(LUA_SOURCE)
 
 lua-clean:
-	@if [ -d $(LUA_DIR)/Makefile ]; then \
-		$(MAKE) -C $(LUA_DIR) clean; \
-	fi
+	rm -f $(STAGING_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
+	rm -f $(STAGING_DIR)/usr/lib/liblua.a
+	rm -f $(TARGET_DIR)/usr/bin/lua $(TARGET_DIR)/usr/bin/luac
+	rm -f $(TARGET_DIR)/usr/lib/liblua.a
+	-$(MAKE) -C $(LUA_DIR) clean
 
 lua-dirclean:
 	rm -rf $(LUA_DIR)

Modified: trunk/buildroot/package/madplay/madplay.mk
===================================================================
--- trunk/buildroot/package/madplay/madplay.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/madplay/madplay.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -56,7 +56,7 @@
 
 madplay-clean:
 	rm -f $(TARGET_DIR)/$(MADPLAY_TARGET_BIN)
-	$(MAKE) -C $(MADPLAY_DIR) clean
+	-$(MAKE) -C $(MADPLAY_DIR) clean
 
 madplay-dirclean:
 	rm -rf $(MADPLAY_DIR)

Modified: trunk/buildroot/package/nbd/nbd.mk
===================================================================
--- trunk/buildroot/package/nbd/nbd.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/nbd/nbd.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -42,9 +42,8 @@
 nbd-source: $(DL_DIR)/$(NBD_SOURCE)
 
 nbd-clean:
-	@if [ -d $(NBD_DIR)/Makefile ]; then \
-		$(MAKE) -C $(NBD_DIR) clean; \
-	fi
+	rm -f $(TARGET_DIR)/sbin/nbd-client
+	-$(MAKE) -C $(NBD_DIR) clean
 
 nbd-dirclean:
 	rm -rf $(NBD_DIR)

Modified: trunk/buildroot/package/ncftp/ncftp.mk
===================================================================
--- trunk/buildroot/package/ncftp/ncftp.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/ncftp/ncftp.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -67,7 +67,7 @@
 ncftp: uclibc $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
 
 ncftp-clean:
-	$(MAKE) -C $(NCFTP_DIR) clean
+	-$(MAKE) -C $(NCFTP_DIR) clean
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(NCFTP_TARGET_BINS))
 
 ncftp-dirclean:

Modified: trunk/buildroot/package/netsnmp/netsnmp.mk
===================================================================
--- trunk/buildroot/package/netsnmp/netsnmp.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/netsnmp/netsnmp.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -105,9 +105,9 @@
 netsnmp-source: $(DL_DIR)/$(NETSNMP_SOURCE)
 
 netsnmp-clean:
-	$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
-	$(MAKE) -C $(NETSNMP_DIR) clean
-	rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
+	-$(MAKE) PREFIX=$(TARGET_DIR) INSTALL_PREFIX=$(TARGET_DIR) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(NETSNMP_DIR) uninstall
+	-$(MAKE) -C $(NETSNMP_DIR) clean
+	-rm -rf $(TARGET_DIR)/etc/snmp/{snmpd{,trapd},mib2c*}.conf \
 		$(TARGET_DIR)/etc/default/snmpd \
 		$(TARGET_DIR)/usr/include/net-snmp
 

Modified: trunk/buildroot/package/openssh/openssh.mk
===================================================================
--- trunk/buildroot/package/openssh/openssh.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/openssh/openssh.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -73,8 +73,8 @@
 openssh-source: $(DL_DIR)/$(OPENSSH_SOURCE)
 
 openssh-clean:
-	$(MAKE) -C $(OPENSSH_DIR) clean
-	$(MAKE) CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) uninstall
+	-$(MAKE) -C $(OPENSSH_DIR) clean
+	-$(MAKE) CC=$(TARGET_CC) DESTDIR=$(TARGET_DIR) -C $(OPENSSH_DIR) uninstall
 
 openssh-dirclean:
 	rm -rf $(OPENSSH_DIR)

Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/openssl/openssl.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -94,10 +94,10 @@
 openssl-source: $(DL_DIR)/$(OPENSSL_SOURCE)
 
 openssl-clean:
-	$(MAKE) -C $(OPENSSL_DIR) clean
+	-$(MAKE) -C $(OPENSSL_DIR) clean
 	rm -f $(STAGING_DIR)/usr/bin/openssl $(TARGET_DIR)/usr/bin/openssl
-	rm -f $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/libcrypto.so*
-	rm -f $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/libssl.so*
+	-rm -f $(STAGING_DIR)/usr/lib/libcrypto.so* $(TARGET_DIR)/usr/lib/libcrypto.so*
+	-rm -f $(STAGING_DIR)/usr/lib/libssl.so* $(TARGET_DIR)/usr/lib/libssl.so*
 	rm -rf $(STAGING_DIR)/usr/include/openssl $(TARGET_DIR)/usr/include/openssl
 
 openssl-dirclean:

Modified: trunk/buildroot/package/python/python.mk
===================================================================
--- trunk/buildroot/package/python/python.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/python/python.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -89,7 +89,7 @@
 		$(MAKE) python Parser/pgen && \
 		mv python hostpython && \
 		mv Parser/pgen Parser/hostpgen && \
-		$(MAKE) distclean \
+		-$(MAKE) distclean \
 	) && \
 	touch $@
 
@@ -167,7 +167,8 @@
 
 python-clean:
 	-$(MAKE) -C $(PYTHON_DIR) distclean
-	rm $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+	rm -f $(PYTHON_DIR)/.configured $(TARGET_DIR)/$(PYTHON_TARGET_BINARY)
+	-rm -rf $(TARGET_DIR)/usr/lib/python* $(TARGET_DIR)/usr/include/python*
 
 python-dirclean:
 	rm -rf $(PYTHON_DIR)

Modified: trunk/buildroot/package/rdesktop/rdesktop.mk
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/rdesktop/rdesktop.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -35,18 +35,16 @@
 $(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(RDESKTOP_DIR)
 
-$(RDESKTOP_DIR)/.installed: $(RDESKTOP_DIR)/rdesktop
-	cp $(RDESKTOP_DIR)/rdesktop $(TARGET_DIR)/usr/bin
-	touch $(RDESKTOP_DIR)/.installed
+$(TARGET_DIR)/usr/bin/rdesktop: $(RDESKTOP_DIR)/rdesktop
+	cp $^ $@
 
-rdesktop: uclibc openssl $(XSERVER) $(RDESKTOP_DIR)/.installed
+rdesktop: uclibc openssl $(XSERVER) $(TARGET_DIR)/usr/bin/rdesktop
 
 rdesktop-source: $(DL_DIR)/$(RDESKTOP_SOURCE)
 
 rdesktop-clean:
-	@if [ -d $(RDESKTOP_DIR)/Makefile ]; then \
-		$(MAKE) -C $(RDESKTOP_DIR) clean; \
-	fi
+	-$(MAKE) -C $(RDESKTOP_DIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/rdesktop
 
 rdesktop-dirclean:
 	rm -rf $(RDESKTOP_DIR) $(RDESKTOP_DIR)

Modified: trunk/buildroot/package/socat/socat.mk
===================================================================
--- trunk/buildroot/package/socat/socat.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/socat/socat.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -54,19 +54,18 @@
 	rm -f $@
 	$(MAKE) -C $(SOCAT_WORKDIR)
 
-$(SOCAT_WORKDIR)/.installed: $(SOCAT_WORKDIR)/socat
+$(TARGET_DIR)/usr/bin/socat: $(SOCAT_WORKDIR)/socat
 	mkdir -p $(TARGET_DIR)/usr/man/man1
 	$(MAKE) -C $(SOCAT_WORKDIR) install prefix=$(TARGET_DIR)/usr DESTDIR=$(TARGET_DIR)
 	touch $@
 
-socat: uclibc $(SOCAT_WORKDIR)/.installed
+socat: uclibc $(TARGET_DIR)/usr/bin/socat
 
 socat-source: $(DL_DIR)/$(SOCAT_SOURCE)
 
 socat-clean:
-	@if [ -d $(SOCAT_WORKDIR)/Makefile ]; then \
-		$(MAKE) -C $(SOCAT_WORKDIR) clean; \
-	fi
+	-$(MAKE) -C $(SOCAT_WORKDIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/{socat,filan,procan}
 
 socat-dirclean:
 	rm -rf $(SOCAT_DIR) $(SOCAT_WORKDIR)

Modified: trunk/buildroot/package/speex/speex.mk
===================================================================
--- trunk/buildroot/package/speex/speex.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/speex/speex.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -82,17 +82,20 @@
 $(TARGET_DIR)/usr/lib/libspeex.so: $(TARGET_DIR)/usr/bin/speexenc
 	cp -dpf $(STAGING_DIR)/usr/lib/libspeex.so* $(TARGET_DIR)/usr/lib
 
-speex-bins:	
+speex-bins:
 
 speex: uclibc libogg $(TARGET_DIR)/usr/lib/libspeex.so
 
 speex-source: $(DL_DIR)/$(SPEEX_SOURCE)
 
 speex-clean:
-	@if [ -d $(SPEEX_DIR)/Makefile ]; then \
-		$(MAKE) -C $(SPEEX_DIR) clean; \
-	fi
+	-$(MAKE) -C $(SPEEX_DIR) clean
+	-rm -f $(STAGING_DIR)/usr/lib/libspeex.so*
+	rm -f $(STAGING_DIR)/usr/bin/speexenc $(STAGING_DIR)/usr/bin/speexdec
+	-rm -f $(TARGET_DIR)/usr/lib/libspeex.so*
+	rm -f $(TARGET_DIR)/usr/bin/speexenc $(TARGET_DIR)/usr/bin/speexdec
 
+
 speex-dirclean:
 	rm -rf $(SPEEX_DIR)
 

Modified: trunk/buildroot/package/sqlite/sqlite.mk
===================================================================
--- trunk/buildroot/package/sqlite/sqlite.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/sqlite/sqlite.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -68,9 +68,11 @@
 sqlite-source: $(DL_DIR)/$(SQLITE_SOURCE)
 
 sqlite-clean:
-	@if [ -d $(SQLITE_DIR)/Makefile ]; then \
-		$(MAKE) -C $(SQLITE_DIR) clean; \
-	fi
+	-$(MAKE) -C $(SQLITE_DIR) clean
+	-rm -rf $(STAGING_DIR)/usr/lib/libsqlite*
+	-rm -rf $(STAGING_DIR)/usr/bin/sqlite3
+	-rm -rf $(TARGET_DIR)/usr/lib/libsqlite*
+	-rm -rf $(TARGET_DIR)/usr/bin/sqlite3
 
 sqlite-dirclean:
 	rm -rf $(SQLITE_DIR)

Modified: trunk/buildroot/package/strace/strace.mk
===================================================================
--- trunk/buildroot/package/strace/strace.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/strace/strace.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -69,7 +69,7 @@
 
 strace-clean:
 	rm -f $(TARGET_DIR)/usr/bin/strace
-	$(MAKE) -C $(STRACE_DIR) clean
+	-$(MAKE) -C $(STRACE_DIR) clean
 
 strace-dirclean:
 	rm -rf $(STRACE_DIR)

Modified: trunk/buildroot/package/stunnel/stunnel.mk
===================================================================
--- trunk/buildroot/package/stunnel/stunnel.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/stunnel/stunnel.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -65,7 +65,8 @@
 stunnel: uclibc $(TARGET_DIR)/usr/bin/stunnel
 
 stunnel-clean:
-	$(MAKE) -C $(STUNNEL_DIR) clean
+	-$(MAKE) -C $(STUNNEL_DIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/stunnel
 
 stunnel-dirclean:
 	rm -rf $(STUNNEL_DIR)

Modified: trunk/buildroot/package/tinyhttpd/tinyhttpd.mk
===================================================================
--- trunk/buildroot/package/tinyhttpd/tinyhttpd.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/tinyhttpd/tinyhttpd.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -38,7 +38,7 @@
 tinyhttpd: uclibc $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
 
 tinyhttpd-clean:
-	$(MAKE) -C $(TINYHTTPD_DIR) clean
+	-$(MAKE) -C $(TINYHTTPD_DIR) clean
 	@rm -f $(TARGET_DIR)/$(TINYHTTPD_TARGET_BINARY)
 	@rm -f $(TARGET_DIR)/etc/init.d/S85tinyhttpd
 	@rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/var/www

Modified: trunk/buildroot/package/tn5250/tn5250.mk
===================================================================
--- trunk/buildroot/package/tn5250/tn5250.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/tn5250/tn5250.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -47,7 +47,8 @@
 tn5250-source: $(DL_DIR)/$(TN5250_SOURCE)
 
 tn5250-clean:
-	$(MAKE) -C $(TN5250_DIR) clean
+	-$(MAKE) -C $(TN5250_DIR) clean
+	rm -f $(TARGET_DIR)/usr/bin/tn5250
 
 tn5250-dirclean:
 	rm -rf $(TN5250_DIR)

Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2008-03-27 13:14:29 UTC (rev 21515)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2008-03-27 15:42:42 UTC (rev 21516)
@@ -75,7 +75,9 @@
 valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
 
 valgrind-clean:
-	$(MAKE) -C $(VALGRIND_DIR) clean
+	-$(MAKE) -C $(VALGRIND_DIR) clean
+	-rm -f $(TARGET_DIR)/usr/bin/valgrind*
+	rm -rf $(TARGET_DIR)/usr/lib/valgrind
 
 valgrind-dirclean:
 	rm -rf $(VALGRIND_DIR)
