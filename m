From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:41 +0200
Subject: [Buildroot] [git commit] uclibc/bfin: don't install host utils if
	not FDPIC
Message-ID: <20130727141206.7AAA19ACB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cd6c7bc29a072d65d384e47dfa9df4a8362e8143
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.mk |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

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
