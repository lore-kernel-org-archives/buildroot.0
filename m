From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:08:02 +0200
Subject: [Buildroot] [PATCH v4 12/12] package/s390-tools: new package
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-13-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Collection of tools for the IBM s390x and Z architectures.

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/s390-tools/Config.in       | 13 +++++
 package/s390-tools/s390-tools.hash |  3 +
 package/s390-tools/s390-tools.mk   | 91 ++++++++++++++++++++++++++++++
 5 files changed, 109 insertions(+)
 create mode 100644 package/s390-tools/Config.in
 create mode 100644 package/s390-tools/s390-tools.hash
 create mode 100644 package/s390-tools/s390-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2c6cc45d45..ed315e80d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -150,6 +150,7 @@ N:	Alexander Egorenkov <egorenar@linux.ibm.com>
 F:	arch/Config.in.s390x
 F:	board/qemu/s390x/
 F:	configs/qemu_s390x_defconfig
+F:	package/s390-tools/
 
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
diff --git a/package/Config.in b/package/Config.in
index 7783c26dc6..3907978365 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2427,6 +2427,7 @@ menu "System tools"
 	source "package/rauc/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/s390-tools/Config.in"
 	source "package/s6/Config.in"
 	source "package/s6-linux-init/Config.in"
 	source "package/s6-linux-utils/Config.in"
diff --git a/package/s390-tools/Config.in b/package/s390-tools/Config.in
new file mode 100644
index 0000000000..a553b5eeab
--- /dev/null
+++ b/package/s390-tools/Config.in
@@ -0,0 +1,13 @@
+comment "s390-tools needs a glibc toolchain w/ C++, wchar, dynamic library"
+	depends on BR2_s390x
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_S390_TOOLS
+	bool "s390-tools"
+	depends on BR2_s390x
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Tools for use with the s390 Linux kernel and device drivers.
+
+	  https://github.com/ibm-s390-tools/s390-tools
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
new file mode 100644
index 0000000000..38c2431c25
--- /dev/null
+++ b/package/s390-tools/s390-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  02171161c3f858e413f777dac542d37328b7b882a7919cfb966ea554bb6ac0b2  s390-tools-2.14.0.tar.gz
+sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  COPYING
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
new file mode 100644
index 0000000000..4d4c8188fe
--- /dev/null
+++ b/package/s390-tools/s390-tools.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# s390-tools
+#
+################################################################################
+
+S390_TOOLS_VERSION = 2.14.0
+S390_TOOLS_SITE = $(call github,ibm-s390-tools,s390-tools,v$(S390_TOOLS_VERSION))
+S390_TOOLS_LICENSE = MIT
+S390_TOOLS_LICENSE_FILES = LICENSE
+
+S390_TOOLS_MAKE_OPTS = \
+	ARCH=$(BR2_ARCH) \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+	LINK="$(TARGET_CC)" \
+	LINKXX="$(TARGET_CXX)"
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+S390_TOOLS_DEPENDENCIES += libcurl
+S390_TOOLS_MAKE_OPTS += HAVE_CURL=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+S390_TOOLS_DEPENDENCIES += json-c
+S390_TOOLS_MAKE_OPTS += HAVE_JSONC=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_JSONC=0
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+S390_TOOLS_DEPENDENCIES += openssl
+S390_TOOLS_MAKE_OPTS += HAVE_OPENSSL=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_OPENSSL=0
+endif
+
+ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
+S390_TOOLS_DEPENDENCIES += cryptsetup
+S390_TOOLS_MAKE_OPTS += HAVE_CRYPTSETUP2=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_CRYPTSETUP2=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+S390_TOOLS_DEPENDENCIES += libglib2
+S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+S390_TOOLS_DEPENDENCIES += ncurses
+S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPFM4),y)
+S390_TOOLS_DEPENDENCIES += libpfm4
+S390_TOOLS_MAKE_OPTS += HAVE_PFM=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_PFM=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+S390_TOOLS_DEPENDENCIES += libfuse
+S390_TOOLS_MAKE_OPTS += HAVE_FUSE=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_FUSE=0
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_NET_SNMP),y)
+S390_TOOLS_DEPENDENCIES += perl-net-snmp
+S390_TOOLS_MAKE_OPTS += HAVE_SNMP=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_SNMP=0
+endif
+
+define S390_TOOLS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
+		$(S390_TOOLS_MAKE_OPTS)
+endef
+
+define S390_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) install \
+		$(S390_TOOLS_MAKE_OPTS) DESTDIR="$(TARGET_DIR)"
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
