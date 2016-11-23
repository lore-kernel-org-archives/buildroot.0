From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 12:08:15 +0100
Subject: [Buildroot] [PATCH v3 15/18] python2: remove full path from .pyc
In-Reply-To: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
References: <1479899298-14655-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479899298-14655-16-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.pyc files include path to source .py file. This patch changes the way
`pycompile.py' is launched in order to only keep the part relative to
$TARGET_DIR.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python/python.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index c17b267..ffe4e14 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -236,9 +236,10 @@ endif
 
 define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
-	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
-		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+		$(TOPDIR)/support/scripts/pycompile.py \
+		$(if $(BR2_REPRODUCIBLE),--force) \
+		usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
-- 
1.9.1
