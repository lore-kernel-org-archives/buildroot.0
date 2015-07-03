From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri,  3 Jul 2015 15:11:22 +0200
Subject: [Buildroot] [PATCH 3/7] Add package galera: wsrep provider for
	mysql and mariadb
In-Reply-To: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1435929086-21205-4-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/Config.in                                  |  1 +
 package/galera/Config.in                           |  9 ++++
 ...lera-01-fix_sconstruct_for-crosscompiling.patch | 52 ++++++++++++++++++
 package/galera/galera.hash                         |  2 +
 package/galera/galera.mk                           | 63 ++++++++++++++++++++++
 5 files changed, 127 insertions(+)
 create mode 100644 package/galera/Config.in
 create mode 100644 package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
 create mode 100644 package/galera/galera.hash
 create mode 100644 package/galera/galera.mk

diff --git a/package/Config.in b/package/Config.in
index 72ec372..b15d026 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -740,6 +740,7 @@ menu "Database"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/leveldb/Config.in"
+	source "package/galera/Config.in"
 	source "package/mysql/Config.in"
 	source "package/postgresql/Config.in"
 	source "package/redis/Config.in"
diff --git a/package/galera/Config.in b/package/galera/Config.in
new file mode 100644
index 0000000..4c50427
--- /dev/null
+++ b/package/galera/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GALERA
+	bool "galera"
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CHECK
+	help
+	  Galera WSREP provider
+	  http://galeracluster.com/
diff --git a/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
new file mode 100644
index 0000000..25c9d59
--- /dev/null
+++ b/package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
@@ -0,0 +1,52 @@
+Fix cross compilation
+
+--- a/SConstruct	2015-05-28 12:23:41.027461788 +0200
++++ b/SConstruct	2015-07-02 11:27:55.763337287 +0200
+@@ -15,18 +15,17 @@
+ ####################################################################
+ 
+ import os
+-import platform
+ import string
+ 
+-sysname = os.uname()[0].lower()
+-machine = platform.machine()
+-bits = platform.architecture()[0]
++sysname = "linux"
++machine = os.environ['BR2_ARCH']
++bits = os.environ['BR2_x86']
+ print 'Host: ' + sysname + ' ' + machine + ' ' + bits
+ 
+ x86 = 0
+-if bits == '32bit':
++if bits == '32':
+     x86 = 32
+-elif bits == '64bit':
++elif bits == '64':
+     x86 = 64
+ 
+ 
+@@ -240,6 +239,15 @@
+ #
+ env.Append(LINKFLAGS = link_arch)
+ 
++# Cross-compilation
++
++if 'CROSS' in os.environ:
++        cross = os.environ['CROSS']
++        env.Append(CROSS = cross)
++        env.Replace(CC = cross + 'gcc')
++        env.Replace(CXX = cross + 'g++')
++        env.Replace(LD = cross + 'ld')
++
+ #
+ # Check required headers and libraries (autoconf functionality)
+ #
+@@ -405,7 +413,7 @@
+
+ # these will be used only with our softaware
+ if strict_build_flags == 1:
+-    conf.env.Append(CPPFLAGS = ' -Werror')
++    conf.env.Append(CPPFLAGS = ' -Werror -Wno-error=uninitialized -Wno-error=pedantic')
+     conf.env.Append(CCFLAGS  = ' -pedantic')
+     conf.env.Append(CXXFLAGS = ' -Weffc++ -Wold-style-cast')
diff --git a/package/galera/galera.hash b/package/galera/galera.hash
new file mode 100644
index 0000000..d3872e1
--- /dev/null
+++ b/package/galera/galera.hash
@@ -0,0 +1,2 @@
+# From http://releases.galeracluster.com/source/galera-3-25.3.10.tar.gz
+sha1   03f69fa87dc14fa4d793e7afab601e285c570809	galera-3-25.3.10.tar.gz
diff --git a/package/galera/galera.mk b/package/galera/galera.mk
new file mode 100644
index 0000000..755a2ae
--- /dev/null
+++ b/package/galera/galera.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# galera
+#
+################################################################################
+
+GALERA_VERSION = 3-25.3.10
+GALERA_SOURCE = galera-$(GALERA_VERSION).tar.gz
+GALERA_SITE = http://releases.galeracluster.com/source/
+
+GALERA_INSTALL_STAGING = NO
+GALERA_INSTALL_TARGET = YES
+
+GALERA_DEPENDENCIES = boost openssl check host-scons
+
+GALERA_LIBNAME = libgalera_smm.so
+
+GALERA_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) BR2_ARCH=$(BR2_ARCH)
+ifeq ($(BR2_x86_64),y)
+GALERA_SCONS_ENV += BR2_x86=64
+else ifeq ($(BR2_i386),y)
+GALERA_SCONS_ENV += BR2_x86=32
+else
+GALERA_SCONS_ENV += BR2_x86=0
+endif
+
+GALERA_SCONS_OPTS = \
+	prefix=/usr \
+	extra_sysroot=$(STAGING_DIR) \
+	tests=0
+
+GALERA_SCONS_ENV = $(TARGET_CONFIGURE_OPTS) BR2_ARCH=$(BR2_ARCH)
+ifeq ($(BR2_x86_64),y)
+GALERA_SCONS_ENV += BR2_x86=64
+else ifeq ($(BR2_i386),y)
+GALERA_SCONS_ENV += BR2_x86=32
+else
+GALERA_SCONS_ENV += BR2_x86=0
+endif
+
+GALERA_SCONS_OPTS = \
+	arch=$(BR2_ARCH) \
+	prefix=/usr \
+	extra_sysroot=$(STAGING_DIR) \
+	tests=0
+
+define GALERA_BUILD_CMDS
+        cd $(@D) && \
+	  $(GALERA_SCONS_ENV) \
+	  CROSS=$(TARGET_CROSS) \
+	  $(SCONS) \
+	  $(GALERA_SCONS_OPTS)
+endef
+
+define GALERA_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(@D)/$(GALERA_LIBNAME) $(TARGET_DIR)/usr/lib/$(GALERA_LIBNAME)
+endef
+
+GALERA_LICENSE = GPLv2
+GALERA_LICENSE_FILES = LICENSE COPYING
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
