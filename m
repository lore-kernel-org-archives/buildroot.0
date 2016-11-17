From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Thu, 17 Nov 2016 11:00:38 +0100
Subject: [Buildroot] [PATCH 14/15] python2: remove full path from .pyc
In-Reply-To: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
References: <1479376839-27795-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479376839-27795-15-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.pyc files include path to source .py file. This patch change the way
`pycompile.py' is launched in order to only keep part relative to $TARGET_DIR.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/python/python.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index b0ff1fd..35f971e 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -248,9 +248,9 @@ endif
 
 define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
-	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
-		support/scripts/pycompile.py \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
+	cd $(TARGET_DIR) && $(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
+		$(TOPDIR)/support/scripts/pycompile.py \
+		usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
 ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
-- 
1.9.1
