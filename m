From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  4 Oct 2017 12:43:13 -0300
Subject: [Buildroot] [PATCH v2] nmap: add option to build/install "ncat"
In-Reply-To: <20171004124920.7358-1-casantos@datacom.ind.br>
References: <20171004124920.7358-1-casantos@datacom.ind.br>
Message-ID: <20171004154313.25762-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ncat is a much-improved reimplementation of the venerable Netcat and is
compatible with uClibc.

So far the "nc" options available to build with uClibc were the ancient
GNU netcat and its Busybox double (the openbsd-netcat package cannot be
used because it requires GLIBC). Both lack features available in modern
netcats like IPv6, proxies, and Unix sockets.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
Changes v1->v2:
  - Add dependens on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, like netcat does
  - Remove forced dependence on busybox, since its installation script
    does not override existing programs.
---
 package/nmap/Config.in | 13 +++++++++++++
 package/nmap/nmap.mk   | 15 ++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/package/nmap/Config.in b/package/nmap/Config.in
index 79f587afd1..a2e330dacd 100644
--- a/package/nmap/Config.in
+++ b/package/nmap/Config.in
@@ -11,6 +11,19 @@ config BR2_PACKAGE_NMAP
 
 	  http://nmap.org
 
+if BR2_PACKAGE_NMAP
+
+config BR2_PACKAGE_NMAP_NCAT
+	bool "nmap-ncat"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  Ncat is a feature-packed networking utility which reads and
+	  writes data across networks from the command line. Ncat was
+	  written for the Nmap Project as a much-improved
+	  reimplementation of the venerable Netcat.
+
+endif
+
 comment "nmap needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 9db06d1455..fb16c2887d 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -10,7 +10,7 @@ NMAP_SOURCE = nmap-$(NMAP_VERSION).tar.bz2
 NMAP_DEPENDENCIES = libpcap pcre
 NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 	--with-libdnet=included --with-liblinear=included \
-	--with-libpcre="$(STAGING_DIR)/usr" --without-ncat
+	--with-libpcre="$(STAGING_DIR)/usr"
 NMAP_LICENSE = GPL-2.0
 NMAP_LICENSE_FILES = COPYING
 
@@ -50,4 +50,17 @@ else
 NMAP_CONF_OPTS += --without-ndiff
 endif
 
+ifeq ($(BR2_PACKAGE_NMAP_NCAT),y)
+
+define NMAP_INSTALL_NCAT_SYMLINK
+        ln -fs ncat $(TARGET_DIR)/usr/bin/nc
+endef
+NMAP_POST_INSTALL_TARGET_HOOKS += NMAP_INSTALL_NCAT_SYMLINK
+
+else
+
+NMAP_CONF_OPTS += --without-ncat
+
+endif
+
 $(eval $(autotools-package))
-- 
2.13.6
