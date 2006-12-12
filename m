From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 14:26:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  avahi libdaemon
Message-ID: <20061212222652.6963348587@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 14:26:51 -0800 (Tue, 12 Dec 2006)
New Revision: 16861

Log:
Add avahi package and add libdaemon, which is needed by avahi


Added:
   trunk/buildroot/package/avahi/
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/avahi/S05avahi-setup.sh
   trunk/buildroot/package/avahi/autoipd-perms.patch
   trunk/buildroot/package/avahi/avahi.mk
   trunk/buildroot/package/avahi/busybox-udhcpc-default.script
   trunk/buildroot/package/avahi/uclibc.patch
   trunk/buildroot/package/libdaemon/
   trunk/buildroot/package/libdaemon/Config.in
   trunk/buildroot/package/libdaemon/libdaemon.mk
   trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/Config.in	2006-12-12 22:26:51 UTC (rev 16861)
@@ -29,6 +29,7 @@
 source "package/at/Config.in"
 source "package/autoconf/Config.in"
 source "package/automake/Config.in"
+source "package/avahi/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bind/Config.in"
 source "package/bison/Config.in"

Added: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/Config.in	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_AVAHI
+	bool "avahi"
+	default n
+	help
+	  Avahi is a system which facilitates service 
+	  discovery on a local network. 
+
+	  http://www.avahi.org/

Added: trunk/buildroot/package/avahi/S05avahi-setup.sh
===================================================================
--- trunk/buildroot/package/avahi/S05avahi-setup.sh	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/S05avahi-setup.sh	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+case "$1" in
+    start|"")
+	if [ ! -d /tmp/avahi-autopid ]; then
+	    rm -rf /tmp/avahi-autoipd
+	    mkdir /tmp/avahi-autoipd
+	    chown default.default /tmp/avahi-autoipd
+	fi
+	;;
+    stop) ;;
+    *)
+	echo "Usage: S05avahi-setup.sh {start|stop}" >&2
+	exit 1
+	;;
+esac


Property changes on: trunk/buildroot/package/avahi/S05avahi-setup.sh
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/avahi/autoipd-perms.patch
===================================================================
--- trunk/buildroot/package/avahi/autoipd-perms.patch	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/autoipd-perms.patch	2006-12-12 22:26:51 UTC (rev 16861)
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

