From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  3 Nov 2019 07:01:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysrepo: fix host/staging install
 steps
Message-ID: <20191103060113.4884-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

The sysrepoctl and sysrepocfg executables are used in install steps
of the package. Since there are hard-coded install pathes,
this leeds to wrong installation directories in host and staging
install steps.

Only sysrepoctl and sysrepocfg executables are needed from host build.
So build and install only the executables in this step.

The staging step only needs to install the library with the
corresponding files like the headers and the pkg-config.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/sysrepo/sysrepo.mk | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 8676158a19..2d9d47c4f2 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -34,6 +34,18 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
 endif
 
+define SYSREPO_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include/sysrepo
+	$(INSTALL) -m 0644 -D $(@D)/libsysrepo.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig
+	$(INSTALL) -m 0644 -D $(@D)/src/libsysrepo.so* \
+		$(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 0644 -D $(@D)/inc/sysrepo.h \
+		$(STAGING_DIR)/usr/include
+	$(INSTALL) -m 0644 -D $(@D)/inc/sysrepo/* \
+		$(STAGING_DIR)/usr/include/sysrepo/
+endef
+
 define SYSREPO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysrepo/S50sysrepod \
 		$(TARGET_DIR)/etc/init.d/S50sysrepod
@@ -49,17 +61,21 @@ define SYSREPO_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 endef
 
+# Configure $(TARGET_DIR) pathes here because it is hardcoded in host
+# executables that used later for target install step
 HOST_SYSREPO_CONF_OPTS = \
-	-DGEN_PYTHON2_TESTS=OFF \
-	-DENABLE_TESTS=OFF \
-	-DGEN_CPP_BINDINGS=OFF \
-	-DGEN_LANGUAGE_BINDINGS=OFF \
-	-DGEN_PYTHON_BINDINGS=OFF \
-	-DCALL_TARGET_BINS_DIRECTLY=OFF \
-	-DBUILD_EXAMPLES=OFF \
-	-DBUILD_CPP_EXAMPLES=OFF \
-	-DREPOSITORY_LOC=$(HOST_DIR)/etc/sysrepo \
-	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
+	-DREPOSITORY_LOC=$(TARGET_DIR)/etc/sysrepo \
+	-DSUBSCRIPTIONS_SOCKET_DIR=$(TARGET_DIR)/var/run/sysrepo-subscriptions
+
+define HOST_SYSREPO_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) sysrepocfg
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) sysrepoctl
+endef
+
+define HOST_SYSREPO_INSTALL_CMDS
+	$(INSTALL) -D -m 755 $(@D)/src/sysrepocfg $(HOST_DIR)/usr/bin/
+	$(INSTALL) -D -m 755 $(@D)/src/sysrepoctl $(HOST_DIR)/usr/bin/
+endef
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.20.1
