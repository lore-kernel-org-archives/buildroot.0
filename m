From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 15:28:05 +0200
Subject: [Buildroot] [git commit] nmap: add sub-options for ncat,
 nping and ndiff
Message-ID: <20180402132817.1957781566@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55ec9b4e40b08a11cb9c1662c427c8d58351924a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The forthcoming "libvirt" package will need a "nc" command with support
for Unix domain sockets in order to permit remote management using the
virt-manager utility. netcat-openbsd provides such command but requires
glibc, so we would not have remote management on uClibc-based systems.

Ncat is a much-improved reimplementation of the venerable Netcat and is
compatible with uClibc and musl. It provides features not available in
the ancient GNU netcat and its Busybox double like IPv6, proxies, and
Unix sockets.

Since 'nmap' itself is a fairly big program (~2.3 MB), we want to be
able to install only ncat. In addition, nmap requires an external
library, pcre.

So this commit adds sub-options to selectively enable/disable the
different programs part of nmap: nmap, nping, ndiff and ncat.

Finally, we symlink 'nc' to ncat if neiter netcat nor netcat-openbsd
is selected, even though ncat does not have the same interface as
netcat-openbsd.  However, since Fedora/RHEL install nmap-ncat as 'nc',
it can be assumed that packages that depend on 'nc' know how to deal
with this diversity.  For example, the virt-manager package does
that. Also user-supplied scripts can be assumed to do the right thing,
since the user also selects whether nmap-ncat, netcat or
netcat-openbsd is installed.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas:
 - don't just handle the ncat case in a special way: create
   sub-options for all nmap tools, and use <pkg>_MAKE_OPTS and
   <pkg>_INSTALL_TARGET_OPTS to select which ones should be
   built/installed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nmap/Config.in | 47 +++++++++++++++++++++++++++++++++++++++++++++--
 package/nmap/nmap.mk   | 50 +++++++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 90 insertions(+), 7 deletions(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 79f587afd1..c1aafeceb9 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -4,13 +4,56 @@ config BR2_PACKAGE_NMAP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_NMAP_NMAP \
+	       if !BR2_PACKAGE_NMAP_NCAT && !BR2_PACKAGE_NMAP_NPING && !BR2_PACKAGE_NMAP_NDIFF
 	help
 	  Nmap ("Network Mapper") is a free and open source (license)
 	  utility for network discovery and security auditing.
 
 	  http://nmap.org
 
-comment "nmap needs a toolchain w/ C++, threads"
+if  BR2_PACKAGE_NMAP
+
+config BR2_PACKAGE_NMAP_NCAT
+	bool "install ncat"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  Ncat is a feature-packed networking utility which reads and
+	  writes data across networks from the command line. Ncat was
+	  written for the Nmap Project as a much-improved
+	  reimplementation of the venerable Netcat.
+
+	  If symlink to "nc" is installed if neither netcat or
+	  netcat-openbsd is selected.
+
+comment "a symlink from ncat to 'nc' will be installed"
+	depends on BR2_PACKAGE_NMAP_NCAT
+	depends on !BR2_PACKAGE_NETCAT
+	depends on !BR2_PACKAGE_NETCAT_OPENBSD
+
+config BR2_PACKAGE_NMAP_NDIFF
+	bool "install ndiff"
+	# ndiff only works with python2.x
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  This option installs the 'ndiff' tool.
+
+comment "ndiff needs Python 2.x"
+	depends on !BR2_PACKAGE_PYTHON
+
+config BR2_PACKAGE_NMAP_NMAP
+	bool "install nmap"
+	select BR2_PACKAGE_PCRE
+	help
+	  This option installs 'nmap' itself.
+
+config BR2_PACKAGE_NMAP_NPING
+	bool "install nping"
+	help
+	  This option installs the 'nping' tool.
+
+endif
+
+comment "nmap-nmap needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index ceb08ec006..92a2be1b54 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -7,10 +7,9 @@
 NMAP_VERSION = 7.60
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap pcre host-autoconf
+NMAP_DEPENDENCIES = libpcap host-autoconf
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
-	--with-libdnet=included --with-liblinear=included \
-	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
+	--with-libdnet=included --with-liblinear=included
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
@@ -51,11 +50,52 @@ else
 NMAP_CONF_OPTS += --without-openssl
 endif
 
-# ndiff only works with python2.x
-ifeq ($(BR2_PACKAGE_PYTHON),y)
+NMAP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
+NMAP_CONF_OPTS += --with-ncat
+NMAP_MAKE_OPTS += build-ncat
+NMAP_INSTALL_TARGET_OPTS += install-ncat
+else
+NMAP_CONF_OPTS += --without-ncat
+endif
+
+ifeq ($(BR2_PACKAGE_NMAP_NDIFF),y)
 NMAP_DEPENDENCIES += python
+NMAP_CONF_OPTS += --with-ndiff
+NMAP_MAKE_OPTS += build-ndiff
+NMAP_INSTALL_TARGET_OPTS += install-ndiff
 else
 NMAP_CONF_OPTS += --without-ndiff
 endif
 
+ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
+NMAP_DEPENDENCIES += pcre
+NMAP_CONF_OPTS += --with-libpcre="$(STAGING_DIR)/usr"
+NMAP_MAKE_OPTS += nmap
+NMAP_INSTALL_TARGET_OPTS += install-nmap
+endif
+
+ifeq ($(BR2_PACKAGE_NMAP_NPING),y)
+NMAP_CONF_OPTS += --with-nping
+NMAP_MAKE_OPTS += build-nping
+NMAP_INSTALL_TARGET_OPTS += install-nping
+else
+NMAP_CONF_OPTS += --without-nping
+endif
+
+# If we are going to install ncat, ensure Busybox gets built/installed
+# before, so that this package overrides Busybox nc.
+ifeq ($(BR2_PACKAGE_NMAP_NCAT)$(BR2_PACKAGE_BUSYBOX),yy)
+NMAP_DEPENDENCIES += busybox
+endif
+
+# Add a symlink to "nc" if none of the competing netcats is selected
+ifeq ($(BR2_PACKAGE_NMAP_NCAT):$(BR2_PACKAGE_NETCAT)$(BR2_PACKAGE_NETCAT_OPENBSD),y:)
+define NMAP_INSTALL_NCAT_SYMLINK
+        ln -fs ncat $(TARGET_DIR)/usr/bin/nc
+endef
+NMAP_POST_INSTALL_TARGET_HOOKS += NMAP_INSTALL_NCAT_SYMLINK
+endif
+
 $(eval $(autotools-package))
