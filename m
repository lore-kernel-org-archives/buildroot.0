From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Sep 2009 23:28:23 +0200
Subject: [Buildroot] [git commit master] samba: add option to install
	libsmbclient
Message-ID: <20090921212858.435F27774A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1d9178db29be6eeeccf437949013d50d5241e4f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #301

The libsmbclient library is part of the samba package. It can be used
to build applications that access Samba shares without the need to
mount them. Currently the library is explicitly not installed by
buildroot. Here's a patch that adds a config option to install it.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    1 +
 package/samba/Config.in |    9 +++++++++
 package/samba/samba.mk  |   17 +++++++++++++++--
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index ce09610..e0b5720 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,6 +6,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#301: allow to install libsmbclient
 	#477: Add sdl_sound package
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
diff --git a/package/samba/Config.in b/package/samba/Config.in
index 40161b6..cb4c4f6 100644
--- a/package/samba/Config.in
+++ b/package/samba/Config.in
@@ -40,6 +40,15 @@ config BR2_PACKAGE_SAMBA_FINDSMB
 comment "findsmb       - disabled (requires nmblookup, smbclient and perl)"
 	depends on !BR2_PACKAGE_SAMBA_SMBCLIENT || !BR2_PACKAGE_SAMBA_NMBLOOKUP || !BR2_PACKAGE_MICROPERL
 
+config BR2_PACKAGE_SAMBA_LIBSMBCLIENT
+	bool "libsmbclient"
+	depends on BR2_PACKAGE_SAMBA
+	help
+	  libsmbclient is a library toolset that permits applications
+	  to manipulate CIFS/SMB network resources using many of the
+	  standards POSIX functions available for manipulating local
+	  files.
+
 config BR2_PACKAGE_SAMBA_NET
 	bool "net"
 	default y
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 82bf152..c4ecebf 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -11,6 +11,14 @@ SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
 SAMBA_TARGET_BINARY:=usr/sbin/smbd
 
+ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
+SAMBA_LIBSMBCLIENT := libsmbclient
+SAMBA_CONF_OPTIONS := --enable-libsmbclient
+else
+SAMBA_LIBSMBCLIENT :=
+SAMBA_CONF_OPTIONS := --disable-libsmbclient
+endif
+
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(call DOWNLOAD,$(SAMBA_SITE),$(SAMBA_SOURCE))
 
@@ -58,6 +66,7 @@ $(SAMBA_DIR)/.configured: $(SAMBA_DIR)/.unpacked
 		--disable-static \
 		--disable-cups \
 		$(DISABLE_LARGEFILE) \
+		$(SAMBA_CONF_OPTIONS) \
 	)
 	touch $@
 
@@ -112,7 +121,6 @@ $(TARGET_DIR)/$(SAMBA_TARGET_BINARY): $(SAMBA_DIR)/$(SAMBA_BINARY)
 	rm -f $(addprefix $(TARGET_DIR)/usr/bin/ldb, add del edit modify search)
 	# Remove not used library by Samba binaries
 	rm -f $(TARGET_DIR)/usr/lib/libnetapi*
-	rm -f $(TARGET_DIR)/usr/lib/libsmbclient*
 	rm -f $(TARGET_DIR)/usr/lib/libtalloc*
 	rm -f $(TARGET_DIR)/usr/lib/libtdb*
 	# Remove not wanted Samba binaries
@@ -134,7 +142,12 @@ endif
 	rm -rf $(TARGET_DIR)/var/cache/samba
 	rm -rf $(TARGET_DIR)/var/lib/samba
 
-samba: libiconv $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+libsmbclient: $(SAMBA_DIR)/bin/libsmbclient.so
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR="$(STAGING_DIR)" \
+		-C $(SAMBA_DIR) installlibs
+
+samba: libiconv $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) $(SAMBA_LIBSMBCLIENT)
 
 samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
 
-- 
1.6.3.3
