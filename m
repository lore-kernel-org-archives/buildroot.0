From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Mar 2017 22:55:17 +0100
Subject: [Buildroot] [git commit] s6-linux-init: new package
Message-ID: <20170310215532.A171C8255A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08adaacff1e1d8f63229f667110784ea24cfcd81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new package provides s6-linux-init, a set of minimalistic tools to
create a s6-based init system, including a /sbin/init program, on a
machine running a Linux kernel.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/s6-linux-init/Config.in          | 12 +++++++++++
 package/s6-linux-init/s6-linux-init.hash |  2 ++
 package/s6-linux-init/s6-linux-init.mk   | 36 ++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index bc3801a..8daf670 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -442,6 +442,7 @@ F:	package/jemalloc/
 F:	package/ninja/
 F:	package/s6/
 F:	package/s6-dns/
+F:	package/s6-linux-init/
 F:	package/s6-linux-utils/
 F:	package/s6-networking/
 F:	package/s6-portable-utils/
diff --git a/package/Config.in b/package/Config.in
index e54dde8..7721727 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1803,6 +1803,7 @@ menu "System tools"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
 	source "package/s6/Config.in"
+	source "package/s6-linux-init/Config.in"
 	source "package/s6-linux-utils/Config.in"
 	source "package/s6-portable-utils/Config.in"
 	source "package/s6-rc/Config.in"
diff --git a/package/s6-linux-init/Config.in b/package/s6-linux-init/Config.in
new file mode 100644
index 0000000..d930e2f
--- /dev/null
+++ b/package/s6-linux-init/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_S6_LINUX_INIT
+	bool "s6-linux-init"
+	select BR2_PACKAGE_S6
+	select BR2_PACKAGE_S6_LINUX_UTILS
+	select BR2_PACKAGE_S6_PORTABLE_UTILS
+	depends on BR2_USE_MMU # s6
+	help
+	  s6-linux-init is a set of minimalistic tools to create a
+	  s6-based init system, including a /sbin/init binary, on a
+	  Linux kernel.
+
+	  http://skarnet.org/software/s6-linux-init/
diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
new file mode 100644
index 0000000..e02e391
--- /dev/null
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256 131484e61eff0e671e112f0436b13e8e7d08752f810d8bec4924a68383eee2b9 s6-linux-init-0.2.0.0.tar.gz
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
new file mode 100644
index 0000000..112e176
--- /dev/null
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# s6-linux-init
+#
+################################################################################
+
+S6_LINUX_INIT_VERSION = 0.2.0.0
+S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
+S6_LINUX_INIT_LICENSE = ISC
+S6_LINUX_INIT_LICENSE_FILES = COPYING
+S6_LINUX_INIT_DEPENDENCIES = s6 s6-linux-utils s6-portable-utils
+
+S6_LINUX_INIT_CONF_OPTS = \
+	--prefix=/usr \
+	--with-sysdeps=$(STAGING_DIR)/usr/lib/skalibs/sysdeps \
+	--with-include=$(STAGING_DIR)/usr/include \
+	--with-dynlib=$(STAGING_DIR)/usr/lib \
+	--with-lib=$(STAGING_DIR)/usr/lib/execline \
+	--with-lib=$(STAGING_DIR)/usr/lib/s6 \
+	--with-lib=$(STAGING_DIR)/usr/lib/skalibs \
+	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(SHARED_STATIC_LIBS_OPTS)
+
+define S6_LINUX_INIT_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_LINUX_INIT_CONF_OPTS))
+endef
+
+define S6_LINUX_INIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define S6_LINUX_INIT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
