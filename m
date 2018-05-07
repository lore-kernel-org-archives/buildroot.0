From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Mon,  7 May 2018 14:10:30 +0200
Subject: [Buildroot] [RFC PATCH v2] annobin: New package
In-Reply-To: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
References: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
Message-ID: <20180507121032.25794-2-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in.host         |  1 +
 package/annobin/Config.in.host | 13 ++++++++++++
 package/annobin/annobin.hash   |  2 ++
 package/annobin/annobin.mk     | 37 ++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/annobin/Config.in.host
 create mode 100644 package/annobin/annobin.hash
 create mode 100644 package/annobin/annobin.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 24d134cb70..edf432443c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,7 @@ F:	package/yasm/
 F:	package/zlib-ng/
 
 N:	Stefan S?rensen <stefan.sorensen@spectralink.com>
+F:	package/annobin/
 F:	package/cracklib/
 F:	package/libpwquality/
 F:	package/libscrypt/
diff --git a/package/Config.in.host b/package/Config.in.host
index a8a4c1f802..672025757a 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -2,6 +2,7 @@ menu "Host utilities"
 
 	source "package/aespipe/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/annobin/Config.in.host"
 	source "package/cargo/Config.in.host"
 	source "package/cbootimage/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
diff --git a/package/annobin/Config.in.host b/package/annobin/Config.in.host
new file mode 100644
index 0000000000..8bf2c86cb1
--- /dev/null
+++ b/package/annobin/Config.in.host
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HOST_ANNOBIN
+	bool "annobin"
+	help
+	  A plugin for GCC that records extra information in the files
+	  that it compiles, and a set of scripts that analyze the
+	  recorded information.  These scripts can determine things
+	  ABI clashes in compiled binaries, or the absence of required
+	  hardening options
+
+	  Enabling this will slightly (1-2%) increase the size of
+	  built binaries.
+
+	  https://developers.redhat.com/blog/2018/02/20/annobin-storing-information-binaries/
diff --git a/package/annobin/annobin.hash b/package/annobin/annobin.hash
new file mode 100644
index 0000000000..0340e55291
--- /dev/null
+++ b/package/annobin/annobin.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	176a8588088af40361f14415c2a1dfaae0723c46cd6df7765605090d6c4cea49  annobin-5.6.tar.xz
diff --git a/package/annobin/annobin.mk b/package/annobin/annobin.mk
new file mode 100644
index 0000000000..32a5d4b6f0
--- /dev/null
+++ b/package/annobin/annobin.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# annobin
+#
+################################################################################
+
+ANNOBIN_VERSION = 5.6
+ANNOBIN_SOURCE = annobin-$(ANNOBIN_VERSION).tar.xz
+ANNOBIN_SITE = https://nickc.fedorapeople.org
+
+HOST_ANNOBIN_DEPENDENCIES += toolchain
+
+# The plugin has to be configured with the same arcane configure
+# scripts used by gcc, this prevents regeneration of the scripts.
+define ANNOBIN_PRE_CONFIGURE_FIXUP
+	(cd $(@D); touch aclocal.m4 plugin/config.h.in configure */configure \
+		Makefile.in */Makefile.in)
+endef
+
+HOST_ANNOBIN_PRE_CONFIGURE_HOOKS += ANNOBIN_PRE_CONFIGURE_FIXUP
+
+# If using a pre-installed external toolchain, we cannot install the plugin in
+# the standard location, so provide our own and put the include path from the
+# standard location in CXX_FLAGS.
+HOST_ANNOBIN_PLUGIN_DIR = $(HOST_DIR)/lib/gcc/plugin/annobin
+HOST_ANNOBIN_CXXFLAGS = $(HOST_CXXFLAGS) -I$(shell $(TARGET_CC) --print-file-name=plugin)/include
+
+# The host and target options are mixed up, so override the defaults
+HOST_ANNOBIN_CONF_OPTS = \
+	--build=$(GNU_HOST_NAME) \
+	--host=$(GNU_TARGET_NAME) \
+	--with-gcc-plugin-dir=$(HOST_ANNOBIN_PLUGIN_DIR) \
+	CXXFLAGS="$(HOST_ANNOBIN_CXXFLAGS)"
+
+HOST_ANNOBIN_GCC_PLUGIN=$(HOST_ANNOBIN_PLUGIN_DIR)/annobin.so
+
+$(eval $(host-autotools-package))
-- 
2.17.0
