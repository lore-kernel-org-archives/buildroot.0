From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 25 Feb 2013 20:34:08 +0100
Subject: [Buildroot] [git commit] nmap: new package
Message-ID: <20130301101145.6123C9AACA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=06b3e4c50d8c110f8b905f133afa31739d7817fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/nmap/Config.in |   16 ++++++++++++++++
 package/nmap/nmap.mk   |   24 ++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 882d3c0..e96b58f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -677,6 +677,7 @@ source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
 source "package/network-manager/Config.in"
 source "package/nfacct/Config.in"
+source "package/nmap/Config.in"
 source "package/noip/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
diff --git a/package/nmap/Config.in b/package/nmap/Config.in
new file mode 100644
index 0000000..be1be33
--- /dev/null
+++ b/package/nmap/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NMAP
+	bool "nmap"
+	depends on BR2_INET_IPV6
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_PCRE
+	help
+	  Nmap ("Network Mapper") is a free and open source (license)
+	  utility for network discovery and security auditing.
+
+	  http://nmap.org
+
+comment "nmap requires a toolchain with C++, IPV6 and thread support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
new file mode 100644
index 0000000..a5b085d
--- /dev/null
+++ b/package/nmap/nmap.mk
@@ -0,0 +1,24 @@
+#############################################################
+#
+# nmap
+#
+#############################################################
+
+NMAP_VERSION = 6.01
+NMAP_SITE = http://nmap.org/dist
+NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
+NMAP_DEPENDENCIES = libpcap pcre
+NMAP_CONF_OPT = --without-liblua --without-zenmap \
+	--with-libdnet=included --with-liblinear=included \
+	--with-libpcre="$(STAGING_DIR)/usr"
+NMAP_LICENSE = GPLv2
+NMAP_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NMAP_CONF_OPT += --with-openssl="$(STAGING_DIR)/usr"
+NMAP_DEPENDENCIES += openssl
+else
+NMAP_CONF_OPT += --without-openssl
+endif
+
+$(eval $(autotools-package))
