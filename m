From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 20:58:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: curl liblockfile
	lockfile-progs xerces
Message-ID: <20070507035830.B395D48085@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 20:58:30 -0700 (Sun, 06 May 2007)
New Revision: 18571

Log:
Add new packages.


Added:
   trunk/buildroot/package/curl/
   trunk/buildroot/package/curl/Config.in
   trunk/buildroot/package/curl/curl-7.10.4-path.patch
   trunk/buildroot/package/curl/curl-7.12.0-nousr.patch
   trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch
   trunk/buildroot/package/curl/curl-7.13.1-auth.patch
   trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch
   trunk/buildroot/package/curl/curl.mk
   trunk/buildroot/package/liblockfile/
   trunk/buildroot/package/liblockfile/Config.in
   trunk/buildroot/package/liblockfile/liblockfile-install.patch
   trunk/buildroot/package/liblockfile/liblockfile.mk
   trunk/buildroot/package/lockfile-progs/
   trunk/buildroot/package/lockfile-progs/Config.in
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
   trunk/buildroot/package/xerces/
   trunk/buildroot/package/xerces/Config.in
   trunk/buildroot/package/xerces/xerces.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-05-07 03:57:09 UTC (rev 18570)
+++ trunk/buildroot/package/Config.in	2007-05-07 03:58:30 UTC (rev 18571)
@@ -50,6 +50,7 @@
 source "package/pkgconfig/Config.in"
 source "package/readline/Config.in"
 source "package/valgrind/Config.in"
+source "package/xerces/Config.in"
 
 comment "Other stuff"
 source "package/at/Config.in"
@@ -65,7 +66,9 @@
 source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libfloat/Config.in"
+source "package/liblockfile/Config.in"
 source "package/libsysfs/Config.in"
+source "package/lockfile-progs/Config.in"
 source "package/lsof/Config.in"
 source "package/ltp-testsuite/Config.in"
 source "package/ltrace/Config.in"
@@ -120,6 +123,7 @@
 source "package/boa/Config.in"
 source "package/bind/Config.in"
 source "package/bridge/Config.in"
+source "package/curl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dhcp/Config.in"
 endif

Added: trunk/buildroot/package/curl/Config.in
===================================================================
--- trunk/buildroot/package/curl/Config.in	                        (rev 0)
+++ trunk/buildroot/package/curl/Config.in	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CURL
+	bool "curl"
+	default n
+	help
+	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
+	  and Dict servers, using any of the supported protocols.
+
+	  http://curl.haxx.nu/
+
+config BR2_PACKAGE_LIBCURL
+	bool "libcurl"
+	default n
+	help
+	  cURL is a tool for getting files from FTP, HTTP, Gopher, Telnet,
+	  and Dict servers, using any of the supported protocols.
+
+	  http://curl.haxx.nu/

Added: trunk/buildroot/package/curl/curl-7.10.4-path.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.10.4-path.patch	                        (rev 0)
+++ trunk/buildroot/package/curl/curl-7.10.4-path.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,13 @@
+--- curl-7.10.4/lib/Makefile.am
++++ curl-7.10.4/lib/Makefile.am
+@@ -78,8 +78,8 @@
+ 
+ install-data-hook:
+ 	@if test -n "@CURL_CA_BUNDLE@"; then \
+-	  $(mkinstalldirs) `dirname $(DESTDIR)@CURL_CA_BUNDLE@`; \
+-	  @INSTALL_DATA@ $(srcdir)/ca-bundle.crt $(DESTDIR)@CURL_CA_BUNDLE@; \
++	  $(mkinstalldirs) `dirname $(prefix)/../@CURL_CA_BUNDLE@`; \
++	  @INSTALL_DATA@ $(srcdir)/ca-bundle.crt $(prefix)/../@CURL_CA_BUNDLE@; \
+         fi
+ 
+ # this hook is mainly for non-unix systems to build even if configure

