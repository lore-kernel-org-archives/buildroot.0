From: Sven Neumann <s.neumann@raumfeld.com>
Date: Sun, 18 Oct 2009 19:35:12 +0200
Subject: [Buildroot] [PATCH] samba: updated the samba package to version
	3.3.8
In-Reply-To: <20091018172314.DE9757778B@busybox.osuosl.org>
References: <20091018172314.DE9757778B@busybox.osuosl.org>
Message-ID: <1255887312-27054-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: rvpaasen <rvpaasen@t3i.nl>

Update the samba package to the new makefile format and also update
it to samba version 3.3.8 (latest 3.3.x version). Based on the
patch from bug 665, but with uclibc dependency and call to
autogen.sh removed.

Tested-By: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/Config.in |   71 +++++++++--
 package/samba/samba.mk  |  344 ++++++++++++++++++++++-------------------------
 2 files changed, 225 insertions(+), 190 deletions(-)

diff --git a/package/samba/Config.in b/package/samba/Config.in
index cb4c4f6..70d1367 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_SAMBA
 
 	  http://www.samba.org/
 
-	  NOTE: A complete Samba install takes close to 40MB of space,
+	  NOTE: A complete Samba install takes over 50MB of space,
 		so choose only the components you need.
 
 menu "Samba tools selection"
@@ -40,15 +40,6 @@ config BR2_PACKAGE_SAMBA_FINDSMB
 comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
 	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_MICROPERL
 
-config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
-	bool "libsmbclient"
-	depends on BR2_PACKAGE_SAMBA
-	help
-	  libsmbclient is a library toolset that permits applications
-	  to manipulate CIFS/SMB network resources using many of the
-	  standards POSIX functions available for manipulating local
-	  files.
-
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
 	default y
@@ -95,6 +86,7 @@ config BR2_PACKAGE_SAMBA_PROFILES
 
 config BR2_PACKAGE_SAMBA_RPCCLIENT
 	bool "rpcclient"
+	select BR2_PACKAGE_READLINE
 	default y
 	depends on BR2_PACKAGE_SAMBA
 	help
@@ -110,6 +102,7 @@ config BR2_PACKAGE_SAMBA_SMBCACLS
 
 config BR2_PACKAGE_SAMBA_SMBCLIENT
 	bool "smbclient"
+	select BR2_PACKAGE_READLINE
 	default y
 	depends on BR2_PACKAGE_SAMBA
 	help
@@ -136,6 +129,13 @@ config BR2_PACKAGE_SAMBA_SMBGET
 	help
 	  wget-like utility for download files over SMB
 
+config BR2_PACKAGE_SAMBA_SMBLDBTOOLS
+	bool "smbldbtools"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  ldbadd ldbdel ldbedit ldbmodify ldbrename ldbsearch tools
+
 config BR2_PACKAGE_SAMBA_SMBPASSWD
 	bool "smbpasswd"
 	default y
@@ -143,6 +143,13 @@ config BR2_PACKAGE_SAMBA_SMBPASSWD
 	help
 	  Change a user's SMB passwd
 
+config BR2_PACKAGE_SAMBA_SMBSHARESEC
+	bool "smbsharesec"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  Manipulate share permissions on SMB file shares
+
 config BR2_PACKAGE_SAMBA_SMBSPOOL
 	bool "smbspool"
 	default y
@@ -210,3 +217,47 @@ config BR2_PACKAGE_SAMBA_WBINFO
 	  Query information from winbind daemon
 
 endmenu
