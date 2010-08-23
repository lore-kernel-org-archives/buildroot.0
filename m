From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Mon, 23 Aug 2010 10:17:01 -0700
Subject: [Buildroot] [PATCH] Re:  Deprecate rp-pppoe package
In-Reply-To: <1282575167.18213.51.camel@tr-pentomino>
References: <1278436093.12234.11.camel@localhost.localdomain>
	<4C45EF4E.1000501@zacarias.com.ar>
	<D61182AC8012EA4EBC531B3AF23BE1099C8208@tranzeo-mail2.12stewart.tranzeo.com>
	<1282575167.18213.51.camel@tr-pentomino>
Message-ID: <1282583821.613.17.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Same as before except now uses the new autotools infrastructure in
buildroot (the patch to rp-pppoe.mk is different from last time).

Regards,

Darcy


On Mon, 2010-08-23 at 07:52 -0700, Darcy Watkins wrote:
> Hello,
> 
> Here are first pass patches for more current (and server side)
> rp-pppoe
> support in buildroot.  Summary of changes below...
> 
> 1.  The pppd.mk change for radrealms.so I sent to the list Aug 19th
> 2.  Update rp-pppoe package from version 3.8 to version 3.10
> 3.  Add the pppoe server binaries to the target (pppoe-server,
>     pppoe-relay and pppoe-sniff)
> 4.  Changes to tarball name, the upstream URL and no downloaded patch.
>      - The newer tarball was not on the mirror site that it was
>        pointing to by default so I pointed it to Roaring Pengiun's
>        site.  (Not sure how correct this is - perhaps it should
>        change back once the mirror site is updated).
> 5.  Buildroot rp-pppoe package patch carry forwards / updates
>      - add support to use the kernel plugin (new patch)
>      - update to use with pppd 2.4.5
>      - c/f the pack bitfields patch
>      - drop the autoreconf patch (already in rp-pppoe ver 3.10)
> 
> Note:  I am only including the changes and additions here.  If you
> apply
> this to your buildroot, you should manually remove the two
> package/rp-pppoe/rp-pppoe-3.8-* patches to get rid of them.  It didn't
> make sense for me to attach additional 100's of k bytes of patch that
> only serves to delete the two files.
> 
> I tried this on a PowerPC 405EP based target board with two Ethernet
> ports.  I setup eth0 as TCP/IP on LAN with a radius server and eth1 to
> act as an access concentrator (pppoe server) to a Windows PC.  I ran
> two
> instances of pppoe-server, one advertising a service called "local"
> set
> up to authenticate using the board's Linux login / password scheme,
> and
> the other advertising a service called "radius" to authenticate via
> the
> radius server connected via eth0.
> 
> I was able to "dial-up" connect the PC (using PPPoE) using either
> service, obtain IP address from pool range corresponding to each
> service, and ping through to the PC running the radius server.  I
> tried
> both user space pppoe deamon and the kernel plugin - both worked.
> 
--snip!--
> 
> Hopefully this can make it in time for 2010.08 release (if not then
> the
> 2010.11 release) and remove the deprecated status from the rp-pppoe
> package.
> 
> Note: This patch applies against the 2010.08-rc1 tarball but since
> nothing has changed in the rp-pppoe package lately, it will probably
> also work with the latest git as well.  (Don't forget to delete the
> old
> version 3.8 patch files yourself).

--snip!--


delete...
   package/rp-pppoe/rp-pppoe-3.8-001-configure-bitfield.patch
   package/rp-pppoe/rp-pppoe-3.8-002-autoreconf.patch

...then apply patch below...

Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>

