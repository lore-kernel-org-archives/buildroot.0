From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 21:38:40 +0000 (UTC)
Subject: [Buildroot] svn commit: [25563] trunk/buildroot/package/avahi
Message-ID: <20090305213841.03B01775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 21:38:40 +0000 (Thu, 05 Mar 2009)
New Revision: 25563

Log:
avahi: convert to Makefile.autotools.in format

Added:
   trunk/buildroot/package/avahi/avahi-autoipd-perms.patch
   trunk/buildroot/package/avahi/avahi-ipv6only.patch

Removed:
   trunk/buildroot/package/avahi/autoipd-perms.patch
   trunk/buildroot/package/avahi/libdir-la.patch
   trunk/buildroot/package/avahi/uclibc.patch

Modified:
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2009-03-05 21:38:36 UTC (rev 25562)
+++ trunk/buildroot/package/avahi/Config.in	2009-03-05 21:38:40 UTC (rev 25563)
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_AVAHI
 	bool "avahi"
-	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_GETTEXT if BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBINTL if BR2_ENABLE_LOCALE
 	help
@@ -13,6 +12,7 @@
 	bool "IPv4LL network address configuration daemon"
 	default y
 	depends on BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_LIBDAEMON
 	help
 	  Avahi-autoipd implements IPv4LL, "Dynamic Configuration of
 	  IPv4 Link-Local Addresses" (IETF RFC3927), a protocol for
@@ -24,6 +24,7 @@
 config BR2_PACKAGE_AVAHI_DAEMON
 	bool "mDNS/DNS-SD daemon"
 	depends on BR2_PACKAGE_AVAHI
+	select BR2_PACKAGE_LIBDAEMON
 	select BR2_PACKAGE_EXPAT
 	help
 	  The Avahi mDNS/DNS-SD daemon implementing Apple's ZeroConf

Deleted: trunk/buildroot/package/avahi/autoipd-perms.patch
===================================================================
--- trunk/buildroot/package/avahi/autoipd-perms.patch	2009-03-05 21:38:36 UTC (rev 25562)
+++ trunk/buildroot/package/avahi/autoipd-perms.patch	2009-03-05 21:38:40 UTC (rev 25563)
@@ -1,11 +0,0 @@
---- avahi-0.6.14/avahi-autoipd/main.c.cls	2006-09-13 12:49:45.000000000 -0700
-+++ avahi-0.6.14/avahi-autoipd/main.c	2006-09-25 20:34:10.000000000 -0700
-@@ -239,7 +239,7 @@
- 
-     fprintf(f, "%s\n", inet_ntop(AF_INET, &addr, buf, sizeof (buf)));
-     fclose(f);
--
-+    chmod(fn, S_IRUSR|S_IWUSR);
-     return 0;
-     
- fail:

Copied: trunk/buildroot/package/avahi/avahi-autoipd-perms.patch (from rev 25562, trunk/buildroot/package/avahi/autoipd-perms.patch)
===================================================================
--- trunk/buildroot/package/avahi/avahi-autoipd-perms.patch	                        (rev 0)
+++ trunk/buildroot/package/avahi/avahi-autoipd-perms.patch	2009-03-05 21:38:40 UTC (rev 25563)
@@ -0,0 +1,11 @@
+--- avahi-0.6.14/avahi-autoipd/main.c.cls	2006-09-13 12:49:45.000000000 -0700
++++ avahi-0.6.14/avahi-autoipd/main.c	2006-09-25 20:34:10.000000000 -0700
+@@ -239,7 +239,7 @@
+ 
+     fprintf(f, "%s\n", inet_ntop(AF_INET, &addr, buf, sizeof (buf)));
+     fclose(f);
+-
++    chmod(fn, S_IRUSR|S_IWUSR);
+     return 0;
+     
+ fail:

