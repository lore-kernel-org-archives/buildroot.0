From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 10 Sep 2020 19:41:43 +0200
Subject: [Buildroot] [PATCH 3/3] package/s390-tools: new package
In-Reply-To: <20200910174143.311039-1-egorenar@linux.ibm.com>
References: <20200910174143.311039-1-egorenar@linux.ibm.com>
Message-ID: <20200910174143.311039-4-egorenar@linux.ibm.com>
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
 package/s390-tools/Config.in       | 20 ++++++++
 package/s390-tools/s390-tools.hash |  3 ++
 package/s390-tools/s390-tools.mk   | 80 ++++++++++++++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 package/s390-tools/Config.in
 create mode 100644 package/s390-tools/s390-tools.hash
 create mode 100644 package/s390-tools/s390-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e6e8c330c..2956785d6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -148,6 +148,7 @@ F:	package/multipath-tools/
 
 N:	Alexander Egorenkov <egorenar@linux.ibm.com>
 F:	arch/Config.in.s390x
+F:	package/s390-tools/
 
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
diff --git a/package/Config.in b/package/Config.in
index 17d2bd4f92..d19c46cb21 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2422,6 +2422,7 @@ menu "System tools"
 	source "package/rauc/Config.in"
 	source "package/rsyslog/Config.in"
 	source "package/runc/Config.in"
+	source "package/s390-tools/Config.in"
 	source "package/s6/Config.in"
 	source "package/s6-linux-init/Config.in"
 	source "package/s6-linux-utils/Config.in"
diff --git a/package/s390-tools/Config.in b/package/s390-tools/Config.in
new file mode 100644
index 0000000000..bddcd1d096
--- /dev/null
+++ b/package/s390-tools/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS
+	bool
+	default y if BR2_s390x
+
+comment "s390-tools needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+	depends on BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
+
+config BR2_PACKAGE_S390_TOOLS
+	bool "s390-tools"
+	depends on BR2_PACKAGE_S390_TOOLS_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
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
index 0000000000..c72adaa6dc
--- /dev/null
+++ b/package/s390-tools/s390-tools.mk
@@ -0,0 +1,80 @@
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
+S390_TOOLS_MAKE_OPTS  = V=1 ARCH=$(BR2_ARCH)
+S390_TOOLS_MAKE_OPTS += CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
+S390_TOOLS_MAKE_OPTS += LINK="$(TARGET_CC)" LINKXX="$(TARGET_CXX)"
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+S390_TOOLS_DEPENDENCIES += libcurl
+else
+S390_TOOLS_MAKE_OPTS += HAVE_CURL=0
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+S390_TOOLS_DEPENDENCIES += json-c
+else
+S390_TOOLS_MAKE_OPTS += HAVE_JSONC=0
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+S390_TOOLS_DEPENDENCIES += openssl
+else
+S390_TOOLS_MAKE_OPTS += HAVE_OPENSSL=0
+endif
+
+ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
+S390_TOOLS_DEPENDENCIES += cryptsetup
+else
+S390_TOOLS_MAKE_OPTS += HAVE_CRYPTSETUP2=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+S390_TOOLS_DEPENDENCIES += libglib2
+else
+S390_TOOLS_MAKE_OPTS += HAVE_GLIB2=0
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+S390_TOOLS_DEPENDENCIES += ncurses
+else
+S390_TOOLS_MAKE_OPTS += HAVE_NCURSES=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPFM4),y)
+S390_TOOLS_DEPENDENCIES += libpfm4
+else
+S390_TOOLS_MAKE_OPTS += HAVE_PFM=0
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+S390_TOOLS_DEPENDENCIES += libfuse
+else
+S390_TOOLS_MAKE_OPTS += HAVE_FUSE=0
+endif
+
+ifeq ($(BR2_PACKAGE_PERL_NET_SNMP),y)
+S390_TOOLS_DEPENDENCIES += perl-net-snmp
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
