From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Nov 2017 08:41:29 -0200
Subject: [Buildroot] [PATCH 1/3] nmap: add option to build/install ncat
In-Reply-To: <20171127104131.27975-1-casantos@datacom.ind.br>
References: <20171127104131.27975-1-casantos@datacom.ind.br>
Message-ID: <20171127104131.27975-2-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The forthcoming "libvirt" package will need a "nc" command with support
for Unix domain sockets in order to permit remote management using the
virt-manager utility. netcat-openbsd provides such command but requires
glibc, so we would not have remote management on uClibc-based systems.

Ncat is a much-improved reimplementation of the venerable Netcat and is
compatible with uClibc and musl. It provides features not available in
the ancient GNU netcat and its Busybox double like IPv6, proxies, and
Unix sockets.

Tha nmap package now installs ncat if the BR2_PACKAGE_NMAP_NCAT option
is selected. The other programs (nmap, ndiff, etc.) are chosen via the
BR2_PACKAGE_NMAP_NMAP option.

We symlink 'nc' to ncat if neiter netcat nor netcat-openbsd is selected,
even though ncat does not have the same interface as netcat-openbsd.
However, since Fedora/RHEL install nmap-ncat as 'nc', it can be assumed
that packages that depend on 'nc' know how to deal with this diversity.
For example, the virt-manager package does that. Also user-supplied
scripts can be assumed to do the right thing, since the user also
selects whether nmap-ncat, netcat or netcat-openbsd is installed.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  - Add dependens on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, like netcat does
  - Remove forced dependence on busybox, since its installation script
    does not override existing programs.
Changes v2->v3:
  - Use a better logic to select either ncat tools, nmap or both, as
    suggested by Arnout Vandecappelle and Thomas Petazzoni.
  - Add a prominent comment about the symlink to 'nc', as suggested by
    Arnout.
Changes v3->v4:
  - Restore forced dependence on busybox, since it may be necessary if
    packages become built in parallel, leading to a race condition on
    the creation of the "nc" link.
Changes v4->v5
  - Rebase to "next" head.
  - Explain the this change is required by the forthcoming libvirt
    package.
---
 package/nmap/Config.in | 27 ++++++++++++++++++++++++++-
 package/nmap/nmap.mk   | 38 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 79f587afd1..1843bb6ade 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -4,6 +4,12 @@ config BR2_PACKAGE_NMAP
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_NMAP_NMAP if !BR2_PACKAGE_NMAP_NCAT
+
+if  BR2_PACKAGE_NMAP
+
+config BR2_PACKAGE_NMAP_NMAP
+	bool "install nmap tools"
 	select BR2_PACKAGE_PCRE
 	help
 	  Nmap ("Network Mapper") is a free and open source (license)
@@ -11,6 +17,25 @@ config BR2_PACKAGE_NMAP
 
 	  http://nmap.org
 
-comment "nmap needs a toolchain w/ C++, threads"
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
+endif
+
+comment "nmap-nmap needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index ceb08ec006..303eaf9a35 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -7,10 +7,10 @@
 NMAP_VERSION = 7.60
 NMAP_SITE = https://nmap.org/dist
 NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
-NMAP_DEPENDENCIES = libpcap pcre host-autoconf
+NMAP_DEPENDENCIES = libpcap host-autoconf
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
-	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
+	--with-libpcre="$(STAGING_DIR)/usr"
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
@@ -51,6 +51,16 @@ else
 NMAP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_NMAP_NMAP),y)
+
+# Ensure Busybox gets built/installed before, so that this package
+# overrides Busybox nc.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+NMAP_DEPENDENCIES += busybox
+endif
+
+NMAP_DEPENDENCIES += pcre
+
 # ndiff only works with python2.x
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 NMAP_DEPENDENCIES += python
@@ -58,4 +68,28 @@ else
 NMAP_CONF_OPTS += --without-ndiff
 endif
 
+ifeq ($(BR2_PACKAGE_NMAP_NCAT),)
+NMAP_CONF_OPTS += --without-ncat
+endif
+
+else # only ncat
+
+NMAP_CONF_OPTS += --without-ndiff --without-zenmap --without-nping --without-nmap-update
+define NMAP_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build-ncat
+endef
+define NMAP_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-ncat
+endef
+
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
-- 
2.14.3