Copied: trunk/buildroot/package/avahi/avahi-ipv6only.patch (from rev 25562, trunk/buildroot/package/avahi/uclibc.patch)
===================================================================
--- trunk/buildroot/package/avahi/avahi-ipv6only.patch	                        (rev 0)
+++ trunk/buildroot/package/avahi/avahi-ipv6only.patch	2009-03-05 21:38:40 UTC (rev 25563)
@@ -0,0 +1,19 @@
+diff -urpN avahi-0.6.22.orig/avahi-core/socket.c avahi-0.6.22/avahi-core/socket.c
+--- avahi-0.6.22.orig/avahi-core/socket.c	2007-12-16 22:03:08.000000000 +0100
++++ avahi-0.6.22/avahi-core/socket.c	2008-03-31 17:13:24.000000000 +0200
+@@ -394,13 +394,13 @@ int avahi_open_socket_ipv6(int no_reuse)
+         avahi_log_warn("IPV6_UNICAST_HOPS failed: %s", strerror(errno));
+         goto fail;
+     }
+-
++#ifdef IPV6_V6ONLY
+     yes = 1;
+     if (setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &yes, sizeof(yes)) < 0) {
+         avahi_log_warn("IPV6_V6ONLY failed: %s", strerror(errno));
+         goto fail;
+     }
+-
++#endif
+     yes = 1;
+     if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_LOOP, &yes, sizeof(yes)) < 0) {
+         avahi_log_warn("IPV6_MULTICAST_LOOP failed: %s", strerror(errno));

Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-05 21:38:36 UTC (rev 25562)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-05 21:38:40 UTC (rev 25563)
@@ -10,54 +10,13 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION:=0.6.22
-AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VERSION)
-AVAHI_SITE:=http://www.avahi.org/download/
-AVAHI_SOURCE:=avahi-$(AVAHI_VERSION).tar.gz
-AVAHI_CAT:=$(ZCAT)
+AVAHI_VERSION = 0.6.22
+AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
+AVAHI_SITE = http://www.avahi.org/download/
+AVAHI_INSTALL_STAGING = YES
+AVAHI_INSTALL_TARGET = YES
 
-AVAHI_TARGETS:=
-
-ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
-AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-autoipd
-endif
-
-AVAHI_EXTRA_DEPS:=
-
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
-AVAHI_TARGETS+=$(TARGET_DIR)/usr/sbin/avahi-daemon
-AVAHI_DISABLE_EXPAT:=--with-xml=expat
-# depend on the exact library file instead of expat so avahi isn't always
-# considered out-of-date
-AVAHI_EXTRA_DEPS+=$(STAGING_DIR)/usr/lib/libexpat.so.1
-else
-AVAHI_DISABLE_EXPAT:=--disable-expat --with-xml=none
-
-endif
-
-ifeq ($(BR2_PACKAGE_DBUS),y)
-AVAHI_DISABLE_DBUS:=
-AVAHI_EXTRA_DEPS+=dbus
-else
-AVAHI_DISABLE_DBUS:=--disable-dbus
-endif
-
-$(DL_DIR)/$(AVAHI_SOURCE):
-	 $(call DOWNLOAD,$(AVAHI_SITE),$(AVAHI_SOURCE))
-
-avahi-source: $(DL_DIR)/$(AVAHI_SOURCE)
-
-$(AVAHI_DIR)/.unpacked: $(DL_DIR)/$(AVAHI_SOURCE)
-	$(AVAHI_CAT) $(DL_DIR)/$(AVAHI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
-	touch $@
-
-$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked $(AVAHI_EXTRA_DEPS)
-	(cd $(AVAHI_DIR) && rm -rf config.cache && PATH=$(TARGET_PATH) autoconf)
-	(cd $(AVAHI_DIR) && \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_strtod=yes \
+AVAHI_CONF_ENV = ac_cv_func_strtod=yes \
 		ac_fsusage_space=yes \
 		fu_cv_sys_stat_statfs2_bsize=yes \
 		ac_cv_func_closedir_void=no \
@@ -110,22 +69,14 @@
 		ac_cv_func_working_mktime=yes \
 		jm_cv_func_working_re_compile_pattern=yes \
 		ac_use_included_regex=no \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(REAL_GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
+		avahi_cv_sys_cxx_works=yes
+
+AVAHI_CONF_OPT = --localstatedir=/var \
 		--disable-glib \
 		--disable-gobject \
 		--disable-qt3 \
 		--disable-qt4 \
 		--disable-gtk \
-		$(AVAHI_DISABLE_DBUS) \
-		$(AVAHI_DISABLE_EXPAT) \
 		--disable-gdbm \
 		--disable-python \
 		--disable-python-dbus \
@@ -134,70 +85,50 @@
 		--disable-monodoc \
 		--disable-stack-protector \
 		--with-distro=none \
+		$(if $(BR2_HAVE_MANPAGES),--enable,--disable)-manpages \
+		$(if $(BR2_PACKAGE_AVAHI_AUTOIPD),--enable,--disable)-autoipd \
 		--with-avahi-user=default \
 		--with-avahi-group=default \
 		--with-autoipd-user=default \
-		--with-autoipd-group=default \
-	)
-	touch $@
+		--with-autoipd-group=default
 
-$(AVAHI_DIR)/.compiled: $(AVAHI_DIR)/.configured
-	$(MAKE) -C $(AVAHI_DIR) $(if $(BR2_ENABLE_LOCALE),LIBS=-lintl)
-	touch $@
+AVAHI_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
 
-$(AVAHI_DIR)/.installed: $(AVAHI_DIR)/.compiled
-	mkdir -p $(STAGING_DIR)/etc/avahi
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(AVAHI_DIR) install
-	touch $@
+ifneq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_AVAHI_AUTOIPD),)
+AVAHI_DEPENDENCIES += libdaemon
+else
+AVAHI_CONF_OPT += --disable-libdaemon
+endif
 