Added: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/avahi.mk	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,173 @@
+#############################################################
+#
+# avahi (zeroconf implementation)
+#
+#############################################################
+#
+# This program is free software; you can redistribute it 
+# and/or modify it under the terms of the GNU Lesser General 
+# Public License as published by the Free Software Foundation; 
+# either version 2.1 of the License, or (at your option) any 
+# later version.
+
+AVAHI_VER:=0.6.14
+AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VER)
+AVAHI_SITE:=http://www.avahi.org/download/
+AVAHI_SOURCE:=avahi-$(AVAHI_VER).tar.gz
+AVAHI_CAT:=zcat
+
+$(DL_DIR)/$(AVAHI_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(AVAHI_SITE)/$(AVAHI_SOURCE)
+
+avahi-source: $(DL_DIR)/$(AVAHI_SOURCE)
+
+$(AVAHI_DIR)/.unpacked: $(DL_DIR)/$(AVAHI_SOURCE)
+	$(AVAHI_CAT) $(DL_DIR)/$(AVAHI_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(AVAHI_DIR) package/avahi/ \*.patch
+	touch $(AVAHI_DIR)/.unpacked
+
+$(AVAHI_DIR)/.configured: $(AVAHI_DIR)/.unpacked
+	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
+	( \
+		cd $(AVAHI_DIR) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LIBDAEMON_CFLAGS="-I$(STAGING_DIR)/include" \
+		LIBDAEMON_LIBS="-L$(STAGING_DIR)/lib -ldaemon" \
+		PKG_CONFIG_PATH="$(LIBDAEMON_DIR)" \
+		ac_cv_func_strtod=yes \
+		ac_fsusage_space=yes \
+		fu_cv_sys_stat_statfs2_bsize=yes \
+		ac_cv_func_closedir_void=no \
+		ac_cv_func_getloadavg=no \
+		ac_cv_lib_util_getloadavg=no \
+		ac_cv_lib_getloadavg_getloadavg=no \
+		ac_cv_func_getgroups=yes \
+		ac_cv_func_getgroups_works=yes \
+		ac_cv_func_chown_works=yes \
+		ac_cv_have_decl_euidaccess=no \
+		ac_cv_func_euidaccess=no \
+		ac_cv_have_decl_strnlen=yes \
+		ac_cv_func_strnlen_working=yes \
+		ac_cv_func_lstat_dereferences_slashed_symlink=yes \
+		ac_cv_func_lstat_empty_string_bug=no \
+		ac_cv_func_stat_empty_string_bug=no \
+		vb_cv_func_rename_trailing_slash_bug=no \
+		ac_cv_have_decl_nanosleep=yes \
+		jm_cv_func_nanosleep_works=yes \
+		gl_cv_func_working_utimes=yes \
+		ac_cv_func_utime_null=yes \
+		ac_cv_have_decl_strerror_r=yes \
+		ac_cv_func_strerror_r_char_p=no \
+		jm_cv_func_svid_putenv=yes \
+		ac_cv_func_getcwd_null=yes \
+		ac_cv_func_getdelim=yes \
+		ac_cv_func_mkstemp=yes \
+		utils_cv_func_mkstemp_limitations=no \
+		utils_cv_func_mkdir_trailing_slash_bug=no \
+		ac_cv_func_memcmp_working=yes \
+		ac_cv_have_decl_malloc=yes \
+		gl_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_malloc_0_nonnull=yes \
+		ac_cv_func_calloc_0_nonnull=yes \
+		ac_cv_func_realloc_0_nonnull=yes \
+		jm_cv_func_gettimeofday_clobber=no \
+		am_cv_func_working_getline=yes \
+		gl_cv_func_working_readdir=yes \
+		jm_ac_cv_func_link_follows_symlink=no \
+		utils_cv_localtime_cache=no \
+		ac_cv_struct_st_mtim_nsec=no \
+		gl_cv_func_tzset_clobber=no \
+		gl_cv_func_getcwd_null=yes \
+		gl_cv_func_getcwd_path_max=yes \
+		ac_cv_func_fnmatch_gnu=yes \
+		am_getline_needs_run_time_check=no \
+		am_cv_func_working_getline=yes \
+		gl_cv_func_mkdir_trailing_slash_bug=no \
+		gl_cv_func_mkstemp_limitations=no \
+		ac_cv_func_working_mktime=yes \
+		jm_cv_func_working_re_compile_pattern=yes \
+		ac_use_included_regex=no \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/sbin \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--includedir=$(STAGING_DIR)/include \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		--disable-glib \
+		--disable-qt3 \
+		--disable-qt4 \
+		--disable-gtk \
+		--disable-dbus \
+		--disable-expat \
+		--disable-gdbm \
+		--disable-python \
+		--disable-python-dbus \
+		--disable-pygtk \
+		--disable-mono \
+		--disable-monodoc \
+		--with-distro=none \
+		--with-avahi-user=default \
+		--with-avahi-group=default \
+		--with-autoipd-user=default \
+		--with-autoipd-group=default \
+	);
+	touch $(AVAHI_DIR)/.configured
+
+$(AVAHI_DIR)/.compiled: $(AVAHI_DIR)/.configured
+	$(MAKE) -C $(AVAHI_DIR)
+	touch $(AVAHI_DIR)/.compiled
+
+$(STAGING_DIR)/sbin/avahi-autoipd: $(AVAHI_DIR)/.compiled
+	$(MAKE) \
+		-C $(AVAHI_DIR)/avahi-autoipd \
+		prefix=$(STAGING_DIR) \
+		exec_prefix=$(STAGING_DIR) \
+		bindir=$(STAGING_DIR)/bin \
+		datadir=$(STAGING_DIR)/share \
+		sbindir=$(STAGING_DIR)/sbin \
+		sysconfdir=$(STAGING_DIR)/etc \
+		install
+	touch -c $(STAGING_DIR)/sbin/avahi-autoipd
+
+$(TARGET_DIR)/usr/sbin/avahi-autoipd: $(STAGING_DIR)/sbin/avahi-autoipd
+	cp $^ $@
+	mkdir -p $(TARGET_DIR)/etc/avahi
+	mkdir -p $(TARGET_DIR)/var/lib
+	ln -sf /tmp/avahi-autoipd $(TARGET_DIR)/var/lib/avahi-autoipd
+	cp -af $(STAGING_DIR)/etc/avahi/avahi-autoipd.action $(TARGET_DIR)/etc/avahi/
+	cp -af $(BASE_DIR)/package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
+	cp -af $(BASE_DIR)/package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
+	chmod 0755 $(TARGET_DIR)/usr/share/udhcpc/default.script
+	$(STRIP) --strip-unneeded $@
+
+avahi: uclibc busybox libdaemon $(TARGET_DIR)/usr/sbin/avahi-autoipd
+
+avahi-clean:
+	$(MAKE) -C $(AVAHI_DIR) distclean
+	rm -rf $(TARGET_DIR)/etc/avahi
+	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
+	rm -f $(TARGET_DIR)/etc/init.d/S*avahi*
+
+avahi-dirclean:
+	rm -rf $(AVAHI_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_AVAHI)),y)
+TARGETS+=avahi
+endif

