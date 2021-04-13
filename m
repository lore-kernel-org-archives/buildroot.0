From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 13 Apr 2021 08:41:39 -0500
Subject: [Buildroot] [PATCH v2] package/ace: new package
Message-ID: <20210413134139.13281-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ACE is an open-source framework that provides many components and
patterns for developing high-performance, distributed real-time
and embedded systems. It provides powerful, yet efficient abstractions
for sockets, demultiplexing loops, threads, synchronization primitives.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
---
Changes
v1 -> v2:
[Thomas P
 - Added platform specific Makefile config file
 - Made Config.in dependency style updates
 - Made OpenSSL optional
 - Used foreach loop in makefile
 - Used common install command for target and staging
---
 DEVELOPERS                      |  1 +
 package/Config.in               |  1 +
 package/ace/Config.in           | 12 +++++++
 package/ace/ace.hash            |  3 ++
 package/ace/ace.mk              | 63 +++++++++++++++++++++++++++++++++
 package/ace/platform_macros.GNU | 14 ++++++++
 6 files changed, 94 insertions(+)
 create mode 100644 package/ace/Config.in
 create mode 100644 package/ace/ace.hash
 create mode 100644 package/ace/ace.mk
 create mode 100644 package/ace/platform_macros.GNU

diff --git a/DEVELOPERS b/DEVELOPERS
index 626bb393dd..6dac446c68 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1699,6 +1699,7 @@ F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
 F:	configs/qemu_ppc64_e5500_defconfig
+F:	package/ace/
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/package/Config.in b/package/Config.in
index 01e6bc0bfa..9f9b22d6d4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1844,6 +1844,7 @@ menu "Networking"
 endmenu
 
 menu "Other"
+	source "package/ace/Config.in"
 	source "package/appstream-glib/Config.in"
 	source "package/apr/Config.in"
 	source "package/apr-util/Config.in"
diff --git a/package/ace/Config.in b/package/ace/Config.in
new file mode 100644
index 0000000000..226e34df32
--- /dev/null
+++ b/package/ace/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_ACE
+	bool "ace"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	help
+	  The ADAPTIVE Communication Environment (ACE(TM))
+	  An OO Network Programming Toolkit in C++.
+
+	  http://www.dre.vanderbilt.edu/~schmidt/ACE.html
+
+comment "ACE needs a glibc toolchain, dynamic library"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS
diff --git a/package/ace/ace.hash b/package/ace/ace.hash
new file mode 100644
index 0000000000..92fd42e131
--- /dev/null
+++ b/package/ace/ace.hash
@@ -0,0 +1,3 @@
+# Locally Computed:
+sha256  a28339750620c70cd29a8a7088a4bc6ebaf1ff7ba667498a0279ac97f0e32e01  ACE-7.0.1.tar.gz
+sha256  687bf9d16119e0caf6fb5c18214928fd6ea0da10df91e906255b7613af8061d8  COPYING
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
new file mode 100644
index 0000000000..539e0cc6c4
--- /dev/null
+++ b/package/ace/ace.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# ace
+#
+################################################################################
+
+ACE_VERSION = 7.0.1
+ACE_SOURCE = ACE-$(ACE_VERSION).tar.gz
+ACE_SITE = http://download.dre.vanderbilt.edu/previous_versions
+ACE_LICENSE = DOC
+ACE_LICENSE_FILES = COPYING
+ACE_INSTALL_STAGING = YES
+ACE_CPE_ID_VENDOR = vanderbilt
+ACE_CPE_ID_PRODUCT = adaptive_communication_environment
+
+# Note: We are excluding examples, apps and tests
+# Only compiling ACE libraries (no TAO)
+ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ACE_LIBARIES += ace/SSL
+ACE_DEPENDENCIES = openssl
+ACE_SSL = "ssl = 1"
+endif
+
+# configure the target build
+# refer: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
+define ACE_CONFIGURE_CMDS
+	# create a config file
+	echo ' #include "ace/config-linux.h" ' >> $(@D)/ace/config.h
+
+	# Create platform/compiler-specific Makefile configurations
+	$(INSTALL) -m 0644 package/ace/platform_macros.GNU $(@D)/include/makeinclude/
+	# Enable ssl if OpenSSL is configured
+	[ ! -z $(ACE_SSL) ] && \
+	echo $(ACE_SSL) >> $(@D)/include/makeinclude/platform_macros.GNU || \
+	echo 'ace/SSL skipped'
+endef
+
+# compile ace,ACEXML, Kokyu, netsvcs & protocols/ace
+define ACE_BUILD_CMDS
+	$(foreach lib,$(ACE_LIBARIES), \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" all
+	)
+endef
+
+define  ACE_LIBARIES_INSTALL
+	# create below folder required by ACE makefiles during install
+	mkdir -p $(1)/usr/share/ace
+	$(foreach lib,$(ACE_LIBARIES), \
+		$(MAKE) -C $(@D)/$(lib) ACE_ROOT="$(@D)" DESTDIR=$(1) install
+	)
+endef
+
+define  ACE_INSTALL_TARGET_CMDS
+	$(call ACE_LIBARIES_INSTALL,$(TARGET_DIR))
+endef
+
+define  ACE_INSTALL_STAGING_CMDS
+	$(call ACE_LIBARIES_INSTALL,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))
diff --git a/package/ace/platform_macros.GNU b/package/ace/platform_macros.GNU
new file mode 100644
index 0000000000..ab5ec25a1b
--- /dev/null
+++ b/package/ace/platform_macros.GNU
@@ -0,0 +1,14 @@
+# help: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
+
+# create a platform macros file
+include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU
+
+# disable RPATH
+install_rpath = 0
+
+# set the installation prefix
+INSTALL_PREFIX = /usr
+
+# fix link error with ARM EABI tools
+# http://list.isis.vanderbilt.edu/pipermail/ace-users/2008-January/002742.html
+no_hidden_visibility = 1
-- 
2.17.1