-$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(AVAHI_DIR)/.installed
-	mkdir -p $(addprefix $(TARGET_DIR),\
-		/etc/avahi /etc/init.d /var/lib /usr/share/udhcpc /usr/sbin)
-	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
-	cp -af package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
-	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
-	cp -af package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
-	cp $(STAGING_DIR)/usr/sbin/avahi-autoipd $@
-	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
-	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+AVAHI_DEPENDENCIES += expat
+AVAHI_CONF_OPT += --with-xml=expat
+else
+AVAHI_CONF_OPT += --with-xml=none
+endif
 
-$(TARGET_DIR)/usr/sbin/avahi-daemon: $(AVAHI_DIR)/.installed
-	mkdir -p $(addprefix $(TARGET_DIR),\
-		/etc/avahi/services /usr/lib /usr/bin /usr/sbin)
-	cp -dpf $(STAGING_DIR)/usr/lib/libavahi-*.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libavahi-*.so*
-	cp -af $(STAGING_DIR)/etc/avahi/avahi-daemon.conf $(TARGET_DIR)/etc/avahi/
-	cp -af package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
 ifeq ($(BR2_PACKAGE_DBUS),y)
-	cp -dpf $(STAGING_DIR)/usr/bin/avahi-* $(TARGET_DIR)/usr/bin
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/bin/avahi-*
-	mkdir -p $(TARGET_DIR)/etc/dbus-1/system.d/
-	cp -r $(STAGING_DIR)/etc/dbus-1/system.d/avahi-* \
-		$(TARGET_DIR)/etc/dbus-1/system.d/
+AVAHI_DEPENDENCIES += dbus
+else
+AVAHI_CONF_OPT += --disable-dbus
 endif
-	cp $(STAGING_DIR)/usr/sbin/avahi-daemon $@
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-avahi: host-autoconf uclibc libdaemon $(if $(BR2_ENABLE_LOCALE),gettext libintl) $(AVAHI_TARGETS)
+ifeq ($(BR2_ENABLE_LOCALE),y)
+AVAHI_MAKE_OPT = LIBS=-lintl
+endif
 
-avahi-clean:
-	-$(MAKE) -C $(AVAHI_DIR) distclean
-	-rm -rf $(TARGET_DIR)/etc/avahi
-	-rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
-	-rm -f $(TARGET_DIR)/etc/init.d/S*avahi*
-	-rm -f $(TARGET_DIR)/usr/sbin/avahi-*
-	-rm -f $(TARGET_DIR)/usr/bin/avahi-*
-	-rm -f $(TARGET_DIR)/usr/lib/libavahi-*
+$(eval $(call AUTOTARGETS,package,avahi))
 