Added: trunk/buildroot/package/avahi/busybox-udhcpc-default.script
===================================================================
--- trunk/buildroot/package/avahi/busybox-udhcpc-default.script	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/busybox-udhcpc-default.script	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,52 @@
+#!/bin/sh
+
+# udhcpc script edited by Tim Riker <Tim@Rikers.org>
+
+[ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
+
+RESOLV_CONF="/etc/resolv.conf"
+[ -n "$broadcast" ] && BROADCAST="broadcast $broadcast"
+[ -n "$subnet" ] && NETMASK="netmask $subnet"
+
+case "$1" in
+	deconfig)
+		grep -q -v ip= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface up
+		fi
+		grep -q -v nfsroot= /proc/cmdline
+		if [ $? -eq 0 ]; then
+			/sbin/ifconfig $interface 0.0.0.0
+		fi
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -wD $interface --no-chroot
+		fi
+		;;
+
+	renew|bound)
+		if [ -x /usr/sbin/avahi-autoipd ]; then
+			/usr/sbin/avahi-autoipd -k $interface
+		fi
+		/sbin/ifconfig $interface $ip $BROADCAST $NETMASK
+
+		if [ -n "$router" ] ; then
+			echo "deleting routers"
+			while route del default gw 0.0.0.0 dev $interface ; do
+				:
+			done
+
+			for i in $router ; do
+				route add default gw $i dev $interface
+			done
+		fi
+
+		echo -n > $RESOLV_CONF
+		[ -n "$domain" ] && echo search $domain >> $RESOLV_CONF
+		for i in $dns ; do
+			echo adding dns $i
+			echo nameserver $i >> $RESOLV_CONF
+		done
+		;;
+esac
+
+exit 0


Property changes on: trunk/buildroot/package/avahi/busybox-udhcpc-default.script
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/avahi/uclibc.patch
===================================================================
--- trunk/buildroot/package/avahi/uclibc.patch	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/avahi/uclibc.patch	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,19 @@
+diff -urN avahi-0.6.14-orig/avahi-core/socket.c avahi-0.6.14/avahi-core/socket.c
+--- avahi-0.6.14-orig/avahi-core/socket.c	2006-08-31 10:18:03.000000000 -0700
++++ avahi-0.6.14/avahi-core/socket.c	2006-09-21 19:01:31.000000000 -0700
+@@ -394,13 +394,13 @@
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

Added: trunk/buildroot/package/libdaemon/Config.in
===================================================================
--- trunk/buildroot/package/libdaemon/Config.in	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/libdaemon/Config.in	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBDAEMON
+	bool "libdaemon"
+	default n
+	help
+	  libdaemon is a lightweight C library that eases the 
+	  writing of UNIX daemons.
+
+	  http://0pointer.de/lennart/projects/libdaemon/

