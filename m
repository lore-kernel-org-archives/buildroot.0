From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:03:18 +0100
Subject: [Buildroot] [git commit] python3: generate reproducible .pyc
Message-ID: <20170320222804.2B14781DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3adbdb63e29ed9a666e3c24a5533f6da3fe932a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

.pyc files contain the modification time of the corresponding .py
source. In order to make the build reproducible, we fix the modification
time of all .py before compiling .pyc files.

In addition, since pycompile relies on the modification time to know if
a file needs to be recompiled, it is safer to force recompilation of all
source files.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
[Thomas: do not register PYTHON_FIX_TIME as a
 PYTHON_TARGET_FINALIZE_HOOKS, instead call it inside
 PYTHON_CREATE_PYC_FILES before doing the byte compilation.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python3/python3.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index c8f8e1b..7bd6405 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -237,10 +237,18 @@ PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdat
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
+ifeq ($(BR2_REPRODUCIBLE),y)
+define PYTHON3_FIX_TIME
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) -name '*.py' -print0 | \
+		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
+endef
+endif
+
 define PYTHON3_CREATE_PYC_FILES
+	$(PYTHON3_FIX_TIME)
 	PYTHONPATH="$(PYTHON3_PATH)" \
 	$(HOST_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR) \
-		support/scripts/pycompile.py \
+		support/scripts/pycompile.py $(if $(BR2_REPRODUCIBLE),--force) \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
