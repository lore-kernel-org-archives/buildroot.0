From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 09:58:21 -0800
Subject: [Buildroot] Buildroot Patches I Use [6] - Version Upgrades to bind
 and dhcp Packages
Message-ID: <1289325501.1919.11.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch upgrades bind package to version 9.7.2-P2 and dhcp package to
version 4.2.0-P1 and includes patches needed to cross compile them.  One
of the complexities added to dhcp 4.2+ is a dependency on export libs
from bind.  Unfortunately ISC's implementation of bundling bind inside
of dhcp won't cross compile.  The patches allow the export libs to be
built as part of the bind package and the dhcp package makes use of it.

I think I got things worked out so that export libs are only built in
bind if you choose that option to bind or if selected by you choosing
dhcp.  And if you don't choose bind (say intentionally) then you only
get the export libs.

I doubt that this is appropriate for 2010.11 since it is in release
candidate stage, but here it is for anyone who wants to play with the
latest and greatest of bind and dhcp from ISC.  (If someone plays with
these more extensively then there may be a case to get it in).

Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>



Index: buildroot-2010.11_powerpc/package/dhcp/dhcp.mk
===================================================================
--- buildroot-2010.11_powerpc.orig/package/dhcp/dhcp.mk
+++ buildroot-2010.11_powerpc/package/dhcp/dhcp.mk
@@ -3,9 +3,12 @@
 # dhcp
 #
 #############################################################
-DHCP_VERSION  = 4.1.1-P1
+DHCP_VERSION  = 4.2.0-P1
 DHCP_SOURCE   = dhcp-$(DHCP_VERSION).tar.gz
 DHCP_SITE     = http://ftp.isc.org/isc/dhcp/
+DHCP_DEPENDENCIES = host-pkg-config bind
+DHCP_LIBTOOL_PATCH = NO
+DHCP_AUTORECONF = YES
 DHCP_CONF_ENV = ac_cv_file__dev_random=yes
 DHCP_CONF_OPT = \
 	--localstatedir=/var/lib/dhcp \
@@ -14,6 +17,7 @@ DHCP_CONF_OPT = \
 	--with-srv-pid-file=/var/run/dhcpd.pid \
 	--with-cli-pid-file=/var/run/dhclient.pid \
 	--with-relay-pid-file=/var/run/dhcrelay.pid \
+	--with-libbind=$(STAGING_DIR)/usr/ \
 	--disable-dhcpv6
 
 ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
Index: buildroot-2010.11_powerpc/package/bind/bind.mk
===================================================================
--- buildroot-2010.11_powerpc.orig/package/bind/bind.mk
+++ buildroot-2010.11_powerpc/package/bind/bind.mk
@@ -4,15 +4,19 @@
 #
 #############################################################
 
-BIND_VERSION = 9.5.2-P2
+BIND_VERSION = 9.7.2-P2
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_LIBTOOL_PATCH = NO
-BIND_INSTALL_STAGING = NO
+#BIND_AUTORECONF = YES
+BIND_INSTALL_STAGING = YES
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
-BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen
-BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone
+BIND_TARGET_SBINS += named-compilezone rndc rndc-confgen ddns-confgen
+BIND_TARGET_SBINS += dnssec-keygen dnssec-signzone dnssec-dsfromkey dnssec-keyfromlabel
+BIND_TARGET_SBINS += dnssec-revoke dnssec-settime arpaname genrandom isc-hmac-fixup
+BIND_TARGET_SBINS += named-journalprint nsec3hash
 BIND_TARGET_BINS = dig host nslookup nsupdate
 BIND_TARGET_LIBS = libbind9.* libdns.* libisccc.* libisccfg.* libisc.* liblwres.*
+BIND_TARGET_EXPORT_LIB_DIR = bind9
 BIND_CONF_ENV =	BUILD_CC="$(TARGET_CC)" \
 		BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPT =	\
@@ -26,20 +30,66 @@ BIND_CONF_OPT =	\
 		--disable-epoll \
 		--disable-threads
 
