From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:01 +0200
Subject: [Buildroot] [PATCH 05/25] Do not let packages remove man pages,
	info pages and documentation
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ef785f61ad7290508b2640d00403b9a957fcdab1.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The cleanup of $(TARGET_DIR)/usr/share/man, $(TARGET_DIR)/usr/man,
$(TARGET_DIR)/usr/share/info, $(TARGET_DIR)/usr/info,
$(TARGET_DIR)/usr/share/doc and $(TARGET_DIR)/usr/doc is already done
globally in the main Makefile. Therefore, there's no need to handle
that on a per-package basis.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bash/bash.mk               |    7 -------
 package/berkeleydb/berkeleydb.mk   |    7 -------
 package/bison/bison.mk             |    7 -------
 package/coreutils/coreutils.mk     |    7 -------
 package/dhcp/dhcp.mk               |   25 -------------------------
 package/dialog/dialog.mk           |    3 ---
 package/diffutils/diffutils.mk     |    6 ------
 package/file/file.mk               |    7 -------
 package/findutils/findutils.mk     |    7 -------
 package/gawk/gawk.mk               |    7 -------
 package/gettext/gettext.mk         |    9 +--------
 package/gzip/gzip.mk               |    6 ------
 package/ipsec-tools/ipsec-tools.mk |    7 -------
 package/liblockfile/liblockfile.mk |    3 ---
 package/netsnmp/netsnmp.mk         |    7 -------
 package/quagga/quagga.mk           |    6 ------
 package/sed/sed.mk                 |   12 ------------
 package/udpcast/udpcast.mk         |    4 ----
 toolchain/binutils/binutils.mk     |    8 +-------
 19 files changed, 2 insertions(+), 143 deletions(-)

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index b7fc716..5abae55 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -81,14 +81,7 @@ $(TARGET_DIR)/$(BASH_TARGET_BINARY): $(BASH_DIR)/$(BASH_BINARY)
 	rm -f $(TARGET_DIR)/bin/bash*
 	mv $(TARGET_DIR)/usr/bin/bash* $(TARGET_DIR)/bin/
 	(cd $(TARGET_DIR)/bin; /bin/ln -fs bash sh)
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 
 # If both bash and busybox are selected, make certain bash wins
 # the fight over who gets to own the /bin/sh symlink.
diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 716d645..f15df6a 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -60,14 +60,7 @@ $(STAGING_DIR)/lib/$(DB_SHARLIB): $(DB_DIR)/build_unix/.libs/$(DB_SHARLIB)
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DB_DIR)/build_unix install
 	chmod a-x $(STAGING_DIR)/lib/libdb*so*
 	rm -f $(STAGING_DIR)/bin/db_*
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/man
-endif
 	rm -rf $(STAGING_DIR)/share/locale
