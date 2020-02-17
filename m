From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:27 +0100
Subject: [Buildroot] [PATCH v6 05/28] package/qwt: Partially convert to
 qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-6-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the qmake infra CONFIGURE and BUILD generic but keep the manipulation
of qwtconfig.pri as PRE_CONFIGURE_HOOK as well as the custom install steps.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qwt/qwt.mk | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index e0ffec765f..1fec17b19a 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -41,14 +41,11 @@ else
 QWT_CONFIG += -e 's/^.*QWT_CONFIG.*QwtDll.*$$/QWT_CONFIG += QwtDll/'
 endif
 
-define QWT_CONFIGURE_CMDS
+define QWT_PRE_CONFIGURE_CMD
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
-define QWT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
+QWT_PRE_CONFIGURE_HOOKS += QWT_PRE_CONFIGURE_CMD
 
 # After installation, we fixup the INSTALL_PREFIX in qwtconfig.pri so
 # that when building with qmake, -L$(STAGING_DIR)/usr/lib is used and
@@ -64,4 +61,4 @@ define QWT_INSTALL_TARGET_CMDS
 	rm -Rf $(TARGET_DIR)/usr/mkspecs
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
