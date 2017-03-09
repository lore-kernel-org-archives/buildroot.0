From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 23:07:29 +0100
Subject: [Buildroot] [git commit] s6-dns: new package
Message-ID: <20170309220804.D962182560@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c3ed96d1ba5a334b9d78a7252404a1f811ad90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-dns, a suite of DNS client programs and
libraries for Unix systems, as an alternative to the BIND, djbdns or
other DNS clients.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/s6-dns/Config.in   | 10 ++++++++++
 package/s6-dns/s6-dns.hash |  2 ++
 package/s6-dns/s6-dns.mk   | 45 +++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 73413eb..f67d416 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -441,6 +441,7 @@ F:	package/hicolor-icon-theme/
 F:	package/jemalloc/
 F:	package/ninja/
 F:	package/s6/
+F:	package/s6-dns/
 F:	package/skalibs/
 F:	package/smack/
 F:	package/xvisor/
diff --git a/package/Config.in b/package/Config.in
index 1cb584c..bca190c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1640,6 +1640,7 @@ endif
 	source "package/rsync/Config.in"
 	source "package/rtorrent/Config.in"
 	source "package/rtptools/Config.in"
+	source "package/s6-dns/Config.in"
 	source "package/samba4/Config.in"
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
diff --git a/package/s6-dns/Config.in b/package/s6-dns/Config.in
new file mode 100644
index 0000000..75917f9
--- /dev/null
+++ b/package/s6-dns/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_S6_DNS
+	bool "s6-dns"
+	select BR2_PACKAGE_SKALIBS
+	depends on BR2_USE_MMU # skalibs
+	help
+	  s6-dns is a suite of DNS client programs and libraries for
+	  Unix systems, as an alternative to the BIND, djbdns or other
+	  DNS clients.
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