Added: trunk/buildroot/package/libdaemon/libdaemon.mk
===================================================================
--- trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/libdaemon/libdaemon.mk	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,90 @@
+#############################################################
+#
+# libdaemon (UNIX daemon library)
+#
+#############################################################
+# Copyright 2003-2005 Lennart Poettering <mzqnrzba@0pointer.de>
+#
+# This library is free software; you can redistribute it 
+# and/or modify it under the terms of the GNU Lesser General 
+# Public License as published by the Free Software Foundation; 
+# either version 2.1 of the License, or (at your option) any 
+# later version.
+
+LIBDAEMON_VER:=0.10
+LIBDAEMON_DIR:=$(BUILD_DIR)/libdaemon-$(LIBDAEMON_VER)
+LIBDAEMON_SITE:=http://0pointer.de/lennart/projects/libdaemon/
+LIBDAEMON_SOURCE:=libdaemon-$(LIBDAEMON_VER).tar.gz
+LIBDAEMON_CAT:=zcat
+
+$(DL_DIR)/$(LIBDAEMON_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(LIBDAEMON_SITE)/$(LIBDAEMON_SOURCE)
+
+libdaemon-source: $(DL_DIR)/$(LIBDAEMON_SOURCE)
+
+$(LIBDAEMON_DIR)/.unpacked: $(DL_DIR)/$(LIBDAEMON_SOURCE)
+	$(LIBDAEMON_CAT) $(DL_DIR)/$(LIBDAEMON_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBDAEMON_DIR) package/libdaemon/ \*.patch
+	touch $(LIBDAEMON_DIR)/.unpacked
+
+$(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
+	(cd $(AVAHI_DIR) && rm -rf config.cache && autoconf)
+	( \
+		cd $(LIBDAEMON_DIR) && \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/sbin \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--includedir=$(STAGING_DIR)/include \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		--disable-lynx \
+		--disable-shared \
+	);
+	touch $(LIBDAEMON_DIR)/.configured
+
+$(LIBDAEMON_DIR)/.compiled: $(LIBDAEMON_DIR)/.configured
+	$(MAKE) -C $(LIBDAEMON_DIR)
+	touch $(LIBDAEMON_DIR)/.compiled
+
+$(STAGING_DIR)/lib/libdaemon.a: $(LIBDAEMON_DIR)/.compiled
+	$(MAKE) \
+		-C $(LIBDAEMON_DIR) \
+		prefix=$(STAGING_DIR) \
+		exec_prefix=$(STAGING_DIR) \
+		bindir=$(STAGING_DIR)/bin \
+		datadir=$(STAGING_DIR)/share \
+		install
+	touch -c $(STAGING_DIR)/lib/libdaemon.a
+
+#$(TARGET_DIR)/usr/lib/libdaemon.a: $(STAGING_DIR)/lib/libdaemon.a
+#	-$(STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libdaemon.a
+
+libdaemon: uclibc $(STAGING_DIR)/lib/libdaemon.a
+
+libdaemon-clean:
+	-$(MAKE) -C $(LIBDAEMON_DIR) clean
+
+libdaemon-dirclean:
+	rm -rf $(LIBDAEMON_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBDAEMON)),y)
+TARGETS+=libdaemon
+endif

Added: trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch
===================================================================
--- trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch	2006-12-12 22:18:15 UTC (rev 16860)
+++ trunk/buildroot/package/libdaemon/xcompile-setpgrp.patch	2006-12-12 22:26:51 UTC (rev 16861)
@@ -0,0 +1,11 @@
+--- libdaemon-0.10/configure.ac.cls	2005-11-24 05:38:53.000000000 -0800
++++ libdaemon-0.10/configure.ac	2006-09-25 08:16:33.000000000 -0700
+@@ -85,7 +85,7 @@
+ AC_FUNC_VPRINTF
+ AC_CHECK_FUNCS([select strerror dup2 memset strrchr])
+ AC_TYPE_MODE_T
+-AC_FUNC_SETPGRP
++dnl AC_FUNC_SETPGRP
+ AC_TYPE_SIGNAL
+ AC_TYPE_SIZE_T
+ 
