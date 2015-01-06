From: Romain Naour <romain.naour@openwide.fr>
Date: Wed,  7 Jan 2015 00:06:03 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lockdev: handle static/shared
	only build
Message-ID: <1420585564-7921-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to install headers and static library separately.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: Headers must always be installed in staging,
    remove static library installation from install_dev target (ThomasP)
---
 ...stall-static-library-and-headers-separate.patch | 44 ++++++++++++++++++++++
 package/lockdev/lockdev.mk                         | 35 ++++++++++-------
 2 files changed, 66 insertions(+), 13 deletions(-)
 create mode 100644 package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch

diff --git a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch b/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
new file mode 100644
index 0000000..d5a498a
--- /dev/null
+++ b/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
@@ -0,0 +1,44 @@
+From 0dcd2368c3e23a5cc1cc4a979d9c241ed9302236 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 4 Jan 2015 16:06:07 +0100
+Subject: [PATCH] Makefile: install static library and headers separately
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e27dcbd..ecf52d1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -45,12 +45,10 @@ perl-lib:	static
+ 	cd LockDev && make OPTIMIZE="-O2 -g -Wall"
+ 	cd LockDev && make test
+ 
+-.PHONY: install install_dev install_dbg install_doc install_run 
+-install:	install_dev install_dbg install_doc install_run
++.PHONY: install install_dev install_dbg install_doc install_run install_static
++install:	install_dev install_dbg install_doc install_run install_static
+ 
+-install_dev:	${static} src/lockdev.h
+-	install -m755 -d	${libdir}
+-	install -m644 ${static}	${libdir}
++install_dev:	src/lockdev.h
+ 	install -m755 -d	${incdir}
+ 	install -m644 src/lockdev.h	${incdir}
+ 	install -m644 src/ttylock.h	${incdir}
+@@ -69,6 +67,10 @@ install_doc:	docs/lockdev.3
+ 	install -m755 -d	${mandir}/man3
+ 	install -m644 docs/lockdev.3	${mandir}/man3
+ 
++install_static:	${static}
++	install -m755 -d	${libdir}
++	install -m644 ${static}	${libdir}
++
+ install_run:	${shared}
+ 	install -m755 -d	${libdir}
+ 	install -m644 ${shared}	${libdir}
+-- 
+1.9.3
+
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
index 59561ba..11142e6 100644
--- a/package/lockdev/lockdev.mk
+++ b/package/lockdev/lockdev.mk
@@ -13,30 +13,39 @@ LOCKDEV_LICENSE_FILES = LICENSE
 LOCKDEV_INSTALL_STAGING = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
-define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static
+LOCKDEV_BUILD_ARGS = static
+LOCKDEV_INSTALL_ARGS = install_static
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LOCKDEV_BUILD_ARGS = static shared
+LOCKDEV_INSTALL_ARGS = install_run install_static
+else # BR2_SHARED_LIBS
+LOCKDEV_BUILD_ARGS = shared
+LOCKDEV_INSTALL_ARGS = install_run
+endif
+
+ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
+define LOCKDEV_CREATE_LINKS_STAGING
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
 endef
 
-define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev
+define LOCKDEV_CREATE_LINKS_TARGET
+	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
 endef
-
-else # BR2_STATIC_LIBS
+endif
 
 define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) static shared
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LOCKDEV_BUILD_ARGS)
 endef
 
 define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) install_dev install_run
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.1
+	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS) install_dev
+	$(LOCKDEV_CREATE_LINKS_STAGING)
 endef
 
 define LOCKDEV_INSTALL_TARGET_CMDS
-	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) install_run
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.1
+	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
+	$(LOCKDEV_CREATE_LINKS_TARGET)
 endef
-endif # BR2_STATIC_LIBS
 
 $(eval $(generic-package))
-- 
1.9.3
