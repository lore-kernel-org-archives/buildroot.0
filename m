From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Jul 2014 21:41:05 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix static only build
Message-ID: <1404848465-25296-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit makes dvb-apps behave properly in a static-only build. It
passes the static=1 variable to the Makefile, and adds a patch that
fixes the Makefile to not build .so libraries when static=1.

Fixes:

  http://autobuild.buildroot.org/results/3db/3dbfa7b692d4b123b3ba6b55c84df12818273554/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../dvb-apps-0003-support-static-only-build.patch    | 20 ++++++++++++++++++++
 package/dvb-apps/dvb-apps.mk                         | 13 ++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 package/dvb-apps/dvb-apps-0003-support-static-only-build.patch

diff --git a/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch b/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
new file mode 100644
index 0000000..236f1a3
--- /dev/null
+++ b/package/dvb-apps/dvb-apps-0003-support-static-only-build.patch
@@ -0,0 +1,20 @@
+Make.rules: don't build .so libraries when static=1
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Make.rules
+===================================================================
+--- a/Make.rules
++++ b/Make.rules
+@@ -9,7 +9,11 @@
+ CFLAGS_LIB ?= -fPIC
+ CFLAGS += $(CFLAGS_LIB)
+ 
++ifeq ($(static),1)
++libraries = $(lib_name).a
++else
+ libraries = $(lib_name).so $(lib_name).a
++endif
+ 
+ .PHONY: library
+ 
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
index 98ff7eb..edf88f3 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -15,19 +15,26 @@ DVB_APPS_DEPENDENCIES = libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
+DVB_APPS_MAKE_OPTS = V=1
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+DVB_APPS_MAKE_OPTS += static=1
+endif
+
 DVB_APPS_INSTALL_STAGING = YES
 
 define DVB_APPS_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
-		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) V=1
+		$(MAKE) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
+		$(DVB_APPS_MAKE_OPTS)
 endef
 
 define DVB_APPS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) V=1 DESTDIR=$(STAGING_DIR) install
+	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
 endef
 
 define DVB_APPS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) V=1 DESTDIR=$(TARGET_DIR) install
+	$(MAKE) -C $(@D) $(DVB_APPS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.0.0
