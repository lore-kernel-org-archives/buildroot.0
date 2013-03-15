From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 15 Mar 2013 16:22:38 +0000
Subject: [Buildroot] [PATCH] libcap: Add optional support for libattr
	capabilities
Message-ID: <1363364558-5321-1-git-send-email-markos.chandras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Markos Chandras <markos.chandras@imgtec.com>

libcap can optionally link to libattr to support extra
file capabilities. Link to this library and pull it as
dependency if BR2_PACKAGE_ATTR is selected.

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/libcap/libcap.mk |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index dcd3a18..c319335 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -15,18 +15,25 @@ LIBCAP_LICENSE_FILES = License
 LIBCAP_DEPENDENCIES = host-libcap
 LIBCAP_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_ATTR),y)
+	LIBCAP_DEPENDENCIES += host-attr attr
+	HAVE_LIBATTR = yes
+else
+	HAVE_LIBATTR = no
+endif
+
 define LIBCAP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
+		LIBATTR=$(HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
 endef
 
 define LIBCAP_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(HAVE_LIBATTR) DESTDIR=$(STAGING_DIR) \
 		prefix=/usr lib=lib install
 endef
 
 define LIBCAP_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(HAVE_LIBATTR) DESTDIR=$(TARGET_DIR) \
 		prefix=/usr lib=lib install
 endef
 
@@ -38,11 +45,11 @@ endef
 LIBCAP_POST_PATCH_HOOKS += LIBCAP_DISABLE_PROGS
 
 define HOST_LIBCAP_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=no
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) LIBATTR=$(HAVE_LIBATTR)
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(HOST_DIR) \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(HAVE_LIBATTR) DESTDIR=$(HOST_DIR) \
 		prefix=/usr lib=lib install
 endef
 
-- 
1.7.1
