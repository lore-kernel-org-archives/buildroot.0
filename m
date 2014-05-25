From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:12:57 -0300
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
	static
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable shared build for host-gcc-final when building for static targets.
We really want static or shared, there's no such thing as "preferring static"
since we can't choose with any degree of granularity for which packages.
And it confuses linking scripts having both available at the same time. Fixes:
http://autobuild.buildroot.net/results/c54/c54bdf88eff6d60c7001cb0e2cb6792cc75178db/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc-final/gcc-final.mk | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 622dcf2..366dc42 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -26,7 +26,7 @@ HOST_GCC_FINAL_SUBDIR = build
 
 HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
-define  HOST_GCC_FINAL_CONFIGURE_CMDS
+define HOST_GCC_FINAL_CONFIGURE_CMDS
         (cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
                 $(HOST_CONFIGURE_OPTS) \
                 CFLAGS="$(HOST_CFLAGS)" \
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
@@ -141,6 +148,15 @@ endif
 endif
 
 ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+define HOST_GCC_FINAL_INSTALL_USR_LIBS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
+		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
+			$(STAGING_DIR)/usr/lib/ ; \
+	done
+endef
+else
 define HOST_GCC_FINAL_INSTALL_USR_LIBS
 	mkdir -p $(TARGET_DIR)/usr/lib
 	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
@@ -152,6 +168,7 @@ define HOST_GCC_FINAL_INSTALL_USR_LIBS
 			$(TARGET_DIR)/usr/lib/ ; \
 	done
 endef
+endif
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
-- 
1.8.5.5
