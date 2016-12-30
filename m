From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:35 +0100
Subject: [Buildroot] [PATCH 34/52] package/corosync: new package
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <eae2afdb963b9fcd93a01aebceee041a25492dad.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in              |  1 +
 package/corosync/Config.in     | 20 ++++++++++++++++++
 package/corosync/corosync.hash |  2 ++
 package/corosync/corosync.mk   | 47 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 70 insertions(+)
 create mode 100644 package/corosync/Config.in
 create mode 100644 package/corosync/corosync.hash
 create mode 100644 package/corosync/corosync.mk

diff --git a/package/Config.in b/package/Config.in
index 1a754d4..4b7845c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1294,6 +1294,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
+	source "package/corosync/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
diff --git a/package/corosync/Config.in b/package/corosync/Config.in
new file mode 100644
index 0000000..1dda488
--- /dev/null
+++ b/package/corosync/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_COROSYNC
+	bool "corosync"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT # libnss -> libnsp
+	depends on !BR2_STATIC_LIBS # libnss
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBQB
+	select BR2_PACKAGE_ZLIB
+	help
+	  The Corosync Cluster Engine is a Group Communication System
+	  with additional features for implementing high availability
+	  within applications.
+
+	  https://corosync.github.io/corosync/
+
+comment "corosync needs a toolchain w/ threads, dunamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBNSPR_ARCH_SUPPORT
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/corosync/corosync.hash b/package/corosync/corosync.hash
new file mode 100644
index 0000000..5c009de
--- /dev/null
+++ b/package/corosync/corosync.hash
@@ -0,0 +1,2 @@
+# sha256 locally computed
+sha256  0dd0ee718253c18c5090e0304eec72a7be8b18b6fe5e03de59ce095fa08c8b63  corosync-v2.4.2.tar.gz
diff --git a/package/corosync/corosync.mk b/package/corosync/corosync.mk
new file mode 100644
index 0000000..865f5e0
--- /dev/null
+++ b/package/corosync/corosync.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# corosync
+#
+################################################################################
+
+COROSYNC_VERSION = v2.4.2
+COROSYNC_SITE = $(call github,corosync,corosync,$(COROSYNC_VERSION))
+
+COROSYNC_LICENSE = BSD-3c
+COROSYNC_LICENSE_FILES = LICENSE
+
+COROSYNC_DEPENDENCIES = libnss libqb zlib
+COROSYNC_AUTORECONF = YES
+COROSYNC_INSTALL_STAGING = YES
+
+define COROSYNC_M4
+	$(INSTALL) -d -m 0755 $(@D)/m4
+endef
+COROSYNC_POST_EXTRACT_HOOKS += COROSYNC_M4
+
+# Don't build HTML manpages
+COROSYNC_CONF_ENV = ac_cv_prog_GROFF=
+
+COROSYNC_CONF_OPTS = \
+	--disable-fatal-warnings \
+	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
+	--enable-secure-build \
+	--disable-user-flags \
+	--disable-coverage \
+	--disable-small-memory-footprint \
+	--disable-dbus \
+	--disable-testagents \
+	--disable-rdma \
+	--disable-monitoring \
+	--disable-watchdog \
+	--disable-augeas \
+	--disable-systemd \
+	--disable-upstart \
+	$(if $(BR2_INIT_SYSTEMD),--enable-systemd,--disable-systemd) \
+	--disable-upstart \
+	--disable-snmp \
+	--disable-xmlconf \
+	--disable-qdevices \
+	--disable-qnet
+
+$(eval $(autotools-package))
-- 
2.7.4