-avahi-dirclean:
-	rm -rf $(AVAHI_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_AVAHI),y)
-TARGETS+=avahi
+$(AVAHI_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/etc/init.d/avahi-*
+ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
+	rm -rf $(TARGET_DIR)/etc/dhcp3/
+	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
+	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
+	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
 endif
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON),y)
+	$(INSTALL) -m 0755 package/avahi/S50avahi-daemon $(TARGET_DIR)/etc/init.d/
+endif
+	touch $@

Deleted: trunk/buildroot/package/avahi/libdir-la.patch
===================================================================
--- trunk/buildroot/package/avahi/libdir-la.patch	2009-03-05 21:38:36 UTC (rev 25562)
+++ trunk/buildroot/package/avahi/libdir-la.patch	2009-03-05 21:38:40 UTC (rev 25563)
@@ -1,77 +0,0 @@
---- avahi/ltmain.sh.orig	2004-11-23 09:19:19.000000000 -0700
-+++ avahi/ltmain.sh	2007-01-13 14:36:53.000000000 -0700
-@@ -231,8 +231,9 @@
- 	# line option must be used.
- 	if test -z "$tagname"; then
- 	  $echo "$modename: unable to infer tagged configuration"
--	  $echo "$modename: specify a tag with \`--tag'" 1>&2
--	  exit $EXIT_FAILURE
-+	  $echo "$modename: defaulting to \`CC'"
-+	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
-+#	  exit $EXIT_FAILURE
- #        else
- #          $echo "$modename: using $tagname tagged configuration"
- 	fi
-@@ -2279,8 +2280,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	else
- 	  if test ! -f "$ladir/$objdir/$linklib" && test -f "$abs_ladir/$linklib"; then
-@@ -2754,6 +2761,16 @@
- 		esac
- 		if grep "^installed=no" $deplib > /dev/null; then
- 		  path="$absdir/$objdir"
-+#		This interferes with crosscompilation. -CL
-+#		else
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  if test -z "$libdir"; then
-+#		    $echo "$modename: \`$deplib' is not a valid libtool archive" 1>&2
-+#		    exit 1
-+#		  fi
-+#		  if test "$absdir" != "$libdir"; then
-+#		    $echo "$modename: warning: \`$deplib' seems to be moved" 1>&2
-+#		  fi
- 		else
- 		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		  if test -z "$libdir"; then
-@@ -5141,6 +5158,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
-@@ -5459,10 +5480,13 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  if test "$inst_prefix_dir" = "$destdir"; then
--	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
--	    exit $EXIT_FAILURE
--	  fi
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  # 
-+	  # if test "$inst_prefix_dir" = "$destdir"; then
-+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-+	  #   exit $EXIT_FAILURE
-+	  # fi
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.

Deleted: trunk/buildroot/package/avahi/uclibc.patch
===================================================================
--- trunk/buildroot/package/avahi/uclibc.patch	2009-03-05 21:38:36 UTC (rev 25562)
+++ trunk/buildroot/package/avahi/uclibc.patch	2009-03-05 21:38:40 UTC (rev 25563)
@@ -1,19 +0,0 @@
-diff -urpN avahi-0.6.22.orig/avahi-core/socket.c avahi-0.6.22/avahi-core/socket.c
---- avahi-0.6.22.orig/avahi-core/socket.c	2007-12-16 22:03:08.000000000 +0100
-+++ avahi-0.6.22/avahi-core/socket.c	2008-03-31 17:13:24.000000000 +0200
-@@ -394,13 +394,13 @@ int avahi_open_socket_ipv6(int no_reuse)
-         avahi_log_warn("IPV6_UNICAST_HOPS failed: %s", strerror(errno));
-         goto fail;
-     }
--
-+#ifdef IPV6_V6ONLY
-     yes = 1;
-     if (setsockopt(fd, IPPROTO_IPV6, IPV6_V6ONLY, &yes, sizeof(yes)) < 0) {
-         avahi_log_warn("IPV6_V6ONLY failed: %s", strerror(errno));
-         goto fail;
-     }
--
-+#endif
-     yes = 1;
-     if (setsockopt(fd, IPPROTO_IPV6, IPV6_MULTICAST_LOOP, &yes, sizeof(yes)) < 0) {
-         avahi_log_warn("IPV6_MULTICAST_LOOP failed: %s", strerror(errno));
