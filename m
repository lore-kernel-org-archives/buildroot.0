From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:52 +0100
Subject: [Buildroot] [PATCH v4 13/18] python2: generate reproducible .pyc
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-14-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

.pyc files contain modification time of .py source. In order to make
build reproducible, we fix modification time of all .py before to
compile .pyc files.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---

Notes:
    v3:
      - Force compilation instead of removing .pyc

 package/python/python.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cc65376..c17b267 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -226,10 +226,18 @@ PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define PYTHON_FIX_TIME
+find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
+endef
+PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_FIX_TIME
+endif
+
 define PYTHON_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR) \
-		support/scripts/pycompile.py \
+		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
 endef
 
-- 
1.9.1
