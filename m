From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu,  5 Dec 2019 17:15:05 +0000
Subject: [Buildroot] [PATCH v1 18/30] package/libvpx: Add host package.
In-Reply-To: <20191205171517.96639-1-michael.drake@codethink.co.uk>
References: <20191205171517.96639-1-michael.drake@codethink.co.uk>
Message-ID: <20191205171517.96639-19-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/libvpx/libvpx.mk | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index aaef708416..c8debf27d5 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -15,11 +15,16 @@ LIBVPX_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	CROSS=$(GNU_TARGET_NAME)
 
+HOST_LIBVPX_CONF_ENV = \
+	LD="$(HOST_CC)"
+
 LIBVPX_CONF_OPTS = \
 	--disable-examples \
 	--disable-docs \
 	--disable-unit-tests
 
+HOST_LIBVPX_CONF_OPTS = $(LIBVPX_CONF_OPTS)
+
 # This is not a true autotools package.  It is based on the ffmpeg build system
 define LIBVPX_CONFIGURE_CMDS
 	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
@@ -35,10 +40,29 @@ define LIBVPX_CONFIGURE_CMDS
 	)
 endef
 
+define HOST_LIBVPX_CONFIGURE_CMDS
+	(cd $(HOST_LIBVPX_SRCDIR) && rm -rf config.cache && \
+	$(HOST_CONFIGURE_OPTS) \
+	$(HOST_CONFIGURE_ARGS) \
+	$(HOST_LIBVPX_CONF_ENV) \
+	./configure \
+		--target=generic-gnu \
+		--enable-pic \
+		--prefix="$(HOST_DIR)" \
+		--enable-shared --disable-static \
+		--disable-debug \
+		$(HOST_LIBVPX_CONF_OPTS) \
+	)
+endef
+
 define LIBVPX_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) -C $(@D) all
 endef
 
+define HOST_LIBVPX_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_LIBVPX_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
 define LIBVPX_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(STAGING_DIR)" -C $(@D) install
 endef
@@ -47,4 +71,9 @@ define LIBVPX_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(LIBVPX_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
 endef
 
+define HOST_LIBVPX_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_LIBVPX_MAKE_ENV) $(MAKE) -C $(@D) install
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
