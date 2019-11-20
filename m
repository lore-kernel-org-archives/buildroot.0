From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:39:41 +0000
Subject: [Buildroot] [RFC PATCH v3 27/30] package/pciutils: Enable host
 package.
In-Reply-To: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
Message-ID: <20191120173944.130142-28-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michael Drake <michael.drake@codethink.co.uk>

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
---
 package/pciutils/pciutils.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 30d429e75a..b4bdbceefb 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -19,6 +19,8 @@ PCIUTILS_MAKE_OPTS = \
 	AR=$(TARGET_AR) \
 	DNS=no
 
+HOST_PCIUTILS_MAKE_OPTS = HWDB=no ZLIB=no SHARED=no
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 PCIUTILS_DEPENDENCIES += udev
 PCIUTILS_MAKE_OPTS += HWDB=yes
@@ -71,4 +73,21 @@ define PCIUTILS_INSTALL_STAGING_CMDS
 		install install-lib install-pcilib
 endef
 
+define HOST_PCIUTILS_CONFIGURE_CMDS
+	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
+	$(SED) 's/^STRIP/#STRIP/' $(PCIUTILS_DIR)/Makefile
+endef
+
+define HOST_PCIUTILS_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_PCIUTILS_MAKE_OPTS) \
+		PREFIX=""
+endef
+
+define HOST_PCIUTILS_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) $(HOST_PCIUTILS_MAKE_OPTS) \
+		PREFIX=$(HOST_DIR) SBINDIR=$(HOST_DIR)/bin \
+		install install-lib install-pcilib
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.20.1
