From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Wed, 23 Nov 2016 13:58:53 +0100
Subject: [Buildroot] [PATCH v4 14/18] python3: generate reproducible .pyc
In-Reply-To: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
References: <1479905937-17241-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479905937-17241-15-git-send-email-jezz@sysmic.org>
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

 package/python3/python3.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b3f31c0..a526c0f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -219,10 +219,18 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define PYTHON3_FIX_TIME
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
+endef
+PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_FIX_TIME
+endif
+
 define PYTHON3_CREATE_PYC_FILES
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
-		support/scripts/pycompile.py \
+		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
-- 
1.9.1