+
+
+menu "Samba libraries selection"
+	depends on BR2_PACKAGE_SAMBA
+
+config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	bool "libsmbclient"
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  libsmbclient is a library toolset that permits applications
+	  to manipulate CIFS/SMB network resources using many of the
+	  standards POSIX functions available for manipulating local
+	  files.
+
+endmenu
+
+
+menu "Samba support selection"
+	depends on BR2_PACKAGE_SAMBA
+
+config BR2_PACKAGE_SAMBA_AVAHI
+	bool "support avahi"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	depends on BR2_PACKAGE_AVAHI
+	help
+	  Include support for avahi
+
+comment "support avhai - disabled (requires avahi)"
+	depends on !BR2_PACKAGE_AVAHI
+
+config BR2_PACKAGE_SAMBA_GAMIN
+	bool "support gamin"
+	default y
+	depends on BR2_PACKAGE_SAMBA
+	depends on BR2_PACKAGE_GAMIN
+	help
+	  Include support for gamin
+
+comment "support gamin - disabled (requires gamin)"
+	depends on !BR2_PACKAGE_GAMIN
+
+endmenu
+
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 48637c6..f950cd3 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,189 +3,173 @@
 # samba
 #
 #############################################################
-SAMBA_VERSION:=3.3.4
+SAMBA_VERSION:=3.3.8
 SAMBA_SOURCE:=samba-$(SAMBA_VERSION).tar.gz
 SAMBA_SITE:=http://samba.org/samba/ftp/stable/
