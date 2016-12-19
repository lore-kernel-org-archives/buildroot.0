From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 19 Dec 2016 22:29:10 +0100
Subject: [Buildroot] [Patch v3 4/9] s6-dns: new package
In-Reply-To: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1482182955-23916-5-git-send-email-eric.le.bihan.dev@free.fr>
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
 package/Config.in          |  1 +
 package/s6-dns/Config.in   |  9 +++++++++
 package/s6-dns/s6-dns.hash |  2 ++
 package/s6-dns/s6-dns.mk   | 45 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 57 insertions(+)
 create mode 100644 package/s6-dns/Config.in
 create mode 100644 package/s6-dns/s6-dns.hash
 create mode 100644 package/s6-dns/s6-dns.mk

diff --git a/package/Config.in b/package/Config.in
index 6b4fdb5..0984a9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1602,6 +1602,7 @@ endif
 	source "package/rsync/Config.in"
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
+	source "package/s6-dns/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/s6-dns/Config.in b/package/s6-dns/Config.in
new file mode 100644
index 0000000..84888ec
--- /dev/null
+++ b/package/s6-dns/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_S6_DNS
+	bool "s6-dns"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-dns is a suite of DNS client programs and libraries for Unix
+	  systems, as an alternative to the BIND, djbdns or other DNS clients.
+
+	  http://skarnet.org/software/s6-dns/
diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
new file mode 100644
index 0000000..7cfb9c3
--- /dev/null
+++ b/package/s6-dns/s6-dns.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 8455f3b1edad8f01a1340cb1242c141755729bfd5d71059739eced5c006539ad s6-dns-2.1.0.0.tar.gz
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
new file mode 100644
index 0000000..d77956f
--- /dev/null
+++ b/package/s6-dns/s6-dns.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# s6-dns
+#
+################################################################################
+
+S6_DNS_VERSION = 2.1.0.0
+S6_DNS_SITE = http://skarnet.org/software/s6-dns
+S6_DNS_LICENSE = ISC
+S6_DNS_LICENSE_FILES = COPYING
+S6_DNS_INSTALL_STAGING = YES
+S6_DNS_DEPENDENCIES = skalibs
+
+S6_DNS_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_DNS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_DNS_CONF_OPTS))
+endef
+
+define S6_DNS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_DNS_REMOVE_STATIC_LIB_DIR
+	rm -rf $(TARGET_DIR)/usr/lib/s6-dns
+endef
+
+S6_DNS_POST_INSTALL_TARGET_HOOKS += S6_DNS_REMOVE_STATIC_LIB_DIR
+
+define S6_DNS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+define S6_DNS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.5.5