-	rm -rf $(STAGING_DIR)/usr/share/doc
 
 $(TARGET_DIR)/lib/$(DB_SHARLIB): $(STAGING_DIR)/lib/$(DB_SHARLIB)
 	rm -rf $(TARGET_DIR)/lib/libdb*
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 32ed7c7..f29259f 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -52,14 +52,7 @@ $(BISON_DIR)/$(BISON_BINARY): $(BISON_DIR)/.configured
 
 $(TARGET_DIR)/$(BISON_TARGET_BINARY): $(BISON_DIR)/$(BISON_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) install
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 	cp -a package/bison/yacc $(TARGET_DIR)/usr/bin/yacc
 
 bison: $(TARGET_DIR)/$(BISON_TARGET_BINARY)
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 85a5491..2081994 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -118,14 +118,7 @@ $(TARGET_DIR)/$(COREUTILS_TARGET_BINARY): $(COREUTILS_DIR)/$(COREUTILS_BINARY)
 	# gnu thinks chroot is in bin, debian thinks it's in sbin
 	mv $(TARGET_DIR)/usr/bin/chroot $(TARGET_DIR)/usr/sbin/chroot
 	$(STRIPCMD) $(TARGET_DIR)/usr/sbin/chroot > /dev/null 2>&1
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 4ae5bc7..57e0a5d 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -57,14 +57,7 @@ $(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 	mkdir -p $(TARGET_DIR)/etc/dhcp
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 
 $(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 	mkdir -p $(TARGET_DIR)/var/lib
@@ -74,15 +67,6 @@ $(TARGET_DIR)/$(DHCP_RELAY_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -m 0755 -D package/dhcp/S80dhcp-relay \
 		$(TARGET_DIR)/etc/init.d
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-	# Why on earth do we wipe out whole directories here?
-	#rm -rf $(TARGET_DIR)/usr/share/locale
-	#rm -rf $(TARGET_DIR)/usr/share/doc
 
 $(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 	mkdir -p $(TARGET_DIR)/var/lib
@@ -94,15 +78,6 @@ $(TARGET_DIR)/$(DHCP_CLIENT_TARGET_BINARY): $(DHCP_DIR)/$(DHCP_RELAY_BINARY)
 		$(TARGET_DIR)/etc/dhcp/dhclient.conf
 	$(INSTALL) -m 0755 -D package/dhcp/dhclient-script \
 		$(TARGET_DIR)/sbin/dhclient-script
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-	# Why on earth do we wipe out whole directories here?
-	#rm -rf $(TARGET_DIR)/usr/share/locale
-	#rm -rf $(TARGET_DIR)/usr/share/doc
 
 dhcp_server: $(TARGET_DIR)/$(DHCP_SERVER_TARGET_BINARY)
 
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 1f56660..9c6f2a9 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -39,9 +39,6 @@ $(TARGET_DIR)/$(DIALOG_TARGET_BINARY): $(DIALOG_DIR)/$(DIALOG_BINARY)
 	$(MAKE) prefix=$(TARGET_DIR)/usr \
 		mandir=$(TARGET_DIR)/usr/share/man \
 		-C $(DIALOG_DIR) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -Rf $(TARGET_DIR)/usr/share/man
-endif
 
 dialog: ncurses $(TARGET_DIR)/$(DIALOG_TARGET_BINARY)
 
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index fe1bab8..fd5e5a3 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -90,12 +90,6 @@ $(DIFFUTILS_DIR)/$(DIFFUTILS_BINARY): $(DIFFUTILS_DIR)/.configured
 $(TARGET_DIR)/$(DIFFUTILS_TARGET_BINARY): $(DIFFUTILS_DIR)/$(DIFFUTILS_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(DIFFUTILS_DIR) \
 		$(if $(BR2_STRIP_none),install,install-strip)
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 ifneq ($(BR2_ENABLE_LOCALE),y)
 	rm -rf $(TARGET_DIR)/usr/share/locale
 endif
diff --git a/package/file/file.mk b/package/file/file.mk
index 579b943..6a76117 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -91,14 +91,7 @@ $(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOLCHAIN_DIR)/bin/file
 $(TARGET_DIR)/$(FILE_TARGET_BINARY): $(FILE_DIR2)/$(FILE_BINARY)
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
 	-($(STRIPCMD) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 	mv $(TARGET_DIR)/lib/libmagic.a $(STAGING_DIR)/lib
 	rm -f $(TARGET_DIR)/lib/libmagic.la
 	mv $(TARGET_DIR)/usr/include/magic.h $(STAGING_DIR)/usr/include
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index ee30425..96e2682 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -62,14 +62,7 @@ findutils-target_binary: $(FINDUTILS_DIR)/$(FINDUTILS_BINARY)
 		$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(FINDUTILS_DIR) install-strip; \
 		$(STRIPCMD) $(TARGET_DIR)/usr/lib/locate/* > /dev/null 2>&1; \
 	fi
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 
 findutils: findutils-target_binary
 
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 71e943c..8886e6b 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -56,14 +56,7 @@ $(TARGET_DIR)/$(GAWK_TARGET_BINARY): $(GAWK_DIR)/$(GAWK_BINARY)
 	rm -f $(TARGET_DIR)/usr/bin/gawk-*
 	(cd $(TARGET_DIR)/usr/bin; ln -snf gawk awk)
 	$(STRIPCMD) $(TARGET_DIR)/usr/lib/awk/* > /dev/null 2>&1
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 	rm -rf $(TARGET_DIR)/share/locale
-	rm -rf $(TARGET_DIR)/usr/share/doc
 
 gawk: $(TARGET_DIR)/$(GAWK_TARGET_BINARY)
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 81ab9de..5b04560 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -135,14 +135,7 @@ gettext-dirclean:
 gettext-target: $(GETTEXT_DIR)/$(GETTEXT_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(GETTEXT_DIR) install
 	chmod +x $(TARGET_DIR)/usr/lib/libintl.so* # identify as needing to be stripped
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-	rm -rf $(addprefix $(TARGET_DIR),/usr/share/doc \
-		/usr/doc /usr/share/aclocal /usr/include/libintl.h)
+	rm -rf $(addprefix $(TARGET_DIR),/usr/share/aclocal /usr/include/libintl.h)
 	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/include
 
 $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index fc3c840..3feb49a 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -41,12 +41,6 @@ $(GZIP_BINARY): $(GZIP_DIR)/.configured
 
 $(GZIP_TARGET_BINARY): $(GZIP_BINARY)
 	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(GZIP_DIR) install-strip
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 
 gzip: $(GZIP_TARGET_BINARY)
 
diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 38cd57b..911da7c 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -121,13 +121,6 @@ $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL): \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_SETKEY) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOON) \
 	  $(TARGET_DIR)/$(IPSEC_TOOLS_TARGET_BINARY_RACOONCTL)
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -f $(addprefix $(TARGET_DIR)/usr/man/, \
-		man3/ipsec_strerror.3 man3/ipsec_set_policy.3 \
-		man5/racoon.conf.5 \
-		man8/racoonctl.8 man8/racoon.8 \
-		man8/plainrsa-gen.8 man8/setkey.8)
-endif
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_LIBS), y)
 	install -D $(addprefix $(IPSEC_TOOLS_DIR)/src/, \
 		libipsec/.libs/libipsec.a libipsec/.libs/libipsec.la \
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 6840b99..b30d356 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -56,9 +56,6 @@ liblockfile-clean:
 	rm -f $(TARGET_DIR)/usr/lib/liblockfile.so*
 	rm -f $(STAGING_DIR)/usr/lib/liblockfile*
 	rm -f $(addprefix $(STAGING_DIR)/usr/include/,lockfile.h mailfile.h)
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(STAGING_DIR)/usr/share/man
-endif
 	-$(MAKE) -C $(LIBLOCKFILE_DIR) clean
 
 liblockfile-dirclean:
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index c589e25..fb0151c 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -111,13 +111,6 @@ $(TARGET_DIR)/usr/sbin/snmpd: $(NETSNMP_DIR)/agent/snmpd
 	    includedir=$(STAGING_DIR)/usr/include/net-snmp \
 	    ucdincludedir=$(STAGING_DIR)/usr/include/ucd-snmp \
 	    -C $(NETSNMP_DIR) install
-	rm -rf $(TARGET_DIR)/usr/share/doc
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
 	# Copy the .conf files.
 	$(INSTALL) -D -m 0644 $(NETSNMP_DIR)/EXAMPLE.conf $(TARGET_DIR)/etc/snmp/snmpd.conf
 	-mv $(TARGET_DIR)/usr/share/snmp/mib2c*.conf $(TARGET_DIR)/etc/snmp
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index d2f0616..30ebd35 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -159,12 +159,6 @@ $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY): $(QUAGGA_BINARY)
 ifneq ($(BR2_PACKAGE_QUAGGA_HEADERS),y)
 	rm -rf $(TARGET_DIR)/usr/include/quagga
 endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
 
 quagga: $(QUAGGA_DEPENDENCIES) $(TARGET_DIR)/usr/sbin/$(QUAGGA_TARGET_BINARY)
 
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 3445deb..6508725 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -65,12 +65,6 @@ build-sed-host-binary: $(SED_DIR1)/$(SED_BINARY)
 		rm -rf $(HOST_SED_DIR)/share/locale; \
 		rm -rf $(HOST_SED_DIR)/usr/share/doc; \
 	fi
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(HOST_SED_DIR)/usr/man/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(HOST_SED_DIR)/usr/share/man
-endif
 
 $(HOST_SED_DIR)/$(SED_TARGET_BINARY):
 	if [ ! -e "$(HOST_SED_DIR)/$(SED_TARGET_BINARY)" ]; then \
@@ -152,12 +146,6 @@ sed-target_binary: $(SED_DIR2)/$(SED_BINARY)
 		rm -rf $(TARGET_DIR)/share/locale; \
 		rm -rf $(TARGET_DIR)/usr/share/doc; \
 	fi
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/info
-endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/share/man
-endif
 
 sed: sed-target_binary
 
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index ba22ba4..3e0823a 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -73,10 +73,6 @@ ifneq ($(BR2_PACKAGE_UDPCAST_RECEIVER),y)
 	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver
 	rm -f $(TARGET_DIR)/usr/sbin/udp-receiver.1
 endif
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -f $(addprefix $(TARGET_DIR)/usr/man/, \
-		$(addsuffix .1,$(UDPCAST_BINARIES)))
-endif
 
 udpcast: $(UDPCAST_PROGS)
 
diff --git a/toolchain/binutils/binutils.mk b/toolchain/binutils/binutils.mk
index 3f48c18..c24acc4 100644
--- a/toolchain/binutils/binutils.mk
+++ b/toolchain/binutils/binutils.mk
@@ -151,13 +151,7 @@ $(TARGET_DIR)/usr/bin/ld: $(BINUTILS_DIR2)/binutils/objdump
 	$(MAKE) DESTDIR=$(TARGET_DIR) \
 		tooldir=/usr build_tooldir=/usr \
 		-C $(BINUTILS_DIR2) install
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/man
-endif
-ifneq ($(BR2_HAVE_INFOPAGES),y)
-	rm -rf $(TARGET_DIR)/usr/info
-endif
-	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/share/doc
+	rm -rf $(TARGET_DIR)/share/locale
 	-$(STRIPCMD) $(TARGET_DIR)/usr/$(REAL_GNU_TARGET_NAME)/bin/* > /dev/null 2>&1
 	-$(STRIPCMD) $(TARGET_DIR)/usr/bin/* > /dev/null 2>&1
 
-- 
1.6.3.3
