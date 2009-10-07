From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:37 +0200
Subject: [Buildroot] [PATCH 14/23] qt: make the output of sed hacks much
	more human readable
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-15-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make the console output from the QT_QMAKE_SET macro much more
human readable and additionally respect the QUIET flag.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 08995d4..ca6ae6b 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -379,8 +379,9 @@ QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)
 # $(call QT_QMAKE_SET,variable,value)
 ################################################################################
 define QT_QMAKE_SET
-	$(SED) '/QMAKE_$(1)/d' $(QT_QMAKE_CONF)
-	$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QT_QMAKE_CONF)
+	@$(if $(QUIET), , echo '$(QT_QMAKE_CONF): QMAKE_$(1) = $(2)')
+	@$(SED) '/QMAKE_$(1)/d' $(QT_QMAKE_CONF)
+	@$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QT_QMAKE_CONF)
 endef
 
 ################################################################################
-- 
1.6.3.3