-SAMBA_DIR:=$(BUILD_DIR)/samba-$(SAMBA_VERSION)/source
-SAMBA_CAT:=$(ZCAT)
-SAMBA_BINARY:=bin/smbd
-SAMBA_TARGET_BINARY:=usr/sbin/smbd
-
-SAMBA_DEPENDENCIES=libiconv
-
-ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
-SAMBA_LIBSMBCLIENT := libsmbclient
-SAMBA_CONF_OPTIONS := --enable-libsmbclient
-else
-SAMBA_LIBSMBCLIENT :=
-SAMBA_CONF_OPTIONS := --disable-libsmbclient
-endif
-
-ifeq ($(BR2_PACKAGE_AVAHI),y)
-SAMBA_CONF_OPTIONS := --enable-avahi
-SAMBA_DEPENDENCIES += avahi
-else
-SAMBA_CONF_OPTIONS := --disable-avahi
-endif
-
-ifeq ($(BR2_PACKAGE_GAMIN),y)
-SAMBA_CONF_OPTIONS := --enable-fam
-SAMBA_DEPENDENCIES += gamin
-else
-SAMBA_CONF_OPTIONS := --disable-fam
-endif
-
-
-$(DL_DIR)/$(SAMBA_SOURCE):
-	$(call DOWNLOAD,$(SAMBA_SITE),$(SAMBA_SOURCE))
-
-$(SAMBA_DIR)/.unpacked: $(DL_DIR)/$(SAMBA_SOURCE)
-	$(SAMBA_CAT) $(DL_DIR)/$(SAMBA_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh `dirname $(SAMBA_DIR)` package/samba/ samba\*.patch
-	$(CONFIG_UPDATE) $(SAMBA_DIR)
-	touch $@
-
-$(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
-	(cd $(SAMBA_DIR); rm -rf config.cache; \
-		./autogen.sh; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
-		samba_cv_USE_SETREUID=yes \
-		samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
-		samba_cv_HAVE_IFACE_IFCONF=yes \
-		samba_cv_HAVE_MMAP=yes \
-		samba_cv_HAVE_FCNTL_LOCK=yes \
-		samba_cv_HAVE_SECURE_MKSTEMP=yes \
-		samba_cv_HAVE_NATIVE_ICONV=no \
-		samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
-		samba_cv_fpie=no \
-		libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
-		AVAHI_LIBS=-pthread \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--localstatedir=/var \
-		--with-lockdir=/var/cache/samba \
-		--with-piddir=/var/run \
-		--with-privatedir=/etc/samba \
-		--with-logfilebase=/var/log/samba \
-		--with-configdir=/etc/samba \
-		--with-libiconv=$(STAGING_DIR) \
-		--without-ldap \
-		--without-ads \
-		--without-acl \
-		--with-included-popt \
-		--with-included-iniparser \
-		--disable-shared-libs \
-		--disable-static \
-		--disable-cups \
-		$(DISABLE_LARGEFILE) \
-		$(SAMBA_CONF_OPTIONS) \
-	)
-	touch $@
-
-$(SAMBA_DIR)/$(SAMBA_BINARY): $(SAMBA_DIR)/.configured
-	# make proto must be done before make to be parallel safe
-	$(MAKE) -C $(SAMBA_DIR) proto
-	$(MAKE) -C $(SAMBA_DIR)
-
-SAMBA_TARGETS_ :=
-SAMBA_TARGETS_y :=
-
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/mount.cifs \
-						   usr/sbin/umount.cifs
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM) += usr/bin/eventlogadm
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NET) += usr/bin/net
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBD) += usr/sbin/nmbd
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NMBLOOKUP) += usr/bin/nmblookup
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_NTLM_AUTH) += usr/bin/ntlm_auth
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_PDBEDIT) += usr/bin/pdbedit
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_PROFILES) += usr/bin/profiles
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_RPCCLIENT) += usr/bin/rpcclient
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS) += usr/bin/smbcacls
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT) += usr/bin/smbclient
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL) += usr/bin/smbcontrol
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS) += usr/bin/smbcquotas
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBGET) += usr/bin/smbget
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD) += usr/bin/smbpasswd
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL) += usr/bin/smbspool
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS) += usr/bin/smbstatus
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE) += usr/bin/smbtree
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_SWAT) += usr/sbin/swat
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbbackup \
-						   usr/bin/tdbdump \
-						   usr/bin/tdbtool
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_TESTPARM) += usr/bin/testparm
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/sbin/winbindd
-SAMBA_TARGETS_$(BR2_PACKAGE_SAMBA_WBINFO) += usr/bin/wbinfo
-
-$(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		prefix="${TARGET_DIR}/usr" \
-		BASEDIR="${TARGET_DIR}/usr" \
-		SBINDIR="${TARGET_DIR}/usr/sbin" \
-		LOCKDIR="${TARGET_DIR}/var/cache/samba" \
-		PRIVATEDIR="${TARGET_DIR}/etc/samba" \
-		CONFIGDIR="${TARGET_DIR}/etc/samba" \
-		VARDIR="${TARGET_DIR}/var/log/samba" \
-		-C $(SAMBA_DIR) installlibs installservers installbin installcifsmount installscripts
-	# Do not install the LDAP-like embedded database tools
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/ldb, add del edit modify search)
-	# Remove not used library by Samba binaries
-	rm -f $(TARGET_DIR)/usr/lib/libnetapi*
-	rm -f $(TARGET_DIR)/usr/lib/libtalloc*
-	rm -f $(TARGET_DIR)/usr/lib/libtdb*
-	# Remove not wanted Samba binaries
-	for file in $(SAMBA_TARGETS_); do \
-		rm -f $(TARGET_DIR)/$$file; \
-	done
-	# Strip the wanted Samba binaries
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
-	for file in $(SAMBA_TARGETS_y); do \
-		$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/$$file; \
-	done
-ifeq ($(BR2_PACKAGE_SAMBA_SWAT),y)
-	cp -dpfr $(SAMBA_DIR)/../swat $(TARGET_DIR)/usr/
-endif
-	$(INSTALL) -m 0755 package/samba/S91smb $(TARGET_DIR)/etc/init.d
+
+SAMBA_SUBDIR = source
+SAMBA_AUTORECONF = NO
+SAMBA_LIBTOOL_PATCH = NO
+
+SAMBA_INSTALL_STAGING = YES
+SAMBA_INSTALL_TARGET = YES
+
+
+SAMBA_DEPENDENCIES = \
+	libiconv \
+	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),readline,) \
+	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),readline,) \
+	$(if $(BR2_PACKAGE_SAMBA_AVAHI),avahi,) \
+	$(if $(BR2_PACKAGE_SAMBA_GAMIN),gamin,)
+
+
+SAMBA_CONF_ENV = \
+	samba_cv_HAVE_GETTIMEOFDAY_TZ=yes \
+	samba_cv_USE_SETREUID=yes \
+	samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes \
+	samba_cv_HAVE_IFACE_IFCONF=yes \
+	samba_cv_HAVE_MMAP=yes \
+	samba_cv_HAVE_FCNTL_LOCK=yes \
+	samba_cv_HAVE_SECURE_MKSTEMP=yes \
+	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
+	samba_cv_fpie=no \
+	libreplace_cv_HAVE_IPV6=$(if $(BR2_INET_IPV6),yes,no) \
+	$(if $(BR2_PACKAGE_SAMBA_AVAHI),AVAHI_LIBS=-pthread,)
+
+
+SAMBA_CONF_OPT = \
+	--localstatedir=/var \
+	--with-piddir=/var/run \
+	--with-lockdir=/var/lock \
+	--with-logfilebase=/var/log \
+	--with-configdir=/etc/samba \
+	--with-privatedir=/etc/samba \
+	\
+	--disable-cups \
+	--disable-static \
+	--enable-shared \
+	--enable-shared-libs \
+	--disable-pie \
+	--disable-relro \
+	--disable-dnssd \
+	\
+	$(if $(BR2_PACKAGE_SAMBA_AVAHI),--enable-avahi,--disable-avahi) \
+	$(if $(BR2_PACKAGE_SAMBA_GAMIN),--enable-fam,--disable-fam) \
+	$(if $(BR2_PACKAGE_SAMBA_SWAT),--enable-swat,--disable-swat) \
+	\
+	--without-cluster-support \
+	--without-cifsupcall \
+	--without-ads \
+	--without-ldap \
+	--with-included-popt \
+	--with-included-iniparser \
+	--with-libiconv=$(STAGING_DIR) \
+	\
+	$(if $(BR2_PACKAGE_SAMBA_CIFS),--with-cifsmount,--without-cifsmount) \
+	$(if $(BR2_PACKAGE_SAMBA_RPCCLIENT),--with-readline=$(STAGING_DIR),) \
+	$(if $(BR2_PACKAGE_SAMBA_SMBCLIENT),--with-readline=$(STAGING_DIR),) \
+	$(if $(BR2_PACKAGE_SAMBA_WINBINDD),--with-winbind,--without-winbind)
+
+
+SAMBA_INSTALL_TARGET_OPT = \
+	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
+	installlibs installservers installbin installscripts \
+	$(if $(BR2_PACKAGE_SAMBA_CIFS),installcifsmount,) \
+	$(if $(BR2_PACKAGE_SAMBA_SWAT),installswat,)
+
+
+SAMBA_UNINSTALL_TARGET_OPT = \
+	DESTDIR=$(TARGET_DIR) -C $(SAMBA_DIR)/$(SAMBA_SUBDIR) \
+	uninstalllibs uninstallservers uninstallbin uninstallscripts \
+	$(if $(BR2_PACKAGE_SAMBA_CIFS),uninstallcifsmount,) \
+	$(if $(BR2_PACKAGE_SAMBA_SWAT),uninstallswat,)
+
+
+$(eval $(call AUTOTARGETS,package,samba))
+
+
+# binaries to keep
+SAMBA_BINTARGETS_y = \
+	usr/sbin/smbd \
+	usr/lib/libtalloc.so \
+	usr/lib/libtdb.so
+
+
+# binaries to remove
+SAMBA_BINTARGETS_ = \
+	usr/lib/libnetapi.so* \
+	usr/lib/libsmbsharemodes.so*
+
+
+# binaries to keep or remove
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/mount.cifs
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_CIFS) += usr/sbin/umount.cifs
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_EVENTLOGADM) += usr/bin/eventlogadm
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NET) += usr/bin/net
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NMBD) += usr/sbin/nmbd
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NMBLOOKUP) += usr/bin/nmblookup
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_NTLM_AUTH) += usr/bin/ntlm_auth
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_PDBEDIT) += usr/bin/pdbedit
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_PROFILES) += usr/bin/profiles
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_RPCCLIENT) += usr/bin/rpcclient
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCACLS) += usr/bin/smbcacls
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCLIENT) += usr/bin/smbclient
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCONTROL) += usr/bin/smbcontrol
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBCQUOTAS) += usr/bin/smbcquotas
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBGET) += usr/bin/smbget
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbadd
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbdel
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbedit
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbmodify
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbrename
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBLDBTOOLS) += usr/bin/ldbsearch
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBPASSWD) += usr/bin/smbpasswd
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSHARESEC) += usr/bin/sharesec
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSPOOL) += usr/bin/smbspool
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBSTATUS) += usr/bin/smbstatus
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SMBTREE) += usr/bin/smbtree
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_SWAT) += usr/sbin/swat
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbbackup
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbdump
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TDB) += usr/bin/tdbtool
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_TESTPARM) += usr/bin/testparm
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/sbin/winbindd
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WBINFO) += usr/bin/wbinfo
+
+# libraries to keep or remove
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_WINBINDD) += usr/lib/libwbclient.so*
+SAMBA_BINTARGETS_$(BR2_PACKAGE_SAMBA_LIBSMBCLIENT) += usr/lib/libsmbclient.so*
+
+
+# non-binaries to remove
+SAMBA_TXTTARGETS_ = \
+	usr/include/libsmbclient.h \
+	usr/include/netapi.h \
+	usr/include/smb_share_modes.h \
+	usr/include/talloc.h \
+	usr/include/tdb.h \
+	usr/include/wbclient.h
+
+
+# non-binaries to keep or remove
+SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_FINDSMB) += usr/bin/findsmb
+SAMBA_TXTTARGETS_$(BR2_PACKAGE_SAMBA_SMBTAR) += usr/bin/smbtar
+
+
+$(SAMBA_HOOK_POST_INSTALL):
+	$(call MESSAGE,"Post installing")
+	# remove unneeded
+	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_))
+	rm -f $(addprefix $(TARGET_DIR)/, $(SAMBA_TXTTARGETS_))
+	# strip binaries
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/, $(SAMBA_BINTARGETS_y))
+	# install start/stop script
+	@if [ ! -f $(TARGET_DIR)/etc/init.d/S91smb ]; then \
+		$(INSTALL) -m 0755 -D package/samba/S91smb $(TARGET_DIR)/etc/init.d/S91smb; \
+	fi
+	# install config
 	@if [ ! -f $(TARGET_DIR)/etc/samba/smb.conf ]; then \
 		$(INSTALL) -m 0755 -D package/samba/simple.conf $(TARGET_DIR)/etc/samba/smb.conf; \
 	fi
-	rm -rf $(TARGET_DIR)/var/cache/samba
-	rm -rf $(TARGET_DIR)/var/lib/samba
-
-libsmbclient: $(SAMBA_DIR)/bin/libsmbclient.so
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
-		DESTDIR="$(STAGING_DIR)" \
-		-C $(SAMBA_DIR) installlibs
-
-samba: $(SAMBA_DEPENDENCIES) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) $(SAMBA_LIBSMBCLIENT)
-
-samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
-
-samba-unpacked: $(SAMBA_DIR)/.unpacked
+	$(Q)touch $@
 
-samba-clean:
-	rm -f $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
-	for file in $(SAMBA_TARGETS_y); do \
-		rm -f $(TARGET_DIR)/$$file; \
-	done
-	rm -f $(TARGET_DIR)/etc/init.d/S91smb
-	rm -rf $(TARGET_DIR)/etc/samba
-	-$(MAKE) -C $(SAMBA_DIR) clean
-
-samba-dirclean:
-	rm -rf $(SAMBA_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SAMBA),y)
-TARGETS+=samba
-endif
-- 
1.6.5
