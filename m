From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Apr 2021 11:55:24 -0500
Subject: [Buildroot] [PATCH] package/ace: new package
Message-ID: <20210412165524.17793-1-matthew.weber@rockwellcollins.com>
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
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/ace/Config.in | 10 +++++++
 package/ace/ace.hash  |  3 +++
 package/ace/ace.mk    | 63 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+)
 create mode 100644 package/ace/Config.in
 create mode 100644 package/ace/ace.hash
 create mode 100644 package/ace/ace.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c36fc413e..02553a76b0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1722,6 +1722,7 @@ F:	board/qemu/ppc64-e5500/
 F:	configs/freescale_p*
 F:	configs/freescale_t*
 F:	configs/qemu_ppc64_e5500_defconfig
+F:	package/ace/
 F:	package/argp-standalone/
 F:	package/aufs/
 F:	package/aufs-util/
diff --git a/package/Config.in b/package/Config.in
index f47ee9f1c5..373d85f28f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1851,6 +1851,7 @@ menu "Networking"
 endmenu
 
 menu "Other"
+	source "package/ace/Config.in"
 	source "package/appstream-glib/Config.in"
 	source "package/apr/Config.in"
 	source "package/apr-util/Config.in"
diff --git a/package/ace/Config.in b/package/ace/Config.in
new file mode 100644
index 0000000000..7755327b21
--- /dev/null
+++ b/package/ace/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ACE
+	bool "ace"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The ADAPTIVE Communication Environment (ACE(TM))
+	  An OO Network Programming Toolkit in C++.
+
+	  See http://www.dre.vanderbilt.edu/~schmidt/ACE.html
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
index 0000000000..80d50665d9
--- /dev/null
+++ b/package/ace/ace.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# ace
+#
+################################################################################
+
+ACE_VERSION=7.0.1
+ACE_SOURCE=ACE-$(ACE_VERSION).tar.gz
+ACE_SITE=http://download.dre.vanderbilt.edu/previous_versions
+ACE_DEPENDENCIES=openssl
+ACE_LICENSE = DOC
+ACE_LICENSE_FILES = COPYING
+ACE_INSTALL_STAGING=YES
+ACE_CPE_ID_VENDOR = vanderbilt
+ACE_CPE_ID_PRODUCT = adaptive_communication_environment
+
+# configure the target build
+# refer: http://www.dre.vanderbilt.edu/~schmidt/DOC_ROOT/ACE/ACE-INSTALL.html#unix
+define ACE_CONFIGURE_CMDS
+	# create a config file
+	echo ' #include "ace/config-linux.h" ' > $(@D)/ace/config.h
+	# fix link error with ARM EABI tools
+	# http://list.isis.vanderbilt.edu/pipermail/ace-users/2008-January/002742.html
+	echo 'no_hidden_visibility = 1' > $(@D)/include/makeinclude/platform_macros.GNU
+	# create a platform macros file
+	echo 'include $(@D)/include/makeinclude/platform_linux.GNU' \
+		>> $(@D)/include/makeinclude/platform_macros.GNU
+	# enable ssl
+	echo 'ssl = 1' >> $(@D)/include/makeinclude/platform_macros.GNU
+	# disable RPATH
+	echo 'install_rpath = 0' >> $(@D)/include/makeinclude/platform_macros.GNU
+	# set the installation prefix
+	echo 'INSTALL_PREFIX = /usr' >> $(@D)/include/makeinclude/platform_macros.GNU
+endef
+
+# Note: We are excluding examples, apps and tests
+# Only compiling ACE libraries (no TAO)
+ACE_LIBARIES = ace ace/SSL ACEXML Kokyu netsvcs protocols/ace
+
+# compile ace,ACEXML, Kokyu, netsvcs & protocols/ace
+define ACE_BUILD_CMDS
+	for dir in $(ACE_LIBARIES) ; do \
+		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" all || exit 1 ; \
+	done
+endef
+
+define  ACE_INSTALL_STAGING_CMDS
+	# create below folder required by ACE makefiles during install
+	mkdir -p $(STAGING_DIR)/usr/share/ace
+	for dir in $(ACE_LIBARIES) ; do \
+		$(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" DESTDIR=$(STAGING_DIR) install || exit 1 ; \
+	done
+endef
+
+define  ACE_INSTALL_TARGET_CMDS
+	# create below folder required by ACE makefiles during install
+	mkdir -p $(TARGET_DIR)/usr/share/ace
+	for dir in $(ACE_LIBARIES) ; do \
+		$(MAKE) -C $(@D)/$${dir} ACE_ROOT="$(@D)" DESTDIR=$(TARGET_DIR) install || exit 1 ; \
+	done
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