Added: trunk/buildroot/package/curl/curl-7.12.0-nousr.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.12.0-nousr.patch	                        (rev 0)
+++ trunk/buildroot/package/curl/curl-7.12.0-nousr.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,16 @@
+--- curl-7.12.0/configure.ac.orig	2004-05-25 23:43:39.000000000 +0200
++++ curl-7.12.0/configure.ac		2004-07-26 15:12:03.029071072 +0200
+@@ -742,5 +742,5 @@
+     dnl check the given spot right away!
+     EXTRA_SSL=$OPT_SSL
+-    LDFLAGS="$LDFLAGS -L$EXTRA_SSL/lib$libsuff"
++    #LDFLAGS="$LDFLAGS -L$EXTRA_SSL/lib$libsuff"
+     CPPFLAGS="$CPPFLAGS -I$EXTRA_SSL/include/openssl -I$EXTRA_SSL/include"
+     ;;
+@@ -750,5 +750,5 @@
+      HAVECRYPTO="yes"
+      ],[
+-     LDFLAGS="$CLEANLDFLAGS -L$EXTRA_SSL/lib$libsuff"
++     LDFLAGS="$CLEANLDFLAGS"
+      CPPFLAGS="$CLEANCPPFLAGS -I$EXTRA_SSL/include/openssl -I$EXTRA_SSL/include"
+      AC_CHECK_LIB(crypto, CRYPTO_add_lock,[

Added: trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch	                        (rev 0)
+++ trunk/buildroot/package/curl/curl-7.13.1-2005-3185.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,16 @@
+--- curl-7.13.1/lib/http_ntlm.c.2005-3185	2005-02-22 13:10:30.000000000 +0100
++++ curl-7.13.1/lib/http_ntlm.c	2005-10-19 15:18:42.165859528 +0200
+@@ -534,6 +534,13 @@
+     size=64;
+     ntlmbuf[62]=ntlmbuf[63]=0;
+ 
++    /* Make sure that the user and domain strings fit in the target buffer
++         before we copy them there. */
++    if(size + userlen + domlen >= sizeof(ntlmbuf)) {
++      failf(conn->data, "user + domain name too big");
++      return CURLE_OUT_OF_MEMORY;
++    }
++
+     memcpy(&ntlmbuf[size], domain, domlen);
+     size += domlen;
+ 

Added: trunk/buildroot/package/curl/curl-7.13.1-auth.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-auth.patch	                        (rev 0)
+++ trunk/buildroot/package/curl/curl-7.13.1-auth.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,48 @@
+--- curl-7.13.1/lib/http.c.pom	2005-02-19 00:53:07.000000000 +0100
++++ curl-7.13.1/lib/http.c	2005-04-27 11:48:40.000000000 +0200
+@@ -455,6 +455,7 @@
+   /* To prevent the user+password to get sent to other than the original
+      host due to a location-follow, we do some weirdo checks here */
+   if(!data->state.this_is_a_follow ||
++     conn->bits.netrc || 
+      !data->state.first_host ||
+      curl_strequal(data->state.first_host, conn->host.name) ||
+      data->set.http_disable_hostname_check_before_authentication) {
+--- curl-7.13.1/lib/url.c.pom	2005-02-09 23:47:57.000000000 +0100
++++ curl-7.13.1/lib/url.c	2005-04-27 11:45:59.000000000 +0200
+@@ -3131,15 +3131,23 @@
+            user, passwd);
+   }
+ 
++  conn->bits.netrc = FALSE;
+   if (data->set.use_netrc != CURL_NETRC_IGNORED) {
+     if(Curl_parsenetrc(conn->host.name,
+                        user, passwd,
+                        data->set.netrc_file)) {
+-      infof(data, "Couldn't find host %s in the " DOT_CHAR "netrc file, using defaults\n",
++      infof(data, "Couldn't find host %s in the " DOT_CHAR
++            "netrc file, using defaults\n",
+             conn->host.name);
+     }
+-    else
++    else {
++      /* set bits.netrc TRUE to remember that we got the name from a .netrc
++         file, so that it is safe to use even if we followed a Location: to a
++         different host or similar. */
++      conn->bits.netrc = TRUE;
++
+       conn->bits.user_passwd = 1; /* enable user+password */
++    }
+   }
+ 
+   /* If our protocol needs a password and we have none, use the defaults */
+--- curl-7.13.1/lib/urldata.h.pom	2005-02-09 14:06:56.000000000 +0100
++++ curl-7.13.1/lib/urldata.h	2005-04-27 11:50:31.000000000 +0200
+@@ -388,6 +388,7 @@
+   bool ftp_use_lprt;  /* As set with CURLOPT_FTP_USE_EPRT, but if we find out
+                          LPRT doesn't work we disable it for the forthcoming
+                          requests */
++  bool netrc;         /* name+password provided by netrc */
+ };
+ 
+ struct hostname {

Added: trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch
===================================================================
--- trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch	                        (rev 0)
+++ trunk/buildroot/package/curl/curl-7.13.1-cve-2005-4077.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,23 @@
+--- curl-7.13.1/lib/url.c.cve-2005-4077	2005-12-08 13:08:03.000000000 +0100
++++ curl-7.13.1/lib/url.c	2005-12-08 13:15:56.565790336 +0100
+@@ -2313,12 +2313,18 @@
+   if(urllen < LEAST_PATH_ALLOC)
+     urllen=LEAST_PATH_ALLOC;
+ 
+-  conn->pathbuffer=(char *)malloc(urllen);
++  /*
++   * We malloc() the buffers below urllen+2 to make room for to possibilities:
++   * 1 - an extra terminating zero
++   * 2 - an extra slash (in case a syntax like "www.host.com?moo" is used)
++   */
++
++  conn->pathbuffer=(char *)malloc(urllen+3);
+   if(NULL == conn->pathbuffer)
+     return CURLE_OUT_OF_MEMORY; /* really bad error */
+   conn->path = conn->pathbuffer;
+ 
+-  conn->host.rawalloc=(char *)malloc(urllen);
++  conn->host.rawalloc=(char *)malloc(urllen+3);
+   if(NULL == conn->host.rawalloc)
+     return CURLE_OUT_OF_MEMORY;
+   conn->host.name = conn->host.rawalloc;

Added: trunk/buildroot/package/curl/curl.mk
===================================================================
--- trunk/buildroot/package/curl/curl.mk	                        (rev 0)
+++ trunk/buildroot/package/curl/curl.mk	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,81 @@
+#############################################################
+#
+# curl
+#
+#############################################################
+CURL_VERSION:=7.13.1
+CURL_SOURCE:=curl-$(CURL_VERSION).tar.bz2
+CURL_SITE:=http://curl.haxx.se/download/
+CURL_CAT:=$(BZCAT)
+CURL_DIR:=$(BUILD_DIR)/curl-$(CURL_VERSION)
+CURL_BINARY:=curl
+
+$(DL_DIR)/$(CURL_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(CURL_SITE)/$(CURL_SOURCE)
+
+curl-source: $(DL_DIR)/$(CURL_SOURCE)
+
+$(CURL_DIR)/.unpacked: $(DL_DIR)/$(CURL_SOURCE)
+	$(CURL_CAT) $(DL_DIR)/$(CURL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(CURL_DIR) package/curl/ \*.patch*
+	touch $(CURL_DIR)/.unpacked
+
+$(CURL_DIR)/.configured: $(CURL_DIR)/.unpacked
+	(cd $(CURL_DIR); rm -rf config.cache; \
+		aclocal; \
+		libtoolize --force; \
+		./reconf; \
+		$(TARGET_CONFIGURE_OPTS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=$(STAGING_DIR) \
+	);
+	touch $(CURL_DIR)/.configured
+
+$(CURL_DIR)/src/.libs/$(CURL_BINARY): $(CURL_DIR)/.configured
+	$(MAKE) -C $(CURL_DIR)
+
+$(STAGING_DIR)/bin/$(CURL_BINARY): $(CURL_DIR)/src/.libs/$(CURL_BINARY)
+	-mkdir $(STAGING_DIR)/bin
+	$(MAKE) prefix=$(STAGING_DIR) -C $(CURL_DIR) install
+	-rm -rf $(STAGING_DIR)/man
+	touch $(STAGING_DIR)/bin/$(CURL_BINARY)
+
+$(TARGET_DIR)/usr/lib/libcurl.so.3.0.0: $(STAGING_DIR)/bin/$(CURL_BINARY)
+	-mkdir $(TARGET_DIR)/usr/lib
+	-mkdir $(TARGET_DIR)/usr/bin
+	cp -a $(STAGING_DIR)/lib/libcurl.so* $(TARGET_DIR)/usr/lib
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libcurl.so.3.0.0
+
+$(TARGET_DIR)/usr/bin/$(CURL_BINARY): $(TARGET_DIR)/usr/lib/libcurl.so.3.0.0
+	cp -a $(STAGING_DIR)/bin/$(CURL_BINARY) $(TARGET_DIR)/usr/bin
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
+
+curl: uclibc $(TARGET_DIR)/usr/bin/$(CURL_BINARY)
+
+libcurl: $(STAGING_DIR)/bin/$(CURL_BINARY)
+
+curl-clean:
+	rm -f $(TARGET_DIR)/usr/lib/libcurl.so*
+	rm -f $(TARGET_DIR)/usr/bin/curl
+	rm -f $(STAGING_DIR)/bin/curl*
+	rm -f $(STAGING_DIR)/lib/libcurl.so*
+	rm -rf $(STAGING_DIR)/include/curl
+	-$(MAKE) -C $(CURL_DIR) clean
+
+curl-dirclean:
+	rm -rf $(CURL_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_CURL)),y)
+TARGETS+=curl
+endif
+ifeq ($(strip $(BR2_PACKAGE_LIBCURL)),y)
+TARGETS+=libcurl
+endif

Added: trunk/buildroot/package/liblockfile/Config.in
===================================================================
--- trunk/buildroot/package/liblockfile/Config.in	                        (rev 0)
+++ trunk/buildroot/package/liblockfile/Config.in	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_LIBLOCKFILE
+	bool "liblockfile"
+	default n
+	help
+	  NFS-safe locking library.

Added: trunk/buildroot/package/liblockfile/liblockfile-install.patch
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile-install.patch	                        (rev 0)
+++ trunk/buildroot/package/liblockfile/liblockfile-install.patch	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,16 @@
+diff -ur liblockfile-1.06.1/Makefile.in liblockfile-1.06.1-patched/Makefile.in
+--- liblockfile-1.06.1/Makefile.in	2001-03-16 22:08:33.000000000 -0600
++++ liblockfile-1.06.1-patched/Makefile.in	2007-04-11 07:18:38.000000000 -0500
+@@ -60,11 +60,7 @@
+ 
+ install_common:
+ 		install -m 644 lockfile.h maillock.h $(ROOT)$(includedir)
+-		if [ "$(MAILGROUP)" != "" ]; then\
+-		  install -g $(MAILGROUP) -m 2755 dotlockfile $(ROOT)$(bindir);\
+-		else \
+-		  install -g root -m 755 dotlockfile $(ROOT)$(bindir); \
+-		fi
++		install -m 2755 dotlockfile $(ROOT)$(bindir);\
+ 		install -m 644 *.1 $(ROOT)$(mandir)/man1
+ 		install -m 644 *.3 $(ROOT)$(mandir)/man3
+ 

Added: trunk/buildroot/package/liblockfile/liblockfile.mk
===================================================================
--- trunk/buildroot/package/liblockfile/liblockfile.mk	                        (rev 0)
+++ trunk/buildroot/package/liblockfile/liblockfile.mk	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,67 @@
+#############################################################
+#
+# liblockfile
+#
+#############################################################
+LIBLOCKFILE_VERSION=1.06.1
+LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).tar.gz
+LIBLOCKFILE_SITE:=http://ftp.debian.org/debian/pool/main/libl/liblockfile/
+LIBLOCKFILE_CAT:=$(ZCAT)
+LIBLOCKFILE_DIR:=$(BUILD_DIR)/liblockfile-$(LIBLOCKFILE_VERSION)
+LIBLOCKFILE_BINARY:=liblockfile.so.1.0
+
+$(DL_DIR)/$(LIBLOCKFILE_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(LIBLOCKFILE_SITE)/$(LIBLOCKFILE_SOURCE)
+
+liblockfile-source: $(DL_DIR)/$(LIBLOCKFILE_SOURCE)
+
+$(LIBLOCKFILE_DIR)/.unpacked: $(DL_DIR)/$(LIBLOCKFILE_SOURCE)
+	$(LIBLOCKFILE_CAT) $(DL_DIR)/$(LIBLOCKFILE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBLOCKFILE_DIR) package/liblockfile/ *.patch
+	touch $(LIBLOCKFILE_DIR)/.unpacked
+
+$(LIBLOCKFILE_DIR)/.configured: $(LIBLOCKFILE_DIR)/.unpacked
+	(cd $(LIBLOCKFILE_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--enable-shared \
+	);
+	touch $(LIBLOCKFILE_DIR)/.configured
+
+$(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY): $(LIBLOCKFILE_DIR)/.configured
+	mkdir -p $(STAGING_DIR)/man/man1 $(STAGING_DIR)/man/man3
+	$(MAKE) -C $(LIBLOCKFILE_DIR) prefix= ROOT=$(STAGING_DIR) install
+	ln -sf $(LIBLOCKFILE_BINARY) $(STAGING_DIR)/lib/liblockfile.so.1
+	cp -a $(LIBLOCKFILE_DIR)/liblockfile.a $(STAGING_DIR)/lib
+
+$(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY): $(STAGING_DIR)/lib/$(LIBLOCKFILE_BINARY)
+	-mkdir -p $(TARGET_DIR)/usr/lib
+	cp -a $(STAGING_DIR)/lib/liblockfile.so* $(TARGET_DIR)/usr/lib
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
+
+liblockfile: uclibc $(TARGET_DIR)/usr/lib/$(LIBLOCKFILE_BINARY)
+
+liblockfile-clean:
+	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
+	rm -f $(STAGING_DIR)/lib/liblockfile*
+	rm -f $(STAGING_DIR)/include/lockfile.h
+	rm -f $(STAGING_DIR)/include/mailfile.h
+	rm -rf $(STAGING_DIR)/man
+	$(MAKE) -C $(LIBLOCKFILE_DIR) clean
+
+liblockfile-dirclean:
+	rm -rf $(LIBLOCKFILE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBLOCKFILE)),y)
+TARGETS+=liblockfile
+endif

Added: trunk/buildroot/package/lockfile-progs/Config.in
===================================================================
--- trunk/buildroot/package/lockfile-progs/Config.in	                        (rev 0)
+++ trunk/buildroot/package/lockfile-progs/Config.in	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LOCKFILE_PROGS
+	bool "lockfile programs"
+	default n
+	select BR2_PACKAGE_LIBLOCKFILE
+	help
+	  Build lockfile utility programs.

Added: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	                        (rev 0)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,44 @@
+#############################################################
+#
+# lockfile-progs
+#
+#############################################################
+LOCKFILE_PROGS_VERSION=0.1.10
+LOCKFILE_PROGS_SOURCE:=lockfile-progs_$(LOCKFILE_PROGS_VERSION).tar.gz
+LOCKFILE_PROGS_SITE:=http://ftp.debian.org/debian/pool/main/l/lockfile-progs/
+LOCKFILE_PROGS_CAT:=$(ZCAT)
+LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
+LOCKFILE_PROGS_BINARY:=usr/bin/lockfile-create
+
+$(DL_DIR)/$(LOCKFILE_PROGS_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(LOCKFILE_PROGS_SITE)/$(LOCKFILE_PROGS_SOURCE)
+
+lockfile-progs-source: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
+
+$(LOCKFILE_PROGS_DIR)/.unpacked: $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE)
+	$(LOCKFILE_PROGS_CAT) $(DL_DIR)/$(LOCKFILE_PROGS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $(LOCKFILE_PROGS_DIR)/.unpacked
+
+$(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
+	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)"			\
+		LDFLAGS="$(TARGET_LDFLAGS)" -C $(LOCKFILE_PROGS_DIR)
+	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
+
+lockfile-progs: uclibc liblockfile $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
+
+lockfile-progs-clean:
+	rm -f $(TARGET_DIR)/usr/bin/lockfile*Z
+	$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
+
+lockfile-progs-dirclean:
+	rm -rf $(LOCKFILE_PROGS_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LOCKFILE_PROGS)),y)
+TARGETS+=lockfile-progs
+endif

Added: trunk/buildroot/package/xerces/Config.in
===================================================================
--- trunk/buildroot/package/xerces/Config.in	                        (rev 0)
+++ trunk/buildroot/package/xerces/Config.in	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_XERCES
+	bool "xerces"
+	default n
+	help
+	  Xerces-C++ is a validating XML parser written in portable C++.
+
+	  http://xml.apache.org/xerces-c/

Added: trunk/buildroot/package/xerces/xerces.mk
===================================================================
--- trunk/buildroot/package/xerces/xerces.mk	                        (rev 0)
+++ trunk/buildroot/package/xerces/xerces.mk	2007-05-07 03:58:30 UTC (rev 18571)
@@ -0,0 +1,64 @@
+#############################################################
+#
+# xerces
+#
+#############################################################
+XERCES_VERSION:=2.7.0
+XERCES_SOURCE:=xerces-c-src_2_7_0.tar.gz
+XERCES_SITE:=http://www.apache.org/dist/xml/xerces-c/source/
+XERCES_CAT:=$(ZCAT)
+XERCES_DIR:=$(BUILD_DIR)/xerces-c-src_2_7_0
+XERCES_BINARY:=lib/libxerces-c.so.27.0
+
+$(DL_DIR)/$(XERCES_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(XERCES_SITE)/$(XERCES_SOURCE)
+
+xerces-source: $(DL_DIR)/$(XERCES_SOURCE)
+
+$(XERCES_DIR)/.unpacked: $(DL_DIR)/$(XERCES_SOURCE)
+	$(XERCES_CAT) $(DL_DIR)/$(XERCES_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+#	toolchain/patch-kernel.sh $(XERCES_DIR) package/xerces/ \*.patch*
+	touch $(XERCES_DIR)/.unpacked
+
+$(XERCES_DIR)/.configured: $(XERCES_DIR)/.unpacked
+	(cd $(XERCES_DIR)/src/xercesc; rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		XERCESCROOT=$(XERCES_DIR) \
+		./runConfigure -plinux -minmem \
+		-nsocket -tnative -rpthread \
+		-c$(TARGET_CC) -x$(TARGET_CXX) \
+	);
+	touch $(XERCES_DIR)/.configured
+
+$(XERCES_DIR)/$(XERCES_BINARY): $(XERCES_DIR)/.configured
+	$(MAKE) XERCESCROOT=$(XERCES_DIR) -C $(XERCES_DIR)/src/xercesc
+
+$(STAGING_DIR)/$(XERCES_BINARY): $(XERCES_DIR)/$(XERCES_BINARY)
+	$(MAKE) XERCESCROOT=$(XERCES_DIR) PREFIX=$(STAGING_DIR)	\
+		-C $(XERCES_DIR)/src/xercesc install
+
+$(TARGET_DIR)/usr/$(XERCES_BINARY): $(STAGING_DIR)/$(XERCES_BINARY)
+	cp -a $(STAGING_DIR)/lib/libxerces-c.so* $(TARGET_DIR)/usr/lib
+	cp -a $(STAGING_DIR)/lib/libxerces-depdom.so* $(TARGET_DIR)/usr/lib
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libxerces-c.so.27.0
+	$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libxerces-depdom.so.27.0
+
+xerces: uclibc $(TARGET_DIR)/usr/$(XERCES_BINARY)
+
+xerces-clean:
+	rm -rf $(STAGING_DIR)/include/xercesc
+	rm -f $(STAGING_DIR)/lib/libxerces*
+	rm -f $(TARGET_DIR)/usr/lib/libxerces*
+	-$(MAKE) -C $(XERCES_DIR) clean
+
+xerces-dirclean:
+	rm -rf $(XERCES_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_XERCES)),y)
+TARGETS+=xerces
+endif
