From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Wed, 16 Sep 2009 08:51:20 +0200
Subject: [Buildroot] [git commit master] iptables: use multipurpose binaries
	and bump version
Message-ID: <20090916065152.259397779D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=27cf8114bfd8625584c6a631abead2376679e926
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #587

- bump version to 1.4.4
- iptables-optional-ipv6.patch no longer needed (included in upstream)
- use ipXtables-multi binaries with symlinks to ipXtables, ipXtables-save,
  ipXtables-restore instead of 3 distinct binaries

Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    1 +
 package/iptables/iptables-optional-ipv6.patch |   88 -------------------------
 package/iptables/iptables.mk                  |   21 ++++--
 3 files changed, 16 insertions(+), 94 deletions(-)
 delete mode 100644 package/iptables/iptables-optional-ipv6.patch

diff --git a/CHANGES b/CHANGES
index cc26756..b15e2bb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,7 @@
 
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
+	#587: Use iptables multipurpose binaries and bump to 1.4.4
 
 2009.08, Released August 31th, 2009:
 
diff --git a/package/iptables/iptables-optional-ipv6.patch b/package/iptables/iptables-optional-ipv6.patch
deleted file mode 100644
index dbff003..0000000
--- a/package/iptables/iptables-optional-ipv6.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-Make ipv6 support optional. Patch by Steffen Schulz <sf@cbg.dyndns.org>
-
-Submitted upstream as http://bugzilla.netfilter.org/show_bug.cgi?id=588
----
- Makefile.am  |   16 +++++++++++++---
- configure.ac |    4 ++++
- xtables.c    |    3 +++
- 3 files changed, 20 insertions(+), 3 deletions(-)
-
-Index: iptables-1.4.2/configure.ac
-===================================================================
---- iptables-1.4.2.orig/configure.ac
-+++ iptables-1.4.2/configure.ac
-@@ -37,6 +37,9 @@
- 	[enable_devel="$enableval"], [enable_devel="yes"])
- AC_ARG_ENABLE([libipq],
- 	AS_HELP_STRING([--enable-libipq], [Build and install libipq]))
-+AC_ARG_ENABLE([ipv6],
-+    AS_HELP_STRING([--enable-ipv6], [Build and install ip6tables]),
-+    [enable_ipv6="$enableval"], [enable_ipv6="yes"])
- AC_ARG_WITH([pkgconfigdir], AS_HELP_STRING([--with-pkgconfigdir=PATH],
- 	[Path to the pkgconfig directory [[LIBDIR/pkgconfig]]]),
- 	[pkgconfigdir="$withval"], [pkgconfigdir='${libdir}/pkgconfig'])
-@@ -53,6 +56,7 @@
- AM_CONDITIONAL([ENABLE_SHARED], [test "$enable_shared" = "yes"])
- AM_CONDITIONAL([ENABLE_DEVEL], [test "$enable_devel" = "yes"])
- AM_CONDITIONAL([ENABLE_LIBIPQ], [test "$enable_libipq" = "yes"])
-+AM_CONDITIONAL([ENABLE_IPV6], [test "$enable_ipv6" == "yes"])
- 
- regular_CFLAGS="-D_LARGEFILE_SOURCE=1 -D_LARGE_FILES -D_FILE_OFFSET_BITS=64 \
- 	-D_REENTRANT -Wall -Waggregate-return -Wmissing-declarations \
-Index: iptables-1.4.2/Makefile.am
-===================================================================
---- iptables-1.4.2.orig/Makefile.am
-+++ iptables-1.4.2/Makefile.am
-@@ -3,6 +3,10 @@
- AUTOMAKE_OPTIONS = foreign subdir-objects
- 
- AM_CFLAGS        = ${regular_CFLAGS} -I${top_builddir}/include -I${top_srcdir}/include ${kinclude_CFLAGS}
-+if ENABLE_IPV6
-+AM_CFLAGS       += -DENABLE_IPV6=1
-+endif
-+
- SUBDIRS         := extensions
- if ENABLE_LIBIPQ
- SUBDIRS         += libipq
-@@ -80,11 +84,17 @@
- endif
- 
- if ENABLE_STATIC
--sbin_PROGRAMS += iptables-static ip6tables-static
-+sbin_PROGRAMS += iptables-static
-+if ENABLE_IPV6
-+sbin_PROGRAMS += ip6tables-static
-+endif
-+
- endif
- if ENABLE_SHARED
--sbin_PROGRAMS += iptables iptables-multi iptables-restore iptables-save \
--                 ip6tables ip6tables-multi ip6tables-restore ip6tables-save
-+sbin_PROGRAMS += iptables iptables-multi iptables-restore iptables-save
-+if ENABLE_IPV6
-+sbin_PROGRAMS += ip6tables ip6tables-multi ip6tables-restore ip6tables-save
-+endif
- endif
- 
- iptables.8: ${srcdir}/iptables.8.in extensions/matches4.man extensions/targets4.man
-Index: iptables-1.4.2/xtables.c
-===================================================================
---- iptables-1.4.2.orig/xtables.c
-+++ iptables-1.4.2/xtables.c
-@@ -964,6 +964,8 @@
- 	}
- }
- 
-+#ifdef ENABLE_IPV6
-+
- const char *ip6addr_to_numeric(const struct in6_addr *addrp)
- {
- 	/* 0000:0000:0000:0000:0000:000.000.000.000
-@@ -1189,6 +1191,7 @@
- 			}
- 	}
- }
-+#endif
- 
- void save_string(const char *value)
- {
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index f18dd9e..48e5d33 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,25 +3,34 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.2
+IPTABLES_VERSION = 1.4.4
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
 IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
 ifneq ($(BR2_INET_IPV6),y)
-IPTABLES_CONF_OPT += --enable-ipv6=no
+IPTABLES_CONF_OPT += --disable-ipv6
 endif
 
-IPTABLES_INSTALL_TARGET = YES
-
 IPTABLES_AUTORECONF = YES
-IPTABLES_DEPENDENCIES =
+IPTABLES_LIBTOOL_PATCH = NO
 
 $(eval $(call AUTOTARGETS,package,iptables))
 
+$(IPTABLES_HOOK_POST_INSTALL): $(IPTABLES_TARGET_INSTALL_TARGET)
+	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables
+	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-save
+	ln -sf iptables-multi $(TARGET_DIR)/usr/sbin/iptables-restore
+ifeq ($(BR2_INET_IPV6),y)
+	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables
+	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-save
+	ln -sf ip6tables-multi $(TARGET_DIR)/usr/sbin/ip6tables-restore
+endif
+	touch $@
+
 $(IPTABLES_TARGET_UNINSTALL):
 	$(call MESSAGE,"Uninstalling")
 	rm -f $(TARGET_DIR)/usr/bin/iptables-xml
 	rm -f $(TARGET_DIR)/usr/sbin/iptables* $(TARGET_DIR)/usr/sbin/ip6tables*
 	rm -rf $(TARGET_DIR)/usr/lib/xtables
-	rm -f $(IPTABLES_TARGET_INSTALL_TARGET)
+	rm -f $(IPTABLES_TARGET_INSTALL_TARGET) $(IPTABLES_HOOK_POST_INSTALL)
-- 
1.6.3.3
