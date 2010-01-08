From: Clark Rawlins <clark.rawlins@escient.com>
Date: Thu, 07 Jan 2010 20:28:21 -0500
Subject: [Buildroot] [PATCH] Support the Adaptave Computing Environment (ACE)
Message-ID: <1262914101.8052.98.camel@venture>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds support for the Adaptave Computing
Environment (ACE) libraries.

Signed-off-by: Clark Rawlins <clark.rawlins@escient.com>
---
 package/Config.in     |    1 +
 package/ace/Config.in |    7 +++++++
 package/ace/ace.mk    |   44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/ace/Config.in
 create mode 100644 package/ace/ace.mk

diff --git a/package/Config.in b/package/Config.in
index 6adf913..57a6a19 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -49,6 +49,7 @@ source "package/pcre/Config.in"
 
 comment "Other stuff"
 source "package/at/Config.in"
+source "package/ace/Config.in"
 source "package/beecrypt/Config.in"
 source "package/berkeleydb/Config.in"
 source "package/bsdiff/Config.in"
diff --git a/package/ace/Config.in b/package/ace/Config.in
new file mode 100644
index 0000000..1444d10
--- /dev/null
+++ b/package/ace/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ACE
+	bool "ace"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  The ADAPTIVE Communication Environment (ACE(TM)) 
+	  An OO Network Programming Toolkit in C++. 
+	  See http://www.cs.wustl.edu/~schmidt/ACE.html
diff --git a/package/ace/ace.mk b/package/ace/ace.mk
new file mode 100644
index 0000000..e15cf61
--- /dev/null
+++ b/package/ace/ace.mk
@@ -0,0 +1,44 @@
+#############################################################
+#
+# ace
+#
+#############################################################
+ACE_VERSION=5.7.5
+ACE_SOURCE=ACE+TAO+CIAO-$(ACE_VERSION).tar.gz
+ACE_SITE=http://download.dre.vanderbilt.edu/previous_versions/
+ACE_BINARY=libACE.so
+ACE_TARGET_BINARY=usr/lib/$(ACE_BINARY)
+ACE_DEPENDENCIES=openssl
+
+define ACE_CONFIGURE_CMDS
+	ln -fs $(@D)/ace/config-linux.h $(@D)/ace/config.h
+	ln -fs $(@D)/include/makeinclude/platform_linux.GNU \
+		$(@D)/include/makeinclude/platform_macros.GNU
+endef
+
+define ACE_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) ACE_ROOT=$(@D) -C $(@D)/ace all 
+endef
+
+define ACE_INSTALL_STAGING_CMDS
+	install -d $(STAGING_DIR)/usr/include/ace
+	install -d $(STAGING_DIR)/usr/lib
+	cd $(@D) && find ace -type d \
+		-exec mkdir -p $(STAGING_DIR)/usr/include/\{\} \;
+	cd $(@D) && find ace -name '*.h' -or -name '*.inl' -or -name '*.cpp' \
+		-exec cp \{\} $(STAGING_DIR)/usr/include/\{\} \;
+	cp $(@D)/lib/*.so* $(STAGING_DIR)/usr/lib
+endef
+
+define ACE_INSTALL_TARGET_CMDS
+	install -d $(TARGET_DIR)/usr/lib/
+	cp -dpf $(@D)/lib/*.so* $(TARGET_DIR)/usr/lib/
+	-$(TARGET_STRIP) --strip-unneeded $(TARGET_DIR)/usr/lib/libACE*.so*
+endef
+
+define ACE_CLEAN_CMDS
+	rm -f $(TARGET_DIR)/usr/lib/libACE*.so*
+	-$(MAKE) -C $(@D)/ace clean
+endef
+
+$(eval $(call GENTARGETS,package,ace))
-- 
1.6.3.3
