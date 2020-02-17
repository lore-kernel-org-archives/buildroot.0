From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:43 +0100
Subject: [Buildroot] [PATCH v6 21/28] package/python-sip: Fix qmake usage
 for per-package build
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-22-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since python-sip is not built by the qmake infra, we need to explicitly
integrate the qt.conf fixup needed for successful per-package build and
consistently use qmake via QT5_QMAKE variable.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-sip/python-sip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 1d6c205396..7ae2d43e1e 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -38,6 +38,7 @@ define HOST_PYTHON_SIP_INSTALL_CMDS
 endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
+	$(QT5_QT_CONF_FIXUP)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
@@ -46,7 +47,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/bin/qmake)
+		$(QT5_QMAKE))
 endef
 
 define PYTHON_SIP_BUILD_CMDS
-- 
2.25.0