Index: buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
===================================================================
--- /dev/null
+++ buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe-3.10-002-krn-plugin.patch
@@ -0,0 +1,34 @@
+--- rp-pppoe-3.10/src/configure.theorig  2008-02-05 13:57:15.000000000 -0800
++++ rp-pppoe-3.10/src/configure  2008-02-05 13:24:36.000000000 -0800
+@@ -6151,7 +6151,7 @@ modprobe ppp_synctty > /dev/null 2>&1
+ modprobe pppoe > /dev/null 2>&1
+ fi
+ if test "$cross_compiling" = yes; then
+-  ac_cv_linux_kernel_pppoe=no; $ECHO "cross-compiling, default: "
++  ac_cv_linux_kernel_pppoe=yes; $ECHO "cross-compiling, default: "
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
+--- rp-pppoe-3.10/src/pppoe-server.c.theorig     2006-04-02 07:29:42.000000000 -0700
++++ rp-pppoe-3.10/src/pppoe-server.c     2008-02-05 13:52:15.000000000 -0800
+@@ -20,6 +20,9 @@ static char const RCSID[] =
+ 
+ #include "config.h"
+ 
++/* Patched hack to make this cross compile */
++#define HAVE_LINUX_KERNEL_PPPOE 1
++
+ #if defined(HAVE_NETPACKET_PACKET_H) || defined(HAVE_LINUX_IF_PACKET_H)
+ #define _POSIX_SOURCE 1 /* For sigaction defines */
+ #endif
+--- rp-pppoe-3.10/src/Makefile.in.theorig	2008-02-06 06:59:11.000000000 -0800
++++ rp-pppoe-3.10/src/Makefile.in	2008-02-06 07:24:50.000000000 -0800
+@@ -48,7 +48,7 @@ PPPD_PATH=@PPPD@
+ @LIC_MAKEFILE_INCLUDE@
+ 
+ # Kernel-mode plugin gets installed here.
+-PLUGIN_DIR=/etc/ppp/plugins
++PLUGIN_DIR=/usr/lib/pppd/2.4.5
+ PLUGIN_PATH=$(PLUGIN_DIR)/rp-pppoe.so
+ 
+ # Configuration file paths
Index: buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe.mk
===================================================================
--- buildroot-2010.08_powerpc.orig/package/rp-pppoe/rp-pppoe.mk
+++ buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe.mk
@@ -3,78 +3,39 @@
 # rp-pppoe
 #
 #############################################################
