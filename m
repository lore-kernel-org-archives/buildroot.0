From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 20:25:10 +0200
Subject: [Buildroot] [git commit] gcc-final: disable shared build for static
Message-ID: <20140730213551.E5F349D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=169141a3eb0dc009a49895ebdc255bfc869ed5af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable shared build for host-gcc-final when building for static targets.
We really want static or shared, there's no such thing as "preferring static"
since we can't choose with any degree of granularity for which packages.
And it confuses linking scripts having both available at the same time. Fixes:
http://autobuild.buildroot.net/results/c54/c54bdf88eff6d60c7001cb0e2cb6792cc75178db/

[Thomas: slightly amend the commit to factorize the installation of
static libraries.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |   29 ++++++++++++++++++++++++-----
 1 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 622dcf2..44b9561 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -35,7 +35,7 @@ define  HOST_GCC_FINAL_CONFIGURE_CMDS
                 ./configure \
                 --prefix="$(HOST_DIR)/usr" \
                 --sysconfdir="$(HOST_DIR)/etc" \
-                --enable-shared --enable-static \
+                --enable-static \
                 $(QUIET) $(HOST_GCC_FINAL_CONF_OPT) \
         )
 endef
@@ -54,6 +54,13 @@ HOST_GCC_FINAL_CONF_OPT = \
 	$(DISABLE_LARGEFILE) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
+# Disable shared libs like libstdc++ if we do static since it confuses linking
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+HOST_GCC_FINAL_CONF_OPT += --disable-shared
+else
+HOST_GCC_FINAL_CONF_OPT += --enable-shared
+endif
+
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
 HOST_GCC_FINAL_CONF_OPT += --enable-libgomp
 else
@@ -141,17 +148,29 @@ endif
 endif
 
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
-define HOST_GCC_FINAL_INSTALL_USR_LIBS
-	mkdir -p $(TARGET_DIR)/usr/lib
+define HOST_GCC_FINAL_INSTALL_STATIC_LIBS
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
-		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
-			$(STAGING_DIR)/usr/lib/ ; \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
 			$(STAGING_DIR)/usr/lib/ ; \
+	done
+endef
+
+ifeq ($(BR2_PREFER_STATIC_LIB),)
+define HOST_GCC_FINAL_INSTALL_SHARED_LIBS
+	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
+			$(STAGING_DIR)/usr/lib/ ; \
 		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.so* \
 			$(TARGET_DIR)/usr/lib/ ; \
 	done
 endef
+endif
+
+define HOST_GCC_FINAL_INSTALL_USR_LIBS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	$(HOST_GCC_FINAL_INSTALL_STATIC_LIBS)
+	$(HOST_GCC_FINAL_INSTALL_SHARED_LIBS)
+endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