+ifeq ($(BR2_PACKAGE_BIND_BUILD_EXPORT_LIBS),y)
+# Bind package selected and export libs chosen too.
+BIND_CONF_OPT += --enable-exportlib
+endif
+
+# If bind package is built because of dependency by another
+# package such as dhcp then the other package is actually
+# only interested in the export libraries, so provide for
+# case where we cleanup everything but export libs. (See the
+# post install hooks below).
+
+define BIND_INSTALL_STAGING_FIXES
+	rm -f $(STAGING_DIR)/usr/bin/isc-config.sh
+endef
+
+define BIND_INSTALL_STAGING_EXPORT_LIB_ONLY
+	rm -rf $(addprefix $(STAGING_DIR)/usr/bin/, $(BIND_TARGET_BINS))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
+endef
+
 define BIND_TARGET_INSTALL_FIXES
 	rm -f $(TARGET_DIR)/usr/bin/isc-config.sh
-	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
 endef
 
-BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES
-
 define BIND_TARGET_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/bin/, $(BIND_TARGET_BINS))
 endef
 
+define BIND_INSTALL_TARGET_EXPORT_LIB_ONLY
+	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
+	mv -f -t $(TARGET_DIR)/usr/lib/ $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_EXPORT_LIB_DIR))/*
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_EXPORT_LIB_DIR))
+endef
+
+define BIND_INSTALL_TARGET_NORMAL
+	$(INSTALL) -m 0755 -D package/bind/bind.sysvinit $(TARGET_DIR)/etc/init.d/S81named
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/, $(BIND_TARGET_EXPORT_LIB_DIR))
+endef
+
+BIND_POST_INSTALL_STAGING_HOOKS += BIND_INSTALL_STAGING_FIXES
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_INSTALL_FIXES
 ifneq ($(BR2_PACKAGE_BIND_TOOLS),y)
 BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
 endif
+ifneq ($(BR2_PACKAGE_BIND),y)
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_INSTALL_TARGET_EXPORT_LIB_ONLY
+BIND_POST_INSTALL_STAGING_HOOKS += BIND_INSTALL_STAGING_EXPORT_LIB_ONLY
+else
+BIND_POST_INSTALL_TARGET_HOOKS += BIND_INSTALL_TARGET_NORMAL
+endif
+
+define BIND_UNINSTALL_STAGING_CMDS
+	rm -rf $(addprefix $(STAGING_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/bin/, $(BIND_TARGET_BINS))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/, $(BIND_TARGET_LIBS))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/lib/, $(BIND_TARGET_EXPORT_LIB_DIR))
+	rm -rf $(addprefix $(STAGING_DIR)/usr/include/, $(BIND_TARGET_EXPORT_LIB_DIR))
+endef
 
 define BIND_UNINSTALL_TARGET_CMDS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/, $(BIND_TARGET_SBINS))
Index: buildroot-2010.11_powerpc/package/bind/bind-cross.patch
===================================================================
--- buildroot-2010.11_powerpc.orig/package/bind/bind-cross.patch
+++ buildroot-2010.11_powerpc/package/bind/bind-cross.patch
@@ -12,3 +12,82 @@ diff -Nura bind-9.5.1-P1/lib/dns/Makefil
  
  rbtdb64. at O@: rbtdb.c
  
+--- bind-9.7.1/lib/export/dns/Makefile.in.theorig	2009-12-05 15:31:40.000000000 -0800
++++ bind-9.7.1/lib/export/dns/Makefile.in	2010-09-03 09:43:23.000000000 -0700
+@@ -160,7 +160,7 @@ code.h:	gen
+ 	./gen -s ${srcdir} > code.h
+ 
+ gen: ${srcdir}/gen.c
+-	${CC} ${ALL_CFLAGS} ${LDFLAGS} -o $@ ${srcdir}/gen.c ${LIBS}
++	${HOSTCC} ${HOST_CFLAGS} ${ALL_CPPFLAGS} ${HOST_LDFLAGS} -o $@ ${srcdir}/gen.c ${LIBS}
+ 
+ #We don't need rbtdb64 for this library
+ #rbtdb64. at O@: rbtdb.c
+--- bind-9.7.1/ltmain.sh.theorig	2010-09-09 07:45:05.000000000 -0700
++++ bind-9.7.1/ltmain.sh	2010-09-09 07:51:56.000000000 -0700
+@@ -326,10 +326,8 @@ func_infer_tag ()
+ 	# line option must be used.
+ 	if test -z "$tagname"; then
+ 	  $echo "$modename: unable to infer tagged configuration"
+-	  $echo "$modename: specify a tag with \`--tag'" 1>&2
+-	  exit $EXIT_FAILURE
+-#        else
+-#          $echo "$modename: using $tagname tagged configuration"
++	  $echo "$modename: defaulting to \`CC'"
++	  $echo "$modename: if this is not correct, specify a tag with \`--tag'"
+ 	fi
+ 	;;
+       esac
+@@ -2515,8 +2513,12 @@ EOF
+ 	    absdir="$abs_ladir"
+ 	    libdir="$abs_ladir"
+ 	  else
+-	    dir="$libdir"
+-	    absdir="$libdir"
++            # Adding 'libdir' from the .la file to our library search paths
++            # breaks crosscompilation horribly.  We cheat here and don't add
++            # it, instead adding the path where we found the .la.  -CL
++	    dir="$abs_ladir"
++	    absdir="$abs_ladir"
++	    libdir="$abs_ladir"
+ 	  fi
+ 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
+ 	else
+@@ -2655,7 +2657,7 @@ EOF
+ 	   { test "$use_static_libs" = no || test -z "$old_library"; }; then
+ 	  if test "$installed" = no; then
+ 	    notinst_deplibs="$notinst_deplibs $lib"
+-	    need_relink=yes
++	    need_relink=no
+ 	  fi
+ 	  # This is a shared library
+ 
+@@ -5743,6 +5745,10 @@ fi\
+ 	    # Replace all uninstalled libtool libraries with the installed ones
+ 	    newdependency_libs=
+ 	    for deplib in $dependency_libs; do
++              # Replacing uninstalled with installed can easily break crosscompilation,
++              # since the installed path is generally the wrong architecture.  -CL
++              newdependency_libs="$newdependency_libs $deplib"
++              continue
+ 	      case $deplib in
+ 	      *.la)
+ 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
+@@ -6064,10 +6070,13 @@ relink_command=\"$relink_command\""
+ 	  # At present, this check doesn't affect windows .dll's that
+ 	  # are installed into $libdir/../bin (currently, that works fine)
+ 	  # but it's something to keep an eye on.
+-	  if test "$inst_prefix_dir" = "$destdir"; then
+-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+-	    exit $EXIT_FAILURE
+-	  fi
++	  #
++	  # This breaks install into our staging area.  -PB
++	  # 
++	  # if test "$inst_prefix_dir" = "$destdir"; then
++	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
++	  #   exit $EXIT_FAILURE
++	  # fi
+ 
+ 	  if test -n "$inst_prefix_dir"; then
+ 	    # Stick the inst_prefix_dir data into the link command.
Index: buildroot-2010.11_powerpc/package/dhcp/dhcp-cross.patch
===================================================================
--- /dev/null
+++ buildroot-2010.11_powerpc/package/dhcp/dhcp-cross.patch
@@ -0,0 +1,233 @@
+--- dhcp-4.2.0/Makefile.in.theorig	2010-07-09 20:26:20.000000000 -0700
++++ dhcp-4.2.0/Makefile.in	2010-09-03 12:02:59.000000000 -0700
+@@ -166,6 +166,8 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
++libbind_libdir = @libbind_libdir@
++libbind_subdirs = @libbind_subdirs@
+ 
+ #
+ # We have a lot of files that we want shipped with the distribution.
+@@ -185,7 +187,7 @@ EXTRA_DIST = RELNOTES LICENSE \
+ 	     util/bindvar.sh \
+ 	     bind/Makefile bind/bind.tar.gz bind/version.tmp 
+ 
+-SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
++SUBDIRS = $(libbind_subdirs) includes tests common dst omapip client dhcpctl relay server
+ nobase_include_HEADERS = dhcpctl/dhcpctl.h
+ all: all-recursive
+ 
+--- dhcp-4.2.0/Makefile.am.theorig	2010-03-24 16:30:38.000000000 -0700
++++ dhcp-4.2.0/Makefile.am	2010-09-03 12:02:52.000000000 -0700
+@@ -21,7 +21,7 @@ EXTRA_DIST = RELNOTES LICENSE \
+ 	     util/bindvar.sh \
+ 	     bind/Makefile bind/bind.tar.gz bind/version.tmp 
+ 
+-SUBDIRS = bind includes tests common dst omapip client dhcpctl relay server
++SUBDIRS = $(libbind_subdirs) includes tests common dst omapip client dhcpctl relay server
+ 
+ nobase_include_HEADERS = dhcpctl/dhcpctl.h
+ 
+--- dhcp-4.2.0/omapip/Makefile.in.theorig	2010-07-09 20:26:19.000000000 -0700
++++ dhcp-4.2.0/omapip/Makefile.in	2010-09-03 12:15:46.000000000 -0700
+@@ -66,8 +66,7 @@ libomapi_a_OBJECTS = $(am_libomapi_a_OBJ
+ PROGRAMS = $(noinst_PROGRAMS)
+ am_svtest_OBJECTS = test.$(OBJEXT)
+ svtest_OBJECTS = $(am_svtest_OBJECTS)
+-svtest_DEPENDENCIES = libomapi.a ../bind/lib/libdns.a \
+-	../bind/lib/libisc.a
++svtest_DEPENDENCIES = libomapi.a $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/includes
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -171,6 +170,7 @@ target_alias = @target_alias@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
++libbind_libdir = @libbind_libdir@
+ lib_LIBRARIES = libomapi.a
+ libomapi_a_SOURCES = protocol.c buffer.c alloc.c result.c connection.c \
+ 		     errwarn.c listener.c dispatch.c generic.c support.c \
+@@ -181,7 +181,7 @@ libomapi_a_SOURCES = protocol.c buffer.c
+ man_MANS = omapi.3
+ EXTRA_DIST = $(man_MANS)
+ svtest_SOURCES = test.c
+-svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
++svtest_LDADD = libomapi.a $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ all: all-am
+ 
+ .SUFFIXES:
+--- dhcp-4.2.0/omapip/Makefile.am.theorig	2010-02-11 16:13:54.000000000 -0800
++++ dhcp-4.2.0/omapip/Makefile.am	2010-09-03 12:15:24.000000000 -0700
+@@ -10,5 +10,5 @@ man_MANS = omapi.3
+ EXTRA_DIST = $(man_MANS)
+ 
+ svtest_SOURCES = test.c
+-svtest_LDADD = libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
++svtest_LDADD = libomapi.a $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+--- dhcp-4.2.0/configure.ac.theorig	2010-09-03 13:10:10.000000000 -0700
++++ dhcp-4.2.0/configure.ac	2010-09-03 13:12:52.000000000 -0700
+@@ -534,7 +534,14 @@ fi
+ CFLAGS="$CFLAGS $STD_CWARNINGS"
+ 
+ # Try to add the bind include directory
+-CFLAGS="$CFLAGS -I$libbind/include"
++if test x$use_libbind = x$libbind ; then
++	CFLAGS="$CFLAGS -I$libbind/include/bind9 -I$libbind/include"
++	AC_SUBST(libbind_libdir, ["$libbind/lib/bind9"])
++else
++	CFLAGS="$CFLAGS -I$libbind/include"
++	AC_SUBST(libbind_libdir, ["$libbind/lib"])
++	AC_SUBST(libbind_subdirs, ["bind"])
++fi
+ 
+ AC_C_FLEXIBLE_ARRAY_MEMBER
+ 
+--- dhcp-4.2.0/dhcpctl/Makefile.am.theorig	2009-10-27 21:12:30.000000000 -0700
++++ dhcp-4.2.0/dhcpctl/Makefile.am	2010-09-03 13:42:35.000000000 -0700
+@@ -6,10 +6,10 @@ EXTRA_DIST = $(man_MANS)
+ 
+ omshell_SOURCES = omshell.c
+ omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	        ../bind/lib/libdns.a ../bind/lib/libisc.a
++	        $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+ libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
+ 
+ cltest_SOURCES = cltest.c
+ cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	       ../bind/lib/libdns.a ../bind/lib/libisc.a
+\ No newline at end of file
++	       $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+--- dhcp-4.2.0/client/Makefile.am.theorig	2009-10-27 21:12:29.000000000 -0700
++++ dhcp-4.2.0/client/Makefile.am	2010-09-03 13:42:10.000000000 -0700
+@@ -5,7 +5,7 @@ dhclient_SOURCES = clparse.c dhclient.c 
+ 		   scripts/netbsd scripts/nextstep scripts/openbsd \
+ 		   scripts/solaris scripts/openwrt
+ dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
+ EXTRA_DIST = $(man_MANS)
+ 
+--- dhcp-4.2.0/server/Makefile.in.theorig	2010-09-03 13:32:13.000000000 -0700
++++ dhcp-4.2.0/server/Makefile.in	2010-09-03 13:43:25.000000000 -0700
+@@ -57,8 +57,8 @@ am_dhcpd_OBJECTS = dhcpd-dhcpd.$(OBJEXT)
+ 	dhcpd-ldap_casa.$(OBJEXT)
+ dhcpd_OBJECTS = $(am_dhcpd_OBJECTS)
+ dhcpd_DEPENDENCIES = ../common/libdhcp.a ../omapip/libomapi.a \
+-	../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
+-	../bind/lib/libisc.a
++	../dhcpctl/libdhcpctl.a $(libbind_libdir)/libdns.so \
++	$(libbind_libdir)/libisc.so
+ dhcpd_LINK = $(CCLD) $(dhcpd_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) \
+ 	$(LDFLAGS) -o $@
+ DEFAULT_INCLUDES = -I. -I$(top_builddir)/includes at am__isrc@
+@@ -185,8 +185,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c c
+ 
+ dhcpd_CFLAGS = $(LDAP_CFLAGS)
+ dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
+-	      ../bind/lib/libisc.a
++	      ../dhcpctl/libdhcpctl.a $(libbind_libdir)/libdns.so \
++	      $(libbind_libdir)/libisc.so
+ 
+ man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
+ EXTRA_DIST = $(man_MANS)
+--- dhcp-4.2.0/server/Makefile.am.theorig	2010-03-24 14:49:47.000000000 -0700
++++ dhcp-4.2.0/server/Makefile.am	2010-09-03 13:43:09.000000000 -0700
+@@ -8,8 +8,8 @@ dhcpd_SOURCES = dhcpd.c dhcp.c bootp.c c
+ 
+ dhcpd_CFLAGS = $(LDAP_CFLAGS)
+ dhcpd_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-	      ../dhcpctl/libdhcpctl.a ../bind/lib/libdns.a \
+-	      ../bind/lib/libisc.a
++	      ../dhcpctl/libdhcpctl.a $(libbind_libdir)/libdns.so \
++	      $(libbind_libdir)/libisc.so
+ 
+ man_MANS = dhcpd.8 dhcpd.conf.5 dhcpd.leases.5
+ EXTRA_DIST = $(man_MANS)
+--- dhcp-4.2.0/relay/Makefile.am.theorig	2009-10-27 21:12:30.000000000 -0700
++++ dhcp-4.2.0/relay/Makefile.am	2010-09-03 13:43:00.000000000 -0700
+@@ -3,7 +3,7 @@ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localst
+ sbin_PROGRAMS = dhcrelay
+ dhcrelay_SOURCES = dhcrelay.c
+ dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ man_MANS = dhcrelay.8
+ EXTRA_DIST = $(man_MANS)
+ 
+--- dhcp-4.2.0/dhcpctl/Makefile.in.orig	2010-07-09 20:26:18.000000000 -0700
++++ dhcp-4.2.0/dhcpctl/Makefile.in	2010-09-03 13:57:58.000000000 -0700
+@@ -64,11 +64,11 @@ PROGRAMS = $(bin_PROGRAMS) $(noinst_PROG
+ am_cltest_OBJECTS = cltest.$(OBJEXT)
+ cltest_OBJECTS = $(am_cltest_OBJECTS)
+ cltest_DEPENDENCIES = libdhcpctl.a ../common/libdhcp.a \
+-	../omapip/libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
++	../omapip/libomapi.a $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ am_omshell_OBJECTS = omshell.$(OBJEXT)
+ omshell_OBJECTS = $(am_omshell_OBJECTS)
+ omshell_DEPENDENCIES = libdhcpctl.a ../common/libdhcp.a \
+-	../omapip/libomapi.a ../bind/lib/libdns.a ../bind/lib/libisc.a
++	../omapip/libomapi.a $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/includes
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -180,12 +180,12 @@ man_MANS = omshell.1 dhcpctl.3
+ EXTRA_DIST = $(man_MANS)
+ omshell_SOURCES = omshell.c
+ omshell_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	        ../bind/lib/libdns.a ../bind/lib/libisc.a
++	        $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+ libdhcpctl_a_SOURCES = dhcpctl.c callback.c remote.c
+ cltest_SOURCES = cltest.c
+ cltest_LDADD = libdhcpctl.a ../common/libdhcp.a ../omapip/libomapi.a \
+-	       ../bind/lib/libdns.a ../bind/lib/libisc.a
++	       $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+ all: all-am
+ 
+--- dhcp-4.2.0/client/Makefile.in.orig	2010-07-09 20:26:17.000000000 -0700
++++ dhcp-4.2.0/client/Makefile.in	2010-09-03 13:58:00.000000000 -0700
+@@ -50,7 +50,7 @@ am_dhclient_OBJECTS = clparse.$(OBJEXT) 
+ 	dhc6.$(OBJEXT)
+ dhclient_OBJECTS = $(am_dhclient_OBJECTS)
+ dhclient_DEPENDENCIES = ../common/libdhcp.a ../omapip/libomapi.a \
+-	../bind/lib/libdns.a ../bind/lib/libisc.a
++	$(libbind_libdir)/libdns.so $(libbind_libdir)/libiscl.a
+ DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/includes
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -171,7 +171,7 @@ dhclient_SOURCES = clparse.c dhclient.c 
+ 		   scripts/solaris scripts/openwrt
+ 
+ dhclient_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+ man_MANS = dhclient.8 dhclient-script.8 dhclient.conf.5 dhclient.leases.5
+ EXTRA_DIST = $(man_MANS)
+--- dhcp-4.2.0/relay/Makefile.in.orig	2010-07-09 20:26:19.000000000 -0700
++++ dhcp-4.2.0/relay/Makefile.in	2010-09-03 13:58:02.000000000 -0700
+@@ -46,7 +46,7 @@ PROGRAMS = $(sbin_PROGRAMS)
+ am_dhcrelay_OBJECTS = dhcrelay.$(OBJEXT)
+ dhcrelay_OBJECTS = $(am_dhcrelay_OBJECTS)
+ dhcrelay_DEPENDENCIES = ../common/libdhcp.a ../omapip/libomapi.a \
+-	../bind/lib/libdns.a ../bind/lib/libisc.a
++	$(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ DEFAULT_INCLUDES = -I. at am__isrc@ -I$(top_builddir)/includes
+ depcomp = $(SHELL) $(top_srcdir)/depcomp
+ am__depfiles_maybe = depfiles
+@@ -154,7 +154,7 @@ top_srcdir = @top_srcdir@
+ AM_CPPFLAGS = -DLOCALSTATEDIR='"@localstatedir@"'
+ dhcrelay_SOURCES = dhcrelay.c
+ dhcrelay_LDADD = ../common/libdhcp.a ../omapip/libomapi.a \
+-		 ../bind/lib/libdns.a ../bind/lib/libisc.a
++		 $(libbind_libdir)/libdns.so $(libbind_libdir)/libisc.so
+ 
+ man_MANS = dhcrelay.8
+ EXTRA_DIST = $(man_MANS)
Index: buildroot-2010.11_powerpc/package/bind/Config.in
===================================================================
--- buildroot-2010.11_powerpc.orig/package/bind/Config.in
+++ buildroot-2010.11_powerpc/package/bind/Config.in
@@ -27,5 +27,15 @@ config BR2_PACKAGE_BIND_TOOLS
 	help
 	  Install tools (host, nslookup, dig, nsupdate)
 
+config BR2_PACKAGE_BIND_EXPORT_LIBS
+	bool "Export libraries"
+	depends on BR2_PACKAGE_BIND
+	help
+	  Export libraries (used by dhcp and perhaps others)
+
+config BR2_PACKAGE_BIND_BUILD_EXPORT_LIBS
+	bool
+	default y			if BR2_PACKAGE_BIND_EXPORT_LIBS
+
 comment "bind requires a toolchain with LARGEFILE support"
 	depends on !BR2_LARGEFILE
Index: buildroot-2010.11_powerpc/package/dhcp/Config.in
===================================================================
--- buildroot-2010.11_powerpc.orig/package/dhcp/Config.in
+++ buildroot-2010.11_powerpc/package/dhcp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DHCP
 	bool "DHCP support"
+	select BR2_PACKAGE_BIND_BUILD_EXPORT_LIBS
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