-RP_PPPOE_VERSION:=3.8
-RP_PPPOE_SOURCE:=rp-pppoe_$(RP_PPPOE_VERSION).orig.tar.gz
-RP_PPPOE_PATCH:=rp-pppoe_$(RP_PPPOE_VERSION)-3.diff.gz
-RP_PPPOE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rp-pppoe
-RP_PPPOE_TOPDIR:=$(BUILD_DIR)/rp-pppoe-$(RP_PPPOE_VERSION)
-RP_PPPOE_DIR:=$(BUILD_DIR)/rp-pppoe-$(RP_PPPOE_VERSION)/src
-RP_PPPOE_CAT:=$(ZCAT)
-RP_PPPOE_BINARY:=pppoe
-RP_PPPOE_TARGET_BINARY:=usr/sbin/pppoe
-
-$(DL_DIR)/$(RP_PPPOE_SOURCE):
-	$(call DOWNLOAD,$(RP_PPPOE_SITE),$(RP_PPPOE_SOURCE))
-
-ifneq ($(RP_PPPOE_PATCH),)
-RP_PPPOE_PATCH_FILE:=$(DL_DIR)/$(RP_PPPOE_PATCH)
-$(RP_PPPOE_PATCH_FILE):
-	$(call DOWNLOAD,$(RP_PPPOE_SITE),$(RP_PPPOE_PATCH))
-endif
-
-$(RP_PPPOE_TOPDIR)/.unpacked: $(DL_DIR)/$(RP_PPPOE_SOURCE) $(RP_PPPOE_PATCH_FILE)
-	$(RP_PPPOE_CAT) $(DL_DIR)/$(RP_PPPOE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(RP_PPPOE_PATCH),)
-	(cd $(RP_PPPOE_TOPDIR) && $(RP_PPPOE_CAT) $(DL_DIR)/$(RP_PPPOE_PATCH) | patch -p1)
-	if [ -d $(RP_PPPOE_TOPDIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(RP_PPPOE_TOPDIR) $(RP_PPPOE_TOPDIR)/debian/patches \*.patch; \
-	fi
-endif
-	toolchain/patch-kernel.sh $(RP_PPPOE_TOPDIR) package/rp-pppoe/ rp-pppoe\*.patch
-	touch $@
-
-$(RP_PPPOE_TOPDIR)/.configured: $(RP_PPPOE_TOPDIR)/.unpacked
-	(cd $(RP_PPPOE_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		rpppoe_cv_pack_bitfields=normal \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-		--disable-debugging \
-	)
-	touch $@
-
-$(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY): $(RP_PPPOE_TOPDIR)/.configured
-	$(MAKE) -C $(RP_PPPOE_DIR)
-
-$(TARGET_DIR)/$(RP_PPPOE_TARGET_BINARY): $(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY)
-	cp -dpf $(RP_PPPOE_DIR)/$(RP_PPPOE_BINARY) $@
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	mkdir -p $(TARGET_DIR)/usr/share/man/man8
-	$(INSTALL) -m 644 $(RP_PPPOE_TOPDIR)/man/pppoe.8 $(TARGET_DIR)/usr/share/man/man8/pppoe.8
-endif
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-rp-pppoe: $(TARGET_DIR)/$(RP_PPPOE_TARGET_BINARY)
-
-rp-pppoe-source: $(DL_DIR)/$(RP_PPPOE_SOURCE) $(RP_PPPOE_PATCH_FILE)
-
-rp-pppoe-clean:
-	-$(MAKE) -C $(RP_PPPOE_DIR) clean
-	rm -f $(TARGET_DIR)/$(RP_PPPOE_TARGET_BINARY) \
-		$(TARGET_DIR)/usr/share/man/man8/pppoe.8*
+RP_PPPOE_VERSION = 3.10
+RP_PPPOE_SOURCE = rp-pppoe-$(RP_PPPOE_VERSION).tar.gz
+RP_PPPOE_SITE = http://www.roaringpenguin.com/files/download
+RP_PPPOE_TARGET_BINS = pppoe pppoe-server pppoe-relay pppoe-sniff
+RP_PPPOE_MANPAGES = $(if $(BR2_HAVE_DOCUMENTATION),pppoe pppoe-server pppoe-relay pppoe-sniff)
+RP_PPPOE_SUBDIR = src
+
+RP_PPPOE_CONF_ENV = \
+	rpppoe_cv_pack_bitfields=normal \
+	PPPD_H=$(PPPD_DIR)/pppd/pppd.h \
+
+RP_PPPOE_CONF_OPT = \
+	--disable-debugging \
+
+define RP_PPPOE_INSTALL_TARGET_CMDS
+	for ff in $(RP_PPPOE_TARGET_BINS) ; do \
+		cp -dpf $(RP_PPPOE_SRCDIR)/$$ff $(TARGET_DIR)/usr/sbin/$$ff ; \
+		$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/sbin/$$ff ; \
+	done
+	if [ -n "$(RP_PPPOE_MANPAGES)" ] ; then mkdir -p $(TARGET_DIR)/usr/share/man/man8 ; fi
+	for ff in $(RP_PPPOE_MANPAGES) ; do \
+		$(INSTALL) -m 644 $(RP_PPPOE_DIR)/man/$$ff.8 $(TARGET_DIR)/usr/share/man/man8/$$ff.8 ; \
+	done
+endef
+
+define NETSNMP_UNINSTALL_TARGET_CMDS
+	for ff in $(RP_PPPOE_TARGET_BINS) ; do \
+		rm -f $(TARGET_DIR)/usr/sbin/$$ff ; \
+	done
+	for ff in $(RP_PPPOE_MANPAGES) ; do \
+		rm -f $(TARGET_DIR)/usr/share/man/man8/$$ff.8 ; \
+	done
+endef
+
+$(eval $(call AUTOTARGETS,package,rp-pppoe))
 
-rp-pppoe-dirclean:
-	rm -rf $(RP_PPPOE_TOPDIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_RP_PPPOE),y)
-TARGETS+=rp-pppoe
-endif
Index: buildroot-2010.08_powerpc/package/rp-pppoe/Config.in
===================================================================
--- buildroot-2010.08_powerpc.orig/package/rp-pppoe/Config.in
+++ buildroot-2010.08_powerpc/package/rp-pppoe/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_RP_PPPOE
-	bool "pppoe"
-	depends on BR2_DEPRECATED
+	bool "rp-pppoe"
+	depends on BR2_PACKAGE_PPPD
 	help
 	  An implementation of the Point-to-point protocol over Ethernet.
+	  Has userspace client and server deamons.  You likely only need
+	  this package if you are implementing the pppoe server that will
+	  service other pppoe client devices.  Otherwise the normal client
+	  functionality already exists in the pppd package (and kernel).
 
 	  http://www.roaringpenguin.com/pppoe.html
Index: buildroot-2010.08_powerpc/package/pppd/pppd.mk
===================================================================
--- buildroot-2010.08_powerpc.orig/package/pppd/pppd.mk
+++ buildroot-2010.08_powerpc/package/pppd/pppd.mk
@@ -55,8 +55,8 @@ $(PPPD_TARGET_INSTALL_TARGET):
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
 	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radius.so \
 		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radius.so
-	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radattr.so \
-		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radattr.so
+	$(INSTALL) -D $(PPPD_DIR)/pppd/plugins/radius/radrealms.so \
+		$(TARGET_DIR)/usr/lib/pppd/$(PPPD_VERSION)/radrealms.so
 	for m in $(PPPD_MANPAGES); do \
 		$(INSTALL) -m 644 -D $(PPPD_DIR)/$$m/$$m.8 \
 			$(TARGET_DIR)/usr/share/man/man8/$$m.8; \
Index: buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe-3.10-001-configure-bitfield.patch
===================================================================
--- /dev/null
+++ buildroot-2010.08_powerpc/package/rp-pppoe/rp-pppoe-3.10-001-configure-bitfield.patch
@@ -0,0 +1,34 @@
+--- rp-pppoe-3.10.orig/src/configure.in	2006-04-02 16:29:42.000000000 +0200
++++ rp-pppoe-3.10/src/configure.in	2007-08-24 11:51:04.000000000 +0200
+@@ -231,6 +231,7 @@ esac
+ 
+ dnl Figure out packing order of structures
+ AC_MSG_CHECKING([packing order of bit fields])
++if test "x$rpppoe_cv_pack_bitfields" = "x" ; then
+ AC_TRY_RUN([
+ union foo {
+     struct bar {
+@@ -254,8 +255,8 @@ main(void)
+ 	return 2;
+     }
+ }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
+-$ECHO "no defaults for cross-compiling"; exit 0)
+-
++$ECHO "no defaults for cross-compiling")
++fi
+ if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
+ 	AC_MSG_RESULT(reversed)
+ 	AC_DEFINE(PACK_BITFIELDS_REVERSED)
+--- rp-pppoe-3.10.orig/src/configure	2010-08-20 10:46:39.000000000 -0700
++++ rp-pppoe-3.10/src/configure	2010-08-20 11:02:16.000000000 -0700
+@@ -6272,7 +6272,9 @@ esac
+ { echo "$as_me:$LINENO: checking packing order of bit fields" >&5
+ echo $ECHO_N "checking packing order of bit fields... $ECHO_C" >&6; }
+ if test "$cross_compiling" = yes; then
+-  $ECHO "no defaults for cross-compiling"; exit 0
++if test "x$rpppoe_cv_pack_bitfields" = "x" ; then
++  $ECHO "no defaults for cross-compiling"
++fi
+ else
+   cat >conftest.$ac_ext <<_ACEOF
+ /* confdefs.h.  */
