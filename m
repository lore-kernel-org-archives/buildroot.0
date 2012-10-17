From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 17 Oct 2012 15:08:17 +0100
Subject: [Buildroot] [PATCH] lcdapi: new package
Message-ID: <1350482898-5980-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/lcdapi/Config.in                           |   11 +++
 package/lcdapi/lcdapi-fix-Makefile.patch           |   25 +++++++
 .../lcdapi-fix-missing-cstdlib-includes.patch      |   22 ++++++
 .../lcdapi-fix-missing-cstring-includes.patch      |   15 ++++
 package/lcdapi/lcdapi-make-toString-static.patch   |   19 +++++
 package/lcdapi/lcdapi.mk                           |   73 ++++++++++++++++++++
 7 files changed, 166 insertions(+)
 create mode 100644 package/lcdapi/Config.in
 create mode 100644 package/lcdapi/lcdapi-fix-Makefile.patch
 create mode 100644 package/lcdapi/lcdapi-fix-missing-cstdlib-includes.patch
 create mode 100644 package/lcdapi/lcdapi-fix-missing-cstring-includes.patch
 create mode 100644 package/lcdapi/lcdapi-make-toString-static.patch
 create mode 100644 package/lcdapi/lcdapi.mk

diff --git a/package/Config.in b/package/Config.in
index d7b3db6..8e2f188 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -385,6 +385,7 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
+source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
diff --git a/package/lcdapi/Config.in b/package/lcdapi/Config.in
new file mode 100644
index 0000000..cb97a49
--- /dev/null
+++ b/package/lcdapi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LCDAPI
+	bool "lcdapi"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  C++ client API for lcdproc, containing a set of widget classes.
+
+	  http://www.c-sait.net/lcdapi/
+
+comment "lcdapi requires a toolchain with C++ and thread support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lcdapi/lcdapi-fix-Makefile.patch b/package/lcdapi/lcdapi-fix-Makefile.patch
new file mode 100644
index 0000000..1c619d5
--- /dev/null
+++ b/package/lcdapi/lcdapi-fix-Makefile.patch
@@ -0,0 +1,25 @@
+Fix a presumed typo in the Makfile: $(INC_FLAGS) should be $(INCFLAGS), it
+would appear.
+
+Also link against the stdc++ and pthread libraries explicitly.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/Makefile b/Makefile
+--- a/Makefile	2004-07-27 19:06:27.000000000 +0100
++++ b/Makefile	2012-10-01 09:15:52.385986229 +0100
+@@ -64,12 +64,12 @@ deliver: clean doc_clean
+ 
+ $(LIB_TARGET): $(LIB_OBJS)
+ 	@$(MKDIR) $(LIB_DIR)
+-	$(LD) $(LDFLAGS) -o $(LIB_TARGET) $(LIB_OBJS)
++	$(LD) $(LDFLAGS) -o $(LIB_TARGET) $(LIB_OBJS) -lstdc++ -lpthread
+ 
+ 
+ $(OBJ_DIR)/%.o: %.cpp
+ 	@$(MKDIR) $(OBJ_DIR)/api $(OBJ_DIR)/sensors $(OBJ_DIR)/keys
+-	$(CC) $(CFLAGS) $(INC_FLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(INCFLAGS) -c -o $@ $<
+ 
+ 
+ # DO NOT DELETE
diff --git a/package/lcdapi/lcdapi-fix-missing-cstdlib-includes.patch b/package/lcdapi/lcdapi-fix-missing-cstdlib-includes.patch
new file mode 100644
index 0000000..c47aee0
--- /dev/null
+++ b/package/lcdapi/lcdapi-fix-missing-cstdlib-includes.patch
@@ -0,0 +1,22 @@
+Add some missing include directives for the cstdlib header.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/api/LCDBar.cpp b/api/LCDBar.cpp
+--- a/api/LCDBar.cpp	2004-07-27 19:06:27.000000000 +0100
++++ b/api/LCDBar.cpp	2012-10-01 08:18:37.570139543 +0100
+@@ -1,4 +1,5 @@
+ #include "LCDBar.h"
++#include <cstdlib>
+ #include <sstream>
+ #include <stdlib.h>
+ 
+diff -Nurp a/api/LCDBigNumber.cpp b/api/LCDBigNumber.cpp
+--- a/api/LCDBigNumber.cpp	2004-07-27 19:06:27.000000000 +0100
++++ b/api/LCDBigNumber.cpp	2012-10-01 08:18:13.066140468 +0100
+@@ -1,4 +1,5 @@
+ #include "LCDBigNumber.h"
++#include <cstdlib>
+ #include <sstream>
+ #include <string>
+ 
diff --git a/package/lcdapi/lcdapi-fix-missing-cstring-includes.patch b/package/lcdapi/lcdapi-fix-missing-cstring-includes.patch
new file mode 100644
index 0000000..8d5dffc
--- /dev/null
+++ b/package/lcdapi/lcdapi-fix-missing-cstring-includes.patch
@@ -0,0 +1,15 @@
+Add some missing include directives for the cstring header.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/sensors/LCDSensor.cpp b/sensors/LCDSensor.cpp
+--- a/sensors/LCDSensor.cpp	2004-07-27 19:06:27.000000000 +0100
++++ b/sensors/LCDSensor.cpp	2012-10-01 08:43:13.726073554 +0100
+@@ -2,6 +2,7 @@
+ #include "LCDUtils.h"
+ #include "LCDSensor.h"
+ 
++#include <cstring>
+ #include <string>
+ #include <stdio.h>
+ #include <unistd.h>
diff --git a/package/lcdapi/lcdapi-make-toString-static.patch b/package/lcdapi/lcdapi-make-toString-static.patch
new file mode 100644
index 0000000..0ef95fc
--- /dev/null
+++ b/package/lcdapi/lcdapi-make-toString-static.patch
@@ -0,0 +1,19 @@
+make the toString function defined in the LCDCallback.h header into a static
+function, to fix link-time errors like the following.
+
+  multiple definition of `toString(char)'
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/keys/LCDCallback.h b/keys/LCDCallback.h
+--- a/keys/LCDCallback.h	2004-07-27 19:06:27.000000000 +0100
++++ b/keys/LCDCallback.h	2012-10-01 10:59:52.685708010 +0100
+@@ -77,7 +77,7 @@ class LCDCallback
+ 
+ typedef std::map<KeyEvent, LCDCallback *> CallbackMap;
+ 
+-std::string toString(KeyEvent t)
++static std::string toString(KeyEvent t)
+ {
+   std::string s(1, (char)t);
+   return s;
diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
new file mode 100644
index 0000000..37e276c
--- /dev/null
+++ b/package/lcdapi/lcdapi.mk
@@ -0,0 +1,73 @@
+#############################################################
+#
+# lcdapi
+#
+#############################################################
+LCDAPI_VERSION = 0.2
+LCDAPI_SITE = ftp://ftp2.c-sait.net/csait
+LCDAPI_DEPENDENCIES = host-lcdapi
+LCDAPI_INSTALL_STAGING = YES
+
+LCDAPI_LICENSE = LGPLv2.1+
+LCDAPI_LICENSE_FILES = COPYING
+
+LCDAPI_MAKE_OPT = \
+	$(TARGET_CONFIGURE_OPTS) \
+	LD="$(TARGET_CXX)" \
+	LDFLAGS="$(TARGET_LDFLAGS) -shared"
+
+HOST_LCDAPI_MAKE_OPT = \
+	$(HOST_CONFIGURE_OPTS) \
+	LD="$(HOSTCXX)" \
+	LDFLAGS="$(HOST_LDFLAGS) -shared"
+
+define LCDAPI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LCDAPI_MAKE_OPT) -C $(@D)
+endef
+
+define HOST_LCDAPI_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_LCDAPI_MAKE_OPT) -C $(@D)
+endef
+
+define DO_LCDAPI_INSTALL
+	$(INSTALL) -m 0755 -d $(1)/usr/lib
+	$(INSTALL) -m 0755 -t $(1)/usr/lib $(@D)/lib/liblcdapi.so
+	$(INSTALL) -m 0755 -d $(1)/usr/include/lcdapi
+	for i in api include keys sensors; do \
+		$(INSTALL) -m 0755 -d $(1)/usr/include/lcdapi/$$i && \
+		$(INSTALL) -m 0644 -t $(1)/usr/include/lcdapi/$$i \
+			$(@D)/$$i/*.h; \
+	done
+endef
+
+define DO_LCDAPI_UNINSTALL
+	$(RM) $(1)/usr/lib/liblcdapi.so
+	$(RM) -r $(1)/usr/include/lcdapi
+endef
+
+define HOST_LCDAPI_INSTALL_CMDS
+	$(call DO_LCDAPI_INSTALL,$(HOST_DIR))
+endef
+
+define LCDAPI_INSTALL_STAGING_CMDS
+	$(call DO_LCDAPI_INSTALL,$(STAGING_DIR))
+endef
+
+define LCDAPI_INSTALL_TARGET_CMDS
+	$(call DO_LCDAPI_INSTALL,$(TARGET_DIR))
+endef
+
+define LCDAPI_UNINSTALL_STAGING_CMDS
+	$(call DO_LCDAPI_UNINSTALL,$(STAGING_DIR))
+endef
+
+define LCDAPI_UNINSTALL_TARGET_CMDS
+	$(call DO_LCDAPI_UNINSTALL,$(TARGET_DIR))
+endef
+
+define LCDAPI_CLEAN_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(LCDAPI_MAKE_OPT) -C $(@D) clean
+endef
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.7.9.5
