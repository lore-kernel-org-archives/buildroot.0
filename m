From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  5 Jul 2016 21:05:20 +0200
Subject: [Buildroot] [V2] 4th: new package
Message-ID: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/4th/0001-avoid-regen-during-install.patch | 17 ++++++
 package/4th/4th.hash                              |  2 +
 package/4th/4th.mk                                | 64 +++++++++++++++++++++++
 package/4th/Config.in                             |  8 +++
 package/Config.in                                 |  1 +
 5 files changed, 92 insertions(+)
 create mode 100644 package/4th/0001-avoid-regen-during-install.patch
 create mode 100644 package/4th/4th.hash
 create mode 100644 package/4th/4th.mk
 create mode 100644 package/4th/Config.in

diff --git a/package/4th/0001-avoid-regen-during-install.patch b/package/4th/0001-avoid-regen-during-install.patch
new file mode 100644
index 0000000..436cff1
--- /dev/null
+++ b/package/4th/0001-avoid-regen-during-install.patch
@@ -0,0 +1,17 @@
+avoid regen during install
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+
+--- a/sources/Makefile
++++ b/sources/Makefile
+@@ -120,7 +120,7 @@
+ 	ln -sf $(SHARED_LIB) $(LIBRARIES)/lib4th.so
+ endif
+ 
+-mostlyinstall: libinstall all
++mostlyinstall: libinstall
+ 	cp 4th 4tsh pp4th $(BINARIES)
+ 
+ install: mostlyinstall
+-- 
+
diff --git a/package/4th/4th.hash b/package/4th/4th.hash
new file mode 100644
index 0000000..97083da
--- /dev/null
+++ b/package/4th/4th.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  1c7adbb1a56dad4c4c781e6e023d77ac862842560c05246b691d07e9a4460ab2  4th-3.62.4-unix.tar.gz
diff --git a/package/4th/4th.mk b/package/4th/4th.mk
new file mode 100644
index 0000000..0e7015f
--- /dev/null
+++ b/package/4th/4th.mk
@@ -0,0 +1,64 @@
+################################################################################
+#
+# 4th
+#
+################################################################################
+
+4TH_VERSION = 3.62.4
+4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
+4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
+4TH_LICENSE = GPLv3, LGPLv3
+4TH_LICENSE_FILES = COPYING
+4TH_DEPENDENCIES = host-4th
+4TH_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+4TH_MAKE_ENV = STATIC=1
+else
+4TH_MAKE_ENV = SHARED=1
+endif
+
+define 4TH_BUILD_CMDS
+	$(4TH_MAKE_ENV) \
+	$(MAKE) -C $(@D)/sources all \
+		CROSS=$(TARGET_CROSS) \
+		CFLAGS="$(TARGET_CFLAGS) -DUNIX -fsigned-char" \
+		FOURTH=$(HOST_DIR)/usr/bin/4th
+endef
+
+define 4TH_INSTALL_STAGING_CMDS
+	$(4TH_MAKE_ENV) \
+	$(MAKE) -C $(@D)/sources libinstall \
+		LIBRARIES=$(STAGING_DIR)/usr/lib
+	$(INSTALL) -D -m 0644 $(@D)/sources/4th.h \
+		$(STAGING_DIR)/usr/include/4th.h
+endef
+
+define 4TH_INSTALL_TARGET_CMDS
+	$(4TH_MAKE_ENV) \
+	$(MAKE) -C $(@D)/sources mostlyinstall \
+		BINARIES=$(TARGET_DIR)/usr/bin \
+		LIBRARIES=$(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/share/4th/lib
+	cp -dpf $(@D)/4th/*.4th $(TARGET_DIR)/usr/share/4th
+	cp -dpf $(@D)/4th/lib/*.4th $(TARGET_DIR)/usr/share/4th/lib
+	mkdir -p $(TARGET_DIR)/usr/share/4th/demo
+	cp -dpf $(@D)/4th/demo/*.4th $(TARGET_DIR)/usr/share/4th/demo
+	mkdir -p $(TARGET_DIR)/usr/share/4th/4pp/lib
+	cp -dpf $(@D)/4th/4pp/*.4pp $(TARGET_DIR)/usr/share/4th/4pp
+	cp -dpf $(@D)/4th/4pp/lib/*.4pp $(TARGET_DIR)/usr/share/4th/4pp/lib
+endef
+
+define HOST_4TH_BUILD_CMDS
+	$(MAKE) -C $(@D)/sources all \
+		CFLAGS="$(HOST_CFLAGS) -DUNIX -fsigned-char"
+endef
+
+define HOST_4TH_INSTALL_CMDS
+	$(MAKE) -C $(@D)/sources mostlyinstall \
+		BINARIES=$(HOST_DIR)/usr/bin \
+		LIBRARIES=$(HOST_DIR)/usr/lib
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
diff --git a/package/4th/Config.in b/package/4th/Config.in
new file mode 100644
index 0000000..51f85de
--- /dev/null
+++ b/package/4th/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_4TH
+	bool "4th"
+	help
+	  4tH is a Forth compiler that can create bytecode, C-embeddable
+	  bytecode, standalone executables, but also works fine as a scripting
+	  language
+
+	  http://thebeez.home.xs4all.nl/4tH/
diff --git a/package/Config.in b/package/Config.in
index bffb043..eb9250a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -477,6 +477,7 @@ endif
 endmenu
 
 menu "Interpreter languages and scripting"
+	source "package/4th/Config.in"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
 if BR2_PACKAGE_ERLANG
-- 
1.9.1
