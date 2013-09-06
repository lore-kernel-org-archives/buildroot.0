From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 5 Sep 2013 20:04:24 -0500
Subject: [Buildroot] [PATCH 10/10] busybox: add support for SELinux
In-Reply-To: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1378429464-12546-11-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding support to build libselinux before busybox if libselinux is selected.
Busybox needs the headers to compile correctly if SELinux support is enabled
in the busybox configuration.

Adding patch to fix issue with busybox not properly pulling in libraries.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 .../busybox/1.21.1/busybox-1.21.1-pkg-config.patch |   13 +++++++++++++
 package/busybox/busybox.mk                         |    6 ++++++
 2 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch

diff --git a/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch b/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch
new file mode 100644
index 0000000..79b8681
--- /dev/null
+++ b/package/busybox/1.21.1/busybox-1.21.1-pkg-config.patch
@@ -0,0 +1,13 @@
+# Need to have the pkg-config only spit out the libs and not the lib path
+# also when checking for the SELinux libraries.
+--- a/Makefile.flags	2013-05-11 18:30:43.000000000 -0500
++++ b/Makefile.flags	2013-08-27 09:40:05.082917005 -0500
+@@ -81,7 +81,7 @@
+ # Usage: $(eval $(call pkg_check_modules,VARIABLE-PREFIX,MODULES))
+ define pkg_check_modules
+ $(1)_CFLAGS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --cflags $(2))
+-$(1)_LIBS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs $(2))
++$(1)_LIBS := $(shell $(PKG_CONFIG) $(PKG_CONFIG_FLAGS) --libs-only-l $(2))
+ endef
+ 
+ ifeq ($(CONFIG_BUILD_LIBBUSYBOX),y)
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index ad8bdaf..fd24ffd 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -31,6 +31,12 @@ BUSYBOX_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
 BUSYBOX_CFLAGS_busybox += -ltirpc
 endif
 
+# For SELinux, enable the SELinux flag CONFIG_SELINUX
+# in the busybox config
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+BUSYBOX_DEPENDENCIES += libselinux
+endif
+
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = \
-- 
1.7.1
