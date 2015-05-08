From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Fri,  8 May 2015 14:27:48 +1000
Subject: [Buildroot] [PATCH 1/2] librtas: new package
In-Reply-To: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
References: <cover.1431059241.git.sam.bobroff@au1.ibm.com>
Message-ID: <780e48cca88c90480b3b038c5965e52db284d403.1431059241.git.sam.bobroff@au1.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
---
 package/Config.in                          |    1 +
 package/librtas/Config.in                  |    9 +++++++++
 package/librtas/librtas.mk                 |   27 +++++++++++++++++++++++++++
 package/librtas/missing-librtas.so.1.patch |   11 +++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 package/librtas/Config.in
 create mode 100644 package/librtas/librtas.mk
 create mode 100644 package/librtas/missing-librtas.so.1.patch

diff --git a/package/Config.in b/package/Config.in
index af4d2b7..51de1c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -832,6 +832,7 @@ menu "Hardware handling"
 	source "package/libphidget/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
+	source "package/librtas/Config.in"
 	source "package/librtlsdr/Config.in"
 	source "package/libserial/Config.in"
 	source "package/libserialport/Config.in"
diff --git a/package/librtas/Config.in b/package/librtas/Config.in
new file mode 100644
index 0000000..bf0a705
--- /dev/null
+++ b/package/librtas/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBRTAS
+	bool "librtas"
+	depends on BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	help
+	  The librtas package provides an interface for Run-Time Abstraction
+	  Services (RTAS) calls on PAPR platforms. The libraries allow users to
+	  examine and manipulate hardware, and parse RTAS events.
+
+	  http://librtas.sourceforge.net/
diff --git a/package/librtas/librtas.mk b/package/librtas/librtas.mk
new file mode 100644
index 0000000..d13c876
--- /dev/null
+++ b/package/librtas/librtas.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# librtas
+#
+################################################################################
+
+LIBRTAS_VERSION = 1.3.13
+LIBRTAS_SITE = http://downloads.sourceforge.net/project/librtas
+LIBRTAS_LICENSE = Common Public License Version 1.0
+LIBRTAS_LICENSE_FILES = COPYRIGHT
+LIBRTAS_INSTALL_STAGING = YES
+LIBRTAS_INSTALL_TARGET = YES
+
+define LIBRTAS_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
+endef
+
+define LIBRTAS_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
+endef
+
+define LIBRTAS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+
+$(eval $(generic-package))
diff --git a/package/librtas/missing-librtas.so.1.patch b/package/librtas/missing-librtas.so.1.patch
new file mode 100644
index 0000000..de21d66
--- /dev/null
+++ b/package/librtas/missing-librtas.so.1.patch
@@ -0,0 +1,11 @@
+diff -purN librtas-1.3.12.orig/librtas_src/Makefile librtas-1.3.12/librtas_src/Makefile
+--- librtas-1.3.12.orig/librtas_src/Makefile	2015-04-09 10:45:19.772381633 +1000
++++ librtas-1.3.12/librtas_src/Makefile	2015-04-09 10:45:57.968604762 +1000
+@@ -33,6 +33,7 @@ install:
+ 	@$(call install_lib,$(LIBRTAS),$(DESTDIR))
+ 	@$(call install_inc,$(HEADERS),$(DESTDIR))
+ 	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME)
++	@ln -sf $(LIBRTAS) $(DESTDIR)/$(LIB_DIR)$(call is_lib64,$(LIBRTAS))/$(LIBRTAS_SONAME).1
+ 
+ uninstall:
+ 	@$(call uninstall_lib,$(LIBRTAS),$(DESTDIR))
-- 
1.7.10.4
