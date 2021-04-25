From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Apr 2021 19:22:23 +0200
Subject: [Buildroot] [PATCH v4,2/2] package/snort3: new package
In-Reply-To: <20210425172223.3091025-1-fontaine.fabrice@gmail.com>
References: <20210425172223.3091025-1-fontaine.fabrice@gmail.com>
Message-ID: <20210425172223.3091025-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Snort 3 is the next generation Snort IPS (Intrusion
Prevention System).

 - Support multiple packet processing threads
 - Shared configuration and attribute table
 - Use a simple, scriptable configuration
 - Make key components pluggable
 - Autodetect services for portless configuration
 - Support sticky buffers in rules
 - Autogenerate reference documentation
 - Provide better cross platform support

https://www.snort.org/snort3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v3 -> v4:
 - Bump to latest upstream version
 - Add new flex dependency

Changes v2 -> v3 (after review of Heiko Thiery):
 - Bump to latest upstream version (and so drop patches)
 - Update indentation of hash file to two spaces)

Changes v1 -> v2:
 - Fix duplicate "depends on" error in Config.in

 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/snort3/Config.in   | 42 ++++++++++++++++++++++++++++
 package/snort3/snort3.hash |  6 ++++
 package/snort3/snort3.mk   | 57 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 107 insertions(+)
 create mode 100644 package/snort3/Config.in
 create mode 100644 package/snort3/snort3.hash
 create mode 100644 package/snort3/snort3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 664337561f..a72ddc9740 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -905,6 +905,7 @@ F:	package/python-yatl/
 F:	package/rocksdb/
 F:	package/rygel/
 F:	package/safeclib/
+F:	package/snort3/
 F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
diff --git a/package/Config.in b/package/Config.in
index c30a1603e3..c3379b2376 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2279,6 +2279,7 @@ endif
 	source "package/sngrep/Config.in"
 	source "package/snmpclitools/Config.in"
 	source "package/snort/Config.in"
+	source "package/snort3/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
 	source "package/softether/Config.in"
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
new file mode 100644
index 0000000000..75923c3c20
--- /dev/null
+++ b/package/snort3/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_SNORT3
+	bool "snort3"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # daq3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # hwloc
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_DAQ3
+	select BR2_PACKAGE_FLEX
+	select BR2_PACKAGE_HWLOC
+	select BR2_PACKAGE_LIBDNET
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  Snort 3 is the next generation Snort IPS (Intrusion
+	  Prevention System).
+
+	  - Support multiple packet processing threads
+	  - Shared configuration and attribute table
+	  - Use a simple, scriptable configuration
+	  - Make key components pluggable
+	  - Autodetect services for portless configuration
+	  - Support sticky buffers in rules
+	  - Autogenerate reference documentation
+	  - Provide better cross platform support
+
+	  https://www.snort.org/snort3
+
+comment "snort3 needs a toolchain w/ C++, wchar, threads, dynamic library, gcc >= 4.9"
+	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
+	depends on !(BR2_PACKAGE_DAQ || BR2_PACKAGE_SNORT)
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/snort3/snort3.hash b/package/snort3/snort3.hash
new file mode 100644
index 0000000000..48eddd74c9
--- /dev/null
+++ b/package/snort3/snort3.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  a68af8ea46a038dfb0ad489e8d11dee62a3e63cb4a639f6bb4fac4ded955fe11  snort3-3.1.4.0.tar.gz
+
+# Hash for license files:
+sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
+sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort3/snort3.mk b/package/snort3/snort3.mk
new file mode 100644
index 0000000000..1c49da8ec0
--- /dev/null
+++ b/package/snort3/snort3.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# snort3
+#
+################################################################################
+
+SNORT3_VERSION = 3.1.4.0
+SNORT3_SITE = $(call github,snort3,snort3,$(SNORT3_VERSION))
+SNORT3_LICENSE = GPL-2.0
+SNORT3_LICENSE_FILES = COPYING LICENSE
+
+SNORT3_DEPENDENCIES = \
+	host-pkgconf daq3 flex hwloc libdnet libpcap luajit openssl pcre zlib
+
+SNORT3_CONF_OPTS = \
+	-DENABLE_GDB=OFF \
+	-DENABLE_STATIC_DAQ=OFF \
+	-DMAKE_DOC=OFF
+
+ifeq ($(BR2_PACKAGE_FLATBUFFERS),y)
+SNORT3_DEPENDENCIES += flatbuffers
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_FLATBUFFERS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBICONV),y)
+SNORT3_DEPENDENCIES += libiconv
+SNORT3_CONF_OPTS += -DHAVE_ICONV=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+SNORT3_DEPENDENCIES += libtirpc
+endif
+
+ifeq ($(BR2_PACKAGE_SAFECLIB),y)
+SNORT3_DEPENDENCIES += safeclib
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=ON
+else
+SNORT3_CONF_OPTS += -DENABLE_SAFEC=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
+SNORT3_DEPENDENCIES += util-linux
+SNORT3_CONF_OPTS += -DHAVE_UUID=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_UUID=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+SNORT3_DEPENDENCIES += xz
+SNORT3_CONF_OPTS += -DHAVE_LZMA=ON
+else
+SNORT3_CONF_OPTS += -DHAVE_LZMA=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.30.2
