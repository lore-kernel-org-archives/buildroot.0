From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 30 Oct 2015 09:19:40 +0100
Subject: [Buildroot] [PATCH v4 4/4] galera: new package
In-Reply-To: <1446154325-24088-5-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1446154325-24088-5-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1446193180-29924-1-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add new package galera. Galera makes it possible to use certain 
versions of mariadb or mysql in a cluster. It must be built as a shared 
library. Also install galera arbitrator aka garbd and a template config 
file. Garbd participate in the cluster as a voter but does not 
replicate data. It makes it possible to use a cluster with an even 
number of nodes or even only two nodes.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>

---

Changes v3 -> v4:
 - install garbd

Changes v2 -> v3:
 - set strict_build_flags=0 in order to avoid build failure (suggested 
by Samuel Martin, Arnout Vandecappelle)
 - rename BR2_x86 variable into GALERA_BITWISE (suggested by Samuel 
Martin)
 - fix the logic behind determination of 32/64bits architecture 
(suggested by Samuel Martin)
 - append CROSS=.. to SCONS_ENV variable (suggested by Samuel Martin)
 - improve patch in order not to disable ccache usage (suggested by 
Arnout Vandecappelle)
 - remove "-mtune=native" from compilation options in order not to 
break build
 - remove useless host variant (suggested by Samuel Martin)
 - use github version

Changes v1 -> v2:
 - Change commit titles (suggested by Thomas Petazzoni)
 - Remove duplicated block in package/galera/galera.mk

 package/Config.in                                  |  1 +
 package/galera/Config.in                           | 15 +++++++
 package/galera/arbitrator.cfg                      | 12 ++++++
 ...lera-01-fix_sconstruct_for-crosscompiling.patch | 42 ++++++++++++++++++
 package/galera/galera.mk                           | 50 ++++++++++++++++++++++
 5 files changed, 120 insertions(+)
 create mode 100644 package/galera/Config.in
 create mode 100644 package/galera/arbitrator.cfg
 create mode 100644 package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
 create mode 100644 package/galera/galera.mk

diff --git a/package/Config.in b/package/Config.in
index 10ff94e..d3c8b39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -771,6 +771,7 @@ endmenu
 menu "Database"
 	source "package/berkeleydb/Config.in"
 	source "package/cppdb/Config.in"
+	source "package/galera/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
 	source "package/leveldb/Config.in"
diff --git a/package/galera/Config.in b/package/galera/Config.in
new file mode 100644
index 0000000..2ef8653
--- /dev/null
+++ b/package/galera/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_GALERA
+	bool "galera"
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CHECK
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Galera WSREP provider
+	  http://galeracluster.com/
+
+
+comment "Galera needs a toolchain w/ dynamic library, threads"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/galera/arbitrator.cfg b/package/galera/arbitrator.cfg
new file mode 100644
index 0000000..7ad42f9
--- /dev/null
+++ b/package/galera/arbitrator.cfg
@@ -0,0 +1,12 @@
+# A space-separated list of node addresses (address[:port]) in the cluster:
+GALERA_NODES=""
+
+# Galera cluster name, should be the same as on the rest of the node.
+GALERA_GROUP=""
+
+# Optional Galera internal options string (e.g. SSL settings)
+# see http://galeracluster.com/documentation-webpages/galeraparameters.html
+GALERA_OPTIONS=""
+
+# Log file for garbd. Optional, by default logs to syslog
+LOG_FILE="/var/log/garbd.log"
diff --git a/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
new file mode 100644
index 0000000..7a5d5b2
--- /dev/null
+++ b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
@@ -0,0 +1,42 @@
+Fix cross compilation
+Remove mtune=native flag for unknown architecture
+
+Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
+
+--- a/SConstruct	2015-09-18 14:44:19.246239421 +0200
++++ b/SConstruct	2015-09-18 14:47:45.934244956 +0200
+@@ -15,21 +15,15 @@
+ ####################################################################
+ 
+ import os
+-import platform
+ import string
+ 
+-sysname = os.uname()[0].lower()
+-machine = platform.machine()
+-bits = ARGUMENTS.get('bits', platform.architecture()[0])
+-print 'Host: ' + sysname + ' ' + machine + ' ' + bits
++sysname = "linux"
++machine = os.environ['BR2_ARCH']
++bits = int(os.environ['GALERA_BITWISE'])
++print 'Host: ' + sysname + ' ' + machine + ' ' + str(bits)
+ 
+ x86 = any(arch in machine for arch in [ 'x86', 'amd64', 'i686', 'i386' ])
+ 
+-if bits == '32bit':
+-    bits = 32
+-elif bits == '64bit':
+-    bits = 64
+-
+ #
+ # Print Help
+ #
+@@ -107,7 +101,7 @@
+     if bits == 32:
+         compile_arch += ' -m32'
+ else:
+-    compile_arch = ' -mtune=native'
++    compile_arch = ''
+     link_arch    = ''
+ 
+ 
diff --git a/package/galera/galera.mk b/package/galera/galera.mk
new file mode 100644
index 0000000..a81287f
--- /dev/null
+++ b/package/galera/galera.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# galera
+#
+################################################################################
+
+GALERA_VERSION = 35059668fe85b135c1f38f4d53e6117b6c40d90b
+GALERA_SITE = $(call github,codership,galera,$(GALERA_VERSION))
+
+GALERA_INSTALL_STAGING = NO
+GALERA_INSTALL_TARGET = YES
+
+GALERA_DEPENDENCIES = boost openssl check host-scons
+
+GALERA_LIBNAME = libgalera_smm.so
+GARBD = garb/garbd
+
+GALERA_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) BR2_ARCH=$(BR2_ARCH)
+ifeq ($(BR2_ARCH_IS_64),y)
+GALERA_SCONS_ENV += GALERA_BITWISE=64
+else
+GALERA_SCONS_ENV += GALERA_BITWISE=32
+endif
+
+GALERA_SCONS_ENV += $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS)
+
+GALERA_SCONS_OPTS = \
+	arch=$(BR2_ARCH) \
+	prefix=/usr \
+	extra_sysroot=$(STAGING_DIR) \
+	strict_build_flags=0 \
+	tests=0
+
+define GALERA_BUILD_CMDS
+        cd $(@D) && \
+	  $(GALERA_SCONS_ENV) \
+	  $(SCONS) \
+	  $(GALERA_SCONS_OPTS)
+endef
+
+define GALERA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(@D)/$(GALERA_LIBNAME) $(TARGET_DIR)/usr/lib/$(GALERA_LIBNAME)
+	$(INSTALL) -m 755 $(@D)/$(GARBD) $(TARGET_DIR)/usr/bin/$(GARBD)
+	$(INSTALL) -D -m 644 package/galera/arbitrator.config $(TARGET_DIR)/etc/defaults
+endef
+
+GALERA_LICENSE = GPLv2
+GALERA_LICENSE_FILES = LICENSE COPYING
+
+$(eval $(generic-package))
-- 
1.9.1
