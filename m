From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  5 Sep 2019 18:02:29 +0200
Subject: [Buildroot] [PATCH] ifstat: new package
Message-ID: <20190905160229.29645-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 .../0001-install-without-strip-flag.patch     | 26 +++++++++++++++++++
 package/ifstat/Config.in                      |  9 +++++++
 package/ifstat/ifstat.hash                    |  3 +++
 package/ifstat/ifstat.mk                      | 21 +++++++++++++++
 6 files changed, 61 insertions(+)
 create mode 100644 package/ifstat/0001-install-without-strip-flag.patch
 create mode 100644 package/ifstat/Config.in
 create mode 100644 package/ifstat/ifstat.hash
 create mode 100644 package/ifstat/ifstat.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3df21a78e..e452a1cbb 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -881,6 +881,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/ifstat/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 710ed12be..42dccf068 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1927,6 +1927,7 @@ menu "Networking applications"
 	source "package/ifenslave/Config.in"
 	source "package/ifmetric/Config.in"
 	source "package/ifplugd/Config.in"
+	source "package/ifstat/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
 	source "package/ifupdown-scripts/Config.in"
diff --git a/package/ifstat/0001-install-without-strip-flag.patch b/package/ifstat/0001-install-without-strip-flag.patch
new file mode 100644
index 000000000..217681f0a
--- /dev/null
+++ b/package/ifstat/0001-install-without-strip-flag.patch
@@ -0,0 +1,26 @@
+From 63533db706244d8b43e242349fcf32866ea10ab6 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Thu, 5 Sep 2019 17:11:53 +0200
+Subject: [PATCH] install without strip flag
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 486fe3e..5d17383 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -66,7 +66,7 @@ install: install-$(TARGET) install- at LIBTARGET@
+ 
+ install-$(TARGET): $(TARGET)
+ 	$(INSTALL) -d -m 755 $(bindir)
+-	$(INSTALL) -s -m 755 $(TARGET) $(bindir)/$(TARGET)
++	$(INSTALL) -m 755 $(TARGET) $(bindir)/$(TARGET)
+ 	$(INSTALL) -d -m 755 $(mandir)/man1
+ 	$(INSTALL) -m 644 ifstat.1 $(mandir)/man1/ifstat.1
+ 
+-- 
+2.20.1
+
diff --git a/package/ifstat/Config.in b/package/ifstat/Config.in
new file mode 100644
index 000000000..1e9671901
--- /dev/null
+++ b/package/ifstat/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_IFSTAT
+	bool "ifstat"
+	help
+	  ifstat is a tool to report network interfaces bandwidth just
+	  like vmstat/iostat do for other system counters.
+	  It can monitor local interfaces by polling the kernel
+	  counters, or remote hosts interfaces using SNMP.
+
+	  http://gael.roualland.free.fr/ifstat/
diff --git a/package/ifstat/ifstat.hash b/package/ifstat/ifstat.hash
new file mode 100644
index 000000000..dcc2ced31
--- /dev/null
+++ b/package/ifstat/ifstat.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 8599063b7c398f9cfef7a9ec699659b25b1c14d2bc0f535aed05ce32b7d9f507  ifstat-1.1.tar.gz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/ifstat/ifstat.mk b/package/ifstat/ifstat.mk
new file mode 100644
index 000000000..9a911739c
--- /dev/null
+++ b/package/ifstat/ifstat.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# ifstat
+#
+################################################################################
+
+IFSTAT_VERSION = 1.1
+IFSTAT_SITE = http://gael.roualland.free.fr/ifstat
+IFSTAT_LICENSE = GPL
+IFSTAT_LICENSE_FILES = COPYING
+
+IFSTAT_CONF_OPTS = --prefix=$(TARGET_DIR)/usr --exec_prefix=$(TARGET_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+IFSTAT_DEPENDENCIES += netsnmp
+IFSTAT_CONF_OPTS += --with-snmp
+else
+IFSTAT_CONF_OPTS += --without-snmp
+endif
+
+$(eval $(autotools-package))
-- 
2.20.1
