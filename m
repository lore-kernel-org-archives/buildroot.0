From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 8 Jul 2014 23:33:10 +0200
Subject: [Buildroot] [git commit] dvb-apps: fix static only build
Message-ID: <20140708222427.CC2169D1D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48d648a0890461ec4fc5a2b05cb227e6cab3591a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit makes dvb-apps behave properly in a static-only build. It
passes the static=1 variable to the Makefile, and adds a patch that
fixes the Makefile to not build .so libraries when static=1.

Fixes:

  http://autobuild.buildroot.org/results/3db/3dbfa7b692d4b123b3ba6b55c84df12818273554/

[Peter: drop V=1 as pointed out by Yann]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dvb-apps-0003-support-static-only-build.patch  |   20 ++++++++++++++++++++
 package/dvb-apps/dvb-apps.mk                       |   11 ++++++++---
 2 files changed, 28 insertions(+), 3 deletions(-)

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
index 98ff7eb..f2ad96c 100644
--- a/package/dvb-apps/dvb-apps.mk
+++ b/package/dvb-apps/dvb-apps.mk
@@ -15,19 +15,24 @@ DVB_APPS_DEPENDENCIES = libiconv
 DVB_APPS_LDLIBS += -liconv
 endif
 
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
