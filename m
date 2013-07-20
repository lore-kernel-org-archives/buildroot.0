From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Jul 2013 09:52:13 -0300
Subject: [Buildroot] [PATCH 7/9] uclibc/bfin: don't install host utils if
	not FDPIC
In-Reply-To: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
References: <1374324735-2286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1374324735-2286-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index cbc2e56..644c531 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -511,6 +511,16 @@ define UCLIBC_INSTALL_TARGET_CMDS
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
+# For FLAT binfmts (static) there are no host utils
+ifeq ($(BR2_BINFMT_FLAT),)
+define UCLIBC_INSTALL_UTILS_STAGING
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
+	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
+	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+endef
+endif
+
 define UCLIBC_INSTALL_STAGING_CMDS
 	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
@@ -518,10 +528,7 @@ define UCLIBC_INSTALL_STAGING_CMDS
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime install_dev
-	install -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
-	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
-	install -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
-	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+	$(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
 uclibc-menuconfig: dirs uclibc-patch
-- 
1.8.1.5
