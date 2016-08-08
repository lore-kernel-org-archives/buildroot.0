From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  8 Aug 2016 23:02:15 +0200
Subject: [Buildroot] [PATCH 4/9] s6-dns: new package
In-Reply-To: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1470690140-18803-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1470690140-18803-5-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new package provides s6-dns, a suite of DNS client programs and
libraries for Unix systems, as an alternative to the BIND, djbdns or
other DNS clients.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/Config.in        |  1 +
 package/s6-dns/Config.in | 12 ++++++++++++
 package/s6-dns/s6-dns.mk | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 package/s6-dns/Config.in
 create mode 100644 package/s6-dns/s6-dns.mk

diff --git a/package/Config.in b/package/Config.in
index 4fa2380..6ce4c31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1566,6 +1566,7 @@ endif
 	source "package/rsync/Config.in"
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
+	source "package/s6-dns/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/s6-dns/Config.in b/package/s6-dns/Config.in
new file mode 100644
index 0000000..45db9fd
--- /dev/null
+++ b/package/s6-dns/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_S6_DNS
+	bool "s6-dns"
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_SKALIBS
+	help
+	  s6-dns is a suite of DNS client programs and libraries for Unix
+	  systems, as an alternative to the BIND, djbdns or other DNS clients.
+
+	  http://skarnet.org/software/s6-dns/
+
+comment "s6-dns needs an (e)glibc or musl toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
new file mode 100644
index 0000000..c0bc961
--- /dev/null
+++ b/package/s6-dns/s6-dns.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# s6-dns
+#
+################################################################################
+
+S6_DNS_VERSION = v2.0.1.0
+S6_DNS_SITE = git://git.skarnet.org/s6-dns.git
+S6_DNS_LICENSE = ISC
+S6_DNS_LICENSE_FILES = COPYING
+S6_DNS_INSTALL_STAGING = YES
+S6_DNS_DEPENDENCIES = skalibs
+
+S6_DNS_CONFIGURE_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs
+
+ifeq ($(BR2_STATIC_LIBS),y)
+S6_DNS_CONFIGURE_OPTS +=  --enable-static --disable-shared
+else
+S6_DNS_CONFIGURE_OPTS +=  --disable-static --enable-shared --disable-allstatic
+endif
+
+define S6_DNS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_DNS_CONFIGURE_OPTS))
+endef
+
+define S6_DNS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define S6_DNS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_DNS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.4.11
